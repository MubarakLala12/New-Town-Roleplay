CTRPFW = nil

TriggerEvent("CTRPFW:GetObject", function(obj) CTRPFW = obj end)

-- Oxy Run

	
	
RegisterServerEvent('oxydelivery:server')
AddEventHandler('oxydelivery:server', function()
    local Player = CTRPFW.Functions.GetPlayer(source)

    if Player.Functions.RemoveMoney('cash', Config.DefaultPrice, "Oxy-run") then
		Player.Functions.RemoveItem('lotto', 1)
		TriggerClientEvent("inventory:client:ItemBox", source, CTRPFW.Shared.Items['lotto'], "remove")
        TriggerClientEvent('oxydelivery:startDealing', source)
 
    else
        TriggerClientEvent('CTRPFW:Notify', source, "You do not have enough money", "error")
    end
end)		

RegisterServerEvent('oxydelivery:receiveBigRewarditem')
AddEventHandler('oxydelivery:receiveBigRewarditem', function()
	local Player = CTRPFW.Functions.GetPlayer(source)

	Player.Functions.AddItem(Config.BigRewarditem, 1)
end)

RegisterServerEvent('oxydelivery:receiveoxy')
AddEventHandler('oxydelivery:receiveoxy', function()
	local Player = CTRPFW.Functions.GetPlayer(source)

	Player.Functions.AddMoney('cash', Config.Payment / 2)
	Player.Functions.AddItem('oxy', Config.OxyAmount)
end)

RegisterServerEvent('oxydelivery:receivemoneyyy')
AddEventHandler('oxydelivery:receivemoneyyy', function()
	local Player = CTRPFW.Functions.GetPlayer(source)

	Player.Functions.AddMoney('cash', Config.Payment)
end)

CTRPFW.Functions.CreateCallback('ctrp-oxy:server:start', function(source, cb)
    local src = source
    local Ply = CTRPFW.Functions.GetPlayer(src)
    local lotto = Ply.Functions.GetItemByName("lotto")
    if lotto ~= nil then
        cb(true)
    else
        cb(false)
    end
end)