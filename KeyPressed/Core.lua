-- is addon is enabled
local enabled = true

-- https://www.wowhead.com/icon=450908/misc-arrowright
local iconArrowRight = "450908"

-- https://www.wowhead.com/icon=450905/misc-arrowdown
local iconArrowDown = "450905"

local KeyPressedFrame = CreateFrame("Frame", "KeyPressedFrame", UIParent)
KeyPressedFrame:SetSize(32, 32)
KeyPressedFrame:ClearAllPoints()
KeyPressedFrame:SetPoint("CENTER")
KeyPressedFrame:Show()


local shift = KeyPressedFrame:CreateTexture()
shift:SetSize(32, 32)
shift:SetTexture(iconArrowRight)
shift:SetPoint("BOTTOMRIGHT", MultiBarBottomRight, "BOTTOMLEFT", -5, 8)
shift:Hide()

local ctrl = KeyPressedFrame:CreateTexture()
ctrl:SetSize(32, 32)
ctrl:SetTexture(iconArrowRight)
ctrl:SetPoint("BOTTOMRIGHT", MultiBarBottomLeft, "BOTTOMLEFT", -5, 8)
ctrl:Hide()

local alt = KeyPressedFrame:CreateTexture()
alt:SetSize(32, 32)
alt:SetTexture(iconArrowRight)
alt:SetPoint("BOTTOMRIGHT", MultiBar5, "BOTTOMLEFT", -5, 8)
alt:Hide()

local ctrlAlt = KeyPressedFrame:CreateTexture()
ctrlAlt:SetSize(32, 32)
ctrlAlt:SetTexture(iconArrowDown)
ctrlAlt:SetPoint("BOTTOMRIGHT", MultiBarRight, "TOP", 16, 5)
ctrlAlt:Hide()

local altShift = KeyPressedFrame:CreateTexture()
altShift:SetSize(32, 32)
altShift:SetTexture(iconArrowDown)
altShift:SetPoint("BOTTOMRIGHT", MultiBarLeft, "TOP", 16, 5)
altShift:Hide()

-- Hide all arrows
local function hideArrows ()
    shift:Hide()
    ctrl:Hide()
    alt:Hide()
    ctrlAlt:Hide()
    altShift:Hide()
end


-- hook onto update function
KeyPressedFrame:SetScript("OnUpdate", function()
    if (enabled and IsModifierKeyDown()) then
        hideArrows()
        if (IsControlKeyDown() and IsAltKeyDown()) then
            ctrlAlt:Show()
            return
        end
        if (IsAltKeyDown() and IsShiftKeyDown()) then
            altShift:Show()
            return
        end
        if (IsControlKeyDown() and IsShiftKeyDown()) then
            -- do something here
        end
        if (IsControlKeyDown()) then
            ctrl:Show()
        end
        if(IsShiftKeyDown()) then
            shift:Show()
        end
        if(IsAltKeyDown()) then
            alt:Show()
        end
    else
        hideArrows()
    end
end)

-- Register slash commands

-- /kpenable true
-- /kpenable false

SLASH_KPENABLE1 = "/kpenable"
SlashCmdList["KPENABLE"] = function(msg)
   if (msg == "on") then
    enabled = true
   elseif (msg == "off") then
    enabled = false
   end
   print("KeyPressed enabled: ", enabled)
end