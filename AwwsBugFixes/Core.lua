local f = CreateFrame("Frame")

f:SetScript("OnEvent", function() 
    print("Enabling Interact Key")
    -- press key to interact with stuff
    SetCVar("SoftTargetInteract", "3")
    -- action combat
    print("Enabling Action Combat")
    SetCVar("SoftTargetEnemy", "3")
    -- show target tool tips without needing
    -- to hard tab them
    print("Enabling Show Target Tooltip")
    SetCVar("SoftTargetTooltipEnemy", "1")
end)

f:RegisterEvent("PLAYER_LOGIN")