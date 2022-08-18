return function (collectibleId)
    local players = TSIL.Players.GetPlayers()

    return TSIL.Utils.Tables.Filter(players, function (_, player)
        return player:HasCollectible(collectibleId)
    end)
end