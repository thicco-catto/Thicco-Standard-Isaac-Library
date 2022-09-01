---Returns wether a given flag has all of the other given flags.
---@param flags integer
---@param ... integer
---@return boolean
return function (flags, ...)
    local flagsToCheck = {...}

    for _, flag in ipairs(flagsToCheck) do
        if flags & flag ~= flag then
            return false
        end
    end

    return true
end