return function(toCount, predicate)
    local filtered = TSIL.Utils.Tables.Filter(toCount, predicate)

    local count = 0
    for _, _ in pairs(filtered) do
        count = count + 1
    end

    return count
end