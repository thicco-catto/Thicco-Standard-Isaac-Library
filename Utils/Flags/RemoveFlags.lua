---Removes the given flags from another one.
---@param flags integer
---@param ... integer
---@return integer
return function (flags, ...)
    local flagsToRemove = {...}

    for _, flag in ipairs(flagsToRemove) do
        flags = flags & !flag
    end

    return flags
end