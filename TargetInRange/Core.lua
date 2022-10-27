local f = CreateFrame("frame", "TargetInRangeFrame")
local TIRString = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")

f:RegisterEvent("ADDON_LOADED")

local defaultSettings = {
    enabled = true,
    inRangeEnabled = true,
    inRangeRed = 0,
    inRangeGreen = 255,
    inRangeBlue = 0,
    inRangeAlpha = 100,
    OutOfRangeEnabled = true,
    OutOfRangeRed = 255,
    OutOfRangeGreen = 0,
    OutOfRangeBlue = 0,
    OutOfRangeAlpha = 100
}

-- TargetInRangeSettings = TargetInRangeSettings or defaultSettings
TargetInRangeSettings = defaultSettings

-- actual addon code
f:SetScript("OnUpdate", function()
    -- unit targeted
    if (UnitExists("target") and TargetInRangeSettings.enabled) then
        -- get nameplate of target
        local nameplate = C_NamePlate.GetNamePlateForUnit("target")
        -- if no nameplate or if nameplay is player nameplate
        if (nameplate == nil or GetUnitName("player") == GetUnitName("target")) then
            TIRString:Hide()
            return
        end
        -- anchor to nameplate
        TIRString:SetPoint("CENTER", nameplate, "TOP", 0, 0)
        -- if spell on action bar 1 slot 1 is in range
        if (IsActionInRange(1)) then
            TIRString:SetTextColor(
                TargetInRangeSettings.inRangeRed,
                TargetInRangeSettings.inRangeGreen,
                TargetInRangeSettings.inRangeBlue,
                TargetInRangeSettings.inRangeAlpha/100
            )
            TIRString:SetText("In Range")
            if (not TargetInRangeSettings.inRangeEnabled) then
                TIRString:SetTextColor(0,0,0,0)
            end
        else
            TIRString:SetTextColor(
                TargetInRangeSettings.OutOfRangeRed,
                TargetInRangeSettings.OutOfRangeGreen,
                TargetInRangeSettings.OutOfRangeBlue,
                TargetInRangeSettings.OutOfRangeAlpha/100
            )
            TIRString:SetText("Out of Range")
            if (not TargetInRangeSettings.OutOfRangeEnabled) then
                TIRString:SetTextColor(0,0,0,0)
            end
        end
        TIRString:Show()
    else -- no target
        TIRString:SetText("No Target")
        TIRString:Hide()
    end
end)

