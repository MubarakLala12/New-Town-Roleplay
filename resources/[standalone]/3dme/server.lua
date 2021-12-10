CTRPFW = nil

TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)

CTRPFW.Commands.Add("me", "Character interactions", {}, false, function(source, args)
	local text = table.concat(args, ' ')
	local Player = CTRPFW.Functions.GetPlayer(source)
	local coords = GetEntityCoords(GetPlayerPed(source))
    -- TriggerClientEvent('3dme:triggerDisplay', -1, text, source)
    TriggerClientEvent('3dme:triggerDisplay', -1, text, source, coords)
    TriggerEvent("ctrp-log:server:CreateLog", "me", "Me", "white", "**"..GetPlayerName(source).."** (CitizenID: "..Player.PlayerData.citizenid.." | ID: "..source..")** " ..Player.PlayerData.charinfo.firstname.." "..Player.PlayerData.charinfo.lastname.. " **" ..text, false)
end)

CTRPFW.Commands.Add("number", "Flash Number", {}, false, function(source)
	local Player = CTRPFW.Functions.GetPlayer(source)
	local text = Player.PlayerData.charinfo.phone
	local coords = GetEntityCoords(GetPlayerPed(source))
    -- TriggerClientEvent('3dme:triggerDisplay', -1, text, source)
    TriggerClientEvent('3dme:triggerDisplay', -1, text, source, coords)
    TriggerEvent("ctrp-log:server:CreateLog", "me", "Me", "white", "**"..GetPlayerName(source).."** (CitizenID: "..Player.PlayerData.citizenid.." | ID: "..source..")** " ..Player.PlayerData.charinfo.firstname.." "..Player.PlayerData.charinfo.lastname.. " **" ..text, false)
end)