require "defines"   

function InsertIntoGlobalTable(pipeInserter, pipe)

    if (glob.AlphaMod == nil) then
        glob.AlphaMod = {}
    end;
    
    if (glob.AlphaMod.ioPipes == nil) then
        glob.AlphaMod.ioPipes = { }
    end;

    local array = { }
    array["pipe"] = pipe
    array["inserter"] = pipeInserter

    table.insert(glob.AlphaMod.ioPipes, array)
end

function RemoveFromGlobalTable(index)
    if (glob.AlphaMod ~= nil) and (glob.AlphaMod.ioPipes ~= nil) then
        table.remove(glob.AlphaMod.ioPipes, index)
    end
end

function CreateActualPipe(pipeInserter)
	local pos = pipeInserter.position
	local pipe = game.createentity{name = "pipe-io", position = pos, direction = pipeInserter.direction}

    pipe.minable = false
	pipe.destructible = false
	pipeInserter.active = false
	    
    InsertIntoGlobalTable(pipeInserter,pipe)

end

function DestroyActuralPipe(pipe, index)
    RemoveFromGlobalTable(index)
	pipe.destroy()
end


-- Entity Build
function OnEntityBuild(event)
    if (event ~= nil) and (event.createdentity ~= nil) and (event.createdentity.name == "pipe-io-inserter") then
        CreateActualPipe(event.createdentity)
	end
end

-- Entity Mined
function OnEntityMined(event)
    if (event == nil) or (event.entity == nil) or (event.entity.name ~= "pipe-io-inserter") or (glob.AlphaMod == nil) or (glob.AlphaMod.ioPipes == nil) then
        return;
    end
    
	for index,array in pairs(glob.AlphaMod.ioPipes) do
        if (array ~= nil) and (array["pipe"] ~= nil) and (array["inserter"] ~= nil) and (event.entity.equals(array["inserter"])) then
            DestroyActuralPipe(array["pipe"],index)
		end
	end
end

-- Entity Died
function OnEntityDied(event)
    if (event == nil) or (event.entity == nil) or (event.entity.name ~= "pipe-io-inserter") or (glob.AlphaMod == nil) or (glob.AlphaMod.ioPipes == nil) then
        return;
    end
    
	for index,array in pairs(glob.AlphaMod.ioPipes) do
        if (array ~= nil) and (array["pipe"] ~= nil) and (array["inserter"] ~= nil) and (event.entity.equals(array["inserter"])) then
            DestroyActuralPipe(array["pipe"],index)
		end
	end
end

-- Entity Rotated
function OnEntityRotated(event)
    if (event == nil) or (event.entity == nil) or (event.entity.name ~= "pipe-io-inserter") or (glob.AlphaMod == nil) or (glob.AlphaMod.ioPipes == nil) then
        return;
    end
	for index,array in pairs(glob.AlphaMod.ioPipes) do
        if (array ~= nil) and (array["pipe"] ~= nil) and (array["inserter"] ~= nil) and (event.entity.equals(array["inserter"])) then
            local pipeInserter = array["inserter"]
            local pipe = array["pipe"] 
            DestroyActuralPipe(pipe, index)
            CreateActualPipe(pipeInserter)
        end
    end
end

-- Entity Build
game.onevent(defines.events.onbuiltentity, OnEntityBuild)       --By player
game.onevent(defines.events.onrobotbuiltentity, OnEntityBuild)  -- By robots

-- Entity Mined
game.onevent(defines.events.onpreplayermineditem, OnEntityMined) -- By player
game.onevent(defines.events.onrobotpremined, OnEntityMined)      -- By robots

-- Entity Died
game.onevent(defines.events.onentitydied, OnEntityDied)

--Entity Rotated
game.onevent(defines.events.onplayerrotatedentity, OnEntityRotated)
