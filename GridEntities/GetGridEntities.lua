return function (isBlackList, ...)
    if isBlackList == nil then
        isBlackList = true
    end

    local IsInTable = TSIL.Utils.Tables.IsInTable
    local blackList = {...}

    local gridEntities = {}

    local room = Game():GetRoom()

    for i = 0, room:GetGridSize() - 1, 1 do
        local gridEntity = room:GetGridEntity(i)

        if gridEntity then
            if (isBlackList and not IsInTable(blackList, gridEntity:GetType())) or
            (not isBlackList and IsInTable(blackList, gridEntity:GetType())) then
                table.insert(gridEntities, gridEntity)
            end
        end
    end

    return gridEntities
end