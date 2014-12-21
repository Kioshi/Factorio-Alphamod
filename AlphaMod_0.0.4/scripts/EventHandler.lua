require "defines"

EventHandler = {

    classField = {},

    Register = function (class)
        table.insert(EventHandler.classField, class)
    end,

    EntityBuild = function (event)
        for index, class in pairs(EventHandler.classField) do
            if (class.OnEntityBuild ~= nil) then
                class.OnEntityBuild(event)
            end
        end
    end,

    EntityMined = function (event)
        for index, class in pairs(EventHandler.classField) do
            if (class.OnEntityMined ~= nil) then
                class.OnEntityMined(event)
            end
        end
    end,
    
    EntityDied = function (event)
        for index, class in pairs(EventHandler.classField) do
            if (class.OnEntityDied ~= nil) then
                class.OnEntityDied(event)
            end
        end
    end,
    
    EntityRotated = function (event)
        for index, class in pairs(EventHandler.classField) do
            if (class.OnEntityRotated ~= nil) then
                class.OnEntityRotated(event)
            end
        end
    end,
    
    PutOnPos = function (event)
        for index, class in pairs(EventHandler.classField) do
            if (class.OnPutOnPos ~= nil) then
                class.OnPutOnPos(event)
            end
        end
    end,

    Tick = function ()
        
        for index, class in pairs(EventHandler.classField) do
            if (class.OnTickUnFiltered ~= nil) then
                class.OnTickUnFiltered()
            end
        end

        if (game.tick % 6 ~= 0) then -- lets call it only 10times per sec
            return
        end

        for index, class in pairs(EventHandler.classField) do
            if (class.OnTick ~= nil) then
                class.OnTick()
            end
        end
    end,
}

EventHandler.__index = EventHandler

-- Entity Build
game.onevent(defines.events.onbuiltentity, EventHandler.EntityBuild)       --By player
game.onevent(defines.events.onrobotbuiltentity, EventHandler.EntityBuild)  -- By robots

-- Entity Mined
game.onevent(defines.events.onpreplayermineditem, EventHandler.EntityMined) -- By player
game.onevent(defines.events.onrobotpremined, EventHandler.EntityMined)      -- By robots

-- Entity Died
game.onevent(defines.events.onentitydied, EventHandler.EntityDied)

--Tick
game.onevent(defines.events.ontick, EventHandler.Tick)

--Entity Rotated
game.onevent(defines.events.onplayerrotatedentity, EventHandler.EntityRotated)

--Player put something
game.onevent(defines.events.onputitem, EventHandler.PutOnPos)
