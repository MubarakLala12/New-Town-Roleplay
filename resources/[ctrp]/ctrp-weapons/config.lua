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

Config = Config or {}

Config.DurabilityBlockedWeapons = {
    "weapon_pistol_mk2",
    "weapon_pistol",
    "weapon_stungun",
    "weapon_nightstick",
    "weapon_flashlight",
    "weapon_unarmed",
    "weapon_m4a4",
	"weapon_nsr",
    "weapon_p90",
}

Config.DurabilityMultiplier = {
    ["weapon_unarmed"] 				 = 0.10,
    ["weapon_knife"] 				 = 0.10,
    ["weapon_nightstick"] 			 = 0.10,
    ["weapon_hammer"] 				 = 0.10,
    ["weapon_bat"] 					 = 0.10,
    ["weapon_golfclub"] 			 = 0.10,
    ["weapon_crowbar"] 				 = 0.10,
    ["weapon_pistol"] 				 = 0.10,
    ["weapon_pistol_mk2"] 			 = 0.10,
    ["weapon_combatpistol"] 		 = 0.10,
    ["weapon_appistol"] 			 = 0.10,
    ["weapon_pistol50"] 			 = 0.10,
    ["weapon_microsmg"] 			 = 0.05,
    ["weapon_smg"] 				 	 = 0.10,
    ["weapon_assaultsmg"] 			 = 0.10,
    ["weapon_assaultrifle"] 		 = 0.05,
    ["weapon_carbinerifle"] 		 = 0.10,
    ["weapon_advancedrifle"] 		 = 0.10,
    ["weapon_mg"] 					 = 0.05,
    ["weapon_combatmg"] 			 = 0.10,
    ["weapon_pumpshotgun"] 			 = 0.10,
    ["weapon_sawnoffshotgun"] 		 = 0.10,
    ["weapon_assaultshotgun"] 		 = 0.10,
    ["weapon_bullpupshotgun"] 		 = 0.10,
    ["weapon_stungun"] 				 = 0.10,
    ["weapon_sniperrifle"] 			 = 0.10,
    ["weapon_heavysniper"] 			 = 0.10,
    ["weapon_remotesniper"] 		 = 0.10,
    ["weapon_grenadelauncher"] 		 = 0.10,
    ["weapon_grenadelauncher_smoke"] = 0.10,
    ["weapon_rpg"] 					 = 0.10,
    ["weapon_minigun"] 				 = 0.10,
    ["weapon_grenade"] 				 = 0.10,
    ["weapon_stickybomb"] 			 = 0.10,
    ["weapon_smokegrenade"] 		 = 0.10,
    ["weapon_bzgas"] 				 = 0.10,
    ["weapon_molotov"] 				 = 0.10,
    ["weapon_fireextinguisher"] 	 = 0.10,
    ["weapon_petrolcan"] 			 = 0.10,
    ["weapon_briefcase"] 			 = 0.10,
    ["weapon_briefcase_02"] 		 = 0.10,
    ["weapon_ball"] 				 = 0.10,
    ["weapon_flare"] 				 = 0.10,
    ["weapon_snspistol"] 			 = 0.10,
    ["weapon_bottle"] 				 = 0.10,
    ["weapon_gusenberg"] 			 = 0.10,
    ["weapon_specialcarbine"] 		 = 0.10,
    ["weapon_heavypistol"] 			 = 0.10,
    ["weapon_bullpuprifle"] 		 = 0.10,
    ["weapon_dagger"] 				 = 0.10,
    ["weapon_vintagepistol"] 		 = 0.12,
    ["weapon_firework"] 			 = 0.10,
    ["weapon_musket"] 			     = 0.10,
    ["weapon_heavyshotgun"] 		 = 0.10,
    ["weapon_marksmanrifle"] 		 = 0.10,
    ["weapon_hominglauncher"] 		 = 0.10,
    ["weapon_proxmine"] 			 = 0.10,
    ["weapon_snowball"] 		     = 0.10,
    ["weapon_flaregun"] 			 = 0.10,
    ["weapon_garbagebag"] 			 = 0.10,
    ["weapon_handcuffs"] 			 = 0.10,
    ["weapon_combatpdw"] 			 = 0.10,
    ["weapon_marksmanpistol"] 		 = 0.10,
    ["weapon_knuckle"] 				 = 0.10,
    ["weapon_hatchet"] 				 = 0.10,
    ["weapon_railgun"] 				 = 0.10,
    ["weapon_machete"] 				 = 0.10,
    ["weapon_machinepistol"] 		 = 0.10,
    ["weapon_switchblade"] 			 = 0.10,
    ["weapon_revolver"] 			 = 0.10,
    ["weapon_dbshotgun"] 			 = 0.10,
    ["weapon_compactrifle"] 		 = 0.05,
    ["weapon_autoshotgun"] 			 = 0.10,
    ["weapon_battleaxe"] 			 = 0.10,
    ["weapon_compactlauncher"] 		 = 0.10,
    ["weapon_minismg"] 				 = 0.05,
    ["weapon_pipebomb"] 			 = 0.10,
    ["weapon_poolcue"] 				 = 0.10,
    ["weapon_wrench"] 				 = 0.10,
    ["weapon_autoshotgun"] 		 	 = 0.10,
    ["weapon_bread"] 				 = 0.10,
    ["weapon_snspistol_mk2"]         = 0.10,
    ["weapon_raypistol"]             = 0.10,
    ["weapon_doubleaction"]             = 0.10,
    ["weapon_ceramicpistol"]          = 0.10,
    ["weapon_navyrevolver"]          = 0.10,
    ["weapon_gadgetpistol"]          = 0.10,
    ["weapon_smg_mk2"]          = 0.10,
    ["weapon_assaultmg"]          = 0.10,
    ["weapon_raycarbine"]          = 0.10,
    ["weapon_pumpshotgun_mk2"]          = 0.10,
    ["weapon_combatshotgun"]          = 0.10,
    ["weapon_assaultrifle_mk2"]          = 0.10,
    ["weapon_carbinerifle_mk2"]          = 0.10,
    ["weapon_specialcarbine_mk2"]          = 0.10,
    ["weapon_bullpuprifle_mk2"]          = 0.10,
    ["weapon_combatmg_mk2"]          = 0.10,


}

