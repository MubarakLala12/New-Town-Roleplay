CTRPFW.Commands = {}
CTRPFW.Commands.List = {}

CTRPFW.Commands.Add = function(name, help, arguments, argsrequired, callback, permission) -- [name] = command name (ex. /givemoney), [help] = help text, [arguments] = arguments that need to be passed (ex. {{name="id", help="ID of a player"}, {name="amount", help="amount of money"}}), [argsrequired] = set arguments required (true or false), [callback] = function(source, args) callback, [permission] = rank or job of a player
	CTRPFW.Commands.List[name:lower()] = {
		name = name:lower(),
		permission = permission ~= nil and permission:lower() or "user",
		help = help,
		arguments = arguments,
		argsrequired = argsrequired,
		callback = callback,
	}
end

CTRPFW.Commands.Refresh = function(source)
	local Player = CTRPFW.Functions.GetPlayer(tonumber(source))
	if Player ~= nil then
		for command, info in pairs(CTRPFW.Commands.List) do
			if CTRPFW.Functions.HasPermission(source, "god") or CTRPFW.Functions.HasPermission(source, CTRPFW.Commands.List[command].permission) then
				TriggerClientEvent('chat:addSuggestion', source, "/"..command, info.help, info.arguments)
			end
		end
	end
end

CTRPFW.Commands.Add("tp", "Teleport to a player or location", {{name="id/x", help="ID of player or X position"}, {name="y", help="Y position"}, {name="z", help="Z position"}}, false, function(source, args)
	if (args[1] ~= nil and (args[2] == nil and args[3] == nil)) then
		-- tp to player
		local Player = CTRPFW.Functions.GetPlayer(tonumber(args[1]))
		if Player ~= nil then
			TriggerClientEvent('CTRPFW:Command:TeleportToPlayer', source, Player.PlayerData.source)
		else
			TriggerClientEvent('chatMessage', source, "SYSTEM", "error", "Player is not online!")
		end
	else
		-- tp to location
		if args[1] ~= nil and args[2] ~= nil and args[3] ~= nil then
			local x = tonumber(args[1])
			local y = tonumber(args[2])
			local z = tonumber(args[3])
			TriggerClientEvent('CTRPFW:Command:TeleportToCoords', source, x, y, z)
		else
			TriggerClientEvent('chatMessage', source, "SYSTEM", "error", "Not every argument has been entered (x, y, z)")
		end
	end
end, "admin")

CTRPFW.Commands.Add("addpermission", "Grant permissions to someone (god/admin)", {{name="id", help="ID of player"}, {name="permission", help="Permission level"}}, true, function(source, args)
	local Player = CTRPFW.Functions.GetPlayer(tonumber(args[1]))
	local permission = tostring(args[2]):lower()
	if Player ~= nil then
		CTRPFW.Functions.AddPermission(Player.PlayerData.source, permission)
	else
		TriggerClientEvent('chatMessage', source, "SYSTEM", "error", "Player is not online!")
	end
end, "god")

CTRPFW.Commands.Add("removepermission", "Remove permissions from someone", {{name="id", help="ID of player"}}, true, function(source, args)
	local Player = CTRPFW.Functions.GetPlayer(tonumber(args[1]))
	if Player ~= nil then
		CTRPFW.Functions.RemovePermission(Player.PlayerData.source)
	else
		TriggerClientEvent('chatMessage', source, "SYSTEM", "error", "Player is not online!")
	end
end, "god")

CTRPFW.Commands.Add("sv", "Spawn a vehicle", {{name="model", help="Model name of the vehicle"}}, true, function(source, args)
	TriggerClientEvent('CTRPFW:Command:SpawnVehicle', source, args[1])
end, "god")

CTRPFW.Commands.Add("debug", "Turn debug mode on / off", {}, false, function(source, args)
	TriggerClientEvent('koil-debug:toggle', source)
end, "admin")

CTRPFW.Commands.Add("dv", "Despawn a vehicle", {}, false, function(source, args)
	TriggerClientEvent('CTRPFW:Command:DeleteVehicle', source)
end, "admin")

CTRPFW.Commands.Add("tpm", "Teleport to your waypoint", {}, false, function(source, args)
	TriggerClientEvent('CTRPFW:Command:GoToMarker', source)
end, "admin")

CTRPFW.Commands.Add("givemoney", "Give money to a player", {{name="id", help="Player ID"},{name="moneytype", help="Type of money (cash, bank, crypto)"}, {name="amount", help="Amount of money"}}, true, function(source, args)
	local Player = CTRPFW.Functions.GetPlayer(tonumber(args[1]))
	if Player ~= nil then
		Player.Functions.AddMoney(tostring(args[2]), tonumber(args[3]))
	else
		TriggerClientEvent('chatMessage', source, "SYSTEM", "error", "Player is not online!")
	end
end, "god")

CTRPFW.Commands.Add("setmoney", "set a players money amount", {{name="id", help="Player ID"},{name="moneytype", help="Type of money (cash, bank, crypto)"}, {name="amount", help="Amount of money"}}, true, function(source, args)
	local Player = CTRPFW.Functions.GetPlayer(tonumber(args[1]))
	if Player ~= nil then
		Player.Functions.SetMoney(tostring(args[2]), tonumber(args[3]))
	else
		TriggerClientEvent('chatMessage', source, "SYSTEM", "error", "Player is not online!")
	end
end, "god")

