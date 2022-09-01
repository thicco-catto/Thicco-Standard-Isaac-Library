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
table.insert(TSIL.CALLBACKS, {callback = ModCallbacks.MC_POST_UPDATE, funct = OnFrameUpdate})

---Runs a function in a given number of frames.
---@param funct function
---@param frames integer
---@param ... any
return function (funct, frames, ...)
    local args = {...}
    table.insert(ScheduledFunctions, {funct = funct, frames = frames, params = args})
end