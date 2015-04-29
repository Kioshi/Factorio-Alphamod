require("util")

Drone = {}

EventHandler.Register(Drone)

Drone.droneActive  = "        Drone is active        "
Drone.droneInActive = "      Drone is inactive      "
Drone.MAX_TECHNOLOGIES = 6

Drone.ZoomTechnology = {}
Drone.ZoomTechnology[0] = 0.95
Drone.ZoomTechnology[1] = 0.9
Drone.ZoomTechnology[2] = 0.8
Drone.ZoomTechnology[3] = 0.7
Drone.ZoomTechnology[4] = 0.6
Drone.ZoomTechnology[5] = 0.5
Drone.ZoomTechnology[6] = 0.4

Drone.DistanceTechnology = {}
Drone.DistanceTechnology[0] = 150
Drone.DistanceTechnology[1] = 200
Drone.DistanceTechnology[2] = 250
Drone.DistanceTechnology[3] = 300
Drone.DistanceTechnology[4] = 350
Drone.DistanceTechnology[5] = 400
Drone.DistanceTechnology[6] = 450

function Drone.OnSelfClose(player, index)
    if (player.gui.top.AmDroneGUI == nil) or (player.gui.top.AmDroneGUI.AmDroneGUIButton == nil) or (player.gui.top.AmDroneGUI.AmDroneGUIButton.caption == Drone.droneActive)  then
        return
    end

    player.gui.top.AmDroneGUI.destroy()
end

function Drone.OnSelfOpen(player, index)
    if (player.gui.top.AmDroneGUI ~= nil) or (player.force.technologies["drone"] == nil) or (player.force.technologies["drone"].researched == false) then
        return
    end
    
    local frame = player.gui.top.add({ type="frame", direction="vertical", name="AmDroneGUI" })
    local button = frame.add({ type="button", name="AmDroneGUIButton", caption = Drone.droneInActive })
    local progressBar = frame.add({ type="progressbar", name="AmDroneGUIProgressbar", size = 20 })
end

function Drone.OnGuiClick(event)
    if (event.element == nil) or (event.element.name ~= "AmDroneGUIButton") then
        return
    end

    if (event.element.caption == Drone.droneActive) then
        Drone.SetInactive(event.element.playerindex)
        event.element.caption = Drone.droneInActive
        if (game.players[event.element.playerindex].openedself == false) then
            game.players[event.element.playerindex].gui.top.AmDroneGUI.destroy()
        end
    else
        Drone.SetActive(event.element.playerindex)
        event.element.caption = Drone.droneActive
    end
end

function Drone.OnTickUnFiltered()
    if (glob.AlphaMod == nil) or (glob.AlphaMod.playersDrones == nil) then
        return
    end

    for index, array in pairs(glob.AlphaMod.playersDrones) do
        if (array["character"]) then
            game.players[index].zoom = array["droneZoom"]
        end

        if (array["character"]) and (game.players[index].selected ~= array["playerSelection"]) then
            if (array["playerSelection"] ~= nil) then
                array["playerSelection"].operable = array["playerSelectionOperable"]
                array["playerSelection"].minable = array["playerSelectionMinable"]
                array["playerSelection"].rotatable = array["playerSelectionRotatable"]
                array["playerSelection"] = nil
            end
            
            if (game.players[index].selected ~= nil) then
                array["playerSelection"] = game.players[index].selected
                array["playerSelectionOperable"] = game.players[index].selected.operable
                array["playerSelectionMinable"] = game.players[index].selected.minable
                array["playerSelectionRotatable"] = game.players[index].selected.rotatable
                game.players[index].selected.operable = false
                game.players[index].selected.minable = false
                game.players[index].selected.rotatable = false
            end
        end
    end
end

function Drone.OnTick()
    if (glob.AlphaMod == nil) or (glob.AlphaMod.playersDrones == nil) then
        return
    end

    for index, array in pairs(glob.AlphaMod.playersDrones) do
        if (array["character"]) then
            local distance = util.distance(game.players[index].position,array["character"].position)
            if (distance >= array["droneDistance"]) then
                Drone.SetInactive(index)
                if (game.players[index].gui.top.AmDroneGUI) then
                    game.players[index].gui.top.AmDroneGUI.destroy()
                end
                game.players[index].print(game.localise("drone-connection-lost"))
            end
            if (game.players[index].gui.top.AmDroneGUI) and (game.players[index].gui.top.AmDroneGUI.AmDroneGUIProgressbar) then
                game.players[index].gui.top.AmDroneGUI.AmDroneGUIProgressbar.value = distance/array["droneDistance"]
            end
        end
    end
end

function Drone.SetInactive(playerIndex)
    if (glob.AlphaMod == nil) or (glob.AlphaMod.playersDrones == nil) or (glob.AlphaMod.playersDrones[playerIndex] == nil) or (glob.AlphaMod.playersDrones[playerIndex]["character"] == nil) then
        return
    end
    local array = glob.AlphaMod.playersDrones[playerIndex]
    game.players[playerIndex].character = array["character"]
    
    if (array["playerSelection"] ~= nil) then
        array["playerSelection"].operable = array["playerSelectionOperable"]
        array["playerSelection"].minable = array["playerSelectionMinable"]
        array["playerSelection"].rotatable = array["playerSelectionRotatable"]
        array["playerSelection"] = nil
    end

    glob.AlphaMod.playersDrones[playerIndex]["character"] = nil
end

function Drone.SetActive(playerIndex)
    CreateGlobalTable("playersDrones")
    local array = Drone.SetMaxDistanceAndZoom(playerIndex)
    array["character"] = game.players[playerIndex].character
    glob.AlphaMod.playersDrones[playerIndex] = array
    game.players[playerIndex].character = nil
    game.players[playerIndex].zoom = array["droneZoom"]
end

function Drone.SetMaxDistanceAndZoom(playerIndex)
    local array = {}
    local player = game.players[playerIndex]
    
    for i=Drone.MAX_TECHNOLOGIES, 1, -1 do
        if (array["droneZoom"] == nil) and (player.force.technologies["drone-zoom-"..i] ~= nil)  and (player.force.technologies["drone-zoom-"..i].researched == true) then
            array["droneZoom"] = Drone.ZoomTechnology[i]
        end
        
        if (array["droneDistance"] == nil) and (player.force.technologies["drone-distance-"..i] ~= nil)  and (player.force.technologies["drone-distance-"..i].researched == true) then
            array["droneDistance"] = Drone.DistanceTechnology[i]
        end
    end
    
    if (array["droneDistance"] == nil) then
        array["droneDistance"] = Drone.DistanceTechnology[0]
    end
    
    if (array["droneZoom"] == nil) then
        array["droneZoom"] = Drone.ZoomTechnology[0]
    end

    return array
end
