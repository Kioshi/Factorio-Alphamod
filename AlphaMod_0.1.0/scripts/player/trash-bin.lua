TrashBin = {}

EventHandler.Register(TrashBin)

function TrashBin.OnSelfClose(player, index)
    if (player.gui.top.AmTbGUI ~= nil) then
        player.gui.top.AmTbGUI.destroy()
    end
end

function TrashBin.OnSelfOpen(player, index)
    if (player.gui.top.AmTbGUI ~= nil) then
        player.gui.top.AmTbGUI.destroy()
    end
    
    local frame = player.gui.top.add({ type="frame", direction="horizontal", name="AmTbGUI" })
    local flow = frame.add({ type="flow", direction="vertical" })
    flow.add({ type="label", caption = {"player-trash-bin"} })
    flow.add({ type="button", name="AmTbGUIButton", style="not_available_slot_button_style"})

end

function TrashBin.OnGuiClick(event)
    if (event.element == nil) or (event.element.name ~= "AmTbGUIButton") then
        return
    end

    local player = game.players[event.element.playerindex]
    if (player) then
        player.cursorstack = nil
    end
end
