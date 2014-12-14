require "defines"

game.onevent(defines.events.onbuiltentity, function(event)

	for playerIndex,player in pairs(game.players) do
		if (player ~= nil) and (player.cursorstack ~= nil) then
            if (fncIN(player.cursorstack.name,"pipe-l","pipe-t","pipe-i") == true) then
                game.player.rotateforbuild()
                game.player.rotateforbuild()
            end
		end
	end
end)

