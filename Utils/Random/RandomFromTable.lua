return function (toChoose, rngOrSeed, numberOfElements)
    local rng

    if type(rngOrSeed) == "number" then
        rng = RNG()
        rng:SetSeed(rngOrSeed, 35)
    else
        rng = rngOrSeed
    end

    if numberOfElements == nil then
        numberOfElements = 1
    end

    local tableSize = TSIL.Utils.Tables.Count(toChoose, function ()
        return true
    end)

    local leftInTable = tableSize
    local leftToChoose = numberOfElements

    local choices = {}

    for index, value in pairs(toChoose) do
        if rng:RandomFloat() < leftToChoose/leftInTable then
            table.insert(choices, {index, value})
            leftToChoose = leftToChoose - 1
        end

        leftInTable = leftInTable - 1
    end

    return choices
end