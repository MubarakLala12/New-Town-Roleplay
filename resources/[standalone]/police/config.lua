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

Config.Objects = {
    ["cone"] = {model = `prop_roadcone02a`, freeze = false},
    ["barier"] = {model = `prop_barrier_work06a`, freeze = true},
    ["schotten"] = {model = `prop_snow_sign_road_06g`, freeze = true},
    ["tent"] = {model = `prop_gazebo_03`, freeze = true},
    ["light"] = {model = `prop_worklight_03b`, freeze = true},
    ["boombox"] = {model = `prop_boombox_01`, freeze = true},
    ["boombox2"] = {model = `prop_portable_hifi_01`, freeze = true},
}

Config.Locations = {
   ["duty"] = {
       --MRPD
       [1] = {x = 442.95, y = -983.18, z = 30.69, h = 141.99},
       [2] = {x = -449.811, y = 6012.909, z = 31.815, h = 90.654},
   },
   ["vehicle"] = {
       --MRPD
       [1] = {x = 452.46, y = -992.75, z = 25.7, h = 177.68},
       [2] = {x = 431.57, y = -994.0, z = 25.7, h = 180.7},
       [3] = {x = 474.1, y = -1023.86, z = 28.12, h = 266.05},
	   --

        -- Police Station Paleto --
        [6] = {x = -467.77, y = 6037.67, z = 31.34, h = 230.89},
        [7] = {x = -474.0, y = 6029.78, z = 31.34, h = 232.19},
   },
   ["stash"] = {
       --MRPD
       [1] = {x = 460.9, y = -995.85, z = 30.69, h = 0.5},
       [2] = {x = -434.63, y = 6001.63, z = 31.71, h = 316.5, r = 1.0},
       [3] = {x = 463.15, y = -995.89, z = 30.69, h = 4.2},
   },
   ["impound"] = {
       [1] = {x = 463.21, y = -1019.66, z = 28.11, h = 85.68},
       [2] = {x = 462.64, y = -1014.85, z = 28.07, h = 89.87},

       -- Police Station Paleto --
       [3] = {x = -455.7, y = 6001.94, z = 31.34, h = 90.88},
   },
   ["helicopter"] = {
       [1] = {x = 449.168, y = -981.325, z = 43.691, h = 87.234},
       [2] = {x = -475.43, y = 5988.353, z = 31.716, h = 31.34},
   },
   ["armory"] = {
       --MRPD
       [1] = {x = 482.58, y = -995.25, z = 30.69, h = 174.96},
       [2] = {x = -436.82, y = 5996.98, z = 31.716, h = 90.654},
   },
   ["armory2"] = {
    --MRPD
    [1] = {x = 485.38, y = -995.2, z = 30.69, h = 174.64},
   },
   ["snacks"] = {
    --MRPD
    [1] = {x = 462.62, y = -982.53, z = 30.69, h = 243.11},
   },
   ["trash"] = {
       [1] = {x = 472.57, y = -996.34, z = 26.21, h = 91.73},
   },
   ["fingerprint"] = {
       --MRPD
       [1] = {x = 474.15, y = -1013.31, z = 26.27, h = 168.91},
       [2] = {x = -442.38, y = 6011.9, z = 27.98, h = 311.5},
   },
   ["evidence"] = {
       --MRPD
       [1] = {x = 475.7, y = -996.7, z = 26.25, h = 266.58},
       [2] = {x = -439.09, y = 6003.12, z = 31.84, h = 90.654},
   },
   ["evidence2"] = {
       --MRPD
       [1] = {x = 474.08, y = -993.8, z = 26.53, h = 275.35},
       [2] = {x = -439.54, y = 6011.42, z = 27.98, h = 44.5, r = 1.0},
   },
   ["evidence3"] = {
       --MRPD
       [1] = {x = 483.96, y = -983.4, z = 30.70, h = 358.38},
       [2] = {x = -439.43, y = 6009.45, z = 27.98, h = 134.5, r = 1.0},
   },
   ["stations"] = {
       [1] = {label = "Police Station", coords = {x = 428.23, y = -984.28, z = 29.76, h = 3.5}},
       [2] = {label = "Prison", coords = {x = 1845.903, y = 2585.873, z = 45.672, h = 272.249}},
       [3] = {label = "Police Station Paleto", coords = {x = -451.55, y = 6014.25, z = 31.716, h = 223.81}},
   },
}

Config.ArmoryWhitelist = {


}

Config.Helicopter = "as350"

