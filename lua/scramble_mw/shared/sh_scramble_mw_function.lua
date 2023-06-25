/*
* Return true if the entity will be detected SCP 096.
*/
function scramble_mw.IsDetectedBySCP096()
    local percent = SCRAMBLE_MW_CONFIG.ScramblePercent:GetFloat()
    assert(percent >= 0 and percent <= 100)
    return percent >= math.Rand(1, 100)
end