
-- CTRPFW = nil
-- TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)

local NumberCharset = {}
local Charset = {}

for i = 48,  57 do table.insert(NumberCharset, string.char(i)) end

for i = 65,  90 do table.insert(Charset, string.char(i)) end
for i = 97, 122 do table.insert(Charset, string.char(i)) end

Citizen.CreateThread(function()
	local HouseGarages = {}
	CTRPFW.Functions.ExecuteSql(false, "SELECT * FROM `houselocations`", function(result)
		if result[1] ~= nil then
			for k, v in pairs(result) do
				local owned = false
				if tonumber(v.owned) == 1 then
					owned = true
				end
				local garage = v.garage ~= nil and json.decode(v.garage) or {}
				Config.Houses[v.name] = {
					coords = json.decode(v.coords),
					owned = v.owned,
					price = v.price,
					locked = true,
					adress = v.label,
					tier = v.tier,
					garage = garage,
					decorations = {},
				}
				HouseGarages[v.name] = {
					label = v.label,
					takeVehicle = garage,
				}
			end
		end
		TriggerClientEvent("ctrp-garages:client:houseGarageConfig", -1, HouseGarages)
		TriggerClientEvent("ctrp-houses:client:setHouseConfig", -1, Config.Houses)
	end)
end)

local houseowneridentifier = {}
local houseownercid = {}
local housekeyholders = {}

RegisterServerEvent('ctrp-houses:server:setHouses')
AddEventHandler('ctrp-houses:server:setHouses', function()
	local src = source
	TriggerClientEvent("ctrp-houses:client:setHouseConfig", src, Config.Houses)
end)

RegisterServerEvent('ctrp-houses:server:addNewHouse')
AddEventHandler('ctrp-houses:server:addNewHouse', function(street, coords, citizenid, tier)
	local src = source
	local street = street:gsub("%'", "")
	local citizenid = tostring(citizenid)
	local tier = tonumber(tier)
	local houseCount = GetHouseStreetCount(street)
	local name = street:lower() .. tostring(houseCount)
	local label = street .. " " .. tostring(houseCount)
	CTRPFW.Functions.ExecuteSql(false, "INSERT INTO `houselocations` (`name`, `label`, `coords`, `owned`, `citizenid`, `tier`) VALUES ('"..name.."', '"..label.."', '"..json.encode(coords).."', 0,'"..citizenid.."', "..tier..")")
	Config.Houses[name] = {
		coords = coords,
		owned = false,
		price = price,
		locked = true,
		adress = label,
		tier = tier,
		garage = {},
		decorations = {},
	}
	TriggerClientEvent("ctrp-houses:client:setHouseConfig", -1, Config.Houses)
	TriggerClientEvent('CTRPFW:Notify', src, "You have added a house: "..label)
end)

RegisterServerEvent('ctrp-houses:server:addGarage')
AddEventHandler('ctrp-houses:server:addGarage', function(house, coords)
	local src = source
	CTRPFW.Functions.ExecuteSql(false, "UPDATE `houselocations` SET `garage` = '"..json.encode(coords).."' WHERE `name` = '"..house.."'")
	local garageInfo = {
		label = Config.Houses[house].adress,
		takeVehicle = coords,
	}
	TriggerClientEvent("ctrp-garages:client:addHouseGarage", -1, house, garageInfo)
	TriggerClientEvent('CTRPFW:Notify', src, "You have added a garage: "..garageInfo.label)
end)

--[[RegisterServerEvent('ctrp-houses:server:viewHouse')
AddEventHandler('ctrp-houses:server:viewHouse', function(house)
	local src     		= source
	local pData 		= CTRPFW.Functions.GetPlayer(src)

	local houseprice   	= Config.Houses[house].price
	local brokerfee 	= (houseprice / 100 * 5)
	local bankfee 		= (houseprice / 100 * 10)
	local taxes 		= (houseprice / 100 * 6)

	TriggerClientEvent('ctrp-houses:client:viewHouse', src, houseprice, brokerfee, bankfee, taxes, pData.PlayerData.charinfo.firstname, pData.PlayerData.charinfo.lastname)
end)

RegisterServerEvent('ctrp-houses:server:buyHouse')
AddEventHandler('ctrp-houses:server:buyHouse', function(house)
	local src     	= source
	local pData 	= CTRPFW.Functions.GetPlayer(src)
	local price   	= Config.Houses[house].price
	local HousePrice = math.ceil(price * 1.21)
	local bankBalance = pData.PlayerData.money["bank"]

	if (bankBalance >= HousePrice) then
		CTRPFW.Functions.ExecuteSql(false, "INSERT INTO `player_houses` (`house`, `identifier`, `citizenid`, `keyholders`) VALUES ('"..house.."', '"..pData.PlayerData.steam.."', '"..pData.PlayerData.citizenid.."', '"..json.encode(keyyeet).."')")
		houseowneridentifier[house] = pData.PlayerData.steam
		houseownercid[house] = pData.PlayerData.citizenid
		housekeyholders[house] = {
			[1] = pData.PlayerData.citizenid
		}
		CTRPFW.Functions.ExecuteSql(true, "UPDATE `houselocations` SET `owned` = 1 WHERE `name` = '"..house.."'")
		TriggerClientEvent('ctrp-houses:client:SetClosestHouse', src)
		pData.Functions.RemoveMoney('bank', HousePrice, "bought-house") -- 21% Extra house costs
	else
		TriggerClientEvent('CTRPFW:Notify', source, "You dont have enough money..", "error")
	end
end)]]

RegisterServerEvent('ctrp-houses:server:viewHouse')
AddEventHandler('ctrp-houses:server:viewHouse', function(house)
	local src     		= source
	local pData 		= CTRPFW.Functions.GetPlayer(src)

	local house = house

	--[[local houseprice   	= 'lol'
	local brokerfee 	= (houseprice / 100 * 5)
	local bankfee 		= (houseprice / 100 * 10)
	local taxes 		= 'lol'
	local rentprice 	= 'lol'
	local insttime 		= 'lol'
	

	local realestate = "NOT ADDED YET"
    local contact = "NOT ADDED YET"
	
	]]

	exports['ghmattimysql']:execute("SELECT * FROM houselocations WHERE `name` = '"..house.."'", function(results)
		-- loop through vehicles again and delete:
		for k,v in pairs(results) do
			

				
			local realestate = v.companyname
			local contact = v.companynumber
			local estimateamount = v.estimate

			print(realestate)

		TriggerClientEvent('ctrp-houses:client:viewHouse', src, realestate, contact,estimateamount, pData.PlayerData.charinfo.firstname, pData.PlayerData.charinfo.lastname)
		


		end
	end)

	

	--TriggerClientEvent('ctrp-houses:client:viewHouse', src, houseprice, brokerfee, bankfee, taxes, pData.PlayerData.charinfo.firstname, pData.PlayerData.charinfo.lastname)
	
end)

