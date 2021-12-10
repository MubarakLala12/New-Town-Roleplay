Config = {}

Config.Locale = 'en'

Config.Delays = {
	WeedProcessing = 1000 * 3
}

Config.DrugDealerItems = {
	marijuana = 91
}

Config.LicenseEnable = false -- enable processing licenses? The player will be required to buy a license in order to process drugs. Requires esx_license

-- Config.LicensePrices = {
-- 	weed_processing = {label = _U('license_weed'), price = 10000}
-- }

Config.GiveBlack = true -- give black money? if disabled it'll give regular cash.

Config.CircleZones = {
	--WeedField = {coords = vector3(2462.61, -1817.55, 53.16), name = 'blip_weedfield', color = 25, sprite = 496, radius = 120.0},
	--WeedField = {coords = vector3(2591.74, -1744.77, 18.21), name = 'blip_weedfield', color = 25, sprite = 496, radius = 80.0},
	WeedField = {coords = vector3(-697.49, 4981.83, 179.78), name = 'blip_weedfield', color = 25, sprite = 496, radius = 100.0},
	
	WeedProcessing = {coords = vector3(1036.33, -3203.74, -38.17), name = 'blip_weedprocessing', color = 0, sprite = 6, radius = 10.0},
	WeedProcessing2 = {coords = vector3(1034.17, -3203.74, -38.18), name = 'blip_weedprocessing', color = 0, sprite = 6, radius = 10.0},

	DrugDealer = {coords = vector3(-1172.02, -1571.98, 4.66), name = 'blip_drugdealer', color = 6, sprite = 378, radius = 25.0},
}

Config.weedItems = {
    ["rubber"] = {
        ["price"] = 50 
    },

    

}