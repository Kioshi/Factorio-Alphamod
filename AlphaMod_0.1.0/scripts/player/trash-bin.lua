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
    
    local frame = player.gui.top.add({ type="frame", direction="vertical", name="AmTbGUI" })
    frame.add({ type="label", name="AmTbGUILabel", caption = {"player-trash-bin"} })
    frame.add({ type="button", name="AmTbGUIButton", style="not_available_slot_button_style"})

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
