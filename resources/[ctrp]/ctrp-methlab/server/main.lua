CTRPFW = nil
TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)

-- Code

Citizen.CreateThread(function()
    Config.CurrentLab = math.random(1, #Config.Locations["laboratories"])
    print('Lab entry has been set to location: '..Config.CurrentLab)
end)

CTRPFW.Functions.CreateCallback('ctrp-methlab:server:GetData', function(source, cb)
    local LabData = {
        CurrentLab = Config.CurrentLab
    }
    cb(LabData)
end)

CTRPFW.Functions.CreateUseableItem("labkey", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
    local LabKey = item.info.lab ~= nil and item.info.lab or 1

    TriggerClientEvent('ctrp-methlab:client:UseLabKey', source, LabKey)
end)

function GenerateRandomLab()
    local Lab = math.random(1, #Config.Locations["laboratories"])
    return Lab
end

RegisterServerEvent('ctrp-methlab:server:receiveoxy')
AddEventHandler('ctrp-methlab:server:receiveoxy', function()
	local Player = CTRPFW.Functions.GetPlayer(source)

	Player.Functions.AddItem('aluminumoxide', 1)
	TriggerClientEvent("inventory:client:ItemBox", source, CTRPFW.Shared.Items['aluminumoxide'], "add")
end)

RegisterServerEvent('ctrp-methlab:server:re:ac')
AddEventHandler('ctrp-methlab:server:re:ac', function()
	local Player = CTRPFW.Functions.GetPlayer(source)

	Player.Functions.AddItem('acetone', 1)
	TriggerClientEvent("inventory:client:ItemBox", source, CTRPFW.Shared.Items['acetone'], "add")
end)

CTRPFW.Functions.CreateCallback('ctrp-methlab:server:ingredient', function(source, cb)
    local src = source
    local Ply = CTRPFW.Functions.GetPlayer(src)
    local acetone = Ply.Functions.GetItemByName("acetone")
    local aluminumoxide = Ply.Functions.GetItemByName("aluminumoxide")
    local sodiumchloride = Ply.Functions.GetItemByName("sodiumchloride")
    if acetone ~= nil and aluminumoxide ~= nil and sodiumchloride ~= nil then
        cb(true)
    else
        cb(false)
    end
end)


RegisterServerEvent("ctrp-methlab:server:processed")
AddEventHandler("ctrp-methlab:server:processed", function(x,y,z)
  	local src = source
  	local Player = CTRPFW.Functions.GetPlayer(src)

		
	Player.Functions.RemoveItem('acetone', 1)
    Player.Functions.RemoveItem('aluminumoxide', 1)
    Player.Functions.RemoveItem('sodiumchloride', 1)
	Player.Functions.AddItem('meth_raw', 1)
	TriggerClientEvent("inventory:client:ItemBox", source, CTRPFW.Shared.Items['acetone'], "remove")
    TriggerClientEvent("inventory:client:ItemBox", source, CTRPFW.Shared.Items['aluminumoxide'], "remove")
    TriggerClientEvent("inventory:client:ItemBox", source, CTRPFW.Shared.Items['sodiumchloride'], "remove")
	TriggerClientEvent("inventory:client:ItemBox", source, CTRPFW.Shared.Items['meth_raw'], "add")
		
end)


CTRPFW.Functions.CreateCallback('ctrp-methlab:server:packing', function(source, cb)
    local src = source
    local Ply = CTRPFW.Functions.GetPlayer(src)
    local meth_raw = Ply.Functions.GetItemByName("meth_raw")
    local meth_bag = Ply.Functions.GetItemByName("empty_bag")
	local highqualityscales = Ply.Functions.GetItemByName("highqualityscales")
    local lighter = Ply.Functions.GetItemByName("lighter")
    if meth_raw ~= nil and highqualityscales ~= nil and lighter ~= nil and meth_bag ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

RegisterServerEvent("ctrp-methlab:server:packed")
AddEventHandler("ctrp-methlab:server:packed", function(x,y,z)
  	local src = source
  	local Player = CTRPFW.Functions.GetPlayer(src)

		
	Player.Functions.RemoveItem('meth_raw', 1)
    Player.Functions.RemoveItem('empty_bag', 1)

	Player.Functions.AddItem('meth_pooch', 2)
	TriggerClientEvent("inventory:client:ItemBox", source, CTRPFW.Shared.Items['meth_raw'], "remove")
    TriggerClientEvent("inventory:client:ItemBox", source, CTRPFW.Shared.Items['empty_bag'], "remove")

	TriggerClientEvent("inventory:client:ItemBox", source, CTRPFW.Shared.Items['meth_pooch'], "add")
		
end)

