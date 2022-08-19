local VariablesToReset = require(TSIL.LOCAL_FOLDER .. ".Utils.SaveManager.VariablesToReset")

return function(mod, variableName, default, time)
    local tableUtils = TSIL.Utils.Tables
    if type(default) == "table" then
        default = tableUtils.Copy(default)
    end

    local modVariables = tableUtils.FindFirst(VariablesToReset, function (_, modVariables)
        return modVariables.mod == mod
    end)

    if modVariables == nil then
        modVariables = {mod = mod, variables = {}}
    end

    local existingVariable = tableUtils.FindFirst(modVariables.variables, function (_, variable)
        return variable.name == variableName
    end)

    if existingVariable == nil then
        existingVariable.default = default
        existingVariable.value = tableUtils.Copy(default)
        existingVariable.time = time
    else
        table.insert(modVariables, {name = variableName, default = default, value = tableUtils.Copy(default), time = time})
    end
end