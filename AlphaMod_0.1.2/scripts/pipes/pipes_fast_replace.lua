FastReplacePipes = {}

EventHandler.Register(FastReplacePipes) 

function FastReplacePipes.OnEntityBuild(event)
    if (glob.AlphaMod == nil) or (glob.AlphaMod.FixedPipes == nil) then
        return
    end

	for playerIndex,player in pairs(game.players) do
		if (player ~= nil) and (player.cursorstack ~= nil) then
            if (fncINtable(player.cursorstack.name,glob.AlphaMod.FixedPipes) == true) then
                game.player.rotateforbuild()
                game.player.rotateforbuild()
            end
		end
	end
end

function FastReplacePipes.LoadFixedPipes()
    CreateGlobalTable("FixedPipes")
    for index, item in pairs(game.itemprototypes) do
        if (string.match(index, '-[ilt]$') ~= nil) then
            glob.AlphaMod.FixedPipes[index] = index
        end
    end
end

function FastReplacePipes.OnInit()
    FastReplacePipes.LoadFixedPipes()
end

function FastReplacePipes.OnLoad()
    FastReplacePipes.LoadFixedPipes()
end
