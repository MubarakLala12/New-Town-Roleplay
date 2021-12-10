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
----------------------------------oxy------------------------------

-- Oxy runs.
Config.DefaultPrice = 2000 -- How much you pay at the start to start the run

Config.RunAmount = math.random(6,10) -- How many drop offs the player does before it automatixally stops.

Config.Payment = math.random(800, 1000) -- How much you get paid when RN Jesus doesnt give you oxy, divided by 2 for when it does.

Config.Item = "oxy" -- The item you receive from the oxy run. Should be oxy right??
Config.OxyChance = 550 -- Percentage chance of getting oxy on the run. Multiplied by 100. 10% = 100, 20% = 200, 50% = 500, etc. Default 55%.
Config.OxyAmount = 1 -- How much oxy you get when RN Jesus gives you oxy. Default: 1.

Config.BigRewarditemChance = 500 -- Percentage of getting rare item on oxy run. Multiplied by 100. 0.1% = 1, 1% = 10, 20% = 200, 50% = 500, etc. Default 0.1%.
Config.BigRewarditem = "greenchip" -- Put a rare item here which will have 0.1% chance of being given on the run.

Config.OxyCars = "CHECK THE CODE" -- Cars

Config.DropOffs = "CHECK THE CODE" -- Drop off spots


----------------------recycle---------------------
Config['delivery'] = {
	--outsideLocation = {x=973.56,y=-2190.55,z=30.55,a=230.732},
	outsideLocation = {x=-592.53,y=-1765.05,z=23.18,a=56.54},
	insideLocation = {x=1072.72,y=-3102.51,z=-40.0,a=82.95},
	pickupLocations = {
		[1] = {x=1067.68,y=-3095.43,z=-39.9,a=342.39},
		[2] = {x=1065.2,y=-3095.56,z=-39.9,a=356.53},
		[3] = {x=1062.73,y=-3095.15,z=-39.9,a=184.81},
		[4] = {x=1060.37,y=-3095.06,z=-39.9,a=190.3},
		[5] = {x=1057.95,y=-3095.51,z=-39.9,a=359.02},
		[6] = {x=1055.58,y=-3095.53,z=-39.9,a=0.95},
		[7] = {x=1053.09,y=-3095.57,z=-39.9,a=347.64},
		[8] = {x=1053.07,y=-3102.46,z=-39.9,a=180.26},
		[9] = {x=1055.49,y=-3102.45,z=-39.9,a=180.46},
		[10] = {x=1057.93,y=-3102.55,z=-39.9,a=174.22},
		[11] = {x=1060.19,y=-3102.38,z=-39.9,a=189.44},
		[12] = {x=1062.71,y=-3102.53,z=-39.9,a=182.11},
		[13] = {x=1065.19,y=-3102.48,z=-39.9,a=176.23},
		[14] = {x=1067.46,y=-3102.62,z=-39.9,a=188.28},
		[15] = {x=1067.69,y=-3110.01,z=-39.9,a=173.63},
		[16] = {x=1065.13,y=-3109.88,z=-39.9,a=179.46},
		[17] = {x=1062.7,y=-3110.07,z=-39.9,a=174.32},
		[18] = {x=1060.24,y=-3110.26,z=-39.9,a=177.77},
		[19] = {x=1057.76,y=-3109.82,z=-39.9,a=183.88},
		[20] = {x=1055.52,y=-3109.76,z=-39.9,a=181.36},
		[21] = {x=1053.16,y=-3109.71,z=-39.9,a=177.0},
	},
	dropLocation = {x = 1048.224, y = -3097.071, z = -38.999, a = 274.810},
	warehouseObjects = {
		"prop_boxpile_05a",
		"prop_boxpile_04a",
		"prop_boxpile_06b",
		"prop_boxpile_02c",
		"prop_boxpile_02b",
		"prop_boxpile_01a",
		"prop_boxpile_08a",
	},
}

Config.Locationsrecycle = {
    ["rstash"] = {x = 1049.86, y = -3110.05, z = -39.0, h = 179.65, r = 1.0},
}

----------------------------------------------trucker--------------------------------

Config.BailPricetruck = 1000