Config.WeaponRepairPoints = {
    [1] = {
        coords = {x = 206.09, y = -1014.0, z = -99.0, h = 323.21, r = 1.0},
        IsRepairing = false,
        RepairingData = {},
    }
}


Config.WeaponRepairCotsts = {
    ["pistol"] = 1000,
    ["smg"] = 3000,
    ["rifle"] = 5000,
}

Config.WeaponAttachments = {
    ["WEAPON_SNSPISTOL"] = {
        ["pistol_extendedclip"] = {
            component = "COMPONENT_SNSPISTOL_CLIP_02",
            label = "Extended Clip",
            item = "pistol_extendedclip",
        },
    },
    ["WEAPON_APPISTOL"] = {
        ["pistol_suppressor"] = {
            component = "COMPONENT_AT_PI_SUPP",
            label = "Demper",
            item = "pistol_suppressor",
        },
        ["pistol_extendedclip"] = {
            component = "COMPONENT_APPISTOL_CLIP_02",
            label = "Extended Clip",
            item = "pistol_extendedclip",
        },
    },
    ["WEAPON_VINTAGEPISTOL"] = {
        ["pistol_suppressor"] = {
            component = "COMPONENT_AT_PI_SUPP",
            label = "Demper",
            item = "pistol_suppressor",
        },
        ["pistol_extendedclip"] = {
            component = "COMPONENT_VINTAGEPISTOL_CLIP_02",
            label = "Extended Clip",
            item = "pistol_extendedclip",
        },
    },
    ["WEAPON_MACHINEPISTOL"] = {
        ["pistol_suppressor"] = {
            component = "COMPONENT_AT_PI_SUPP",
            label = "Demper",
            item = "pistol_suppressor",
        },
        ["pistol_extendedclip"] = {
            component = "COMPONENT_MACHINEPISTOL_CLIP_02",
            label = "Extended Clip",
            item = "pistol_extendedclip",
        },
    },
    ["WEAPON_PISTOL"] = {
        ["pistol_suppressor"] = {
            component = "COMPONENT_AT_PI_SUPP_02",
            label = "Demper",
            item = "pistol_suppressor",
        },                                                     
    },
    ["WEAPON_MICROSMG"] = {
        ["smg_suppressor"] = {
            component = "COMPONENT_AT_AR_SUPP_02",
            label = "Demper",
            item = "smg_suppressor",
        },
        ["smg_extendedclip"] = {
            component = "COMPONENT_MICROSMG_CLIP_02",
            label = "Extended Clip",
            item = "smg_extendedclip",
        },
        ["smg_flashlight"] = {
            component = "COMPONENT_AT_PI_FLSH",
            label = "Flashlight",
            item = "smg_flashlight",
        },
        ["smg_scope"] = {
            component = "COMPONENT_AT_SCOPE_MACRO",
            label = "Scope",
            item = "smg_scope",
        },
    },
    ["WEAPON_ASSAULTSMG"] = {
        ["smg_suppressor"] = {
            component = "COMPONENT_AT_AR_SUPP_02",
            label = "Demper",
            item = "smg_suppressor",
        },
        ["smg_extendedclip"] = {
            component = "COMPONENT_ASSAULTSMG_CLIP_02",
            label = "Extended Clip",
            item = "smg_extendedclip",
        },
        ["smg_flashlight"] = {
            component = "COMPONENT_AT_AR_FLSH",
            label = "Flashlight",
            item = "smg_flashlight",
        },
        ["smg_scope"] = {
            component = "COMPONENT_AT_SCOPE_MACRO",
            label = "Scope",
            item = "smg_scope",
        },
    },
    ["WEAPON_MINISMG"] = {
        ["smg_extendedclip"] = {
            component = "COMPONENT_MINISMG_CLIP_02",
            label = "Extended Clip",
            item = "smg_extendedclip",
        },
    },
    ["WEAPON_COMPACTRIFLE"] = {
        ["rifle_extendedclip"] = {
            component = "COMPONENT_COMPACTRIFLE_CLIP_02",
            label = "Extended Clip",
            item = "rifle_extendedclip",
        },
        ["rifle_drummag"] = {
            component = "COMPONENT_COMPACTRIFLE_CLIP_03",
            label = "Drum Mag",
            item = "rifle_drummag",
        },
    },
    ["WEAPON_ASSAULTRIFLE"] = {
        ["rifle_suppressor"] = {
            component = "COMPONENT_AT_AR_SUPP_02",
            label = "Demper",
            item = "rifle_suppressor",
        },
        ["rifle_extendedclip"] = {
            component = "COMPONENT_ASSAULTRIFLE_CLIP_02",
            label = "Extended Clip",
            item = "rifle_extendedclip",
        },
        ["rifle_flashlight"] = {
            component = "COMPONENT_AT_AR_FLSH",
            label = "Flashlight",
            item = "rifle_flashlight",
        },
    },
}

Config.WeaponCapacity = {
    ["pistol"] = 100,
    ["smg"] = 150,
    ["shotgun"] = 60,
    ["rifle"] = 180,
    ["mg"] = 250,
    ["sniper"] = 20,
}