return function (center, numberOfPlayers)
    if numberOfPlayers == nil then
        numberOfPlayers = 1
    end

    local players = TSIL.Players.GetPlayers()

    table.sort(players, function(player1, player2)
        return center:DistanceSquared(player1.Position) <= center:DistanceSquared(player2.Position)
    end)

    local closestPlayers = {}

    for i = 1, numberOfPlayers, 1 do
        closestPlayers[i] = players[i]
    end

    return closestPlayers
end