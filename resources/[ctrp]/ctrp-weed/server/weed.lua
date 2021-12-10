CTRPFW = nil

TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)

local playersProcessingCannabis = {}

RegisterServerEvent('ctrp-weed:pickedUpCannabis')
AddEventHandler('ctrp-weed:pickedUpCannabis', function()
	local src = source
	local Player = CTRPFW.Functions.GetPlayer(src)

	  if TriggerClientEvent("CTRPFW:Notify", src, "Picked up some Cannabis!!", "Success", 8000) then
		  Player.Functions.AddItem('cannabis', 1) ---- change this shit 
		  TriggerClientEvent("inventory:client:ItemBox", source, CTRPFW.Shared.Items['cannabis'], "add")
	  end
  end)



RegisterServerEvent('ctrp-weed:processCannabis')
AddEventHandler('ctrp-weed:processCannabis', function()
		local src = source
    	local Player = CTRPFW.Functions.GetPlayer(src)

		Player.Functions.RemoveItem('cannabis', 1)----change this
		Player.Functions.RemoveItem('empty_weed_bag', 1)----change this
		Player.Functions.AddItem('weed_2og', 4)-----change this
		TriggerClientEvent("inventory:client:ItemBox", source, CTRPFW.Shared.Items['cannabis'], "remove")
		TriggerClientEvent("inventory:client:ItemBox", source, CTRPFW.Shared.Items['empty_weed_bag'], "remove")
		TriggerClientEvent("inventory:client:ItemBox", source, CTRPFW.Shared.Items['weed_2og'], "add")
		TriggerClientEvent('CTRPFW:Notify', src, 'weed_processed', "success")                                                                         				
end)



function CancelProcessing(playerId)
	if playersProcessingCannabis[playerId] then
		ClearTimeout(playersProcessingCannabis[playerId])
		playersProcessingCannabis[playerId] = nil
	end
end

RegisterServerEvent('ctrp-weed:cancelProcessing')
AddEventHandler('ctrp-weed:cancelProcessing', function()
	CancelProcessing(source)
end)

AddEventHandler('ctrp-weed:playerDropped', function(playerId, reason)
	CancelProcessing(playerId)
end)

RegisterServerEvent('ctrp-weed:onPlayerDeath')
AddEventHandler('ctrp-weed:onPlayerDeath', function(data)
	local src = source
	CancelProcessing(src)
end)

CTRPFW.Functions.CreateCallback('weed:process', function(source, cb)
	local src = source
	local Player = CTRPFW.Functions.GetPlayer(src)
	 
	if Player.PlayerData.item ~= nil and next(Player.PlayerData.items) ~= nil then
		for k, v in pairs(Player.PlayerData.items) do
		    if Player.Playerdata.items[k] ~= nil then
				if Player.Playerdata.items[k].name == "cannabis" and Player.Playerdata.items[k].name == "empty_weed_bag" and Player.Playerdata.items[k].name == "drugscales" then
					cb(true)
			    else
					TriggerClientEvent("CTRPFW:Notify", src, "You missing something", "error", 10000)
					cb(false)
				end
	        end
		end	
	end
end)

CTRPFW.Functions.CreateCallback('weed:ingredient', function(source, cb)
    local src = source
    local Ply = CTRPFW.Functions.GetPlayer(src)
    local cannabis = Ply.Functions.GetItemByName("cannabis")
	local empty_weed_bag = Ply.Functions.GetItemByName("empty_weed_bag")
	local drugscales = Ply.Functions.GetItemByName("drugscales")
    local lighter = Ply.Functions.GetItemByName("lighter")
    if cannabis ~= nil and empty_weed_bag ~= nil and drugscales ~= nil and lighter ~= nil then
        cb(true)
    else
        cb(false)
    end
end)


CTRPFW.Functions.CreateCallback('weed:ingredient2', function(source, cb)
    local src = source
	local Ply = CTRPFW.Functions.GetPlayer(src)

	local weed_2og = Ply.Functions.GetItemByName("weed_2og")

	
	if weed_2og ~=nil then
        cb(true)
    else
        cb(false)
    end
end)


local process = {
    ["weed_2og"] = 2,
}

RegisterServerEvent("ctrp-weed:server:process")
AddEventHandler("ctrp-weed:server:process", function()
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)
    local weed = 0
    if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then 
        for k, v in pairs(Player.PlayerData.items) do 
            if Player.PlayerData.items[k] ~= nil then 
                if process[Player.PlayerData.items[k].name] ~= nil then 
                    local amount = (Player.PlayerData.items[k].amount / process[Player.PlayerData.items[k].name])
                    if amount < 1 then
                        TriggerClientEvent('CTRPFW:Notify', src, "You dont have enough " .. Player.PlayerData.items[k].label, "error")
                    else
                        amount = math.ceil(Player.PlayerData.items[k].amount / process[Player.PlayerData.items[k].name])
                        if amount > 0 then
                            --if Player.Functions.RemoveItem(Player.PlayerData.items[k].name, Player.PlayerData.items[k].amount, k) then
								--weed = weed + amount
								Player.Functions.RemoveItem('weed_2og', 2)----change this
								Player.Functions.AddItem('weed_4og', 1)----change this
							
								TriggerClientEvent("inventory:client:ItemBox", source, CTRPFW.Shared.Items['weed_2og'], "remove")

								TriggerClientEvent("inventory:client:ItemBox", source, CTRPFW.Shared.Items['weed_4og'], "add")
								TriggerClientEvent('CTRPFW:Notify', src, 'weed_processed', "success")      
                            --end
                        end
                    end
                end
            end
        end
       
    end
end)


RegisterNetEvent("ctrp-weed:weed")
AddEventHandler("ctrp-weed:weed", function(item, count)
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)
    local luckseed = math.random(1, 100)
    local itemFound = true
    local itemCount = 1

    if itemFound then
        for i = 1, itemCount, 1 do
            local randomItem = Config.weedItems["type"]math.random(1, 2)
            local itemInfo = CTRPFW.Shared.Items[randomItem]
            if luckseed == 100 then
                randomItem = "weed_ak47_seed"
                itemInfo = CTRPFW.Shared.Items[randomItem]
               
                Player.Functions.AddItem(randomItem, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, itemInfo, "add")
                
			elseif luckseed >= 80 and luckseed <= 90 then
				randomItem = "weed_purple-haze_seed"
				itemInfo = CTRPFW.Shared.Items[randomItem]
                
                Player.Functions.AddItem(randomItem, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, itemInfo, "add")
                
			elseif luckseed >= 50 and luckseed <= 80 then
				randomItem = "weed_amnesia_seed"
				itemInfo = CTRPFW.Shared.Items[randomItem]
                
                Player.Functions.AddItem(randomItem, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, itemInfo, "add")
                
			elseif luckseed >= 30 and luckseed <= 50 then
				randomItem = "weed_og-kush_seed"
				itemInfo = CTRPFW.Shared.Items[randomItem]
                
				Player.Functions.AddItem(randomItem, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, itemInfo, "add")
                
            elseif luckseed >= 0 and luckseed <= 30 then
                TriggerClientEvent("CTRPFW:Notify", src, "अजी तन मेरा", "error", 5000)
                
                
            end
            Citizen.Wait(500)
		end
    end
end)
