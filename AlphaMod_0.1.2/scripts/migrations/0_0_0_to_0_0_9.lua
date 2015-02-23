Migration_0_0_0_to_0_0_9 = {}

EventHandler.Register(Migration_0_0_0_to_0_0_9)

function Migration_0_0_0_to_0_0_9.MigrateGlobalTableEntities()
    if (glob.AlphaMod == nil) or (glob.AlphaMod.liquidSplitter == nil) then
        return
    end
    local count = 0
	for index,array in pairs(glob.AlphaMod.liquidSplitter) do
        if (array ~= nil) and (array["splitter"] ~= nil) and (array["splitter"].name == "liquid-splitter") then
            local pos = array["splitter"].position
            local dir = array["splitter"].direction
            local oldForce =  array["splitter"].force
            array["splitter"].destroy()
            array["splitter"] = game.createentity{ name = "liquid-splitter-inserter", position = pos, direction = dir, force=oldForce }
            count = count + 1
        end
    end
    if (count ~= 0) then
        game.player.print("Migrating stuff from 0.0.0 to 0.0.9...") 
        game.player.print(" > Migrated " .. tostring(count) .. " Liquid Splitters") 
    end

    for index, player in pairs(game.players) do
        if (player.gui.center.AmLsGUI ~= nil) then
            player.gui.center.AmLsGUI.destroy()
        end
    end

end

function Migration_0_0_0_to_0_0_9.OnLoad()
    Migration_0_0_0_to_0_0_9.MigrateGlobalTableEntities()
end
