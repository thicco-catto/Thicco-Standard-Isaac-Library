local CustomCallbacksList = require(TSIL.LOCAL_FOLDER .. ".CustomCallbacks.CustomCallbacksList")

return function(mod, callback, funct)
    for index, customCallback in ipairs(CustomCallbacksList) do
        if mod == customCallback.mod and callback == customCallback.callback and funct == customCallback.funct then
            table.remove(CustomCallbacksList, index)
            break
        end
    end
end