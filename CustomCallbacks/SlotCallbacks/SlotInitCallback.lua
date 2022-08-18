local SlotInitCallback = {}
local CustomCallbacksList = require(TSIL.LOCAL_FOLDER .. ".CustomCallbacks.CustomCallbacksList")

function SlotInitCallback:OnFrameUpdate()
    local tableUtils = TSIL.Utils.Tables

    local SlotUpdateCallbacks = tableUtils.Filter(CustomCallbacksList, function (customCallback)
        return customCallback.callback == TSIL.CUSTOM_CALLBACKS.MC_POST_SLOT_INIT
    end)

    for _, slot in ipairs(Isaac.FindByType(EntityType.ENTITY_SLOT)) do
        if slot.FrameCount == 1 then
            for _, customCallback in ipairs(SlotUpdateCallbacks) do
                local slotVariant = customCallback.params[1]

                if not slotVariant or slot.Variant == slotVariant then
                    customCallback.funct(customCallback.mod, slot)
                end
            end
        end
    end
end

TSIL.MOD:AddCallback(ModCallbacks.MC_POST_UPDATE, SlotInitCallback.OnFrameUpdate)