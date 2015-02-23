SmartPump = {}

EventHandler.Register(SmartPump)

function SmartPump.RemoveFromGlobalTable(index)
    if (glob.AlphaMod ~= nil) and (glob.AlphaMod.smartPumps ~= nil) then
        table.remove(glob.AlphaMod.smartPumps, index)
    end
end

function SmartPump.CreatePump(inserter)
	local pump = game.createentity{name = "smart-pump", position = inserter.position, direction = inserter.direction, force=game.forces.player}

    pump.minable = false
	pump.destructible = false
    pump.operable = false
	    
    local array = { }
    array["inserter"] = inserter
    array["pump"] = pump
    InsertIntoGlobalTable("smartPumps",array)

end

function SmartPump.DestroyPump(pump, index)
    SmartPump.RemoveFromGlobalTable(index)
	pump.destroy()
end

function SmartPump.RemoveEntity(event)
    if (event == nil) or (event.entity == nil) or (event.entity.name ~= "smart-pump-inserter") or (glob.AlphaMod == nil) or (glob.AlphaMod.smartPumps == nil) then
        return
    end
    
	for index,array in pairs(glob.AlphaMod.smartPumps) do
        if (array ~= nil) and (array["pump"] ~= nil) and (array["inserter"] ~= nil) and (event.entity.equals(array["inserter"])) then
            SmartPump.DestroyPump(array["pump"],index)
		end
	end
end

-- Entity Build
function SmartPump.OnEntityBuild(event)
    if (event ~= nil) and (event.createdentity ~= nil) and (event.createdentity.name == "smart-pump-inserter") then
        SmartPump.CreatePump(event.createdentity)
	end
end

-- Entity Mined
function SmartPump.OnEntityMined(event)
    SmartPump.RemoveEntity(event)
end

-- Entity Died
function SmartPump.OnEntityDied(event)
    SmartPump.RemoveEntity(event)
end

function SmartPump.OnTick()
    if (glob.AlphaMod == nil) or (glob.AlphaMod.smartPumps == nil) then
        return
    end
    
	for index,array in pairs(glob.AlphaMod.smartPumps) do
        if (array ~= nil) and (array["pump"] ~= nil) and (array["inserter"] ~= nil) then
            local inserter = array["inserter"]
            local pump = array["pump"]
            local filter = inserter.getfilter(1)
            local redCond = inserter.getcircuitcondition(defines.circuitconnector.red)
            local greCond = inserter.getcircuitcondition(defines.circuitconnector.green)
            local logCond = inserter.getcircuitcondition(defines.circuitconnector.logistic)
            pump.active = ((redCond == nil or redCond.fulfilled) and (greCond == nil or greCond.fulfilled) and (logCond == nil or logCond.fulfilled)) and -- check if conditions exists are fulfilled
                          (redCond ~= nil or greCond ~= nil or greCond ~= nil or filter ~= nil) and -- check if any condition is added (pump shouldnt pump if there is no filter/conditons_
                          SmartPump.FilterConditonFulfilled(filter, pump) -- check if filter match input source liquid

        end
    end
end

function SmartPump.FilterConditonFulfilled(filter, pump)
    if (filter == nil) then
        return true
    end

    local condition = false

    if (pump.neighbours ~= nil) and (pump.neighbours[2] ~= nil) and (pump.neighbours[2].fluidbox[1] ~= nil) then
        condition = (("AM-fluidItem-"..pump.neighbours[2].fluidbox[1].type) == filter)
    end

    return condition
end
    

function SmartPump.OnEntityRotated(event)
    if (event == nil) or (event.entity == nil) or (event.entity.name ~= "smart-pump-inserter") or (glob.AlphaMod == nil) or (glob.AlphaMod.smartPumps == nil) then
        return;
    end

	for index,array in pairs(glob.AlphaMod.smartPumps) do
        if (array ~= nil) and (array["pump"] ~= nil) and (array["inserter"] ~= nil) and (event.entity.equals(array["inserter"])) then
            array["pump"].direction = array["inserter"].direction
        end
    end
end
