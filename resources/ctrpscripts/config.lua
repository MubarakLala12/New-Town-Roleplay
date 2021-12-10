Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

Config = {
    ChanceToGetItem = 5, -- if math.random(0, 100) <= ChanceToGetItem then give item
    Items = {
    'rubber'},
    Sell = vector3(287.24, 2843.74, 44.4),
    Objects = {
        ['pickaxe'] = 'prop_tool_pickaxe',
    },
    MiningPositions = {
        {coords = vector3(2992.77, 2750.64, 42.78), heading = 209.29},
        {coords = vector3(2983.03, 2750.9, 42.02), heading = 214.08},
        {coords = vector3(2976.74, 2740.94, 43.63), heading = 246.21},
        {coords = vector3(2998.17, 2796.16, 44.94), heading = 279.59},
        {coords = vector3(3005.1, 2782.4, 44.48), heading = 290.25},
        {coords = vector3(2913.88, 2802.41, 44.56), heading = 60.43},
        {coords = vector3(2928.11, 2759.41, 45.12), heading = 146.34},
        {coords = vector3(2934.29, 2742.46, 44.24), heading = 98.54},
        {coords = vector3(2999.48, 2753.01, 43.50), heading = 209.29},
        {coords = vector3(2997.17, 2750.25, 43.50), heading = 209.29},
        {coords = vector3(2988.04, 2752.09, 42.00), heading = 209.29},
    },

}

Strings = {
    ['press_mine'] = 'Press ~INPUT_CONTEXT~ to mine.',
    ['mining_info'] = 'Press ~INPUT_FRONTEND_RDOWN~ to chop, ~INPUT_FRONTEND_RRIGHT~ to stop.',
    ['you_sold'] = 'You sold %sx %s for %s',
    ['e_sell'] = 'Press ~INPUT_CONTEXT~ to sell all your mined items.',
    ['someone_close'] = 'There is a player too close to you!',
    ['mining'] = 'Mine',
    ['warning'] = 'Must check weight of inventory else if weight is full and you wash then you will not get item',
    ['warning1'] = 'Must check weight of inventory else if weight is full and you melt then you will not get item',
    ['sell_mine'] = 'Ore Selling'
}

Config.SellLocations = {
    [1] = {
        ["coords"] = {
            ["x"] = 486.48, 
            ["y"] = -591.53, 
            ["z"] = 26.21
        }
    }
}


Config.MiningItems = {
    ["ironore"] = {
        ["price"] = 50 
    },

    ["silverore"] = {
        ["price"] = 50 
    },

    ["goldore"] = {
        ["price"] = 50 
    },

    ["diamond"] = {
        ["price"] = 50 
    },

}



-------------------------------------------cooking--------------------------------------
Config.AttachmentsssCrafting = {
    ["location"] = {x = -384.62, y = 265.12, z = 86.43, h = 85.3, r = 1.0},
    ["items"] = {
        [1] = {
            name = "tsoup",
            amount = 50,
            info = {},
            costs = {
                ["knor"] = 1,
                ["water_bottle"] = 1,
            },
            type = "item",
            slot = 1,
            threshold = 0,
            points = 1,
        },
        [2] = {
            name = "msoup",
            amount = 50,
            info = {},
            costs = {
                ["manchow"] = 1,
                ["water_bottle"] = 1,
            },
            type = "item",
            slot = 2,
            threshold = 0,
            points = 1,
        },
        [3] = {
            name = "cookedchicken",
            amount = 50,
            info = {},
            costs = {
                ["cuttedchicken"] = 1,
                ["oil"] = 1,
                ["masala"] = 1,
                ["veggies"] = 1,
            },
            type = "item",
            slot = 3,
            threshold = 0,
            points = 1,
        },
        [4] = {
            name = "pannermasala",
            amount = 50,
            info = {},
            costs = {
                ["paneer"] = 1,
                ["oil"] = 1,
                ["masala"] = 1,
                ["veggies"] = 1,
                ["water_bottle"] = 1,
            },
            type = "item",
            slot = 4,
            threshold = 0,
            points = 1,
        },
        [5] = {
            name = "chickenmasala",
            amount = 50,
            info = {},
            costs = {
                ["cuttedchicken"] = 1,
                ["oil"] = 1,
                ["masala"] = 1,
                ["veggies"] = 1,
                ["water_bottle"] = 1,
            },
            type = "item",
            slot = 5,
            threshold = 0,
            points = 1,
        },
        [6] = {
            name = "ngol",
            amount = 50,
            info = {},
            costs = {
                ["golgappa"] = 1,
                ["oil"] = 1,
            },
            type = "item",
            slot = 6,
            threshold = 0,
            points = 1,
        },
        [7] = {
            name = "sodiumchloride",
            amount = 50,
            info = {},
            costs = {
                ["salt"] = 1,
                ["water_bottle"] = 1,
            },
            type = "item",
            slot = 7,
            threshold = 0,
            points = 1,
        },
        [8] = {
            name = "brownbread",
            amount = 50,
            info = {},
            costs = {
                ["flour"] = 1,
                ["water_bottle"] = 1,
            },
            type = "item",
            slot = 8,
            threshold = 0,
            points = 1,
        },
        [9] = {
            name = "naan",
            amount = 50,
            info = {},
            costs = {
                ["flour"] = 1,
                ["water_bottle"] = 1,
                ["butter"] = 1,
            },
            type = "item",
            slot = 9,
            threshold = 0,
            points = 1,
        },
    }
}

