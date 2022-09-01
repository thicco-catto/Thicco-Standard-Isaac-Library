local FunctionsToRun = {}

local function OnNewRoom()
    TSIL.Utils.Tables.ForEach(FunctionsToRun, function (_, functionToRun)
        functionToRun.funct(table.unpack(functionToRun.params))
    end)

    FunctionsToRun = {}
end
table.insert(TSIL.CALLBACKS, {callback = ModCallbacks.MC_POST_NEW_ROOM, funct = OnNewRoom})

---Runs a given function on the next room
---@param funct function
---@param ... any
return function (funct, ...)
    local args = {...}

    table.insert(FunctionsToRun, {funct = funct, params = args})
end