CTRPFW = nil

TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)

RegisterServerEvent('ctrp-testdrive.requestInfo')
AddEventHandler('ctrp-testdrive.requestInfo', function()
    local src = source
    local xPlayer = CTRPFW.Functions.GetPlayer(src)
    local rows    

    TriggerClientEvent('ctrp-testdrive.receiveInfo', src, xPlayer.PlayerData.money['bank'], xPlayer.PlayerData.firstname)
    --TriggerClientEvent("ctrp-testdrive.notify", src, 'error', 'Use A and D To Rotate')
    TriggerClientEvent("CTRPFW:Notify", src, "Use A and D To Rotate", "error", 5000)
end)

CTRPFW.Functions.CreateCallback('ctrp-testdrive.isPlateTaken', function (source, cb, plate)
    CTRPFW.Functions.ExecuteSql(true, "SELECT * FROM `player_vehicles` WHERE `plate` = '"..plate.."'", function(result)
        cb(result[1] ~= nil)
    end)
end)

RegisterServerEvent('ctrp-testdrive.CheckMoneyForVeh')
AddEventHandler('ctrp-testdrive.CheckMoneyForVeh', function(veh, price, name, vehicleProps)
    local src = source
    local xPlayer = CTRPFW.Functions.GetPlayer(src)

    if xPlayer.PlayerData.money['bank'] >= tonumber(price) then
        xPlayer.Functions.RemoveMoney('bank', tonumber(price))
        local vehiclePropsjson = json.encode(vehicleProps)
        if Config.SpawnVehicle then
            stateVehicle = 0
        else
            stateVehicle = 1
        end

        CTRPFW.Functions.ExecuteSql(false, "INSERT INTO `player_vehicles` (`steam`, `citizenid`, `vehicle`, `hash`, `mods`, `plate`, `state`) VALUES ('"..xPlayer.PlayerData.steam.."', '"..xPlayer.PlayerData.citizenid.."', '"..veh.."', '"..GetHashKey(veh).."', '"..vehiclePropsjson.."', '"..vehicleProps.plate.."', '"..stateVehicle.."')")
        TriggerClientEvent("ctrp-testdrive.successfulbuy", source, name, vehicleProps.plate, price)
        TriggerClientEvent('ctrp-testdrive.receiveInfo', source, xPlayer.PlayerData.money['bank'])    
        TriggerClientEvent('ctrp-testdrive.spawnVehicle', source, veh, vehicleProps.plate)
    else
        --TriggerClientEvent("ctrp-testdrive.notify", source, 'error', 'Not Enough Money')
        TriggerClientEvent("CTRPFW:Notify", source, "Not Enough Money", "error", 5000)
    end
end)

RegisterServerEvent('ctrp-testdrive.CheckMoneyForTest')
AddEventHandler('ctrp-testdrive.CheckMoneyForTest', function()
    local src = source
    local xPlayer = CTRPFW.Functions.GetPlayer(src)
    local price = tonumber(50)

    if xPlayer.PlayerData.money['bank'] >= price then
        --xPlayer.Functions.RemoveMoney('bank', tonumber(price))

        TriggerClientEvent('ctrp-moneysafe:client:DepositMoney', source , price)
    else
        TriggerClientEvent("ctrp-testdrive.notify", source, 'error', 'Not Enough Money')
    end
end)


CTRPFW.Functions.CreateCallback('ctrp-testdrive.ghuu', function(source, cb)
    local src = source
    local Ply = CTRPFW.Functions.GetPlayer(src)
	local poo = 50
    local paisamc = Ply.PlayerData.money['bank']

    if paisamc >= poo then
        cb(true)
    else
        cb(false)
    end
end)