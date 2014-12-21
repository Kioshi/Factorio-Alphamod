ElectricBoiler = {}

EventHandler.Register(ElectricBoiler)

function ElectricBoiler.InsertIntoGlobalTable(entity)

    if (glob.AlphaMod == nil) then
        glob.AlphaMod = {}
    end;
    
    if (glob.AlphaMod.electricBoilers == nil) then
        glob.AlphaMod.electricBoilers = { }
    end;


    table.insert(glob.AlphaMod.electricBoilers, entity)
end

function ElectricBoiler.OnEntityBuild(event)
    if (event ~= nil) and (event.createdentity ~= nil) and (event.createdentity.name == "electric-boiler") then
        ElectricBoiler.InsertIntoGlobalTable(event.createdentity)
	end
end


function ElectricBoiler.RemoveEntity(event)
    if (event == nil) or (event.entity == nil) or (event.entity.name ~= "electric-boiler") or (glob.AlphaMod == nil) or (glob.AlphaMod.electricBoilers == nil) then
        return
    end
    
	for index,entity in pairs(glob.AlphaMod.electricBoilers) do
        if (entity ~= nil) and (event.entity.equals(entity)) then
            table.remove(glob.AlphaMod.electricBoilers, index)
            break
		end
	end
end

function ElectricBoiler.OnEntityMined(event)
    ElectricBoiler.RemoveEntity(event)
end

function ElectricBoiler.OnEntityDied(event)
    ElectricBoiler.RemoveEntity(event)
end

function ElectricBoiler.OnTickUnFiltered()
    if (glob.AlphaMod == nil) or (glob.AlphaMod.electricBoilers == nil) then
        return
    end

    for index, entity in pairs(glob.AlphaMod.electricBoilers) do
        if (entity ~= nil) and (entity.fluidbox[1] ~= nil) and (entity.fluidbox[1].amount > 0) and (entity.recipe ~= nil) and (game.itemprototypes[entity.fluidbox[1].type] ~= nil) then       
            local outPut = entity.getoutputinventory()
            local inPut = entity.getinventory(2)
            local fluidBox = entity.fluidbox[1]
            local metaItem = game.itemprototypes[fluidBox.type]
            
            if (fluidBox.temperature < metaItem.fuelvalue) then
                if (inPut.getitemcount("heat-source") < 1) then
                    inPut.insert({name="heat-source", count = 1})
                end
            
                if (outPut.getitemcount("heat-unit") > 0) then
                    outPut.remove({name="heat-unit", count = outPut.getitemcount("heat-unit")})
                    fluidBox.temperature = math.min(metaItem.fuelvalue, fluidBox.temperature + 9)
                    entity.fluidbox[1] = fluidBox
                end
            end
        end
    end
end