Config.SecurityCameras = {
    hideradar = false,
    cameras = {
        [1] = {label = "Pacific Bank CAM#1", x = 257.45, y = 210.07, z = 109.08, r = {x = -25.0, y = 0.0, z = 28.05}, canRotate = false, isOnline = true},
        [2] = {label = "Pacific Bank CAM#2", x = 232.86, y = 221.46, z = 107.83, r = {x = -25.0, y = 0.0, z = -140.91}, canRotate = false, isOnline = true},
        [3] = {label = "Pacific Bank CAM#3", x = 252.27, y = 225.52, z = 103.99, r = {x = -35.0, y = 0.0, z = -74.87}, canRotate = false, isOnline = true},
        [4] = {label = "Limited Ltd Grove St. CAM#1", x = -53.1433, y = -1746.714, z = 31.546, r = {x = -35.0, y = 0.0, z = -168.9182}, canRotate = false, isOnline = true},
        [5] = {label = "Rob's Liqour Prosperity St. CAM#1", x = -1482.9, y = -380.463, z = 42.363, r = {x = -35.0, y = 0.0, z = 79.53281}, canRotate = false, isOnline = true},
        [6] = {label = "Rob's Liqour San Andreas Ave. CAM#1", x = -1224.874, y = -911.094, z = 14.401, r = {x = -35.0, y = 0.0, z = -6.778894}, canRotate = false, isOnline = true},
        [7] = {label = "Limited Ltd Ginger St. CAM#1", x = -718.153, y = -909.211, z = 21.49, r = {x = -35.0, y = 0.0, z = -137.1431}, canRotate = false, isOnline = true},
        [8] = {label = "24/7 Supermarkt Innocence Blvd. CAM#1", x = 23.885, y = -1342.441, z = 31.672, r = {x = -35.0, y = 0.0, z = -142.9191}, canRotate = false, isOnline = true},
        [9] = {label = "Rob's Liqour El Rancho Blvd. CAM#1", x = 1133.024, y = -978.712, z = 48.515, r = {x = -35.0, y = 0.0, z = -137.302}, canRotate = false, isOnline = true},
        [10] = {label = "Limited Ltd West Mirror Drive CAM#1", x = 1151.93, y = -320.389, z = 71.33, r = {x = -35.0, y = 0.0, z = -119.4468}, canRotate = false, isOnline = true},
        [11] = {label = "24/7 Supermarkt Clinton Ave CAM#1", x = 383.402, y = 328.915, z = 105.541, r = {x = -35.0, y = 0.0, z = 118.585}, canRotate = false, isOnline = true},
        [12] = {label = "Limited Ltd Banham Canyon Dr CAM#1", x = -1832.057, y = 789.389, z = 140.436, r = {x = -35.0, y = 0.0, z = -91.481}, canRotate = false, isOnline = true},
        [13] = {label = "Rob's Liqour Great Ocean Hwy CAM#1", x = -2966.15, y = 387.067, z = 17.393, r = {x = -35.0, y = 0.0, z = 32.92229}, canRotate = false, isOnline = true},
        [14] = {label = "24/7 Supermarkt Ineseno Road CAM#1", x = -3046.749, y = 592.491, z = 9.808, r = {x = -35.0, y = 0.0, z = -116.673}, canRotate = false, isOnline = true},
        [15] = {label = "24/7 Supermarkt Barbareno Rd. CAM#1", x = -3246.489, y = 1010.408, z = 14.705, r = {x = -35.0, y = 0.0, z = -135.2151}, canRotate = false, isOnline = true},
        [16] = {label = "24/7 Supermarkt Route 68 CAM#1", x = 539.773, y = 2664.904, z = 44.056, r = {x = -35.0, y = 0.0, z = -42.947}, canRotate = false, isOnline = true},
        [17] = {label = "Rob's Liqour Route 68 CAM#1", x = 1169.855, y = 2711.493, z = 40.432, r = {x = -35.0, y = 0.0, z = 127.17}, canRotate = false, isOnline = true},
        [18] = {label = "24/7 Supermarkt Senora Fwy CAM#1", x = 2673.579, y = 3281.265, z = 57.541, r = {x = -35.0, y = 0.0, z = -80.242}, canRotate = false, isOnline = true},
        [19] = {label = "24/7 Supermarkt Alhambra Dr. CAM#1", x = 1966.24, y = 3749.545, z = 34.143, r = {x = -35.0, y = 0.0, z = 163.065}, canRotate = false, isOnline = true},
        [20] = {label = "24/7 Supermarkt Senora Fwy CAM#2", x = 1729.522, y = 6419.87, z = 37.262, r = {x = -35.0, y = 0.0, z = -160.089}, canRotate = false, isOnline = true},
        [21] = {label = "Fleeca Bank Hawick Ave CAM#1", x = 309.341, y = -281.439, z = 55.88, r = {x = -35.0, y = 0.0, z = -146.1595}, canRotate = false, isOnline = true},
        [22] = {label = "Fleeca Bank Legion Square CAM#1", x = 144.871, y = -1043.044, z = 31.017, r = {x = -35.0, y = 0.0, z = -143.9796}, canRotate = false, isOnline = true},
        [23] = {label = "Fleeca Bank Hawick Ave CAM#2", x = -355.7643, y = -52.506, z = 50.746, r = {x = -35.0, y = 0.0, z = -143.8711}, canRotate = false, isOnline = true},
        [24] = {label = "Fleeca Bank Del Perro Blvd CAM#1", x = -1214.226, y = -335.86, z = 39.515, r = {x = -35.0, y = 0.0, z = -97.862}, canRotate = false, isOnline = true},
        [25] = {label = "Fleeca Bank Great Ocean Hwy CAM#1", x = -2958.885, y = 478.983, z = 17.406, r = {x = -35.0, y = 0.0, z = -34.69595}, canRotate = false, isOnline = true},
        [26] = {label = "Paleto Bank CAM#1", x = -102.939, y = 6467.668, z = 33.424, r = {x = -35.0, y = 0.0, z = 24.66}, canRotate = false, isOnline = true},
        [27] = {label = "Del Vecchio Liquor Paleto Bay", x = -163.75, y = 6323.45, z = 33.424, r = {x = -35.0, y = 0.0, z = 260.00}, canRotate = false, isOnline = true},
        [28] = {label = "Don's Country Store Paleto Bay CAM#1", x = 166.42, y = 6634.4, z = 33.69, r = {x = -35.0, y = 0.0, z = 32.00}, canRotate = false, isOnline = true},
        [29] = {label = "Don's Country Store Paleto Bay CAM#2", x = 163.74, y = 6644.34, z = 33.69, r = {x = -35.0, y = 0.0, z = 168.00}, canRotate = false, isOnline = true},
        [30] = {label = "Don's Country Store Paleto Bay CAM#3", x = 169.54, y = 6640.89, z = 33.69, r = {x = -35.0, y = 0.0, z = 5.78}, canRotate = false, isOnline = true},
        [31] = {label = "Vangelico Juwelier CAM#1", x = -627.54, y = -239.74, z = 40.33, r = {x = -35.0, y = 0.0, z = 5.78}, canRotate = true, isOnline = true},
        [32] = {label = "Vangelico Juwelier CAM#2", x = -627.51, y = -229.51, z = 40.24, r = {x = -35.0, y = 0.0, z = -95.78}, canRotate = true, isOnline = true},
        [33] = {label = "Vangelico Juwelier CAM#3", x = -620.3, y = -224.31, z = 40.23, r = {x = -35.0, y = 0.0, z = 165.78}, canRotate = true, isOnline = true},
        [34] = {label = "Vangelico Juwelier CAM#4", x = -622.57, y = -236.3, z = 40.31, r = {x = -35.0, y = 0.0, z = 5.78}, canRotate = true, isOnline = true},
        [35] = {label = "Government CAM#1", x = 241.83, y = -1081.19, z = 31.86, r = {x = -35.0, y = 0.0, z = 5.78}, canRotate = true, isOnline = true},
        [36] = {label = "Government CAM#2", x = 252.65, y = -1079.57, z = 31.96, r = {x = -180.0, y = -180.0, z = -73.06}, canRotate = true, isOnline = true},
        [37] = {label = "Government CAM#3", x = 248.28, y = -1076.86, z = 32.86, r = {x = -180.0, y = -180.0, z = 46.31}, canRotate = true, isOnline = true},
        [38] = {label = "Government CAM#4", x = 245.03, y = -1094.72, z = 31.97, r = {x = -180.0, y = -180.0, z = 64.6}, canRotate = true, isOnline = true},
        [39] = {label = "Government CAM#5", x = 243.2, y = -1094.46, z = 31.97, r = {x = -180.0, y = -180.0, z = -43.81}, canRotate = true, isOnline = true},
        [40] = {label = "Government CAM#6", x = 242.48, y = -1101.12, z = 38.28, r = {x = -0.0, y = 0.0, z = 41.19}, canRotate = true, isOnline = true},
        [41] = {label = "Government CAM#7", x = 247.28, y = -1100.84, z = 38.27, r = {x = 0.0, y = -0.08, z = -48.81}, canRotate = true, isOnline = true},
        [42] = {label = "Hospital CAM#1", x = 301.38, y = -581.95, z = 44.97, r = {x = -180.0, y = -180.0, z = 26.19}, canRotate = true, isOnline = true},
        [43] = {label = "Hospital Parking CAM#1", x = 301.32, y = -603.02, z = 45.27, r = {x = -180.0, y = -180.0, z = -58.81}, canRotate = true, isOnline = true},
        [44] = {label = "PDM CAM#1", x = -34.4, y = -1108.22, z = 29.33, r = {x = 0.0, y = -0.01, z = 44.7}, canRotate = true, isOnline = true},
        [45] = {label = "PDM CAM#2", x = -31.57, y = -1096.24, z = 29.33, r = {x = -180.0, y = -180.0, z = -47.8}, canRotate = true, isOnline = true},
        
    },
}

