CTRPFW.Functions = {}

CTRPFW.Functions.ExecuteSql = function(wait, query, cb)
	local rtndata = {}
	local waiting = true
	exports['ghmattimysql']:execute(query, {}, function(data)
		if cb ~= nil and wait == false then
			cb(data)
		end
		rtndata = data
		waiting = false
	end)
	if wait then
		while waiting do
			Citizen.Wait(5)
		end
		if cb ~= nil and wait == true then
			cb(rtndata)
		end
	end
	return rtndata
end

CTRPFW.Functions.GetIdentifier = function(source, idtype)
	local idtype = idtype ~=nil and idtype or CTRPConfig.IdentifierType
	for _, identifier in pairs(GetPlayerIdentifiers(source)) do
		if string.find(identifier, idtype) then
			return identifier
		end
	end
	return nil
end

CTRPFW.Functions.GetSource = function(identifier)
	for src, player in pairs(CTRPFW.Players) do
		local idens = GetPlayerIdentifiers(src)
		for _, id in pairs(idens) do
			if identifier == id then
				return src
			end
		end
	end
	return 0
end

CTRPFW.Functions.GetPlayer = function(source)
	if type(source) == "number" then
		return CTRPFW.Players[source]
	else
		return CTRPFW.Players[CTRPFW.Functions.GetSource(source)]
	end
end

CTRPFW.Functions.GetPlayerByCitizenId = function(citizenid)
	for src, player in pairs(CTRPFW.Players) do
		local cid = citizenid
		if CTRPFW.Players[src].PlayerData.citizenid == cid then
			return CTRPFW.Players[src]
		end
	end
	return nil
end

CTRPFW.Functions.GetPlayerByPhone = function(number)
	for src, player in pairs(CTRPFW.Players) do
		local cid = citizenid
		if CTRPFW.Players[src].PlayerData.charinfo.phone == number then
			return CTRPFW.Players[src]
		end
	end
	return nil
end

CTRPFW.Functions.GetPlayers = function()
	local sources = {}
	for k, v in pairs(CTRPFW.Players) do
		table.insert(sources, k)
	end
	return sources
end

CTRPFW.Functions.CreateCallback = function(name, cb)
	CTRPFW.ServerCallbacks[name] = cb
end

CTRPFW.Functions.TriggerCallback = function(name, source, cb, ...)
	if CTRPFW.ServerCallbacks[name] ~= nil then
		CTRPFW.ServerCallbacks[name](source, cb, ...)
	end
end

CTRPFW.Functions.CreateUseableItem = function(item, cb)
	CTRPFW.UseableItems[item] = cb
end

CTRPFW.Functions.CanUseItem = function(item)
	return CTRPFW.UseableItems[item] ~= nil
end

CTRPFW.Functions.UseItem = function(source, item)
	CTRPFW.UseableItems[item.name](source, item)
end

CTRPFW.Functions.Kick = function(source, reason, setKickReason, deferrals)
	local src = source
	reason = "\n"..reason.."\n🔸 Check our Discord for further information: "..CTRPFW.Config.Server.discord
	if(setKickReason ~=nil) then
		setKickReason(reason)
	end
	Citizen.CreateThread(function()
		if(deferrals ~= nil)then
			deferrals.update(reason)
			Citizen.Wait(2500)
		end
		if src ~= nil then
			DropPlayer(src, reason)
		end
		local i = 0
		while (i <= 4) do
			i = i + 1
			while true do
				if src ~= nil then
					if(GetPlayerPing(src) >= 0) then
						break
					end
					Citizen.Wait(100)
					Citizen.CreateThread(function() 
						DropPlayer(src, reason)
					end)
				end
			end
			Citizen.Wait(5000)
		end
	end)
end

CTRPFW.Functions.IsWhitelisted = function(source)
	local identifiers = GetPlayerIdentifiers(source)
	local rtn = false
	if (CTRPFW.Config.Server.whitelist) then
		CTRPFW.Functions.ExecuteSql(true, "SELECT * FROM `whitelist` WHERE `"..CTRPFW.Config.IdentifierType.."` = '".. CTRPFW.Functions.GetIdentifier(source).."'", function(result)
			local data = result[1]
			if data ~= nil then
				for _, id in pairs(identifiers) do
					if data.steam == id or data.license == id then
						rtn = true
					end
				end
			end
		end)
	else
		rtn = true
	end
	return rtn
end

