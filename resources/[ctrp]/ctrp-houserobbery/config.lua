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

Config = {}

Config.MinZOffset = 45

Config.MinimumHouseRobberyPolice = 0

Config.MinimumTime = 21
Config.MaximumTime = 4

Config.Rewards = {
    [1] = {
        ["cabin"] = {
            "diamond_ring",
            "goldchain",
        },
        ["kitchen"] = {
            "tosti",
            "sandwich",
            "lotto",
            "goldchain",
            
        },
        ["chest"] = {
            "rolex",
            "pistol_ammo",
            "wire",
            "blackmoney",
            "firstaid",
        },
        --new
        ["chest2"] = {
            "iron",
            "copper",
            "rifle_ammo",
        },
        ["underbed"] = {
            "advancedlockpick",
            "samsungphone",
            "lotto",
            "cokebaggy",
        },
        ["Storage"] = {
            "cokebaggy",
            "joint",
            "handcuffs",
            "pistol_ammo",
            "redchip",
            "blackmoney",
            "firstaid",
        },
        ["table"] = {
            "rolex",
            "diamond_ring",
            "goldchain",
            "glass",
        },
        ["table2"] = {
            "rolex",
            "diamond_ring",
            "goldchain",
        },
        ["table3"] = {
            "rolex",
            "diamond_ring",
            "goldchain",
            "weed_og-kush_seed",
        },
        ["fridge"] = {
            "tosti",
            "sandwich",  
            "joint",
        },
        ["War"] = {
            "joint",
            "smg_ammo",
            "blackmoney",
        },
    }
}


