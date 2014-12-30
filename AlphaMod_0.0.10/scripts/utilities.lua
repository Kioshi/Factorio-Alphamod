function fncIN(ref, ...)
    local arg = {...}
    for i,cmpr in pairs(arg) do
        if (ref == cmpr) then
            return true
        end
    end
    return false
end 

function fncINtable(ref, table)
    for i,cmpr in pairs(table) do
        if (ref == cmpr) then
            return true
        end
    end
    return false
end 

function inlineIf(condition, True, False)
    if (condition == true) then 
        return True 
    else 
        return False
    end
end

function InsertIntoGlobalTable(tableName,value)
    CreateGlobalTable(tableName)
    table.insert(glob.AlphaMod[tableName], value)
end


function CreateGlobalTable(tableName)
    if (glob.AlphaMod == nil) then
        glob.AlphaMod = {}
    end;
    
    if (glob.AlphaMod[tableName] == nil) then
        glob.AlphaMod[tableName] = {}
    end;
end

