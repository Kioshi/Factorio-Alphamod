StorageTankReplace = {}

EventHandler.Register(StorageTankReplace) 

-- On put item - manual replace old storage-tank with new
function StorageTankReplace.OnPutOnPos(event)
	for playerIndex,player in pairs(game.players) do
		if (player ~= nil) and (player.selected ~= nil) and (player.cursorstack ~= nil) then
			if (fncIN(player.cursorstack.name,"storage-tank","output-storage-tank","smart-storage-tank")) and (player.selected.type == "storage-tank") then
                local liquid = player.selected.fluidbox[1]
                local newEntity = game.createentity{name = player.cursorstack.name, position = player.selected.position, direction = player.selected.direction, force=player.force}
                if (newEntity.name == "smart-storage-tank") then
                    SmartStorageTank.CreateChest(newEntity)
                end
                if (liquid ~= nil) then                
                    newEntity.fluidbox[1] = { type = liquid.type, amount = liquid.amount, temperature = liquid.temperature }
                end
                player.insert({ name = player.selected.name, count = 1 })
                StorageTankReplace.DestroyTank(player.selected)
                player.removeitem({ name = player.cursorstack.name, count = 1 })
            end
        end
    end
end


function StorageTankReplace.DestroyTank(tank)
    if (tank.name ~= "smart-storage-tank") or (glob.AlphaMod == nil) or (glob.AlphaMod.smartTanks == nil) then
        tank.destroy()
        return
    end
    
	for index,array in pairs(glob.AlphaMod.smartTanks) do
        if (array ~= nil) and (array["tank"] ~= nil) and (array["chest"] ~= nil) and (tank.equals(array["tank"])) then
	        array["chest"].destroy()
	        tank.destroy()
            table.remove(glob.AlphaMod.smartTanks, index)
            break;
		end
	end
end
