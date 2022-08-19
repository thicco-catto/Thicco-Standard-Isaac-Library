return function (list, element)
    local found = TSIL.Utils.Tables.FindFirst(list, function (_, value)
        return element == value
    end)

    return found ~= nil
end