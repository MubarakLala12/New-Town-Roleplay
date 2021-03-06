CTRPFW = nil
TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)

-- Code

Citizen.CreateThread(function()
    CTRPFW.Functions.ExecuteSql(false, "SELECT * FROM `moneysafepolice`", function(safes)
        if safes[1] ~= nil then
            for _, d in pairs(safes) do
                for safe, s in pairs(Config.Safes) do
                    if d.safe == safe then
                        Config.Safes[safe].money = d.money
                        d.transactions = json.decode(d.transactions)
                        if d.transactions ~= nil and next(d.transactions) ~= nil then
                            Config.Safes[safe].transactions = d.transactions
                        end
                        TriggerClientEvent('ctrp-moneysafepolice:client:UpdateSafe', -1, Config.Safes[safe], safe)
                    end
                end
            end
        end
    end)
end)

CTRPFW.Commands.Add("add", "Put money in the safe", {}, false, function(source, args)
    local Player = CTRPFW.Functions.GetPlayer(source)
    local amount = tonumber(args[1]) or 0
    if Player.PlayerData.job.name == "police" and Player.PlayerData.job.gradelabel == "Chief" then
        TriggerClientEvent('ctrp-moneysafepolice:client:DepositMoney', source, amount)
    else 
        TriggerClientEvent('CTRPFW:Notify', source, "You are not High Rank Officer", "error")
    end
end)

CTRPFW.Commands.Add("with", "Take money out of safe", {}, false, function(source, args)
    local Player = CTRPFW.Functions.GetPlayer(source)
    local amount = tonumber(args[1]) or 0
    if Player.PlayerData.job.name == "police" and Player.PlayerData.job.gradelabel == "Chief" then
        TriggerClientEvent('ctrp-moneysafepolice:client:WithdrawMoney', source, amount)
    else
        TriggerClientEvent('CTRPFW:Notify', source, "You are not High Rank Officer", "error")
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

RegisterServerEvent('ctrp-moneysafepolice:server:DepositMoney')
AddEventHandler('ctrp-moneysafepolice:server:DepositMoney', function(safe, amount, sender)
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)

    if Player.PlayerData.money.bank >= amount then
        Player.Functions.RemoveMoney('bank', amount)
    elseif Player.PlayerData.money.cash >= amount then
        Player.Functions.RemoveMoney('cash', amount)
    else
        TriggerClientEvent('CTRPFW:Notify', src, "You don\'t have enough money", "error")
        return
    end
    if sender == nil then
        AddTransaction(safe, "deposit", amount, Player, false)
    else
        AddTransaction(safe, "deposit", amount, {}, true)
    end
    CTRPFW.Functions.ExecuteSql(false, "SELECT * FROM `moneysafepolice` WHERE `safe` = '"..safe.."'", function(result)
        if result[1] ~= nil then
            Config.Safes[safe].money = (Config.Safes[safe].money + amount)
            CTRPFW.Functions.ExecuteSql(false, "UPDATE `moneysafepolice` SET money = '"..Config.Safes[safe].money.."', transactions = '"..json.encode(Config.Safes[safe].transactions).."' WHERE `safe` = '"..safe.."'")
        else
            Config.Safes[safe].money = amount
            CTRPFW.Functions.ExecuteSql(false, "INSERT INTO `moneysafepolice` (`safe`, `money`, `transactions`) VALUES ('"..safe.."', '"..Config.Safes[safe].money.."', '"..json.encode(Config.Safes[safe].transactions).."')")
        end
        TriggerClientEvent('ctrp-moneysafepolice:client:UpdateSafe', -1, Config.Safes[safe], safe)
        TriggerClientEvent('CTRPFW:Notify', src, "You have put $"..amount.."- in the police safe", "success")
    end)
end)

RegisterServerEvent('ctrp-moneysafepolice:server:WithdrawMoney')
AddEventHandler('ctrp-moneysafepolice:server:WithdrawMoney', function(safe, amount)
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)

    if (Config.Safes[safe].money - amount) >= 0 then
        AddTransaction(safe, "withdraw", amount, Player, false)
        Config.Safes[safe].money = (Config.Safes[safe].money - amount)
        CTRPFW.Functions.ExecuteSql(false, "UPDATE `moneysafepolice` SET money = '"..Config.Safes[safe].money.."', transactions = '"..json.encode(Config.Safes[safe].transactions).."' WHERE `safe` = '"..safe.."'")
        TriggerClientEvent('ctrp-moneysafepolice:client:UpdateSafe', -1, Config.Safes[safe], safe)
        TriggerClientEvent('CTRPFW:Notify', src, "You took $"..amount.."- out of the safe", "success")
        Player.Functions.AddMoney('cash', amount)
    else
        TriggerClientEvent('CTRPFW:Notify', src, "There is not enough money in the safe.", "error")
    end
end)
