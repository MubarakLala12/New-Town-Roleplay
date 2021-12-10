CTRPFW = nil
TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)

RegisterServerEvent('ctrp-multicharacter:server:disconnect')
AddEventHandler('ctrp-multicharacter:server:disconnect', function()
    local src = source

    DropPlayer(src, "You have disconnected from CTRP Roleplay")
end)

RegisterServerEvent('ctrp-multicharacter:server:loadUserData')
AddEventHandler('ctrp-multicharacter:server:loadUserData', function(cData)
    local src = source
    if CTRPFW.Player.Login(src, cData.citizenid) then
        print('^2[ctrp-core]^7 '..GetPlayerName(src)..' (Citizen ID: '..cData.citizenid..') has succesfully loaded!')
        CTRPFW.Commands.Refresh(src)
        loadHouseData()
		--TriggerEvent('CTRPFW:Server:OnPlayerLoaded')-
        --TriggerClientEvent('CTRPFW:Client:OnPlayerLoaded', src)
        
        TriggerClientEvent('apartments:client:setupSpawnUI', src, cData)
        TriggerEvent("ctrp-log:server:sendLog", cData.citizenid, "characterloaded", {})
        TriggerEvent("ctrp-log:server:CreateLog", "joinleave", "Loaded", "green", "**".. GetPlayerName(src) .. "** ("..cData.citizenid.." | "..src..") loaded..")
	end
end)

RegisterServerEvent('ctrp-multicharacter:server:createCharacter')
AddEventHandler('ctrp-multicharacter:server:createCharacter', function(data)
    local src = source
    local newData = {}
    newData.cid = data.cid
    newData.charinfo = data
    --CTRPFW.Player.CreateCharacter(src, data)
    if CTRPFW.Player.Login(src, false, newData) then
        print('^2[ctrp-core]^7 '..GetPlayerName(src)..' has succesfully loaded!')
        CTRPFW.Commands.Refresh(src)
        loadHouseData()

        TriggerClientEvent("ctrp-multicharacter:client:closeNUI", src)
        TriggerClientEvent('apartments:client:setupSpawnUI', src, newData)
        GiveStarterItems(src)
	end
end)

function GiveStarterItems(source)
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)

    for k, v in pairs(CTRPFW.Shared.StarterItems) do
        local info = {}
        if v.item == "id_card" then
            info.citizenid = Player.PlayerData.citizenid
            info.firstname = Player.PlayerData.charinfo.firstname
            info.lastname = Player.PlayerData.charinfo.lastname
            info.birthdate = Player.PlayerData.charinfo.birthdate
            info.gender = Player.PlayerData.charinfo.gender
            info.nationality = Player.PlayerData.charinfo.nationality
        elseif v.item == "driver_license" then
            info.firstname = Player.PlayerData.charinfo.firstname
            info.lastname = Player.PlayerData.charinfo.lastname
            info.birthdate = Player.PlayerData.charinfo.birthdate
            info.type = "A1-A2-A | AM-B | C1-C-CE"
        end
        Player.Functions.AddItem(v.item, 1, false, info)
    end
end

RegisterServerEvent('ctrp-multicharacter:server:deleteCharacter')
AddEventHandler('ctrp-multicharacter:server:deleteCharacter', function(citizenid)
    local src = source
    CTRPFW.Player.DeleteCharacter(src, citizenid)
end)

CTRPFW.Functions.CreateCallback("ctrp-multicharacter:server:GetUserCharacters", function(source, cb)
    local steamId = GetPlayerIdentifier(source, 0)

    exports['ghmattimysql']:execute('SELECT * FROM players WHERE steam = @steam', {['@steam'] = steamId}, function(result)
        cb(result)
    end)
end)

CTRPFW.Functions.CreateCallback("ctrp-multicharacter:server:GetServerLogs", function(source, cb)
    exports['ghmattimysql']:execute('SELECT * FROM server_logs', function(result)
        cb(result)
    end)
end)

CTRPFW.Functions.CreateCallback("test:yeet", function(source, cb)
    local steamId = GetPlayerIdentifiers(source)[1]
    local plyChars = {}
    
    exports['ghmattimysql']:execute('SELECT * FROM players WHERE steam = @steam', {['@steam'] = steamId}, function(result)
        for i = 1, (#result), 1 do
            result[i].charinfo = json.decode(result[i].charinfo)
            result[i].money = json.decode(result[i].money)
            result[i].job = json.decode(result[i].job)

            table.insert(plyChars, result[i])
        end
        cb(plyChars)
    end)
end)

CTRPFW.Commands.Add("char", "Give the character menu to a player", {{name="id", help="Player ID"}}, false, function(source, args)
    CTRPFW.Player.Logout(source)
    TriggerClientEvent('ctrp-multicharacter:client:chooseChar', source)
end, "admin")

CTRPFW.Commands.Add("closeNUI", "Give an item to a player", {{name="id", help="Player ID"},{name="item", help="Name of the item (not label)"}, {name="amount", help="Number of items"}}, false, function(source, args)
    TriggerClientEvent('ctrp-multicharacter:client:closeNUI', source)
end)

CTRPFW.Functions.CreateCallback("ctrp-multicharacter:server:getSkin", function(source, cb, cid)
    local src = source

    CTRPFW.Functions.ExecuteSql(false, "SELECT * FROM `playerskins` WHERE `citizenid` = '"..cid.."' AND `active` = 1", function(result)
        if result[1] ~= nil then
            cb(result[1].model, result[1].skin)
        else
            cb(nil)
        end
    end)
end)

function loadHouseData()
    local HouseGarages = {}
    local Houses = {}
	CTRPFW.Functions.ExecuteSql(false, "SELECT * FROM `houselocations`", function(result)
		if result[1] ~= nil then
			for k, v in pairs(result) do
				local owned = false
				if tonumber(v.owned) == 1 then
					owned = true
				end
				local garage = v.garage ~= nil and json.decode(v.garage) or {}
				Houses[v.name] = {
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
		TriggerClientEvent("ctrp-houses:client:setHouseConfig", -1, Houses)
	end)
end