----------------------------------------------crafting------------------------------------------
Config.AttachmentCrafting = {
    ["location"] = {x = 95.32, y = 294.34, z = 110.21, h = 342.58, r = 1.0},
    ["items"] = {
        [1] = {
            name = "mcd-wrap",
            amount = 50,
            info = {},
            costs = {
                ["bread"] = 1,
                ["veggies"] = 1,
                ["sauce"] = 1,
            },
            type = "item",
            slot = 1,
            threshold = 0,
            points = 1,
        },
        [2] = {
            name = "mcd-wrap-c",
            amount = 50,
            info = {},
            costs = {
                ["bread"] = 1,
                ["veggies"] = 1,
                ["sauce"] = 1,
                ["chickenpatty"] = 1,
            },
            type = "item",
            slot = 2,
            threshold = 0,
            points = 1,
        },
        [3] = {
            name = "mcd-burger",
            amount = 50,
            info = {},
            costs = {
                ["bun"] = 1,
                ["veggies"] = 1,
                ["cheese"] = 1,
                ["sauce"] = 1,
                ["vegpatty"] = 1,
            },
            type = "item",
            slot = 3,
            threshold = 0,
            points = 1,
        },
        [4] = {
            name = "mcd-burger-c",
            amount = 50,
            info = {},
            costs = {
                ["bun"] = 1,
                ["veggies"] = 1,
                ["cheese"] = 1,
                ["sauce"] = 1,
                ["chickenpatty"] = 1,
            },
            type = "item",
            slot = 4,
            threshold = 0,
            points = 1,
        },
        [5] = {
            name = "mcd-fries",
            amount = 50,
            info = {},
            costs = {
                ["potato"] = 1,
                ["oil"] = 1,
              
            },
            type = "item",
            slot = 5,
            threshold = 0,
            points = 1,
        },
        
        [6] = {
            name = "mcd-nuggets",
            amount = 50,
            info = {},
            costs = {
                ["oil"] = 1,
                ["cheese"] = 1,
                ["bread"] = 2,
            },
            type = "item",
            slot = 6,
            threshold = 0,
            points = 1,
        },
        
        [7] = {
            name = "mcd-maharaja",
            amount = 50,
            info = {},
            costs = {
                ["bun"] = 1,
                ["veggies"] = 2,
                ["cheese"] = 3,
                ["sauce"] = 2,
                ["vegpatty"] = 3,
            },
            type = "item",
            slot = 7,
            threshold = 0,
            points = 1,
        },

        [8] = {
            name = "mcd-chickenpop",
            amount = 50,
            info = {},
            costs = {
                ["cuttedchicken"] = 1,
                ["bread"] = 2,
                ["sauce"] = 2,
            },
            type = "item",
            slot = 8,
            threshold = 0,
            points = 1,
        },

   
        [9] = {
            name = "mcd-spicypaneer",
            amount = 50,
            info = {},
            costs = {
                ["paneer"] = 1,
                ["masala"] = 1,
                ["bun"] = 1,
                ["veggies"] = 1,
                ["cheese"] = 1,
                ["sauce"] = 1,

            },
            type = "item",
            slot = 9,
            threshold = 0,
            points = 1,
        },

        [10] = {
            name = "mcd-egg",
            amount = 50,
            info = {},
            costs = {
                ["egg"] = 1,
                ["masala"] = 1,
                ["bun"] = 1,
                ["cheese"] = 1,

            },
            type = "item",
            slot = 10,
            threshold = 0,
            points = 1,
        },
        
    }
}

