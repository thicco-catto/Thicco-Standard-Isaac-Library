local VariablesToReset = require(TSIL.LOCAL_FOLDER .. ".Utils.SaveManager.VariablesToReset")


return function (mod, variableName, value)
    local tableUtils = TSIL.Utils.Tables

    local modVariables = tableUtils.FindFirst(VariablesToReset, function (_, modVariables)
        return modVariables.mod == mod
    end)

    local existingVariable = tableUtils.FindFirst(modVariables.variables, function (_, variable)
        return variable.name == variableName
    end)

    existingVariable.value = value
end