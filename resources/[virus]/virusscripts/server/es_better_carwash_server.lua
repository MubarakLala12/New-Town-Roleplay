-- CTRPFW = nil
-- TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)

RegisterServerEvent('es_better_carwash:checkmoney')
AddEventHandler('es_better_carwash:checkmoney',function(amount)
    local src = source
    local ply = CTRPFW.Functions.GetPlayer(src)
    local cashamount = ply.PlayerData.money["cash"]
    local amount = tonumber(amount)
	TriggerClientEvent('es_better_carwash:success', source, 25)
end)