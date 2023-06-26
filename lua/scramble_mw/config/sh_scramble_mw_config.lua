SCRAMBLE_MW_CONFIG.ScrambleUpdateParamArctic = "SCRAMBLE_MW_CONFIG.ScrambleUpdateParamArctic"
SCRAMBLE_MW_CONFIG.CTSUpdateDrop = "SCRAMBLE_MW_CONFIG.CTSUpdateDrop"

SCRAMBLE_MW_CONFIG.IsScrambleEnable = CreateConVar( "vrnvg_scramble", 1, { FCVAR_CLIENTCMD_CAN_EXECUTE, FCVAR_ARCHIVE }, "Show censor effect on SCP-096" )

-- DIRECTORY DATA FOLDER
if not file.Exists("data_scramble_mw", "DATA") then
    file.CreateDir("data_scramble_mw")
end

if not file.Exists(SCRAMBLE_MW_CONFIG.PathConfigFile, "DATA") then
    file.Write(SCRAMBLE_MW_CONFIG.PathConfigFile, util.TableToJSON( {}, true ))
end

SCRAMBLE_MW_CONFIG.ModelName = scramble_mw.GetDataFromFile(SCRAMBLE_MW_CONFIG.PathConfigFile)

-- Default Model manage
SCRAMBLE_MW_CONFIG.ModelName["models/scp096anim/player/scp096pm_raf.mdl"] = {
    head = "ValveBiped.Bip01_Head1", -- BoneId
    x = 0, -- Pos Vector x adjustement depend on the model
    y = 1, -- Pos Vector y adjustement depend on the model
    z = 3  -- Pos Vector z adjustement depend on the model
}
SCRAMBLE_MW_CONFIG.ModelName["models/shaklin/scp/096/scp_096.mdl"] = {
    head = "head",
    x = 0,
    y = 2,
    z = 0
}
SCRAMBLE_MW_CONFIG.ModelName["models/player/scp096.mdl"] = {
    head = "ValveBiped.Bip01_Head1",
    x = 0,
    y = 0,
    z = 0
}
SCRAMBLE_MW_CONFIG.ModelName["models/scp_096/scp_096_final.mdl"] = {
    head = "head",
    x = 0,
    y = 0,
    z = 1
}

scramble_mw.LoadDirectory(SCRAMBLE_MW_CONFIG.RootFolder.."server/")
scramble_mw.LoadDirectory(SCRAMBLE_MW_CONFIG.RootFolder.."client/")
scramble_mw.LoadDirectory(SCRAMBLE_MW_CONFIG.RootFolder.."shared/")