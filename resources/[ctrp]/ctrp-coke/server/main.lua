-- CTRPFW = nil

-- TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)

--local hiddenprocess = vector3(-1367.92,-318.34,39.52) -- Change this to whatever location you want. This is server side to prevent people from dumping the coords

local hiddenprocess = vector3(1391.8985, 3605.8588, 38.94194)
local hiddenstart = vector3(1642.96,4846.03,45.51) -- Change this to whatever location you want. This is server side to prevent people from dumping the coords

RegisterNetEvent('coke:updateTable')
AddEventHandler('coke:updateTable', function(bool)
    TriggerClientEvent('coke:syncTable', -1, bool)
end)

CTRPFW.Functions.CreateUseableItem('coke', function(source, item)
	local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.GetItemByName(item.name) ~= nil then
 		TriggerClientEvent('coke:onUse', source)
	end
end)


CTRPFW.Functions.CreateCallback('coke:processcoords', function(source, cb)
    cb(hiddenprocess)
end)

CTRPFW.Functions.CreateCallback('coke:startcoords', function(source, cb)
    cb(hiddenstart)
end)

--[[CTRPFW.Functions.CreateCallback('coke:pay' , function(source, cb)
	local src = source
	local Player = CTRPFW.Functions.GetPlayer(src)
	local amount = Config.amount
	local cashamount = Player.PlayerData.money["cash"]
    local toamount = tonumber(amount)

	if cashamount >= amount then
		Player.Functions.RemoveMoney('cash', amount)
		Player.Functions.RemoveItem('goldbar', 1)
		TriggerClientEvent("inventory:client:ItemBox", source, CTRPFW.Shared.Items['goldbar'], "remove")
    	cb(true)
	else
		TriggerClientEvent("CTRPFW:Notify", src, "You dont have enough Money to Start", "error", 4000)
		cb(false)
	end
end)]]

    
RegisterServerEvent("coke:processed")
AddEventHandler("coke:processed", function(x,y,z)
  	local src = source
  	local Player = CTRPFW.Functions.GetPlayer(src)
	local pick = Config.randBrick

		if 	TriggerClientEvent("CTRPFW:Notify", src, "Made a Coke Bag!!", "Success", 8000) then
			Player.Functions.RemoveItem('coke_brick', 1)
			Player.Functions.RemoveItem('bakingsoda', 1)
			Player.Functions.RemoveItem('empty_bag', 1)
			Player.Functions.AddItem('cokebaggy', 10)
			TriggerClientEvent("inventory:client:ItemBox", source, CTRPFW.Shared.Items['coke_brick'], "remove")
			TriggerClientEvent("inventory:client:ItemBox", source, CTRPFW.Shared.Items['bakingsoda'], "remove")
			TriggerClientEvent("inventory:client:ItemBox", source, CTRPFW.Shared.Items['empty_bag'], "remove")
			TriggerClientEvent("inventory:client:ItemBox", source, CTRPFW.Shared.Items['cokebaggy'], "add")
		end
	end)

CTRPFW.Functions.CreateCallback('coke:process', function(source, cb)
	local src = source
	local Player = CTRPFW.Functions.GetPlayer(src)

	if Player.PlayerData.item ~= nil and next(Player.PlayerData.items) ~= nil then
		for k, v in pairs(Player.PlayerData.items) do
		    if Player.Playerdata.items[k] ~= nil then
				if Player.Playerdata.items[k].name == "coke_brick" and Player.Playerdata.items[k].name == "bakingsoda" and Player.Playerdata.items[k].name == "highqualityscales" and Player.Playerdata.items[k].name == "id_card" and Player.Playerdata.items[k].name == "empty_bag" and Player.Playerdata.items[k].name == "lighter"  then
					cb(true)
			    else
					TriggerClientEvent("CTRPFW:Notify", src, "You are missing something", "error", 10000)
					cb(false)
				end
	        end
		end
	end
end)

CTRPFW.Functions.CreateCallback('coke:itemTake', function(source, cb)
    local src = source
    local Ply = CTRPFW.Functions.GetPlayer(src)
	local amount = Config.amount
    local blackmoney = Ply.Functions.GetItemByName("blackmoney")
	local greychip = Ply.Functions.GetItemByName("greychip")
	-- local license_plate = Ply.Functions.GetItemByName("license_plate")

    if blackmoney ~= nil and greychip ~= nil and blackmoney.amount >= amount  then
        cb(true)
    else
        cb(false)
    end
end)


