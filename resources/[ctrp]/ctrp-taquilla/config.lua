Config = {}


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




Config.Locations = {
    ["exit"] = {x = -564.46, y = 273.89, z = 83.02, h = 166.89, r = 1.0},
    ["stash"] = {x = -561.88, y = 289.93, z = 82.18, h = 359.41, r = 1.0},
    ["duty"] = {x = -565.15, y = 279.51, z = 82.98, h = 162.04, r = 1.0},
    ["vehicle"] = {x = -552.55, y = 305.24, z = 83.27, h = 258.86, r = 1.0}, 
    ["beerfill"] = {x = -561.11, y = 288.08, z = 82.6, h = 265.69, r = 1.0}, 
    ["storage"] = {x = -563.32, y = 285.63, z = 82.18, h = 83.14, r = 1.0}, 
}

Config.Vehicles = {
    ["ae86"] = "Taqualla",

}


Config.taqShops = {
    label = "Taquilla Storage",
    slots = 30,
    items = {
        [1] = {
            name = "empty_bottle",
            price = 10,
            amount = 500,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "whiskey",
            price = 60,
            amount = 50,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "vodka",
            price = 50,
            amount = 50,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "vine",
            price = 40,
            amount = 50,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "champagne",
            price = 40,
            amount = 50,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "tequila",
            price = 60,
            amount = 50,
            info = {},
            type = "item",
            slot = 6,
        },
        [7] = {
            name = "monster",
            price = 30,
            amount = 50,
            info = {},
            type = "item",
            slot = 7,
        },
        [8] = {
            name = "redbull",
            price = 30,
            amount = 50,
            info = {},
            type = "item",
            slot = 8,
        },
        
    }
}
