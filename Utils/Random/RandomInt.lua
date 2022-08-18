return function (rngOrSeed, max, min)
    local rng

    if type(rngOrSeed) == "number" then
        rng = RNG()
        rng:SetSeed(rngOrSeed, 35)
    else
        rng = rngOrSeed
    end

    if min == nil then
        min = 0
    end

    local maxForRNG = max - min

    local chosenNumber = rng:RandomInt(maxForRNG)

    return chosenNumber + min
end