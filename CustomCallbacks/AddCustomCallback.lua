local CustomCallbacksList = TSIL.VERSION_PERSISTENT_DATA.CustomCallbacksList

---@param mod table
---@param callback CustomCallback
---@param funct function
---@param ... any
function TSIL.AddCustomCallback(mod, callback, funct, ...)
    local args = {...}
    table.insert(CustomCallbacksList, {mod = mod, callback = callback, funct = funct, params = args})
end