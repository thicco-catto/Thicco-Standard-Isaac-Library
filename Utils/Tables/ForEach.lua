return function(toIterate, funct)
    for index, value in pairs(toIterate) do
        funct(index, value)
    end
end