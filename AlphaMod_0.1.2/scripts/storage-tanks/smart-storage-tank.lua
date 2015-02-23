
SmartStorageTank = {}

EventHandler.Register(SmartStorageTank) 

function SmartStorageTank.LoadMetaItems()
    local storageTanksBaseArea = {}
    local fluidItems = {}
    CreateGlobalTable("storageTanksBaseArea")
    CreateGlobalTable("fluidItems")
    for index, item in pairs(game.itemprototypes) do
        if (string.sub(index,1,12) == "AM-fluidbox-") then    
            glob.AlphaMod.storageTanksBaseArea[index] = item.fuelvalue
        elseif (string.sub(index,1,13) == "AM-fluidItem-") then 
            glob.AlphaMod.fluidItems[index] = item.fuelvalue
        end
    end
end

function SmartStorageTank.OnInit()
    SmartStorageTank.LoadMetaItems()
end

function SmartStorageTank.OnLoad()
    SmartStorageTank.LoadMetaItems()
end

function SmartStorageTank.RemoveFromGlobalTable(index)
    if (glob.AlphaMod ~= nil) and (glob.AlphaMod.smartTanks ~= nil) then
        table.remove(glob.AlphaMod.smartTanks, index)
    end
end

function SmartStorageTank.CreateChest(tank)
	local chest = game.createentity{name = "smart-storage-tank-chest", position = tank.position, direction = tank.direction, force=game.forces.player}

    chest.minable = false
	chest.destructible = false
    chest.operable = false
	    
    local array = { }
    array["tank"] = tank
    array["chest"] = chest

    InsertIntoGlobalTable("smartTanks",array)

end

function SmartStorageTank.DestroyChest(chest, index)
    SmartStorageTank.RemoveFromGlobalTable(index)
	chest.destroy()
end


-- Entity Build
function SmartStorageTank.OnEntityBuild(event)
    if (event ~= nil) and (event.createdentity ~= nil) and (event.createdentity.name == "smart-storage-tank") then
        SmartStorageTank.CreateChest(event.createdentity)
	end
end

-- Entity Mined
function SmartStorageTank.OnEntityMined(event)
    if (event == nil) or (event.entity == nil) or (event.entity.name ~= "smart-storage-tank") or (glob.AlphaMod == nil) or (glob.AlphaMod.smartTanks == nil) then
        return;
    end
    
	for index,array in pairs(glob.AlphaMod.smartTanks) do
        if (array ~= nil) and (array["tank"] ~= nil) and (array["chest"] ~= nil) and (event.entity.equals(array["tank"])) then
            SmartStorageTank.DestroyChest(array["chest"],index)
		end
	end
end

-- Entity Died
function SmartStorageTank.OnEntityDied(event)
    if (event == nil) or (event.entity == nil) or (event.entity.name ~= "smart-storage-tank") or (glob.AlphaMod == nil) or (glob.AlphaMod.smartTanks == nil) then
        return;
    end
    
	for index,array in pairs(glob.AlphaMod.smartTanks) do
        if (array ~= nil) and (array["tank"] ~= nil) and (array["chest"] ~= nil) and (event.entity.equals(array["tank"])) then
            SmartStorageTank.DestroyChest(array["chest"],index)
		end
	end
end

function SmartStorageTank.OnTick()
    if (glob.AlphaMod == nil) or (glob.AlphaMod.smartTanks == nil) then
        return
    end
    
	for index,array in pairs(glob.AlphaMod.smartTanks) do
        if (array ~= nil) and (array["tank"] ~= nil) and (array["chest"] ~= nil) then
            local tank = array["tank"]
            local liquidInfo = SmartStorageTank.GetLiquidInfo(array["tank"])
            SmartStorageTank.UpdateChestInfo(array["chest"],liquidInfo)
        end
    end
end


function SmartStorageTank.GetLiquidInfo(tank)    
    local array = { }
    local amount = 0
    local tempXamount = 0
    local maxStorageSize = 0
    local validTanks = {}

    if (tank.fluidbox[1] == nil) then
        return array
    end
    
    validTanks[tank] = true
    
    for entity, b in pairs(validTanks) do
        if (entity ~= nil) and (entity.fluidbox[1] ~= nil) then
            amount = amount + entity.fluidbox[1].amount
            tempXamount = tempXamount + (entity.fluidbox[1].amount * entity.fluidbox[1].temperature)
            local base_area = inlineIf(glob.AlphaMod.storageTanksBaseArea["AM-fluidbox-" .. entity.name] ~= nil, glob.AlphaMod.storageTanksBaseArea["AM-fluidbox-" .. entity.name], 25)
            maxStorageSize = maxStorageSize + base_area
        end     
    end
    
    if (maxStorageSize == 0) then
        return array
    end

    if (glob.AlphaMod.fluidItems["AM-fluidItem-" .. tank.fluidbox[1].type]) then   
        array["AM-fluidItem-" .. tank.fluidbox[1].type] = 1
    end
    array["liquid-amount"] = amount
    array["liquid-temperature"] = tempXamount / math.max(0.1,amount)
    array["liquid-percentual"] = (amount+0.5) / (maxStorageSize*10) * 100
    
    return array
end


function SmartStorageTank.UpdateChestInfo(chest,liquidInfo)
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
