local CustomCallbacksList = require(TSIL.LOCAL_FOLDER .. ".CustomCallbacks.CustomCallbacksList")

return function(mod, callback, funct, ...)
    local args = {...}
    table.insert(CustomCallbacksList, {mod = mod, callback = callback, funct = funct, params = args})
end