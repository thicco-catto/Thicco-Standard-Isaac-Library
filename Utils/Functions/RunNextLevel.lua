local FunctionsToRun = {}

local function OnNewLevel()
    TSIL.Utils.Tables.ForEach(FunctionsToRun, function (_, functionToRun)
        functionToRun.funct(table.unpack(functionToRun.params))
    end)

    FunctionsToRun = {}
end
table.insert(TSIL.CALLBACKS, {callback = ModCallbacks.MC_POST_NEW_LEVEL, funct = OnNewLevel})

---Runs a given function on the next level
---@param funct function
---@param ... any
function TSIL.Utils.Functions.RunNextLevel(funct, ...)
    local args = {...}

    table.insert(FunctionsToRun, {funct = funct, params = args})
end