Config.CraftingItems = {
    ["location"] = {x = 1021.0, y = -2405.03, z = 30.14, h = 251.72, r = 1.0},
    ["items"] = {
        [1] = {
            name = "advancedlockpick",
            amount = 5,
            info = {},
            costs = {
                ["metalscrap"] = 15,
                ["steel"] = 17,
                ["iron"] = 9,
            },
            type = "item",
            slot = 1,
            threshold = 0,
            points = 1,
        },

        [2] = {
            name = "electronickit",
            amount = 2,
            info = {},
            costs = {
                ["metalscrap"] = 30,
                ["plastic"] = 22,
                ["aluminum"] = 17,
                ["wire"] = 9,
            },
            type = "item",
            slot = 2,
            threshold = 0,
            points = 1,
        },

        [3] = {
            name = "trojan_usb",
            amount = 1,
            info = {},
            costs = {
                ["metalscrap"] = 30,
                ["plastic"] = 22,
                ["aluminum"] = 28,
                ["electronickit"] = 1,
            },
            type = "item",
            slot = 3,
            threshold = 0,
            points = 1,
        },

        [4] = {
            name = "thermite",
            amount = 2,
            info = {},
            costs = {
                ["metalscrap"] = 30,
                ["plastic"] = 45,
                ["aluminum"] = 28,
                ["steel"] = 28,
                ["ironoxide"] = 5,
                ["aluminumoxide"] = 8,
            },
            type = "item",
            slot = 4,
            threshold = 0,
            points = 1,
        },

        [5] = {
            name = "drill",
            amount = 1,
            info = {},
            costs = {
                ["metalscrap"] = 30,
                ["plastic"] = 15,
                ["steel"] = 28,
                ["clutch"] = 25,
                ["iron"] = 28,
                ["wire"] = 25,
                ["rubber"] = 10, 
            },
            type = "item",
            slot = 5,
            threshold = 0,
            points = 1,
        },

        [6] = {
            name = "handcuffs",
            amount = 2,
            info = {},
            costs = {
                ["metalscrap"] = 10,
                ["aluminum"] = 10,
                ["steel"] = 10,
            },
            type = "item",
            slot = 6,
            threshold = 0,
            points = 1,
        },

        [7] = {
            name = "armor",
            amount = 1,
            info = {},
            costs = {
                ["metalscrap"] = 10,
                --["iron"] = 15,
                --["aluminum"] = 28,
                ["steel"] = 23,
                ["rubber"] = 15, 
            },
            type = "item",
            slot = 7,
            threshold = 0,
            points = 1,
        },

        
        [8] = {
            name = "gatecrack",
            amount = 50,
            info = {},
            costs = {
                ["screwdriverset"] = 10,
                ["drill"] = 8,
                ["wire"] = 30,
            },
            type = "item",
            slot = 8,
            threshold = 0,
            points = 1,
        },

        [9] = {
            name = "virusdrive",
            amount = 50,
            info = {},
            costs = {
                ["plastic"] = 5,
                ["wire"] = 10,
                ["electronickit"] = 2,
                ["trojan_usb"] = 10 ,
                ["metalscrap"] = 10,
                ["aluminum"] = 10,
                ["steel"] = 10,
                ["rubber"] = 18, 
            },
            type = "item",
            slot = 9,
            threshold = 0,
            points = 1,
        },

        [10] = {
            name = "platecrack",
            amount = 50,
            info = {},
            costs = {
                ["screwdriverset"] = 10,
                ["drill"] = 4,
                ["wire"] = 30,
            },
            type = "item",
            slot = 10,
            threshold = 0,
            points = 1,
        },
    }
}
-------------------------------------------------------garbage----------------------------
Config.BailPricegarbage = 1000

