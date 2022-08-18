return function(toFilter, predicate)
    local filtered = {}

    for index, value in pairs(toFilter) do
        if predicate(index, value) then
            filtered[index] = value
        end
    end

    return filtered
end