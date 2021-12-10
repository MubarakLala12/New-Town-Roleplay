CTRPFW = nil
TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)

-- Code

local RentedVehicle = {}

RegisterServerEvent('virus-vehiclerentals:server:SetVehicleRented')
AddEventHandler('virus-vehiclerentals:server:SetVehicleRented', function(plate, bool, vehicleData)
    local src = source
    local ply = CTRPFW.Functions.GetPlayer(src)
    local plyCid = ply.PlayerData.citizenid

    if bool then
        if ply.PlayerData.money.cash >= vehicleData.price then
            ply.Functions.RemoveMoney('cash', vehicleData.price, "vehicle-rentail-bail")
            RentedVehicle[plyCid] = plate
            TriggerClientEvent('CTRPFW:Notify', src, 'You have the security deposit $'..vehicleData.price..' paid cash.', 'success', 3500)
            TriggerClientEvent('virus-vehiclerentals:server:SpawnRentedVehicle', src, plate, vehicleData)
        elseif ply.PlayerData.money.bank >= vehicleData.price then
            ply.Functions.RemoveMoney('bank', vehicleData.price, "vehicle-rentail-bail")
            RentedVehicle[plyCid] = plate
            TriggerClientEvent('CTRPFW:Notify', src, 'You have the security deposit $'..vehicleData.price..' paid through the bank.', 'success', 3500)
            TriggerClientEvent('virus-vehiclerentals:server:SpawnRentedVehicle', src, plate, vehicleData)
        else
            TriggerClientEvent('CTRPFW:Notify', src, 'You do not have enough money.', 'error', 3500)
        end
        return
    end
    TriggerClientEvent('CTRPFW:Notify', src, 'You have your deposit $'..vehicleData.price..' got back.', 'success', 3500)
    ply.Functions.AddMoney('cash', vehicleData.price, "vehicle-rentail-bail")
    RentedVehicle[plyCid] = nil
end)