--[[RegisterServerEvent('ctrp-houses:server:buyHouse')
AddEventHandler('ctrp-houses:server:buyHouse', function(house)
	local src     	= source
	local pData 	= CTRPFW.Functions.GetPlayer(src)
	local price   	= Config.Houses[house].price
	local HousePrice = math.ceil(price * 1.21)
	local bankBalance = pData.PlayerData.money["bank"]
	local taxes 		= (price / 100 * 6)

	if (bankBalance >= HousePrice) then
		CTRPFW.Functions.ExecuteSql(false, "INSERT INTO `player_houses` (`house`, `identifier`, `citizenid`, `keyholders`) VALUES ('"..house.."', '"..pData.PlayerData.steam.."', '"..pData.PlayerData.citizenid.."', '"..json.encode(keyyeet).."')")
		houseowneridentifier[house] = pData.PlayerData.steam
		houseownercid[house] = pData.PlayerData.citizenid
		housekeyholders[house] = {
			[1] = pData.PlayerData.citizenid
		}
		CTRPFW.Functions.ExecuteSql(true, "UPDATE `houselocations` SET `owned` = 1 WHERE `name` = '"..house.."'")
		TriggerClientEvent('ctrp-houses:client:SetClosestHouse', src)

		---pData.Functions.RemoveMoney('bank', price, "bought-house") -- 21% Extra house costs

		
		TriggerClientEvent('ctrp-moneysafesgov:client:DepositMoney', src , price)
		pData.Functions.RemoveItem('housingpaper', 1)
	else
		TriggerClientEvent('CTRPFW:Notify', source, "You dont have enough money..", "error")
	end
end)]]

RegisterServerEvent('ctrp-houses:server:buyHouse')
AddEventHandler('ctrp-houses:server:buyHouse', function(house, id)
	local src     	= source
	local pData 	= CTRPFW.Functions.GetPlayer(src)

		CTRPFW.Functions.ExecuteSql(false, "INSERT INTO `player_houses` (`id`,`house`, `identifier`, `citizenid`, `keyholders`) VALUES ('"..id.."','"..house.."', '"..pData.PlayerData.steam.."', '"..pData.PlayerData.citizenid.."', '"..json.encode(keyyeet).."')")
		houseowneridentifier[house] = pData.PlayerData.steam
		houseownercid[house] = pData.PlayerData.citizenid
		housekeyholders[house] = {
			[1] = pData.PlayerData.citizenid
		}
		CTRPFW.Functions.ExecuteSql(true, "UPDATE `houselocations` SET `owned` = 1 WHERE `name` = '"..house.."'")
		TriggerClientEvent('ctrp-houses:client:SetClosestHouse', src)

		
	
end)

RegisterServerEvent('ctrp-houses:server:transferthishouse')
AddEventHandler('ctrp-houses:server:transferthishouse', function(house, housenumber , target, id)
	local src     	= source
	local target = tonumber(target)
	local pData 	= CTRPFW.Functions.GetPlayer(target)

		CTRPFW.Functions.ExecuteSql(false, "INSERT INTO `player_houses` (`id`,`house`, `identifier`, `citizenid`, `keyholders`) VALUES ('"..id.."','"..house.."', '"..pData.PlayerData.steam.."', '"..pData.PlayerData.citizenid.."', '"..json.encode(keyyeet).."')")
		houseowneridentifier[house] = pData.PlayerData.steam
		houseownercid[house] = pData.PlayerData.citizenid
		housekeyholders[house] = {
			[1] = pData.PlayerData.citizenid
		}
		CTRPFW.Functions.ExecuteSql(true, "UPDATE `houselocations` SET `owned` = 1 WHERE `name` = '"..house.."'")
		CTRPFW.Functions.ExecuteSql(true, "UPDATE `houselocations` SET `citizenid` = '"..pData.PlayerData.citizenid.."' WHERE `name` = '"..house.."'")
		TriggerClientEvent('ctrp-houses:client:SetClosestHouse', src)

		TriggerClientEvent('CTRPFW:Notify', pData.PlayerData.source, 'You are the owner of the house:  '..Config.Houses[house].adress..' .', 'success', 2500)

end)

RegisterServerEvent('ctrp-houses:server:lockHouse')
AddEventHandler('ctrp-houses:server:lockHouse', function(bool, house)
	TriggerClientEvent('ctrp-houses:client:lockHouse', -1, bool, house)
end)

RegisterServerEvent('ctrp-houses:server:SetRamState')
AddEventHandler('ctrp-houses:server:SetRamState', function(bool, house)
	Config.Houses[house].IsRaming = bool
	TriggerClientEvent('ctrp-houses:server:SetRamState', -1, bool, house)
end)

--------------------------------------------------------------

--------------------------------------------------------------

CTRPFW.Functions.CreateCallback('ctrp-houses:server:hasKey', function(source, cb, house)
	local src = source
	local Player = CTRPFW.Functions.GetPlayer(src)
	local retval = false
	if Player ~= nil then
		local identifier = Player.PlayerData.steam
		local CharId = Player.PlayerData.citizenid
		if hasKey(identifier, CharId, house) then
			retval = true
		elseif Player.PlayerData.job.name == "builder" then
			retval = true
		else
			retval = false
		end
	end

	cb(retval)
end)

CTRPFW.Functions.CreateCallback('ctrp-houses:server:isOwned', function(source, cb, house)
	if houseowneridentifier[house] ~= nil and houseownercid[house] ~= nil then
		cb(true)
	else
		cb(false)
	end
end)

CTRPFW.Functions.CreateCallback('ctrp-houses:server:getHouseOwner', function(source, cb, house)
	cb(houseownercid[house])
end)

CTRPFW.Functions.CreateCallback('ctrp-houses:server:getHouseKeyHolders', function(source, cb, house)
	local retval = {}
	local Player = CTRPFW.Functions.GetPlayer(source)
	if housekeyholders[house] ~= nil then
		for i = 1, #housekeyholders[house], 1 do
			if Player.PlayerData.citizenid ~= housekeyholders[house][i] then
				CTRPFW.Functions.ExecuteSql(false, "SELECT `charinfo` FROM `players` WHERE `citizenid` = '"..housekeyholders[house][i].."'", function(result)
					if result[1] ~= nil then
						local charinfo = json.decode(result[1].charinfo)
						table.insert(retval, {
							firstname = charinfo.firstname,
							lastname = charinfo.lastname,
							citizenid = housekeyholders[house][i],
						})
					end
					cb(retval)
				end)
			end
		end
	else
		cb(nil)
	end
end)

function hasKey(identifier, cid, house)
	if houseowneridentifier[house] ~= nil and houseownercid[house] ~= nil then
		if houseowneridentifier[house] == identifier and houseownercid[house] == cid then
			return true
		else
			if housekeyholders[house] ~= nil then
				for i = 1, #housekeyholders[house], 1 do
					if housekeyholders[house][i] == cid then
						return true
					end
				end
			end
		end
	end
	return false
end

function getOfflinePlayerData(citizenid)
	exports['ghmattimysql']:execute("SELECT `charinfo` FROM `players` WHERE `citizenid` = '"..citizenid.."'", function(result)
		Citizen.Wait(100)
		if result[1] ~= nil then
			local charinfo = json.decode(result[1].charinfo)
			return charinfo
		else
			return nil
		end
	end)
