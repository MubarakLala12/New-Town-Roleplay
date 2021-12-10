CTRPFW = nil

TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)

CTRPFW.Functions.CreateCallback('virus-tattoos:GetPlayerTattoos', function(source, cb)
	local src = source
	local xPlayer = CTRPFW.Functions.GetPlayer(src)

	if xPlayer then

		CTRPFW.Functions.ExecuteSql(true, "SELECT `tattoos` FROM `players` WHERE `citizenid` = '"..xPlayer.PlayerData.citizenid.."'", function(result)
			if result[1].tattoos then
				cb(json.decode(result[1].tattoos))
			else
				cb()
			end
		end)
	else
		cb()
	end
end)

CTRPFW.Functions.CreateCallback('virus-tattoos:GetPlayerTattoosMC', function(source, cb, citizenid)
	local src = source
	local xPlayer = CTRPFW.Functions.GetPlayer(src)


	CTRPFW.Functions.ExecuteSql(true, "SELECT `tattoos` FROM `players` WHERE `citizenid` = '"..citizenid.."'", function(result)
		if result[1].tattoos then
			cb(json.decode(result[1].tattoos))
		else
			cb()
		end
	end)
end)

CTRPFW.Functions.CreateCallback('virus-tattoos:PurchaseTattoo', function(source, cb, tattooList, price, tattoo, tattooName)
	local src = source
	local xPlayer = CTRPFW.Functions.GetPlayer(src)

	if xPlayer.PlayerData.money.cash >= price then
		xPlayer.Functions.RemoveMoney('cash', price, "tattoo-shop")
		table.insert(tattooList, tattoo)

		CTRPFW.Functions.ExecuteSql(true, "UPDATE `players` SET `tattoos` = '"..json.encode(tattooList).."' WHERE citizenid = '"..xPlayer.PlayerData.citizenid.."'", function(result)
		end)

		TriggerClientEvent('CTRPFW:Notify', src, "You have the tattoo " .. tattooName .. " bought for $" .. price, 'success', 3500)
		cb(true)
	elseif xPlayer.PlayerData.money.bank >= price then
		xPlayer.Functions.RemoveMoney('bank', price, "tattoo-shop")
		table.insert(tattooList, tattoo)

		CTRPFW.Functions.ExecuteSql(true, "UPDATE `players` SET `tattoos` = '"..json.encode(tattooList).."' WHERE citizenid = '"..xPlayer.PlayerData.citizenid.."'", function(result)
		end)

		TriggerClientEvent('CTRPFW:Notify', src, "You have the tattoo " .. tattooName .. " bought for $" .. price, 'success', 3500)
		cb(true)
	else
		TriggerClientEvent('CTRPFW:Notify', src, 'You dont have enough money for this tattoo.', 'error', 3500)
		cb(false)
	end
end)

RegisterServerEvent('virus-tattoos:RemoveTattoo')
AddEventHandler('virus-tattoos:RemoveTattoo', function (tattooList)
	local src = source
	local xPlayer = CTRPFW.Functions.GetPlayer(src)
	CTRPFW.Functions.ExecuteSql(true, "UPDATE `players` SET `tattoos` = '"..json.encode(tattooList).."' WHERE citizenid = '"..xPlayer.PlayerData.citizenid.."'", function(result)
	end)
end)