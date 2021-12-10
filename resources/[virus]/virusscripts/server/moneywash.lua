-- CTRPFW = nil
-- TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)

CTRPFW.Functions.CreateCallback('virus-moneywash:server:checkWash', function(source, cb)
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)
    local blackmoney = Player.Functions.GetItemByName("blackmoney")
    local tamount = 0
	
    for k, v in pairs(Player.PlayerData.items) do 
        if Player.PlayerData.items[k] ~= nil then 
            if Player.PlayerData.items[k].name == "blackmoney" then 
                tamount = Player.PlayerData.items[k].amount
            end
        end
    end
    if blackmoney ~= nil  then
        cb(true,tamount)
    else
       cb(false,nil)
    end
end)

RegisterServerEvent("virus-moneywash:server:getItem")
AddEventHandler("virus-moneywash:server:getItem", function(amt)
    local src = source
	local Player = CTRPFW.Functions.GetPlayer(src)
    if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then 
        for k, v in pairs(Player.PlayerData.items) do 
            if Player.PlayerData.items[k] ~= nil then 
                if Player.PlayerData.items[k].name == "blackmoney" then 
                    blackCount = Player.PlayerData.items[k].amount
                end
            end
        end
        
		TriggerClientEvent('CTRPFW:Notify', src, "You have "..blackCount.. " black money notes ")
	end
end)


RegisterNetEvent("virus-moneywash:server:checkInv")
AddEventHandler("virus-moneywash:server:checkInv", function()
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)

        if Player.Functions.GetItemByName('blackmoney') ~= nil then
            local amt = Player.Functions.GetItemByName('blackmoney').amount
            TriggerClientEvent('virus-moneywash:client:startTimer', src, amt)
            TriggerClientEvent('CTRPFW:Notify', src, 'You put the black money in the washer.', 'success')
            Player.Functions.RemoveItem('blackmoney', amt)
 
        else
            TriggerClientEvent('CTRPFW:Notify', src, 'You have no black money.', 'error') 
        end

end)

RegisterServerEvent("virus-moneywash:server:giveMoney")
AddEventHandler("virus-moneywash:server:giveMoney", function(amt)
    
  
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)
    Player.Functions.AddMoney("cash", amt)
	TriggerClientEvent('CTRPFW:Notify', src, "You have received your white money with 20% deduction fee of washing")

end)

