return function(toFilter, predicate)
    local filtered = {}

    for _, value in pairs(toFilter) do
        if predicate(value) then
            table.insert(filtered, value)
        end
    end

    return filtered
end