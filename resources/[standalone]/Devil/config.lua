DiceRoll = {}

DiceRoll.maxamount = 5 -- Max amount of dices you can roll at one go
DiceRoll.maxsides = 20 -- Max amount of "sides" on a dice
DiceRoll.maxdistance = 7.0 -- Distance players can see the diceroll


Config = {}


Config.EnableShops                = true    -- If true spawn Some Shop & Interior NPCs

--Cops--
Config.EnableCops                 = true    -- If true spawn All Cops at Departments
--Cops--

--Nightclub--
Config.EnableNightclubs           = true    -- If true spawn Nightclub NPCs (Need a IPL Loader https://github.com/Bob74/bob74_ipl or other) (After Hours DLC)
Config.EnableSolomun              = true    -- If true spawn Solomun at Nightclub DJ
Config.EnableDixon                = false   -- If true spawn Dixon at Nightclub DJ
--Nightclub--

--Biker DLC--
Config.EnableDrugs                = true    -- If true spawn NPCs & Guards at Druglabors (Biker DLC)
Config.EnableWeapons              = true    -- If true spawn Guards with Weapons (can change in main.lua)
--Biker DLC--



-------------------------------------RANDOMSHOPS-------------------------------------

Config.Locations2 = { -- Some Shop & Interior NPCs
	{ x = 486.48,   y = -591.53, z = 26.101, heading = 257.54 },	-- esx_dmvschool
}
------sit-----
Config.Healing = 3 -- // If this is 0, then its disabled.. Default: 3.. That means, if a person lies in a bed, then he will get 1 health every 3 seconds.

Config.objects = {
	ButtonToSitOnChair = 23, -- // Default: G -- // https://docs.fivem.net/game-references/controls/
	ButtonToLayOnBed = 38, -- // Default: E -- // https://docs.fivem.net/game-references/controls/
	ButtonToStandUp = 23, -- // Default: F -- // https://docs.fivem.net/game-references/controls/
	SitAnimation = {anim='PROP_HUMAN_SEAT_CHAIR_MP_PLAYER'},
	BedBackAnimation = {dict='anim@gangops@morgue@table@', anim='ko_front'},
	BedStomachAnimation = {anim='WORLD_HUMAN_SUNBATHE'},
	BedSitAnimation = {anim='WORLD_HUMAN_PICNIC'},
	locations = {
		{object="v_serv_ct_chair02", verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=-0.0, direction=168.0, bed=false},
		{object="prop_off_chair_04", verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=-0.4, direction=168.0, bed=false},
		{object="prop_off_chair_03", verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=-0.4, direction=168.0, bed=false},
		{object="prop_off_chair_05", verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=-0.4, direction=168.0, bed=false},
		{object="v_club_officechair", verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=-0.4, direction=168.0, bed=false},
		{object="v_ilev_leath_chr", verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=-0.4, direction=168.0, bed=false},
		{object="v_corp_offchair", verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=-0.4, direction=168.0, bed=false},
		{object="Prop_Off_Chair_01", verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false}
	
	}
}

-- // YOU WILL FIND ALL BUTTONS HERE FOR CODE BELOW;P
-- [[ https://docs.fivem.net/game-references/controls/ ]]

Config.Text = {
	SitOnChair = '~r~F~w~ to sit',
	Standup = '~r~F~w~ to stand up!',
}
