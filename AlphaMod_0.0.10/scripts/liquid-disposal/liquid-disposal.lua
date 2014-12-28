LiquidDisposal = {}

EventHandler.Register(LiquidDisposal)

function LiquidDisposal.OnEntityBuild(event)
    if (event ~= nil) and (event.createdentity ~= nil) and (fncIN(event.createdentity.name, "pipe-to-water", "open-pipe")) then
        if (event.createdentity.name == "pipe-to-water") then
            event.createdentity.active = false
        end

        InsertIntoGlobalTable("liquidDisposals",event.createdentity)
        
	    for playerIndex,player in pairs(game.players) do
		    if (player ~= nil) and (player.cursorstack ~= nil) then
                if (fncIN(event.createdentity.name, "pipe-to-water", "open-pipe")) then
                    game.player.rotateforbuild()
                    game.player.rotateforbuild()
                end
		    end
	    end
	end
end


function LiquidDisposal.RemoveEntity(event)
    if (event == nil) or (event.entity == nil) or (fncIN(event.entity.name, "pipe-to-water", "open-pipe") == false) or (glob.AlphaMod == nil) or (glob.AlphaMod.liquidDisposals == nil) then
        return
    end
    
	for index,entity in pairs(glob.AlphaMod.liquidDisposals) do
        if (entity ~= nil) and (event.entity.equals(entity)) then
            table.remove(glob.AlphaMod.liquidDisposals, index)
            break
		end
	end
end

function LiquidDisposal.OnEntityMined(event)
    LiquidDisposal.RemoveEntity(event)
end

function LiquidDisposal.OnEntityDied(event)
    LiquidDisposal.RemoveEntity(event)
end

function LiquidDisposal.OnTickUnFiltered()
    if (glob.AlphaMod == nil) or (glob.AlphaMod.liquidDisposals == nil) then
        return
    end

    for index, entity in pairs(glob.AlphaMod.liquidDisposals) do
        if (entity ~= nil) and (entity.fluidbox[1] ~= nil) and (entity.fluidbox[1].amount > 0) then       
            local fluidbox = entity.fluidbox[1]
            local pollution = fluidbox.amount * 2 
            fluidbox.amount = 0
            entity.fluidbox[1] = fluidbox

            if (entity.name == "pipe-to-water") then
                pollution = pollution / 2
            end

            if (fluidbox.type ~= "water") then
                game.pollute(entity.position, pollution)
            end
        end
    end
end
