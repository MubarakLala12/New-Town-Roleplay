RegisterServerEvent('json:dataStructure')
AddEventHandler('json:dataStructure', function(data)
    print(json.encode(data))
end)

RegisterServerEvent('ctrp-radialmenu:trunk:server:Door')
AddEventHandler('ctrp-radialmenu:trunk:server:Door', function(open, plate, door)
    TriggerClientEvent('ctrp-radialmenu:trunk:client:Door', -1, plate, door, open)
end)