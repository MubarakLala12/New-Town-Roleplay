CTRPFW = nil
TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)

local ItemList = {
    ["casinochips"] = 1,
}

RegisterServerEvent("ctrp-casino:sharlock:sell")
AddEventHandler("ctrp-casino:sharlock:sell", function()
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
        Player.Functions.AddMoney("cash", price, "sold-casino-chips")
        TriggerClientEvent('CTRPFW:Notify', src, "You sold your chips")
        TriggerEvent("ctrp-log:server:CreateLog", "casino", "Chips", "blue", "**"..GetPlayerName(src) .. "** got $"..price.." for selling the Chips")
        else
        TriggerClientEvent('CTRPFW:Notify', src, "You have no chips..")
    end
end)

RegisterServerEvent("ctrp-casino:server:virusmembership")
AddEventHandler("ctrp-casino:server:virusmembership", function()
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)
    if Player.Functions.RemoveMoney("cash", 2000, "bought-virusmembership") then
        TriggerClientEvent('CTRPFW:Notify', src, "Bought Membership Card, Enjoy!")
        Player.Functions.AddItem("casinomembership", 1)
    else
        TriggerClientEvent('CTRPFW:Notify', src, "You don't have 2000$ cash..")
    end
end)