CTRPFW.Functions.CreateCallback('coke:ingredient', function(source, cb)
    local src = source
    local Ply = CTRPFW.Functions.GetPlayer(src)
    local coke_brick = Ply.Functions.GetItemByName("coke_brick")
	local bakingsoda = Ply.Functions.GetItemByName("bakingsoda")
	local highqualityscales = Ply.Functions.GetItemByName("highqualityscales")
	local id_card = Ply.Functions.GetItemByName("id_card")
	local emptyweedbag = Ply.Functions.GetItemByName("empty_bag")
	local lighter = Ply.Functions.GetItemByName("lighter")
    if coke_brick ~= nil and bakingsoda ~= nil and highqualityscales ~= nil and id_card ~= nil and emptyweedbag ~= nil and lighter ~= nil then
        cb(true)
    else
        cb(false)
    end
end)


--[[RegisterServerEvent("coke:paid")
AddEventHandler("coke:paid", function(x,y,z)
	local src = source
	local Player = CTRPFW.Functions.GetPlayer(src)
	local amount = Config.amount
	local cashamount = Player.PlayerData.money["bank"]
	local toamount = tonumber(amount)
	

	if cashamount >= amount then
		TriggerClientEvent("CTRPFW:Notify", src, "Yeah! Here you go", "Success", 8000) 
		Player.Functions.RemoveMoney('bank', amount)
		Player.Functions.RemoveItem('greychip', 1)
		TriggerClientEvent("inventory:client:ItemBox", source, CTRPFW.Shared.Items['greychip'], "remove")
	elseif cashamount < amount then
		Player.Functions.RemoveMoney('bank', amount)
		Player.Functions.RemoveItem('greychip', 1)
		TriggerClientEvent("inventory:client:ItemBox", source, CTRPFW.Shared.Items['greychip'], "remove")
		
	else
		TriggerClientEvent("CTRPFW:Notify", src, "You are missing something", "error", 10000)
		
	end
	
end)]]

RegisterServerEvent("coke:paid")
AddEventHandler("coke:paid", function(x,y,z)
	local src = source
	local Player = CTRPFW.Functions.GetPlayer(src)
	local amount = Config.amount
	local cashamount = Player.PlayerData.money["bank"]
	local toamount = tonumber(amount)
	local Item = Player.Functions.GetItemByName("blackmoney")
	

	if Item.amount >= amount then
		TriggerClientEvent("CTRPFW:Notify", src, "Yeah! Here you go", "Success", 8000) 
		Player.Functions.RemoveItem('blackmoney', amount)
		TriggerClientEvent("inventory:client:ItemBox", source, CTRPFW.Shared.Items['blackmoney'], "remove")
		Player.Functions.RemoveItem('greychip', 1)
		TriggerClientEvent("inventory:client:ItemBox", source, CTRPFW.Shared.Items['greychip'], "remove")

	else
		TriggerClientEvent("CTRPFW:Notify", src, "You are missing something", "error", 10000)
	end
	
end)


CTRPFW.Functions.CreateCallback('coke:pay', function(source, cb)
	local src = source
	local Player = CTRPFW.Functions.GetPlayer(src)

	if Player.PlayerData.item ~= nil and next(Player.PlayerData.items) ~= nil then
		for k, v in pairs(Player.PlayerData.items) do
		    if Player.Playerdata.items[k] ~= nil then
				if Player.Playerdata.items[k].name == "greychip" then
					cb(true)
			    else
					TriggerClientEvent("CTRPFW:Notify", src, "You are missing something", "error", 10000)
					cb(false)
				end
	        end
		end
	end
end)

RegisterServerEvent("coke:GiveItem")
AddEventHandler("coke:GiveItem", function()
  	local src = source
	local Player = CTRPFW.Functions.GetPlayer(src)
	local price = Config.price
	local brick = Config.randBrick

	local famount = Config.famount

	local fcashamount = Player.PlayerData.money["bank"]
	local toamount = tonumber(amount)

	if fcashamount >= famount then
		Player.Functions.AddMoney('cash', price)
		Player.Functions.AddItem('coke_brick', brick)
		TriggerClientEvent('inventory:client:ItemBox', src, CTRPFW.Shared.Items['coke_brick'], "add")
	elseif fcashamount < famount then
		
		Player.Functions.AddItem('coke_brick', brick)
		TriggerClientEvent('inventory:client:ItemBox', src, CTRPFW.Shared.Items['coke_brick'], "add")
	end

end)


