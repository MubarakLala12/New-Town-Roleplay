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

Consumeables = {
    ["sandwich"] = math.random(10, 15),
    ["pillbox-sandwich"] = math.random(10, 15),
    ["mcd-burger"] = math.random(10, 20),
    ["mcd-fries"] = math.random(10, 20),
    ["chicken-burger"] = math.random(10, 20),
    ["chicken-meal"] = math.random(10, 20),
    ["chicken-fries"] = math.random(10, 20),
    ["mcd-desert"] = math.random(10, 20),
    ["mcd-meal"] = math.random(10, 20),
    ["mcd-wrap"] = math.random(10, 20),
    ["water_bottle"] = math.random(10, 20),
    ["tosti"] = math.random(10, 15),
    ["kurkakola"] = math.random(10, 15),
    ["twerks_candy"] = math.random(10, 15),
    ["snikkel_candy"] = math.random(10, 15),
    ["coffee"] = math.random(10, 20),
    ["pillbox-coffee"] = math.random(10, 15),
    ["whiskey"] = math.random(10, 20),
    ["beer"] = math.random(10, 20),
    ["vodka"] = math.random(10, 20),
    ["hotdog"] = math.random(15, 20),
    ["bahamsspecial"] = math.random(10, 20),
    ["champagne"] = math.random(10, 20),
    ["tequila"] = math.random(10, 20),
    ["vine"] = math.random(15, 20),
    ["monster"] = math.random(15, 20),
    ["redbull"] = math.random(15, 20),
    ["mcd-burger-c"] = math.random(10, 20),
    ["mcd-wrap-c"] = math.random(10, 20),
    ["tea"] = math.random(10, 20),
    ["brownies"] = math.random(10, 20),
    ["cookies"] = math.random(10, 20),
    ["tompasta"] = math.random(10, 20),
    ["cheesepasta"] = math.random(10, 20),

    ["hi-tea"] = math.random(30, 40),

    ["tsoup"] = math.random(10, 20),
    ["msoup"] = math.random(10, 20),
    ["rggol"] = math.random(5, 10),
    ["belachi"] = math.random(2, 5),
    ["gulabjamun"] = math.random(3, 8),
    ["paan"] = math.random(2, 5),
    ["rosogulla"] = math.random(3, 8),

    ["chickenmasala"] = math.random(40, 50),
    ["pannermasala"] = math.random(35, 45),
    ["cookedchicken"] = math.random(38, 48),
    ["chickenroll"] = math.random(18, 28),
    ["brownbread"] = math.random(7, 14),
    ["naan"] = math.random(10, 20),

    ["mcd-nuggets"] = math.random(60, 80),
    ["mcd-maharaja"] = math.random(60, 80),
    ["mcd-chickenpop"] = math.random(60, 80),
    ["mcd-icetea"] = math.random(40, 60),
    ["mcd-spicypaneer"] = math.random(60, 80),
    ["mcd-egg"] = math.random(60, 80),
    ["mcd-strawberry"] = math.random(50, 70),
    ["mcd-caramel"] = math.random(50, 70),
    ["mcd-mango"] = math.random(50, 70),
    ["mcd-cappuccino"] = math.random(50, 70),
    ["mcd-iced"] = math.random(50, 70),
    ["mcd-hchocolate"] = math.random(50, 70),
}

Config = {}

Config = {
    -- Key used to take a hit of the vape (51)"E" by default.
DragControl = 51,

    -- Key used to reset to the resting vape position (58)"G" by default.
RestingAnim = 58,

    -- The amount of time in (ms) you will need to hold the button in order to commit to the action. (250) by default.
ButtonHoldTime = 250,

    -- Size of the vape clouds. (0.5) by default.
SmokeSize = 1.2,

    -- the Odds of your Mod exploding in your face. (10594) by default. lower the number to increase the chance you have to explode.
FailureOdds = 4000, -- 10594 = 0.0001% chance

    -- The amount of time in (ms) the player has to wait before the can hit the vape again. (4000) by default.
VapeCoolDownTime = 4000,

    -- The amount of time in (ms) the smoke from the vape will linger. (2800) by default.
VapeHangTime = 2800,

    -- Whether or not you want ace permissions to be enabled, False = Everyone Can vape, 
VapePermission = false,

    -- Ace permissions group to allow access. **REQUIRED IF YOU HAVE PERMISSIONS ENABLED**
PermissionsGroup = "ADD_ACE_GROUP_HERE",

    -- If permissions are enabled you can set the denied access message here. **REQUIRED IF YOU HAVE PERMISSIONS ENABLED**
InsufficientMessage = "^3You do not have permission to do this.",

    -- This will Enable and disable the debug commands. 
Debug = false,

    -- The Transparency of the help text when it starts. (0) by default. Just leave this alone...
HelpTextStartingAlpha = 0,

    -- Hold long in (ms) will the help message appear for. (8000) by default.
HelpTextLength = 8000,
}


