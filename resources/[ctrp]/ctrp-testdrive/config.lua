Config = {}

Config.PlateLetters  = 4
Config.PlateNumbers  = 4
Config.PlateUseSpace = false

Config.SpawnVehicle = true  -- TRUE if you want spawn vehicle when buy

Config.TestDrive = true     -- TRUE if you want enable test drive
Config.TestDriveTime = 60   -- TIME in SEC

Config.Blip = {
    vector3(-56.49, -1096.58, 26.42) -- Main Car Dealer Blip
}

Config.Shops = {
    [1] = {
        category = 'pdm', 
        coords = vector3(-1259.12, -368.43, 36.91)
    },
    [2] = {
        category = 'pdm', 
        coords = vector3(-1253.78, -349.57, 36.91)
    },
    [3] = {
        category = 'edm',
        coords = vector3(-783.31, -212.68, 37.15)
    }
}