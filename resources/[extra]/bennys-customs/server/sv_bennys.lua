CTRPFW = nil
TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)

-- local base = vehicleBaseRepairCost

RegisterServerEvent('bennys-customs:attemptPurchase')
AddEventHandler('bennys-customs:attemptPurchase', function(type, upgradeLevel)
    local source = source
    local Player = CTRPFW.Functions.GetPlayer(source)
    -- if type == "repair" then
    --     if Player.PlayerData.money.bank >= base then
    --         --Player.Functions.RemoveMoney('bank', base)
    --         TriggerClientEvent('bennys-customs:purchaseSuccessful', source)
    --         TriggerClientEvent('ctrp-moneysafesmec:client:DepositMoney', source , base)
    --         TriggerEvent("ctrp-log:server:sendLog", Player.PlayerData.citizenid, "vehicleupgraded", {name=name, moneyType="bank", price=base, plate="unkown"})
	-- 		TriggerEvent("ctrp-log:server:CreateLog", "vehicleupgrades", "Upgrade bought", "green", "**"..GetPlayerName(source).."** has bought an repair for $" .. base)
    --     else
    --         TriggerClientEvent('bennys-customs:purchaseFailed', source)
    --     end
    -- else
    if type == "performance" then
        if Player.PlayerData.money.bank >= vehicleCustomisationPrices[type].prices[upgradeLevel] then
            TriggerClientEvent('bennys-customs:purchaseSuccessful', source)
            --Player.Functions.RemoveMoney('bank', vehicleCustomisationPrices[type].prices[upgradeLevel])
            TriggerClientEvent('ctrp-moneysafesmec:client:DepositMoney', source ,vehicleCustomisationPrices[type].prices[upgradeLevel])
            TriggerEvent("ctrp-log:server:sendLog", Player.PlayerData.citizenid, "vehicleupgraded", {name=name, moneyType="bank", price=vehicleCustomisationPrices[type].prices[upgradeLevel], plate="unkown"})
			TriggerEvent("ctrp-log:server:CreateLog", "vehicleupgrades", "Upgrade bought", "green", "**"..GetPlayerName(source).."** has bought an upgrade for $" .. vehicleCustomisationPrices[type].prices[upgradeLevel])
        else
            TriggerClientEvent('bennys-customs:purchaseFailed', source)
        end
    else
        if Player.PlayerData.money.bank >= vehicleCustomisationPrices[type].price then
            TriggerClientEvent('bennys-customs:purchaseSuccessful', source)
            --Player.Functions.RemoveMoney('bank', vehicleCustomisationPrices[type].price)
            TriggerClientEvent('ctrp-moneysafesmec:client:DepositMoney', source ,vehicleCustomisationPrices[type].price)
            TriggerEvent("ctrp-log:server:sendLog", Player.PlayerData.citizenid, "vehicleupgraded", {name=name, moneyType="bank", price=vehicleCustomisationPrices[type].price, plate="unkown"})
			TriggerEvent("ctrp-log:server:CreateLog", "vehicleupgrades", "Upgrade bought", "green", "**"..GetPlayerName(source).."** has bought an upgrade for $" .. vehicleCustomisationPrices[type].price)
        else
            TriggerClientEvent('bennys-customs:purchaseFailed', source)
        end
    end
end)

-- RegisterServerEvent('bennys-customs:updateRepairCost')
-- AddEventHandler('bennys-customs:updateRepairCost', function(cost)
--     base = cost
-- end)

RegisterServerEvent("updateVehicle")
AddEventHandler("updateVehicle", function(myCar)
	local source = source
    if IsVehicleOwned(myCar.plate) then
        exports.ghmattimysql:execute('UPDATE player_vehicles SET mods=@mods WHERE plate=@plate', {['@mods'] = json.encode(myCar), ['@plate'] = myCar.plate})
    end
end)

function IsVehicleOwned(plate)
    local retval = false
    local result = exports.ghmattimysql:scalarSync('SELECT plate FROM player_vehicles WHERE plate=@plate', {['@plate'] = plate})
    if result then
        retval = true
    end
    return retval
end