local disableAllSelectionSounds = true -- Set to false when you configure your own

local disableSoundsForUnitIDs = {
    -- "url0001", -- Cybran Commander
    -- "url0105" -- Cybran engineer
}

local disableSoundsForUnitCategories = {
    -- categories.STRUCTURE * categories.RADAR, -- Radars
    -- categories.BOMBER * categories.ANTINAVY, -- Torpedo bombers
}

function PlaySelectionSound(newSelection)
    if playSelectionSound and not disableAllSelectionSounds then
        for k, unit in newSelection do

            local unitID = unit:GetUnitId()

            -- LOG(unitID -- Uncomment to print unit id in log when selecting them

            if contains(disableSoundsForUnitIDs, unitID) then
                return
            end

            for k, v in disableSoundsForUnitCategories do
                if EntityCategoryContains(v, unit) then
                    return
                end
            end

            local bp = unit:GetBlueprint()

            if bp.Audio.UISelection then
                PlaySound(bp.Audio.UISelection)
                return
            end
        end
    end
end

function contains(table, val)
    for i, v in ipairs(table) do
        if v == val then
            return true
        end
    end
    return false
end
