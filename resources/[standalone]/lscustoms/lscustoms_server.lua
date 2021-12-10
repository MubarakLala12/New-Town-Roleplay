CTRPFW = nil
TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)

RegisterServerEvent('lscustoms:server:setGarageBusy')
AddEventHandler('lscustoms:server:setGarageBusy', function(garage, busy)
	TriggerClientEvent('lscustoms:server:setGarageBusy', -1, garage, busy)
end)

RegisterServerEvent("LSC:buttonSelected")
AddEventHandler("LSC:buttonSelected", function(name, button)
	local src = source
	local Player = CTRPFW.Functions.GetPlayer(src)
	local bankBalance = Player.PlayerData.money["bank"]
	if not button.purchased then
		if button.price then -- check if button have price
			if Player.Functions.RemoveMoney("cash", button.price, "lscustoms-bought") then
				TriggerClientEvent("LSC:buttonSelected", source, name, button, true)
				TriggerEvent("ctrp-log:server:sendLog", Player.PlayerData.citizenid, "vehicleupgraded", {name=name, moneyType="cash", price=button.price, plate="unkown"})
				TriggerEvent("ctrp-log:server:CreateLog", "vehicleupgrades", "Upgrade bought", "green", "**"..GetPlayerName(src).."** has bought an upgrade ("..name..") for $" .. button.price)
			elseif bankBalance >= button.price then
				Player.Functions.RemoveMoney("bank", button.price, "lscustoms-bought")
				TriggerClientEvent("LSC:buttonSelected", source, name, button, true)
				TriggerEvent("ctrp-log:server:sendLog", Player.PlayerData.citizenid, "vehicleupgraded", {name=name, moneyType="bank", price=button.price, plate="unkown"})
				TriggerEvent("ctrp-log:server:CreateLog", "vehicleupgrades", "Upgrade bought", "green", "**"..GetPlayerName(src).."** has bought an upgrade ("..name..") for $" .. button.price)
			else
				TriggerClientEvent("LSC:buttonSelected", source, name, button, false)
			end
		end
	else
		TriggerClientEvent("LSC:buttonSelected", source, name, button, false)
	end
end)

RegisterServerEvent("lscustoms:server:SaveVehicleProps")
AddEventHandler("lscustoms:server:SaveVehicleProps", function(vehicleProps)
	local src = source
    if IsVehicleOwned(vehicleProps.plate) then
        CTRPFW.Functions.ExecuteSql(false, "UPDATE `player_vehicles` SET `mods` = '"..json.encode(vehicleProps).."' WHERE `plate` = '"..vehicleProps.plate.."'")
    end
end)

function IsVehicleOwned(plate)
    local retval = false
    CTRPFW.Functions.ExecuteSql(true, "SELECT * FROM `player_vehicles` WHERE `plate` = '"..plate.."'", function(result)
        if result[1] ~= nil then
            retval = true
        end
    end)
    return retval
end

CTRPFW.Commands.Add("livery", "Livery", {{name="livery", help="Nummer van de livery"}}, true, function(source, args)
	TriggerClientEvent('lscustoms:SetLivery', source, tonumber(args[1]))
end, "admin")
