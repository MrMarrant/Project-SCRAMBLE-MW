if CLIENT then return end

local CacheIsScrambleEnable = SCRAMBLE_MW_CONFIG.IsScrambleEnable

-- Hook from Guth swep to be detected by SCP 096
hook.Add( "vkxscp096:should_trigger", "Scramble_MW_Detect_SCP096", function(target, ply)
    if (target.vrnvgflipped and !target.vrnvgbroken and target.nvgbattery > 0 and SCRAMBLE_MW_CONFIG.IsScrambleEnable:GetBool()) then
        if (!scramble_mw.IsDetectedBySCP096()) then
            return false
        end
    end
end)

hook.Add("Think", "CheckUpdate_Scramble_MW_Percent", function()
    if (CacheIsScrambleEnable != SCRAMBLE_MW_CONFIG.IsScrambleEnable) then
        scramble_mw.UpdateConvarClientSide(SCRAMBLE_MW_CONFIG.IsScrambleEnable)
        CacheIsScrambleEnable = SCRAMBLE_MW_CONFIG.IsScrambleEnable
    end
end)