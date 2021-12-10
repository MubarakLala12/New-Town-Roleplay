CTRPFW = nil
TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)

--[[local hiddenprocess = vector3(3102.27,6024.89,122.29)
local hiddenprocess2 = vector3(1109.76,-2008.09,31.05)
local hiddenprocess3 = vector3(35.34,876.73,196.51)
local hiddenprocess4 = vector3(3844.65,4444.83,0.06)]]

local hiddenprocess = vector3(-1442.0,2251.75,17.04)
local hiddenprocess2 = vector3(1109.76,-2008.09,31.05)
local hiddenprocess3 = vector3(-1390.75,4314.45,0.52)
local hiddenprocess4 = vector3(-1500.84,1575.53,104.82)

CTRPFW.Functions.CreateCallback('ctrp-mining:processcoords', function(source, cb)
    cb(hiddenprocess)
end)

CTRPFW.Functions.CreateCallback('ctrp-mining:process2coords', function(source, cb)
    cb(hiddenprocess2)
end)

CTRPFW.Functions.CreateCallback('ctrp-mining:process3coords', function(source, cb)
    cb(hiddenprocess3)
end)

CTRPFW.Functions.CreateCallback('ctrp-mining:process4coords', function(source, cb)
    cb(hiddenprocess4)
end)



