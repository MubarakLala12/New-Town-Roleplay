CTRPFW = nil
TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)

local ItemTable = {
    "metalscrap",
    "plastic",
    "copper",
    "steel",
    "rubber",
    
}

RegisterServerEvent("ctrp-recycle:server:getItem")
AddEventHandler("ctrp-recycle:server:getItem", function()
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)
    for i = 1, math.random(1, 5), 1 do
        local randItem = ItemTable[math.random(1, #ItemTable)]
        local amount = math.random(2, 6)
        Player.Functions.AddItem(randItem, amount)
        TriggerClientEvent('inventory:client:ItemBox', src, CTRPFW.Shared.Items[randItem], 'add')
        Citizen.Wait(500)
    end

    --[[local Luck = math.random(1, 10)
    local Odd = math.random(1, 10)
    if Luck == Odd then
        local random = math.random(1, 3)
        Player.Functions.AddItem("rubber", random)
        TriggerClientEvent('inventory:client:ItemBox', src, CTRPFW.Shared.Items["rubber"], 'add')
    end]]
end)

RegisterServerEvent('ctrp-recycle:takemoney')
AddEventHandler('ctrp-recycle:takemoney', function()
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)

      if TriggerClientEvent("CTRPFW:Notify", src, "You Paid $5000!", "Success", 8000) then
        Player.Functions.RemoveMoney('bank', 5000)
          
      end
end)
