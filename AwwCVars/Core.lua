local f = CreateFrame("Frame")

local cvars = {
    ["SoftTargetInteract"] = "3",
    ["SoftTargetEnemy"] = "3",
    ["SoftTargetTooltipEnemy"] = "1",
    ["SoftTargetInteractArc"] = "2",
    ["SoftTargetInteractRange"] = "30",
}

f:SetScript("OnEvent", function()
    for name, value in pairs(cvars) do
        print("Setting CVar", name, " to ", value)
        SetCVar(name, value)
    end
end)

f:RegisterEvent("PLAYER_LOGIN")