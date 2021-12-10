-- Player joined
RegisterServerEvent("CTRPFW:PlayerJoined")
AddEventHandler('CTRPFW:PlayerJoined', function()
	local src = source
end)

AddEventHandler('playerDropped', function(reason) 
	local src = source
	print("Dropped: "..GetPlayerName(src))
	TriggerEvent("ctrp-log:server:CreateLog", "joinleave", "Dropped", "red", "**".. GetPlayerName(src) .. "** ("..GetPlayerIdentifiers(src)[1]..") left..")
	TriggerEvent("ctrp-log:server:sendLog", GetPlayerIdentifiers(src)[1], "joined", {})
	if reason ~= "Reconnecting" and src > 60000 then return false end
	if(src==nil or (CTRPFW.Players[src] == nil)) then return false end
	CTRPFW.Players[src].Functions.Save()
	CTRPFW.Players[src] = nil
end)

-- Checking everything before joining
AddEventHandler('playerConnecting', function(playerName, setKickReason, deferrals)
	deferrals.defer()
	local src = source
	deferrals.update("\nChecking name...")
	local name = GetPlayerName(src)
	if name == nil then 
		CTRPFW.Functions.Kick(src, 'Please don\'t use a blank Steam username.', setKickReason, deferrals)
        CancelEvent()
        return false
	end
	if(string.match(name, "[*%%'=`\"]")) then
        CTRPFW.Functions.Kick(src, 'You have a character in your username ('..string.match(name, "[*%%'=`\"]")..') that is not allowed.\nPlease remove this out of your Steam username.', setKickReason, deferrals)
        CancelEvent()
        return false
	end
	if (string.match(name, "drop") or string.match(name, "table") or string.match(name, "database")) then
        CTRPFW.Functions.Kick(src, 'Your username contains a word (drop/table/database) that is not allowed.\nPlease change your Steam username.', setKickReason, deferrals)
        CancelEvent()
        return false
	end
	deferrals.update("\nChecking identifiers...")
    local identifiers = GetPlayerIdentifiers(src)
	local steamid = identifiers[1]
	local license = identifiers[2]
    if (CTRPConfig.IdentifierType == "steam" and (steamid:sub(1,6) == "steam:") == false) then
        CTRPFW.Functions.Kick(src, 'You need to open Steam to play.', setKickReason, deferrals)
        CancelEvent()
		return false
	elseif (CTRPConfig.IdentifierType == "license" and (steamid:sub(1,6) == "license:") == false) then
		CTRPFW.Functions.Kick(src, 'No Social Club license found.', setKickReason, deferrals)
        CancelEvent()
		return false
    end
	deferrals.update("\nChecking ban status...")
    local isBanned, Reason = CTRPFW.Functions.IsPlayerBanned(src)
    if(isBanned) then
        CTRPFW.Functions.Kick(src, Reason, setKickReason, deferrals)
        CancelEvent()
        return false
    end
	deferrals.update("\nChecking whitelist status...")
    if(not CTRPFW.Functions.IsWhitelisted(src)) then
        CTRPFW.Functions.Kick(src, 'You aren\'t whitelisted.', setKickReason, deferrals)
        CancelEvent()
        return false
    end
	deferrals.update("\nChecking server status...")
    if(CTRPFW.Config.Server.closed and not IsPlayerAceAllowed(src, "ctrpadmin.join")) then
		CTRPFW.Functions.Kick(_source, 'the server is closed:\n'..CTRPFW.Config.Server.closedReason, setKickReason, deferrals)
        CancelEvent()
        return false
	end
	TriggerEvent("ctrp-log:server:CreateLog", "joinleave", "Queue", "orange", "**"..name .. "** ("..json.encode(GetPlayerIdentifiers(src))..") in queue..")
	TriggerEvent("ctrp-log:server:sendLog", GetPlayerIdentifiers(src)[1], "left", {})
	TriggerEvent("connectqueue:playerConnect", src, setKickReason, deferrals)
end)

RegisterServerEvent("CTRPFW:server:CloseServer")
AddEventHandler('CTRPFW:server:CloseServer', function(reason)
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)

    if CTRPFW.Functions.HasPermission(source, "admin") or CTRPFW.Functions.HasPermission(source, "god") then 
        local reason = reason ~= nil and reason or "No reason specified..."
        CTRPFW.Config.Server.closed = true
        CTRPFW.Config.Server.closedReason = reason
        TriggerClientEvent("ctrpadmin:client:SetServerStatus", -1, true)
	else
		CTRPFW.Functions.Kick(src, "You don't have permissions for this..", nil, nil)
    end
end)

