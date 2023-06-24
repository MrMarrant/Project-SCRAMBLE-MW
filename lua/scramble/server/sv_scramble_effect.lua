if CLIENT then return end

/*
* Function that update the state server/client side of the artic NVG
* @Player ply The ent to apply the censor effect
* @number typeNVG Indicate wich type is the NVG.
* @bool isEnabled Indictate if the NVG are Enabled or not.
*/
function scramble_mw.SetParamArtic(ply, typeNVG, isEnabled)-- TODO : Je pense pas en avoir besoin
    ply:SetNWInt("nvg", typeNVG)
    ply:SetNWBool("nvg_on", isEnabled)
    net.Start(SCRAMBLE_MW_CONFIG.ScrambleUpdateParamArctic, true)
        net.WriteBool(isEnabled)
        net.WriteUInt( typeNVG, 5 )
    net.Send(ply)
end