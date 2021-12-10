CTRP = {}

CTRPCustom = {}

CTRP.VehicleShops = {
    {x = -1252.15, y = -360.51, z = 36.91}
}

CTRP.GarageLabel = {
    ["motelgarage"] = "Garage B",
    ["sapcounsel"]  = "Garage D",
}

CTRP.SpawnPoint = {x = -1239.69, y = -346.4, z = 36.98, h = 342.65}
CTRP.DefaultGarage = "centralgarage"

CTRP.VehicleBuyLocations = {x = -1235.81, y = -342.56, z = 36.98, h = 26.49, r = 1.0}
CTRP.QuickSell = {x = -46.07, y = -1081.98, z = 26.71, h = 69.2, r = 1.0}


CTRP.ShowroomVehicles = {

    [1] = {
        coords = {x = -1268.77, y = -365.03, z = 35.90, h = 298.7},
        defaultVehicle = "neon",
        chosenVehicle = "neon",
        inUse = false,
    },
    [2] = {
        coords = {x = -1269.63, y = -358.84, z = 35.90, h = 249.64},
        defaultVehicle = "dominator3",
        chosenVehicle = "dominator3",
        inUse = false,
    },
    [3] = {
        coords = {x = -1265.24, y = -355.1, z = 35.90, h = 208.01},
        defaultVehicle = "gauntlet4",
        chosenVehicle = "gauntlet4",
        inUse = false,
    },
    [4] = {
        coords = {x = -1249.68, y = -363.46, z = 35.90, h = 297.32},
        defaultVehicle = "t20",
        chosenVehicle = "t20",
        inUse = false,
    },
    [5] = {
        coords = {x = -1251.00, y = -354.01, z = 35.90, h = 118.23},
        defaultVehicle = "diablous2",
        chosenVehicle = "diablous2",
        inUse = false,
    },

    [6] = {
        coords = {x = -1233.63, y = -353.89, z = 36.35, h = 118.86},
        defaultVehicle = "kamacho",
        chosenVehicle = "kamacho",
        inUse = false,
    },
}

CTRP.VehicleMenuCategories = {
    ["sports"]  = {label = "Sports"},
    ["super"]   = {label = "Super"},
    ["sedans"]  = {label = "Sedans"},
    ["coupes"]  = {label = "Coupes"},
    ["suvs"]    = {label = "SUV's"},
    ["offroad"] = {label = "Offroad"},
}

CTRP.Classes = {
    [0] = "compacts",
    [1] = "sedans",
    [2] = "suvs",
    [3] = "coupes",
    [4] = "muscle",
    [5] = "sportsclassics ",
    [6] = "sports",
    [7] = "super",
    [8] = "motorcycles",
    [9] = "offroad",
    [10] = "industrial",
    [11] = "utility",
    [12] = "vans",
    [13] = "cycles",
    [14] = "boats",
    [15] = "helicopters",
    [16] = "planes",
    [17] = "service",
    [18] = "emergency",
    [19] = "military",
    [20] = "commercial",
    [21] = "trains",
}

CTRP.DefaultBuySpawn = {x = -1235.81, y = -342.56, z = 36.98, h = 26.49, r = 1.0}

CTRPCustom.VehicleBuyLocation = {x = -775.48, y = -232.47, z = 36.58, h = 221.23, r = 1.0}
CTRPCustom.ShowroomPositions = {
    [1] = {
        coords = {
            x = -791.23, 
            y = -217.3, 
            z = 36.30, 
            h = 119.55,
        },
        vehicle = "imola",
        buying = false,
    }, 
    [2] = {
        coords = {
            x = -779.69, 
            y = -218.86, 
            z = 36.15, 
            h = 70.08, 
        }, 
        vehicle = "x700mg",
        buying = false,
    }, 
    [3] = {
        coords = {
            x = -787.86, 
            y = -207.22, 
            z = 36.10, 
            h = 118.65,
        },
        vehicle = "fjcruiser12",
        buying = false,
    }, 
    [4] = {
        coords = {
            x = -804.43, 
            y = -214.52, 
            z = 36.15, 
            h = 209.79,
        },
        vehicle = "thar21mg",
        buying = false,
    },
    [5] = {
        coords = {
            x = -794.84, 
            y = -229.75, 
            z = 36.15, 
            h = 345.83,
        },
        vehicle = "adr8",
        buying = false,
    },
    [6] = {
        coords = {
            x = -789.82, 
            y = -238.99, 
            z = 36.15, 
            h = 31.64,
        },
        vehicle = "mv2019",
        buying = false,
    },
    [7] = {
        coords = {
            x = -787.54, 
            y = -243.61, 
            z = 36.16, 
            h = 33.45,
        },
        vehicle = "b350mg",
        buying = false,
    },

    [8] = {
        coords = {
            x = -791.83, 
            y = -235.69, 
            z = 36.15, 
            h = 345.71,
        },
        vehicle = "hevo",
        buying = false,
    },

    
}

CTRP.Locations = {
    ["pstash"] = {
        [1] = {x = -1248.36, y = -350.79, z = 37.33, h = 216.38},
        
    },
    
}


Config = Config or {}

Config.MinimumSafeDistance = 2

Config.Safes = {
    ["edm"] = {
        money = 0,
        coords = {x = -810.8519, y = -204.9893, z = 37.1289, h = 99.5133, r = 1.0},
        transactions = {},
    },
} 