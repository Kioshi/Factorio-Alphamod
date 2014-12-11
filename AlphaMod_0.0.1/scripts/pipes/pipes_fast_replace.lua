require "defines"

game.onevent(defines.events.onbuiltentity, function(event)

	for playerIndex,player in pairs(game.players) do
		if (player ~= nil) and (player.cursorstack ~= nil) then
            if (player.cursorstack.name == "pipe-l") or (player.cursorstack.name == "pipe-t") or (player.cursorstack.name == "pipe-i") then
                game.player.rotateforbuild()
                game.player.rotateforbuild()
            end
		end
	end
end)
