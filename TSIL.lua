local LOCAL_TSIL = {}
local LOCAL_TSIL_VERSION = 0.1

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
    TSIL.Enums = {
        --For TSIL itself
        CustomCallbacks = require(TSIL.LOCAL_FOLDER .. ".Enums.CustomCallbacks"),
        InventoryType = require(TSIL.LOCAL_FOLDER .. ".Enums.InventoryType"),
        VariableResetTime = require(TSIL.LOCAL_FOLDER .. ".Enums.VariableResetTime"),
        --For ingame stuff
        SlotVariant = require(TSIL.LOCAL_FOLDER .. ".Enums.SlotVariant"),
    }
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
    TSIL.Utils = {
        Tables = {
            Copy = require(TSIL.LOCAL_FOLDER .. ".Utils.Tables.Copy"),
            Count = require(TSIL.LOCAL_FOLDER .. ".Utils.Tables.Count"),
            Filter = require(TSIL.LOCAL_FOLDER .. ".Utils.Tables.Filter"),
            FindFirst = require(TSIL.LOCAL_FOLDER .. ".Utils.Tables.FindFirst"),
            ForEach = require(TSIL.LOCAL_FOLDER .. ".Utils.Tables.ForEach"),
            IsInTable = require(TSIL.LOCAL_FOLDER .. ".Utils.Tables.IsInTable"),
        },

        Random = {
            GetRandomElementsFromTable = require(TSIL.LOCAL_FOLDER .. ".Utils.Random.RandomFromTable"),
            GetRandomIntegerInRange = require(TSIL.LOCAL_FOLDER .. ".Utils.Random.RandomInt"),
            GetRandomElementFromWeightedList = require(TSIL.LOCAL_FOLDER .. ".Utils.Random.RandomFromWeighted"),
        },

        Functions = {
            RunInFrames = require(TSIL.LOCAL_FOLDER .. ".Utils.Functions.Scheduler"),
            RunNextRoom = require(TSIL.LOCAL_FOLDER .. ".Utils.Functions.RunNextRoom"),
        },

        Flags = {
            AddFlags = require(TSIL.LOCAL_FOLDER .. ".Utils.Flags.AddFlags"),
            HasFlags = require(TSIL.LOCAL_FOLDER .. ".Utils.Flags.HasFlags"),
            RemoveFlags = require(TSIL.LOCAL_FOLDER .. ".Utils.Flags.RemoveFlags"),
        },

        SaveManager = {
            AddVariableToReset = require(TSIL.LOCAL_FOLDER .. ".Utils.SaveManager.AddVariableToReset"),
            GetVariabeToResetValue = require(TSIL.LOCAL_FOLDER .. ".Utils.SaveManager.GetVariableToReset"),
            SetVariableToResetValue = require(TSIL.LOCAL_FOLDER .. ".Utils.SaveManager.SetVariableToReset"),
        },
    }

    --This takes care of resetting all the variables in the save manager
    require(TSIL.LOCAL_FOLDER .. ".Utils.SaveManager.VariableResetter")

    --#endregion

    --#region Collectibles
    TSIL.Collectibles = {
        GetCollectibles = require(TSIL.LOCAL_FOLDER .. ".Collectibles.GetCollectibles"),
        GetCollectiblesByQuality = require(TSIL.LOCAL_FOLDER .. ".Collectibles.GetCollectiblesByQuality")
    }
    --#endregion

    --#region Players
    TSIL.Players = {
        GetPlayers = require(TSIL.LOCAL_FOLDER .. ".Players.GetPlayers.GetPlayers"),
        GetPlayerIndex = require(TSIL.LOCAL_FOLDER .. ".Players.PlayerIndex.PlayerIndex"),
        GetPlayerByIndex = require(TSIL.LOCAL_FOLDER .. ".Players.PlayerIndex.PlayerByIndex"),
        GetSmeltedTrinketMultiplier = require(TSIL.LOCAL_FOLDER .. ".Players.SmeltedTrinketMultiplier"),
        GetPlayerInventory = require(TSIL.LOCAL_FOLDER .. ".Players.PlayerInventory"),
        DoesAnyPlayerHasItem = require(TSIL.LOCAL_FOLDER .. ".Players.AnyPlayerHasItem"),
        DoesAnyPlayerHasTrinket = require(TSIL.LOCAL_FOLDER .. ".Players.AnyPlayerHasTrinket"),
        IsActiveTaintedLazForm = require(TSIL.LOCAL_FOLDER .. ".Players.TaintedLaz.IsActiveBirthright"),
    }
    --#endregion

    --#region Grid Entities
    TSIL.GridEntities = {
        GetGridEntities = require(TSIL.LOCAL_FOLDER .. ".GridEntities.GetGridEntities"),
    }
    --#endregion

    print("TSIL (" .. TSIL.VERSION .. ") has been properly initialized.")
end

return LOCAL_TSIL