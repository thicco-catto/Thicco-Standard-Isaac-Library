return function (flags, ...)
    local flagsToAdd = {...}

    for _, flag in ipairs(flagsToAdd) do
        flags = flags | flag
    end

    return flags
end