return function (ignoreCoopBabies)
    if ignoreCoopBabies == nil then
        ignoreCoopBabies = true
    end

    local players = {}

    for i = 0, Game():GetNumPlayers() - 1, 1 do
        local player = Game():GetPlayer(i)

        table.insert(players, player)
    end

    return players
end