CTRPFW.Functions.AddPermission = function(source, permission)
	local Player = CTRPFW.Functions.GetPlayer(source)
	if Player ~= nil then 
		CTRPFW.Config.Server.PermissionList[GetPlayerIdentifiers(source)[1]] = {
			steam = GetPlayerIdentifiers(source)[1],
			license = GetPlayerIdentifiers(source)[2],
			permission = permission:lower(),
		}
		CTRPFW.Functions.ExecuteSql(true, "DELETE FROM `permissions` WHERE `steam` = '"..GetPlayerIdentifiers(source)[1].."'")
		CTRPFW.Functions.ExecuteSql(true, "INSERT INTO `permissions` (`name`, `steam`, `license`, `permission`) VALUES ('"..GetPlayerName(source).."', '"..GetPlayerIdentifiers(source)[1].."', '"..GetPlayerIdentifiers(source)[2].."', '"..permission:lower().."')")
		Player.Functions.UpdatePlayerData()
		TriggerClientEvent('CTRPFW:Client:OnPermissionUpdate', source, permission)
	end
end

CTRPFW.Functions.RemovePermission = function(source)
	local Player = CTRPFW.Functions.GetPlayer(source)
	if Player ~= nil then 
		CTRPFW.Config.Server.PermissionList[GetPlayerIdentifiers(source)[1]] = nil	
		CTRPFW.Functions.ExecuteSql(true, "DELETE FROM `permissions` WHERE `steam` = '"..GetPlayerIdentifiers(source)[1].."'")
		Player.Functions.UpdatePlayerData()
	end
end

CTRPFW.Functions.HasPermission = function(source, permission)
	local retval = false
	local steamid = GetPlayerIdentifiers(source)[1]
	local licenseid = GetPlayerIdentifiers(source)[2]
	local permission = tostring(permission:lower())
	if permission == "user" then
		retval = true
	else
		if CTRPFW.Config.Server.PermissionList[steamid] ~= nil then 
			if CTRPFW.Config.Server.PermissionList[steamid].steam == steamid and CTRPFW.Config.Server.PermissionList[steamid].license == licenseid then
				if CTRPFW.Config.Server.PermissionList[steamid].permission == permission or CTRPFW.Config.Server.PermissionList[steamid].permission == "god" then
					retval = true
				end
			end
		end
	end
	return retval
end

CTRPFW.Functions.GetPermission = function(source)
	local retval = "user"
	Player = CTRPFW.Functions.GetPlayer(source)
	local steamid = GetPlayerIdentifiers(source)[1]
	local licenseid = GetPlayerIdentifiers(source)[2]
	if Player ~= nil then
		if CTRPFW.Config.Server.PermissionList[Player.PlayerData.steam] ~= nil then 
			if CTRPFW.Config.Server.PermissionList[Player.PlayerData.steam].steam == steamid and CTRPFW.Config.Server.PermissionList[Player.PlayerData.steam].license == licenseid then
				retval = CTRPFW.Config.Server.PermissionList[Player.PlayerData.steam].permission
			end
		end
	end
	return retval
end

CTRPFW.Functions.IsOptin = function(source)
	local retval = false
	local steamid = GetPlayerIdentifiers(source)[1]
	if CTRPFW.Functions.HasPermission(source, "admin") then
		retval = CTRPFW.Config.Server.PermissionList[steamid].optin
	end
	return retval
end

CTRPFW.Functions.ToggleOptin = function(source)
	local steamid = GetPlayerIdentifiers(source)[1]
	if CTRPFW.Functions.HasPermission(source, "admin") then
		CTRPFW.Config.Server.PermissionList[steamid].optin = not CTRPFW.Config.Server.PermissionList[steamid].optin
	end
end

CTRPFW.Functions.IsPlayerBanned = function (source)
	local retval = false
	local message = ""
	CTRPFW.Functions.ExecuteSql(true, "SELECT * FROM `bans` WHERE `steam` = '"..GetPlayerIdentifiers(source)[1].."' OR `license` = '"..GetPlayerIdentifiers(source)[2].."' OR `ip` = '"..GetPlayerIdentifiers(source)[3].."'", function(result)
		if result[1] ~= nil then 
			if os.time() < result[1].expire then
				retval = true
				local timeTable = os.date("*t", tonumber(result[1].expire))
				message = "You have been banned from the server:\n"..result[1].reason.."\nYour ban expires "..timeTable.day.. "/" .. timeTable.month .. "/" .. timeTable.year .. " " .. timeTable.hour.. ":" .. timeTable.min .. "\n"
			else
				CTRPFW.Functions.ExecuteSql(true, "DELETE FROM `bans` WHERE `id` = "..result[1].id)
			end
		end
	end)
	return retval, message
end

