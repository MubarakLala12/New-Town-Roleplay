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
    
}



Config.Businesses = {
    "cykarepairs",
}

Config.Plates = {
    [1] = {
        coords = {x = 14.89, y = -1010.83, z = 32.95, h = 271.5, r = 1.0},
        AttachedVehicle = nil,
    },
}


Config.Locations = {
    ["exit"] = {x = 82.8, y = 279.12, z = 110.21, h = 132.82, r = 1.0},
    ["stash"] = {x = 90.51, y = 292.42, z = 110.21, h = 333.19, r = 1.0},
    ["duty"] = {x = 86.03, y = 292.49, z = 110.21, h = 352.16, r = 1.0},
    ["vehicle"] = {x = 95.98, y = 300.13, z = 110.02, h = 74.01, r = 1.0}, 
    ["shakefill"] = {x = 96.01, y = 290.2, z = 109.91, h = 243.88, r = 1.0},
    ["shakefill2"] = {x = 95.34, y = 289.26, z = 110.21, h = 247.9, r = 1.0},
    ["hotfill"] = {x = 96.87, y = 292.64, z = 109.81, h = 251.38, r = 1.0},
    ["inShop"] = {x = 93.41, y = 291.36, z = 110.21, h = 345.65, r = 1.0},

    ["openstash"] = {x = 88.91, y = 283.85, z = 110.21, h = 68.47, r = 1.0},
    ["openstash2"] = {x = 89.67, y = 286.27, z = 110.21, h = 70.97, r = 1.0},
    ["openstash3"] = {x = 90.33, y = 288.35, z = 110.21, h = 65.97, r = 1.0},
}

Config.Vehicles = {
    ["nrg"] = "MCD Bike",
    ["vwcaddy"] = "MCD Car",

}

Config.mcdShops = {
    label = "MCD STORAGE",
    slots = 30,
    items = {
        [1] = {
            name = "mcd-glass",
            price = 0,
            amount = 500,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "mcd-cup",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 2,
        },
        
        [3] = {
            name = "mcd-desert",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 3,
        },
        
    }
}

