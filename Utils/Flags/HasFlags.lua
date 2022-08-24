return function (flags, ...)
    local flagsToCheck = {...}

    for _, flag in ipairs(flagsToCheck) do
        if flags & flag ~= flag then
            return false
        end
    end

    return true
end