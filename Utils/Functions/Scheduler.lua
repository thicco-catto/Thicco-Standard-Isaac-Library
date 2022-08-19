local ScheduledFunctions = {}

local function OnFrameUpdate()
    TSIL.Utils.Tables.ForEach(ScheduledFunctions, function (_, scheduledFunction)
        scheduledFunction.frames = scheduledFunction.frames - 1

        if scheduledFunction.frames <= 0 then
            scheduledFunction.funct(table.unpack(scheduledFunction.params))
        end
    end)

    ScheduledFunctions = TSIL.Utils.Tables.Filter(ScheduledFunctions, function (_, scheduledFunction)
        return scheduledFunction.frames > 0
    end)
end
TSIL.MOD:AddCallback(ModCallbacks.MC_POST_UPDATE, OnFrameUpdate)

return function (funct, params, frames)
    table.insert(ScheduledFunctions, {funct = funct, params = params, frames = frames})
end