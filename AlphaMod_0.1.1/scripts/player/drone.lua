Drone = {}

EventHandler.Register(Drone)

Drone.droneActive  = "        Drone is active        "
Drone.droneInActive = "      Drone is inactive      "

function Drone.OnSelfClose(player, index)
    if (player.gui.top.AmDroneGUI == nil) or (player.gui.top.AmDroneGUI.AmDroneGUIButton == nil) or (player.gui.top.AmDroneGUI.AmDroneGUIButton.caption == Drone.droneActive)  then
        return
    end

    player.gui.top.AmDroneGUI.destroy()
end

function Drone.OnSelfOpen(player, index)
    if (player.gui.top.AmDroneGUI ~= nil) then
        return
    end
    
    local frame = player.gui.top.add({ type="frame", direction="vertical", name="AmDroneGUI" })
    local button = frame.add({ type="button", name="AmDroneGUIButton", caption = Drone.droneInActive })
    local progressBar = frame.add({ type="progressbar", name="AmDroneGUILabel", size = 20 })
    progressBar.value = 0.27
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

function Drone.SetInactive(playerIndex)
    if (glob.AlphaMod == nil) or (glob.AlphaMod.playersDrones == nil) or (glob.AlphaMod.playersDrones[playerIndex] == nil) or (glob.AlphaMod.playersDrones[playerIndex]["character"] == nil) then
        return
    end
    local miningSpeed = glob.AlphaMod.playersDrones[playerIndex]["miningspeed"]
    game.players[playerIndex].character = glob.AlphaMod.playersDrones[playerIndex]["character"]
    game.players[playerIndex].force.manualminingspeedmodifier = inlineIf(miningSpeed == nil, 1, miningSpeed)
    glob.AlphaMod.playersDrones[playerIndex]["character"] = nil
    glob.AlphaMod.playersDrones[playerIndex]["miningspeed"] = 1
end

function Drone.SetActive(playerIndex)
    CreateGlobalTable("playersDrones")
    local array = {}
    array["character"] = game.players[playerIndex].character
    array["miningspeed"] = game.players[playerIndex].force.manualminingspeedmodifier
    glob.AlphaMod.playersDrones[playerIndex] = array
    game.players[playerIndex].character = nil
    game.players[playerIndex].force.manualminingspeedmodifier = -1
end
