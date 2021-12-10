CTRPFW = nil
TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)

-- Code

RegisterNetEvent('ctrp-policealerts:server:AddPoliceAlert')
AddEventHandler('ctrp-policealerts:server:AddPoliceAlert', function(data, forBoth)
    forBoth = forBoth ~= nil and forBoth or false
    TriggerClientEvent('ctrp-policealerts:client:AddPoliceAlert', -1, data, forBoth)
end)