Config.Houses = {
    ["grovestreet1"] = { -- Moved 28-1-2020
        ["coords"] = {
            ["x"] = 500.75,
            ["y"] = -1697.16,
            ["z"] = 29.78,
            ["h"] = 326.5,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },

            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },

        }
    },

    

    ["westmirrordrive1"] = { 
        ["coords"] = {
            ["x"] = 1061.04,
            ["y"] = -378.61,
            ["z"] = 68.24,
            ["h"] = 44.1,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },

            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },

        }
    },

    ["westmirrordrive2"] = { 
        ["coords"] = {
            ["x"] = 1029.42,
            ["y"] = -408.96,
            ["z"] = 65.95,
            ["h"] = 44.97,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },

            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },

        }
    },

    ["westmirrordrive3"] = { 
        ["coords"] = {
            ["x"] = 1010.43,
            ["y"] = -423.47,
            ["z"] = 65.35,
            ["h"] = 127.94,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["westmirrordrive4"] = { 
        ["coords"] = {
            ["x"] = 987.62,
            ["y"] = -433.25,
            ["z"] = 63.89,
            ["h"] = 36.07,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["westmirrordrive5"] = { 
        ["coords"] = {
            ["x"] = 967.28,
            ["y"] = -451.96,
            ["z"] = 62.79,
            ["h"] = 33.68,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["westmirrordrive6"] = { 
        ["coords"] = {
            ["x"] = 944.16,
            ["y"] = -463.28,
            ["z"] = 61.4,
            ["h"] = 301.9,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },
    ["westmirrordrive7"] = { 
        ["coords"] = {
            ["x"] = 921.85,
            ["y"] = -477.99,
            ["z"] = 61.08,
            ["h"] = 75.01,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["westmirrordrive8"] = { 
        ["coords"] = {
            ["x"] = 878.74,
            ["y"] = -498.19,
            ["z"] = 58.09,
            ["h"] = 51.56,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["westmirrordrive9"] = { 
        ["coords"] = {
            ["x"] = 861.75,
            ["y"] = -509.22,
            ["z"] = 57.52,
            ["h"] = 58.94,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["westmirrordrive10"] = { 
        ["coords"] = {
            ["x"] = 850.58,
            ["y"] = -532.79,
            ["z"] = 57.93,
            ["h"] = 80.59,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["westmirrordrive11"] = { 
        ["coords"] = {
            ["x"] = 1208.69,
            ["y"] = -455.0,
            ["z"] = 66.69,
            ["h"] = 257.42,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["westmirrordrive12"] = { 
        ["coords"] = {
            ["x"] = 844.03,
            ["y"] = -562.94,
            ["z"] = 57.83,
            ["h"] = 20.64,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["westmirrordrive13"] = { 
        ["coords"] = {
            ["x"] = 861.83,
            ["y"] = -583.35,
            ["z"] = 58.16,
            ["h"] = 175.17,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["westmirrordrive14"] = { 
        ["coords"] = {
            ["x"] = 861.83,
            ["y"] = -583.35,
            ["z"] = 58.16,
            ["h"] = 175.17,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["westmirrordrive15"] = { 
        ["coords"] = {
            ["x"] = 903.15,
            ["y"] = -615.7,
            ["z"] = 58.45,
            ["h"] = 51.07,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },




    ["eastmirrordrive1"] = { 
        ["coords"] = {
            ["x"] = 1262.8,
            ["y"] = -429.7,
            ["z"] = 70.02,
            ["h"] = 115.09,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["eastmirrordrive2"] = { 
        ["coords"] = {
            ["x"] = 1266.17,
            ["y"] = -458.04,
            ["z"] = 70.52,
            ["h"] = 96.17,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },
   
    ["eastmirrordrive3"] = { 
        ["coords"] = {
            ["x"] = 1259.94,
            ["y"] = -479.89,
            ["z"] = 70.19,
            ["h"] = 132.37,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["eastmirrordrive4"] = { 
        ["coords"] = {
            ["x"] = 1251.88,
            ["y"] = -494.25,
            ["z"] = 69.91,
            ["h"] = 79.0,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["eastmirrordrive5"] = { 
        ["coords"] = {
            ["x"] = 1251.5,
            ["y"] = -515.63,
            ["z"] = 69.35,
            ["h"] = 79.0,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },



    ["nikolaplace1"] = { 
        ["coords"] = {
            ["x"] = 1303.06,
            ["y"] = -527.83,
            ["z"] = 71.46,
            ["h"] = 343.2,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["nikolaplace2"] = { 
        ["coords"] = {
            ["x"] = 1328.3,
            ["y"] = -536.03,
            ["z"] = 72.44,
            ["h"] = 253.02,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["nikolaplace3"] = { 
        ["coords"] = {
            ["x"] = 1348.16,
            ["y"] = -547.14,
            ["z"] = 73.89,
            ["h"] = 339.37,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["nikolaplace4"] = { 
        ["coords"] = {
            ["x"] = 1372.97,
            ["y"] = -555.69,
            ["z"] = 74.69,
            ["h"] = 339.37,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["nikolaplace5"] = { 
        ["coords"] = {
            ["x"] = 1388.65,
            ["y"] = -569.67,
            ["z"] = 74.5,
            ["h"] = 293.51,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    

    ["fudgelane1"] = { 
        ["coords"] = {
            ["x"] = 1437.39,
            ["y"] = -1492.41,
            ["z"] = 63.62,
            ["h"] = 341.97,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["fudgelane2"] = { 
        ["coords"] = {
            ["x"] = 1379.49,
            ["y"] = -1515.41,
            ["z"] = 58.04,
            ["h"] = 31.65,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["fudgelane3"] = { 
        ["coords"] = {
            ["x"] = 1338.24,
            ["y"] = -1524.22,
            ["z"] = 54.59,
            ["h"] = 294.89,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["fudgelane4"] = { 
        ["coords"] = {
            ["x"] = 1315.95,
            ["y"] = -1527.06,
            ["z"] = 51.81,
            ["h"] = 18.41,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["fudgelane5"] = { 
        ["coords"] = {
            ["x"] = 1230.76,
            ["y"] = -1591.21,
            ["z"] = 53.77,
            ["h"] = 44.83,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["fudgelane6"] = { 
        ["coords"] = {
            ["x"] = 1205.91,
            ["y"] = -1607.85,
            ["z"] = 50.54,
            ["h"] = 44.29,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["fudgelane7"] = { 
        ["coords"] = {
            ["x"] = 1192.94,
            ["y"] = -1622.69,
            ["z"] = 45.23,
            ["h"] = 300.01,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },




    ["amarillovista1"] = { 
        ["coords"] = {
            ["x"] = 1365.25,
            ["y"] = -1720.38,
            ["z"] = 65.64,
            ["h"] = 201.8,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["amarillovista2"] = { 
        ["coords"] = {
            ["x"] = 1395.18,
            ["y"] = -1720.79,
            ["z"] = 65.63,
            ["h"] = 201.8,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["amarillovista3"] = { 
        ["coords"] = {
            ["x"] = 1295.86,
            ["y"] = -1739.44,
            ["z"] = 54.28,
            ["h"] = 201.8,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["amarillovista4"] = { 
        ["coords"] = {
            ["x"] = 1258.81,
            ["y"] = -1761.27,
            ["z"] = 49.67,
            ["h"] = 201.8,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },


    ["amarillovista5"] = { 
        ["coords"] = {
            ["x"] = 1250.85,
            ["y"] = -1734.76,
            ["z"] = 52.03,
            ["h"] = 21.01,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["amarillovista6"] = { 
        ["coords"] = {
            ["x"] = 1289.41,
            ["y"] = -1711.19,
            ["z"] = 55.47,
            ["h"] = 25.89,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },



    ["grovetreet2"] = { 
        ["coords"] = {
            ["x"] = -51.06,
            ["y"] = -1783.56,
            ["z"] = 28.3,
            ["h"] = 312.24,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["grovetreet3"] = { 
        ["coords"] = {
            ["x"] = -42.56,
            ["y"] = -1792.78,
            ["z"] = 27.83,
            ["h"] = 311.7,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["grovetreet4"] = { 
        ["coords"] = {
            ["x"] = 20.57,
            ["y"] = -1844.12,
            ["z"] = 24.61,
            ["h"] = 311.7,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["grovetreet5"] = { 
        ["coords"] = {
            ["x"] = 29.46,
            ["y"] = -1854.13,
            ["z"] = 24.07,
            ["h"] = 213.93,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["grovetreet6"] = { 
        ["coords"] = {
            ["x"] = 45.88,
            ["y"] = -1864.37,
            ["z"] = 23.28,
            ["h"] = 313.24,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["grovetreet7"] = { 
        ["coords"] = {
            ["x"] = 54.44,
            ["y"] = -1873.17,
            ["z"] = 22.81,
            ["h"] = 313.24,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["grovetreet8"] = { 
        ["coords"] = {
            ["x"] = 100.48,
            ["y"] = -1913.0,
            ["z"] = 21.21,
            ["h"] = 313.24,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },
    ["grovetreet9"] = { 
        ["coords"] = {
            ["x"] = 117.81,
            ["y"] = -1920.55,
            ["z"] = 21.33,
            ["h"] = 313.24,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },
    ["grovetreet10"] = { 
        ["coords"] = {
            ["x"] = 126.4,
            ["y"] = -1929.47,
            ["z"] = 21.39,
            ["h"] = 313.24,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["grovetreet11"] = { 
        ["coords"] = {
            ["x"] = 114.05,
            ["y"] = -1960.69,
            ["z"] = 21.34,
            ["h"] = 313.24,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },



    ["covenantavenue1"] = { 
        ["coords"] = {
            ["x"] = 207.81,
            ["y"] = -1894.66,
            ["z"] = 24.82,
            ["h"] = 202.53,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["covenantavenue2"] = { 
        ["coords"] = {
            ["x"] = 192.15,
            ["y"] = -1883.45,
            ["z"] = 25.06,
            ["h"] = 336.85,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },
    
    ["covenantavenue3"] = { 
        ["coords"] = {
            ["x"] = 170.9,
            ["y"] = -1871.29,
            ["z"] = 24.41,
            ["h"] = 336.85,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["covenantavenue4"] = { 
        ["coords"] = {
            ["x"] = 149.69,
            ["y"] = -1865.39,
            ["z"] = 24.6,
            ["h"] = 336.34,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["covenantavenue5"] = { 
        ["coords"] = {
            ["x"] = 130.2,
            ["y"] = -1854.03,
            ["z"] = 25.06,
            ["h"] = 336.34,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },



    ["beachsidecourt13"] = { 
        ["coords"] = {
            ["x"] = -1072.12,
            ["y"] = -1565.56,
            ["z"] = 4.38,
            ["h"] = 127.21,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["beachsidecourt14"] = { 
        ["coords"] = {
            ["x"] = -1073.21,
            ["y"] = -1562.03,
            ["z"] = 4.5,
            ["h"] = 307.4,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["beachsidecourt15"] = { 
        ["coords"] = {
            ["x"] = -1066.13,
            ["y"] = -1545.24,
            ["z"] = 4.9,
            ["h"] = 205.77,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },




    ["brougeavenue1"] = { 
        ["coords"] = {
            ["x"] = 252.35,
            ["y"] = -1671.55,
            ["z"] = 29.67,
            ["h"] = 205.77,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["brougeavenue2"] = { 
        ["coords"] = {
            ["x"] = 241.07,
            ["y"] = -1687.98,
            ["z"] = 29.7,
            ["h"] = 48.26,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["brougeavenue3"] = { 
        ["coords"] = {
            ["x"] = 222.83,
            ["y"] = -1702.83,
            ["z"] = 29.69,
            ["h"] = 48.26,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["brougeavenue4"] = { 
        ["coords"] = {
            ["x"] = 216.83,
            ["y"] = -1717.15,
            ["z"] = 29.48,
            ["h"] = 32.02,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["brougeavenue5"] = { 
        ["coords"] = {
            ["x"] = 198.27,
            ["y"] = -1725.64,
            ["z"] = 29.66,
            ["h"] = 114.47,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },




    ["coopenmarthacourt1"] = { 
        ["coords"] = {
            ["x"] = -903.28,
            ["y"] = -1005.54,
            ["z"] = 2.15,
            ["h"] = 209.72,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["coopenmarthacourt2"] = { 
        ["coords"] = {
            ["x"] = -903.28,
            ["y"] = -1005.54,
            ["z"] = 2.15,
            ["h"] = 209.72,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["coopenmarthacourt3"] = { 
        ["coords"] = {
            ["x"] = -903.28,
            ["y"] = -1005.54,
            ["z"] = 2.15,
            ["h"] = 209.72,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["coopenmarthacourt4"] = { 
        ["coords"] = {
            ["x"] = -913.66,
            ["y"] = -989.39,
            ["z"] = 2.16,
            ["h"] = 209.72,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["coopenmarthacourt5"] = { 
        ["coords"] = {
            ["x"] = -908.07,
            ["y"] = -976.76,
            ["z"] = 2.16,
            ["h"] = 209.72,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },


    ["imaginationcourt1"] = { 
        ["coords"] = {
            ["x"] = -995.17,
            ["y"] = -966.99,
            ["z"] = 2.55,
            ["h"] = 125.08,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["imaginationcourt2"] = { 
        ["coords"] = {
            ["x"] = -994.98,
            ["y"] = -966.47,
            ["z"] = 2.55,
            ["h"] = 125.08,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["imaginationcourt3"] = { 
        ["coords"] = {
            ["x"] = -978.21,
            ["y"] = -990.68,
            ["z"] = 4.55,
            ["h"] = 125.08,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["imaginationcourt4"] = { 
        ["coords"] = {
            ["x"] = -1019.04,
            ["y"] = -963.69,
            ["z"] = 2.16,
            ["h"] = 125.08,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["imaginationcourt5"] = { 
        ["coords"] = {
            ["x"] = -1027.89,
            ["y"] = -968.72,
            ["z"] = 2.15,
            ["h"] = 209.22,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },





    ["inventioncourt1"] = { 
        ["coords"] = {
            ["x"] = -942.91,
            ["y"] = -1075.95,
            ["z"] = 2.75,
            ["h"] = 29.28,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["inventioncourt2"] = { 
        ["coords"] = {
            ["x"] = -952.38,
            ["y"] = -1077.93,
            ["z"] = 2.48,
            ["h"] = 33.51,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["inventioncourt3"] = { 
        ["coords"] = {
            ["x"] = -952.38,
            ["y"] = -1077.93,
            ["z"] = 2.48,
            ["h"] = 33.51,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["inventioncourt4"] = { 
        ["coords"] = {
            ["x"] = -982.6,
            ["y"] = -1083.71,
            ["z"] = 2.55,
            ["h"] = 105.77,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["inventioncourt5"] = { 
        ["coords"] = {
            ["x"] = -982.64,
            ["y"] = -1083.86,
            ["z"] = 2.55,
            ["h"] = 75.01,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },




    ["jamestownstreet1"] = { 
        ["coords"] = {
            ["x"] = 500.25,
            ["y"] = -1697.49,
            ["z"] = 29.79,
            ["h"] = 123.21,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["jamestownstreet2"] = { 
        ["coords"] = {
            ["x"] = 490.28,
            ["y"] = -1714.48,
            ["z"] = 29.71,
            ["h"] = 59.18,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["jamestownstreet3"] = { 
        ["coords"] = {
            ["x"] = 479.51,
            ["y"] = -1736.71,
            ["z"] = 29.16,
            ["h"] = 59.18,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["jamestownstreet4"] = { 
        ["coords"] = {
            ["x"] = 475.44,
            ["y"] = -1757.74,
            ["z"] = 28.9,
            ["h"] = 72.47,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["jamestownstreet5"] = { 
        ["coords"] = {
            ["x"] = 472.88,
            ["y"] = -1775.22,
            ["z"] = 29.07,
            ["h"] = 72.47,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["jamestownstreet6"] = { 
        ["coords"] = {
            ["x"] = 440.01,
            ["y"] = -1830.31,
            ["z"] = 28.37,
            ["h"] = 72.47,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["jamestownstreet7"] = { 
        ["coords"] = {
            ["x"] = 427.73,
            ["y"] = -1841.69,
            ["z"] = 28.46,
            ["h"] = 135.41,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["jamestownstreet8"] = { 
        ["coords"] = {
            ["x"] = 412.58,
            ["y"] = -1856.23,
            ["z"] = 27.33,
            ["h"] = 135.41,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["jamestownstreet9"] = { 
        ["coords"] = {
            ["x"] = 399.67,
            ["y"] = -1864.78,
            ["z"] = 26.72,
            ["h"] = 135.41,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["jamestownstreet10"] = { 
        ["coords"] = {
            ["x"] = 385.21,
            ["y"] = -1881.76,
            ["z"] = 26.03,
            ["h"] = 45.78,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["jamestownstreet11"] = { 
        ["coords"] = {
            ["x"] = 368.26,
            ["y"] = -1896.15,
            ["z"] = 25.18,
            ["h"] = 291.54,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["jamestownstreet12"] = { 
        ["coords"] = {
            ["x"] = 324.15,
            ["y"] = -1937.81,
            ["z"] = 25.02,
            ["h"] = 68.42,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },



    ["roylowensteinblvd1"] = { 
        ["coords"] = {
            ["x"] = 321.03,
            ["y"] = -1760.03,
            ["z"] = 29.64,
            ["h"] = 49.01,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["roylowensteinblvd2"] = { 
        ["coords"] = {
            ["x"] = 321.03,
            ["y"] = -1760.03,
            ["z"] = 29.64,
            ["h"] = 49.01,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["roylowensteinblvd3"] = { 
        ["coords"] = {
            ["x"] = 305.15,
            ["y"] = -1775.86,
            ["z"] = 29.1,
            ["h"] = 49.0,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["roylowensteinblvd4"] = { 
        ["coords"] = {
            ["x"] = 299.84,
            ["y"] = -1784.04,
            ["z"] = 28.44,
            ["h"] = 49.0,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["roylowensteinblvd5"] = { 
        ["coords"] = {
            ["x"] = 289.25,
            ["y"] = -1791.99,
            ["z"] = 28.09,
            ["h"] = 49.0,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },


    ["strawberryavenue1"] = { 
        ["coords"] = {
            ["x"] = -35.06,
            ["y"] = -1554.59,
            ["z"] = 30.68,
            ["h"] = 149.92,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["strawberryavenue2"] = { 
        ["coords"] = {
            ["x"] = -33.99,
            ["y"] = -1566.78,
            ["z"] = 33.02,
            ["h"] = 229.57,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["strawberryavenue3"] = { 
        ["coords"] = {
            ["x"] = -35.36,
            ["y"] = -1554.99,
            ["z"] = 33.82,
            ["h"] = 132.99,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["strawberryavenue4"] = { 
        ["coords"] = {
            ["x"] = -44.2,
            ["y"] = -1547.45,
            ["z"] = 34.62,
            ["h"] = 50.94,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },


    ["strawberryavenue5"] = { 
        ["coords"] = {
            ["x"] = -28.52,
            ["y"] = -1560.41,
            ["z"] = 33.83,
            ["h"] = 50.94,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["forumdrive1"] = { 
        ["coords"] = {
            ["x"] = -157.6,
            ["y"] = -1680.11,
            ["z"] = 33.44,
            ["h"] = 190.64,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["forumdrive2"] = { 
        ["coords"] = {
            ["x"] = -148.39,
            ["y"] = -1688.04,
            ["z"] = 32.88,
            ["h"] = 190.64,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["forumdrive3"] = { 
        ["coords"] = {
            ["x"] = -147.3,
            ["y"] = -1688.99,
            ["z"] = 32.88,
            ["h"] = 356.1,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["forumdrive4"] = { 
        ["coords"] = {
            ["x"] = -141.61,
            ["y"] = -1693.69,
            ["z"] = 33.07,
            ["h"] = 230.79,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["forumdrive5"] = { 
        ["coords"] = {
            ["x"] = -141.79,
            ["y"] = -1692.75,
            ["z"] = 32.87,
            ["h"] = 308.31,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },
    ["forumdrive6"] = { 
        ["coords"] = {
            ["x"] = 16.5,
            ["y"] = -1443.77,
            ["z"] = 30.95,
            ["h"] = 190.64,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["forumdrive7"] = { 
        ["coords"] = {
            ["x"] = -1.98,
            ["y"] = -1442.55,
            ["z"] = 30.97,
            ["h"] = 53.91,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["forumdrive8"] = { 
        ["coords"] = {
            ["x"] = -32.87,
            ["y"] = -1446.34,
            ["z"] = 31.9,
            ["h"] = 53.91,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["forumdrive9"] = { 
        ["coords"] = {
            ["x"] = -45.73,
            ["y"] = -1445.58,
            ["z"] = 32.43,
            ["h"] = 200.99,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

    ["forumdrive10"] = { 
        ["coords"] = {
            ["x"] = -64.48,
            ["y"] = -1449.57,
            ["z"] = 32.53,
            ["h"] = 200.99,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },


    ["beachsideavenue1"] = { 
        ["coords"] = {
            ["x"] = -1098.74,
            ["y"] = -1679.17,
            ["z"] = 4.37,
            ["h"] = 301.63,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },
    
    ["beachsideavenue2"] = { 
        ["coords"] = {
            ["x"] = -1097.58,
            ["y"] = -1673.07,
            ["z"] = 8.4,
            ["h"] = 303.23,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },
    
    ["beachsideavenue3"] = { 
        ["coords"] = {
            ["x"] = -1349.59,
            ["y"] = -1187.7,
            ["z"] = 4.57,
            ["h"] = 270.84,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },
    
    ["beachsideavenue4"] = { 
        ["coords"] = {
            ["x"] = -1347.14,
            ["y"] = -1167.87,
            ["z"] = 4.58,
            ["h"] = 1.09,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },
    
    ["beachsideavenue5"] = { 
        ["coords"] = {
            ["x"] = -1350.20,
            ["y"] = -1161.41,
            ["z"] = 4.51,
            ["h"] = 272.7,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },
    
    ["beachsideavenue6"] = { 
        ["coords"] = {
            ["x"] = -1347.23,
            ["y"] = -1145.91,
            ["z"] = 4.34,
            ["h"] = 188.54,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },
    
    ["beachsideavenue7"] = { 
        ["coords"] = {
            ["x"] = -1336.27,
            ["y"] = -1145.51,
            ["z"] = 6.74,
            ["h"] = 182.88,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },
    
    ["beachsideavenue8"] = { 
        ["coords"] = {
            ["x"] = -1374.53,
            ["y"] = -1074.28,
            ["z"] = 4.32,
            ["h"] = 298.81,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },
    
    ["beachsideavenue9"] = { 
        ["coords"] = {
            ["x"] = -1376.91,
            ["y"] = -1070.31,
            ["z"] = 4.35,
            ["h"] = 304.06,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },
    
    ["beachsideavenue10"] = { 
        ["coords"] = {
            ["x"] = -1379.84,
            ["y"] = -1066.37,
            ["z"] = 4.35,
            ["h"] = 300.87,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },
    
    
    ["beachsideavenue12"] = { 
        ["coords"] = {
            ["x"] = -1384.78,
            ["y"] = -1058.38,
            ["z"] = 4.36,
            ["h"] = 300.69,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },
    
    ["beachsideavenue13"] = { 
        ["coords"] = {
            ["x"] = -1386.93,
            ["y"] = -1054.22,
            ["z"] = 4.34,
            ["h"] = 300.69,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },
    
    ["beachsideavenue14"] = { 
        ["coords"] = {
            ["x"] = -1370.18,
            ["y"] = -1042.84,
            ["z"] = 4.26,
            ["h"] = 216.51,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },
    
    ["beachsideavenue15"] = { 
        ["coords"] = {
            ["x"] = -1366.28,
            ["y"] = -1039.9,
            ["z"] = 4.26,
            ["h"] = 216.51,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },
    
    ["beachsideavenue16"] = { 
        ["coords"] = {
            ["x"] = -1362.4,
            ["y"] = -1037.3,
            ["z"] = 4.25,
            ["h"] = 216.51,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },
    
    ["beachsideavenue17"] = { 
        ["coords"] = {
            ["x"] = -1358.3,
            ["y"] = -1035.08,
            ["z"] = 4.24,
            ["h"] = 216.51,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },
    
    ["beachsideavenue18"] = { 
        ["coords"] = {
            ["x"] = -1754.06,
            ["y"] = -725.21,
            ["z"] = 10.29,
            ["h"] = 313.99,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },
    
    ["beachsideavenue19"] = { 
        ["coords"] = {
            ["x"] = -1754.74,
            ["y"] = -708.34,
            ["z"] = 10.4,
            ["h"] = 226.94,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },
    
    ["beachsideavenue20"] = { 
        ["coords"] = {
            ["x"] = -1764.34,
            ["y"] = -708.4,
            ["z"] = 10.62,
            ["h"] = 329.99,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },
    
    
    ["jamestownstreet13"] = { 
        ["coords"] = {
            ["x"] = 312.81,
            ["y"] = -1956.66,
            ["z"] = 24.43,
            ["h"] = 56.9,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },
    
    ["jamestownstreet14"] = { 
        ["coords"] = {
            ["x"] = 296.54,
            ["y"] = -1972.44,
            ["z"] = 22.7,
            ["h"] = 49.22,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },
    
    ["jamestownstreet15"] = { 
        ["coords"] = {
            ["x"] = 291.23,
            ["y"] = -1980.74,
            ["z"] = 21.61,
            ["h"] = 324.31,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },
    
    ["jamestownstreet16"] = { 
        ["coords"] = {
            ["x"] = 280.23,
            ["y"] = -1993.25,
            ["z"] = 20.81,
            ["h"] = 136.65,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },
    
    ["jamestownstreet17"] = { 
        ["coords"] = {
            ["x"] = 257.12,
            ["y"] = -2023.84,
            ["z"] = 19.27,
            ["h"] = 50.21,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },
    
    ["jamestownstreet18"] = { 
        ["coords"] = {
            ["x"] = 251.39,
            ["y"] = -2029.73,
            ["z"] = 18.51,
            ["h"] = 147.25,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },
    
    ["jamestownstreet19"] = { 
        ["coords"] = {
            ["x"] = 236.5,
            ["y"] = -2045.73,
            ["z"] = 18.38,
            ["h"] = 147.26,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },
    
    ["royLowensteinBlvd11"] = {
        ["coords"] = {
            ["x"] = 250.6,
            ["y"] = -1934.84,
            ["z"] = 24.7,
            ["h"] = 226.17,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },
    
    ["royLowensteinBlvd12"] = {
        ["coords"] = {
            ["x"] = 258.13,
            ["y"] = -1927.18,
            ["z"] = 25.44,
            ["h"] = 319.88,
    
            ["royLowensteinBlvd11"] = {
        ["coords"] = {
            ["x"] = 250.6,
            ["y"] = -1934.84,
            ["z"] = 24.7,
            ["h"] = 226.17,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },
    
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },
    
    
    ["royLowensteinBlvd13"] = {
        ["coords"] = {
            ["x"] = 270.26,
            ["y"] = -1917.06,
            ["z"] = 26.18,
            ["h"] = 320.82,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },
    
    
    ["royLowensteinBlvd14"] = {
        ["coords"] = {
            ["x"] = 282.8,
            ["y"] = -1899.18,
            ["z"] = 27.27,
            ["h"] = 224.43,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },
    
    
    ["royLowensteinBlvd15"] = {
        ["coords"] = {
            ["x"] = 320.28,
            ["y"] = -1853.97,
            ["z"] = 27.51,
            ["h"] = 212.88,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },
    
    
    ["royLowensteinBlvd16"] = {
        ["coords"] = {
            ["x"] = 329.27,
            ["y"] = -1845.9,
            ["z"] = 27.75,
            ["h"] = 223.78,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },
    
    
    
    ["royLowensteinBlvd17"] = {
        ["coords"] = {
            ["x"] = 338.79,
            ["y"] = -1829.56,
            ["z"] = 28.34,
            ["h"] = 134.85,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },
    
    
    
    ["royLowensteinBlvd18"] = {
        ["coords"] = {
            ["x"] = 348.66,
            ["y"] = -1820.85,
            ["z"] = 28.89,
            ["h"] = 141.59,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },
    
    
    ["royLowensteinBlvd19"] = {
        ["coords"] = {
            ["x"] = 405.78,
            ["y"] = -1751.23,
            ["z"] = 29.71,
            ["h"] = 319.21,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },
    
    
    ["royLowensteinBlvd20"] = {
        ["coords"] = {
            ["x"] = 418.89,
            ["y"] = -1735.52,
            ["z"] = 29.61,
            ["h"] = 321.64,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },
    
    
    ["royLowensteinBlvd21"] = {
        ["coords"] = {
            ["x"] = 431.01,
            ["y"] = -1725.56,
            ["z"] = 29.6,
            ["h"] = 319.22,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },
    
    
    ["royLowensteinBlvd22"] = {
        ["coords"] = {
            ["x"] = 443.37,
            ["y"] = -1707.35,
            ["z"] = 29.71,
            ["h"] = 233.81,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },
    
    
    ["royLowensteinBlvd23"] = {
        ["coords"] = {
            ["x"] = 470.79,
            ["y"] = -1561.16,
            ["z"] = 32.83,
            ["h"] = 53.93,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },
    
    
    ["royLowensteinBlvd24"] = {
        ["coords"] = {
            ["x"] = 465.68,
            ["y"] = -1567.26,
            ["z"] = 32.83,
            ["h"] = 59.19,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },
    
    
    ["royLowensteinBlvd25"] = {
        ["coords"] = {
            ["x"] = 460.66,
            ["y"] = -1573.32,
            ["z"] = 32.82,
            ["h"] = 54.83,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },
    
    
    ["royLowensteinBlvd26"] = {
        ["coords"] = {
            ["x"] = 454.84,
            ["y"] = -1580.19,
            ["z"] = 32.82,
            ["h"] = 146.42,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },
    
    
    ["royLowensteinBlvd27"] = {
        ["coords"] = {
            ["x"] = 442.28,
            ["y"] = -1569.71,
            ["z"] = 32.82,
            ["h"] = 148.74,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },
    
    
    ["royLowensteinBlvd28"] = {
        ["coords"] = {
            ["x"] = 436.27,
            ["y"] = -1564.55,
            ["z"] = 32.82,
            ["h"] = 149.83,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },
    
    
    ["royLowensteinBlvd29"] = {
        ["coords"] = {
            ["x"] = 430.39,
            ["y"] = -1559.52,
            ["z"] = 32.79,
            ["h"] = 149.8,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },
    
    
    
    ["groveStreet11"] = {
        ["coords"] = {
            ["x"] = 85.7,
            ["y"] = -1959.77,
            ["z"] = 21.12,
            ["h"] = 233.78,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },
    
    
    
    ["groveStreet12"] = {
        ["coords"] = {
            ["x"] = 76.36,
            ["y"] = -1948.1,
            ["z"] = 21.17,
            ["h"] = 54.84,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },
    
    
    ["groveStreet13"] = {
        ["coords"] = {
            ["x"] = 72.13,
            ["y"] = -1939.11,
            ["z"] = 21.37,
            ["h"] = 137.05,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },
    
    
    ["groveStreet14"] = {
        ["coords"] = {
            ["x"] = 56.62,
            ["y"] = -1922.76,
            ["z"] = 21.91,
            ["h"] = 140.92,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },
    
    
    ["groveStreet15"] = {
        ["coords"] = {
            ["x"] = 39.23,
            ["y"] = -1911.49,
            ["z"] = 21.95,
            ["h"] = 52.35,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },
    
    
    ["groveStreet16"] = {
        ["coords"] = {
            ["x"] = 23.06,
            ["y"] = -1896.73,
            ["z"] = 22.97,
            ["h"] = 141.93,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },
    
    
    
    ["groveStreet17"] = {
        ["coords"] = {
            ["x"] = 5.29,
            ["y"] = -1884.26,
            ["z"] = 23.7,
            ["h"] = 229.96,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },
    
    
    ["groveStreet18"] = {
        ["coords"] = {
            ["x"] = -20.5,
            ["y"] = -1859.04,
            ["z"] = 25.41,
            ["h"] = 229.0,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },
    
    
    ["groveStreet19"] = {
        ["coords"] = {
            ["x"] = -34.18,
            ["y"] = -1847.0,
            ["z"] = 26.19,
            ["h"] = 50.84,
        },
        ["opened"] = false,
        ["tier"] = 1,
        ["furniture"] = {
            [1] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 3.1,
                    ["y"] = -4.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [2] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = -3.5,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search cabin"
            },
            [3] = {
                ["type"] = "kitchen",
                ["coords"] = {
                    ["x"] = 0.9,
                    ["y"] = -6.3,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search kitchen cabins"
            },
            [4] = {
                ["type"] = "chest",
                ["coords"] = {
                    ["x"] = 9.3,
                    ["y"] = -1.3,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search chest"
            },
            [5] = {
                ["type"] = "cabin",
                ["coords"] = {
                    ["x"] = 5.85,
                    ["y"] = 2.6,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search night stand"
            },
            [6] = {
                ["type"] = "underbed",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 2.0,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search underbed"
            },
            [7] = {
                ["type"] = "Storage",
                ["coords"] = {
                    ["x"] = 7.3,
                    ["y"] = 4.2,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Storage"
            },
            [8] = {
                ["type"] = "chest2",
                ["coords"] = {
                    ["x"] = 8.5,
                    ["y"] = -2.1,
                    ["z"] = 2.0,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Chest"
            },
    
            [9] = {
                ["type"] = "table",
                ["coords"] = {
                    ["x"] = -4.0,
                    ["y"] = -4.2,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Table"
            },
            [10] = {
                ["type"] = "fridge",
                ["coords"] = {
                    ["x"] = 1.5,
                    ["y"] = -3.8,
                    ["z"] = 2.5,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search Fridge"
            },
            [11] = {
                ["type"] = "table2",
                ["coords"] = {
                    ["x"] = -5.0,
                    ["y"] = 0.5,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [12] = {
                ["type"] = "table3",
                ["coords"] = {
                    ["x"] = -2.0,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
            [13] = {
                ["type"] = "War",
                ["coords"] = {
                    ["x"] = 2.8,
                    ["y"] = 1.3,
                    ["z"] = 1.8,
                },
                ["searched"] = false,
                ["isBusy"] = false,
                ["text"] = "Search"
            },
    
        }
    },

}


Config.MaleNoHandshoes = {
    [0] = true,
    [1] = true,
    [2] = true,
    [3] = true,
    [4] = true,
    [5] = true,
    [6] = true,
    [7] = true,
    [8] = true,
    [9] = true,
    [10] = true,
    [11] = true,
    [12] = true,
    [13] = true,
    [14] = true,
    [15] = true,
    [16] = true,
    [18] = true,
    [26] = true,
    [52] = true,
    [53] = true,
    [54] = true,
    [55] = true,
    [56] = true,
    [57] = true,
    [58] = true,
    [59] = true,
    [60] = true,
    [61] = true,
    [62] = true,
    [112] = true,
    [113] = true,
    [114] = true,
    [118] = true,
    [125] = true,
    [132] = true,
}

Config.FemaleNoHandshoes = {
    [0] = true,
    [1] = true,
    [2] = true,
    [3] = true,
    [4] = true,
    [5] = true,
    [6] = true,
    [7] = true,
    [8] = true,
    [9] = true,
    [10] = true,
    [11] = true,
    [12] = true,
    [13] = true,
    [14] = true,
    [15] = true,
    [19] = true,
    [59] = true,
    [60] = true,
    [61] = true,
    [62] = true,
    [63] = true,
    [64] = true,
    [65] = true,
    [66] = true,
    [67] = true,
    [68] = true,
    [69] = true,
    [70] = true,
    [71] = true,
    [129] = true,
    [130] = true,
    [131] = true,
    [135] = true,
    [142] = true,
    [149] = true,
    [153] = true,
    [157] = true,
    [161] = true,
    [165] = true,
}

