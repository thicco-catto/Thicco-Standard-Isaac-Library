return function (collectibleId)
    local players = TSIL.Players.GetPlayers()

    local numPlayersWithItem = TSIL.Utils.Tables.Count(players, function (_, player)
        return player:HasCollectible(collectibleId)
    end)

    return numPlayersWithItem > 0
end