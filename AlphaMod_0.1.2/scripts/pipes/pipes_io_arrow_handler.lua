PipeArrorwHandler = {}

EventHandler.Register(PipeArrorwHandler) 


function PipeArrorwHandler.RemoveFromGlobalTable(index)
    if (glob.AlphaMod ~= nil) and (glob.AlphaMod.ioPipes ~= nil) then
        table.remove(glob.AlphaMod.ioPipes, index)
    end
end

function PipeArrorwHandler.CreateActualPipe(pipeInserter)
	local pos = pipeInserter.position
	local pipe = game.createentity{name = "pipe-io", position = pos, direction = pipeInserter.direction, force=game.forces.player}

    pipe.minable = false
	pipe.destructible = false
	pipeInserter.active = false
	    
    local array = { }
    array["pipe"] = pipe
    array["inserter"] = pipeInserter
    InsertIntoGlobalTable("ioPipes",array)

end

function PipeArrorwHandler.DestroyActuralPipe(pipe, index)
    PipeArrorwHandler.RemoveFromGlobalTable(index)
	pipe.destroy()
end


-- Entity Build
function PipeArrorwHandler.OnEntityBuild(event)
    if (event ~= nil) and (event.createdentity ~= nil) and (event.createdentity.name == "pipe-io-inserter") then
        PipeArrorwHandler.CreateActualPipe(event.createdentity)
	end
end

-- Entity Mined
function PipeArrorwHandler.OnEntityMined(event)
    if (event == nil) or (event.entity == nil) or (event.entity.name ~= "pipe-io-inserter") or (glob.AlphaMod == nil) or (glob.AlphaMod.ioPipes == nil) then
        return;
    end
    
	for index,array in pairs(glob.AlphaMod.ioPipes) do
        if (array ~= nil) and (array["pipe"] ~= nil) and (array["inserter"] ~= nil) and (event.entity.equals(array["inserter"])) then
            PipeArrorwHandler.DestroyActuralPipe(array["pipe"],index)
		end
	end
end

-- Entity Died
function PipeArrorwHandler.OnEntityDied(event)
    if (event == nil) or (event.entity == nil) or (event.entity.name ~= "pipe-io-inserter") or (glob.AlphaMod == nil) or (glob.AlphaMod.ioPipes == nil) then
        return;
    end
    
	for index,array in pairs(glob.AlphaMod.ioPipes) do
        if (array ~= nil) and (array["pipe"] ~= nil) and (array["inserter"] ~= nil) and (event.entity.equals(array["inserter"])) then
            PipeArrorwHandler.DestroyActuralPipe(array["pipe"],index)
		end
	end
end

-- Entity Rotated
function PipeArrorwHandler.OnEntityRotated(event)
    if (event == nil) or (event.entity == nil) or (event.entity.name ~= "pipe-io-inserter") or (glob.AlphaMod == nil) or (glob.AlphaMod.ioPipes == nil) then
        return;
    end
	for index,array in pairs(glob.AlphaMod.ioPipes) do
        if (array ~= nil) and (array["pipe"] ~= nil) and (array["inserter"] ~= nil) and (event.entity.equals(array["inserter"])) then
            array["pipe"].direction = array["inserter"].direction
        end
    end
end