-- Config.Vehicles = {
--     ["code3bmw"] = "2014 BMW R-1200RT",
--     ["code3camero"] = "2018 Chevrolet Camaro SS",
--     ["code3cvpi"] = "2011  Ford Crown Victoria",
--     ["code3gator"] = "09 John Deere Gator",
--     ["code3mustang"] = "2018 Police Mustang GT",
--     ["code3silverado"] = "Silverado",
--     ["code318charg"] = "2018 Dodge Charger Enforcer",
--     ["code318tahoe"] = "2014 Chevrolet Tahoe",
--     ["code320exp"] = "2020 Ford Explorer",
--     ["code316impala"] = "Impala",
--     ["pbike"] = "Police Bicycle",
--     ["pbus"] = "Prison Bus",
--     ["amggtrleo"] = "AMG GTR",
--     ["911turboleo"] = "911 Porshe",
--     ["modelsleo"] = "Tesla Model S",
--     ["viperleo"] = "Viper",
--     ["riot"] = "Riot Van",
--     },

-- }

Config.Vehicles = {
    --LSPD--
    [1] = {
        ["code3gator"] = "09 John Deere Gator",
        ["pbike"] = "Police Bicycle",
    },

    [2] = {
        ["code3bmw"] = "2014 BMW R-1200RT",
        ["code3gator"] = "09 John Deere Gator",
        ["code3cvpi"] = "2011  Ford Crown Victoria",
        ["pbike"] = "Police Bicycle",
    },

    [3] = {
        ["code3bmw"] = "2014 BMW R-1200RT",
        ["code3cvpi"] = "2011  Ford Crown Victoria",
        ["code3gator"] = "09 John Deere Gator",
        ["code318charg"] = "2018 Dodge Charger Enforcer",
        ["code316impala"] = "Impala",
        ["pbike"] = "Police Bicycle",
        ["pbus"] = "Prison Bus",
    },

    [4] = {
        ["code3bmw"] = "2014 BMW R-1200RT",
        ["code3cvpi"] = "2011  Ford Crown Victoria",
        ["code3gator"] = "09 John Deere Gator",
        ["code318charg"] = "2018 Dodge Charger Enforcer",
        ["code316impala"] = "Impala",
        ["pbike"] = "Police Bicycle",
        ["pbus"] = "Prison Bus",
    },

    [5] = {
        ["code3bmw"] = "2014 BMW R-1200RT",
        ["code3cvpi"] = "2011  Ford Crown Victoria",
        ["code3gator"] = "09 John Deere Gator",
        ["code318charg"] = "2018 Dodge Charger Enforcer",
        ["code318tahoe"] = "2014 Chevrolet Tahoe",
        ["code320exp"] = "2020 Ford Explorer",
        ["code316impala"] = "Impala",
        ["pbike"] = "Police Bicycle",
        ["pbus"] = "Prison Bus",
        ["riot"] = "Riot Van",
        ["modelsleo"] = "Tesla Model S",
    },

    [6] = {
        ["code3bmw"] = "2014 BMW R-1200RT",
        ["code3camero"] = "2018 Chevrolet Camaro SS",
        ["code3cvpi"] = "2011  Ford Crown Victoria",
        ["code3gator"] = "09 John Deere Gator",
        ["code318charg"] = "2018 Dodge Charger Enforcer",
        ["code318tahoe"] = "2014 Chevrolet Tahoe",
        ["code320exp"] = "2020 Ford Explorer",
        ["code316impala"] = "Impala",
        ["pbike"] = "Police Bicycle",
        ["pbus"] = "Prison Bus",
        ["riot"] = "Riot Van",
        ["modelsleo"] = "Tesla Model S",
        ["code3mustang"] = "2018 Police Mustang GT",
    },

    [7] = {
        ["code3bmw"] = "2014 BMW R-1200RT",
        ["code3camero"] = "2018 Chevrolet Camaro SS",
        ["code3cvpi"] = "2011  Ford Crown Victoria",
        ["code3gator"] = "09 John Deere Gator",
        ["code3silverado"] = "Silverado",
        ["code318charg"] = "2018 Dodge Charger Enforcer",
        ["code318tahoe"] = "2014 Chevrolet Tahoe",
        ["code320exp"] = "2020 Ford Explorer",
        ["code316impala"] = "Impala",
        ["pbike"] = "Police Bicycle",
        ["pbus"] = "Prison Bus",
        ["modelsleo"] = "Tesla Model S",
        ["riot"] = "Riot Van",
        ["code3mustang"] = "2018 Police Mustang GT",
    },

    [8] = {
        ["code3bmw"] = "2014 BMW R-1200RT",
        ["code3camero"] = "2018 Chevrolet Camaro SS",
        ["code3cvpi"] = "2011 Ford Crown Victoria",
        ["code3gator"] = "09 John Deere Gator",
        ["code3silverado"] = "Silverado",
        ["code318charg"] = "2018 Dodge Charger Enforcer",
        ["code318tahoe"] = "2014 Chevrolet Tahoe",
        ["code320exp"] = "2020 Ford Explorer",
        ["code316impala"] = "Impala",
        ["pbike"] = "Police Bicycle",
        ["pbus"] = "Prison Bus",
        ["911turboleo"] = "911 Porshe",
        ["modelsleo"] = "Tesla Model S",
        ["riot"] = "Riot Van",
        ["code3mustang"] = "2018 Police Mustang GT",
    },

    [9] = {
        ["code3bmw"] = "2014 BMW R-1200RT",
        ["code3camero"] = "2018 Chevrolet Camaro SS",
        ["code3cvpi"] = "2011  Ford Crown Victoria",
        ["code3gator"] = "09 John Deere Gator",
        ["code3mustang"] = "2018 Police Mustang GT",
        ["code3silverado"] = "Silverado",
        ["code318charg"] = "2018 Dodge Charger Enforcer",
        ["code318tahoe"] = "2014 Chevrolet Tahoe",
        ["code320exp"] = "2020 Ford Explorer",
        ["code316impala"] = "Impala",
        ["pbike"] = "Police Bicycle",
        ["pbus"] = "Prison Bus",
        ["amggtrleo"] = "AMG GTR",
        ["911turboleo"] = "911 Porshe",
        ["modelsleo"] = "Tesla Model S",
        ["riot"] = "Riot Van",
    },

    [10] = {
        ["code3bmw"] = "2014 BMW R-1200RT",
        ["code3camero"] = "2018 Chevrolet Camaro SS",
        ["code3cvpi"] = "2011  Ford Crown Victoria",
        ["code3gator"] = "09 John Deere Gator",
        ["code3mustang"] = "2018 Police Mustang GT",
        ["code3silverado"] = "Silverado",
        ["code318charg"] = "2018 Dodge Charger Enforcer",
        ["code318tahoe"] = "2014 Chevrolet Tahoe",
        ["code320exp"] = "2020 Ford Explorer",
        ["code316impala"] = "Impala",
        ["pbike"] = "Police Bicycle",
        ["pbus"] = "Prison Bus",
        ["amggtrleo"] = "AMG GTR",
        ["911turboleo"] = "911 Porshe",
        ["modelsleo"] = "Tesla Model S",
        ["viperleo"] = "Viper",
        ["riot"] = "Riot Van",
    },

    [11] = {
        ["code3bmw"] = "2014 BMW R-1200RT",
        ["code3camero"] = "2018 Chevrolet Camaro SS",
        ["code3cvpi"] = "2011  Ford Crown Victoria",
        ["code3gator"] = "09 John Deere Gator",
        ["code3mustang"] = "2018 Police Mustang GT",
        ["code3silverado"] = "Silverado",
        ["code318charg"] = "2018 Dodge Charger Enforcer",
        ["code318tahoe"] = "2014 Chevrolet Tahoe",
        ["code320exp"] = "2020 Ford Explorer",
        ["code316impala"] = "Impala",
        ["pbike"] = "Police Bicycle",
        ["pbus"] = "Prison Bus",
        ["amggtrleo"] = "AMG GTR",
        ["911turboleo"] = "911 Porshe",
        ["modelsleo"] = "Tesla Model S",
        ["viperleo"] = "Viper",
        ["riot"] = "Riot Van",
    },

    [12] = {
        ["code3bmw"] = "2014 BMW R-1200RT",
        ["code3camero"] = "2018 Chevrolet Camaro SS",
        ["code3cvpi"] = "2011  Ford Crown Victoria",
        ["code3gator"] = "09 John Deere Gator",
        ["code3mustang"] = "2018 Police Mustang GT",
        ["code3silverado"] = "Silverado",
        ["code318charg"] = "2018 Dodge Charger Enforcer",
        ["code318tahoe"] = "2014 Chevrolet Tahoe",
        ["code320exp"] = "2020 Ford Explorer",
        ["code316impala"] = "Impala",
        ["pbike"] = "Police Bicycle",
        ["pbus"] = "Prison Bus",
        ["amggtrleo"] = "AMG GTR",
        ["911turboleo"] = "911 Porshe",
        ["modelsleo"] = "Tesla Model S",
        ["viperleo"] = "Viper",
        ["riot"] = "Riot Van",
    },

    [13] = {
        ["code3bmw"] = "2014 BMW R-1200RT",
        ["code3camero"] = "2018 Chevrolet Camaro SS",
        ["code3cvpi"] = "2011  Ford Crown Victoria",
        ["code3gator"] = "09 John Deere Gator",
        ["code3mustang"] = "2018 Police Mustang GT",
        ["code3silverado"] = "Silverado",
        ["code318charg"] = "2018 Dodge Charger Enforcer",
        ["code318tahoe"] = "2014 Chevrolet Tahoe",
        ["code320exp"] = "2020 Ford Explorer",
        ["code316impala"] = "Impala",
        ["pbike"] = "Police Bicycle",
        ["pbus"] = "Prison Bus",
        ["amggtrleo"] = "AMG GTR",
        ["911turboleo"] = "911 Porshe",
        ["modelsleo"] = "Tesla Model S",
        ["viperleo"] = "Viper",
        ["riot"] = "Riot Van",
    },
}

