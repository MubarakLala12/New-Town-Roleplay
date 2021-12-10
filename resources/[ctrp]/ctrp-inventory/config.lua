Config = {}

local StringCharset = {}
local NumberCharset = {}

for i = 48,  57 do table.insert(NumberCharset, string.char(i)) end
for i = 65,  90 do table.insert(StringCharset, string.char(i)) end
for i = 97, 122 do table.insert(StringCharset, string.char(i)) end

Config.RandomStr = function(length)
	if length > 0 then
		return Config.RandomStr(length-1) .. StringCharset[math.random(1, #StringCharset)]
	else
		return ''
	end
end

Config.RandomInt = function(length)
	if length > 0 then
		return Config.RandomInt(length-1) .. NumberCharset[math.random(1, #NumberCharset)]
	else
		return ''
	end
end

Config.VendingObjects = {
    "prop_vend_soda_01",
    "prop_vend_soda_02",
    "prop_vend_water_01"
}

Config.BinObjects = {
    "prop_bin_05a",
}

Config.VendingItem = {
    [1] = {
        name = "kurkakola",
        price = 45,
        amount = 50,
        info = {},
        type = "item",
        slot = 1,
    },
    [2] = {
        name = "water_bottle",
        price = 30,
        amount = 50,
        info = {},
        type = "item",
        slot = 2,
    },
}

Config.CraftingItems = {
    ["location"] = {x = 1533.59, y = 3586.3, z = 38.27, h = 118.71, r = 1.0},
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

        --[[[9] = {
            name = "empty_weed_bag",
            amount = 50,
            info = {},
            costs = {
                ["plastic"] = 2,
                ["lighter"] = 1,
            },
            type = "item",
            slot = 9,
            threshold = 0,
            points = 1,
        },]]

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

Config.CraftingItemsold = {
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
             ["screwdriverset"] = 10 ,
             ["drill"] = 8,
             ["wire"] = 30,
         },
         type = "item",
         slot = 8,
         threshold = 0,
         points = 1,
    },

    --[[[9] = {
        name = "empty_weed_bag",
        amount = 50,
        info = {},
        costs = {
            ["plastic"] = 2,
            ["lighter"] = 1,
        },
        type = "item",
        slot = 9,
        threshold = 0,
        points = 1,
    },]]

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
             ["screwdriverset"] = 10 ,
             ["drill"] = 4,
             ["wire"] = 30,
         },
         type = "item",
         slot = 10,
         threshold = 0,
         points = 1,
    },
}

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

Config.AttachmentsCrafting = {
    ["location"] = {x = -629.44, y = 223.54, z = 81.88, h = 181.58, r = 1.0},
    ["items"] = {
        [1] = {
            name = "tompasta",
            amount = 50,
            info = {},
            costs = {
                ["pasta"] = 1,
                ["veggies"] = 1,
                ["sauce"] = 1,
            },
            type = "item",
            slot = 1,
            threshold = 0,
            points = 1,
        },
        [2] = {
            name = "cheesepasta",
            amount = 50,
            info = {},
            costs = {
                ["pasta"] = 1,
                ["veggies"] = 1,
                ["sauce"] = 1,
                ["cheese"] = 1,
            },
            type = "item",
            slot = 2,
            threshold = 0,
            points = 1,
        },
        
    }
}

Config.AttachmentsCrafting2 = {
    ["location"] = {x = -627.7, y = 223.64, z = 81.88, h = 179.79, r = 1.0},
    ["items"] = {
        [1] = {
            name = "coffee",
            amount = 50,
            info = {},
            costs = {
                ["coffeepouch"] = 1,
                ["milk"] = 1,
                ["sugar"] = 1,
            },
            type = "item",
            slot = 1,
            threshold = 0,
            points = 1,
        },
        [2] = {
            name = "tea",
            amount = 50,
            info = {},
            costs = {
                ["teapouch"] = 1,
                ["milk"] = 1,
                ["sugar"] = 1,
            },
            type = "item",
            slot = 2,
            threshold = 0,
            points = 1,
        },
        
        [3] = {
            name = "hi-tea",
            amount = 50,
            info = {},
            costs = {
                ["teapouch"] = 1,
                ["milk"] = 1,
                ["sugar"] = 1,
                ["cannabis"] = 1,
            },
            type = "item",
            slot = 3,
            threshold = 0,
            points = 1,
        },
        
    }
}

Config.AttachmentssCrafting = {
    ["location"] = {x = 810.84, y = -908.32, z = 25.25, h = 177.03, r = 1.0},
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

Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
}

MaxInventorySlots = 40

BackEngineVehicles = {
    'ninef',
    'adder',
    'vagner',
    't20',
    'infernus',
    'zentorno',
    'reaper',
    'comet2',
    'comet3',
    'jester',
    'jester2',
    'cheetah',
    'cheetah2',
    'prototipo',
    'turismor',
    'pfister811',
    'ardent',
    'nero',
    'nero2',
    'tempesta',
    'vacca',
    'bullet',
    'osiris',
    'entityxf',
    'turismo2',
    'fmj',
    're7b',
    'tyrus',
    'italigtb',
    'penetrator',
    'monroe',
    'ninef2',
    'stingergt',
    'surfer',
    'surfer2',
    'comet3',
}

Config.MaximumAmmoValues = {
    ["pistol"] = 250,
    ["smg"] = 250,
    ["shotgun"] = 200,
    ["rifle"] = 250,
}