end

RegisterServerEvent('ctrp-houses:server:giveKey')
AddEventHandler('ctrp-houses:server:giveKey', function(house, target)
	local pData = CTRPFW.Functions.GetPlayer(target)

	table.insert(housekeyholders[house], pData.PlayerData.citizenid)
	CTRPFW.Functions.ExecuteSql(false, "UPDATE `player_houses` SET `keyholders` = '"..json.encode(housekeyholders[house]).."' WHERE `house` = '"..house.."'")
end)

RegisterServerEvent('ctrp-houses:server:removeHouseKey')
AddEventHandler('ctrp-houses:server:removeHouseKey', function(house, citizenData)
	local src = source
	local newHolders = {}
	if housekeyholders[house] ~= nil then
		for k, v in pairs(housekeyholders[house]) do
			if housekeyholders[house][k] ~= citizenData.citizenid then
				table.insert(newHolders, housekeyholders[house][k])
			end
		end
	end
	housekeyholders[house] = newHolders
	TriggerClientEvent('CTRPFW:Notify', src, citizenData.firstname .. " " .. citizenData.lastname .. "'s keys have been deleted..", 'error', 3500)
	CTRPFW.Functions.ExecuteSql(false, "UPDATE `player_houses` SET `keyholders` = '"..json.encode(housekeyholders[house]).."' WHERE `house` = '"..house.."'")
end)

function typeof(var)
    local _type = type(var);
    if(_type ~= "table" and _type ~= "userdata") then
        return _type;
    end
    local _meta = getmetatable(var);
    if(_meta ~= nil and _meta._NAME ~= nil) then
        return _meta._NAME;
    else
        return _type;
    end
end

local housesLoaded = false

Citizen.CreateThread(function()
	while true do
		if not housesLoaded then
			exports['ghmattimysql']:execute('SELECT * FROM player_houses', function(houses)
				if houses ~= nil then
					for _,house in pairs(houses) do
						houseowneridentifier[house.house] = house.identifier
						houseownercid[house.house] = house.citizenid
						housekeyholders[house.house] = json.decode(house.keyholders)
					end
				end
			end)
			housesLoaded = true
		end
		Citizen.Wait(7)
	end
end)

RegisterServerEvent('ctrp-houses:server:OpenDoor')
AddEventHandler('ctrp-houses:server:OpenDoor', function(target, house)
    local src = source
    local OtherPlayer = CTRPFW.Functions.GetPlayer(target)
    if OtherPlayer ~= nil then
        TriggerClientEvent('ctrp-houses:client:SpawnInApartment', OtherPlayer.PlayerData.source, house)
    end
end)

RegisterServerEvent('ctrp-houses:server:RingDoor')
AddEventHandler('ctrp-houses:server:RingDoor', function(house)
    local src = source
    TriggerClientEvent('ctrp-houses:client:RingDoor', -1, src, house)
end)

RegisterServerEvent('ctrp-houses:server:savedecorations')
AddEventHandler('ctrp-houses:server:savedecorations', function(house, decorations)
	local src = source
	CTRPFW.Functions.ExecuteSql(false, "UPDATE `player_houses` SET `decorations` = '"..json.encode(decorations).."' WHERE `house` = '"..house.."'")
	TriggerClientEvent("ctrp-houses:server:sethousedecorations", -1, house, decorations)
end)

CTRPFW.Functions.CreateCallback('ctrp-houses:server:getHouseDecorations', function(source, cb, house)
	local retval = nil
	CTRPFW.Functions.ExecuteSql(false, "SELECT * FROM `player_houses` WHERE `house` = '"..house.."'", function(result)
		if result[1] ~= nil then
			if result[1].decorations ~= nil then
				retval = json.decode(result[1].decorations)
			end
		end
		cb(retval)
	end)
end)

CTRPFW.Functions.CreateCallback('ctrp-houses:server:getHouseLocations', function(source, cb, house)
	local retval = nil
	CTRPFW.Functions.ExecuteSql(false, "SELECT * FROM `player_houses` WHERE `house` = '"..house.."'", function(result)
		if result[1] ~= nil then
			retval = result[1]
		end
		cb(retval)
	end)
end)

CTRPFW.Functions.CreateCallback('ctrp-houses:server:getHouseKeys', function(source, cb)
	local src = source
	local pData = CTRPFW.Functions.GetPlayer(src)
	local cid = pData.PlayerData.citizenid
end)

function mysplit (inputstr, sep)
	if sep == nil then
			sep = "%s"
	end
	local t={}
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
			table.insert(t, str)
	end
	return t
end

CTRPFW.Functions.CreateCallback('ctrp-houses:server:getOwnedHouses', function(source, cb)
	local src = source
	local pData = CTRPFW.Functions.GetPlayer(src)

	if pData then
		exports['ghmattimysql']:execute('SELECT * FROM player_houses WHERE identifier = @identifier AND citizenid = @citizenid', {['@identifier'] = pData.PlayerData.steam, ['@citizenid'] = pData.PlayerData.citizenid}, function(houses)
			local ownedHouses = {}

			for i=1, #houses, 1 do
				table.insert(ownedHouses, houses[i].house)
			end

			if houses ~= nil then
				cb(ownedHouses)
			else
				cb(nil)
			end
		end)
	end
end)

CTRPFW.Functions.CreateCallback('ctrp-houses:server:getSavedOutfits', function(source, cb)
	local src = source
	local pData = CTRPFW.Functions.GetPlayer(src)

	if pData then
		exports['ghmattimysql']:execute('SELECT * FROM player_outfits WHERE citizenid = @citizenid', {['@citizenid'] = pData.PlayerData.citizenid}, function(result)
			if result[1] ~= nil then
				cb(result)
			else
				cb(nil)
			end
		end)
	end
end)

CTRPFW.Commands.Add("decorate", "Decorate your home :)", {}, false, function(source, args)
	TriggerClientEvent("ctrp-houses:client:decorate", source)
end)

function GetHouseStreetCount(street)
	local count = 1
	CTRPFW.Functions.ExecuteSql(true, "SELECT * FROM `houselocations` WHERE `name` LIKE '%"..street.."%'", function(result)
		if result[1] ~= nil then
			for i = 1, #result, 1 do
				count = count + 1
			end
		end
		return count
	end)
	return count
end

RegisterServerEvent('ctrp-houses:server:LogoutLocation')
AddEventHandler('ctrp-houses:server:LogoutLocation', function()
	local src = source
	local Player = CTRPFW.Functions.GetPlayer(src)
	local MyItems = Player.PlayerData.items
	CTRPFW.Functions.ExecuteSql(true, "UPDATE `players` SET `inventory` = '"..CTRPFW.EscapeSqli(json.encode(MyItems)).."' WHERE `citizenid` = '"..Player.PlayerData.citizenid.."'")
	CTRPFW.Player.Logout(src)
    TriggerClientEvent('ctrp-multicharacter:client:chooseChar', src)
end)