Config.WhitelistedVehicles = {

}

Config.AmmoLabels = {
    ["AMMO_PISTOL"] = "9x19mm Parabellum kogel",
    ["AMMO_SMG"] = "9x19mm Parabellum kogel",
    ["AMMO_RIFLE"] = "7.62x39mm kogel",
    ["AMMO_MG"] = "7.92x57mm Mauser kogel",
    ["AMMO_SHOTGUN"] = "12-gauge kogel",
    ["AMMO_SNIPER"] = "Groot caliber kogel",
}

Config.Radars = {
	{x = -623.44421386719, y = -823.08361816406, z = 25.25704574585, h = 145.0 },
	{x = -652.44421386719, y = -854.08361816406, z = 24.55704574585, h = 325.0 },
	{x = 1623.0114746094, y = 1068.9924316406, z = 80.903594970703, h = 84.0 },
	{x = -2604.8994140625, y = 2996.3391113281, z = 27.528566360474, h = 175.0 },
	{x = 2136.65234375, y = -591.81469726563, z = 94.272926330566, h = 318.0 },
	{x = 2117.5764160156, y = -558.51013183594, z = 95.683128356934, h = 158.0 },
	{x = 406.89505004883, y = -969.06286621094, z = 29.436267852783, h = 33.0 },
	{x = 657.315, y = -218.819, z = 44.06, h = 320.0 },
	{x = 2118.287, y = 6040.027, z = 50.928, h = 172.0 },
	{x = -106.304, y = -1127.5530, z = 30.778, h = 230.0 },
	{x = -823.3688, y = -1146.980, z = 8.0, h = 300.0 },
}

