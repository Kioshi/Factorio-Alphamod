require "defines"   

function InsertIntoGlobalTable(tank, chest)

    if (glob.AlphaMod == nil) then
        glob.AlphaMod = {}
    end;
    
    if (glob.AlphaMod.smartTanks == nil) then
        glob.AlphaMod.smartTanks = { }
    end;

    local array = { }
    array["tank"] = tank
    array["chest"] = chest

    table.insert(glob.AlphaMod.smartTanks, array)
end

function RemoveFromGlobalTable(index)
    if (glob.AlphaMod ~= nil) and (glob.AlphaMod.smartTanks ~= nil) then
        table.remove(glob.AlphaMod.smartTanks, index)
    end
end

function CreateChest(tank)
	local chest = game.createentity{name = "smart-storage-tank-chest", position = tank.position, direction = tank.direction}

    chest.minable = false
	chest.destructible = false
    chest.operable = false
	    
    InsertIntoGlobalTable(tank,chest)

end

function DestroyChest(chest, index)
    RemoveFromGlobalTable(index)
	chest.destroy()
end


-- Entity Build
function OnEntityBuild(event)
    if (event ~= nil) and (event.createdentity ~= nil) and (event.createdentity.name == "smart-storage-tank") then
        CreateChest(event.createdentity)
	end
end

-- Entity Mined
function OnEntityMined(event)
    if (event == nil) or (event.entity == nil) or (event.entity.name ~= "smart-storage-tank") or (glob.AlphaMod == nil) or (glob.AlphaMod.smartTanks == nil) then
        return;
    end
    
	for index,array in pairs(glob.AlphaMod.smartTanks) do
        if (array ~= nil) and (array["tank"] ~= nil) and (array["chest"] ~= nil) and (event.entity.equals(array["tank"])) then
            DestroyChest(array["chest"],index)
		end
	end
end

-- Entity Died
function OnEntityDied(event)
    if (event == nil) or (event.entity == nil) or (event.entity.name ~= "smart-storage-tank") or (glob.AlphaMod == nil) or (glob.AlphaMod.smartTanks == nil) then
        return;
    end
    
	for index,array in pairs(glob.AlphaMod.smartTanks) do
        if (array ~= nil) and (array["tank"] ~= nil) and (array["chest"] ~= nil) and (event.entity.equals(array["tank"])) then
            DestroyChest(array["chest"],index)
		end
	end
end

function OnTick()
    if (glob.AlphaMod == nil) or (glob.AlphaMod.smartTanks == nil) then
        return
    end
    
	for index,array in pairs(glob.AlphaMod.smartTanks) do
        if (array ~= nil) and (array["tank"] ~= nil) and (array["chest"] ~= nil) then
            local liquidInfo = GetLiquidInfo(array["tank"])
            UpdateChestInfo(array["chest"],liquidInfo)
        end
    end
end


function GetLiquidInfo(tank)    
    local array = { }
    local liquid = tank.fluidbox[1]
    local amount = 0
    local tempXamount = 0
    local maxStorageSize = 0
    local validTanks = {}
    local GetNeiboroughTankTable
    function GetNeiboroughTankTable (tank)
        for index, entity in pairs(tank.neighbours) do
            if (entity ~= nil) and (entity.type == "storage-tank") and (validTanks[entity] ~= true) then
                validTanks[entity] = true
                --GetNeiboroughTankTable(entity) -- TODO do this without stackoverflow shit
            end
        end
    end

    if (liquid == nil) then
        return array
    end
    
    validTanks[tank] = true
    GetNeiboroughTankTable(tank)
    
    for entity, b in pairs(validTanks) do
        if (entity ~= nil) then
            if (entity.fluidbox[1] ~= nil) then
                amount = amount + entity.fluidbox[1].amount
                tempXamount = tempXamount + (entity.fluidbox[1].amount * entity.fluidbox[1].temperature)
                maxStorageSize = maxStorageSize + 250
            end
        end        
    end

    if (maxStorageSize == 0) then
        return array
    end

    if (game.itemprototypes ~= nil) and (game.itemprototypes[liquid.type] ~= nil) then   
        array[liquid.type] = 1
    end
    array["liquid-amount"] = amount
    if (amount ~= 0) then
        array["liquid-temperature"] = tempXamount / amount
    end
    array["liquid-percentual"] = (amount+0.5) / (maxStorageSize*10) * 100
    
    return array
end


function UpdateChestInfo(chest,liquidInfo)
    local inventory = chest.getinventory(1)
    for key,value in pairs(inventory.getcontents()) do
        if liquidInfo[key] == nil then
            inventory.remove{name = key, count = value}
        else
            local diff = liquidInfo[key] - value
            if diff >= 1 then 
                inventory.insert{name = key, count = diff}
            elseif diff <= -1 then 
                inventory.remove{name = key, count = -diff}
            end
            liquidInfo[key] = nil
        end
    end
    
    for key,value in pairs(liquidInfo) do    
        inventory.insert{name = key, count = 1}
    end    
end


-- Entity Build
game.onevent(defines.events.onbuiltentity, OnEntityBuild)       --By player
game.onevent(defines.events.onrobotbuiltentity, OnEntityBuild)  -- By robots

-- Entity Mined
game.onevent(defines.events.onpreplayermineditem, OnEntityMined) -- By player
game.onevent(defines.events.onrobotpremined, OnEntityMined)      -- By robots

-- Entity Died
game.onevent(defines.events.onentitydied, OnEntityDied)

--Tick
game.onevent(defines.events.ontick, OnTick)
