-- CTRPFW = nil

-- TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)

local OutsideVehicles = {}

-- code

RegisterServerEvent('ctrp-garages:server:RemoveVehicle')
AddEventHandler('ctrp-garages:server:RemoveVehicle', function(CitizenId, Plate)
    if OutsideVehicles[CitizenId] ~= nil then
        OutsideVehicles[CitizenId][Plate] = nil
    end
end)

RegisterServerEvent('ctrp-garages:server:UpdateOutsideVehicles')
AddEventHandler('ctrp-garages:server:UpdateOutsideVehicles', function(Vehicles)
    local src = source
    local Ply = CTRPFW.Functions.GetPlayer(src)
    local CitizenId = Ply.PlayerData.citizenid

    OutsideVehicles[CitizenId] = Vehicles
end)

CTRPFW.Functions.CreateCallback("ctrp-garage:server:GetOutsideVehicles", function(source, cb)
    local Ply = CTRPFW.Functions.GetPlayer(source)
    local CitizenId = Ply.PlayerData.citizenid

    if OutsideVehicles[CitizenId] ~= nil and next(OutsideVehicles[CitizenId]) ~= nil then
        cb(OutsideVehicles[CitizenId])
    else
        cb(nil)
    end
end)

CTRPFW.Functions.CreateCallback("ctrp-garage:server:GetUserVehicles", function(source, cb, garage)
    local src = source
    local pData = CTRPFW.Functions.GetPlayer(src)

    exports['ghmattimysql']:execute('SELECT * FROM player_vehicles WHERE citizenid = @citizenid AND garage = @garage', {['@citizenid'] = pData.PlayerData.citizenid, ['@garage'] = garage}, function(result)
        if result[1] ~= nil then
            for k, v in pairs(result) do
                if v.status ~= nil then
                    v.status = json.decode(v.status)
                end
            end
            cb(result)
        else
            cb(nil)
        end
    end)
end)

CTRPFW.Functions.CreateCallback("ctrp-garage:server:GetVehicleProperties", function(source, cb, plate)
    local src = source
    local properties = {}
    CTRPFW.Functions.ExecuteSql(false, "SELECT `mods` FROM `player_vehicles` WHERE `plate` = '"..plate.."'", function(result)
        if result[1] ~= nil then
            properties = json.decode(result[1].mods)
        end
        cb(properties)
    end)
end)

CTRPFW.Functions.CreateCallback("ctrp-garage:server:GetDepotVehicles", function(source, cb)
    local src = source
    local pData = CTRPFW.Functions.GetPlayer(src)

    exports['ghmattimysql']:execute('SELECT * FROM player_vehicles WHERE citizenid = @citizenid AND state = @state', {['@citizenid'] = pData.PlayerData.citizenid, ['@state'] = 0}, function(result)
        if result[1] ~= nil then
            for k, v in pairs(result) do
                if v.status ~= nil then
                    v.status = json.decode(v.status)
                end
            end
            cb(result)
        else
            cb(nil)
        end
    end)
end)

CTRPFW.Functions.CreateCallback("ctrp-garage:server:GetHouseVehicles", function(source, cb, house)
    local src = source
    local pData = CTRPFW.Functions.GetPlayer(src)

    exports['ghmattimysql']:execute('SELECT * FROM player_vehicles WHERE garage = @garage', {['@garage'] = house}, function(result)
        if result[1] ~= nil then
            for k, v in pairs(result) do
                if v.status ~= nil then
                    v.status = json.decode(v.status)
                end
            end
            cb(result)
        else
            cb(nil)
        end
    end)
end)

CTRPFW.Functions.CreateCallback("ctrp-garage:server:checkVehicleHouseOwner", function(source, cb, plate, house)
    local src = source
    local pData = CTRPFW.Functions.GetPlayer(src)
    exports['ghmattimysql']:execute('SELECT * FROM player_vehicles WHERE plate = @plate', {['@plate'] = plate}, function(result)
        if result[1] ~= nil then
            local hasHouseKey = exports['ctrp-houses']:hasKey(result[1].steam, result[1].citizenid, house)
            if hasHouseKey then
                cb(true)
            else
                cb(false)
            end
        else
            cb(false)
        end
    end)
end)

RegisterServerEvent('ctrp-garage:server:PayDepotPrice')
AddEventHandler('ctrp-garage:server:PayDepotPrice', function(vehicle, garage)
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)
    local bankBalance = Player.PlayerData.money["bank"]
    exports['ghmattimysql']:execute('SELECT * FROM player_vehicles WHERE plate = @plate', {['@plate'] = vehicle.plate}, function(result)
        if result[1] ~= nil then
            if Player.Functions.RemoveMoney("cash", result[1].depotprice, "paid-depot") then
                TriggerClientEvent("ctrp-garages:client:takeOutDepot", src, vehicle, garage)
            elseif bankBalance >= result[1].depotprice then
                Player.Functions.RemoveMoney("bank", result[1].depotprice, "paid-depot")
                TriggerClientEvent("ctrp-garages:client:takeOutDepot", src, vehicle, garage)
            end
        end
    end)
end)

RegisterServerEvent('ctrp-garage:server:updateVehicleState')
AddEventHandler('ctrp-garage:server:updateVehicleState', function(state, plate, garage)
    local src = source
    local pData = CTRPFW.Functions.GetPlayer(src)

    exports['ghmattimysql']:execute('UPDATE player_vehicles SET state = @state, garage = @garage, depotprice = @depotprice WHERE plate = @plate', {['@state'] = state, ['@plate'] = plate, ['@depotprice'] = 250, ['@citizenid'] = pData.PlayerData.citizenid, ['@garage'] = garage})
end)

RegisterServerEvent('ctrp-garage:server:updateVehicleStatus')
AddEventHandler('ctrp-garage:server:updateVehicleStatus', function(fuel, engine, body, plate, garage)
    local src = source
    local pData = CTRPFW.Functions.GetPlayer(src)

    if engine > 1000 then
        engine = engine / 1000
    end

    if body > 1000 then
        body = body / 1000
    end

    exports['ghmattimysql']:execute('UPDATE player_vehicles SET fuel = @fuel, engine = @engine, body = @body WHERE plate = @plate AND citizenid = @citizenid AND garage = @garage', {
        ['@fuel'] = fuel, 
        ['@engine'] = engine, 
        ['@body'] = body,
        ['@plate'] = plate,
        ['@garage'] = garage,
        ['@citizenid'] = pData.PlayerData.citizenid
    })
end)