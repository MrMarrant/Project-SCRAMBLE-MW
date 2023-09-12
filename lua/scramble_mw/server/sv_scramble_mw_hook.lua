if CLIENT then return end

local CacheIsScrambleEnable = true

--! Old Hook for the SCP-096 detection
-- Hook from Guth swep to be detected by SCP 096
hook.Add( "vkxscp096:should_trigger", "vkxscp096_Scramble_MW_Detect_SCP096", function(target, ply)
    if (target.vrnvgflipped and !target.vrnvgbroken and target.nvgbattery > 0 and SCRAMBLE_MW_CONFIG.IsScrambleEnable:GetBool()) then
        if (!scramble_mw.IsDetectedBySCP096()) then
            return false
        end
    end
end)

--? New Hook for the SCP-096 detection
-- Hook from Guth swep to be detected by SCP 096
hook.Add( "guthscp096:should_trigger", "guthscp096_Scramble_MW_Detect_SCP096", function(target, ply)
    if (target.vrnvgflipped and !target.vrnvgbroken and target.nvgbattery > 0 and SCRAMBLE_MW_CONFIG.IsScrambleEnable:GetBool()) then
        if (!scramble_mw.IsDetectedBySCP096()) then
            return false
        end
    end
end)

hook.Add("Think", "CheckUpdate_Scramble_MW_Percent", function()
    local IsScrambleEnable = SCRAMBLE_MW_CONFIG.IsScrambleEnable:GetBool()
    if (CacheIsScrambleEnable !=  IsScrambleEnable) then
        scramble_mw.UpdateConvarClientSide(IsScrambleEnable)
        CacheIsScrambleEnable = IsScrambleEnable
    end
end)