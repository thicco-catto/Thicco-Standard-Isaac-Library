local FunctionsToRun = {}

local function OnNewRoom()
    TSIL.Utils.Tables.ForEach(FunctionsToRun, function (_, functionToRun)
        functionToRun.funct(table.unpack(functionToRun.params))
    end)

    FunctionsToRun = {}
end
TSIL.MOD:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, OnNewRoom)

return function (funct, ...)
    local args = {...}

    table.insert(FunctionsToRun, {funct = funct, params = args})
end