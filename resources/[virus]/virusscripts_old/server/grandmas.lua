CTRPFW = nil
TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)

RegisterServerEvent('virus-grandmas:server:HealSomeShit')
AddEventHandler('virus-grandmas:server:HealSomeShit', function()
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)

    if TriggerClientEvent("CTRPFW:Notify", src, "You Were Billed For $4,000 For Medical Services & Expenses", "Success", 8000) then
        Player.Functions.RemoveMoney('bank', 4000) 
    end
end)