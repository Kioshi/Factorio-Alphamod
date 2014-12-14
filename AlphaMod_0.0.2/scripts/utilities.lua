function fncIN(ref, ...)
    local arg = {...}
    for i,cmpr in pairs(arg) do
        if (ref == cmpr) then
            return true
        end
    end
    return false
end 

function InsertInto2DA(array, key, value)
    
    if (array == nil) then
        array = {}
    end

	if array[key] == nil then 
        array[key] = {} 
    end

	array[key] = value
end

function Set2DA(array, key, value)
	array[key] = value
end

function Get2DA(array, key)
	if array[key] == nil then 
        return
    end

	return array[key]
end

function GetEntityAt(pos, entityname)
	local t = game.findentitiesfiltered{area = {{pos.x - 0.1, pos.y - 0.1}, {pos.x + 0.1, pos.y + 0.1}}, name = entityname}
	for _,v in pairs(t) do
		return v
	end
	return nil
end