Config.Locationsgarbage = {
    ["main"] = {
        label = "Garbage dumo",
        coords = {x = -350.08, y = -1569.95, z = 25.22, h = 292.42},
    },
    ["vehicle"] = {
        label = "Garbage truck storage",
        coords = {x = -340.74, y = -1561.82, z = 25.23, h = 58.0},
    },
    ["paycheck"] = {
        label = "Pay check",
        coords = {x = -346.68, y = -1572.39, z = 25.22, h = 163.5, r = 1.0},
    },
    ["vuilnisbakken"] ={
        [1] = {
            name = "forumdrive",
            coords = {x = -168.07, y = -1662.8, z = 33.31, h = 137.5},
        },
        [2] = {
            name = "grovestreet",
            coords = {x = 118.06, y = -1943.96, z = 20.43, h = 179.5},
        },
        [3] = {
            name = "jamestownstreet",
            coords = {x = 297.94, y = -2018.26, z = 20.49, h = 119.5},
        },
        [4] = {
            name = "roylowensteinblvd",
            coords = {x = 509.99, y = -1620.98, z = 29.09, h = 0.5},
        },
        [5] = {
            name = "littlebighornavenue",
            coords = {x = 488.49, y = -1284.1, z = 29.24, h = 138.5},
        },
        [6] = {
            name = "vespucciblvd",
            coords = {x = 307.47, y = -1033.6, z = 29.03, h = 46.5},
        },
        [7] = {
            name = "elginavenue",
            coords = {x = 239.19, y = -681.5, z = 37.15, h = 178.5},
        },
        [8] = {
            name = "elginavenue2",
            coords = {x = 543.51, y = -204.41, z = 54.16, h = 199.5},
        },
        [9] = {
            name = "powerstreet",
            coords = {x = 268.72, y = -25.92, z = 73.36, h = 90.5},
        },
        [10] = {
            name = "altastreet",
            coords = {x = 267.03, y = 276.01, z = 105.54, h = 332.5},
        },
        [11] = {
            name = "didiondrive",
            coords = {x = 21.65, y = 375.44, z = 112.67, h = 323.5},
        },
        [12] = {
            name = "miltonroad",
            coords = {x = -546.9, y = 286.57, z = 82.85, h = 127.5},
        },
        [13] = {
            name = "eastbourneway",
            coords = {x = -683.23, y = -169.62, z = 37.74, h = 267.5},
        },
        [14] = {
            name = "eastbourneway2",
            coords = {x = -771.02, y = -218.06, z = 37.05, h = 277.5},
        },
        [15] = {
            name = "industrypassage",
            coords = {x = -1057.06, y = -515.45, z = 35.83, h = 61.5},
        },
        [16] = {
            name = "boulevarddelperro",
            coords = {x = -1558.64, y = -478.22, z = 35.18, h = 179.5, r = 1.0},
        },
        [17] = {
            name = "sandcastleway",
            coords = {x = -1350.0, y = -895.64, z = 13.36, h = 17.5},
        },
        [18] = {
            name = "magellanavenue",
            coords = {x = -1243.73, y = -1359.72, z = 3.93, h = 287.5},
        },
        [19] = {
            name = "palominoavenue",
            coords = {x = -845.87, y = -1113.07, z = 6.91, h = 253.5},
        },
        [20] = {
            name = "southrockforddrive",
            coords = {x = -635.21, y = -1226.45, z = 11.8, h = 143.5},
        },
        [21] = {
            name = "southarsenalstreet",
            coords = {x = -587.74, y = -1739.13, z = 22.47, h = 339.5},
        },

    },
}

Config.Vehiclesgarabage = {
    ["trash"] = "Garbage truck",
}

Config.RewardItemsgarbage = {
    ["empty_weed_bag"] = {
        ["price"] = 50 
    },

    ["rolling_paper"] = {
        ["price"] = 50 
    },

    ["papera"] = {
        ["price"] = 50 
    },

    ["aluminum"] = {
        ["price"] = 50 
    },

    ["water_bottle"] = {
        ["price"] = 50 
    },

    ["plastic"] = {
        ["price"] = 50 
    },

}

-----------------------------------------government----------------------------------------
Config.Locationsgov = {
    ["exit"] = {x = -515.81, y = -255.14, z = 35.62, h = 295.63, r = 1.0},
    ["stash"] = {x = -534.35, y = -192.17, z = 47.42, h = 295.51, r = 1.0},
    ["duty"] = {x = -1293.73, y = -570.85, z = 30.57, h = 348.98, r = 1.0},
    ["vehicle"] = {x = -1313.89, y = -562.33, z = 20.8, h = 215.27, r = 1.0},
    ["pstash"] = {x = -1301.70, y = -568.60, z = 41.19, h = 44.83, r = 1.0}, 
    ["armory"] = {x = -1306.19, y = -565.25, z = 41.19, h = 299.8, r = 1.0}, 
    ["armory1"] = {x = -1301.06, y = -555.56, z = 30.57, h = 40.53, r = 1.0}, 
    ["ptstash"] = {x = -1290.27, y = -585.8, z = 37.37, h = 212.39, r = 1.0},
    ["psstash"] = {x = -1285.16, y = -590.76, z = 37.38, h = 221.1, r = 1.0},
    ["psmtash"] = {x = -1285.74, y = -590.83, z = 41.19, h = 215.83, r = 1.0},
    ["psetash"] = {x = -1285.41, y = -590.83, z = 34.37, h = 213.17, r = 1.0},
    ["psutash"] = {x = -1302.62, y = -557.01, z = 30.57, h = 36.73, r = 1.0},
    ["govtash"] = {x = -1294.61, y = -582.07, z = 34.37, h = 124.28, r = 1.0},
}

