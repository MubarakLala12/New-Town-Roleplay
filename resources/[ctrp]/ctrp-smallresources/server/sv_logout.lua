CTRPFW = nil
TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)

--Nothing Here--
--VIRUS--

RegisterServerEvent('virus-stations:server:LogoutLocation')
AddEventHandler('virus-stations:server:LogoutLocation', function()
	local src = source
	local Player = CTRPFW.Functions.GetPlayer(src)
	local MyItems = Player.PlayerData.items
	CTRPFW.Functions.ExecuteSql(true, "UPDATE `players` SET `inventory` = '"..CTRPFW.EscapeSqli(json.encode(MyItems)).."' WHERE `citizenid` = '"..Player.PlayerData.citizenid.."'")
	CTRPFW.Player.Logout(src)
    TriggerClientEvent('ctrp-multicharacter:client:chooseChar', src)
end)