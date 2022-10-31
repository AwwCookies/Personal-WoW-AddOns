local f = CreateFrame("Frame")

-- https://wowpedia.fandom.com/wiki/Patch_10.0.0/API_changes

local cvars = {
    ["SoftTargetInteract"] = "3", -- enable keypress interaction
    ["SoftTargetEnemy"] = "3", -- enable action targeting
    ["SoftTargetTooltipEnemy"] = "1", -- Enable tooltips on mobs no mouseover
    ["SoftTargetTooltipFriend"] = "1", -- enable tool tips on friendly no mouseover
    ["SoftTargetInteractArc"] = "2", -- set yaw allowence to be anywhere in targeting area
    ["SoftTargetInteractRange"] = "30", -- set interaction range (may be removed)
    ["SoftTargetIconInteract"] = "1", -- enable soft target icons
    ["SoftTargetIconGameObject"] = "1", -- enable icons over game objects
    ["SoftTargetLowPriorityIcons"] = "1", -- enable loot icons 
    ["empowerTapControls"] = "1", -- enable press and tap empowered spells
    ["ActionButtonUseKeyHeldSpell"] = "1", -- enable press and hold casting
}

f:SetScript("OnEvent", function()
    for name, value in pairs(cvars) do
        print("Setting CVar", name, "to", value)
        SetCVar(name, value)
    end
end)

f:RegisterEvent("PLAYER_LOGIN")