Config.CarItems = {
    
}

Config.Items = {
    label = "Police Armory",
    slots = 30,
    items = {
        [1] = {
            name = "weapon_combatpistol",
            price = 50,
            amount = 1,
            info = {
                serie = "",
                attachments = {
                    {component = "COMPONENT_AT_PI_FLSH", label = "Flashlight"},
                    {component = "COMPONENT_COMBATPISTOL_VARMOD_LOWRIDER", label = "Yusuf Amir Luxury Finish"},
                }
            },
            type = "weapon",
            slot = 1,
        },
        [2] = {
            name = "weapon_stungun",
            price = 10,
            amount = 1,
            info = {
                serie = "",
            },
            type = "weapon",
            slot = 2,
        },
        [3] = {
            name = "weapon_pumpshotgun",
            price = 100,
            amount = 1,
            info = {
                serie = "",
                attachments = {
                    {component = "COMPONENT_AT_AR_FLSH", label = "Flashlight"},
                    {component = "COMPONENT_PUMPSHOTGUN_VARMOD_LOWRIDER", label = "Yusuf Amir Luxury Finish"},
                }
            },
            type = "weapon",
            slot = 3,
        },
        [4] = {
            name = "weapon_heavypistol",
            price = 150,
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
            name = "weapon_nightstick",
            price = 5,
            amount = 50,
            info = {},
            type = "weapon",
            slot = 5,
        },
        [6] = {
            name = "pistol_ammo",
            price = 5,
            amount = 50,
            info = {},
            type = "item",
            slot = 6,
        },
        [7] = {
            name = "smg_ammo",
            price = 5,
            amount = 50,
            info = {},
            type = "item",
            slot = 7,
        },
        [8] = {
            name = "shotgun_ammo",
            price = 5,
            amount = 50,
            info = {},
            type = "item",
            slot = 8,
        },
        [9] = {
            name = "rifle_ammo",
            price = 5,
            amount = 50,
            info = {},
            type = "item",
            slot = 9,
        },
        [10] = {
            name = "handcuffs",
            price = 25,
            amount = 50,
            info = {},
            type = "item",
            slot = 10,
        },
        [11] = {
            name = "weapon_flashlight",
            price = 5,
            amount = 50,
            info = {},
            type = "weapon",
            slot = 11,
        },
        [12] = {
            name = "empty_evidence_bag",
            price = 2,
            amount = 50,
            info = {},
            type = "item",
            slot = 12,
        },
        [13] = {
            name = "police_stormram",
            price = 50,
            amount = 50,
            info = {},
            type = "item",
            slot = 13,
        },
        [14] = {
            name = "armor",
            price = 20,
            amount = 50,
            info = {},
            type = "item",
            slot = 14,
        },
        [15] = {
            name = "radio",
            price = 15,
            amount = 50,
            info = {},
            type = "item",
            slot = 15,
        },
        [16] = {
            name = "heavyarmor",
            price = 25,
            amount = 50,
            info = {},
            type = "item",
            slot = 16,
        },
        [17] = {
            name = "repairkit",
            price = 15,
            amount = 50,
            info = {},
            type = "item",
            slot = 17,
        },
        [18] = {
            name = "ifak",
            price = 10,
            amount = 50,
            info = {},
            type = "item",
            slot = 18,
        },
        [19] = {
            name = "bandage",
            price = 5,
            amount = 50,
            info = {},
            type = "item",
            slot = 19,
        },
        [20] = {
            name = "bodycam",
            price = 50,
            amount = 50,
            info = {},
            type = "item",
            slot = 20,
        },
        [21] = {
            name = "sandwich",
            price = 25,
            amount = 50,
            info = {},
            type = "item",
            slot = 21,
        },
        [22] = {
            name = "water_bottle",
            price = 15,
            amount = 50,
            info = {},
            type = "item",
            slot = 22,
        },
        [23] = {
            name = "parachute",
            price = 200,
            amount = 50,
            info = {},
            type = "item",
            slot = 23,
        },
        [24] = {
            name = "diving_gear",
            price = 250,
            amount = 50,
            info = {},
            type = "item",
            slot = 24,
        },
        [25] = {
            name = "cigarette",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 25,
        },
    }
}

