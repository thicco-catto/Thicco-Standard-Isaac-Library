return function (flags, ...)
    local flagsToRemove = {...}

    for _, flag in ipairs(flagsToRemove) do
        flags = flags & !flag
    end

    return flags
end