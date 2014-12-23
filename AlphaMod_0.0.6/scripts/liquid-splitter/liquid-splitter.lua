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

function LiquidSplitter.CreateEntity(entity)
    local splitter = entity
    array = {}
    array["splitter"]    = splitter
    array["inPump"]      = game.createentity{name="splitter-in-pump", position = LiquidSplitter.DirectionPositionShift(splitter.position,0,-1,splitter.direction), direction = splitter.direction}
    array["outPumpLeft"] = game.createentity{name="splitter-out-pump",position = LiquidSplitter.DirectionPositionShift(splitter.position,-1,1,splitter.direction), direction = splitter.direction}
    array["outPumpRight"]= game.createentity{name="splitter-out-pump",position = LiquidSplitter.DirectionPositionShift(splitter.position, 1,1,splitter.direction), direction = splitter.direction}
    array["leftPipeL"]   = game.createentity{name="pipe-l-splitter",position = LiquidSplitter.DirectionPositionShift(splitter.position,-1,0,splitter.direction), direction = LiquidSplitter.FixDirection(true,splitter.direction)}
    array["rightPipeL"]  = game.createentity{name="pipe-l-splitter",position = LiquidSplitter.DirectionPositionShift(splitter.position,1,0,splitter.direction),  direction = LiquidSplitter.FixDirection(false,splitter.direction)}
    array["pipeT"]       = game.createentity{name="pipe-t-splitter",position = LiquidSplitter.DirectionPositionShift(splitter.position,0,0,splitter.direction),  direction = (splitter.direction + 2) % 8}
    array["leftValue"]   = 1
    array["rightValue"]  = 10
    array["stopWhenClogged"] = false

    InsertIntoGlobalTable("liquidSplitter", array)
end

function LiquidSplitter.OnEntityBuild(event)
    if (event ~= nil) and (event.createdentity ~= nil) and (event.createdentity.name == "liquid-splitter") then
        LiquidSplitter.CreateEntity(event.createdentity)
    end
end


function LiquidSplitter.RemoveEntity(entity)
   if (glob.AlphaMod == nil) or (glob.AlphaMod.liquidSplitter == nil) then
        return
    end

	for index,array in pairs(glob.AlphaMod.liquidSplitter) do
        if (array ~= nil) and (array["splitter"].equals(entity)) then
            array["inPump"].destroy()
            array["outPumpLeft"].destroy()
            array["outPumpRight"].destroy()
            array["leftPipeL"].destroy()
            array["rightPipeL"].destroy()
            array["pipeT"].destroy()
            table.remove(glob.AlphaMod.liquidSplitter, index)
            break
		end
	end
end

function LiquidSplitter.OnEntityMined(event)
    if (event ~= nil) and (event.entity ~= nil) and (event.entity.name == "liquid-splitter") then
        LiquidSplitter.RemoveEntity(event.entity)
    end
end

function LiquidSplitter.OnEntityDied(event)
    if (event ~= nil) and (event.entity ~= nil) and (event.entity.name == "liquid-splitter") then
        LiquidSplitter.RemoveEntity(event.entity)
    end
end

function LiquidSplitter.OnEntityRotated(event)
    if (event ~= nil) and (event.entity ~= nil) and (event.entity.name == "liquid-splitter") then
        LiquidSplitter.RemoveEntity(event.entity)
        LiquidSplitter.CreateEntity(event.entity)
    end
end

function LiquidSplitter.OnTickUnFiltered()    
   if (glob.AlphaMod == nil) or (glob.AlphaMod.liquidSplitter == nil) then
        return
    end
    
	for index,array in pairs(glob.AlphaMod.liquidSplitter) do
        local inPump = array["inPump"]
        if (inPump ~= nil) and (inPump.fluidbox[1] ~= nil) and (inPump.fluidbox[1].amount ~= 0) then      
            local inLiquidBox = inPump.fluidbox[1]
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

            inPump.fluidbox[1] = inLiquidBox
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
    if (player.gui.center.AmLsGUI ~= nil) then
        return
    end
    
    local index = LiquidSplitter.FindArrayIndex(entity)
    if (index == -1) then return end
    local checkBoxState = glob.AlphaMod.liquidSplitter[index]["stopWhenClogged"]
    local leftText = tostring(glob.AlphaMod.liquidSplitter[index]["leftValue"])
    local leftRight = tostring(glob.AlphaMod.liquidSplitter[index]["rightValue"])
    local frame = player.gui.center.add({ type="frame", direction="horizontal", name="AmLsGUI", caption = game.getlocalisedentityname("liquid-splitter") })
    local tableRows = frame.add({ type="table", name="AmLsTableRows", colspan=1 })
    local checkbox = tableRows.add({ type = "checkbox", name = "AmLsCheckbox", state = checkBoxState, caption = {"liquid-splitter-checkbox"}})
    local tableRatio = tableRows.add({ type="table", name="AmLsTableRatio", colspan=3 })
    local left = tableRatio.add({ type="textfield", name="AmLsLeft", style="number_textfield_style", text = leftText })
    tableRatio.add({ type="label", name="AmLsKu", caption = "Y" })
    local right = tableRatio.add({ type="textfield", name="AmLsRight", style="number_textfield_style", text = leftRight })
    local exit = tableRows.add({ type="button", name="AmLsExit", caption="Close", text="adas" })
    left.text = leftText
    right.text = leftRight
    checkbox.state = checkBoxState
    
    CreateGlobalTable("liquidSplitterGuiConnector")
    glob.AlphaMod.liquidSplitterGuiConnector[playerIndex] = entity

end
--[
function LiquidSplitter.OnGuiClick(event)

    if (event.element == nil) or (event.element.gui == nil) or (event.element.name ~= "AmLsExit") then
        return
    end
    
    if (glob.AlphaMod ~= nil) and (glob.AlphaMod.liquidSplitterGuiConnector ~= nil) and (glob.AlphaMod.liquidSplitterGuiConnector[event.element.playerindex] ~= nil) then 
        local entity = glob.AlphaMod.liquidSplitterGuiConnector[event.element.playerindex]
        local index = LiquidSplitter.FindArrayIndex(entity)
        if (index ~= -1) then
            glob.AlphaMod.liquidSplitter[index]["stopWhenClogged"] = event.element.gui.center.AmLsGUI.AmLsTableRows.AmLsCheckbox.state
            local textL = event.element.gui.center.AmLsGUI.AmLsTableRows.AmLsTableRatio.AmLsLeft.text
            local textR = event.element.gui.center.AmLsGUI.AmLsTableRows.AmLsTableRatio.AmLsRight.text
            glob.AlphaMod.liquidSplitter[index]["leftValue"] = inlineIf(tonumber(textL) == nil, 1 , tonumber(textL))
            glob.AlphaMod.liquidSplitter[index]["rightValue"] = inlineIf(tonumber(textR) == nil, 1 , tonumber(textR))
        end
    end

    event.element.gui.center.AmLsGUI.destroy()
end

function LiquidSplitter.OnSelect(player,entity, playerIndex)
    if (entity ~= nil) and (entity.name == "liquid-splitter") and (player.gui.center.AmLsGUI == nil) then
        LiquidSplitter.GenerateGUI(player,entity,playerIndex)
    end
end
