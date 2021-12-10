Config = {}
Config.Locale = 'en' -- English, German or Spanish - (en/de/es)

Config.useMythic = true -- change this if you want to use mythic_notify or not
Config.progBar = true -- change this if you want to use Progress Bar or not
Config.useCD = true -- change this if you want to have a global cooldown or not
Config.cdTime = 1500000 -- global cooldown in ms. Set to 20 minutes by default - (https://www.timecalculator.net/minutes-to-milliseconds)
Config.doorHeading = 250.1 -- change this to the proper heading to look at the door you start the runs with
Config.price = 2000 -- amount you get after the run
Config.amount = 2000 --amount you have to pay to start a run
Config.famount = -1
Config.itemRequired = 'goldchain'
Config.DiveTime = 60000 -- time in ms the effects of Dive will last for
Config.pickupTime = 5000 -- time it takes to pick up the delivery
Config.randBrick = 1 --math.random(1,8) -- change the numbers to how much Dive you want players to receive after breaking down bricks
Config.takeBrick = 1 -- amount of brick you want to take after processing
Config.getCoords = false -- gets coords with /mycoords
Config.pilotPed = "s_m_m_pilot_02" -- change this to have a different ped as the planes pilot - (
Config.landPlane = true -- change this if you want the plane to fly and land or if it should spawn on the ground



Config.locations = {
	[1] = {
		fuel = {x = 1722.9, y = -1667.93, z = 111.9}, -- location of the jerry can/waypoint
		landingLoc = {x = 1722.9, y = -1667.93, z = 111.9}, -- don't mess with this unless you know what you're doing
		plane = {x = 1722.9, y = -1667.93, z = 111.9, h = 204.78}, -- don't mess with this unless you know what you're doing
		runwayStart = {x = 1722.9, y = -1667.93, z = 111.9}, -- don't mess with this unless you know what you're doing
		runwayEnd = {x = 1722.9, y = -1667.93, z = 111.9}, -- don't mess with this unless you know what you're doing
		fuselage = {x = 1722.9, y = -1667.93, z = 111.9}, -- location of the 3D text to fuel the plane
		stationary = {x = 1722.9, y = -1667.93, z = 111.9, h = 204.78}, -- location of the plane if Config.landPlane is false
		delivery = {x = 821.94, y = -815.45, z = 26.28}, -- delivery location
		hangar = {x = 1722.9, y = -1667.93, z = 111.9,}, -- end location
		parking = {x = 1722.9, y = -1667.93, z = 111.9}, -- don't mess with this unless you know what you're doing
	},

}


Config.DiveItems = {
    ["acetone"] = {}, 
}



Config.CircleZones = {

	MethField = {coords = vector3(949.3, 3047.66, 40.55), name = 'blip_meth', color = 25, sprite = 496, radius = 80.0},

}