RegisterServerEvent("CTRPFW:server:OpenServer")
AddEventHandler('CTRPFW:server:OpenServer', function()
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)
    if CTRPFW.Functions.HasPermission(source, "admin") or CTRPFW.Functions.HasPermission(source, "god") then
        CTRPFW.Config.Server.closed = false
        TriggerClientEvent("ctrpadmin:client:SetServerStatus", -1, false)
    else
        CTRPFW.Functions.Kick(src, "You don't have permissions for this..", nil, nil)
    end
end)

RegisterServerEvent("CTRPFW:UpdatePlayer")
AddEventHandler('CTRPFW:UpdatePlayer', function(data)
	local src = source
	local Player = CTRPFW.Functions.GetPlayer(src)
	
	if Player ~= nil then
		Player.PlayerData.position = data.position

		local newHunger = Player.PlayerData.metadata["hunger"] - 4.2
		local newThirst = Player.PlayerData.metadata["thirst"] - 3.8
		if newHunger <= 0 then newHunger = 0 end
		if newThirst <= 0 then newThirst = 0 end
		Player.Functions.SetMetaData("thirst", newThirst)
		Player.Functions.SetMetaData("hunger", newHunger)

		Player.Functions.AddMoney("bank", Player.PlayerData.job.payment)
		TriggerClientEvent('CTRPFW:Notify', src, "You received your paycheck of $"..Player.PlayerData.job.payment)
		TriggerClientEvent("hud:client:UpdateNeeds", src, newHunger, newThirst)

		Player.Functions.Save()
	end
end)

RegisterServerEvent("CTRPFW:UpdatePlayerPosition")
AddEventHandler("CTRPFW:UpdatePlayerPosition", function(position)
	local src = source
	local Player = CTRPFW.Functions.GetPlayer(src)
	if Player ~= nil then
		Player.PlayerData.position = position
	end
end)

RegisterServerEvent("CTRPFW:Server:TriggerCallback")
AddEventHandler('CTRPFW:Server:TriggerCallback', function(name, ...)
	local src = source
	CTRPFW.Functions.TriggerCallback(name, src, function(...)
		TriggerClientEvent("CTRPFW:Client:TriggerCallback", src, name, ...)
	end, ...)
end)

RegisterServerEvent("CTRPFW:Server:UseItem")
AddEventHandler('CTRPFW:Server:UseItem', function(item)
	local src = source
	local Player = CTRPFW.Functions.GetPlayer(src)
	if item ~= nil and item.amount > 0 then
		if CTRPFW.Functions.CanUseItem(item.name) then
			CTRPFW.Functions.UseItem(src, item)
		end
	end
end)

RegisterServerEvent("CTRPFW:Server:RemoveItem")
AddEventHandler('CTRPFW:Server:RemoveItem', function(itemName, amount, slot)
	local src = source
	local Player = CTRPFW.Functions.GetPlayer(src)
	Player.Functions.RemoveItem(itemName, amount, slot)
end)

RegisterServerEvent("CTRPFW:Server:AddItem")
AddEventHandler('CTRPFW:Server:AddItem', function(itemName, amount, slot, info)
	local src = source
	local Player = CTRPFW.Functions.GetPlayer(src)
	Player.Functions.AddItem(itemName, amount, slot, info)
end)

RegisterServerEvent('CTRPFW:Server:SetMetaData')
AddEventHandler('CTRPFW:Server:SetMetaData', function(meta, data)
    local src = source
	local Player = CTRPFW.Functions.GetPlayer(src)
	if meta == "hunger" or meta == "thirst" then
		if data > 100 then
			data = 100
		end
	end
	if Player ~= nil then 
		Player.Functions.SetMetaData(meta, data)
	end
	TriggerClientEvent("hud:client:UpdateNeeds", src, Player.PlayerData.metadata["hunger"], Player.PlayerData.metadata["thirst"])
end)

