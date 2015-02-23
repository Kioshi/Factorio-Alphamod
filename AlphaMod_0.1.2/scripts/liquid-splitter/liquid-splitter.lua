LiquidSplitter = {}

EventHandler.Register(LiquidSplitter)

function LiquidSplitter.DirectionPositionShift(centerPos, xShift, yShift, direction)

    local x = centerPos.x
    local y = centerPos.y
    if (direction == defines.direction.north) then
        x = centerPos.x + inlineIf(xShift == -1, -1.5, inlineIf(xShift == 1, 0.5, 0))
        y = centerPos.y + inlineIf(yShift == -1, 0.5, inlineIf(yShift == 1, -1.5, 0))
    end
    
    if (direction == defines.direction.south) then
        x = centerPos.x + inlineIf(xShift == 1, -1.5, inlineIf(xShift == -1, 0.5, 0))
        y = centerPos.y + inlineIf(yShift == 1, 0.5, inlineIf(yShift == -1, -1.5, 0))
    end
    
    if (direction == defines.direction.west) then
        x = centerPos.x + inlineIf(yShift == 1, -1.5, inlineIf(yShift == -1, 0.5, 0))
        y = centerPos.y + inlineIf(xShift == 1, 0.5, inlineIf(xShift == -1, -1.5, 0))
    end
    
    if (direction == defines.direction.east) then
        x = centerPos.x + inlineIf(yShift == -1, -1.5, inlineIf(yShift == 1, 0.5, 0))
        y = centerPos.y + inlineIf(xShift == -1, 0.5, inlineIf(xShift == 1, -1.5, 0))
    end

    return { x, y }
end

function LiquidSplitter.FixDirection(left,direction)
    local dir = direction
    if (direction == defines.direction.north) or (direction == defines.direction.south) then
        dir = ((direction + inlineIf(left,6,4)) % 8)
    else
        dir = ((direction + inlineIf(left,4,6)) % 8)
    end

    return dir
end

function LiquidSplitter.CreateEntity(entity, data)
    local splitter = entity
    array = {}
    array["splitter"]    = splitter
    array["inPump"]      = game.createentity{name="splitter-in-pump", position = LiquidSplitter.DirectionPositionShift(splitter.position,0,-1,splitter.direction), direction = splitter.direction, force=data["force"] }
    array["outPumpLeft"] = game.createentity{name="splitter-out-pump",position = LiquidSplitter.DirectionPositionShift(splitter.position,-1,1,splitter.direction), direction = splitter.direction, force=data["force"] }
    array["outPumpRight"]= game.createentity{name="splitter-out-pump",position = LiquidSplitter.DirectionPositionShift(splitter.position, 1,1,splitter.direction), direction = splitter.direction, force=data["force"] }
    array["leftPipeL"]   = game.createentity{name="pipe-l-splitter",position = LiquidSplitter.DirectionPositionShift(splitter.position,-1,0,splitter.direction), direction = LiquidSplitter.FixDirection(true,splitter.direction), force=data["force"] }
    array["rightPipeL"]  = game.createentity{name="pipe-l-splitter",position = LiquidSplitter.DirectionPositionShift(splitter.position,1,0,splitter.direction),  direction = LiquidSplitter.FixDirection(false,splitter.direction), force=data["force"] }
    array["pipeT"]       = game.createentity{name="pipe-t-splitter",position = LiquidSplitter.DirectionPositionShift(splitter.position,0,0,splitter.direction),  direction = (splitter.direction + 2) % 8, force=data["force"] }
    array["leftValue"]   = data["leftValue"]
    array["rightValue"]  = data["rightValue"]
    array["stopWhenClogged"] = data["stopWhenClogged"]

    InsertIntoGlobalTable("liquidSplitter", array)
end

function LiquidSplitter.OnEntityBuild(event)
    if (event ~= nil) and (event.createdentity ~= nil) and (event.createdentity.name == "liquid-splitter-inserter") then
        LiquidSplitter.CreateEntity(event.createdentity, { leftValue = 1, rightValue = 1, stopWhenClogged = false, force = game.forces.player })
    end
end


