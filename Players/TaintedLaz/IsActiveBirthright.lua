return function (player)
    local TSILPlayer = TSIL.Players
    local playerIndex = TSILPlayer.GetPlayerIndex(player)
    local subPlayerIndex = TSILPlayer.GetPlayerIndex(player:GetOtherTwin())

    for i = 0, Game():GetNumPlayers() - 1, 1 do
        local otherPlayer = Game():GetPlayer(i)
        local otherPlayerIndex = TSILPlayer.GetPlayerIndex(otherPlayer)

        if otherPlayerIndex == playerIndex then
            return true
        elseif otherPlayerIndex == subPlayerIndex then
            return false
        end
    end
end