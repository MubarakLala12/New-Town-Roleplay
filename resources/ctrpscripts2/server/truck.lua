CTRPFW = nil
TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)

local PaymentTax = 15

local Bail = {}

RegisterServerEvent('ctrp-trucker:server:DoBail')
AddEventHandler('ctrp-trucker:server:DoBail', function(bool, vehInfo)
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)

    if bool then
        if Player.PlayerData.money.cash >= Config.BailPricetruck then
            Bail[Player.PlayerData.citizenid] = Config.BailPricetruck
            Player.Functions.RemoveMoney('cash', Config.BailPricetruck, "tow-received-bail")
            TriggerClientEvent('CTRPFW:Notify', src, 'You have paid the deposit of $1000 - (Cash)', 'success')
            TriggerClientEvent('ctrp-trucker:client:SpawnVehicle', src, vehInfo)
        elseif Player.PlayerData.money.bank >= Config.BailPricetruck then
            Bail[Player.PlayerData.citizenid] = Config.BailPricetruck
            Player.Functions.RemoveMoney('bank', Config.BailPricetruck, "tow-received-bail")
            TriggerClientEvent('CTRPFW:Notify', src, 'You have paid the deposit of $1000 - (Bank)', 'success')
            TriggerClientEvent('ctrp-trucker:client:SpawnVehicle', src, vehInfo)
			TriggerClientEvent('updatejobs', src)
        else
            TriggerClientEvent('CTRPFW:Notify', src, 'You do not have enough cash, the deposit is $1000-', 'error')
        end
    else
        if Bail[Player.PlayerData.citizenid] ~= nil then
            Player.Functions.AddMoney('cash', Bail[Player.PlayerData.citizenid], "trucker-bail-paid")
            Bail[Player.PlayerData.citizenid] = nil
            TriggerClientEvent('CTRPFW:Notify', src, 'You have received the deposit of $1000- back', 'success')
			TriggerClientEvent('ctrp-trucker:removeblip',source)
        end
    end
end)

--[[RegisterNetEvent('ctrp-trucker:server:01101110')
AddEventHandler('ctrp-trucker:server:01101110', function(drops)
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)
    local drops = tonumber(drops)
    local bonus = 0
    local DropPrice = math.random(300, 500)
    if drops > 5 then
        bonus = math.ceil((DropPrice / 100) * 5) + 100
    elseif drops > 10 then
        bonus = math.ceil((DropPrice / 100) * 7) + 300
    elseif drops > 15 then
        bonus = math.ceil((DropPrice / 100) * 10) + 400
    elseif drops > 20 then
        bonus = math.ceil((DropPrice / 100) * 12) + 500
    end
    local price = (DropPrice * drops) + bonus
    local taxAmount = math.ceil((price / 100) * PaymentTax)
    local payment = price - taxAmount
    Player.Functions.AddJobReputation(1)
    Player.Functions.AddMoney("bank", payment, "trucker-salary")
    TriggerClientEvent('chatMessage', source, "GOVERNMENT", "warning", "You received your salary from: $"..payment..", gross: $"..price.." (bonus $"..bonus.." bonus) and $"..taxAmount.." tax ("..PaymentTax.."%)")
end)]]

RegisterNetEvent('ctrp-trucker:server:01101110')
AddEventHandler('ctrp-trucker:server:01101110', function()
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)
    local DropPrice = math.random(270, 320)
    local price = DropPrice
    local taxAmount = math.ceil((price / 100) * PaymentTax)
    local payment = price - taxAmount
    Player.Functions.AddJobReputation(1)
    Player.Functions.AddMoney("bank", payment, "trucker-salary")
    TriggerClientEvent('chatMessage', source, "Amazon", "warning", "You received your Amazon Drop Off Pay of: $"..payment..", gross: $"..price.." and $"..taxAmount.." tax ("..PaymentTax.."%)")
end)


RegisterNetEvent("ctrp-trucker:server:RewardItem")
AddEventHandler("ctrp-trucker:server:RewardItem", function(item, count)
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)
    local luckr = math.random(1, 100)
    local itemFoundr = true
    local itemCountr = 1

    if itemFoundr then
        for i = 1, itemCountr, 1 do
            local randomItem = Config.RewardItemstruck["type"]math.random(1, 1)
            local itemInfo = CTRPFW.Shared.Items[randomItem]
            if luckr == 100 then
                randomItem = "labkey"
                itemInfo = CTRPFW.Shared.Items[randomItem]
               
                Player.Functions.AddItem(randomItem, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, itemInfo, "add")
               
			elseif luckr >= 90 and luckr <= 98 then
                randomItem = "lotto"
				itemInfo = CTRPFW.Shared.Items[randomItem]
                
                Player.Functions.AddItem(randomItem, 1)
                
            elseif luckr >= 80 and luckr <= 90 then
				randomItem = "firstaid"
				itemInfo = CTRPFW.Shared.Items[randomItem]
                
                Player.Functions.AddItem(randomItem, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, itemInfo, "add")
                
			elseif luckr >= 70 and luckr <= 80 then
				randomItem = "papera"
				itemInfo = CTRPFW.Shared.Items[randomItem]
                
                Player.Functions.AddItem(randomItem, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, itemInfo, "add")
            elseif luckr >= 60 and luckr <= 70 then
				randomItem = "empty_bag"
				itemInfo = CTRPFW.Shared.Items[randomItem]
                
                Player.Functions.AddItem(randomItem, 1)
            elseif luckr >= 50 and luckr <= 60 then
                TriggerClientEvent('CTRPFW:Notify', src, "कुछ नहीं मिलेगा , निकल पहली फुर्सत में" , "error", 5000)
            elseif luckr >= 40 and luckr <= 50 then
                TriggerClientEvent('CTRPFW:Notify', src, "कुछ नहीं मिलेगा , निकल पहली फुर्सत में" , "error", 5000)
            elseif luckr >= 30 and luckr <= 40 then
                TriggerClientEvent('CTRPFW:Notify', src, "कुछ नहीं मिलेगा , निकल पहली फुर्सत में" , "error", 5000)
            elseif luckr >= 20 and luckr <= 30 then
                TriggerClientEvent('CTRPFW:Notify', src, "कुछ नहीं मिलेगा , निकल पहली फुर्सत में" , "error", 5000)
            elseif luckr >= 10 and luckr <= 20 then
				TriggerClientEvent('CTRPFW:Notify', src, "कुछ नहीं मिलेगा , निकल पहली फुर्सत में" , "error", 5000)
            elseif luckr >= 0 and luckr <= 10 then
                TriggerClientEvent('CTRPFW:Notify', src, "कुछ नहीं मिलेगा , निकल पहली फुर्सत में" , "error", 5000)
                
            end
            Citizen.Wait(500)
        end
    end
end)