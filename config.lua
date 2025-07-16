Config                  = {}

Config.EnableDebug      = false                 -- Toggle debugging displayed on console.

Config.ModelsToScan     = {                     -- The models entered here are found in the game and saved as vector3(x, y, z) in the founds_coords.txt file.
    "prop_news_disp_01a",
}

Config.ScanInterval     = 1 * 1000              -- Seconds * 1000

Config.OutputFileName   = "found_coords.txt"    -- File name where the found coordinates will be saved. (Do not change)
