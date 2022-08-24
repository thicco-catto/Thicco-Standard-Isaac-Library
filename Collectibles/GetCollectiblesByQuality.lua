return function (quality)
    local collectibles = TSIL.Collectibles.GetCollectibles()

    return TSIL.Utils.Tables.Filter(collectibles, function (collectible)
        return collectible.Quality == quality
    end)
end