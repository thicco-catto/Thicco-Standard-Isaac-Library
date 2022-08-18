return function (playerIndex)
    local players = TSIL.Players.GetPlayers()

    return TSIL.Utils.Tables.FindFirst(players, function (_, player)
        return TSIL.Players.GetPlayerIndex(player) == playerIndex
    end)
end