Config.Items2 = {
    label = "Police Weaponry",
    slots = 30,
    items = {
        [1] = {
            name = "weapon_nsr",
            price = 120,
            amount = 1,
            info = {
                serie = "",
                attachments = {
                    {component = "COMPONENT_AT_AR_FLSH", label = "Flashlight"},
                    {component = "COMPONENT_AT_SCOPE_MEDIUM", label = "Scope"},
                }
            },
            type = "weapon",
            slot = 1,
        },
        [2] = {
            name = "weapon_m4a4",
            price = 150,
            amount = 1,
            info = {
                serie = "",
                attachments = {
                    {component = "COMPONENT_AT_AR_FLSH", label = "Flashlight"},
                }
            },
            type = "weapon",
            slot = 2,
        },
        [3] = {
            name = "weapon_pistol_mk2",
            price = 150,
            amount = 1,
            info = {
                serie = "",
                attachments = {
                    {component = "COMPONENT_AT_PI_FLSH_02", label = "Flashlight"},
                    {component = "COMPONENT_AT_PI_RAIL", label = "Scope"},
                    {component = "COMPONENT_AT_PI_COMP", label = "Compensator"},
                    {component = "COMPONENT_PISTOL_MK2_CAMO_10", label = "Camo"},
                }
            },
            type = "weapon",
            slot = 3,
        },
        [4] = {
            name = "weapon_specialcarbine_mk2",
            price = 200,
            amount = 1,
            info = {
                serie = "",
                attachments = {
                    {component = "COMPONENT_SPECIALCARBINE_MK2_CLIP_02", label = "Clip"},
                    {component = "COMPONENT_AT_AR_FLSH", label = "Flash"},
                    {component = "COMPONENT_AT_SIGHTS", label = "Hollo"},
                    {component = "COMPONENT_AT_MUZZLE_04", label = "Muzzle Brake"},
                    {component = "COMPONENT_AT_AR_AFGRIP_02", label = "Grip"},
                    {component = "COMPONENT_AT_SC_BARREL_02", label = "Heavy Barrel"},
                    {component = "COMPONENT_SPECIALCARBINE_MK2_CAMO_09", label = "Camo"},
                }
            },
            type = "weapon",
            slot = 4,
        },
        [5] = {
            name = "weapon_assaultrifle_mk2",
            price = 200,
            amount = 1,
            info = {
                serie = "",
                attachments = {
                    {component = "COMPONENT_ASSAULTRIFLE_MK2_CLIP_02", label = "Clip"},
                    {component = "COMPONENT_AT_AR_FLSH", label = "Flash"},
                    {component = "COMPONENT_AT_SCOPE_MEDIUM_MK2", label = "Scope"},
                    {component = "COMPONENT_AT_MUZZLE_07", label = "Muzzle Brake"},
                    {component = "COMPONENT_AT_AR_AFGRIP_02", label = "Grip"},
                    {component = "COMPONENT_AT_SC_BARREL_02", label = "Heavy Barrel"},
                    {component = "COMPONENT_ASSAULTRIFLE_MK2_CAMO_09", label = "Camo"},
                }
            },
            type = "weapon",
            slot = 5,
        },
        [6] = {
            name = "weapon_pumpshotgun_mk2",
            price = 200,
            amount = 1,
            info = {
                serie = "",
                attachments = {
                    {component = "COMPONENT_PUMPSHOTGUN_MK2_CLIP_01", label = "Clip"},
                    {component = "COMPONENT_AT_AR_FLSH", label = "Flash"},
                    {component = "COMPONENT_AT_MUZZLE_08", label = "Muzzle Brake"},
                    {component = "COMPONENT_PUMPSHOTGUN_MK2_CAMO_09", label = "Camo"},
                }
            },
            type = "weapon",
            slot = 6,
        },
        [7] = {
            name = "weapon_combatpdw",
            price = 200,
            amount = 1,
            info = {
                serie = "",
                attachments = {
                    {component = "COMPONENT_COMBATPDW_CLIP_02", label = "Clip"},
                    {component = "COMPONENT_AT_AR_FLSH", label = "Flash"},
                    {component = "COMPONENT_AT_AR_AFGRIP", label = "Grip"},
                    {component = "COMPONENT_PUMPSHOTGUN_MK2_CAMO_09", label = "Camo"},
                    {component = "COMPONENT_AT_SCOPE_SMALL", label = "Sight"},	
                }
            },
            type = "weapon",
            slot = 7,
        },
        [8] = {
            name = "weapon_p90",
            price = 200,
            amount = 1,
            info = {
                serie = "",
            },
            type = "weapon",
            slot = 8,
        },
    }
}


