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

        EventHandler.SelectionHandler()
        
    end,

    GuiClick = function (event)    
        for index, class in pairs(EventHandler.classField) do
            if (class.OnGuiClick ~= nil) then
                class.OnGuiClick(event)
            end
        end
    end,

    RemoveEntityFromPlayersSelection = function(entity)
        for index, player in pairs(game.players) do
            if (glob.AlphaMod.playersSelection[index]) and (entity.equals(glob.AlphaMod.playersSelection[index].entity)) then
                glob.AlphaMod.playersSelection[index].entity = nil
            end
        end
    end,

    SelectionHandler = function()        
        if (glob.AlphaMod == nil) or (glob.AlphaMod.playersSelection == nil) then
            CreateGlobalTable("playersSelection")
        end

        for index, player in pairs(game.players) do
            if (glob.AlphaMod.playersSelection[index] == nil) then
                glob.AlphaMod.playersSelection[index] = { entity = nil, tick = game.tick, announced = false }
            end
            if (glob.AlphaMod.playersSelection[index].entity ~= nil) and (glob.AlphaMod.playersSelection[index].entity.valid ~= true) then
                glob.AlphaMod.playersSelection[index].entity = nil
            end
            if ((glob.AlphaMod.playersSelection[index].entity == nil) and (player.selected ~= nil)) or --player didnt have selected anything and selected something
               ((glob.AlphaMod.playersSelection[index].entity ~= nil) and (player.selected == nil)) or --player had selected something and deselected it
               ((glob.AlphaMod.playersSelection[index].entity ~= nil) and (player.selected ~= nil) and (player.selected.equals(glob.AlphaMod.playersSelection[index].entity)) == false) then -- player selected something else
                --Update global table
                glob.AlphaMod.playersSelection[index] = { entity = player.selected, tick = game.tick, announced = false }
            end

            if (glob.AlphaMod.playersSelection[index]) and (glob.AlphaMod.playersSelection[index].entity) and 
               (glob.AlphaMod.playersSelection[index].announced == false) and 
               ((game.tick - glob.AlphaMod.playersSelection[index].tick) > 90) then
                -- Call selected
                for i, class in pairs(EventHandler.classField) do
                    if (class.OnSelect ~= nil) then
                        class.OnSelect(player,glob.AlphaMod.playersSelection[index].entity, index)
                    end
                end
                glob.AlphaMod.playersSelection[index].announced = true
            end
        end
    end
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

--Someone clicked GUI
game.onevent(defines.events.onguiclick, EventHandler.GuiClick)

