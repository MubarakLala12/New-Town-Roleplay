CTRPFW = nil

TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)

RegisterServerEvent('virus-plasticsurgery:surgery')
AddEventHandler('virus-plasticsurgery:surgery', function()
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('surgerypass', 1)
   
    TriggerClientEvent("inventory:client:ItemBox", source, CTRPFW.Shared.Items['surgerypass'], "remove")
end)