local LOCAL_TSIL = {}
local LOCAL_TSIL_VERSION = 1.0

function LOCAL_TSIL.Init(FolderName)
    if not TSIL then
        --If TSIL hasnt been initialized yet, initialize it
        TSIL = {}
    elseif TSIL.VERSION >= LOCAL_TSIL_VERSION then
        --If theres already an instance with a higher version, we don't need to overwrite it
        return
    end

    TSIL.MOD = RegisterMod("TSILMOD", 1)
    TSIL.VERSION = LOCAL_TSIL_VERSION
    TSIL.LOCAL_FOLDER = FolderName

    --#region Custom Callbacks
    TSIL.CUSTOM_CALLBACKS = require(TSIL.LOCAL_FOLDER .. ".Enums.CustomCallbacksEnum")
    TSIL.AddCustomCallback = require(TSIL.LOCAL_FOLDER .. ".CustomCallbacks.AddCustomCallback")
    TSIL.RemoveCustomCallback = require(TSIL.LOCAL_FOLDER .. ".CustomCallbacks.RemoveCustomCallback")

    require(TSIL.LOCAL_FOLDER .. ".CustomCallbacks.SlotCallbacks.SlotInitCallback")
    require(TSIL.LOCAL_FOLDER .. ".CustomCallbacks.SlotCallbacks.SlotUpdateCallback")
    require(TSIL.LOCAL_FOLDER .. ".CustomCallbacks.SlotCallbacks.SlotPrizeCallback")
    --#endregion

    --#region Utils
    TSIL.Utils = {}

    --#region Table Utils
    TSIL.Utils.Tables = {}
    TSIL.Utils.Tables.Filter = require(TSIL.LOCAL_FOLDER .. ".Utils.Tables.Filter")
    --#endregion
    --#endregion

    print("TSIL has been properly initialized!")
end

---@param das Entity
local function asd(das)
end

return LOCAL_TSIL