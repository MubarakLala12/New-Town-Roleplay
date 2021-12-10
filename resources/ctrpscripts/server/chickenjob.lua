CTRPFW = nil
TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)

RegisterServerEvent('ctrp-chickenjob:getNewChicken')
AddEventHandler('ctrp-chickenjob:getNewChicken', function()
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)
    local pick = Config.Items

      if TriggerClientEvent("CTRPFW:Notify", src, "You Received 5 Alive chicken!", "Success", 8000) then
          Player.Functions.AddItem('alivechicken', 5)
          TriggerClientEvent("inventory:client:ItemBox", source, CTRPFW.Shared.Items['alivechicken'], "add")
      end
end)

RegisterServerEvent('ctrp-chickenjob:getcutChicken')
AddEventHandler('ctrp-chickenjob:getcutChicken', function()
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)
    local pick = Config.Items

      if TriggerClientEvent("CTRPFW:Notify", src, "Well! You slaughtered chicken.", "Success", 8000) then
          Player.Functions.RemoveItem('alivechicken', 1)
          Player.Functions.AddItem('slaughteredchicken', 1)
          TriggerClientEvent("inventory:client:ItemBox", source, CTRPFW.Shared.Items['alivechicken'], "remove")
          TriggerClientEvent("inventory:client:ItemBox", source, CTRPFW.Shared.Items['slaughteredchicken'], "add")
      end
end)

RegisterServerEvent('ctrp-chickenjob:startChicken')
AddEventHandler('ctrp-chickenjob:startChicken', function()
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)

      if TriggerClientEvent("CTRPFW:Notify", src, "You Paid $500!", "Success", 8000) then
        Player.Functions.RemoveMoney('bank', 500)
          
      end
end)

RegisterServerEvent('ctrp-chickenjob:getpackedChicken')
AddEventHandler('ctrp-chickenjob:getpackedChicken', function()
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)
    local pick = Config.Items

      if TriggerClientEvent("CTRPFW:Notify", src, "You Packed Slaughtered chicken .", "Success", 8000) then
          Player.Functions.RemoveItem('slaughteredchicken', 1)
          Player.Functions.AddItem('packagedchicken', 1)
          TriggerClientEvent("inventory:client:ItemBox", source, CTRPFW.Shared.Items['slaughteredchicken'], "remove")
          TriggerClientEvent("inventory:client:ItemBox", source, CTRPFW.Shared.Items['packagedchicken'], "add")
      end
end)


local ItemList = {
    ["packagedchicken"] = math.random(200, 350),
}

RegisterServerEvent('ctrp-chickenjob:sell')
AddEventHandler('ctrp-chickenjob:sell', function()
    local src = source
    local price = 0
    local Player = CTRPFW.Functions.GetPlayer(src)
    if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then 
        for k, v in pairs(Player.PlayerData.items) do 
            if Player.PlayerData.items[k] ~= nil then 
                if ItemList[Player.PlayerData.items[k].name] ~= nil then 
                    price = price + (ItemList[Player.PlayerData.items[k].name] * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem(Player.PlayerData.items[k].name, Player.PlayerData.items[k].amount, k)
                end
            end
        end
        Player.Functions.AddMoney("cash", price, "sold-items")
        TriggerClientEvent('CTRPFW:Notify', src, "You have sold your items")
    else
        TriggerClientEvent('CTRPFW:Notify', src, "You don't have items")
    end
end)


