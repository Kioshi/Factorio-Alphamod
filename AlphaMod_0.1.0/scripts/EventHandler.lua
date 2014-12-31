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
        EventHandler.SelfOpenHandler()
        
    end,

    GuiClick = function (event)    
        for index, class in pairs(EventHandler.classField) do
            if (class.OnGuiClick ~= nil) then
                class.OnGuiClick(event)
            end
        end
    end,

    Init = function()    
        for index, class in pairs(EventHandler.classField) do
            if (class.OnInit ~= nil) then
                class.OnInit()
            end
        end
    end,

    Load = function()    
        for index, class in pairs(EventHandler.classField) do
            if (class.OnLoad ~= nil) then
                class.OnLoad()
            end
        end
    end,

    Save = function()    
        for index, class in pairs(EventHandler.classField) do
            if (class.OnSave ~= nil) then
                class.OnSave()
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
            if ((glob.AlphaMod.playersSelection[index] == nil) and (player.opened ~= nil)) or 
               ((glob.AlphaMod.playersSelection[index] ~= nil) and (player.opened == nil)) or
               ((glob.AlphaMod.playersSelection[index] ~= nil) and (player.opened ~= nil) and player.opened.equals(glob.AlphaMod.playersSelection[index]) == false)
            then  
                -- player had open something and that change  
                if (glob.AlphaMod.playersSelection[index] ~= nil) then
                    for i, class in pairs(EventHandler.classField) do
                        if (class.OnDeselect ~= nil) then
                            class.OnDeselect(player, glob.AlphaMod.playersSelection[index], index)
                        end
                    end        
                end
                -- player open something
                if (player.opened ~= nil) then
                    for i, class in pairs(EventHandler.classField) do
                        if (class.OnSelect ~= nil) then
                            class.OnSelect(player, player.opened, index)
                        end
                    end
                end
                glob.AlphaMod.playersSelection[index] = player.opened
            end
        end
    end,

    SelfOpenHandler = function()
        if (glob.AlphaMod == nil) or (glob.AlphaMod.playerSelfOpen == nil) then
            CreateGlobalTable("playerSelfOpen")
        end

        for index, player in pairs(game.players) do
            if (glob.AlphaMod.playerSelfOpen[index] == nil) then
                glob.AlphaMod.playerSelfOpen[index] = false
            end

            if (glob.AlphaMod.playerSelfOpen[index] ~= player.openedself) then  
                -- player closed his menu
                if (glob.AlphaMod.playerSelfOpen[index] == true) then
                    for i, class in pairs(EventHandler.classField) do
                        if (class.OnSelfClose ~= nil) then
                            class.OnSelfClose(player, index)
                        end
                    end        
                end
                -- player open something
                if (player.openedself == true) then
                    for i, class in pairs(EventHandler.classField) do
                        if (class.OnSelfOpen ~= nil) then
                            class.OnSelfOpen(player, index)
                        end
                    end
                end
                glob.AlphaMod.playerSelfOpen[index] = player.openedself
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

--Someone clicked GUI
game.onevent(defines.events.onguiclick, EventHandler.GuiClick)

-- Started New Game
game.oninit(EventHandler.Init)

-- Loaded Game
game.onload(EventHandler.Load)

-- Saved Game
game.onsave(EventHandler.Save)

