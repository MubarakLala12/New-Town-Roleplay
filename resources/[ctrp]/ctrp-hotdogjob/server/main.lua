CTRPFW = nil
TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)

-- Code

local Bail = {}


RegisterServerEvent('ctrp-hotdogjob:getHotDog')
AddEventHandler('ctrp-hotdogjob:getHotDog', function()
	local src = source
	local Player = CTRPFW.Functions.GetPlayer(src)

	  if TriggerClientEvent("CTRPFW:Notify", src, "Added Hotdog", "Success", 8000) then
		  Player.Functions.AddItem('hotdog', 1) ---- change this shit 
		  TriggerClientEvent("inventory:client:ItemBox", source, CTRPFW.Shared.Items['hotdog'], "add")
	  end
end)

RegisterServerEvent('ctrp-hotdogjob:removeHotDog')
AddEventHandler('ctrp-hotdogjob:removeHotDog', function()
	local src = source
	local Player = CTRPFW.Functions.GetPlayer(src)

	  if TriggerClientEvent("CTRPFW:Notify", src, "Removed Hotdog", "Success", 8000) then
		  Player.Functions.RemoveItem('hotdog', 1) ---- change this shit 
		  TriggerClientEvent("inventory:client:ItemBox", source, CTRPFW.Shared.Items['hotdog'], "remove")
	  end
end)


CTRPFW.Functions.CreateCallback('ctrp-hotdogjob:server:HasMoney', function(source, cb)
    local Player = CTRPFW.Functions.GetPlayer(source)

    if Player.PlayerData.money.cash >= Config.Bail then
        Player.Functions.RemoveMoney('cash', Config.Bail)
        Bail[Player.PlayerData.citizenid] = true
        cb(true)
    elseif Player.PlayerData.money.bank >= Config.Bail then
        Player.Functions.RemoveMoney('bank', Config.Bail)
        Bail[Player.PlayerData.citizenid] = true
        cb(true)
    else
        Bail[Player.PlayerData.citizenid] = false
        cb(false)
    end
end)

CTRPFW.Functions.CreateCallback('ctrp-hotdogjob:server:BringBack', function(source, cb)
    local Player = CTRPFW.Functions.GetPlayer(source)

    if Bail[Player.PlayerData.citizenid] then
        Player.Functions.AddMoney('cash', Config.Bail)
        cb(true)
    else
        cb(false)
    end
end)

RegisterServerEvent('ctrp-hotdogjob:server:Sell')
AddEventHandler('ctrp-hotdogjob:server:Sell', function(Amount, Price)
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)

    Player.Functions.AddMoney('cash', tonumber(Amount * Price))
end)

local Reset = false

RegisterServerEvent('ctrp-hotdogjob:server:UpdateReputation')
AddEventHandler('ctrp-hotdogjob:server:UpdateReputation', function(quality)
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)
    local JobReputation = Player.PlayerData.metadata["jobrep"]
    
    if Reset then
        JobReputation["hotdog"] = 0
        Player.Functions.SetMetaData("jobrep", JobReputation)
        TriggerClientEvent('ctrp-hotdogjob:client:UpdateReputation', src, JobReputation)
        return
    end

    if quality == "exotic" then
        if JobReputation["hotdog"] ~= nil and JobReputation["hotdog"] + 3 > Config.MaxReputation then
            JobReputation["hotdog"] = Config.MaxReputation
            Player.Functions.SetMetaData("jobrep", JobReputation)
            TriggerClientEvent('ctrp-hotdogjob:client:UpdateReputation', src, JobReputation)
            return
        end
        if JobReputation["hotdog"] == nil then
            JobReputation["hotdog"] = 3
        else
            JobReputation["hotdog"] = JobReputation["hotdog"] + 3
        end
    elseif quality == "rare" then
        if JobReputation["hotdog"] ~= nil and JobReputation["hotdog"] + 2 > Config.MaxReputation then
            JobReputation["hotdog"] = Config.MaxReputation
            Player.Functions.SetMetaData("jobrep", JobReputation)
            TriggerClientEvent('ctrp-hotdogjob:client:UpdateReputation', src, JobReputation)
            return
        end
        if JobReputation["hotdog"] == nil then
            JobReputation["hotdog"] = 2
        else
            JobReputation["hotdog"] = JobReputation["hotdog"] + 2
        end
    elseif quality == "common" then
        if JobReputation["hotdog"] ~= nil and JobReputation["hotdog"] + 1 > Config.MaxReputation then
            JobReputation["hotdog"] = Config.MaxReputation
            Player.Functions.SetMetaData("jobrep", JobReputation)
            TriggerClientEvent('ctrp-hotdogjob:client:UpdateReputation', src, JobReputation)
            return
        end
        if JobReputation["hotdog"] == nil then
            JobReputation["hotdog"] = 1
        else
            JobReputation["hotdog"] = JobReputation["hotdog"] + 1
        end
    end
    Player.Functions.SetMetaData("jobrep", JobReputation)
    TriggerClientEvent('ctrp-hotdogjob:client:UpdateReputation', src, JobReputation)
end)


CTRPFW.Commands.Add("removestand", "", {}, false, function(source, args)
    TriggerClientEvent('ctrp-hotdogjob:staff:DeletStand', source)
end, 'admin')