RegisterServerEvent('ctrp-mining:getItemNew')
AddEventHandler('ctrp-mining:getItemNew', function()
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)
    local randomItem = Config.Items[math.random(1, #Config.Items)]
    if math.random(0, 100) <= Config.ChanceToGetItem then
        Player.Functions.AddItem(randomItem, 1)   ----chnage these to give different amounts once completed mining
        TriggerClientEvent('inventory:client:ItemBox', src, CTRPFW.Shared.Items[randomItem], 'add')
        TriggerClientEvent("CTRPFW:Notify", src, "You Broke Stone!", "Success", 8000)
        TriggerClientEvent("CTRPFW:Notify", src, "Check Inventory weight else item will not add!", "error", 8000)
    end
end)


local ItemList = {
    ["ironore"] = math.random(70, 130),
    ["silverore"] = math.random(140, 200),
    ["goldore"] = math.random(200, 350),
    ["diamond"] = math.random(500, 1000),
}

RegisterServerEvent("ctrp-mining:washing")
AddEventHandler("ctrp-mining:washing", function(x,y,z)
  	local src = source
  	local Player = CTRPFW.Functions.GetPlayer(src)
	local pick = Config.Items

		if TriggerClientEvent("CTRPFW:Notify", src, "You Washed Mine Item!", "Success", 8000) then
			Player.Functions.RemoveItem('stone', 1)
			Player.Functions.AddItem('washedstone', 1)
			TriggerClientEvent("inventory:client:ItemBox", source, CTRPFW.Shared.Items['stone'], "remove")
			TriggerClientEvent("inventory:client:ItemBox", source, CTRPFW.Shared.Items['washedstone'], "add")
		end
end)


RegisterServerEvent('ctrp-mining:sell')
AddEventHandler('ctrp-mining:sell', function()
    local src = source
    local price = 0
    local Player = CTRPFW.Functions.GetPlayer(src)
    if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then 
        for k, v in pairs(Player.PlayerData.items) do 
            if Player.PlayerData.items[k] ~= nil then 
                if ItemList[Player.PlayerData.items[k].name] ~= nil then 
                    price = price + (ItemList[Player.PlayerData.items[k].name] * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem(Player.PlayerData.items[k].name, Player.PlayerData.items[k].amount, k)
                end
            end
        end
        Player.Functions.AddMoney("cash", price, "sold-items")
        TriggerClientEvent('CTRPFW:Notify', src, "You have sold your items")
    else
        TriggerClientEvent('CTRPFW:Notify', src, "You don't have items")
    end
end)



RegisterNetEvent("ctrp-mining:remelting")
AddEventHandler("ctrp-mining:remelting", function(item, count)
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)
    local luck = math.random(1, 100)
    local itemFound = true
    local itemCount = 1

    if itemFound then
        for i = 1, itemCount, 1 do
            local randomItem = Config.MiningItems["type"]math.random(1, 2)
            local itemInfo = CTRPFW.Shared.Items[randomItem]
            if luck == 100 then
                randomItem = "diamond"
                itemInfo = CTRPFW.Shared.Items[randomItem]
                Player.Functions.RemoveItem("washedstone", 1)
                Player.Functions.AddItem(randomItem, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, itemInfo, "add")
                TriggerClientEvent("inventory:client:ItemBox", source, CTRPFW.Shared.Items['washedstone'], "remove")
			elseif luck >= 80 and luck <= 99 then
				randomItem = "goldore"
				itemInfo = CTRPFW.Shared.Items[randomItem]
                Player.Functions.RemoveItem("washedstone", 1)
                Player.Functions.AddItem(randomItem, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, itemInfo, "add")
                TriggerClientEvent("inventory:client:ItemBox", source, CTRPFW.Shared.Items['washedstone'], "remove")
			elseif luck >= 50 and luck <= 80 then
				randomItem = "silverore"
				itemInfo = CTRPFW.Shared.Items[randomItem]
                Player.Functions.RemoveItem("washedstone", 1)
                Player.Functions.AddItem(randomItem, math.random(1,2))
                TriggerClientEvent('inventory:client:ItemBox', src, itemInfo, "add")
                TriggerClientEvent("inventory:client:ItemBox", source, CTRPFW.Shared.Items['washedstone'], "remove")
			elseif luck >= 10 and luck <= 50 then
				randomItem = "ironore"
				itemInfo = CTRPFW.Shared.Items[randomItem]
                Player.Functions.RemoveItem("washedstone", 1)
                Player.Functions.AddItem(randomItem, math.random(1,3))
                TriggerClientEvent('inventory:client:ItemBox', src, itemInfo, "add")
                TriggerClientEvent("inventory:client:ItemBox", source, CTRPFW.Shared.Items['washedstone'], "remove")
            elseif luck >= 0 and luck <= 10 then
                Player.Functions.RemoveItem("washedstone", 1)
                TriggerClientEvent("inventory:client:ItemBox", source, CTRPFW.Shared.Items['washedstone'], "remove")
                TriggerClientEvent('CTRPFW:Notify', src, "कुछ नहीं मिलेगा , निकल पहली फुर्सत में" , "error", 5000)
            end
            Citizen.Wait(500)
        end
    end
end)

RegisterNetEvent("ctrp-mining:pizza")
AddEventHandler("ctrp-mining:pizza", function(item, count)
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)
    local luck1 = math.random(1, 100)
    local itemFound1 = true
    local itemCount1 = 1

    if itemFound1 then
        for i = 1, itemCount1, 1 do
            local randomItem = Config.PizzaItems["type"]math.random(1, 1)
            local itemInfo = CTRPFW.Shared.Items[randomItem]
            if luck1 >= 80 and luck1 <= 100 then
                randomItem = "greychip"
                itemInfo = CTRPFW.Shared.Items[randomItem]
               
                Player.Functions.AddItem(randomItem, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, itemInfo, "add")
               
			elseif luck1 >= 70 and luck1 <= 80 then
				randomItem = "bakingsoda"
				itemInfo = CTRPFW.Shared.Items[randomItem]
                
                Player.Functions.AddItem(randomItem, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, itemInfo, "add")
            elseif luck1 >= 60 and luck1 <= 70 then
				randomItem = "empty_bag"
				itemInfo = CTRPFW.Shared.Items[randomItem]
                
                Player.Functions.AddItem(randomItem, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, itemInfo, "add")
                
			elseif luck1 >= 50 and luck1 <= 60 then
				TriggerClientEvent('CTRPFW:Notify', src, "कुछ नहीं मिलेगा , निकल पहली फुर्सत में" , "error", 5000)

            elseif luck1 >= 30 and luck1 <= 50 then
                TriggerClientEvent('CTRPFW:Notify', src, "कुछ नहीं मिलेगा , निकल पहली फुर्सत में" , "error", 5000)
                
			elseif luck1 >= 10 and luck1 <= 30 then
				TriggerClientEvent('CTRPFW:Notify', src, "कुछ नहीं मिलेगा , निकल पहली फुर्सत में" , "error", 5000)
                
            elseif luck1 >= 0 and luck1 <= 10 then
                TriggerClientEvent('CTRPFW:Notify', src, "कुछ नहीं मिलेगा , निकल पहली फुर्सत में" , "error", 5000)
                
            end
            Citizen.Wait(500)
        end
    end
end)

