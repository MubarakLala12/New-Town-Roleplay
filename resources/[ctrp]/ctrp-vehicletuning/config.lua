Config = {}

Config.AttachedVehicle = nil

Config.Keys = {
    ['ESC'] = 322, ['F1'] = 288, ['F2'] = 289, ['F3'] = 170, ['F5'] = 166, ['F6'] = 167, ['F7'] = 168, ['F8'] = 169, ['F9'] = 56, ['F10'] = 57,
    ['~'] = 243, ['1'] = 157, ['2'] = 158, ['3'] = 160, ['4'] = 164, ['5'] = 165, ['6'] = 159, ['7'] = 161, ['8'] = 162, ['9'] = 163, ['-'] = 84, ['='] = 83, ['BACKSPACE'] = 177,
    ['TAB'] = 37, ['Q'] = 44, ['W'] = 32, ['E'] = 38, ['R'] = 45, ['T'] = 245, ['Y'] = 246, ['U'] = 303, ['P'] = 199, ['['] = 39, [']'] = 40, ['ENTER'] = 18,
    ['CAPS'] = 137, ['A'] = 34, ['S'] = 8, ['D'] = 9, ['F'] = 23, ['G'] = 47, ['H'] = 74, ['K'] = 311, ['L'] = 182,
    ['LEFTSHIFT'] = 21, ['Z'] = 20, ['X'] = 73, ['C'] = 26, ['V'] = 0, ['B'] = 29, ['N'] = 249, ['M'] = 244, [','] = 82, ['.'] = 81,
    ['LEFTCTRL'] = 36, ['LEFTALT'] = 19, ['SPACE'] = 22, ['RIGHTCTRL'] = 70,
    ['HOME'] = 213, ['PAGEUP'] = 10, ['PAGEDOWN'] = 11, ['DELETE'] = 178,
    ['LEFT'] = 174, ['RIGHT'] = 175, ['TOP'] = 27, ['DOWN'] = 173,
}

Config.AuthorizedIds = {
    "EZT73604",
    "UGU71986",
    "WNP12923",
}

Config.MaxStatusValues = {
    ["engine"] = 1000.0,
    ["body"] = 1000.0,
    ["radiator"] = 100,
    ["axle"] = 100,
    ["brakes"] = 100,
    ["clutch"] = 100,
    ["fuel"] = 100,
}

Config.ValuesLabels = {
    ["engine"] = "Engine",
    ["body"] = "Body",
    ["radiator"] = "Radiator",
    ["axle"] = "Drive shaft",
    ["brakes"] = "Brakes",
    ["clutch"] = "Transmission",
    ["fuel"] = "Fueltank",
}

Config.RepairCost = {
    ["body"] = "plastic",
    ["radiator"] = "plastic",
    ["axle"] = "steel",
    ["brakes"] = "iron",
    ["clutch"] = "aluminum",
    ["fuel"] = "plastic",
}

Config.RepairCostAmount = {
    ["engine"] = {
        item = "metalscrap",
        costs = 2,
    },
    ["body"] = {
        item = "plastic",
        costs = 3,
    },
    ["radiator"] = {
        item = "steel",
        costs = 5,
    },
    ["axle"] = {
        item = "aluminum",
        costs = 7,
    },
    ["brakes"] = {
        item = "copper",
        costs = 5,
    },
    ["clutch"] = {
        item = "copper",
        costs = 6,
    },
    ["fuel"] = {
        item = "plastic",
        costs = 5,
    },
}

Config.Businesses = {
    "cykarepairs",
}

Config.Plates = {
    [1] = {
        coords = {x = -365.99, y = -85.37, z = 39.03, h = 69.93, r = 1.0},
        AttachedVehicle = nil,
    },
    [2] = {
        coords = {x = -326.73, y = -144.39, z = 38.27, h = 70.53, r = 1.0}, 
        AttachedVehicle = nil,
    },
    [3] = {
        coords = {x = -319.42, y = -123.62, z = 38.27, h = 68.8, r = 1.0}, 
        AttachedVehicle = nil,
    },
    -- [4] = {
    --     coords = {x = 827.86, y = -903.79, z = 25.32, h = 355.96, r = 1.0},
    --     AttachedVehicle = nil,
    -- },
    -- --[[[5] = {
    --     coords = {x = 839.33, y = -885.52, z = 25.32, h = 178.68, r = 1.0},
    --     AttachedVehicle = nil,
    -- },
    -- [6] = {
    --     coords = {x = 831.68, y = -885.42, z = 25.32, h = 172.14, r = 1.0},
    --     AttachedVehicle = nil,
    -- },]]
    -- [5] = {
    --     coords = {x = 853.75, y = -885.44, z = 25.38, h = 264.06, r = 1.0},
    --     AttachedVehicle = nil,
    -- },
    -- [6] = {
    --     coords = {x = 853.54, y = -892.28, z = 25.37, h = 269.95, r = 1.0},
    --     AttachedVehicle = nil,
    -- },
}

Config.Locations = {
    ["exit"] = {x = -335.9, y = -127.5, z = 39.01, h = 294.48, r = 1.0},
    ["stash"] = {x = -317.43, y = -130.33, z = 39.02, h = 247.93, r = 1.0},
    ["duty"] = {x = -339.77, y = -157.28, z = 44.59, h = 355.03, r = 1.0},
    ["vehicle"] = {x = -356.69, y = -159.96, z = 38.82, h = 32.53, r = 1.0}, 
    ["pstash"] = {x = -337.18, y = -162.19, z = 44.59, h = 188.3, r = 1.0},
}

Config.Vehicles = {
    ["towtruck"] = "Towtruck",
    ["f450s"] = "CTRP Tow",
    ["minivan"] = "Minivan (Rental car)",
    ["blista"] = "Blista",
    ["flatbed"] = "Flatbed",
    ["f550rbc"] = "Mechanic Truck",

}

Config.MinimalMetersForDamage = {
    [1] = {
        min = 8000,
        max = 12000,
        multiplier = {
            min = 1,
            max = 8,
        }
    },
    [2] = {
        min = 12000,
        max = 16000,
        multiplier = {
            min = 8,
            max = 16,
        }
    },
    [3] = {
        min = 12000,
        max = 16000,
        multiplier = {
            min = 16,
            max = 24,
        }
    },
}

Config.Damages = {
    ["radiator"] = "Radiator",
    ["axle"] = "Driveshaft",
    ["brakes"] = "Brakes",
    ["clutch"] = "Transmission",
    ["fuel"] = "Fuel tank",
}


Config.MinimumSafeDistance = 2

Config.Safes = {
    ["mechanic"] = {
        money = 0,
        coords = {x = -344.13, y = -157.06, z = 44.59, h = 158.52, r = 1.0},
        transactions = {},
    },
} 