CTRPFW.Commands.Add("setjob", "Assign a job to a player", {{name="id", help="Player ID"}, {name="job", help="Job name"}, {name="grade", help="level"}}, true, function(source, args)
	local Player = CTRPFW.Functions.GetPlayer(tonumber(args[1]))
	if Player ~= nil then
		Player.Functions.SetJob(tostring(args[2]), tonumber(args[3]))
	else
		TriggerClientEvent('chatMessage', source, "Console", "error", "Player is not online!")
	end
end, "admin")

CTRPFW.Commands.Add("job", "See what job you have", {}, false, function(source, args)
	local Player = CTRPFW.Functions.GetPlayer(source)
	TriggerClientEvent('chatMessage', source, "Console", "warning", "Job: "..Player.PlayerData.job.label.." - "..Player.PlayerData.job.gradelabel)
end)

CTRPFW.Commands.Add("companies", "See companies and stocks", {}, false, function(source, args)
	local Player = CTRPFW.Functions.GetPlayer(source)
	TriggerClientEvent('chatMessage', source, "SYSTEM", "warning", "Currently under development!")
end)

CTRPFW.Commands.Add("setgang", "Assign a player to a gang", {{name="id", help="Player ID"}, {name="job", help="Name of a gang"}}, true, function(source, args)
	local Player = CTRPFW.Functions.GetPlayer(tonumber(args[1]))
	if Player ~= nil then
		Player.Functions.SetGang(tostring(args[2]))
	else
		TriggerClientEvent('chatMessage', source, "SYSTEM", "error", "Player is not online!")
	end
end, "admin")

CTRPFW.Commands.Add("gang", "See what gang you're in", {}, false, function(source, args)
	local Player = CTRPFW.Functions.GetPlayer(source)

	if Player.PlayerData.gang.name ~= "geen" then
		TriggerClientEvent('chatMessage', source, "SYSTEM", "warning", "Gang: "..Player.PlayerData.gang.label)
	else
		TriggerClientEvent('CTRPFW:Notify', source, "You're not in a gang!", "error")
	end
end)

CTRPFW.Commands.Add("testnotify", "test notify", {{name="text", help="Text and stuff"}}, true, function(source, args)
	TriggerClientEvent('CTRPFW:Notify', source, table.concat(args, " "), "success")
end, "god")

CTRPFW.Commands.Add("clearinv", "Clear the inventory of a player", {{name="id", help="Player ID"}}, false, function(source, args)
	local playerId = args[1] ~= nil and args[1] or source
	local Player = CTRPFW.Functions.GetPlayer(tonumber(playerId))
	if Player ~= nil then
		Player.Functions.ClearInventory()
	else
		TriggerClientEvent('chatMessage', source, "SYSTEM", "error", "Player is not online!")
	end
end, "admin")

--[[CTRPFW.Commands.Add("ooc", "Out of Character message", {}, false, function(source, args)
	local message = table.concat(args, " ")
	TriggerClientEvent("CTRPFW:Client:LocalOutOfCharacter", -1, source, GetPlayerName(source), message)
	local Players = CTRPFW.Functions.GetPlayers()
	local Player = CTRPFW.Functions.GetPlayer(source)

	for k, v in pairs(CTRPFW.Functions.GetPlayers()) do
		if CTRPFW.Functions.HasPermission(v, "admin") then
			if CTRPFW.Functions.IsOptin(v) then
				TriggerClientEvent('chatMessage', v, "OOC " .. GetPlayerName(source), "normal", message)
				TriggerEvent("ctrp-log:server:CreateLog", "ooc", "OOC", "white", "**"..GetPlayerName(source).."** (CitizenID: "..Player.PlayerData.citizenid.." | ID: "..source..") **Message:** " ..message, false)
			end
		end
	end
end)]]

CTRPFW.Commands.Add("ooc", "Out of Character message", {}, false, function(source, args)
	local message = table.concat(args, " ")
	TriggerClientEvent("CTRPFW:Client:OutOfCharacter", -1, source, GetPlayerName(source), message)
	local Players = CTRPFW.Functions.GetPlayers()
	local Player = CTRPFW.Functions.GetPlayer(source)

	for k, v in pairs(CTRPFW.Functions.GetPlayers()) do
		if CTRPFW.Functions.HasPermission(v, "admin") then
			if CTRPFW.Functions.IsOptin(v) then
				TriggerEvent("ctrp-log:server:CreateLog", "ooc", "OOC", "blue", "**"..GetPlayerName(source).."** (CitizenID: "..Player.PlayerData.citizenid.." | ID: "..source..") **Message:** " ..message, false)
			end
		end
	end
end)

CTRPFW.Commands.Add("localooc", "Out of Character message", {}, false, function(source, args)
	local message = table.concat(args, " ")
	TriggerClientEvent("CTRPFW:Client:LocalOutOfCharacter", -1, source, GetPlayerName(source), message)
	local Players = CTRPFW.Functions.GetPlayers()
	local Player = CTRPFW.Functions.GetPlayer(source)

	for k, v in pairs(CTRPFW.Functions.GetPlayers()) do
		if CTRPFW.Functions.HasPermission(v, "admin") then
			if CTRPFW.Functions.IsOptin(v) then
				TriggerClientEvent('chatMessage', v, "OOC LOCAL(Notif)" .. GetPlayerName(source), "normal", message)
				TriggerEvent("ctrp-log:server:CreateLog", "ooc", "OOC Local", "green", "**"..GetPlayerName(source).."** (CitizenID: "..Player.PlayerData.citizenid.." | ID: "..source..") **Message:** " ..message, false)
			end
		end
	end
end)

