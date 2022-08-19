local VariablesToReset = require(TSIL.LOCAL_FOLDER .. ".Utils.SaveManager.VariablesToReset")

local function OnNewRoom()
    local tableUtils = TSIL.Utils.Tables

    tableUtils.ForEach(VariablesToReset, function(_, modVariables)
        local variablesToResetRoom = tableUtils.ForEach(modVariables.variables, function (_, variable)
            if variable.time == TSIL.Enums.VariableResetTime.RESET_ROOM then
                if type(variable.default) == "table" then
                    variable.value = tableUtils.Copy(variable.default)
                else
                    variable.value = variable.default
                end
            end
        end)
    end)
end
TSIL.MOD:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, OnNewRoom)

local function OnNewLevel()
    local tableUtils = TSIL.Utils.Tables

    tableUtils.ForEach(VariablesToReset, function(_, modVariables)
        local variablesToResetRoom = tableUtils.ForEach(modVariables.variables, function (_, variable)
            if variable.time == TSIL.Enums.VariableResetTime.RESET_LEVEL then
                if type(variable.default) == "table" then
                    variable.value = tableUtils.Copy(variable.default)
                else
                    variable.value = variable.default
                end
            end
        end)
    end)
end
TSIL.MOD:AddCallback(ModCallbacks.MC_POST_NEW_LEVEL, OnNewLevel)


local function OnGameStart(isContinue)
    if isContinue then return end

    local tableUtils = TSIL.Utils.Tables

    tableUtils.ForEach(VariablesToReset, function(_, modVariables)
        local variablesToResetRoom = tableUtils.ForEach(modVariables.variables, function (_, variable)
            if variable.time == TSIL.Enums.VariableResetTime.RESET_RUN then
                if type(variable.default) == "table" then
                    variable.value = tableUtils.Copy(variable.default)
                else
                    variable.value = variable.default
                end
            end
        end)
    end)
end
TSIL.MOD:AddCallback(ModCallbacks.MC_POST_GAME_STARTED, OnGameStart)