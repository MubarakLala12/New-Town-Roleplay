CTRPFW.Functions.CreateCallback('ctrp-drugs:server:cornerselling:getAvailableDrugs', function(source, cb)
    local AvailableDrugs = {}
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)

    for i = 1, #Config.CornerSellingDrugsList, 1 do
        local item = Player.Functions.GetItemByName(Config.CornerSellingDrugsList[i])

        if item ~= nil then
            table.insert(AvailableDrugs, {
                item = item.name,
                amount = item.amount,
                label = CTRPFW.Shared.Items[item.name]["label"]
            })
        end
    end

    if next(AvailableDrugs) ~= nil then
        cb(AvailableDrugs)
    else
        cb(nil)
    end
end)

RegisterServerEvent('ctrp-drugs:server:sellCornerDrugs')
AddEventHandler('ctrp-drugs:server:sellCornerDrugs', function(item, amount, price)
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)
    local AvailableDrugs = {}

    Player.Functions.RemoveItem(item, amount)
    --Player.Functions.AddMoney('cash', price, "sold-cornerdrugs")
    Player.Functions.AddItem('blackmoney', price)

    TriggerClientEvent('inventory:client:ItemBox', src, CTRPFW.Shared.Items[item], "remove")

    for i = 1, #Config.CornerSellingDrugsList, 1 do
        local item = Player.Functions.GetItemByName(Config.CornerSellingDrugsList[i])

        if item ~= nil then
            table.insert(AvailableDrugs, {
                item = item.name,
                amount = item.amount,
                label = CTRPFW.Shared.Items[item.name]["label"]
            })
        end
    end

    TriggerClientEvent('ctrp-drugs:client:refreshAvailableDrugs', src, AvailableDrugs)
end)

RegisterServerEvent('ctrp-drugs:server:robCornerDrugs')
AddEventHandler('ctrp-drugs:server:robCornerDrugs', function(item, amount, price)
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)
    local AvailableDrugs = {}

    Player.Functions.RemoveItem(item, amount)

    TriggerClientEvent('inventory:client:ItemBox', src, CTRPFW.Shared.Items[item], "remove")

    for i = 1, #Config.CornerSellingDrugsList, 1 do
        local item = Player.Functions.GetItemByName(Config.CornerSellingDrugsList[i])

        if item ~= nil then
            table.insert(AvailableDrugs, {
                item = item.name,
                amount = item.amount,
                label = CTRPFW.Shared.Items[item.name]["label"]
            })
        end
    end

    TriggerClientEvent('ctrp-drugs:client:refreshAvailableDrugs', src, AvailableDrugs)
end)