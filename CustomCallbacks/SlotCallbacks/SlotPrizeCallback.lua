local SlotPrizeCallback = {}
local CustomCallbacksList = require(TSIL.LOCAL_FOLDER .. ".CustomCallbacks.CustomCallbacksList")

function SlotPrizeCallback:OnFrameUpdate()
    local tableUtils = TSIL.Utils.Tables

    local SlotUpdateCallbacks = tableUtils.Filter(CustomCallbacksList, function (_, customCallback)
        return customCallback.callback == TSIL.Enums.CustomCallbacks.MC_POST_SLOT_PRIZE
    end)

    for _, slot in ipairs(Isaac.FindByType(EntityType.ENTITY_SLOT)) do
        local slotSpr = slot:GetSprite()

        if slotSpr:IsEventTriggered("Prize") or slotSpr:IsEventTriggered("Disappear") then
            for _, customCallback in ipairs(SlotUpdateCallbacks) do
                local slotVariant = customCallback.params[1]

                if not slotVariant or slot.Variant == slotVariant then
                    customCallback.funct(customCallback.mod, slot, slotSpr:IsEventTriggered("Disappear"))
                end
            end
        end
    end
end

TSIL.MOD:AddCallback(ModCallbacks.MC_POST_UPDATE, SlotPrizeCallback.OnFrameUpdate)