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

    --#region Custom Enums
    TSIL.Enums = {}
    --For TSIL itself
    TSIL.Enums.CustomCallbacks = require(TSIL.LOCAL_FOLDER .. ".Enums.CustomCallbacks")
    TSIL.Enums.InventoryType = require(TSIL.LOCAL_FOLDER .. ".Enums.InventoryType")
    TSIL.Enums.VariableResetTime = require(TSIL.LOCAL_FOLDER .. ".Enums.VariableResetTime")
    --For ingame stuff
    TSIL.Enums.SlotVariant = require(TSIL.LOCAL_FOLDER .. ".Enums.SlotVariant")
    --#endregion

    --#region Custom Callbacks
    TSIL.AddCustomCallback = require(TSIL.LOCAL_FOLDER .. ".CustomCallbacks.AddCustomCallback")
    TSIL.RemoveCustomCallback = require(TSIL.LOCAL_FOLDER .. ".CustomCallbacks.RemoveCustomCallback")

    require(TSIL.LOCAL_FOLDER .. ".CustomCallbacks.SlotCallbacks.SlotInitCallback")
    require(TSIL.LOCAL_FOLDER .. ".CustomCallbacks.SlotCallbacks.SlotUpdateCallback")
    require(TSIL.LOCAL_FOLDER .. ".CustomCallbacks.SlotCallbacks.SlotPrizeCallback")

    require(TSIL.LOCAL_FOLDER .. ".CustomCallbacks.GridEntityCallbacks.GridUpdateCallback")
    --#endregion

    --#region Utils
    TSIL.Utils = {}

    --#region Table Utils
    TSIL.Utils.Tables = {}
    TSIL.Utils.Tables.Copy = require(TSIL.LOCAL_FOLDER .. ".Utils.Tables.Copy")
    TSIL.Utils.Tables.Count = require(TSIL.LOCAL_FOLDER .. ".Utils.Tables.Count")
    TSIL.Utils.Tables.Filter = require(TSIL.LOCAL_FOLDER .. ".Utils.Tables.Filter")
    TSIL.Utils.Tables.FindFirst = require(TSIL.LOCAL_FOLDER .. ".Utils.Tables.FindFirst")
    TSIL.Utils.Tables.ForEach = require(TSIL.LOCAL_FOLDER .. ".Utils.Tables.ForEach")
    TSIL.Utils.Tables.IsInTable = require(TSIL.LOCAL_FOLDER .. ".Utils.Tables.IsInTable")
    --#endregion

    --#region Random Utils
    TSIL.Utils.Random = {}
    TSIL.Utils.Random.GetRandomElementsFromTable = require(TSIL.LOCAL_FOLDER .. ".Utils.Random.RandomFromTable")
    TSIL.Utils.Random.GetRandomIntegerInRange = require(TSIL.LOCAL_FOLDER .. ".Utils.Random.RandomInt")
    TSIL.Utils.Random.GetRandomElementFromWeightedList = require(TSIL.LOCAL_FOLDER .. ".Utils.Random.RandomFromWeighted")
    --#endregion

    --#region Function Utils
    TSIL.Utils.Functions = {}
    TSIL.Utils.Functions.RunInFrames = require(TSIL.LOCAL_FOLDER .. ".Utils.Functions.Scheduler")
    TSIL.Utils.Functions.RunNextRoom = require(TSIL.LOCAL_FOLDER .. ".Utils.Functions.RunNextRoom")
    --#endregion

    --#region Flags Utils
    TSIL.Utils.Flags = {}
    TSIL.Utils.Flags.AddFlags = require(TSIL.LOCAL_FOLDER .. ".Utils.Flags.AddFlags")
    TSIL.Utils.Flags.HasFlags = require(TSIL.LOCAL_FOLDER .. ".Utils.Flags.HasFlags")
    TSIL.Utils.Flags.RemoveFlags = require(TSIL.LOCAL_FOLDER .. ".Utils.Flags.RemoveFlags")
    --#endregion

    --#region SaveManager Utils
    TSIL.Utils.SaveManager = {}
    TSIL.Utils.SaveManager.AddVariableToReset = require(TSIL.LOCAL_FOLDER .. ".Utils.SaveManager.AddVariableToReset")
    TSIL.Utils.SaveManager.GetVariabeToResetValue = require(TSIL.LOCAL_FOLDER .. ".Utils.SaveManager.GetVariableToReset")
    TSIL.Utils.SaveManager.SetVariableToResetValue = require(TSIL.LOCAL_FOLDER .. ".Utils.SaveManager.SetVariableToReset")
    require(TSIL.LOCAL_FOLDER .. ".Utils.SaveManager.VariableResetter")
    --#endregion

    --#region Players
    TSIL.Players = {}
    TSIL.Players.GetPlayers = require(TSIL.LOCAL_FOLDER .. ".Players.GetPlayers.GetPlayers")
    TSIL.Players.GetPlayerIndex = require(TSIL.LOCAL_FOLDER .. ".Players.PlayerIndex.PlayerIndex")
    TSIL.Players.GetPlayerByIndex = require(TSIL.LOCAL_FOLDER .. ".Players.PlayerIndex.PlayerByIndex")
    TSIL.Players.GetSmeltedTrinketMultiplier = require(TSIL.LOCAL_FOLDER .. ".Players.SmeltedTrinketMultiplier")
    TSIL.Players.GetPlayerInventory = require(TSIL.LOCAL_FOLDER .. ".Players.PlayerInventory")
    TSIL.Players.DoesAnyPlayerHasItem = require(TSIL.LOCAL_FOLDER .. ".Players.AnyPlayerHasItem")
    TSIL.Players.DoesAnyPlayerHasTrinket = require(TSIL.LOCAL_FOLDER .. ".Players.AnyPlayerHasTrinket")
    TSIL.Players.IsActiveTaintedLazForm = require(TSIL.LOCAL_FOLDER .. ".Players.TaintedLaz.IsActiveBirthright")
    --#endregion

    --#region Grid Entities
    TSIL.GridEntities = {}
    TSIL.GridEntities.GetGridEntities = require(TSIL.LOCAL_FOLDER .. ".GridEntities.GetGridEntities")
    --#endregion

    print("TSIL (" .. TSIL.VERSION .. ") has been properly initialized.")
end

return LOCAL_TSIL