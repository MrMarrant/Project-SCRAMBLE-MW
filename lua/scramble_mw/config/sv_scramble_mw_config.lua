if CLIENT then return end

SCRAMBLE_MW_CONFIG.IsScrambleEnable = CreateConVar( "vrnvg_scramble", 1, FCVAR_PROTECTED, "Show censor effect on SCP-096" )

util.AddNetworkString( SCRAMBLE_MW_CONFIG.ScrambleUpdateParamArctic )
util.AddNetworkString( SCRAMBLE_MW_CONFIG.CTSUpdateDrop )
util.AddNetworkString( SCRAMBLE_MW_CONFIG.UpdateConvarToClient )

scramble_mw.UpdateConvarClientSide(SCRAMBLE_MW_CONFIG.IsScrambleEnable:GetBool())