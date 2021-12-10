CTRPFW = nil
TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)

local Bail = {}

CTRPFW.Functions.CreateCallback('ctrp-garbagejob:server:HasMoney', function(source, cb)
    local Player = CTRPFW.Functions.GetPlayer(source)
    local CitizenId = Player.PlayerData.citizenid

    if Player.PlayerData.money.cash >= Config.BailPricegarbage then
        Bail[CitizenId] = "cash"
        Player.Functions.RemoveMoney('cash', Config.BailPricegarbage)
        cb(true)
    elseif Player.PlayerData.money.bank >= Config.BailPricegarbage then
        Bail[CitizenId] = "bank"
        Player.Functions.RemoveMoney('bank', Config.BailPricegarbage)
        cb(true)
    else
        cb(false)
    end
end)

CTRPFW.Functions.CreateCallback('ctrp-garbagejob:server:CheckBail', function(source, cb)
    local Player = CTRPFW.Functions.GetPlayer(source)
    local CitizenId = Player.PlayerData.citizenid

    if Bail[CitizenId] ~= nil then
        Player.Functions.AddMoney(Bail[CitizenId], Config.BailPricegarbage)
        Bail[CitizenId] = nil
        cb(true)
    else
        cb(false)
    end
end)

local Materials = {
    "metalscrap",
    "plastic",
    "copper",
    "iron",
    "aluminum",
    "steel",
    "glass",
}

RegisterServerEvent('ctrp-garbagejob:server:PayShit')
AddEventHandler('ctrp-garbagejob:server:PayShit', function(amount, location)
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)

    if amount > 0 then
        Player.Functions.AddMoney('bank', amount)

        TriggerClientEvent('CTRPFW:Notify', src, "You got paid $"..amount.."- from the bank", "success")
    else
        TriggerClientEvent('CTRPFW:Notify', src, "You got paid nothing..", "error")
    end
end)

RegisterNetEvent("ctrp-garbagejob:server:RewardItem")
AddEventHandler("ctrp-garbagejob:server:RewardItem", function(item, count)
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)
    local luckr = math.random(1, 100)
    local itemFoundr = true
    local itemCountr = 1

    if itemFoundr then
        for i = 1, itemCountr, 1 do
            local randomItem = Config.RewardItemsgarbage["type"]math.random(1, 1)
            local itemInfo = CTRPFW.Shared.Items[randomItem]
            if luckr == 100 then
                randomItem = "keyz"
                itemInfo = CTRPFW.Shared.Items[randomItem]
               
                Player.Functions.AddItem(randomItem, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, itemInfo, "add")
               
			elseif luckr >= 90 and luckr <= 98 then
                TriggerClientEvent('CTRPFW:Notify', src, "कुछ नहीं मिलेगा , निकल पहली फुर्सत में" , "error", 5000)
                
            elseif luckr >= 70 and luckr <= 90 then
				randomItem = "empty_bag"
				itemInfo = CTRPFW.Shared.Items[randomItem]
                
                Player.Functions.AddItem(randomItem, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, itemInfo, "add")
                
			elseif luckr >= 60 and luckr <= 70 then
				randomItem = "empty_bottle"
				itemInfo = CTRPFW.Shared.Items[randomItem]
                
                Player.Functions.AddItem(randomItem, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, itemInfo, "add")
            elseif luckr >= 50 and luckr <= 60 then
				randomItem = "glass"
				itemInfo = CTRPFW.Shared.Items[randomItem]
                
                Player.Functions.AddItem(randomItem, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, itemInfo, "add")
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