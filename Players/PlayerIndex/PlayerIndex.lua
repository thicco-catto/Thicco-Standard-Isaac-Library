---Returns a given player's index.
---@param player EntityPlayer
---@return integer
return function(player)
    return player:GetCollectibleRNG(1):GetSeed()
end