Config.Exercises = {
    ["Pushups"] = {
        ["idleDict"] = "amb@world_human_push_ups@male@idle_a",
        ["idleAnim"] = "idle_c",
        ["actionDict"] = "amb@world_human_push_ups@male@base",
        ["actionAnim"] = "base",
        ["actionTime"] = 1100,
        ["enterDict"] = "amb@world_human_push_ups@male@enter",
        ["enterAnim"] = "enter",
        ["enterTime"] = 3050,
        ["exitDict"] = "amb@world_human_push_ups@male@exit",
        ["exitAnim"] = "exit",
        ["exitTime"] = 3400,
        ["actionProcent"] = 1,
        ["actionProcentTimes"] = 3,
    },
    ["Situps"] = {
        ["idleDict"] = "amb@world_human_sit_ups@male@idle_a",
        ["idleAnim"] = "idle_a",
        ["actionDict"] = "amb@world_human_sit_ups@male@base",
        ["actionAnim"] = "base",
        ["actionTime"] = 3400,
        ["enterDict"] = "amb@world_human_sit_ups@male@enter",
        ["enterAnim"] = "enter",
        ["enterTime"] = 4200,
        ["exitDict"] = "amb@world_human_sit_ups@male@exit",
        ["exitAnim"] = "exit", 
        ["exitTime"] = 3700,
        ["actionProcent"] = 1,
        ["actionProcentTimes"] = 10,
    },
    ["Chins"] = {
        ["idleDict"] = "amb@prop_human_muscle_chin_ups@male@idle_a",
        ["idleAnim"] = "idle_a",
        ["actionDict"] = "amb@prop_human_muscle_chin_ups@male@base",
        ["actionAnim"] = "base",
        ["actionTime"] = 3000,
        ["enterDict"] = "amb@prop_human_muscle_chin_ups@male@enter",
        ["enterAnim"] = "enter",
        ["enterTime"] = 1600,
        ["exitDict"] = "amb@prop_human_muscle_chin_ups@male@exit",
        ["exitAnim"] = "exit",
        ["exitTime"] = 3700,
        ["actionProcent"] = 1,
        ["actionProcentTimes"] = 10,
    },
}

Config.Locations = {      -- REMINDER. If you want it to set coords+heading then enter heading, else put nil ( ["h"] )
    {["x"] = -1200.08, ["y"] = -1571.15, ["z"] = 4.6115 - 0.98, ["h"] = 214.37, ["exercise"] = "Chins"},
    {["x"] = -1205.0118408203, ["y"] = -1560.0671386719,["z"] = 4.614236831665 - 0.98, ["h"] = nil, ["exercise"] = "Situps"},
    {["x"] = -1203.3094482422, ["y"] = -1570.6759033203, ["z"] = 4.6079330444336 - 0.98, ["h"] = nil, ["exercise"] = "Pushups"},
    --{["x"] = -1206.76, ["y"] = -1572.93, ["z"] = 4.61 - 0.98, ["h"] = nil, ["exercise"] = "Pushups"},
    -- ^^ You can add more locations like this
}

Config.Blips = {
    [1] = {["x"] = -1201.0078125, ["y"] = -1568.3903808594, ["z"] = 4.6110973358154, ["id"] = 311, ["color"] = 49, ["scale"] = 0.7, ["text"] = "The Gym"},
}

Config.RemoveWeaponDrops = true
Config.RemoveWeaponDropsTimer = 25

Config.JointEffectTime = 60

Config.BlacklistedScenarios = {
    ['TYPES'] = {
        "WORLD_VEHICLE_MILITARY_PLANES_SMALL",
        "WORLD_VEHICLE_MILITARY_PLANES_BIG",
    },
    ['GROUPS'] = {
        2017590552,
        2141866469,
        1409640232,
        `ng_planes`,
    }
}

Config.BlacklistedVehs = {
    --[`SHAMAL`] = true,
    --[`LUXOR`] = true,
    --[`LUXOR2`] = true,
    --[`JET`] = true,
    [`LAZER`] = true,
    [`BUZZARD`] = true,
    --[`BUZZARD2`] = true,
    [`ANNIHILATOR`] = true,
    [`SAVAGE`] = true,
    --[`TITAN`] = true,
    [`RHINO`] = true,
    [`POLICE`] = true,
    [`POLICE2`] = true,
    [`POLICE3`] = true,
    [`POLICE4`] = true,
    [`POLICEB`] = true,
    [`POLICET`] = true,
    [`SHERIFF`] = true,
    [`SHERIFF2`] = true,
    --[`FIRETRUK`] = true,
    --[`MULE`] = true,
    -- [`POLMAV`] = true,
    [`MAVERICK`] = true,
    --[`BLIMP`] = true,
    --[`AIRTUG`] = true,
    --[`CAMPER`] = true,
}

Config.BlacklistedPeds = {
    [`s_m_y_ranger_01`] = true,
    [`s_m_y_sheriff_01`] = true,
    [`s_m_y_cop_01`] = true,
    [`s_f_y_sheriff_01`] = true,
    [`s_f_y_cop_01`] = true,
    [`s_m_y_hwaycop_01`] = true,
}


