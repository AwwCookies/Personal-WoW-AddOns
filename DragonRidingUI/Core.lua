local f = CreateFrame("Frame")

-- all action bars in game minus main bar
local bars = {
   MultiBarBottomLeft, -- action bar 2
   MultiBarBottomRight, -- action bar 3
   MultiBarLeft, -- action bar 4
   MultiBarRight, -- action bar 5
   MultiBar5, -- action bar 6
   MultiBar6, -- action bar 7
   MultiBar7 -- action bar 9
}

local soarSpellId = 369536 -- Soar, Dracthyr Racial

-- track state
local wasDragonRiding = false

-- store Minimap position
local minimapPosition = nil

-- stores bars player had shown
local hiddenBars = {}

local function isDragonRiding()
   -- if player isn't mounted then they can't be
   -- Dragon Riding so we can return early
   if (not IsMounted()) then
      return false
   end

   local _isDragonRiding = false
   local searchText = "This is a dragonriding mount"
   
   AuraUtil.ForEachAura("player", "HELPFUL", nil, function(...)
      local spellId = select(10, ...) -- get spellID
      local spell = Spell:CreateFromSpellID(spellId)
      if (spellId == soarSpellId) then
         _isDragonRiding = true
      end
      if (string.find(spell:GetSpellDescription(), searchText) ~= nil) then
         _isDragonRiding = true
      end
   end)

   return _isDragonRiding
end

-- hide players action bars and store which ones
-- they have open
local function hideBars()
   for _, bar in pairs(bars) do
      if (bar:IsShown()) then
         bar:Hide()
         table.insert(hiddenBars, bar)
      end
   end
end

-- restore players bars
local function restoreBars()
   for _, bar in pairs(hiddenBars) do
      bar:Show()
   end
end

-- move map
local function moveMap() 
   minimapPosition = Minimap:GetPoint()
   Minimap:SetPoint("CENTER", MainMenuBar, "CENTER", 0, 200)
end

-- restore map position
local function restoreMap() 
   Minimap:SetPoint(minimapPosition)
end

f:SetScript("OnEvent", function()
   -- check if DragonRiding or using Soar
      if (isDragonRiding()) then
         hideBars() -- if Dragon Riding then hide bars
         moveMap()
         wasDragonRiding = true
      else
         if (wasDragonRiding) then
            restoreBars() -- if not show/restore bars
            restoreMap()
            wasDragonRiding = false
         end
      end
end)

f:RegisterEvent("UNIT_AURA")
f:RegisterEvent("PLAYER_LOGIN")