RegisterServerEvent('ctrp-houses:server:giveHouseKey')
AddEventHandler('ctrp-houses:server:giveHouseKey', function(target, house)
	local src = source
	local tPlayer = CTRPFW.Functions.GetPlayer(target)

	if tPlayer ~= nil then
		if housekeyholders[house] ~= nil then
			for _, cid in pairs(housekeyholders[house]) do
				if cid == tPlayer.PlayerData.citizenid then
					TriggerClientEvent('CTRPFW:Notify', src, 'This person already has the keys of the house!', 'error', 3500)
					return
				end
			end
			table.insert(housekeyholders[house], tPlayer.PlayerData.citizenid)
			CTRPFW.Functions.ExecuteSql(true, "UPDATE `player_houses` SET `keyholders` = '"..json.encode(housekeyholders[house]).."' WHERE `house` = '"..house.."'")
			TriggerClientEvent('ctrp-houses:client:refreshHouse', tPlayer.PlayerData.source)
			TriggerClientEvent('CTRPFW:Notify', tPlayer.PlayerData.source, 'You have the keys of '..Config.Houses[house].adress..' recieved!', 'success', 2500)
		else
			local sourceTarget = CTRPFW.Functions.GetPlayer(src)
			housekeyholders[house] = {
				[1] = sourceTarget.PlayerData.citizenid
			}
			table.insert(housekeyholders[house], tPlayer.PlayerData.citizenid)
			CTRPFW.Functions.ExecuteSql(true, "UPDATE `player_houses` SET `keyholders` = '"..json.encode(housekeyholders[house]).."' WHERE `house` = '"..house.."'")
			TriggerClientEvent('ctrp-houses:client:refreshHouse', tPlayer.PlayerData.source)
			TriggerClientEvent('CTRPFW:Notify', tPlayer.PlayerData.source, 'You have the keys of '..Config.Houses[house].adress..' recieved!', 'success', 2500)
		end
	else
		TriggerClientEvent('CTRPFW:Notify', src, 'Something went wrond try again!', 'error', 2500)
	end
end)

RegisterServerEvent('ctrp-houses:server:giveHouseKeyonrent')
AddEventHandler('ctrp-houses:server:giveHouseKeyonrent', function(target, house)
	local src = source
	local tPlayer = CTRPFW.Functions.GetPlayer(target)

	if tPlayer ~= nil then
		if housekeyholders[house] ~= nil then
			for _, cid in pairs(housekeyholders[house]) do
				if cid == tPlayer.PlayerData.citizenid then
					TriggerClientEvent('CTRPFW:Notify', src, 'This person already has the keys of the house!', 'error', 3500)
					return
				end
			end
			table.insert(housekeyholders[house], tPlayer.PlayerData.citizenid)
			CTRPFW.Functions.ExecuteSql(true, "UPDATE `player_houses` SET `keyholders` = '"..json.encode(housekeyholders[house]).."' WHERE `house` = '"..house.."'")
			TriggerClientEvent('ctrp-houses:client:refreshHouse', tPlayer.PlayerData.source)
			TriggerClientEvent('CTRPFW:Notify', tPlayer.PlayerData.source, 'You have the keys of '..Config.Houses[house].adress..' recieved!', 'success', 2500)
		else
			local sourceTarget = CTRPFW.Functions.GetPlayer(src)
			housekeyholders[house] = {
				[1] = sourceTarget.PlayerData.citizenid
			}
			table.insert(housekeyholders[house], tPlayer.PlayerData.citizenid)
			CTRPFW.Functions.ExecuteSql(true, "UPDATE `player_houses` SET `keyholders` = '"..json.encode(housekeyholders[house]).."' WHERE `house` = '"..house.."'")
			TriggerClientEvent('ctrp-houses:client:refreshHouse', tPlayer.PlayerData.source)
			TriggerClientEvent('CTRPFW:Notify', tPlayer.PlayerData.source, 'You have the keys of '..Config.Houses[house].adress..' recieved!', 'success', 2500)
		end
	else
		TriggerClientEvent('CTRPFW:Notify', src, 'Something went wrond try again!', 'error', 2500)
	end
end)

RegisterServerEvent('test:test')
AddEventHandler('test:test', function(msg)
	print(msg)
end)

RegisterServerEvent('ctrp-houses:server:setLocation')
AddEventHandler('ctrp-houses:server:setLocation', function(coords, house, type)
	local src = source
	local Player = CTRPFW.Functions.GetPlayer(src)

	if type == 1 then
		CTRPFW.Functions.ExecuteSql(true, "UPDATE `player_houses` SET `stash` = '"..json.encode(coords).."' WHERE `house` = '"..house.."'")
	elseif type == 2 then
		CTRPFW.Functions.ExecuteSql(true, "UPDATE `player_houses` SET `outfit` = '"..json.encode(coords).."' WHERE `house` = '"..house.."'")
	elseif type == 3 then
		CTRPFW.Functions.ExecuteSql(true, "UPDATE `player_houses` SET `logout` = '"..json.encode(coords).."' WHERE `house` = '"..house.."'")
	elseif type == 4 then
		CTRPFW.Functions.ExecuteSql(true, "UPDATE `player_houses` SET `cupboard` = '"..json.encode(coords).."' WHERE `house` = '"..house.."'")
	end

	TriggerClientEvent('ctrp-houses:client:refreshLocations', -1, house, json.encode(coords), type)
end)

CTRPFW.Commands.Add("createhouse", "Create a house as a real estate agent", {{name="citizenid", help="Citizen ID of Realestate Agent"},{name="tier", help="Name of the item(no label)"}}, true, function(source, args)
	local Player = CTRPFW.Functions.GetPlayer(source)
	local citizenid = tostring(args[1])
	local tier = tonumber(args[2])
	if Player.PlayerData.job.gradelabel == "Builder" then
		TriggerClientEvent("ctrp-houses:client:createHouses", source, citizenid, tier)
	else
		TriggerClientEvent('CTRPFW:Notify', source, "You don't have Permission!", "error")
	end
end)

CTRPFW.Commands.Add("addgarage", "Add garage to the closest house", {}, false, function(source, args)
	local Player = CTRPFW.Functions.GetPlayer(source)
	if PlayerPlayerData.job.name == "realestate" and Player.PlayerData.job.gradelabel == "Builder" then
		TriggerClientEvent("ctrp-houses:client:addGarage", source)
	else
		TriggerClientEvent('CTRPFW:Notify', source, "You don't have Permission!", "error")
	end
end)


--[[CTRPFW.Commands.Add("addadvert", "Add advertisement to your house", {{name="housenumber", help="HouseNumber Alloted to you"},{name="companyname", help="Name of the company"},{name="contactnumber", help="Contact Number"}}, true, function(source, args)
	local Player = CTRPFW.Functions.GetPlayer(source)
	local housenumber = tonumber(args[1])
	local companyname = tostring(args[2])
	local companynumber = tonumber(args[3])
	if Player.PlayerData.job.gradelabel == "Company Owner" then
		CTRPFW.Functions.ExecuteSql(false, "UPDATE `houselocations` SET `companyname` = '"..companyname.."' WHERE `id` = '"..housenumber.."'")
		CTRPFW.Functions.ExecuteSql(false, "UPDATE `houselocations` SET `companynumber` = '"..companynumber.."' WHERE `id` = '"..housenumber.."'")

		print(companynumber)
		print(companyname)
	else
		TriggerClientEvent('CTRPFW:Notify', source, "You don't have Permission!", "error")
	end
end)]]