RegisterNetEvent("ctrp-mining:cs")
AddEventHandler("ctrp-mining:cs", function(item, count)
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)
    local luck1 = math.random(1, 100)
    local itemFound1 = true
    local itemCount1 = 1

    if itemFound1 then
        for i = 1, itemCount1, 1 do
            local randomItem = Config.CsItem["type"]math.random(1, 1)
            local itemInfo = CTRPFW.Shared.Items[randomItem]
            if luck1 == 100 then
                randomItem = "empty_bag"
                itemInfo = CTRPFW.Shared.Items[randomItem]
               
                Player.Functions.AddItem(randomItem, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, itemInfo, "add")
               
			elseif luck1 >= 50 and luck1 <= 90 then
				randomItem = "empty_bag"
				itemInfo = CTRPFW.Shared.Items[randomItem]
                
                Player.Functions.AddItem(randomItem, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, itemInfo, "add")
            

            elseif luck1 >= 30 and luck1 <= 50 then
                TriggerClientEvent('CTRPFW:Notify', src, "You tiered bag!" , "error", 5000)
                
			elseif luck1 >= 10 and luck1 <= 30 then
				TriggerClientEvent('CTRPFW:Notify', src, "You tiered bag!" , "error", 5000)
                
            elseif luck1 >= 0 and luck1 <= 10 then
                TriggerClientEvent('CTRPFW:Notify', src, "You tiered bag!" , "error", 5000)
                
            end
            Citizen.Wait(500)
        end
    end
end)

RegisterNetEvent("ctrp-mining:taco")
AddEventHandler("ctrp-mining:taco", function(item, count)
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)
    local luck1 = math.random(1, 100)
    local itemFound1 = true
    local itemCount1 = 1

    if itemFound1 then
        for i = 1, itemCount1, 1 do
            local randomItem = Config.PizzaItems["type"]math.random(1, 1)
            local itemInfo = CTRPFW.Shared.Items[randomItem]
            if luck1 == 100 then
                randomItem = "bluechip"
                itemInfo = CTRPFW.Shared.Items[randomItem]
               
                Player.Functions.AddItem(randomItem, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, itemInfo, "add")
               
			elseif luck1 >= 90 and luck1 <= 98 then
				randomItem = "blackmoney"
                itemInfo = CTRPFW.Shared.Items[randomItem]
               
                Player.Functions.AddItem(randomItem, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, itemInfo, "add")
            elseif luck1 >= 80 and luck1 <= 90 then
				randomItem = "blackmoney"
                itemInfo = CTRPFW.Shared.Items[randomItem]
               
                Player.Functions.AddItem(randomItem, 100)
                TriggerClientEvent('inventory:client:ItemBox', src, itemInfo, "add")
			elseif luck1 >= 50 and luck1 <= 80 then
				TriggerClientEvent('CTRPFW:Notify', src, "कुछ नहीं मिलेगा , निकल पहली फुर्सत में" , "error", 5000)

            elseif luck1 >= 30 and luck1 <= 50 then
                TriggerClientEvent('CTRPFW:Notify', src, "कुछ नहीं मिलेगा , निकल पहली फुर्सत में" , "error", 5000)
                
			elseif luck1 >= 10 and luck1 <= 30 then
				TriggerClientEvent('CTRPFW:Notify', src, "कुछ नहीं मिलेगा , निकल पहली फुर्सत में" , "error", 5000)
                
            elseif luck1 >= 0 and luck1 <= 10 then
                TriggerClientEvent('CTRPFW:Notify', src, "कुछ नहीं मिलेगा , निकल पहली फुर्सत में" , "error", 5000)
                
            end
            Citizen.Wait(500)
        end
    end
end)



