Keys = {
    ['ESC'] = 322, ['F1'] = 288, ['F2'] = 289, ['F3'] = 170, ['F5'] = 166, ['F6'] = 167, ['F7'] = 168, ['F8'] = 169, ['F9'] = 56, ['F10'] = 57,
    ['~'] = 243, ['1'] = 157, ['2'] = 158, ['3'] = 160, ['4'] = 164, ['5'] = 165, ['6'] = 159, ['7'] = 161, ['8'] = 162, ['9'] = 163, ['-'] = 84, ['='] = 83, ['BACKSPACE'] = 177,
    ['TAB'] = 37, ['Q'] = 44, ['W'] = 32, ['E'] = 38, ['R'] = 45, ['T'] = 245, ['Y'] = 246, ['U'] = 303, ['P'] = 199, ['['] = 39, [']'] = 40, ['ENTER'] = 18,
    ['CAPS'] = 137, ['A'] = 34, ['S'] = 8, ['D'] = 9, ['F'] = 23, ['G'] = 47, ['H'] = 74, ['K'] = 311, ['L'] = 182,
    ['LEFTSHIFT'] = 21, ['Z'] = 20, ['X'] = 73, ['C'] = 26, ['V'] = 0, ['B'] = 29, ['N'] = 249, ['M'] = 244, [','] = 82, ['.'] = 81,
    ['LEFTCTRL'] = 36, ['LEFTALT'] = 19, ['SPACE'] = 22, ['RIGHTCTRL'] = 70,
    ['HOME'] = 213, ['PAGEUP'] = 10, ['PAGEDOWN'] = 11, ['DELETE'] = 178,
    ['LEFT'] = 174, ['RIGHT'] = 175, ['TOP'] = 27, ['DOWN'] = 173,
}


-- Commands [true/false]
UseCommands = true

-- Disable ped moving seat from pass to driver unintentionally [true/false]
DisableSeatShuffle = true

------------------lsdmushroom---------------
Config = {}

Config.Locale = 'en'

Config.CircleZones = {
	
	MushroomField = {coords = vector3(3110.81, 1151.07, 18.13), name = 'blip_weedfield', color = 25, sprite = 496, radius = 10.0},
	
	MushroomProcessing = {coords = vector3(1391.82, 3605.84, 38.94), name = 'blip_weedprocessing', color = 0, sprite = 6, radius = 10.0},
}

Config.Detectors = {

    { x = 434.23, y = -981.91, z = 30.71 },
    --[[{ x = 430.04, y = -982.94, z = 30.71 },
    { x = 430.09, y = -984.57, z = 30.71 },
    { x = 430.03, y = -985.81, z = 30.71 },
    { x = 430.06, y = -980.16, z = 30.71 },
    { x = 430.08, y = -978.68, z = 30.71 },]]

}


-------------------COORDS MARKER 1 craft-------------------1
Config.craft1X = 435.8    -- change if you want to move the marker X
Config.craft1Y = -974.50   -- change if you want to move the marker Y
Config.craft1Z = 30.00      -- change if you want to move the marker Z
------------------------------------------------------------

-------------TEXT CRAFT KEYS-------------------------------1
Config.Text = "~g~[G]~w~ Safety Deposit Counter"     -- If you want to change the name of the button to press
-----------------------------------------------------------




-------moneywash-----

markerConfig = {
    markerType = 2,
}

tpLocations = {

    pOne = { 
        x = -317.13, 
        y = -2778.75, 
        z = 5.0
    },

    tpOne = { 
        x = 1138.0439453125, 
        y = -3199.1455078125, 
        z = -39.6657371521},


}

washLocations = {

    pOne = { x = 1126.98, y = -3194.24, z = -40.4},
    pTwo = { x = 1125.5134277344, y = -3194.2421875, z = -40.397045135498},
    pThree = { x = 1123.7733154297, y = -3194.2712402344, z = -40.397274017334},
    pFour = { x = 1122.3767089844, y = -3194.4357910156, z = -40.398277282715},

}

password = 'passwordgodknows'

Config.Blackmoneywash = {
    
    ["blackmoney"] = {
        ["price"] = 1
    },
    
}

Config.Delays = {
	WeedProcessing = 1000 * 3
}

Config.DrugDealerItems = {
	marijuana = 91
}


Config.CircleZones3 = {

	WeedField = {coords = vector3(2927.13, -857.05, -14.79), name = 'blip_weedfield', color = 25, sprite = 496, radius = 50.0},
	
	WeedProcessing = {coords = vector3(1033.84, -3207.43, -38.18), name = 'blip_weedprocessing', color = 0, sprite = 6, radius = 10.0},
	
	DrugDealer = {coords = vector3(-1172.02, -1571.98, 4.66), name = 'blip_drugdealer', color = 6, sprite = 378, radius = 25.0},
}