CTRPFW.Commands.Add("addadvert", "Add advertisement to your house", {{name="housenumber", help="HouseNumber Alloted to you"},{name="companyname", help="Name of the company"},{name="contactnumber", help="Contact Number"},{name="estimateamount", help="Estimate Amount"}}, true, function(source, args)
	local Player = CTRPFW.Functions.GetPlayer(source)
	local housenumber = tonumber(args[1])
	local companyname = tostring(args[2])
	local companynumber = tonumber(args[3])
	local estimateamount = tonumber(args[4])
	if Player.PlayerData.job.gradelabel == "Company Owner" then


		CTRPFW.Functions.ExecuteSql(false, "SELECT * FROM `houselocations` WHERE `id` = '"..housenumber.."'", function(results)
			-- Looping through results:
			for k,v in pairs(results) do
				if v.citizenid == Player.PlayerData.citizenid then

					CTRPFW.Functions.ExecuteSql(false, "UPDATE `houselocations` SET `companyname` = '"..companyname.."' WHERE `id` = '"..housenumber.."'")
					CTRPFW.Functions.ExecuteSql(false, "UPDATE `houselocations` SET `companynumber` = '"..companynumber.."' WHERE `id` = '"..housenumber.."'")
					CTRPFW.Functions.ExecuteSql(false, "UPDATE `houselocations` SET `estimate` = '"..estimateamount.."' WHERE `id` = '"..housenumber.."'")
					
					TriggerClientEvent("CTRPFW:Notify", source, "Added Advertisement ", "success", 10000)

				else
					TriggerClientEvent("CTRPFW:Notify", source, "Virus Chutiya hai kya? ", "error", 10000)
				end	
			end
		end)	

	else
		TriggerClientEvent('CTRPFW:Notify', source, "You don't have Permission!", "error")
	end
end)

RegisterServerEvent('ctrp-houses:server:setAdvert')
AddEventHandler('ctrp-houses:server:setAdvert', function(housenumber, companyname, companynumber, estimateamount)
	local src = source
	local Player = CTRPFW.Functions.GetPlayer(src)
	local housenumber = housenumber
	local companyname = companyname
	local companynumber = companynumber
	local estimateamount = estimateamount
	
	

	CTRPFW.Functions.ExecuteSql(false, "SELECT * FROM `houselocations` WHERE `id` = '"..housenumber.."'", function(results)
		-- Looping through results:
		for k,v in pairs(results) do
			if v.citizenid == Player.PlayerData.citizenid then

				CTRPFW.Functions.ExecuteSql(false, "UPDATE `houselocations` SET `companyname` = '"..companyname.."' WHERE `id` = '"..housenumber.."'")
				CTRPFW.Functions.ExecuteSql(false, "UPDATE `houselocations` SET `companynumber` = '"..companynumber.."' WHERE `id` = '"..housenumber.."'")
				CTRPFW.Functions.ExecuteSql(false, "UPDATE `houselocations` SET `estimate` = '"..estimateamount.."' WHERE `id` = '"..housenumber.."'")

				TriggerClientEvent("CTRPFW:Notify", src, "Added Advertisement ", "success", 10000)

			else
				TriggerClientEvent("CTRPFW:Notify", src, "Virus Chutiya hai kya? ", "error", 10000)
			end	
		end
	end)	

end)


CTRPFW.Commands.Add("ownthishouse", "Own house assigned house", {{name="housenumber", help="HouseNumber Alloted to you"}}, true, function(source, args)
	local Player = CTRPFW.Functions.GetPlayer(source)
	local housenumber = tonumber(args[1])
	if Player.PlayerData.job.gradelabel == "Company Owner" then


		CTRPFW.Functions.ExecuteSql(false, "SELECT * FROM `houselocations` WHERE `id` = '"..housenumber.."'", function(results)
			-- Looping through results:
			for k,v in pairs(results) do
				if v.citizenid == Player.PlayerData.citizenid then
					local street = v.label
					local id = v.id

					TriggerClientEvent('ctrp-houses:client:ownthishouse', source, street , id)

				else
					TriggerClientEvent("CTRPFW:Notify", source, "Virus Chutiya hai kya? ", "error", 10000)
				end	
			end
		end)	

	else
		TriggerClientEvent('CTRPFW:Notify', source, "You don't have Permission!", "error")
	end
end)

CTRPFW.Commands.Add("giveonrent", "Give assigned and owned house on rent", {{name="playerid", help="Player ID"}}, true, function(source, args)
	local Player = CTRPFW.Functions.GetPlayer(source)
	local playerid = tonumber(args[1])
	if Player.PlayerData.job.gradelabel == "Company Owner" then

		TriggerClientEvent('ctrp-houses:client:givetheHouseKeyonrent', source, playerid)

	else
		TriggerClientEvent('CTRPFW:Notify', source, "You don't have Permission!", "error")
	end
end)

CTRPFW.Commands.Add("transferhouse", "Transfer Assigned house", {{name="housenumber", help="HouseNumber Alloted to you"},{name="playerid", help="Player ID"}}, true, function(source, args)
	local Player = CTRPFW.Functions.GetPlayer(source)
	local housenumber = tonumber(args[1])
	local playerid = tonumber(args[2])
	if Player.PlayerData.job.gradelabel == "Company Owner" then


		CTRPFW.Functions.ExecuteSql(false, "SELECT * FROM `houselocations` WHERE `id` = '"..housenumber.."'", function(results)
			-- Looping through results:
			for k,v in pairs(results) do
				if v.citizenid == Player.PlayerData.citizenid then
					local street = v.label
					local id = v.id

					TriggerClientEvent('ctrp-houses:client:transferthishouse', source, street , housenumber , playerid , id)

				else
					TriggerClientEvent("CTRPFW:Notify", source, "Virus Chutiya hai kya? ", "error", 10000)
				end	
			end
		end)	

	else
		TriggerClientEvent('CTRPFW:Notify', source, "You don't have Permission!", "error")
	end
end)

RegisterServerEvent('ctrp-houses:server:settransfer')
AddEventHandler('ctrp-houses:server:settransfer', function(housenumber, playerid)
	local source = source
	local Player = CTRPFW.Functions.GetPlayer(source)
	local housenumber = housenumber
	local playerid = playerid
	
	

	CTRPFW.Functions.ExecuteSql(false, "SELECT * FROM `houselocations` WHERE `id` = '"..housenumber.."'", function(results)
		-- Looping through results:
		for k,v in pairs(results) do
			if v.citizenid == Player.PlayerData.citizenid then
				local street = v.label
				local id = v.id

				TriggerClientEvent('ctrp-houses:client:transferthishouse', source, street , housenumber , playerid , id)

			else
				TriggerClientEvent("CTRPFW:Notify", source, "Virus Chutiya hai kya? ", "error", 10000)
			end	
		end
	end)

end)


