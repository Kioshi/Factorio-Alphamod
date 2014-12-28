ElectricBoiler = {}

EventHandler.Register(ElectricBoiler)


function ElectricBoiler.OnEntityBuild(event)
    if (event ~= nil) and (event.createdentity ~= nil) and (event.createdentity.name == "electric-boiler-pump") then
        InsertIntoGlobalTable("electricBoilers",event.createdentity)
	end
end


function ElectricBoiler.RemoveEntity(event)
    if (event == nil) or (event.entity == nil) or (event.entity.name ~= "electric-boiler-pump") or (glob.AlphaMod == nil) or (glob.AlphaMod.electricBoilers == nil) then
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
        if (entity ~= nil) and (entity.fluidbox[1] ~= nil) and (entity.fluidbox[1].amount > 0) and (entity.energy > 0) and (glob.AlphaMod.fluidItems["AM-fluidItem-" .. entity.fluidbox[1].type]) then       
            local pctEnergy = entity.energy/12444
            local fluidBox = entity.fluidbox[1]
            local maxTemperature = glob.AlphaMod.fluidItems["AM-fluidItem-" .. entity.fluidbox[1].type]
            
            if (fluidBox.temperature < maxTemperature) then
                local addTemp = 0.7 * pctEnergy
                fluidBox.temperature = math.min(maxTemperature, fluidBox.temperature + addTemp)
                entity.fluidbox[1] = fluidBox
                entity.energy = 0
            end
        end
    end
end
