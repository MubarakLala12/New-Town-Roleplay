Config = {}

Config.Keys = {
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

Config.Products = {
    ["normal"] = {
        [1] = {
            name = "tosti",
            price = 50,
            amount = 100,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "water_bottle",
            price = 30,
            amount = 100,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "kurkakola",
            price = 45,
            amount = 100,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "twerks_candy",
            price = 40,
            amount = 100,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "snikkel_candy",
            price = 40,
            amount = 100,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "sandwich",
            price = 50,
            amount = 100,
            info = {},
            type = "item",
            slot = 6,
        },

        [7] = {
            name = "bandage",
            price = 60,
            amount = 100,
            info = {},
            type = "item",
            slot = 7,
        },
        [8] = {
            name = "lighter",
            price = 50,
            amount = 50,
            info = {},
            type = "item",
            slot = 8,
        },
        [9] = {
            name = "rolling_paper",
            price = 5,
            amount = 5000,
            info = {},
            type = "item",
            slot = 9,
        },
        [10] = {
            name = "fishingbait",
            price = 5,
            amount = 5000,
            info = {},
            type = "item",
            slot = 10,
        },

        [11] = {
            name = "bakingsoda",
            price = 20,
            amount = 150,
            info = {},
            type = "item",
            slot = 11,
        },
        [12] = {
            name = "walkstick",
            price = 150,
            amount = 10,
            info = {},
            type = "item",
            slot = 12,
        },
    },

    -- ["inbag"] = {

    --     [1] = {
    --         name = "invbag",
    --         price = 10000,
    --         amount = 1,
    --         info = {},
    --         type = "item",
    --         slot = 1,
    --     }
    -- },

    ["ophone"] = {

        [1] = {
            name = "phone",
            price = 1000,
            amount = 50,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "fitbit",
            price = 500,
            amount = 150,
            info = {},
            type = "item",
            slot = 2,
        },


    },

    ["mechanic"] = {
        [1] = {
            name = "lockpick",
            price = 200,
            amount = 50,
            info = {},
            type = "item",
            slot = 1,
        },
        
        [2] = {
            name = "repairkit",
            price = 300,
            amount = 50,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "screwdriverset",
            price = 350,
            amount = 50,
            info = {},
            type = "item",
            slot = 3,
        },
     
        [4] = {
            name = "cleaningkit",
            price = 150,
            amount = 150,
            info = {},
            type = "item",
            slot = 4,
        },
        
    },

    -- ["cinema"] = {
    --     [1] = {
    --         name = "tosti",
    --         price = 50,
    --         amount = 50,
    --         info = {},
    --         type = "item",
    --         slot = 1,
    --     },
    --     [2] = {
    --         name = "water_bottle",
    --         price = 30,
    --         amount = 50,
    --         info = {},
    --         type = "item",
    --         slot = 2,
    --     },
    --     [3] = {
    --         name = "kurkakola",
    --         price = 45,
    --         amount = 50,
    --         info = {},
    --         type = "item",
    --         slot = 3,
    --     },
    -- },

    ["weazelnews"] = {
        [1] = {
            name = "tosti",
            price = 50,
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
        [3] = {
            name = "kurkakola",
            price = 45,
            amount = 50,
            info = {},
            type = "item",
            slot = 3,
        },
    },
    ["casino"] = {
        [1] = {
            name = "binoculars",
            price = 100,
            amount = 5,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "coffee",
            price = 12,
            amount = 200,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "lighter",
            price = 5,
            amount = 50,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "twerks_candy",
            price = 40,
            amount = 200,
            info = {},
            type = "item",
            slot = 4,
        },
        
        [5] = {
            name = "snikkel_candy",
            price = 40,
            amount = 200,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "beer",
            price = 12,
            amount = 200,
            info = {},
            type = "item",
            slot = 6,
        },
        [7] = {
            name = "whiskey",
            price = 15,
            amount = 200,
            info = {},
            type = "item",
            slot = 7,
        },
        [8] = {
            name = "vodka",
            price = 20,
            amount = 200,
            info = {},
            type = "item",
            slot = 8,
        },
    },
    ["casinohb"] = {
        [1] = {
            name = "casinochips",
            price = 1,
            amount = 100000000,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "wheelcoin",
            price = 2000,
            amount = 1000,
            info = {},
            type = "item",
            slot = 2,
        },
    },
    ["hardware"] = {
        [1] = {
            name = "lockpick",
            price = 200,
            amount = 50,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "ironoxide",
            price = 250,
            amount = 250,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "aluminumoxide",
            price = 250,
            amount = 250,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "repairkit",
            price = 300,
            amount = 50,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "screwdriverset",
            price = 350,
            amount = 50,
            info = {},
            type = "item",
            slot = 5,
        },
        
        [6] = {
            name = "radio",
            price = 250,
            amount = 50,
            info = {},
            type = "item",
            slot = 6,
        },
        [7] = {
            name = "binoculars",
            price = 150,
            amount = 50,
            info = {},
            type = "item",
            slot = 7,
        },
        [8] = {
            name = "firework1",
            price = 50,
            amount = 50,
            info = {},
            type = "item",
            slot = 8,
        },
        [9] = {
            name = "firework2",
            price = 50,
            amount = 50,
            info = {},
            type = "item",
            slot = 9,
        },
        [10] = {
            name = "firework3",
            price = 50,
            amount = 50,
            info = {},
            type = "item",
            slot = 10,
        },
        [11] = {
            name = "firework4",
            price = 50,
            amount = 50,
            info = {},
            type = "item",
            slot = 11,
        },
        [12] = {
            name = "cleaningkit",
            price = 150,
            amount = 150,
            info = {},
            type = "item",
            slot = 12,
        },
        [13] = {
            name = "fishingrod",
            price = 300,
            amount = 150,
            info = {},
            type = "item",
            slot = 13,
        },
        [14] = {
            name = "drugscales",
            price = 800,
            amount = 150,
            info = {},
            type = "item",
            slot = 14,
        },
        [15] = {
            name = "highqualityscales",
            price = 2000,
            amount = 150,
            info = {},
            type = "item",
            slot = 15,
        },
        [16] = {
            name = "weapon_petrolcan",
            price = 100,
            amount = 50,
            info = {},
            type = "item",
            slot = 16,
        },
        [17] = {
            name = "weapon_flashlight",
            price = 100,
            amount = 50,
            info = {},
            type = "item",
            slot = 17,
        },
        [18] = {
            name = "harness",
            price = 3000,
            amount = 50,
            info = {},
            type = "item",
            slot = 18,
        },
        
        
    },
    ["coffeeshop"] = {
        [1] = {
            name = "water_bottle",
            price = 30,
            amount = 50,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "weapon_poolcue",
            price = 100,
            amount = 1000,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "weed_nutrition",
            price = 20,
            amount = 1000,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "rolling_paper",
            price = 2,
            amount = 1000,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "empty_weed_bag",
            price = 5,
            amount = 1000,
            info = {},
            type = "item",
            slot = 5,
        },
    },
    ["gearshop"] = {
        [1] = {
            name = "diving_gear",
            price = 1000,
            amount = 10,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "jerry_can",
            price = 250,
            amount = 50,
            info = {},
            type = "item",
            slot = 2,
        },
    },
    ["leisureshop"] = {
        [1] = {
            name = "parachute",
            price = 1500,
            amount = 10,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "binoculars",
            price = 150,
            amount = 50,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "diving_gear",
            price = 1000,
            amount = 10,
            info = {},
            type = "item",
            slot = 3,
        },
        -- [4] = {
        --     name = "smoketrailred",
        --     price = 250,
        --     amount = 50,
        --     info = {},
        --     type = "item",
        --     slot = 4,
        -- },
    },
    ["mustapha"] = {
        [1] = {
            name = "parachute",
            price = 1500,
            amount = 10,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "binoculars",
            price = 150,
            amount = 50,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "diving_gear",
            price = 1000,
            amount = 10,
            info = {},
            type = "item",
            slot = 3,
        },
    },
    --[[["weapons"] = {
        [1] = {
            name = "weapon_knife",
            price = 50,
            amount = 250,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "weapon_switchblade",
            price = 100,
            amount = 250,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "weapon_hatchet",
            price = 250,
            amount = 250,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "weapon_pistol",
            price = 1500,
            amount = 1500,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "weapon_stungun",
            price = 1000,
            amount = 1000,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "weapon_hammer",
            price = 250,
            amount = 1000,
            info = {},
            type = "item",
            slot = 6,
        },
        [7] = {
            name = "pistol_ammo",
            price = 50,
            amount = 1500,
            info = {},
            type = "item",
            slot = 7,
        },
        [8] = {
            name = "weapon_bat",
            price = 150,
            amount = 1500,
            info = {},
            type = "item",
            slot = 8,
        },
        [9] = {
            name = "weapon_golfclub",
            price = 250,
            amount = 1500,
            info = {},
            type = "item",
            slot = 9,
        },
        [10] = {
            name = "weapon_knuckle",
            price = 250,
            amount = 1500,
            info = {},
            type = "item",
            slot = 10,
        },
        
    },]]

    ["weapons"] = {
        [1] = {
            name = "weapon_knife",
            price = 50,
            amount = 250,
            info = {
                serie = "",
            },
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "weapon_switchblade",
            price = 100,
            amount = 250,
            info = {
                serie = "",
            },
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "weapon_hatchet",
            price = 250,
            amount = 250,
            info = {
                serie = "",
            },
            type = "item",
            slot = 3,
        },
        
        [4] = {
            name = "weapon_hammer",
            price = 250,
            amount = 100,
            info = {
                serie = "",
            },
            type = "item",
            slot = 4,
        },
        
        [5] = {
            name = "weapon_bat",
            price = 150,
            amount = 150,
            info = {
                serie = "",
            },
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "weapon_golfclub",
            price = 250,
            amount = 150,
            info = {
                serie = "",
            },
            type = "item",
            slot = 6,
        },
        [7] = {
            name = "weapon_knuckle",
            price = 250,
            amount = 150,
            info = {
                serie = "",
            },
            type = "item",
            slot = 7,
        },
        [8] = {
            name = "weapon_pistol",
            price = 1500,
            amount = 150,
            info = {
                serie = "",
            },
            type = "item",
            slot = 8,
        },
        [9] = {
            name = "pistol_ammo",
            price = 100,
            amount = 1500,
            info = {},
            type = "item",
            slot = 9,
        },
        [10] = {
            name = "weapon_combatpistol",
            price = 3000,
            amount = 150,
            info = {
                serie = "",
            },
            type = "item",
            slot = 10,
        }
        
    },
  
    ["bahama"] = {
        [1] = {
            name = "beer",
            price = 100,
            amount = 500,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "whiskey",
            price = 200,
            amount = 50,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "vodka",
            price = 150,
            amount = 50,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "vine",
            price = 150,
            amount = 50,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "champagne",
            price = 250,
            amount = 50,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "tequila",
            price = 250,
            amount = 50,
            info = {},
            type = "item",
            slot = 6,
        },
        [7] = {
            name = "monster",
            price = 150,
            amount = 50,
            info = {},
            type = "item",
            slot = 7,
        },
        [8] = {
            name = "redbull",
            price = 150,
            amount = 50,
            info = {},
            type = "item",
            slot = 8,
        },
        [9] = {
            name = "bahamsspecial",
            price = 300,
            amount = 50,
            info = {},
            type = "item",
            slot = 9,
        },
    },
    ["unicorn"] = {
        [1] = {
            name = "beer",
            price = 100,
            amount = 500,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "whiskey",
            price = 200,
            amount = 50,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "vodka",
            price = 150,
            amount = 50,
            info = {},
            type = "item",
            slot = 3,
        },
    },

    ["waterclub"] = {
        [1] = {
            name = "beer",
            price = 100,
            amount = 500,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "whiskey",
            price = 200,
            amount = 50,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "vodka",
            price = 150,
            amount = 50,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "tequila",
            price = 250,
            amount = 50,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "monster",
            price = 150,
            amount = 50,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "redbull",
            price = 150,
            amount = 50,
            info = {},
            type = "item",
            slot = 6,
        },
    },
    
    ["taquila"] = {
        [1] = {
            name = "beer",
            price = 100,
            amount = 500,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "whiskey",
            price = 200,
            amount = 50,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "vodka",
            price = 150,
            amount = 50,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "tequila",
            price = 250,
            amount = 50,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "monster",
            price = 150,
            amount = 50,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "redbull",
            price = 150,
            amount = 50,
            info = {},
            type = "item",
            slot = 6,
        },
    },

    ["gov"] = {
        [1] = {
            name = "beer",
            price = 0,
            amount = 500,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "whiskey",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "vodka",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "tequila",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "monster",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "redbull",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 6,
        },
    },

    ["comedyclub"] = {
        [1] = {
            name = "beer",
            price = 100,
            amount = 500,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "monster",
            price = 150,
            amount = 50,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "redbull",
            price = 150,
            amount = 50,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "sandwich",
            price = 50,
            amount = 50,
            info = {},
            type = "item",
            slot = 4,
        },
    },

    ["Diego"] = {
        [1] = {
            name = "coffee",
            price = 10,
            amount = 500,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "lighter",
            price = 2,
            amount = 50,
            info = {},
            type = "item",
            slot = 2,
        },
    },

    --[[["hos"] = {
        [1] = {
            name = "pillbox-coffee",
            price = 15,
            amount = 500,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "pillbox-sandwich",
            price = 15,
            amount = 50,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "water_bottle",
            price = 10,
            amount = 50,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "kurkakola",
            price = 25,
            amount = 50,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "twerks_candy",
            price = 10,
            amount = 50,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "snikkel_candy",
            price = 10,
            amount = 50,
            info = {},
            type = "item",
            slot = 6,
        },

    },]]
   --[[["phonestore"] = {
        [1] = {
            name = "phone",
            price = 1000,
            amount = 50,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "fitbit",
            price = 500,
            amount = 150,
            info = {},
            type = "item",
            slot = 2,
        },
    },]]

    ["weedsuper"] = {
        [1] = {
            name = "water_bottle",
            price = 30,
            amount = 50,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "weapon_poolcue",
            price = 250,
            amount = 1000,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "weed_nutrition",
            price = 50,
            amount = 1000,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "rolling_paper",
            price = 5,
            amount = 1000,
            info = {},
            type = "item",
            slot = 4,
        },
    },

    ["petrolpump"] = {
        [1] = {
            name = "weapon_petrolcan",
            price = 100,
            amount = 50,
            info = {},
            type = "item",
            slot = 1,
        },
        
    },

    ["grocerystoreold"] = {
        [1] = {
            name = "bread",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 1,
        },

        [2] = {
            name = "veggies",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 2,
        },
        
        [3] = {
            name = "sauce",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 3,
        },

        [4] = {
            name = "bun",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 4,
        },

        [5] = {
            name = "vegpatty",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 5,
        },

        [6] = {
            name = "chickenpatty",
            price = 10,
            amount = 100,
            info = {},
            type = "item",
            slot = 6,
        },

        [7] = {
            name = "cheese",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 7,
        },

        [8] = {
            name = "potato",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 8,
        },

        [9] = {
            name = "oil",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 9,
        },

        [10] = {
            name = "icecream",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 10,
        },
        [11] = {
            name = "milk",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 11,
        },

        [12] = {
            name = "chocochips",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 12,
        },
        [13] = {
            name = "teapouch",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 13,
        },

        [14] = {
            name = "coffeepouch",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 14,
        },
        [15] = {
            name = "sugar",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 15,
        },
        [16] = {
            name = "brownies",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 16,
        },
        [17] = {
            name = "cookies",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 17,
        },
        [18] = {
            name = "pasta",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 18,
        },
        [19] = {
            name = "knor",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 19,
        },
        [20] = {
            name = "manchow",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 20,
        },
        [21] = {
            name = "golgappa",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 21,
        },
        [22] = {
            name = "gsauce",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 22,
        },
        [23] = {
            name = "belachi",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 23,
        },
        [24] = {
            name = "gulabjamun",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 24,
        },
        [25] = {
            name = "water_bottle",
            price = 30,
            amount = 100,
            info = {},
            type = "item",
            slot = 25,
        },
        [26] = {
            name = "paan",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 26,
        },
        [27] = {
            name = "rosogulla",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 27,
        },
        [28] = {
            name = "masala",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 28,
        },
        [29] = {
            name = "paneer",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 29,
        },
        [30] = {
            name = "roll",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 30,
        },
        [31] = {
            name = "cuttedchicken",
            price = 20,
            amount = 100,
            info = {},
            type = "item",
            slot = 31,
        },
        [32] = {
            name = "flour",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 32,
        },
        [33] = {
            name = "butter",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 33,
        },
        [34] = {
            name = "egg",
            price = 20,
            amount = 100,
            info = {},
            type = "item",
            slot = 34,
        },
        
    },

    -- --new coords
    -- ["grocerystore1"] = {
    --     [1] = {
    --         name = "cheese",
    --         price = 5,
    --         amount = 100,
    --         info = {},
    --         type = "item",
    --         slot = 1,
    --     },
    --     [2] = {
    --         name = "milk",
    --         price = 5,
    --         amount = 100,
    --         info = {},
    --         type = "item",
    --         slot = 2,
    --     },
    --     [3] = {
    --         name = "water_bottle",
    --         price = 30,
    --         amount = 100,
    --         info = {},
    --         type = "item",
    --         slot = 3,
    --     },
    --     [4] = {
    --         name = "paneer",
    --         price = 5,
    --         amount = 100,
    --         info = {},
    --         type = "item",
    --         slot = 4,
    --     },
    --     [5] = {
    --         name = "cookies",
    --         price = 5,
    --         amount = 100,
    --         info = {},
    --         type = "item",
    --         slot = 5,
    --     },
    --     [6] = {
    --         name = "veggies",
    --         price = 5,
    --         amount = 100,
    --         info = {},
    --         type = "item",
    --         slot = 6,
    --     },
           
    -- },

    -- ["grocerystore2"] = {
    --     [1] = {
    --         name = "bread",
    --         price = 5,
    --         amount = 100,
    --         info = {},
    --         type = "item",
    --         slot = 1,
    --     },
    --     [2] = {
    --         name = "bun",
    --         price = 5,
    --         amount = 100,
    --         info = {},
    --         type = "item",
    --         slot = 2,
    --     },
    --     [3] = {
    --         name = "oil",
    --         price = 5,
    --         amount = 100,
    --         info = {},
    --         type = "item",
    --         slot = 3,
    --     },
    --     [4] = {
    --         name = "sugar",
    --         price = 5,
    --         amount = 100,
    --         info = {},
    --         type = "item",
    --         slot = 4,
    --     },
    --     [5] = {
    --         name = "masala",
    --         price = 5,
    --         amount = 100,
    --         info = {},
    --         type = "item",
    --         slot = 5,
    --     },
    --     [6] = {
    --         name = "roll",
    --         price = 5,
    --         amount = 100,
    --         info = {},
    --         type = "item",
    --         slot = 6,
    --     },
    --     [7] = {
    --         name = "potato",
    --         price = 5,
    --         amount = 100,
    --         info = {},
    --         type = "item",
    --         slot = 7,
    --     },
    --     [8] = {
    --         name = "salt",
    --         price = 5,
    --         amount = 100,
    --         info = {},
    --         type = "item",
    --         slot = 8,
    --     },
        
    -- },

    -- ["grocerystore3"] = {
    --     [1] = {
    --         name = "icecream",
    --         price = 5,
    --         amount = 100,
    --         info = {},
    --         type = "item",
    --         slot = 1,
    --     },
    --     [2] = {
    --         name = "vegpatty",
    --         price = 5,
    --         amount = 100,
    --         info = {},
    --         type = "item",
    --         slot = 2,
    --     },
    --     [3] = {
    --         name = "chickenpatty",
    --         price = 10,
    --         amount = 100,
    --         info = {},
    --         type = "item",
    --         slot = 3,
    --     },
    --     [4] = {
    --         name = "chocochips",
    --         price = 5,
    --         amount = 100,
    --         info = {},
    --         type = "item",
    --         slot = 4,
    --     },
    --     [5] = {
    --         name = "brownies",
    --         price = 5,
    --         amount = 100,
    --         info = {},
    --         type = "item",
    --         slot = 5,
    --     },
    --     [6] = {
    --         name = "cuttedchicken",
    --         price = 20,
    --         amount = 100,
    --         info = {},
    --         type = "item",
    --         slot = 6,
    --     },
    --     [7] = {
    --         name = "rosogulla",
    --         price = 5,
    --         amount = 100,
    --         info = {},
    --         type = "item",
    --         slot = 7,
    --     },
    --     [8] = {
    --         name = "paan",
    --         price = 5,
    --         amount = 100,
    --         info = {},
    --         type = "item",
    --         slot = 8,
    --     },
    --     [9] = {
    --         name = "gulabjamun",
    --         price = 5,
    --         amount = 100,
    --         info = {},
    --         type = "item",
    --         slot = 9,
    --     },
    --     [10] = {
    --         name = "belachi",
    --         price = 5,
    --         amount = 100,
    --         info = {},
    --         type = "item",
    --         slot = 10,
    --     },
    -- },

    -- ["grocerystore4"] = {
    --     [1] = {
    --         name = "teapouch",
    --         price = 5,
    --         amount = 100,
    --         info = {},
    --         type = "item",
    --         slot = 1,
    --     },
    --     [2] = {
    --         name = "coffeepouch",
    --         price = 5,
    --         amount = 100,
    --         info = {},
    --         type = "item",
    --         slot = 2,
    --     },
    --     [3] = {
    --         name = "sauce",
    --         price = 5,
    --         amount = 100,
    --         info = {},
    --         type = "item",
    --         slot = 3,
    --     },
    --     [4] = {
    --         name = "pasta",
    --         price = 5,
    --         amount = 100,
    --         info = {},
    --         type = "item",
    --         slot = 4,
    --     },
    --     [5] = {
    --         name = "knor",
    --         price = 5,
    --         amount = 100,
    --         info = {},
    --         type = "item",
    --         slot = 5,
    --     },
    --     [6] = {
    --         name = "manchow",
    --         price = 6,
    --         amount = 100,
    --         info = {},
    --         type = "item",
    --         slot = 6,
    --     },
    --     [7] = {
    --         name = "golgappa",
    --         price = 5,
    --         amount = 100,
    --         info = {},
    --         type = "item",
    --         slot = 7,
    --     },
    --     [8] = {
    --         name = "gsauce",
    --         price = 5,
    --         amount = 100,
    --         info = {},
    --         type = "item",
    --         slot = 8,
    --     },
    -- },
}

Config.Locations = {
--[[["hos"] = {
    ["label"] = "Hospital Canteen",
    ["type"] = "normal",
    ["coords"] = {
        [1] = {
            ["x"] = 344.28,
            ["y"] = -595.34,
            ["z"] = 43.28
        },
        [2] = {
            ["x"] = 342.13,
            ["y"] = -594.45,
            ["z"] = 43.28
        },

    },
    ["products"] = Config.Products["hos"],
},]]


    ["ltdgasoline"] = {
        ["label"] = "LTD Gasoline",
        ["type"] = "normal",
        ["coords"] = {
            [1] = {
                ["x"] = -48.44,
                ["y"] = -1757.86,
                ["z"] = 29.42,
            },
            [2] = {
                ["x"] = -47.23,
                ["y"] = -1756.58,
                ["z"] = 29.42,
            }
        },
        ["products"] = Config.Products["normal"],
    },
    ["247supermarket"] = {
        ["label"] = "24/7 Supermarket",
        ["type"] = "normal",
        ["coords"] = {
            [1] = {
                ["x"] = 25.7,
                ["y"] = -1347.3,
                ["z"] = 29.49,
            },
            [2] = {
                ["x"] = 25.7,
                ["y"] = -1344.99,
                ["z"] = 29.49,
            }
        },
        ["products"] = Config.Products["normal"],
    },
    ["robsliquor"] = {
        ["label"] = "Rob's Liqour",
        ["type"] = "normal",
        ["coords"] = {
            [1] = {
                ["x"] = -1222.77,
                ["y"] = -907.19,
                ["z"] = 12.32,
            },
        },
        ["products"] = Config.Products["normal"],
    },
    ["ltdgasoline2"] = {
        ["label"] = "LTD Gasoline",
        ["type"] = "normal",
        ["coords"] = {
            [1] = {
                ["x"] = -707.41,
                ["y"] = -912.83,
                ["z"] = 19.21,
            },
            [2] = {
                ["x"] = -707.32,
                ["y"] = -914.65,
                ["z"] = 19.21,
            }
        },
        ["products"] = Config.Products["normal"],
    },
    ["robsliquor2"] = {
        ["label"] = "Rob's Liqour",
        ["type"] = "normal",
        ["coords"] = {
            [1] = {
                ["x"] = -1487.7,
                ["y"] = -378.53,
                ["z"] = 40.16,
            },
        },
        ["products"] = Config.Products["normal"],
    },
    ["ltdgasoline3"] = {
        ["label"] = "LTD Gasoline",
        ["type"] = "normal",
        ["coords"] = {
            [1] = {
                ["x"] = -1820.33,
                ["y"] = 792.66,
                ["z"] = 138.1,
            },
            [2] = {
                ["x"] = -1821.55,
                ["y"] = 793.98,
                ["z"] = 138.1,
            }
        },
        ["products"] = Config.Products["normal"],
    },
    ["robsliquor3"] = {
        ["label"] = "Rob's Liqour",
        ["type"] = "normal",
        ["coords"] = {
            [1] = {
                ["x"] = -2967.79,
                ["y"] = 391.64,
                ["z"] = 15.04,
            },
        },
        ["products"] = Config.Products["normal"],
    },
    ["247supermarket2"] = {
        ["label"] = "24/7 Supermarket",
        ["type"] = "normal",
        ["coords"] = {
            [1] = {
                ["x"] = -3038.71,
                ["y"] = 585.9,
                ["z"] = 7.9,
            },
            [2] = {
                ["x"] = -3041.04,
                ["y"] = 585.11,
                ["z"] = 7.9,
            }
        },
        ["products"] = Config.Products["normal"],
    },
    ["247supermarket3"] = {
        ["label"] = "24/7 Supermarket",
        ["type"] = "normal",
        ["coords"] = {
            [1] = {
                ["x"] = -3241.47,
                ["y"] = 1001.14,
                ["z"] = 12.83,
            },
            [2] = {
                ["x"] = -3243.98,
                ["y"] = 1001.35,
                ["z"] = 12.83,
            }
        },
        ["products"] = Config.Products["normal"],
    },
    ["247supermarket4"] = {
        ["label"] = "24/7 Supermarket",
        ["type"] = "normal",
        ["coords"] = {
            [1] = {
                ["x"] = 1728.66,
                ["y"] = 6414.16,
                ["z"] = 35.03,
            },
            [2] = {
                ["x"] = 1729.72,
                ["y"] = 6416.27,
                ["z"] = 35.03,
            }
        },
        ["products"] = Config.Products["normal"],
    },
    ["247supermarket5"] = {
        ["label"] = "24/7 Supermarket",
        ["type"] = "normal",
        ["coords"] = {
            [1] = {
                ["x"] = 1697.99,
                ["y"] = 4924.4,
                ["z"] = 42.06,
            },
            [2] = {
                ["x"] = 1699.44,
                ["y"] = 4923.47,
                ["z"] = 42.06,
            }
        },
        ["products"] = Config.Products["normal"],
    },
    ["247supermarket6"] = {
        ["label"] = "24/7 Supermarket",
        ["type"] = "normal",
        ["coords"] = {
            [1] = {
                ["x"] = 1961.48,
                ["y"] = 3739.96,
                ["z"] = 32.34,
            },
            [2] = {
                ["x"] = 1960.22,
                ["y"] = 3742.12,
                ["z"] = 32.34,
            }
        },
        ["products"] = Config.Products["normal"],
    },
    ["robsliquor4"] = {
        ["label"] = "Rob's Liqour",
        ["type"] = "normal",
        ["coords"] = {
            [1] = {
                ["x"] = 1165.28,
                ["y"] = 2709.4,
                ["z"] = 38.15,
            },
        },
        ["products"] = Config.Products["normal"],
    },
    ["247supermarket7"] = {
        ["label"] = "24/7 Supermarket",
        ["type"] = "normal",
        ["coords"] = {
            [1] = {
                ["x"] = 547.79,
                ["y"] = 2671.79,
                ["z"] = 42.15,
            },
            [2] = {
                ["x"] = 548.1,
                ["y"] = 2669.38,
                ["z"] = 42.15,
            }
        },
        ["products"] = Config.Products["normal"],
    },
    ["247supermarket8"] = {
        ["label"] = "24/7 Supermarket",
        ["type"] = "normal",
        ["coords"] = {
            [1] = {
                ["x"] = 2679.25,
                ["y"] = 3280.12,
                ["z"] = 55.24,
            },
            [2] = {
                ["x"] = 2677.13,
                ["y"] = 3281.38,
                ["z"] = 55.24,
            }
        },
        ["products"] = Config.Products["normal"],
    },
    ["247supermarket9"] = {
        ["label"] = "24/7 Supermarket",
        ["type"] = "normal",
        ["coords"] = {
            [1] = {
                ["x"] = 2557.94,
                ["y"] = 382.05,
                ["z"] = 108.62,
            },
            [2] = {
                ["x"] = 2555.53,
                ["y"] = 382.18,
                ["z"] = 108.62,
            }
        },
        ["products"] = Config.Products["normal"],
    },
    --[[["delvecchioliquor"] = {
        ["label"] = "Del Vecchio Liquor",
        ["type"] = "normal",
        ["coords"] = {
            [1] = {
                ["x"] = -159.36,
                ["y"] = 6321.59,
                ["z"] = 31.58,
            },
            [2] = {
                ["x"] = -160.66,
                ["y"] = 6322.85,
                ["z"] = 31.58,
            }
        },
        ["products"] = Config.Products["normal"],
    },
    ["donscountrystore"] = {
        ["label"] = "Don's Country Store",
        ["type"] = "normal",
        ["coords"] = {
            [1] = {
                ["x"] = 161.41,
                ["y"] = 6640.78,
                ["z"] = 31.69,
            },
            [2] = {
                ["x"] = 163.04,
                ["y"] = 6642.45,
                ["z"] = 31.70,
            }
        },
        ["products"] = Config.Products["normal"],
    },]]
    ["ltdgasoline4"] = {
        ["label"] = "LTD Gasoline",
        ["type"] = "normal",
        ["coords"] = {
            [1] = {
                ["x"] = 1163.7,
                ["y"] = -323.92,
                ["z"] = 69.2,
            },
            [2] = {
                ["x"] = 1163.4,
                ["y"] = -322.24,
                ["z"] = 69.2,
            }
        },
        ["products"] = Config.Products["normal"],
    },
    ["robsliquor5"] = {
        ["label"] = "Rob's Liqour",
        ["type"] = "normal",
        ["coords"] = {
            [1] = {
                ["x"] = 1135.66,
                ["y"] = -982.76,
                ["z"] = 46.41,
            },
        },
        ["products"] = Config.Products["normal"],
    },
    ["247supermarket9"] = {
        ["label"] = "24/7 Supermarket",
        ["type"] = "normal",
        ["coords"] = {
            [1] = {
                ["x"] = 373.55,
                ["y"] = 325.56,
                ["z"] = 103.56,
            },
            [2] = {
                ["x"] = 374.29,
                ["y"] = 327.9,
                ["z"] = 103.56,
            }
        },
        ["products"] = Config.Products["normal"],
    },
    ["hardware"] = {
        ["label"] = "Hardware Store",
        ["type"] = "hardware",
        ["coords"] = {
            [1] = {
                ["x"] = 45.55,
                ["y"] = -1749.01,
                ["z"] = 29.6,
            }
        },
        ["products"] = Config.Products["hardware"],
    },
    ["hardware2"] = {
        ["label"] = "Hardware Store",
        ["type"] = "hardware",
        ["coords"] = {
            [1] = {
                ["x"] = 2747.8,
                ["y"] = 3472.86,
                ["z"] = 55.67,
            },
        },
        ["products"] = Config.Products["hardware"],
    },
    ["hardware3"] = {
        ["label"] = "Hardware Store",
        ["type"] = "hardware",
        ["coords"] = {
            [1] = {
                ["x"] = -421.84,
                ["y"] = 6136.09,
                ["z"] = 31.78,
            },
        },
        ["products"] = Config.Products["hardware"],
    },
    ["coffeeshop"] = {
        ["label"] = "Superfly",
        ["type"] = "hardware",
        ["coords"] = {
            [1] = {
                ["x"] = -1172.29,
                ["y"] = -1572.05,
                ["z"] = 4.66,
            }

        },
        ["products"] = Config.Products["coffeeshop"],
    },
    ["ammunation1"] = {
        ["label"] = "Ammunation",
        ["type"] = "weapon",
        ["coords"] = {
            [1] = {
                ["x"] = -662.1,
                ["y"] = -935.3,
                ["z"] = 21.8
            }
        },
        ["products"] = Config.Products["weapons"],
    },
    ["ammunation2"] = {
        ["label"] = "Ammunation",
        ["type"] = "weapon",
        ["coords"] = {
            [1] = {
                ["x"] = 810.2,
                ["y"] = -2157.3,
                ["z"] = 29.6
            }
        },
        ["products"] = Config.Products["weapons"],
    },
    ["ammunation3"] = {
        ["label"] = "Ammunation",
        ["type"] = "weapon",
        ["coords"] = {
            [1] = {
                ["x"] = 1693.4,
                ["y"] = 3759.5,
                ["z"] = 34.7
            }
        },
        ["products"] = Config.Products["weapons"],
    },
    ["ammunation4"] = {
        ["label"] = "Ammunation",
        ["type"] = "weapon",
        ["coords"] = {
            [1] = {
                ["x"] = -330.2,
                ["y"] = 6083.8,
                ["z"] = 31.4
            }
        },
        ["products"] = Config.Products["weapons"],
    },
    ["ammunation5"] = {
        ["label"] = "Ammunation",
        ["type"] = "weapon",
        ["coords"] = {
            [1] = {
                ["x"] = 252.3,
                ["y"] = -50.0,
                ["z"] = 69.9
            }
        },
        ["products"] = Config.Products["weapons"],
    },
    ["ammunation6"] = {
        ["label"] = "Ammunation",
        ["type"] = "weapon",
        ["coords"] = {
            [1] = {
                ["x"] = 22.0,
                ["y"] = -1107.2,
                ["z"] = 29.8
            }
        },
        ["products"] = Config.Products["weapons"],
    },
    ["ammunation7"] = {
        ["label"] = "Ammunation",
        ["type"] = "weapon",
        ["coords"] = {
            [1] = {
                ["x"] = 2567.6,
                ["y"] = 294.3,
                ["z"] = 108.7
            }
        },
        ["products"] = Config.Products["weapons"],
    },
    ["ammunation8"] = {
        ["label"] = "Ammunation",
        ["type"] = "weapon",
        ["coords"] = {
            [1] = {
                ["x"] = -1117.5,
                ["y"] = 2698.6,
                ["z"] = 18.5
            }
        },
        ["products"] = Config.Products["weapons"],
    },
    ["ammunation9"] = {
        ["label"] = "Ammunation",
        ["type"] = "weapon",
        ["coords"] = {
            [1] = {
                ["x"] = 842.4,
                ["y"] = -1033.4,
                ["z"] = 28.1
            }
        },
        ["products"] = Config.Products["weapons"],
    },
    ["seaword1"] = {
        ["label"] = "Sea Word",
        ["type"] = "sea",
        ["coords"] = {
            [1] = {
                ["x"] = -1686.9,
                ["y"] = -1072.23,
                ["z"] = 13.15
            }
        },
        ["products"] = Config.Products["gearshop"],
    },
    ["leisureshop"] = {
        ["label"] = "Leisureshop",
        ["type"] = "leisure",
        ["coords"] = {
            [1] = {
                ["x"] = -1508.774,
                ["y"] = 1509.015,
                ["z"] = 115.2903
            }
        },
        ["products"] = Config.Products["leisureshop"],
    },
    -- ["mustapha"] = {
    --     ["label"] = "Rental Mustapha",
    --     ["type"] = "leisure",
    --     ["coords"] = {
    --         [1] = {
    --             ["x"] = -31.18,
    --             ["y"] = -1397.537,
    --             ["z"] = 29.50
    --         }
    --     },
    --     ["products"] = Config.Products["mustapha"],
    -- },
    ["unicorn"] = {
        ["label"] = "Vanilla Unicorn",
        ["type"] = "unicorn",
        ["coords"] = {
            [1] = {
                ["x"] = 127.93,
                ["y"] = -1284.74,
                ["z"] = 29.28
            }

        },
        ["products"] = Config.Products["unicorn"],
    },
    ["bahama"] = {
        ["label"] = "Bahama Mamas",
        ["type"] = "bahama",
        ["coords"] = {
            [1] = {
                ["x"] = -1394.28,
                ["y"] = -605.42,
                ["z"] = 30.32
            }

        },
        ["products"] = Config.Products["bahama"],
    },

    ["weedsuper"] = {
        ["label"] = "Superfly",
        ["type"] = "hardware",
        ["coords"] = {
            [1] = {
                ["x"] = 377.33,
                ["y"] = -828.44,
                ["z"] = 29.3,
            }

        },
        ["products"] = Config.Products["weedsuper"],
    },
     ["phonestore"] = {
        ["label"] = "IFruit Store",
        ["type"] = "normal",
        ["coords"] = {
            [1] = {
                ["x"] = -629.56,
                ["y"] = -274.69,
                ["z"] = 35.58,
            },
            [2] = {
                ["x"] = -626.57,
                ["y"] = -280.01,
                ["z"] = 35.58,
            }

        },
        ["products"] = Config.Products["phonestore"],
    },
    ["taquila"] = {
        ["label"] = "Tequi-La-La",
        ["type"] = "taquila",
        ["coords"] = {
            [1] = {
                ["x"] = -560.18,
                ["y"] = 286.62,
                ["z"] = 82.18
            },
            [2] = {
                ["x"] = -548.16,
                ["y"] = 319.25,
                ["z"] = 86.91
            },
            

        },
        ["products"] = Config.Products["taquila"],
    },]]

    ["gov"] = {
        ["label"] = "Governor",
        ["type"] = "gov",
        ["coords"] = {
            [1] = {
                ["x"] = -1304.39,
                ["y"] = -567.54,
                ["z"] = 41.19
            },
            

        },
        ["products"] = Config.Products["gov"],
    },

    ["comedyclub"] = {
        ["label"] = "Split Sides West",
        ["type"] = "comedyclub",
        ["coords"] = {
            [1] = {
                ["x"] = -435.49,
                ["y"] = 274.97,
                ["z"] = 83.42
            }
            

        },
        ["products"] = Config.Products["comedyclub"],
    },

    ["cinema"] = {
        ["label"] = "Cinema",
        ["type"] = "cinema",
        ["coords"] = {
            [1] = {
                ["x"] = 340.32,
                ["y"] = 186.79,
                ["z"] = 103.0
            }
            

        },
        ["products"] = Config.Products["cinema"],
    },

    -- ["petrolpump28"] = {
    --     ["label"] = "Petrol pump",
    --     ["type"] = "Petrolpump",
    --     ["coords"] = {
    --         [1] = {
    --             ["x"] = 167.41,
    --             ["y"] = -1553.97,
    --             ["z"] = 29.26
    --         }
            

    --     },
    --     ["products"] = Config.Products["petrolpump"],
    -- },
    -- ["petrolpump18"] = {
    --     ["label"] = "Petrol pump",
    --     ["type"] = "Petrolpump",
    --     ["coords"] = {
    --         [1] = {
    --             ["x"] = -70.94,
    --             ["y"] = -1762.49,
    --             ["z"] = 29.53
    --         }
            

    --     },
    --     ["products"] = Config.Products["petrolpump"],
    -- },

    -- ["petrolpump27"] = {
    --     ["label"] = "Petrol pump",
    --     ["type"] = "Petrolpump",
    --     ["coords"] = {
    --         [1] = {
    --             ["x"] = -319.56,
    --             ["y"] = -1471.51,
    --             ["z"] = 30.55
    --         }
            

    --     },
    --     ["products"] = Config.Products["petrolpump"],
    -- },

    -- ["petrolpump19"] = {
    --     ["label"] = "Petrol pump",
    --     ["type"] = "Petrolpump",
    --     ["coords"] = {
    --         [1] = {
    --             ["x"] = 265.01,
    --             ["y"] = -1262.83,
    --             ["z"] = 29.29
    --         }
            

    --     },
    --     ["products"] = Config.Products["petrolpump"],
    -- },

    -- ["petrolpump17"] = {
    --     ["label"] = "Petrol pump",
    --     ["type"] = "Petrolpump",
    --     ["coords"] = {
    --         [1] = {
    --             ["x"] = -531.02,
    --             ["y"] = -1220.34,
    --             ["z"] = 18.45
    --         }
            

    --     },
    --     ["products"] = Config.Products["petrolpump"],
    -- },

    -- ["petrolpump16"] = {
    --     ["label"] = "Petrol pump",
    --     ["type"] = "Petrolpump",
    --     ["coords"] = {
    --         [1] = {
    --             ["x"] = -723.89,
    --             ["y"] = -933.76,
    --             ["z"] = 19.21
    --         }
            

    --     },
    --     ["products"] = Config.Products["petrolpump"],
    -- },

    -- ["petrolpump21"] = {
    --     ["label"] = "Petrol pump",
    --     ["type"] = "Petrolpump",
    --     ["coords"] = {
    --         [1] = {
    --             ["x"] = 1211.65,
    --             ["y"] = -1389.56,
    --             ["z"] = 35.38
    --         }
            

    --     },
    --     ["products"] = Config.Products["petrolpump"],
    -- },
    -- ["petrolpump20"] = {
    --     ["label"] = "Petrol pump",
    --     ["type"] = "Petrolpump",
    --     ["coords"] = {
    --         [1] = {
    --             ["x"] = 818.34,
    --             ["y"] = -1039.76,
    --             ["z"] = 26.75
    --         }
            

    --     },
    --     ["products"] = Config.Products["petrolpump"],
    -- },

    -- ["petrolpump23"] = {
    --     ["label"] = "Petrol pump",
    --     ["type"] = "Petrolpump",
    --     ["coords"] = {
    --         [1] = {
    --             ["x"] = 620.87,
    --             ["y"] = 268.83,
    --             ["z"] = 103.09
    --         }
            

    --     },
    --     ["products"] = Config.Products["petrolpump"],
    -- },
    -- ["petrolpump14"] = {
    --     ["label"] = "Petrol pump",
    --     ["type"] = "Petrolpump",
    --     ["coords"] = {
    --         [1] = {
    --             ["x"] = -1429.04,
    --             ["y"] = -269.41,
    --             ["z"] = 46.21
    --         }
            

    --     },
    --     ["products"] = Config.Products["petrolpump"],
    -- },

    -- ["petrolpump15"] = {
    --     ["label"] = "Petrol pump",
    --     ["type"] = "Petrolpump",
    --     ["coords"] = {
    --         [1] = {
    --             ["x"] = -2073.94,
    --             ["y"] = -327.31,
    --             ["z"] = 13.32
    --         }
            

    --     },
    --     ["products"] = Config.Products["petrolpump"],
    -- },

    -- ["petrolpump24"] = {
    --     ["label"] = "Petrol pump",
    --     ["type"] = "Petrolpump",
    --     ["coords"] = {
    --         [1] = {
    --             ["x"] = 2581.33,
    --             ["y"] = 362.04,
    --             ["z"] = 108.47
    --         }
            

    --     },
    --     ["products"] = Config.Products["petrolpump"],
    -- },

    -- ["petrolpump9"] = {
    --     ["label"] = "Petrol pump",
    --     ["type"] = "Petrolpump",
    --     ["coords"] = {
    --         [1] = {
    --             ["x"] = 1703.1,
    --             ["y"] = 6416.04,
    --             ["z"] = 32.76
    --         }
            

    --     },
    --     ["products"] = Config.Products["petrolpump"],
    -- },

    -- ["petrolpump11"] = {
    --     ["label"] = "Petrol pump",
    --     ["type"] = "Petrolpump",
    --     ["coords"] = {
    --         [1] = {
    --             ["x"] = -93.34,
    --             ["y"] = 6410.67,
    --             ["z"] = 31.64
    --         }
            

    --     },
    --     ["products"] = Config.Products["petrolpump"],
    -- },

    -- ["petrolpump"] = {
    --     ["label"] = "Petrol pump",
    --     ["type"] = "Petrolpump",
    --     ["coords"] = {
    --         [1] = {
    --             ["x"] = -2555.16,
    --             ["y"] = 2334.2,
    --             ["z"] = 33.08
    --         },
    --         [2] = {
    --             ["x"] = -93.34,
    --             ["y"] = 6410.67,
    --             ["z"] = 31.64
    --         },
    --         [3] = {
    --             ["x"] = 1703.1,
    --             ["y"] = 6416.04,
    --             ["z"] = 32.76
    --         },
    --         [4] = {
    --             ["x"] = 2581.33,
    --             ["y"] = 362.04,
    --             ["z"] = 108.47
    --         },
    --         [5] = {
    --             ["x"] = -2073.94,
    --             ["y"] = -327.31,
    --             ["z"] = 13.32
    --         },
    --         [6] = {
    --             ["x"] = -1429.04,
    --             ["y"] = -269.41,
    --             ["z"] = 46.21
    --         },
    --         [7] = {
    --             ["x"] = 620.87,
    --             ["y"] = 268.83,
    --             ["z"] = 103.09
    --         },
    --         [8] = {
    --             ["x"] = 818.34,
    --             ["y"] = -1039.76,
    --             ["z"] = 26.75
    --         },
    --         [9] = {
    --             ["x"] = 1211.65,
    --             ["y"] = -1389.56,
    --             ["z"] = 35.38
    --         },
    --         [10] = {
    --             ["x"] = -723.89,
    --             ["y"] = -933.76,
    --             ["z"] = 19.21
    --         },
    --         [11] = {
    --             ["x"] = -531.02,
    --             ["y"] = -1220.34,
    --             ["z"] = 18.45
    --         },
    --         [12] = {
    --             ["x"] = 265.01,
    --             ["y"] = -1262.83,
    --             ["z"] = 29.29
    --         },
    --         [13] = {
    --             ["x"] = -319.56,
    --             ["y"] = -1471.51,
    --             ["z"] = 30.55
    --         },
    --         [14] = {
    --             ["x"] = -70.94,
    --             ["y"] = -1762.49,
    --             ["z"] = 29.53
    --         },
    --         [15] = {
    --             ["x"] = 167.41,
    --             ["y"] = -1553.97,
    --             ["z"] = 29.26
    --         }

            

    --     },
    --     ["products"] = Config.Products["petrolpump"],
    -- },

    ["grocerystoreold"] = {
        ["label"] = "Grocery Store",
        ["type"] = "Grocery Store",
        ["coords"] = {
            [1] = {
                ["x"] = 464.85,
                ["y"] = -709.83,
                ["z"] = 27.53
            }
            
            

        },
        ["products"] = Config.Products["grocerystoreold"],
    },

    -- --legion grocery
    -- ["grocerystore1"] = {
    --     ["label"] = "Grocery Store",
    --     ["type"] = "Grocery Store",
    --     ["coords"] = {
    --         [1] = {
    --             ["x"] = 186.19,
    --             ["y"] = -894.5,
    --             ["z"] = 30.71
    --         }
            
            

    --     },
    --     ["products"] = Config.Products["grocerystore1"],
    -- },

    -- ["grocerystore2"] = {
    --     ["label"] = "Grocery Store",
    --     ["type"] = "Grocery Store",
    --     ["coords"] = {
    --         [1] = {
    --             ["x"] = 192.18,
    --             ["y"] = -894.96,
    --             ["z"] = 30.71
    --         }
            
            

    --     },
    --     ["products"] = Config.Products["grocerystore2"],
    -- },

    -- ["grocerystore3"] = {
    --     ["label"] = "Grocery Store",
    --     ["type"] = "Grocery Store",
    --     ["coords"] = {
    --         [1] = {
    --             ["x"] = 185.35,
    --             ["y"] = -897.4,
    --             ["z"] = 30.71
    --         }
            
            

    --     },
    --     ["products"] = Config.Products["grocerystore3"],
    -- },

    -- ["grocerystore4"] = {
    --     ["label"] = "Grocery Store",
    --     ["type"] = "Grocery Store",
    --     ["coords"] = {
    --         [1] = {
    --             ["x"] = 189.9,
    --             ["y"] = -896.3,
    --             ["z"] = 30.71
    --         }
            
            

    --     },
    --     ["products"] = Config.Products["grocerystore4"],
    -- },

    ["ophonestore"] = {
        ["label"] = "Phone Store",
        ["type"] = "Phone Store",
        ["coords"] = {
            [1] = {
                ["x"] = -656.82,
                ["y"] = -857.19,
                ["z"] = 24.49
            }
            
            

        },
        ["products"] = Config.Products["ophone"],
    },

    -- ["omechanic"] = {
    --     ["label"] = "Mechanic Store",
    --     ["type"] = "Mechanic Store",
    --     ["coords"] = {
    --         [1] = {
    --             ["x"] = 841.88,
    --             ["y"] = -908.33,
    --             ["z"] = 25.25
    --         }
            
            

    --     },
    --     ["products"] = Config.Products["mechanic"],
    -- },

    ["casinohb"] = {
    
        ["label"] = "Casino Hub",
        ["type"] = "lanone",
        ["coords"] = {
            [1] = {
                ["x"] = 1116.47, 
                ["y"] = 221.85, 
                ["z"] = -49.44
            },
            [2] = {
                ["x"] = 1116.43, 
                ["y"] = 218.13, 
                ["z"] = -49.44
            }
        },
        ["products"] = Config.Products["casinohb"],
    },

    -- ["weazel"] = {
    
    --     ["label"] = "Weazle News Canteen",
    --     ["type"] = "lanone",
    --     ["coords"] = {
    --         [1] = {
    --             ["x"] = -601.84, 
    --             ["y"] = -914.07, 
    --             ["z"] = 28.84
    --         },
    --     },
    --     ["products"] = Config.Products["weazelnews"],
    -- },

    ["wclub"] = {
    
        ["label"] = "Water Club",
        ["type"] = "lanone",
        ["coords"] = {
            [1] = {
                ["x"] = 3111.68, 
                ["y"] = 2201.33, 
                ["z"] = 3.2
            },
        },
        ["products"] = Config.Products["waterclub"],
    },

    -- ["inbag"] = {
    
    --     ["label"] = "Bag Shop",
    --     ["type"] = "inbag",
    --     ["coords"] = {
    --         [1] = {
    --             ["x"] = 194.17, 
    --             ["y"] = -872.19, 
    --             ["z"] = 30.271
    --         },
    --     },
    --     ["products"] = Config.Products["inbag"],
    -- },
   
}
