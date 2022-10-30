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
    -- This will allow you to interact with the bobber no matter which way you are facing.
    print("Setting TargetInteract Arc to 2")
    SetCVar("SoftTargetInteractArc", "2")
    -- Set interact range
    print("Setting SoftTargetRange to 30")
    SetCVar("SoftTargetInteractRange", "30")
end)

f:RegisterEvent("PLAYER_LOGIN")