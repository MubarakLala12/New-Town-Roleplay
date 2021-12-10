CTRPFW = nil

TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)



RegisterNetEvent('virus-drivingschool:PayVirus')
AddEventHandler('virus-drivingschool:PayVirus', function()
	local src = source
    local xPlayer = CTRPFW.Functions.GetPlayer(src)
	local bankamount = xPlayer.PlayerData.money["bank"]
	local ghuu = 500

	if bankamount >= ghuu then
		xPlayer.Functions.RemoveMoney('bank', 500)
	end
end)



RegisterServerEvent('virus-drivingschool:server:GetLicense')
AddEventHandler('virus-drivingschool:server:GetLicense', function()
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)


    local info = {}
        info.firstname = Player.PlayerData.charinfo.firstname
        info.lastname = Player.PlayerData.charinfo.lastname
        info.birthdate = Player.PlayerData.charinfo.birthdate
        info.type = "A1-A2-A | AM-B | C1-C-CE"


    Player.Functions.AddItem('driver_license', 1, nil, info)

    TriggerClientEvent('inventory:client:ItemBox', src, CTRPFW.Shared.Items['driver_license'], 'add')
end)

