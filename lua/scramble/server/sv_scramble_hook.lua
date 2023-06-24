if CLIENT then return end

-- Hook from Guth swep to be detected by SCP 096
hook.Add( "vkxscp096:should_trigger", "Scramble_MW_Detect_SCP096", function(target, ply)
    if (target:GetNWInt("nvg", 0) == 7 and target:GetNWBool("nvg_on", false)) then -- TODO : Check la condition pour le MW
        if (!scramble_mw.IsDetectedBySCP096()) then
            return false
        end
    end
end)

-- Hook for update the state of the artic NVG
hook.Add( "PlayerDeath", "PlayerDeath.Scramble_Artic_Update", function( victim, inflictor, attacker )
end )

hook.Add( "PlayerChangedTeam", "PlayerChangedTeam.Scramble_Artic_Update", function( ply )
end )