function LiquidSplitter.RemoveEntity(entity)
   if (glob.AlphaMod == nil) or (glob.AlphaMod.liquidSplitter == nil) then
        return {}
    end
    
    if (glob.AlphaMod.liquidSplitterGuiConnector ~= nil) then
        for i,e in pairs(glob.AlphaMod.liquidSplitterGuiConnector) do
            if ((e.valid == false) or (entity.equals(e))) and (game.players[i].gui.left.AmLsGUI ~= nil) then
                game.players[i].gui.left.AmLsGUI.destroy()
            end
        end
    end

    local data = {}
	for index,array in pairs(glob.AlphaMod.liquidSplitter) do
        if (array ~= nil) and (array["splitter"].equals(entity)) then
            data["leftValue"] = array["leftValue"]
            data["rightValue"] = array["rightValue"]
            data["stopWhenClogged"] = array["stopWhenClogged"]
            data["force"] = array["splitter"].force
            array["inPump"].destroy()
            array["outPumpLeft"].destroy()
            array["outPumpRight"].destroy()
            array["leftPipeL"].destroy()
            array["rightPipeL"].destroy()
            array["pipeT"].destroy()
            table.remove(glob.AlphaMod.liquidSplitter, index)
            return data
		end
	end
end

function LiquidSplitter.OnEntityMined(event)
    if (event ~= nil) and (event.entity ~= nil) and (event.entity.name == "liquid-splitter-inserter") then
        LiquidSplitter.RemoveEntity(event.entity)
    end
end

function LiquidSplitter.OnEntityDied(event)
    if (event ~= nil) and (event.entity ~= nil) and (event.entity.name == "liquid-splitter-inserter") then
        LiquidSplitter.RemoveEntity(event.entity)
    end
end

function LiquidSplitter.OnEntityRotated(event)
    if (event ~= nil) and (event.entity ~= nil) and (event.entity.name == "liquid-splitter-inserter") then   
        local data = LiquidSplitter.RemoveEntity(event.entity)
        LiquidSplitter.CreateEntity(event.entity,data)
    end
end

function LiquidSplitter.OnTickUnFiltered()    
   if (glob.AlphaMod == nil) or (glob.AlphaMod.liquidSplitter == nil) then
        return
    end
    
	for index,array in pairs(glob.AlphaMod.liquidSplitter) do
        local pipeT = array["pipeT"]
        if (pipeT ~= nil) and (pipeT.fluidbox[1] ~= nil) and (pipeT.fluidbox[1].amount > 0) then      
            local inLiquidBox = pipeT.fluidbox[1]
            local outLiquidBoxLeft =  inlineIf(array["leftPipeL"].fluidbox[1] ~= nil, array["leftPipeL"].fluidbox[1],   { type=inLiquidBox.type, amount=0, temperature = inLiquidBox.temperature})
            local outLiquidBoxRight = inlineIf(array["rightPipeL"].fluidbox[1] ~= nil, array["rightPipeL"].fluidbox[1], { type=inLiquidBox.type, amount=0, temperature = inLiquidBox.temperature})
            local leftRatio = array["leftValue"] / (array["leftValue"] + array["rightValue"])
            local rightRatio = array["rightValue"] / (array["leftValue"] + array["rightValue"])
            local canMove = math.min(10-outLiquidBoxLeft.amount,10-outLiquidBoxRight.amount)
            if ((outLiquidBoxLeft.amount >= 9.99) or (outLiquidBoxRight.amount >= 9.99)) and (array["stopWhenClogged"] == false) then
                canMove = inlineIf(outLiquidBoxLeft.amount < outLiquidBoxRight.amount, 10 - outLiquidBoxLeft.amount, 10 - outLiquidBoxRight.amount)
            end
            canMove = math.min(canMove * 2, inLiquidBox.amount)
            outLiquidBoxLeft.amount = outLiquidBoxLeft.amount + canMove * leftRatio
            outLiquidBoxRight.amount = outLiquidBoxRight.amount + canMove * rightRatio
            inLiquidBox.amount = inLiquidBox.amount - canMove

            pipeT.fluidbox[1] = inLiquidBox
            array["leftPipeL"].fluidbox[1] = outLiquidBoxLeft
            array["rightPipeL"].fluidbox[1] = outLiquidBoxRight
        end
    end
end

function LiquidSplitter.FindArrayIndex(entity)
    if (entity.valid ~= true) then 
        return -1
    end
	for index,array in pairs(glob.AlphaMod.liquidSplitter) do
        if (array["splitter"].equals(entity)) then
            return index
        end
    end
    return -1
end