Config.Vehiclesgov = {
    ["onebeast"] = "Mayor Car",
    ["bmwm5"] = "Security Chief Car",
    ["secrsub"] = "Security SUV",
    ["gmcyd"] = "Employee SUV",
    ["rs7"] = "Secretery Car",
    ["745le"] = "Advocate Car",
}

Config.Itemsgov = {
    label = "Governor Armory",
    slots = 30,
    items = {
        [1] = {
            name = "bandage",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "weapon_assaultsmg",
            price = 0,
            amount = 50,
            info = {
                serie = "",
            },
            type = "weapon",
            slot = 2,
        },
        [3] = {
            name = "ifak",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "radio",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "bodycam",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "weapon_heavypistol",
            price = 0,
            amount = 50,
            info = {},
            type = "weapon",
            slot = 6,
        },
        [7] = {
            name = "pistol_ammo",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 7,
        },
        [8] = {
            name = "smg_ammo",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 8,
        },
        [9] = {
            name = "shotgun_ammo",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 9,
        },
        [10] = {
            name = "rifle_ammo",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 10,
        },
        [11] = {
            name = "weapon_bullpupshotgun",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 11,
        },
        [12] = {
            name = "weapon_mg",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 12,
        },
        [13] = {
            name = "weapon_heavysniper",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 13,
        },
        [14] = {
            name = "weapon_specialcarbine",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 14,
        },
        [15] = {
            name = "heavyarmor",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 15,
        },
        [16] = {
            name = "weapon_stungun",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 16,
        },
    }
}

Config.Items1gov = {
    label = "Security Armory",
    slots = 30,
    items = {
        [1] = {
            name = "bandage",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "weapon_assaultsmg",
            price = 0,
            amount = 50,
            info = {
                serie = "",
            },
            type = "weapon",
            slot = 2,
        },
        [3] = {
            name = "ifak",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "radio",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "bodycam",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "weapon_heavypistol",
            price = 0,
            amount = 50,
            info = {},
            type = "weapon",
            slot = 6,
        },
        [7] = {
            name = "pistol_ammo",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 7,
        },
        [8] = {
            name = "smg_ammo",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 8,
        },
        [9] = {
            name = "shotgun_ammo",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 9,
        },
        [10] = {
            name = "rifle_ammo",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 10,
        },
        [11] = {
            name = "weapon_bullpupshotgun",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 11,
        },
        [12] = {
            name = "weapon_specialcarbine",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 12,
        },
        [13] = {
            name = "weapon_stungun",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 13,
        },
        [14] = {
            name = "heavyarmor",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 14,
        },
    }
}

-------------------------------------------------courthouse------------------------

Config.Locationscourt = {
    ["courthouse"] = {
        enter = {
            x = 243.31,
            y = -1074.16,
            z = 29.29,
            h = 138.33,
        },
        exit = {
            x = 243.31,
            y = -1074.16,
            z = 29.29,
            h = 138.33,
        },
    }
}


---------------------------------------------mechaniccrafting---------------------------
Config.AttachmentssCrafting = {
    ["location"] = {x = -345.96, y = -111.24, z = 39.02, h = 81.23, r = 1.0},
    ["items"] = {
        [1] = {
            name = "tunerlaptop",
            amount = 50,
            info = {},
            costs = {
                ["electronickit"] = 5,
                ["trojan_usb"] = 5,
                ["clutch"] = 20,
                ["wire"] = 20,
            },
            type = "item",
            slot = 1,
            threshold = 0,
            points = 1,
        },
        [2] = {
            name = "nitrous",
            amount = 50,
            info = {},
            costs = {
                ["rubber"] = 15,
                ["weapon_petrolcan"] = 1,
                ["metalscrap"] = 20,
                ["aluminum"] = 15,
                ["steel"] = 20,
                ["wire"] = 20,
            },
            type = "item",
            slot = 2,
            threshold = 0,
            points = 1,
        },
        [3] = {
            name = "advancedrepairkit",
            amount = 50,
            info = {},
            costs = {
                ["metalscrap"] = 15,
                ["steel"] = 17,
                ["iron"] = 9,
                ["rubber"] = 15,
                
            },
            type = "item",
            slot = 3,
            threshold = 0,
            points = 1,
        },
    }
}


-------------------------------moneysafe-------------------------------

Config.MinimumSafeDistance = 2

Config.Safes = {
    ["pdm"] = {
        money = 0,
        coords = {x = -1249.5337, y = -344.7668, z = 37.3328, h = 19.0061, r = 1.0},
        transactions = {},
    },
}