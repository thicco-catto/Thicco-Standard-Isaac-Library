local PlayerInventories = {}

local PlayerCollectibleAddedCallback = require(TSIL.LOCAL_FOLDER .. ".CustomCallbacks.PlayerCallbacks.PlayerCollectibleAdded")
local PlayerCollectibleRemovedCallback = require(TSIL.LOCAL_FOLDER .. ".CustomCallbacks.PlayerCallbacks.PlayerCollectibleRemoved")
local PlayerGulpedTrinketAddedCallback = require(TSIL.LOCAL_FOLDER .. ".CustomCallbacks.PlayerCallbacks.PlayerGulpedTrinketAdded")
local PlayerGulpedTrinketRemovedCallback = require(TSIL.LOCAL_FOLDER .. ".CustomCallbacks.PlayerCallbacks.PlayerGulpedTrinketRemoved")

local function CheckCollectedItems(player, playerState)
    local itemConfig = Isaac.GetItemConfig()
    local itemList = itemConfig:GetCollectibles()

    --itemList.Size actually returns the last item id, not the actual size
    for id = 1, itemList.Size - 1, 1 do
        local item = itemConfig:GetCollectible(id)
        --Only check for non active items
        if item and item.Type ~= ItemType.ITEM_ACTIVE then
            local itemId = item.ID

            local pastCollectibleNum = playerState.CollectedItems[itemId] or 0
            local actualCollectibleNum = player:GetCollectibleNum(itemId, true)

            if actualCollectibleNum > pastCollectibleNum then
                --If the actual num is bigger than what we had, player has picked up an item
                playerState.CollectedItems[itemId] = actualCollectibleNum
                for _ = 1, actualCollectibleNum - pastCollectibleNum, 1 do
                    table.insert(playerState.InventoryOrdered, { type = TSIL.Enums.InventoryType.INVENTORY_COLLECTIBLE, id = itemId })
                end

                PlayerCollectibleAddedCallback.ExecuteCallback(player, itemId)
            elseif actualCollectibleNum < pastCollectibleNum then
                --If the actual num is smaller than what we had, player has lost an item
                playerState.CollectedItems[itemId] = actualCollectibleNum

                for i = 1, #playerState.InventoryOrdered, 1 do
                    local inventoryItem = playerState.InventoryOrdered[i]
                    if inventoryItem.type == TSIL.Enums.InventoryType.INVENTORY_COLLECTIBLE and inventoryItem.id == itemId then
                        for _ = 1, pastCollectibleNum - actualCollectibleNum, 1 do
                            table.remove(playerState.InventoryOrdered, i)
                        end
                        break
                    end
                end

                PlayerCollectibleRemovedCallback.ExecuteCallback(player, itemId)
            end
        end
    end
end


local function CheckGulpedTrinkets(player, playerState)
    local itemConfig = Isaac.GetItemConfig()
    local trinketList = itemConfig:GetTrinkets()

    --itemList.Size actually returns the last item id, not the actual size
    for id = 1, trinketList.Size - 1, 1 do
        local trinket = itemConfig:GetTrinket(id)
        --Only check for non active items
        if trinket then
            local trinketId = trinket.ID

            local pastGulpedNum = playerState.GulpedTrinkets[trinketId] or 0
            local actualGulpedNum = TSIL.Players.GetSmeltedTrinketMultiplier(player, trinketId)

            if actualGulpedNum > pastGulpedNum then
                --If the actual num is bigger than what we had, player has gulped a trinket
                playerState.GulpedTrinkets[trinketId] = actualGulpedNum

                for _ = 1, actualGulpedNum - pastGulpedNum, 1 do
                    table.insert(playerState.InventoryOrdered, { type = TSIL.Enums.InventoryType.INVENTORY_TRINKET, id = trinketId })
                end

                PlayerGulpedTrinketAddedCallback.ExecuteCallback(player, trinketId)
            elseif actualGulpedNum < pastGulpedNum then
                --If the actual num is smaller than what we had, player has lost an item
                playerState.GulpedTrinkets[trinketId] = actualGulpedNum

                for i = 1, #playerState.InventoryOrdered, 1 do
                    local inventoryItem = playerState.InventoryOrdered[i]
                    if inventoryItem.type == TSIL.Enums.InventoryType.INVENTORY_TRINKET and inventoryItem.id == trinketId then

                        for _ = 1, pastGulpedNum - actualGulpedNum, 1 do
                            table.remove(playerState.InventoryOrdered, i)
                        end

                        break
                    end
                end

                PlayerGulpedTrinketRemovedCallback.ExecuteCallback(player, trinketId)
            end
        end
    end
end


local function OnPeffectUpdate(_, player)
    local playerIndex = TSIL.Players.GetPlayerIndex(player)
    local playerState = TSIL.Utils.Tables.Filter(PlayerInventories, function(_, playerInventory)
        return playerInventory.PlayerIndex == playerIndex
    end)[1]

    if not playerState then
        local newState = {
            PlayerIndex = playerIndex,
            InventoryOrdered = {},
            GulpedTrinkets = {},
            CollectedItems = {}
        }
        --If for some reason the current state is nil, initialize it again
        table.insert(PlayerInventories, newState)

        playerState = newState
    end

    CheckCollectedItems(player, playerState)

    CheckGulpedTrinkets(player, playerState)
end

TSIL.MOD:AddCallback(ModCallbacks.MC_POST_PEFFECT_UPDATE, OnPeffectUpdate)

return function(player, inventoryTypeFilter)
    local playerIndex = TSIL.Players.GetPlayerIndex(player)

    local TablesUtils = TSIL.Utils.Tables

    local chosenInventory = TablesUtils.Filter(PlayerInventories, function(_, playerInventory)
        return playerInventory.PlayerIndex == playerIndex
    end)[1].InventoryOrdered

    if inventoryTypeFilter then
        local filteredInventory = TablesUtils.Filter(chosenInventory, function(_, inventoryItem)
            return inventoryItem.type == inventoryTypeFilter
        end)

        return filteredInventory
    else
        return TablesUtils.Copy(chosenInventory)
    end
end