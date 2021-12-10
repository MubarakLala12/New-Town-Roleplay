CTRPFW = nil

TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)

local playersProcessingWeed = {}

RegisterServerEvent('virus-underwaterweed:pickedUpWeed')
AddEventHandler('virus-underwaterweed:pickedUpWeed', function()
	local src = source
	local Player = CTRPFW.Functions.GetPlayer(src)

	  if TriggerClientEvent("CTRPFW:Notify", src, "Picked up some Weed!!", "Success", 8000) then
		  Player.Functions.AddItem('skunk', 1) ---- change this shit 
		  TriggerClientEvent("inventory:client:ItemBox", source, CTRPFW.Shared.Items['skunk'], "add")
	  end
  end)



RegisterServerEvent('virus-underwaterweed:processWeed')
AddEventHandler('virus-underwaterweed:processWeed', function()
		local src = source
    	local Player = CTRPFW.Functions.GetPlayer(src)

		Player.Functions.RemoveItem('skunk', 1)----change this
		Player.Functions.RemoveItem('empty_weed_bag', 1)----change this
		Player.Functions.AddItem('weed_skunk', 2)-----change this
		TriggerClientEvent("inventory:client:ItemBox", source, CTRPFW.Shared.Items['skunk'], "remove")
		TriggerClientEvent("inventory:client:ItemBox", source, CTRPFW.Shared.Items['empty_weed_bag'], "remove")
		TriggerClientEvent("inventory:client:ItemBox", source, CTRPFW.Shared.Items['weed_skunk'], "add")
		TriggerClientEvent('CTRPFW:Notify', src, 'weed_processed', "success")                                                                         				
end)



function CancelProcessing(playerId)
	if playersProcessingWeed[playerId] then
		ClearTimeout(playersProcessingWeed[playerId])
		playersProcessingWeed[playerId] = nil
	end
end

RegisterServerEvent('virus-underwaterweed:cancelProcessing')
AddEventHandler('virus-underwaterweed:cancelProcessing', function()
	CancelProcessing(source)
end)

AddEventHandler('virus-underwaterweed:playerDropped', function(playerId, reason)
	CancelProcessing(playerId)
end)

RegisterServerEvent('virus-underwaterweed:onPlayerDeath')
AddEventHandler('virus-underwaterweed:onPlayerDeath', function(data)
	local src = source
	CancelProcessing(src)
end)

CTRPFW.Functions.CreateCallback('virus-underwaterweed:process', function(source, cb)
	local src = source
	local Player = CTRPFW.Functions.GetPlayer(src)
	 
	if Player.PlayerData.item ~= nil and next(Player.PlayerData.items) ~= nil then
		for k, v in pairs(Player.PlayerData.items) do
		    if Player.Playerdata.items[k] ~= nil then
				if Player.Playerdata.items[k].name == "skunk" and Player.Playerdata.items[k].name == "empty_weed_bag" and Player.Playerdata.items[k].name == "drugscales" then
					cb(true)
			    else
					TriggerClientEvent("CTRPFW:Notify", src, "You missing something", "error", 10000)
					cb(false)
				end
	        end
		end	
	end
end)

CTRPFW.Functions.CreateCallback('virus-underwaterweed:ingredient', function(source, cb)
    local src = source
    local Ply = CTRPFW.Functions.GetPlayer(src)
    local skunk = Ply.Functions.GetItemByName("skunk")
	local empty_weed_bag = Ply.Functions.GetItemByName("empty_weed_bag")
	local drugscales = Ply.Functions.GetItemByName("drugscales")
	local lighter = Ply.Functions.GetItemByName("lighter")
    if skunk ~= nil and empty_weed_bag ~= nil and drugscales ~= nil and lighter ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

