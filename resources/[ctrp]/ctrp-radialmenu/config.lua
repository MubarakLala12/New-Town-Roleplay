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

Config = {}

Config.MenuItems = {
    [1] = {
        id = 'citizen',
        title = 'Citizen',
        icon = '#citizen',
        items = {
            {
                id    = 'givenum',
                title = 'Give Contact Details',
                icon = '#nummer',
                type = 'client',
                event = 'ctrp-phone_new:client:GiveContactDetails',
                shouldClose = true,
            },
            {
                id    = 'getintrunk',
                title = 'Get In Trunk',
                icon = '#vehiclekey',
                type = 'client',
                event = 'ctrp-trunk:client:GetIn',
                shouldClose = true,
            },
            {
                id    = 'cornerselling',
                title = 'Corner Selling',
                icon = '#cornerselling',
                type = 'client',
                event = 'ctrp-drugs:client:cornerselling',
                shouldClose = true,
            },
            {
                id    = 'togglehotdogsell',
                title = 'Hotdog Selling',
                icon = '#cornerselling',
                type = 'client',
                event = 'ctrp-hotdogjob:client:ToggleSell',
                shouldClose = true,
            },
            {
                id = 'interactions',
                title = 'Interaction',
                icon = '#illegal',
                items = {
                    --[[{
                        id    = 'handcuff',
                        title = 'Cuff',
                        icon = '#general',
                        type = 'client',
                        event = 'police:client:CuffPlayerSoft',
                        shouldClose = true,
                    },]]
                    {
                        id    = 'playerinvehicle',
                        title = 'Put In Vehicle',
                        icon = '#general',
                        type = 'client',
                        event = 'police:client:PutPlayerInVehicle',
                        shouldClose = true,
                    },
                    {
                        id    = 'playeroutvehicle',
                        title = 'Take Out Of Vehicle',
                        icon = '#general',
                        type = 'client',
                        event = 'police:client:SetPlayerOutVehicle',
                        shouldClose = true,
                    },
                    {
                        id    = 'stealplayer',
                        title = 'Rob',
                        icon = '#general',
                        type = 'client',
                        event = 'police:client:RobPlayer',
                        shouldClose = true,
                    },
                    {
                        id    = 'escort',
                        title = 'Carry',
                        icon = '#general',
                        type = 'client',
                        event = 'police:client:KidnapPlayer',
                        shouldClose = true,
                    },
                    {
                        id    = 'escort2',
                        title = 'Escort',
                        icon = '#general',
                        type = 'client',
                        event = 'police:client:EscortPlayer',
                        shouldClose = true,
                    },
                    -- {
                    --     id    = 'escort554',
                    --     title = 'Hostage',
                    --     icon = '#general',
                    --     type = 'client',
                    --     event = 'A5:Client:TakeHostage',
                    --     shouldClose = true,
                    -- },
                }
            },
        }
    },
    [2] = {
        id = 'general',
        title = 'General',
        icon = '#general',
        items = {
            {
                id = 'house',
                title = 'House Interaction',
                icon = '#house',
                items = {
                    {
                        id    = 'givehousekey',
                        title = 'Give House Keys',
                        icon = '#vehiclekey',
                        type = 'client',
                        event = 'ctrp-houses:client:giveHouseKey',
                        shouldClose = true,
                        items = {},
                    },
                    {
                        id    = 'removehousekey',
                        title = 'Remove key of the house',
                        icon = '#vehiclekey',
                        type = 'client',
                        event = 'ctrp-houses:client:removeHouseKey',
                        shouldClose = true,
                        items = {},
                    },
                    {
                        id    = 'togglelock',
                        title = 'Toggle Doorlock',
                        icon = '#vehiclekey',
                        type = 'client',
                        event = 'ctrp-houses:client:toggleDoorlock',
                        shouldClose = true,
                    },
                    {
                        id    = 'decoratehouse',
                        title = 'Decorate House',
                        icon = '#vehiclekey',
                        type = 'client',
                        event = 'ctrp-houses:client:decorate',
                        shouldClose = true,
                    },
                    {
                        id = 'houseLocations',
                        title = 'Interaction Locations',
                        icon = '#house',
                        items = {
                            {
                                id    = 'setstash',
                                title = 'Set Stash',
                                icon = '#vehiclekey',
                                type = 'client',
                                event = 'ctrp-houses:client:setLocation',
                                shouldClose = true,
                            },
                            {
                                id    = 'setoutift',
                                title = 'Set Wardrobe',
                                icon = '#vehiclekey',
                                type = 'client',
                                event = 'ctrp-houses:client:setLocation',
                                shouldClose = true,
                            },
                            {
                                id    = 'setlogout',
                                title = 'Set Logout',
                                icon = '#vehiclekey',
                                type = 'client',
                                event = 'ctrp-houses:client:setLocation',
                                shouldClose = true,
                            },
                            {
                                id    = 'setcupboard',
                                title = 'Set cupboard',
                                icon = '#vehiclekey',
                                type = 'client',
                                event = 'ctrp-houses:client:setLocation',
                                shouldClose = true,
                            },
                        }
                    },
                }
            },
        }
    },
    [3] = {
        id = 'vehicle',
        title = 'Vehicle',
        icon = '#vehicle',
        items = {
		     
            {
                id    = 'vehicledoors',
                title = 'Vehicle Doors',
                icon = '#vehicledoors',
                items = {
                    {
                        id    = 'door0',
                        title = 'Drivers door',
                        icon = '#leftdoor',
                        type = 'client',
                        event = 'ctrp-radialmenu:client:openDoor',
                        shouldClose = false,
                    },
                    {
                        id    = 'door4',
                        title = 'Hood',
                        icon = '#idkaart',
                        type = 'client',
                        event = 'ctrp-radialmenu:client:openDoor',
                        shouldClose = false,
                    },
                    {
                        id    = 'door1',
                        title = 'Passengers door',
                        icon = '#rightdoor',
                        type = 'client',
                        event = 'ctrp-radialmenu:client:openDoor',
                        shouldClose = false,
                    },
                    {
                        id    = 'door3',
                        title = 'Right rear',
                        icon = '#rightdoor',
                        type = 'client',
                        event = 'ctrp-radialmenu:client:openDoor',
                        shouldClose = false,
                    },
                    {
                        id    = 'door5',
                        title = 'Trunk',
                        icon = '#idkaart',
                        type = 'client',
                        event = 'ctrp-radialmenu:client:openDoor',
                        shouldClose = false,
                    },
                    {
                        id    = 'door2',
                        title = 'Left rear',
                        icon = '#leftdoor',
                        type = 'client',
                        event = 'ctrp-radialmenu:client:openDoor',
                        shouldClose = false,
                    },
                }
				
            },
            {
                id    = 'vehicleseats',
                title = 'Vehicle Seats',
                icon = '#vehicledoors',
                items = {
                    {
                        id    = 'door0',
                        title = 'Driver',
                        icon = '#plus',
                        type = 'client',
                        event = 'ctrp-radialmenu:client:ChangeSeat',
                        shouldClose = false,
                    },
                }
            },
			{
                id    = 'carcontrol',
                title = 'Car Control',
                icon = '#idkaart',
                type = 'client',
                event = 'carcontrol:open',
                shouldClose = true,
            },
            {
                id    = 'flip',
                title = 'Flip Vehicle',
                icon = '#vehicle',
                type = 'client',
                event = 'ctrp-radialmenu:client:flip:vehicle',
                shouldClose = true,
            },
        }
    },
    [4] = {
        id = 'jobinteractions',
        title = 'Work',
        icon = '#vehicle',
        items = {},
    },
}

