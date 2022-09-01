local CustomCallbacksList = TSIL.VERSION_PERSISTENT_DATA.CustomCallbacksList

local function OnSlotUpdate(_, slot)
    if slot.FrameCount ~= 1 then return end

    local tableUtils = TSIL.Utils.Tables

    local SlotInitCallbacks = tableUtils.Filter(CustomCallbacksList, function (_, customCallback)
        return customCallback.callback == TSIL.Enums.CustomCallbacks.MC_POST_SLOT_INIT
    end)

    local filteredCallbacks = tableUtils.Filter(SlotInitCallbacks, function(_, customCallback)
        local slotVariant = customCallback.params[1]
        return not slotVariant or slot.Variant == slotVariant
    end)

    tableUtils.ForEach(filteredCallbacks, function(_, customCallback)
        customCallback.funct(customCallback.mod, slot)
    end)
end
table.insert(TSIL.CUSTOM_CALLBACKS, {callback = TSIL.Enums.CustomCallback.MC_POST_SLOT_UPDATE, funct = OnSlotUpdate})