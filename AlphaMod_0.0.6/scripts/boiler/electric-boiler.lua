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

function ElectricBoiler.OnTick()
    if (game.tick % 60 ~= 0) then
        return
    end

    for index, player in pairs(game.players) do
        local inv1 = player.getinventory(defines.inventory.playerquickbar)
        local inv2 = player.getinventory(defines.inventory.playermain)
        
        if (inv1 ~= nil) then
            if (inv1.getitemcount("heat-source") > 0) then inv1.remove({ name = "heat-source", count = inv1.getitemcount("heat-source")}) end
            if (inv1.getitemcount("heat-unit") > 0) then inv1.remove({ name = "heat-unit", count = inv1.getitemcount("heat-unit")}) end
        end
        if (inv2 ~= nil) then
            if (inv2.getitemcount("heat-source") > 0) then inv2.remove({ name = "heat-source", count = inv2.getitemcount("heat-source")}) end
            if (inv2.getitemcount("heat-unit") > 0) then inv2.remove({ name = "heat-unit", count = inv2.getitemcount("heat-unit")}) end
        end
    end
end
