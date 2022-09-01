---Adds the given flag to another one.
---@param flags integer
---@param ... integer
---@return integer
return function (flags, ...)
    local flagsToAdd = {...}

    for _, flag in ipairs(flagsToAdd) do
        flags = flags | flag
    end

    return flags
end