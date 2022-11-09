local f = CreateFrame("Frame")


hooksecurefunc(TargetFrame, "CheckClassification", function (self)
    local classification = UnitClassification(self.unit);
    local bossPortraitFrameTexture = self.TargetFrameContainer.BossPortraitFrameTexture;
    if (classification == "rareelite") then
        bossPortraitFrameTexture:SetTexture([[interface/Addons/OldRareDragonArt/dragon-frame.tga]]);
        bossPortraitFrameTexture:SetTexCoord(0.00390625, 0.7734375, 0.001953125, 0.31640625)
        bossPortraitFrameTexture:SetSize(99, 81);
        bossPortraitFrameTexture:SetPoint("TOPRIGHT", 8, -8);
        bossPortraitFrameTexture:Show();
    elseif (classification == "rare") then
        bossPortraitFrameTexture:SetTexture([[interface/Addons/OldRareDragonArt/dragon-frame.tga]]);
        bossPortraitFrameTexture:SetTexCoord(0.00390625, 0.6328125, 0.501953125, 0.81640625)
        bossPortraitFrameTexture:SetSize(80, 79);
        bossPortraitFrameTexture:SetPoint("TOPRIGHT", -11, -8);
        bossPortraitFrameTexture:Show();
    else
        bossPortraitFrameTexture:SetTexCoord(0, 1, 0, 1) -- Reset coords so no more squished dragons
    end

    self.TargetFrameContent.TargetFrameContentContextual.BossIcon:Hide();
end);



f:SetScript("OnUpdate", function (x) 
    local nameplates = C_NamePlate.GetNamePlates()
    for i, nameplate in ipairs(nameplates) do
        local classification = UnitClassification("target")
       
        if (classification == "rare" and nameplate.UnitFrame.ClassificationFrame) then
            local cframe = nameplate.UnitFrame.ClassificationFrame.classificationIndicator
            cframe:SetTexture([[interface/Addons/OldRareDragonArt/dragon.blp]]);
            cframe:SetPoint("CENTER", -1, 0);
        end
    end
end)