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
        [1] = {x = -1112.31, y = -2883.77, z = 13.85, h = 148.19},
		[2] = {x = -979.68, y = -2994.55, z = 13.95, h = 73.87},
    }
}
 
Config.Vehicles = {
    ["luxor2"] = "Luxor 2",
    ["swift2"] = "Swift 2",
	["h2m"] = "Hummer",
}
