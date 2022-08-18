return function(toFind, predicate)
    local filtered = TSIL.Utils.Tables.Filter(toFind, predicate)

    return filtered[1]
end