CTRPFW.Commands.Add("revokefromrent", "Revoke given house on rent", {{name="playerid", help="Player ID"}}, true, function(source, args)
	local Player = CTRPFW.Functions.GetPlayer(source)
	local playerid = tonumber(args[1])
	if Player.PlayerData.job.gradelabel == "Company Owner" then

		TriggerClientEvent('ctrp-houses:client:removeHouseKeyonrent', source, playerid)

	else
		TriggerClientEvent('CTRPFW:Notify', source, "You don't have Permission!", "error")
	end
end)






RegisterServerEvent('ctrp-houses:server:SetInsideMeta')
AddEventHandler('ctrp-houses:server:SetInsideMeta', function(insideId, bool)
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)
    local insideMeta = Player.PlayerData.metadata["inside"]

    if bool then
        insideMeta.apartment.apartmentType = nil
        insideMeta.apartment.apartmentId = nil
        insideMeta.house = insideId

        Player.Functions.SetMetaData("inside", insideMeta)
    else
        insideMeta.apartment.apartmentType = nil
        insideMeta.apartment.apartmentId = nil
        insideMeta.house = nil

        Player.Functions.SetMetaData("inside", insideMeta)
    end
end)

CTRPFW.Functions.CreateCallback('ctrp-phone_new:server:GetPlayerHouses', function(source, cb)
	local src = source
	local Player = CTRPFW.Functions.GetPlayer(src)
	local MyHouses = {}
	local keyholders = {}

	CTRPFW.Functions.ExecuteSql(false, "SELECT * FROM `player_houses` WHERE `citizenid` = '"..Player.PlayerData.citizenid.."'", function(result)
		if result[1] ~= nil then
			for k, v in pairs(result) do
				v.keyholders = json.decode(v.keyholders)
				if v.keyholders ~= nil and next(v.keyholders) then
					for f, data in pairs(v.keyholders) do
						CTRPFW.Functions.ExecuteSql(false, "SELECT * FROM `players` WHERE `citizenid` = '"..data.."'", function(keyholderdata)
							if keyholderdata[1] ~= nil then
								keyholders[f] = keyholderdata[1]
							end
						end)
					end
				else
					keyholders[1] = Player.PlayerData
				end

				table.insert(MyHouses, {
					name = v.house,
					keyholders = keyholders,
					owner = v.citizenid,
					price = Config.Houses[v.house].price,
					label = Config.Houses[v.house].adress,
					tier = Config.Houses[v.house].tier,
					garage = Config.Houses[v.house].garage,
				})
			end

			cb(MyHouses)
		end
	end)
end)

function escape_sqli(source)
    local replacements = { ['"'] = '\\"', ["'"] = "\\'" }
    return source:gsub( "['\"]", replacements ) -- or string.gsub( source, "['\"]", replacements )
end

CTRPFW.Functions.CreateCallback('ctrp-phone_new:server:MeosGetPlayerHouses', function(source, cb, input)
	local src = source
	if input ~= nil then
		local search = escape_sqli(input)
		local searchData = {}

		CTRPFW.Functions.ExecuteSql(false, 'SELECT * FROM `players` WHERE `citizenid` = "'..search..'" OR `charinfo` LIKE "%'..search..'%"', function(result)
			if result[1] ~= nil then
				CTRPFW.Functions.ExecuteSql(false, "SELECT * FROM `player_houses` WHERE `citizenid` = '"..result[1].citizenid.."'", function(houses)
					if houses[1] ~= nil then
						for k, v in pairs(houses) do
							table.insert(searchData, {
								name = v.house,
								keyholders = keyholders,
								owner = v.citizenid,
								price = Config.Houses[v.house].price,
								label = Config.Houses[v.house].adress,
								tier = Config.Houses[v.house].tier,
								garage = Config.Houses[v.house].garage,
								charinfo = json.decode(result[1].charinfo),
								coords = {
									x = Config.Houses[v.house].coords.enter.x,
									y = Config.Houses[v.house].coords.enter.y,
									z = Config.Houses[v.house].coords.enter.z,
								}
							})
						end

						cb(searchData)
					end
				end)
			else
				cb(nil)
			end
		end)
	else
		cb(nil)
	end
end)

CTRPFW.Functions.CreateUseableItem("police_stormram", function(source, item)
	local Player = CTRPFW.Functions.GetPlayer(source)

	if ( Player.PlayerData.job.name == "police" and Player.PlayerData.job.onduty) then
		TriggerClientEvent("ctrp-houses:client:HomeInvasion", source)
	else
		TriggerClientEvent('CTRPFW:Notify', source, "This is only possible for emergency services!", "error")
	end
end)

RegisterServerEvent('ctrp-houses:server:SetHouseRammed')
AddEventHandler('ctrp-houses:server:SetHouseRammed', function(bool, house)
	Config.Houses[house].IsRammed = bool
	TriggerClientEvent('ctrp-houses:client:SetHouseRammed', -1, bool, house)
end)

--[[CTRPFW.Commands.Add("enter", "Enter House", {}, false, function(source, args)
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)

    TriggerClientEvent('ctrp-houses:client:EnterHouse', src)
end)]]

CTRPFW.Commands.Add("ring", "Ring the doorbell at home", {}, false, function(source, args)
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)

    TriggerClientEvent('ctrp-houses:client:RequestRing', src)
end)


--------------------
--FINANCE SCRIPT--
--------------------
--BY VIRUS--
--------------------


--TRIGGER EVENT 

RegisterNetEvent('ctrp-houses:server:rentHouse')
AddEventHandler('ctrp-houses:server:rentHouse', function(house)

	local src     	= source
	local pData 	= CTRPFW.Functions.GetPlayer(src)
	local price   	= Config.Houses[house].price
	--local HousePrice = math.ceil(price * 1.21)
	local bankBalance = pData.PlayerData.money["bank"]
	
	local rentprice 	= (price / 5)
	local insttime 		= 168 -- Hours
	local date = os.date('%Y-%m-%d')
	local hnumber = GenerateVirus()

	if (bankBalance >= rentprice) then
		CTRPFW.Functions.ExecuteSql(false, "INSERT INTO `player_houses` (`house`, `identifier`, `citizenid`, `keyholders`, `rentprice`, `insttime`, `houseprice`, `repayam`, `date`, `hnumber`) VALUES ('"..house.."', '"..pData.PlayerData.steam.."', '"..pData.PlayerData.citizenid.."', '"..json.encode(keyyeet).."', '"..(price - rentprice).."', '"..insttime.."', '"..price.."', '"..rentprice.."', '"..date.."', '"..hnumber.."')")
		houseowneridentifier[house] = pData.PlayerData.steam
		houseownercid[house] = pData.PlayerData.citizenid
		housekeyholders[house] = {
			[1] = pData.PlayerData.citizenid
		}
		CTRPFW.Functions.ExecuteSql(true, "UPDATE `houselocations` SET `owned` = 1 WHERE `name` = '"..house.."'")
		TriggerClientEvent('ctrp-houses:client:SetClosestHouse', src)

		--pData.Functions.RemoveMoney('bank', rentprice, "bought-house") -- 21% Extra house costs
		
		TriggerClientEvent('ctrp-moneysafesgov:client:DepositMoney', src , rentprice)
		pData.Functions.RemoveItem('housingpaper', 1)
	else
		TriggerClientEvent('CTRPFW:Notify', source, "You dont have enough money..", "error")
	end

end)

