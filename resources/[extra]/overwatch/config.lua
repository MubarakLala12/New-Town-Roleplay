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


Config.Locations = {
    ["vehicle"] = {
        [1] = {x = 838.4, y = -3236.44, z = -99.18, h = 238.17},
    },
    ["stash"] = {
        [1] = {x = 904.88, y = -3238.84, z = -98.29, h = 192.29},
    },
    ["armory"] = {
        [1] = {x = 908.71, y = -3210.76, z = -98.22, h = 14.09},
        [2] = {x = 896.67, y = -3217.21, z = -98.23, h = 84.99},
    },
}
 
Config.Vehicles = {
    ["limo2"] = "Armoured Limo",
    ["baller6"] = "Armoured Baller",
    ["insurgent"] = "Insurgent",
    ["kuruma2"] = "Armoured Kuruma",
    ["paragon2"] = "Paragon R",
}

Config.Items = {
    label = "Overwatch Armory",
    slots = 40,
    items = {
        [1] = {
            name = "weapon_combatpistol",
            price = 0,
            amount = 1,
            info = {
                serie = "",
                attachments = {
                    {component = "COMPONENT_AT_PI_FLSH", label = "Flashlight"},
                    {component = "COMPONENT_PISTOL_CLIP_02", label = "Extended Clip"},
                    {component = "COMPONENT_COMBATPISTOL_VARMOD_LOWRIDER", label = "Yusuf Amir Luxury Finish"},
                }
            },
            type = "weapon",
            slot = 1,
        },
        [2] = {
            name = "weapon_appistol",
            price = 0,
            amount = 1,
            info = {
                serie = "",
                attachments = {
                    {component = "COMPONENT_AT_PI_FLSH", label = "Flashlight"},
                    {component = "COMPONENT_APPISTOL_CLIP_02", label = "Extended Clip"},
                    {component = "COMPONENT_APPISTOL_VARMOD_LUXE", label = "Gilded Gun Metal Finish"},
                }
            },
            type = "weapon",
            slot = 2,
        },
        [3] = {
            name = "weapon_stungun",
            price = 0,
            amount = 1,
            info = {
                serie = "",
            },
            type = "weapon",
            slot = 3,
        },
        [4] = {
            name = "weapon_heavypistol",
            price = 0,
            amount = 1,
            info = {
                serie = "",
                attachments = {
                    {component = "COMPONENT_AT_PI_FLSH", label = "Flashlight"},
                    {component = "COMPONENT_AT_PI_SUPP", label = "Suppressor"},
                    {component = "COMPONENT_HEAVYPISTOL_VARMOD_LUXE", label = "Etched Wood Grip Finish"},
                }
            },
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "weapon_pumpshotgun",
            price = 0,
            amount = 1,
            info = {
                serie = "",
                attachments = {
                    {component = "COMPONENT_AT_AR_FLSH", label = "Flashlight"},
                    {component = "COMPONENT_PUMPSHOTGUN_VARMOD_LOWRIDER", label = "Yusuf Amir Luxury Finish"},
                }
            },
            type = "weapon",
            slot = 5,
        },
        [6] = {
            name = "weapon_smg",
            price = 0,
            amount = 1,
            info = {
                serie = "",
                attachments = {
                    {component = "COMPONENT_AT_SCOPE_MACRO_02", label = "1x Scope"},
                    {component = "COMPONENT_AT_AR_FLSH", label = "Flashlight"},
                    {component = "COMPONENT_SMG_CLIP_03", label = "Drum Magazine"},
                    {component = "COMPONENT_SMG_VARMOD_LUXE", label = "Yusuf Amir Luxury Finish"},
                }
            },
            type = "weapon",
            slot = 6,
        },
        [7] = {
            name = "weapon_assaultsmg",
            price = 0,
            amount = 1,
            info = {
                serie = "",
                attachments = {
                    {component = "COMPONENT_AT_SCOPE_MACRO", label = "1x Scope"},
                    {component = "COMPONENT_AT_AR_FLSH", label = "Flashlight"},
                    {component = "COMPONENT_ASSAULTSMG_CLIP_02", label = "Magazine"},
                    {component = "COMPONENT_ASSAULTSMG_VARMOD_LOWRIDER", label = "Yusuf Amir Luxury Finish"},
                }
            },
            type = "weapon",
            slot = 7,
        },
        [8] = {
            name = "weapon_carbinerifle",
            price = 0,
            amount = 1,
            info = {
                serie = "",
                attachments = {
                    {component = "COMPONENT_AT_SCOPE_MEDIUM", label = "Scope"},
                    {component = "COMPONENT_AT_AR_FLSH", label = "Flashlight"},
                    {component = "COMPONENT_CARBINERIFLE_CLIP_03", label = "Magazine"},
                    {component = "COMPONENT_CARBINERIFLE_VARMOD_LUXE", label = "Texture"},
                    {component = "COMPONENT_AT_AR_AFGRIP", label = "Grip"},
                }
            },
            type = "weapon",
            slot = 8,
        },
        [9] = {
            name = "WEAPON_ASSAULTRIFLE",
            price = 0,
            amount = 1,
            info = {
                serie = "",
                attachments = {
                    {component = "COMPONENT_AT_SCOPE_MACRO", label = "Scope"},
                    {component = "COMPONENT_AT_AR_FLSH", label = "Flashlight"},
                    {component = "COMPONENT_ASSAULTRIFLE_CLIP_03", label = "Magazine"},
                    {component = "COMPONENT_ASSAULTRIFLE_VARMOD_LUXE", label = "Texture"},
                    {component = "COMPONENT_AT_AR_AFGRIP", label = "Grip"},
                }
            },
            type = "weapon",
            slot = 9,
        },
        [10] = {
            name = "weapon_specialcarbine",
            price = 0,
            amount = 1,
            info = {
                serie = "",
                attachments = {
                    {component = "COMPONENT_AT_SCOPE_MEDIUM", label = "Scope"},
                    {component = "COMPONENT_AT_AR_FLSH", label = "Flashlight"},
                    {component = "COMPONENT_SPECIALCARBINE_CLIP_02", label = "Magazine"},
                    {component = "COMPONENT_SPECIALCARBINE_VARMOD_LOWRIDER", label = "Texture"},
                    {component = "COMPONENT_AT_AR_AFGRIP", label = "Grip"},
                }
            },
            type = "weapon",
            slot = 10,
        },
        [11] = {
            name = "weapon_heavysniper",
            price = 0,
            amount = 1,
            info = {
                serie = "",
                attachments = {
                    {component = "COMPONENT_AT_SCOPE_MAX", label = "Scope"},
                }
            },
            slot = 11,
        },
        [12] = {
            name = "weapon_nightstick",
            price = 0,
            amount = 1,
            info = {},
            type = "weapon",
            slot = 12,
        },
        [13] = {
            name = "pistol_ammo",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 13,
        },
        [14] = {
            name = "smg_ammo",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 14,
        },
        [15] = {
            name = "shotgun_ammo",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 15,
        },
        [16] = {
            name = "rifle_ammo",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 16,
        },
        [17] = {
            name = "handcuffs",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 17,
        },
        [18] = {
            name = "weapon_flashlight",
            price = 0,
            amount = 1,
            info = {},
            type = "weapon",
            slot = 18,
        },
        [19] = {
            name = "armor",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 19,
        },
        [20] = {
            name = "heavyarmor",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 20,
        },
        [21] = {
            name = "radio",
            price = 0,
            amount = 1,
            info = {},
            type = "item",
            slot = 21,
        },
        [22] = {
            name = "repairkit",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 22,
        },
        [23] = {
            name = "ifak",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 23,
        },
        [24] = {
            name = "bandage",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 24,
        },
        [25] = {
            name = "sandwich",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 25,
        },
        [26] = {
            name = "coffee",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 26,
        },
        [27] = {
            name = "firstaid",
            price = 0,
            amount = 100,
            info = {},
            type = "item",
            slot = 27,
        },
        [28] = {
            name = "weapon_bullpupshotgun",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 28,
        },
        [29] = {
            name = "WEAPON_ASSAULTRIFLE",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 29,
        },
        [30] = {
            name = "weapon_specialcarbine",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 30,
        },
        [31] = {
            name = "weapon_pistol",
            price = 0,
            amount = 50,
            info = {},
            type = "weapon",
            slot = 31,
        },
        [32] = {
            name = "weapon_stungun",
            price = 0,
            amount = 50,
            info = {},
            type = "weapon",
            slot = 32,
        },
        [33] = {
            name = "weapon_pumpshotgun",
            price = 0,
            amount = 50,
            info = {},
            type = "weapon",
            slot = 33,
        },
        [34] = {
            name = "weapon_smg",
            price = 0,
            amount = 50,
            info = {},
            type = "weapon",
            slot = 34,
        },
        [35] = {
            name = "weapon_carbinerifle",
            price = 0,
            amount = 50,
            info = {},
            type = "weapon",
            slot = 35,
        },
        [36] = {
            name = "weapon_assaultsmg",
            price = 0,
            amount = 50,
            info = {},
            type = "weapon",
            slot = 36,
        },
        [37] = {
            name = "weapon_appistol",
            price = 0,
            amount = 50,
            info = {},
            type = "weapon",
            slot = 37,
        },
    }
}