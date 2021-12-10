CTRPFW = nil
TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)

local PaymentTax = 15
local Bail = {}

RegisterServerEvent('ctrp-tow:server:DoBail')
AddEventHandler('ctrp-tow:server:DoBail', function(bool, vehInfo)
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)

    if bool then
        if Player.PlayerData.money.cash >= Config.BailPrice then
            Bail[Player.PlayerData.citizenid] = Config.BailPrice
            Player.Functions.RemoveMoney('cash', Config.BailPrice, "tow-paid-bail")
            TriggerClientEvent('CTRPFW:Notify', src, 'You have paid the deposit of $1000 -', 'success')
            TriggerClientEvent('ctrp-tow:client:SpawnVehicle', src, vehInfo)
        elseif Player.PlayerData.money.bank >= Config.BailPrice then
            Bail[Player.PlayerData.citizenid] = Config.BailPrice
            Player.Functions.RemoveMoney('bank', Config.BailPrice, "tow-paid-bail")
            TriggerClientEvent('CTRPFW:Notify', src, 'You have paid the deposit of $1000 -', 'success')
            TriggerClientEvent('ctrp-tow:client:SpawnVehicle', src, vehInfo)
        else
            TriggerClientEvent('CTRPFW:Notify', src, 'You do not have enough cash, the deposit is $1000, -', 'error')
        end
    else
        if Bail[Player.PlayerData.citizenid] ~= nil then
            Player.Functions.AddMoney('cash', Bail[Player.PlayerData.citizenid], "tow-bail-paid")
            Bail[Player.PlayerData.citizenid] = nil
            TriggerClientEvent('CTRPFW:Notify', src, 'You have received the deposit of $1000 - back', 'success')
        end
    end
end)

--[[RegisterNetEvent('ctrp-tow:server:11101110')
AddEventHandler('ctrp-tow:server:11101110', function(drops)
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)
    local drops = tonumber(drops)
    local bonus = 0
    local DropPrice = math.random(450, 700)
    if drops > 5 then
        bonus = math.ceil((DropPrice / 100) * 2)
    elseif drops > 10 then
        bonus = math.ceil((DropPrice / 100) * 3)
    elseif drops > 15 then
        bonus = math.ceil((DropPrice / 100) * 4)
    elseif drops > 20 then
        bonus = math.ceil((DropPrice / 100) * 5)
    end
    local price = (DropPrice * drops) + bonus
    local taxAmount = math.ceil((price / 100) * PaymentTax)
    local payment = price - taxAmount

    Player.Functions.AddJobReputation(1)
    Player.Functions.AddMoney("bank", payment, "tow-salary")
    TriggerClientEvent('chatMessage', source, "GOVERNMENT", "warning", "You received your salary from: $"..payment..", gross: $"..price.." (with $"..bonus.." bonus) and $"..taxAmount.." tax ("..PaymentTax.."%)")
end)]]

RegisterNetEvent('ctrp-tow:server:11101110')
AddEventHandler('ctrp-tow:server:11101110', function(drops)
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)
    local bonus = 0
    local DropPrice = math.random(450, 700)


    --Player.Functions.AddJobReputation(1)
    Player.Functions.AddMoney("bank", DropPrice, "tow-salary")
    TriggerClientEvent('chatMessage', source, "GOVERNMENT", "warning", "You received your salary of: $"..DropPrice..".")
end)

CTRPFW.Commands.Add("npc", "Toggle npc missions", {}, false, function(source, args)
	TriggerClientEvent("jobs:client:ToggleNpc", source)
end)

CTRPFW.Commands.Add("tow", "Place a car on the back of your flatbed", {}, false, function(source, args)
    local Player = CTRPFW.Functions.GetPlayer(source)
    if Player.PlayerData.job.name == "tow" or Player.PlayerData.job.name == "mechanic" then
        TriggerClientEvent("ctrp-tow:client:TowVehicle", source)
    end
end)

CTRPFW.Commands.Add("mtow", "Place a car on the back of your flatbed", {}, false, function(source, args)
    local Player = CTRPFW.Functions.GetPlayer(source)
    if Player.PlayerData.job.name == "mechanic" then
        TriggerClientEvent("ctrp-tow:client:MecVehicle", source)
    end
end)