-- AddOn Settings Page
local function createAddOnSettings()
    local category = Settings.RegisterVerticalLayoutCategory("Target in Range")
    do
        local variable = "enabled"
        local name = "Enabled"
        local tooltip = "Enable or Disable"
        local defaultValue = true
    
        local setting = Settings.RegisterProxySetting(category, variable, TargetInRangeSettings, type(defaultValue), name, defaultValue)
        Settings.CreateCheckBox(category, setting, tooltip)
    end

    -- In Range Color Settings Page
    local subcategoryInRange = Settings.RegisterVerticalLayoutSubcategory(category, "In-Range Settings");
    -- Enabled/Disabled
    do
        local variable = "inRangeEnabled"
        local name = "Enabled"
        local tooltip = "Enable or Disable"
        local defaultValue = true
    
        local setting = Settings.RegisterProxySetting(subcategoryInRange, variable, TargetInRangeSettings, type(defaultValue), name, defaultValue)
        Settings.CreateCheckBox(subcategoryInRange, setting, tooltip)
    end
    -- red value
    do
        local variable, name, tooltip = "inRangeRed", "Red", "Red Value"
        local defaultValue = TargetInRangeSettings.inRangeRed
        local setting = Settings.RegisterProxySetting(
            subcategoryInRange, variable, TargetInRangeSettings, type(defaultValue), name, defaultValue
        )
        local options = Settings.CreateSliderOptions(0, 255, 1)
        options:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right);
        Settings.CreateSlider(subcategoryInRange, setting, options, tooltip)
    end
    -- -- green value
    do
        local variable, name, tooltip = "inRangeGreen", "Green", "Green Value"
        local defaultValue = TargetInRangeSettings.inRangeGreen
        local setting = Settings.RegisterProxySetting(
            subcategoryInRange, variable, TargetInRangeSettings, type(defaultValue), name, defaultValue
        )
        local options = Settings.CreateSliderOptions(0, 255, 1)
        options:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right);
        Settings.CreateSlider(subcategoryInRange, setting, options, tooltip)
    end
    -- -- blue value
    do
        local variable, name, tooltip = "inRangeBlue", "Blue", "Blue Value"
        local defaultValue = TargetInRangeSettings.inRangeBlue
        local setting = Settings.RegisterProxySetting(
            subcategoryInRange, variable, TargetInRangeSettings, type(defaultValue), name, defaultValue
        )
        local options = Settings.CreateSliderOptions(0, 255, 1)
        options:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right);
        Settings.CreateSlider(subcategoryInRange, setting, options, tooltip)
    end
    -- alpha value
    do
        local variable, name, tooltip = "inRangeAlpha", "Alpha", "Alpha Value"
        local defaultValue = TargetInRangeSettings.inRangeAlpha
        local setting = Settings.RegisterProxySetting(
            subcategoryInRange, variable, TargetInRangeSettings, type(defaultValue), name, defaultValue
        )
        local options = Settings.CreateSliderOptions(0, 100, 1)
        options:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right);
        Settings.CreateSlider(subcategoryInRange, setting, options, tooltip)
    end

    -- Out Of Range Color Settings Page
    local subcategoryOutOfRange = Settings.RegisterVerticalLayoutSubcategory(category, "Out-Of-Range Settings");
    -- Enabled/Disabled
    do
        local variable = "OutOfRangeEnabled"
        local name = "Enabled"
        local tooltip = "Enable or Disable"
        local defaultValue = true
    
        local setting = Settings.RegisterProxySetting(subcategoryOutOfRange, variable, TargetInRangeSettings, type(defaultValue), name, defaultValue)
        Settings.CreateCheckBox(subcategoryOutOfRange, setting, tooltip)
    end
    -- red value
    do
        local variable, name, tooltip = "OutOfRangeRed", "Red", "Red Value"
        local defaultValue = TargetInRangeSettings.OutOfRangeRed
        local setting = Settings.RegisterProxySetting(
            subcategoryOutOfRange, variable, TargetInRangeSettings, type(defaultValue), name, defaultValue
        )
        local options = Settings.CreateSliderOptions(0, 255, 1)
        options:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right);
        Settings.CreateSlider(subcategoryOutOfRange, setting, options, tooltip)
    end
    -- -- green value
    do
        local variable, name, tooltip = "OutOfRangeGreen", "Green", "Green Value"
        local defaultValue = TargetInRangeSettings.OutOfRangeGreen
        local setting = Settings.RegisterProxySetting(
            subcategoryOutOfRange, variable, TargetInRangeSettings, type(defaultValue), name, defaultValue
        )
        local options = Settings.CreateSliderOptions(0, 255, 1)
        options:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right);
        Settings.CreateSlider(subcategoryOutOfRange, setting, options, tooltip)
    end
    -- -- blue value
    do
        local variable, name, tooltip = "OutOfRangeBlue", "Blue", "Blue Value"
        local defaultValue = TargetInRangeSettings.OutOfRangeBlue
        local setting = Settings.RegisterProxySetting(
            subcategoryOutOfRange, variable, TargetInRangeSettings, type(defaultValue), name, defaultValue
        )
        local options = Settings.CreateSliderOptions(0, 255, 1)
        options:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right);
        Settings.CreateSlider(subcategoryOutOfRange, setting, options, tooltip)
    end
    -- alpha value
    do
        local variable, name, tooltip = "OutOfRangeAlpha", "Alpha", "Alpha Value"
        local defaultValue = TargetInRangeSettings.OutOfRangeAlpha
        local setting = Settings.RegisterProxySetting(
            subcategoryOutOfRange, variable, TargetInRangeSettings, type(defaultValue), name, defaultValue
        )
        local options = Settings.CreateSliderOptions(0, 100, 1)
        options:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right);
        Settings.CreateSlider(subcategoryOutOfRange, setting, options, tooltip)
    end

    Settings.RegisterAddOnCategory(category)
end

-- f:SetScript("OnEvent", function(self, event, addonName)
--     if (event == "ADDON_LOADED" and addonName == "TargetInRange") then
--         createAddOnSettings()
--     end
-- end)