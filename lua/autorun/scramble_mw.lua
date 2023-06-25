-- Functions
scramble_mw = {}
-- Global Variable
SCRAMBLE_MW_CONFIG = {}
-- RootFolder path
SCRAMBLE_MW_CONFIG.RootFolder = "scramble/"
-- Config File path
SCRAMBLE_MW_CONFIG.PathConfigFile = "data_scramble_mw/SCRAMBLE_MW_CONFIG.json"
-- SCRAMBLE_MW_CONFIG.
SCRAMBLE_MW_CONFIG.ScramblePercent = CreateConVar( "Scramble_MW_Percent", 0, FCVAR_PROTECTED, "Percent Detect By SCP 096", 0, 100 )

/*
* Allows to return the data of a file.
* @string path File path.
*/
function scramble_mw.GetDataFromFile(path)
    local fileFind = file.Read(path) or ""
    local dataFind = util.JSONToTable(fileFind) or {}
    return dataFind
end

/*
* Allows you to load all the files in a folder.
* @string path of the folder to load.
* @bool isFile if the path is a file and not a folder.
*/
function scramble_mw.LoadDirectory(pathFolder, isFile)
    if isFile then
        AddCSLuaFile(pathFolder)
        include(pathFolder)
    else
        local files, directories = file.Find(pathFolder.."*", "LUA")
        for key, value in pairs(files) do
            AddCSLuaFile(pathFolder..value)
            include(pathFolder..value)
        end
        for key, value in pairs(directories) do
            LoadDirectory(pathFolder..value)
        end
    end
end

print("Project SCRAMBLE MW Loading . . .")
scramble_mw.LoadDirectory(SCRAMBLE_MW_CONFIG.RootFolder.."config/sh_SCRAMBLE_MW_CONFIG.lua", true)
scramble_mw.LoadDirectory(SCRAMBLE_MW_CONFIG.RootFolder.."config/sv_SCRAMBLE_MW_CONFIG.lua", true)
scramble_mw.LoadDirectory(SCRAMBLE_MW_CONFIG.RootFolder.."config/cl_SCRAMBLE_MW_CONFIG.lua", true)
print("Project SCRAMBLE MW Loaded!")