Config.JobInteractions = {

    --EMS
    ["doctor"] = {
        {
            id    = 'statuscheck',
            title = 'Check Person',
            icon = '#general',
            type = 'client',
            event = 'hospital:client:CheckStatus',
            shouldClose = true,
        },
        {
            id    = 'treatwounds',
            title = 'Heal Wounds',
            icon = '#general',
            type = 'client',
            event = 'hospital:client:TreatWounds',
            shouldClose = true,
        },
        {
            id    = 'reviveplayer',
            title = 'Revive',
            icon = '#general',
            type = 'client',
            event = 'hospital:client:RevivePlayer',
            shouldClose = true,
        },
        {
            id    = 'emergencybutton2',
            title = 'Emergency Button',
            icon = '#general',
            type = 'client',
            event = 'police:client:SendPoliceEmergencyAlert',
            shouldClose = true,
        },
        {
            id    = 'escort',
            title = 'Escort',
            icon = '#general',
            type = 'client',
            event = 'police:client:EscortPlayer',
            shouldClose = true,
        },
        {
            id = 'brancardoptions',
            title = 'Stretcher',
            icon = '#vehicle',
            items = {
                {
                    id    = 'spawnbrancard',
                    title = 'Spawn Stretcher',
                    icon = '#general',
                    type = 'client',
                    event = 'hospital:client:TakeBrancard',
                    shouldClose = false,
                },
                {
                    id    = 'despawnbrancard',
                    title = 'Remove Stretcher',
                    icon = '#general',
                    type = 'client',
                    event = 'hospital:client:RemoveBrancard',
                    shouldClose = false,
                },
            },
        },
    },
    

    ["taxi"] = {
        {
            id    = 'togglemeter',
            title = 'Show/Hide Meter',
            icon = '#general',
            type = 'client',
            event = 'ctrp-taxi:client:toggleMeter',
            shouldClose = false,
        },
        {
            id    = 'togglemouse',
            title = 'Start/Stop Meter',
            icon = '#general',
            type = 'client',
            event = 'ctrp-taxi:client:enableMeter',
            shouldClose = true,
        },
        {
            id    = 'npc_mission',
            title = 'NPC Mission',
            icon = '#general',
            type = 'client',
            event = 'ctrp-taxi:client:DoTaxiNpc',
            shouldClose = true,
        },
    },
    ["tow"] = {
        {
            id    = 'togglenpc',
            title = 'Toggle NPC',
            icon = '#general',
            type = 'client',
            event = 'jobs:client:ToggleNpc',
            shouldClose = true,
        },
        {
            id    = 'towvehicle',
            title = 'Tow vehicle',
            icon = '#vehicle',
            type = 'client',
            event = 'ctrp-tow:client:TowVehicle',
            shouldClose = true,
        },
    },

    ["mechanic"] = {
        {
            id    = 'togglenpc',
            title = 'Toggle NPC',
            icon = '#general',
            type = 'client',
            event = 'jobs:client:ToggleNpc',
            shouldClose = true,
        },
        {
            id    = 'towvehicle',
            title = 'Tow vehicle',
            icon = '#vehicle',
            type = 'client',
            event = 'ctrp-tow:client:TowVehicle',
            shouldClose = true,
        },
        {
            id = 'mechanicobjects',
            title = 'Objects',
            icon = '#house',
            items = {
                {
                    id    = 'spawnverlichting',
                    title = 'Lighting',
                    icon = '#vehiclekey',
                    type = 'client',
                    event = 'police:client:spawnLight',
                    shouldClose = false,
                },
                {
                    id    = 'deleteobject',
                    title = 'Remove object',
                    icon = '#vehiclekey',
                    type = 'client',
                    event = 'police:client:deleteObject',
                    shouldClose = false,
                },
            }
        },
    },
    
    ['government'] = {
        {
            id    = 'searchplayer',
            title = 'Search',
            icon = '#general',
            type = 'client',
            event = 'police:client:SearchPlayer',
            shouldClose = true,
        }
    },


    ['police'] = {
        {
            id    = 'emergencybutton',
            title = 'Emergency button',
            icon = '#general',
            type = 'client',
            event = 'police:client:SendPoliceEmergencyAlert',
            shouldClose = true,
        },
        {
            id    = 'checkvehstatus',
            title = 'Check Tune Status',
            icon = '#vehiclekey',
            type = 'client',
            event = 'ctrp-tunerchip:server:TuneStatus',
            shouldClose = true,
        },
        {
            id    = 'resethouse',
            title = 'Reset house lock',
            icon = '#vehiclekey',
            type = 'client',
            event = 'ctrp-houses:client:ResetHouse',
            shouldClose = true,
        },
        {
            id    = 'takedriverlicense',
            title = 'Take drivers license',
            icon = '#vehicle',
            type = 'client',
            event = 'police:client:SeizeDriverLicense',
            shouldClose = true,
        },
        {
            id = 'policeinteraction',
            title = 'police interaction',
            icon = '#house',
            items = {
                {
                    id    = 'statuscheck',
                    title = 'Search person',
                    icon = '#general',
                    type = 'client',
                    event = 'hospital:client:CheckStatus',
                    shouldClose = true,
                },
                {
                    id    = 'checkstatus',
                    title = 'Check status',
                    icon = '#general',
                    type = 'client',
                    event = 'police:client:CheckStatus',
                    shouldClose = true,
                },
                {
                    id    = 'escort',
                    title = 'Escort',
                    icon = '#general',
                    type = 'client',
                    event = 'police:client:EscortPlayer',
                    shouldClose = true,
                },
                {
                    id    = 'searchplayer',
                    title = 'Search',
                    icon = '#general',
                    type = 'client',
                    event = 'police:client:SearchPlayer',
                    shouldClose = true,
                },
                {
                    id    = 'jailplayer',
                    title = 'jail',
                    icon = '#general',
                    type = 'client',
                    event = 'police:client:JailPlayer',
                    shouldClose = true,
                },
            }
        },
        {
            id = 'policeobjects',
            title = 'Objects',
            icon = '#house',
            items = {
                {
                    id    = 'spawnpion',
                    title = 'Cone',
                    icon = '#vehiclekey',
                    type = 'client',
                    event = 'police:client:spawnCone',
                    shouldClose = false,
                },
                {
                    id    = 'spawnhek',
                    title = 'Gate',
                    icon = '#vehiclekey',
                    type = 'client',
                    event = 'police:client:spawnBarier',
                    shouldClose = false,
                },
                {
                    id    = 'spawnschotten',
                    title = 'Scote',
                    icon = '#vehiclekey',
                    type = 'client',
                    event = 'police:client:spawnSchotten',
                    shouldClose = false,
                },
                {
                    id    = 'spawntent',
                    title = 'Tent',
                    icon = '#vehiclekey',
                    type = 'client',
                    event = 'police:client:spawnTent',
                    shouldClose = false,
                },
                {
                    id    = 'spawnverlichting',
                    title = 'Lighting',
                    icon = '#vehiclekey',
                    type = 'client',
                    event = 'police:client:spawnLight',
                    shouldClose = false,
                },
                {
                    id    = 'spikestrip',
                    title = 'Spike Strips',
                    icon = '#vehiclekey',
                    type = 'client',
                    event = 'police:client:SpawnSpikeStrip',
                    shouldClose = false,
                },
                {
                    id    = 'deleteobject',
                    title = 'Remove object',
                    icon = '#vehiclekey',
                    type = 'client',
                    event = 'police:client:deleteObject',
                    shouldClose = false,
                },
            }
        },
    },
    

    ["hotdog"] = {
        {
            id    = 'togglesell',
            title = 'Toggle sell',
            icon = '#general',
            type = 'client',
            event = 'ctrp-hotdogjob:client:ToggleSell',
            shouldClose = true,
        },
    },
    -- ["taxi"] = {

    -- },
}

