Migration_0_0_9_to_0_0_10 = {}

EventHandler.Register(Migration_0_0_9_to_0_0_10)

function Migration_0_0_9_to_0_0_10.MigrateGlobalTableEntities()
    if (glob.AlphaMod == nil) or (glob.AlphaMod.electricBoilers == nil) then
        return
    end

    local count = 0
	for index,entity in pairs(glob.AlphaMod.electricBoilers) do
        if (entity.name == "electric-boiler") then
            local pos = entity.position
            local dir = entity.direction
            local oldForce = entity.force
            entity.destroy()
            glob.AlphaMod.electricBoilers[index] = game.createentity{ name = "electric-boiler-pump", position = pos, direction = dir, force=oldForce }
            count = count + 1
        end
    end
    if (count ~= 0) then
        game.player.print("Migrating stuff from 0.0.9 to 0.0.10...") 
        game.player.print(" > Migrated " .. tostring(count) .. " Electric Boilers") 
    end
end

function Migration_0_0_9_to_0_0_10.OnLoad()
    Migration_0_0_9_to_0_0_10.MigrateGlobalTableEntities()
end
