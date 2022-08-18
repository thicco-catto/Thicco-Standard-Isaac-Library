return function (trinketId)
    local players = TSIL.Players.GetPlayers()

    return TSIL.Utils.Tables.Filter(players, function (_, player)
        return player:HasTrinket(trinketId)
    end)
end