Config.Locationstruck = {
    ["main"] = {
        label = "Amazon Delivery",
        coords = {x = 78.86, y = 112.51, z = 81.17, h = 339.77},
    },
    ["vehicle"] = {
        label = "Amazon Delivery Vehicle",
        coords = {x = 68.23, y = 121.79, z = 79.13, h = 151.84},
        --coords = {x = 141.12, y = -3204.31, z = 5.85, h = 267.5},
    },
    ["stores"] ={
        [1] = {
            name = "ltdgasoline",
            coords = {x = -41.07, y = -1747.91, z = 29.4, h = 137.5},
        },
        [2] = {
            name = "247supermarket",
            coords = {x = 31.62, y = -1315.87, z = 29.52, h = 179.5},
        },
        [3] = {
            name = "robsliquor",
            coords = {x = -1226.48, y = -907.58, z = 12.32, h = 119.5},
        },
        [4] = {
            name = "ltdgasoline2",
            coords = {x = -714.13, y = -909.13, z = 19.21, h = 0.5},
        },
        [5] = {
            name = "robsliquor2",
            coords = {x = -1469.78, y = -366.72, z = 40.2, h = 138.5},
        },
        [6] = {
            name = "ltdgasoline3",
            coords = {x = -1829.15, y = 791.99, z = 138.26, h = 46.5},
        },
        [7] = {
            name = "robsliquor3",
            coords = {x = -2959.92, y = 396.77, z = 15.02, h = 178.5},
        },
        [8] = {
            name = "247supermarket2",
            coords = {x = -3047.58, y = 589.89, z = 7.78, h = 199.5},
        },
        [9] = {
            name = "247supermarket3",
            coords = {x = -3245.85, y = 1008.25, z = 12.83, h = 90.5},
        },
        [8] = {
            name = "247supermarket4",
            coords = {x = 1735.54, y = 6416.28, z = 35.03, h = 332.5},
        },
        [9] = {
            name = "247supermarket5",
            coords = {x = 1702.84, y = 4917.28, z = 42.22, h = 323.5},
        },
        [10] = {
            name = "247supermarket6",
            coords = {x = 1960.47, y = 3753.59, z = 32.26, h = 127.5},
        },
        [11] = {
            name = "robsliquor4",
            coords = {x = 1169.27, y = 2707.7, z = 38.15, h = 267.5},
        },
        [12] = {
            name = "247supermarket7",
            coords = {x = 543.47, y = 2658.81, z = 42.17, h = 277.5},
        },
        [13] = {
            name = "247supermarket8",
            coords = {x = 2678.09, y = 3288.43, z = 55.24, h = 61.5},
        },
        [14] = {
            name = "247supermarket9",
            coords = {x = 2553.0, y = 399.32, z = 108.61, h = 179.5, r = 1.0},
        },
        [15] = {
            name = "ltdgasoline4",
            coords = {x = 1155.97, y = -319.76, z = 69.2, h = 17.5},
        },
        [16] = {
            name = "robsliquor5",
            coords = {x = 1119.78, y = -983.99, z = 46.29, h = 287.5},
        },
        [17] = {
            name = "247supermarket9",
            coords = {x = 382.13, y = 326.2, z = 103.56, h = 253.5},
        },
        [18] = {
            name = "hardware",
            coords = {x = 89.33, y = -1745.44, z = 30.08, h = 143.5},
        },
        [19] = {
            name = "hardware2",
            coords = {x = 2704.09, y = 3457.55, z = 55.53, h = 339.5},
        },
        -- [20] = {
        --     name = "legion",
        --     coords = {x = 194.61, y = -887.81, z = 30.71, h = 157.28},
        -- },
        
    },
}

Config.Vehiclestruck = {
    ["tranp"] = "Amazon Van",
}


Config.RewardItemstruck = {
    ["labkey"] = {},

    ["firstaid"] = {},

    ["papera"] = {},


}
--------------------------vehicle rental2---------------------------

Config.RentalPoint2 = {
    [1] = {
        ["coords"] = {
            [1] = {
                ["x"] = 1854.19,
                ["y"] = 2578.59,
                ["z"] = 45.67,

            },
            [2] = {
                ["x"] = 1854.19,
                ["y"] = 2578.59,
                ["z"] = 45.67,
            }
            
        }
    }
}


Config.DeliveryPoint2 = { 
    [1] = { 
        ["coords"] = { 
            ["x"] = 491.92, 
            ["y"] = -987.38,
            ["z"] = 27.63,
        }
    }
}

Config.RentalVehicle2 = {
    [1] = {
        ["label"] = "Faggio",
        ["model"] = "Faggio",
        ["price"] = 500,
    },
}
