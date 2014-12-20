function fncIN(ref, ...)
    local arg = {...}
    for i,cmpr in pairs(arg) do
        if (ref == cmpr) then
            return true
        end
    end
    return false
end 

function inlineIf(condition, True, False)
    if (condtion) then 
        return True 
    else 
        return False
    end
end
