RegisterServerEvent('ctrp-radialmenu:server:RemoveBrancard')
AddEventHandler('ctrp-radialmenu:server:RemoveBrancard', function(PlayerPos, BrancardObject)
    TriggerClientEvent('ctrp-radialmenu:client:RemoveBrancardFromArea', -1, PlayerPos, BrancardObject)
end)

RegisterServerEvent('ctrp-radialmenu:Brancard:BusyCheck')
AddEventHandler('ctrp-radialmenu:Brancard:BusyCheck', function(id, type)
    local MyId = source
    TriggerClientEvent('ctrp-radialmenu:Brancard:client:BusyCheck', id, MyId, type)
end)

RegisterServerEvent('ctrp-radialmenu:server:BusyResult')
AddEventHandler('ctrp-radialmenu:server:BusyResult', function(IsBusy, OtherId, type)
    TriggerClientEvent('ctrp-radialmenu:client:Result', OtherId, IsBusy, type)
end)