local f = CreateFrame("Frame")

local cvars = {
    ["SoftTargetInteract"] = "3", -- enable keypress interaction
    ["SoftTargetEnemy"] = "3", -- enable action targeting
    ["SoftTargetTooltipEnemy"] = "1", -- Enable tooltips on mobs no mouseover
    ["SoftTargetInteractArc"] = "2", -- ?
    ["SoftTargetInteractRange"] = "30", -- set interaction range (may be removed)
    ["SoftTargetLowPriorityIcons"] = "1", -- enable loot icons 
}

f:SetScript("OnEvent", function()
    for name, value in pairs(cvars) do
        print("Setting CVar", name, " to ", value)
        SetCVar(name, value)
    end
end)

f:RegisterEvent("PLAYER_LOGIN")