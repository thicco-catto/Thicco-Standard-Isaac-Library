---Returns all the players that have a certain trinket
---@param trinketId TrinketType
---@return EntityPlayer[]
return function (trinketId)
    local players = TSIL.Players.GetPlayers()

    return TSIL.Utils.Tables.Filter(players, function (_, player)
        return player:HasTrinket(trinketId)
    end)
end