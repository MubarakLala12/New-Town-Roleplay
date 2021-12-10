CTRPFW = nil
TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)

-- Code

Citizen.CreateThread(function()
    CTRPFW.Functions.ExecuteSql(false, "SELECT * FROM `moneysafesedm`", function(safes)
        if safes[1] ~= nil then
            for _, d in pairs(safes) do
                for safe, s in pairs(Config.Safes) do
                    if d.safe == safe then
                        Config.Safes[safe].money = d.money
                        d.transactions = json.decode(d.transactions)
                        if d.transactions ~= nil and next(d.transactions) ~= nil then
                            Config.Safes[safe].transactions = d.transactions
                        end
                        TriggerClientEvent('ctrp-moneysafesedm:client:UpdateSafe', -1, Config.Safes[safe], safe)
                    end
                end
            end
        end
    end)
end)

CTRPFW.Commands.Add("edmdeposit", "Put money in the safe", {}, false, function(source, args)
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(source)
    local amount = tonumber(args[1]) or 0

    if Player.PlayerData.job.name == "edm" and Player.PlayerData.job.gradelabel == "Owner" then
        TriggerClientEvent('ctrp-moneysafesedm:client:DepositMoney', source, amount)
    else
        TriggerClientEvent('chatMessage', src, "SYSTEM", "error", "You are not authorised!")
    end
end)

CTRPFW.Commands.Add("edmwithdraw", "Take money out of safe", {}, false, function(source, args)
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(source)
    local amount = tonumber(args[1]) or 0

    if Player.PlayerData.job.name == "edm" and Player.PlayerData.job.gradelabel == "Owner" then
        TriggerClientEvent('ctrp-moneysafesedm:client:WithdrawMoney', source, amount)
    else
        TriggerClientEvent('chatMessage', src, "SYSTEM", "error", "You are not authorised!")
    end
end)

function AddTransaction(safe, type, amount, Player, Automated)
    local cid = nil
    local name = nil
    local _source = nil
    if not Automated then
        local src = source
        local Player = CTRPFW.Functions.GetPlayer(src)
        cid = Player.PlayerData.citizenid
        name = Player.PlayerData.name
        _source = Player.PlayerData.source
    else
        cid = "ctrp"
        name = "car\'s"
        _source = "Automatic"
    end
    table.insert(Config.Safes[safe].transactions, {
        type = type,
        amount = amount,
        safe = safe,
        citizenid = cid,
    })
    TriggerEvent("ctrp-log:server:sendLog", cid, type, {safe = safe, type = type, amount = amount, citizenid = cid})
    local label = "Withdrawed out"
    local color = "red"
    if type == "deposit" then
        label = "Deposited in"
        color = "green"
    end
	TriggerEvent("ctrp-log:server:CreateLog", "moneysafes", type, color, "**" .. name .. "** (citizenid: *" .. cid .. "* | id: *(" .. _source .. ")* has **$" .. amount .. "** " .. label .. " the **" .. safe .. "** safe.")
end

RegisterServerEvent('ctrp-moneysafesedm:server:DepositMoney')
AddEventHandler('ctrp-moneysafesedm:server:DepositMoney', function(safe, amount, sender)
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)

    if Player.PlayerData.money.cash >= amount then
        Player.Functions.RemoveMoney('cash', amount)
    elseif Player.PlayerData.money.bank >= amount then
        Player.Functions.RemoveMoney('bank', amount)
    else
        TriggerClientEvent('CTRPFW:Notify', src, "You don\'t have enough cash", "error")
        return
    end
    if sender == nil then
        AddTransaction(safe, "deposit", amount, Player, false)
    else
        AddTransaction(safe, "deposit", amount, {}, true)
    end
    CTRPFW.Functions.ExecuteSql(false, "SELECT * FROM `moneysafesedm` WHERE `safe` = '"..safe.."'", function(result)
        if result[1] ~= nil then
            Config.Safes[safe].money = (Config.Safes[safe].money + amount)
            CTRPFW.Functions.ExecuteSql(false, "UPDATE `moneysafesedm` SET money = '"..Config.Safes[safe].money.."', transactions = '"..json.encode(Config.Safes[safe].transactions).."' WHERE `safe` = '"..safe.."'")
        else
            Config.Safes[safe].money = amount
            CTRPFW.Functions.ExecuteSql(false, "INSERT INTO `moneysafesedm` (`safe`, `money`, `transactions`) VALUES ('"..safe.."', '"..Config.Safes[safe].money.."', '"..json.encode(Config.Safes[safe].transactions).."')")
        end
        TriggerClientEvent('ctrp-moneysafesedm:client:UpdateSafe', -1, Config.Safes[safe], safe)
        TriggerClientEvent('CTRPFW:Notify', src, "You have put $"..amount.."- in the safe", "success")
    end)
end)

RegisterServerEvent('ctrp-moneysafesedm:server:WithdrawMoney')
AddEventHandler('ctrp-moneysafesedm:server:WithdrawMoney', function(safe, amount)
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)

    if (Config.Safes[safe].money - amount) >= 0 then
        AddTransaction(safe, "withdraw", amount, Player, false)
        Config.Safes[safe].money = (Config.Safes[safe].money - amount)
        CTRPFW.Functions.ExecuteSql(false, "UPDATE `moneysafesedm` SET money = '"..Config.Safes[safe].money.."', transactions = '"..json.encode(Config.Safes[safe].transactions).."' WHERE `safe` = '"..safe.."'")
        TriggerClientEvent('ctrp-moneysafesedm:client:UpdateSafe', -1, Config.Safes[safe], safe)
        TriggerClientEvent('CTRPFW:Notify', src, "You took $"..amount.."- out of the safe", "success")
        Player.Functions.AddMoney('cash', amount)
    else
        TriggerClientEvent('CTRPFW:Notify', src, "There is not enough money in the safe.", "error")
    end
end)