function GenerateVirus()
    local hnumber = tostring(GetRandomNumber(1)) .. GetRandomLetter(2) .. tostring(GetRandomNumber(3)) .. GetRandomLetter(2)
    CTRPFW.Functions.ExecuteSql(true, "SELECT * FROM `player_houses` WHERE `hnumber` = '"..hnumber.."'", function(result)
        while (result[1] ~= nil) do
            hnumber = tostring(GetRandomNumber(1)) .. GetRandomLetter(2) .. tostring(GetRandomNumber(3)) .. GetRandomLetter(2)
        end
        return Hnumber
    end)
    return hnumber:upper()
end

function GetRandomNumber(length)
	Citizen.Wait(1)
	math.randomseed(GetGameTimer())
	if length > 0 then
		return GetRandomNumber(length - 1) .. NumberCharset[math.random(1, #NumberCharset)]
	else
		return ''
	end
end

function GetRandomLetter(length)
	Citizen.Wait(1)
	math.randomseed(GetGameTimer())
	if length > 0 then
		return GetRandomLetter(length - 1) .. Charset[math.random(1, #Charset)]
	else
		return ''
	end
end

--EVENT TO MINUS 1 HOUR 

local timer = ((60 * 1000) * 60) -- 60 minute timer -- 1 Hour
function updateFinance()
    exports['ghmattimysql']:execute('SELECT insttime, hnumber FROM player_houses WHERE insttime > @insttime', {
        ['@insttime'] = 0
    }, function(result)
        for i=1, #result do
            local financeTimer = result[i].insttime
            local hnumber = result[i].hnumber
            local newTimer = financeTimer - 1  ---1 Hour Cut
            if financeTimer ~= nil then
                CTRPFW.Functions.ExecuteSql(false, "UPDATE `player_houses` SET `insttime`='"..newTimer.."'  WHERE `hnumber`='"..hnumber.."'")
            end
        end
    end)
    SetTimeout(timer, updateFinance)
end
SetTimeout(timer, updateFinance)



--EVENT TO CHECK FINANCE

RegisterNetEvent('ctrp-houses:AutoStatuscheck')
AddEventHandler('ctrp-houses:AutoStatuscheck', function()
    local src = source
	local Player = CTRPFW.Functions.GetPlayer(source)

	local foundOwedHouse = false
    CTRPFW.Functions.ExecuteSql(false, "SELECT * FROM `player_houses` WHERE `citizenid` = '"..Player.PlayerData.citizenid.."'", function(results)
		-- Looping through results:
		for k,v in pairs(results) do
			if v.insttime < 1 and v.repayam > 1 then
				foundOwedHouse = true
            elseif v.insttime < 72 and v.repayam > 1 then
                local financeTime = v.insttime
                TriggerClientEvent("CTRPFW:Notify", src, "You have one Rent which you have to pay in "..financeTime.. " hours", "error", 10000)
			end	
		end
		
		if foundOwedHouse then
            -- Editing found vehicle:
            exports['ghmattimysql']:execute("SELECT * FROM player_houses WHERE citizenid = @citizenid", {['@citizenid'] = Player.PlayerData.citizenid}, function(vehData)
				-- loop through vehicles again and delete:
				for k,v in pairs(vehData) do
					if v.insttime < 1 and v.repayam > 1 then

						local hnumber = v.hnumber
						local house = v.house
                        local rentAmount = v.rentprice
                        local rentPayment = v.repayam

                        --if Player.PlayerData.money["bank"] >= rentPayment then
                
                            TriggerClientEvent("CTRPFW:Notify", src, "You have 1 Rent of your House Number: " ..hnumber.. " installment cost: $ " ..rentPayment.." . ", "error", 10000) 
                            TriggerClientEvent("CTRPFW:Notify", src, "Kindly pay in 10min else vehicle will be seized ", "error", 10000)
                            TriggerClientEvent("virus-houses:mail" , src, hnumber , house , rentPayment)
                      
                            
                        
                            Citizen.Wait(600000)
                            exports['ghmattimysql']:execute("SELECT * FROM player_houses WHERE citizenid = @citizenid", {['@citizenid'] = Player.PlayerData.citizenid}, function(vehData)
                                -- loop through vehicles again and delete:
                                for k,v in pairs(vehData) do
                                    if v.insttime < 1 and v.repayam > 1 then
                                        local hnumber = v.hnumber
										local house = v.house
                                        CTRPFW.Functions.ExecuteSql(true, "DELETE FROM `player_houses` WHERE `hnumber` = '"..hnumber.."' AND `house` = '"..house.."'")
                                    end
                                end
                            end)
                            TriggerClientEvent("CTRPFW:Notify", src, "We Have Seized Your House", "error", 7000) 
                        --end

                    
					end
				end
            end)
        end

	end)
end)


RegisterNetEvent('ctrp-houses:CheckRent')
AddEventHandler('ctrp-houses:CheckRent', function()
    local src = source
	local Player = CTRPFW.Functions.GetPlayer(source)

	local foundOwedHouse = false
    CTRPFW.Functions.ExecuteSql(false, "SELECT * FROM `player_houses` WHERE `citizenid` = '"..Player.PlayerData.citizenid.."'", function(results)
		-- Looping through results:
		for k,v in pairs(results) do
			if v.insttime < 1 and v.repayam > 1 then
				foundOwedHouse = true
            elseif v.insttime < 72 and v.repayam > 1 then
                local financeTime = v.insttime
                TriggerClientEvent("CTRPFW:Notify", src, "You have one Rent which you have to pay in "..financeTime.. " hours", "error", 10000)
			end	
		end
		
		if foundOwedHouse then
            -- Editing found vehicle:
            exports['ghmattimysql']:execute("SELECT * FROM player_houses WHERE citizenid = @citizenid", {['@citizenid'] = Player.PlayerData.citizenid}, function(vehData)
				-- loop through vehicles again and delete:
				for k,v in pairs(vehData) do
					if v.insttime < 1 and v.repayam > 1 then

						local hnumber = v.hnumber
						local house = v.house
                        local rentAmount = v.rentprice
                        local rentPayment = v.repayam

                        --if Player.PlayerData.money["bank"] >= rentPayment then
                
                            TriggerClientEvent("CTRPFW:Notify", src, "You have 1 Rent of your House Number: " ..hnumber.. " installment cost: $ " ..rentPayment.." . ", "error", 10000) 
                            TriggerClientEvent("CTRPFW:Notify", src, "Kindly pay in 10min else vehicle will be seized ", "error", 10000)
                            TriggerClientEvent("virus-houses:mail" , src, hnumber , house , rentPayment)
                      
                            
                        
                            Citizen.Wait(600000)
                            exports['ghmattimysql']:execute("SELECT * FROM player_houses WHERE citizenid = @citizenid", {['@citizenid'] = Player.PlayerData.citizenid}, function(vehData)
                                -- loop through vehicles again and delete:
                                for k,v in pairs(vehData) do
                                    if v.insttime < 1 and v.repayam > 1 then
                                        local hnumber = v.hnumber
										local house = v.house
                                        CTRPFW.Functions.ExecuteSql(true, "DELETE FROM `player_houses` WHERE `hnumber` = '"..hnumber.."' AND `house` = '"..house.."'")
                                    end
                                end
                            end)
                            TriggerClientEvent("CTRPFW:Notify", src, "We Have Seized Your House", "error", 7000) 
                        --end

                    
					end
				end
            end)
        elseif not foundOwedHouse then
            
            TriggerClientEvent("CTRPFW:Notify", src, "No any dues!", "error", 5000) 
			
        end
	end)
end)

--EVENT TO PAY WEEKLY RENT
RegisterNetEvent('ctrp-houses:PayRent')
AddEventHandler('ctrp-houses:PayRent', function()
    local src = source
	local Player = CTRPFW.Functions.GetPlayer(source)

	local foundOwedHouse = false
    CTRPFW.Functions.ExecuteSql(false, "SELECT * FROM `player_houses` WHERE `citizenid` = '"..Player.PlayerData.citizenid.."'", function(results)
		-- Looping through results:
		for k,v in pairs(results) do
			if v.insttime < 1 and v.repayam > 1 then
				foundOwedHouse = true
            
			end	
		end
		
		if foundOwedHouse then
            -- Editing found vehicle:
            exports['ghmattimysql']:execute("SELECT * FROM player_houses WHERE citizenid = @citizenid", {['@citizenid'] = Player.PlayerData.citizenid}, function(vehData)
				-- loop through vehicles again and delete:
				for k,v in pairs(vehData) do
					if v.insttime < 1 and v.repayam > 1 then

						local hnumber = v.hnumber
						local house = v.house
                        local rentAmount = v.rentprice
                        local rentPayment = v.repayam
                        local date = os.date('%Y-%m-%d')

                        if Player.PlayerData.money["bank"] >= rentPayment then
                            
								TriggerClientEvent("CTRPFW:Notify", src, "You have 1 Rent of your House Number: " ..hnumber.. " installment cost: $ " ..rentPayment.." . ", "error", 10000) 
								Citizen.Wait(100)

                                --Player.Functions.RemoveMoney('bank', rentPayment)
                                TriggerClientEvent('ctrp-moneysafesgov:client:DepositMoney', src, rentPayment) 
                                TriggerClientEvent("CTRPFW:Notify", src, "Paid Rent of $" ..rentPayment.. " . ", "error", 10000) 
                                CTRPFW.Functions.ExecuteSql(false, "UPDATE `player_houses` SET `rentprice`='"..(rentAmount - rentPayment).."' WHERE `hnumber`='"..hnumber.."'")
                                CTRPFW.Functions.ExecuteSql(false, "UPDATE `player_houses` SET `insttime`='168' WHERE `hnumber`='"..hnumber.."'")
                                CTRPFW.Functions.ExecuteSql(false, "UPDATE `player_houses` SET `fdate`='"..date.."' WHERE `hnumber`='"..hnumber.."'")
                                TriggerClientEvent("virus-houses:paidmail" , src, hnumber , house , rentPayment)

                        elseif rentPayment < 1 then
                                CTRPFW.Functions.ExecuteSql(false, "UPDATE `player_houses` SET `rentprice`='0' WHERE `hnumber`='"..hnumber.."'")
                                CTRPFW.Functions.ExecuteSql(false, "UPDATE `player_houses` SET `insttime`='0' WHERE `hnumber`='"..hnumber.."'")
                                CTRPFW.Functions.ExecuteSql(false, "UPDATE `player_houses` SET `repayam`='0' WHERE `hnumber`='"..hnumber.."'")
                                TriggerClientEvent("CTRPFW:Notify", src, "No Any Rent!", "error", 7000) 

                        elseif rentAmount == 0 then
                                CTRPFW.Functions.ExecuteSql(false, "UPDATE `player_houses` SET `rentprice`='0' WHERE `hnumber`='"..hnumber.."'")
                                CTRPFW.Functions.ExecuteSql(false, "UPDATE `player_houses` SET `insttime`='0' WHERE `hnumber`='"..hnumber.."'")
                                CTRPFW.Functions.ExecuteSql(false, "UPDATE `player_houses` SET `repayam`='0' WHERE `hnumber`='"..hnumber.."'")
                                TriggerClientEvent("CTRPFW:Notify", src, "No Any Rent!", "error", 7000) 
                        
                        else 
                            TriggerClientEvent("CTRPFW:Notify", src, "You don't have money", "error", 7000)
                        end
                   
					end
				end
            end)
        elseif not foundOwedHouse then
            
            TriggerClientEvent("CTRPFW:Notify", src, "No any dues!", "error", 7000) 
        end
	end)
end)


--EVENT TO CHECK ALREADY RENTED HOUSE
RegisterNetEvent('ctrp-houses:ExistRent')
AddEventHandler('ctrp-houses:ExistRent', function()
    local src = source
	local Player = CTRPFW.Functions.GetPlayer(source)

	local foundOwedHouse = false
    CTRPFW.Functions.ExecuteSql(false, "SELECT * FROM `player_houses` WHERE `citizenid` = '"..Player.PlayerData.citizenid.."'", function(results)

		for k,v in pairs(results) do
			if v.insttime > 1 and v.rentprice > 1 then
				foundOwedHouse = true
               
			end	
		end

        if foundOwedHouse then
            TriggerClientEvent("CTRPFW:Notify", src, "You already have one Rented House!", "error", 7000) 
        else
            TriggerClientEvent('ctrp-houses:client:checkhouse' , src)
        end
		

	end)
end)

RegisterServerEvent('ctrp-houses:server:buyobject')
AddEventHandler('ctrp-houses:server:buyobject', function(objectData)
    local src         = source
    local pData     = CTRPFW.Functions.GetPlayer(src)
    
    local bankBalance = pData.PlayerData.money["bank"]


    if (bankBalance >= objectData) then
        
        pData.Functions.RemoveMoney('bank', objectData)
        TriggerClientEvent('ctrp-houses:client:donekardo', src)
        
    else
        TriggerClientEvent('CTRPFW:Notify', source, "You dont have enough money..", "error")
        TriggerClientEvent('ctrp-houses:client:donekardo2', src)
    end
end)

--COMMANDS

CTRPFW.Commands.Add("rent", "Check Rent", {}, false, function(source)
	local src = source
    local Player = CTRPFW.Functions.GetPlayer(source)
    TriggerClientEvent("ctrp-houses:client:cRent" , source)
end)

CTRPFW.Commands.Add("payrent", "Pay Rent", {}, false, function(source)
	local src = source
    local Player = CTRPFW.Functions.GetPlayer(source)
    TriggerClientEvent("ctrp-houses:client:payrent" , source)
end)