Config.TrunkClasses = {
    [0]  = { allowed = true, x = 0.0, y = -1.5, z = 0.0 }, --Coupes
    [1]  = { allowed = true, x = 0.0, y = -2.0, z = 0.0 }, --Sedans
    [2]  = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, --SUVs
    [3]  = { allowed = true, x = 0.0, y = -1.5, z = 0.0 }, --Coupes
    [4]  = { allowed = true, x = 0.0, y = -2.0, z = 0.0 }, --Muscle
    [5]  = { allowed = true, x = 0.0, y = -2.0, z = 0.0 }, --Sports Classics
    [6]  = { allowed = true, x = 0.0, y = -2.0, z = 0.0 }, --Sports
    [7]  = { allowed = true, x = 0.0, y = -2.0, z = 0.0 }, --Super
    [8]  = { allowed = false, x = 0.0, y = -1.0, z = 0.25 }, --Motorcycles
    [9]  = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, --Off-road
    [10] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, --Industrial
    [11] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, --Utility
    [12] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, --Vans
    [13] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, --Cycles
    [14] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, --Boats
    [15] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, --Helicopters
    [16] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, --Planes
    [17] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, --Service
    [18] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, --Emergency
    [19] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, --Military
    [20] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, --Commercial
    [21] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, --Trains
}
