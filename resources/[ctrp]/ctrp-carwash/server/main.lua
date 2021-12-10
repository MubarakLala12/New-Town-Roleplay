-- CTRPFW = nil
-- TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)

-- Code

RegisterServerEvent('ctrp-carwash:server:washCar')
AddEventHandler('ctrp-carwash:server:washCar', function()
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)

    if Player.Functions.RemoveMoney('cash', Config.DefaultPrice, "car-washed") then
        TriggerClientEvent('ctrp-carwash:client:washCar', src)
    elseif Player.Functions.RemoveMoney('bank', Config.DefaultPrice, "car-washed") then
        TriggerClientEvent('ctrp-carwash:client:washCar', src)
    else
        TriggerClientEvent('CTRPFW:Notify', src, 'You dont have enough money..', 'error')
    end
end)