Config.Itemssnacks = {
    label = "Snacks",
    slots = 30,
    items = {
        [1] = {
            name = "sandwich",
            price = 25,
            amount = 50,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "water_bottle",
            price = 15,
            amount = 50,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "cigarette",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "cigarette",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 4,
        },
    }
}

Config.gsrUpdate                = 1 * 1000          -- Change first number only, how often a new shot is logged dont set this to low keep it above 1 min - raise if you experience performans issues (default: 1 min).
Config.waterClean               = true              -- Set to false if you dont want water to clean off GSR from people who shot
Config.waterCleanTime           = 30 * 1000         -- Change first number only, Set time in water needed to clean off GSR (default: 30 sec).
Config.gsrTime                  = 30 * 60           -- Change The first number only, if you want the GSR to be auto removed faster output is minutes (default: 30 min).
Config.gsrAutoRemove            = 10 * 60 * 1000    -- Change first number only, to set the auto clean up in minuets (default: 10 min).
Config.gsrUpdateStatus          = 5 * 60 * 1000     -- Change first number only, to change how often the client updates hasFired variable dont set it to high 5-10 min should be fine. (default: 5 min).
Config.UseCharName				= true				-- This will show the suspects name in the PASSED or FAILED notification.Allows cop to make sure they checked the right person.

Config.MinimumSafeDistance = 2

Config.Safes = {
    ["police"] = {
        money = 0,
        coords = {x = 463.38, y = -984.85, z = 30.69, h = 355.84, r = 1.0},
        transactions = {},
    },
} 