function LiquidSplitter.GenerateGUI(player,entity,playerIndex)
    if (player.gui.left.AmLsGUI ~= nil) then
        player.gui.left.AmLsGUI.destroy()
    end
    
    local index = LiquidSplitter.FindArrayIndex(entity)
    if (index == -1) then return end
    local checkBoxState = glob.AlphaMod.liquidSplitter[index]["stopWhenClogged"]
    local leftText = tostring(glob.AlphaMod.liquidSplitter[index]["leftValue"])
    local leftRight = tostring(glob.AlphaMod.liquidSplitter[index]["rightValue"])
    local frame = player.gui.left.add({ type="frame", direction="horizontal", name="AmLsGUI", caption = game.getlocalisedentityname("liquid-splitter-inserter") })
    local tableRows = frame.add({ type="table", name="AmLsTableRows", colspan=1 })
    local checkbox = tableRows.add({ type = "checkbox", name = "AmLsCheckbox", state = checkBoxState, caption = {"liquid-splitter-checkbox"}})
    local left = nil
    local right = nil
    if (entity.direction == defines.direction.north) then
        local tableRatio = tableRows.add({ type="table", name="AmLsTableRatio", colspan=3 })
        left = tableRatio.add({ type="textfield", name="AmLsLeft", style="number_textfield_style", text = leftText })
        tableRatio.add({ type="label", name="AmLsKu", caption = "Y" })
        right = tableRatio.add({ type="textfield", name="AmLsRight", style="number_textfield_style", text = leftRight })
    elseif (entity.direction == defines.direction.east) then
        local tableRatio = tableRows.add({ type="table", name="AmLsTableRatio", colspan=1 })
        right = tableRatio.add({ type="textfield", name="AmLsRight", style="number_textfield_style", text = leftRight })
        tableRatio.add({ type="label", name="AmLsKu", caption = "-<" })
        left = tableRatio.add({ type="textfield", name="AmLsLeft", style="number_textfield_style", text = leftText })
    elseif (entity.direction == defines.direction.south) then
        local tableRatio = tableRows.add({ type="table", name="AmLsTableRatio", colspan=3 })
        right = tableRatio.add({ type="textfield", name="AmLsRight", style="number_textfield_style", text = leftRight })
        tableRatio.add({ type="label", name="AmLsKu", caption = "/\\" })
        left = tableRatio.add({ type="textfield", name="AmLsLeft", style="number_textfield_style", text = leftText })
    elseif (entity.direction == defines.direction.west) then
        local tableRatio = tableRows.add({ type="table", name="AmLsTableRatio", colspan=1 })
        left = tableRatio.add({ type="textfield", name="AmLsLeft", style="number_textfield_style", text = leftText })
        tableRatio.add({ type="label", name="AmLsKu", caption = ">-" })
        right = tableRatio.add({ type="textfield", name="AmLsRight", style="number_textfield_style", text = leftRight })
    end
    left.text = leftText
    right.text = leftRight
    checkbox.state = checkBoxState
    
    CreateGlobalTable("liquidSplitterGuiConnector")
    glob.AlphaMod.liquidSplitterGuiConnector[playerIndex] = entity

end

function LiquidSplitter.OnSelect(player, entity, playerIndex)
    if (entity.name == "liquid-splitter-inserter") and (player.gui.left.AmLsGUI == nil) then
        LiquidSplitter.GenerateGUI(player,entity,playerIndex)
    end
end

function LiquidSplitter.OnDeselect(player, entity, playerIndex)
    if (entity.valid) and (entity.name ~= "liquid-splitter-inserter") or (player.gui.left.AmLsGUI == nil) then
        return
    end

    if (glob.AlphaMod ~= nil) and (glob.AlphaMod.liquidSplitterGuiConnector ~= nil) and (glob.AlphaMod.liquidSplitterGuiConnector[playerIndex] ~= nil) then 
        local entity = glob.AlphaMod.liquidSplitterGuiConnector[playerIndex]
        local index = LiquidSplitter.FindArrayIndex(entity)
        if (index ~= -1) then
            glob.AlphaMod.liquidSplitter[index]["stopWhenClogged"] = player.gui.left.AmLsGUI.AmLsTableRows.AmLsCheckbox.state
            local textL = player.gui.left.AmLsGUI.AmLsTableRows.AmLsTableRatio.AmLsLeft.text
            local textR = player.gui.left.AmLsGUI.AmLsTableRows.AmLsTableRatio.AmLsRight.text
            glob.AlphaMod.liquidSplitter[index]["leftValue"] = inlineIf(tonumber(textL) == nil, 1 , tonumber(textL))
            glob.AlphaMod.liquidSplitter[index]["rightValue"] = inlineIf(tonumber(textR) == nil, 1 , tonumber(textR))
        end
    end

    player.gui.left.AmLsGUI.destroy()
end
