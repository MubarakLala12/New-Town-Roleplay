CTRPFW = nil
TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)

RegisterServerEvent("virus-slots:BetsAndMoney")
AddEventHandler("virus-slots:BetsAndMoney", function(bets, amount)
    local _source   = source
    local xPlayer   = CTRPFW.Functions.GetPlayer(_source)
    if xPlayer then
        local xItem = xPlayer.Functions.GetItemByName('casinochips')
        if xItem == nil then
            TriggerClientEvent('CTRPFW:Notify', _source, "You need at least 10 chips to play!", "error")
        else
            if xItem.amount < 10 then
                TriggerClientEvent('CTRPFW:Notify', _source, "You need at least 10 chips to play!", "error")
            else
                TriggerClientEvent("virus-slots:UpdateSlots", _source, xItem.amount)
                xPlayer.Functions.RemoveItem('casinochips', xItem.amount)
            end
        end
    end
end)

RegisterServerEvent("virus-slots:updateCoins")
AddEventHandler("virus-slots:updateCoins", function(bets)
    local _source   = source
    local xPlayer   = CTRPFW.Functions.GetPlayer(_source)
        xPlayer.Functions.AddItem('casinochips', bets)
end)

RegisterServerEvent("virus-slots:PayOutRewards")
AddEventHandler("virus-slots:PayOutRewards", function(amount)
    local _source   = source
    local xPlayer   = CTRPFW.Functions.GetPlayer(_source)
    if xPlayer then
        amount = math.floor(tonumber(amount))
        if amount > 0 then
            xPlayer.Functions.AddItem('casinochips', amount)
        end
        
    end
end)