AddEventHandler('chatMessage', function(source, n, message)
	if string.sub(message, 1, 1) == "/" then
		local args = CTRPFW.Shared.SplitStr(message, " ")
		local command = string.gsub(args[1]:lower(), "/", "")
		CancelEvent()
		if CTRPFW.Commands.List[command] ~= nil then
			local Player = CTRPFW.Functions.GetPlayer(tonumber(source))
			if Player ~= nil then
				table.remove(args, 1)
				if (CTRPFW.Functions.HasPermission(source, "god") or CTRPFW.Functions.HasPermission(source, CTRPFW.Commands.List[command].permission)) then
					if (CTRPFW.Commands.List[command].argsrequired and #CTRPFW.Commands.List[command].arguments ~= 0 and args[#CTRPFW.Commands.List[command].arguments] == nil) then
					    TriggerClientEvent('chatMessage', source, "SYSTEM", "error", "All arguments must be filled out!")
					    local agus = ""
					    for name, help in pairs(CTRPFW.Commands.List[command].arguments) do
					    	agus = agus .. " ["..help.name.."]"
					    end
				        TriggerClientEvent('chatMessage', source, "/"..command, false, agus)
					else
						CTRPFW.Commands.List[command].callback(source, args)
					end
				else
					TriggerClientEvent('chatMessage', source, "SYSTEM", "error", "No access to this command!")
				end
			end
		end
	end
end)

RegisterServerEvent('CTRPFW:CallCommand')
AddEventHandler('CTRPFW:CallCommand', function(command, args)
	if CTRPFW.Commands.List[command] ~= nil then
		local Player = CTRPFW.Functions.GetPlayer(tonumber(source))
		if Player ~= nil then
			if (CTRPFW.Functions.HasPermission(source, "god")) or (CTRPFW.Functions.HasPermission(source, CTRPFW.Commands.List[command].permission)) or (CTRPFW.Commands.List[command].permission == Player.PlayerData.job.name) then
				if (CTRPFW.Commands.List[command].argsrequired and #CTRPFW.Commands.List[command].arguments ~= 0 and args[#CTRPFW.Commands.List[command].arguments] == nil) then
					TriggerClientEvent('chatMessage', source, "SYSTEM", "error", "All arguments must be filled out!")
					local agus = ""
					for name, help in pairs(CTRPFW.Commands.List[command].arguments) do
						agus = agus .. " ["..help.name.."]"
					end
					TriggerClientEvent('chatMessage', source, "/"..command, false, agus)
				else
					CTRPFW.Commands.List[command].callback(source, args)
				end
			else
				TriggerClientEvent('chatMessage', source, "SYSTEM", "error", "No access to this command!")
			end
		end
	end
end)

RegisterServerEvent("CTRPFW:AddCommand")
AddEventHandler('CTRPFW:AddCommand', function(name, help, arguments, argsrequired, callback, persmission)
	CTRPFW.Commands.Add(name, help, arguments, argsrequired, callback, persmission)
end)

RegisterServerEvent("CTRPFW:ToggleDuty")
AddEventHandler('CTRPFW:ToggleDuty', function()
	local src = source
	local Player = CTRPFW.Functions.GetPlayer(src)
	if Player.PlayerData.job.onduty then
		Player.Functions.SetJobDuty(false)
		TriggerClientEvent('CTRPFW:Notify', src, "You are now off duty!")
	else
		Player.Functions.SetJobDuty(true)
		TriggerClientEvent('CTRPFW:Notify', src, "You are now on duty!")
	end
	TriggerClientEvent("CTRPFW:Client:SetDuty", src, Player.PlayerData.job.onduty)
end)

RegisterServerEvent("CTRPFW:GotoOffDuty")
AddEventHandler('CTRPFW:GotoOffDuty', function()
	local src = source
	local Player = CTRPFW.Functions.GetPlayer(src)
	if Player.PlayerData.job.onduty then
		Player.Functions.SetJobDuty(false)
	end
	TriggerClientEvent("CTRPFW:Client:SetDuty", src, Player.PlayerData.job.onduty)
end)

Citizen.CreateThread(function()
	CTRPFW.Functions.ExecuteSql(true, "SELECT * FROM `permissions`", function(result)
		if result[1] ~= nil then
			for k, v in pairs(result) do
				CTRPFW.Config.Server.PermissionList[v.steam] = {
					steam = v.steam,
					license = v.license,
					permission = v.permission,
					optin = true,
				}
			end
		end
	end)
end)

CTRPFW.Functions.CreateCallback('CTRPFW:HasItem', function(source, cb, itemName)
	local retval = false
	local Player = CTRPFW.Functions.GetPlayer(source)
	if Player ~= nil then 
		if Player.Functions.GetItemByName(itemName) ~= nil then
			retval = true
		end
	end
	
	cb(retval)
end)	

RegisterServerEvent('CTRPFW:Command:CheckOwnedVehicle')
AddEventHandler('CTRPFW:Command:CheckOwnedVehicle', function(VehiclePlate)
	if VehiclePlate ~= nil then
		CTRPFW.Functions.ExecuteSql(false, "SELECT * FROM `player_vehicles` WHERE `plate` = '"..VehiclePlate.."'", function(result)
			if result[1] ~= nil then
				CTRPFW.Functions.ExecuteSql(false, "UPDATE `player_vehicles` SET `state` = '1' WHERE `citizenid` = '"..result[1].citizenid.."'")
				TriggerEvent('ctrp-garages:server:RemoveVehicle', result[1].citizenid, VehiclePlate)
			end
		end)
	end
end)