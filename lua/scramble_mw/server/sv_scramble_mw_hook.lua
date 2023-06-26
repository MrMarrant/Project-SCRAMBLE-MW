if CLIENT then return end

-- Hook from Guth swep to be detected by SCP 096
hook.Add( "vkxscp096:should_trigger", "Scramble_MW_Detect_SCP096", function(target, ply)
    if (target.vrnvgflipped and !target.vrnvgbroken and target.nvgbattery > 0 and SCRAMBLE_MW_CONFIG.IsScrambleEnable:GetBool()) then
        if (!scramble_mw.IsDetectedBySCP096()) then
            return false
        end
    end
end)