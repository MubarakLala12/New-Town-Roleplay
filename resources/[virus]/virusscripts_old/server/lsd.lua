CTRPFW = nil

TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)

local playersProcessingMushroom = {}

RegisterServerEvent('virus-lsdmushroom:pickedMushroom')
AddEventHandler('virus-lsdmushroom:pickedMushroom', function()
	local src = source
	local Player = CTRPFW.Functions.GetPlayer(src)

	  if TriggerClientEvent("CTRPFW:Notify", src, "Picked up mushroom!!", "Success", 8000) then
		  Player.Functions.AddItem('mushroom', 1) ---- change this shit 
		  TriggerClientEvent("inventory:client:ItemBox", source, CTRPFW.Shared.Items['mushroom'], "add")
	  end
  end)



RegisterServerEvent('virus-lsdmushroom:processMushroom')
AddEventHandler('virus-lsdmushroom:processMushroom', function()
		local src = source
    	local Player = CTRPFW.Functions.GetPlayer(src)

		Player.Functions.RemoveItem('mushroom', 1)----change this
		Player.Functions.RemoveItem('sodiumoxide', 1)----change this
		Player.Functions.RemoveItem('aspirine', 1)-----change this
        Player.Functions.RemoveItem('gbottle', 1)-----change this

        Player.Functions.AddItem('pmushroom', 1)-----change this
        Player.Functions.AddItem('vacid', 1)-----change this

		TriggerClientEvent("inventory:client:ItemBox", source, CTRPFW.Shared.Items['mushroom'], "remove")
		TriggerClientEvent("inventory:client:ItemBox", source, CTRPFW.Shared.Items['sodiumoxide'], "remove")
        TriggerClientEvent("inventory:client:ItemBox", source, CTRPFW.Shared.Items['aspirine'], "remove")
        TriggerClientEvent("inventory:client:ItemBox", source, CTRPFW.Shared.Items['gbottle'], "remove")

		TriggerClientEvent("inventory:client:ItemBox", source, CTRPFW.Shared.Items['pmushroom'], "add")
        TriggerClientEvent("inventory:client:ItemBox", source, CTRPFW.Shared.Items['vacid'], "add")
		TriggerClientEvent('CTRPFW:Notify', src, 'mushroom_processed', "success")                                                                         				
end)



function CancelProcessing(playerId)
	if playersProcessingMushroom[playerId] then
		ClearTimeout(playersProcessingMushroom[playerId])
		playersProcessingMushroom[playerId] = nil
	end
end

RegisterServerEvent('virus-lsdmushroom:cancelProcessing')
AddEventHandler('virus-lsdmushroom:cancelProcessing', function()
	CancelProcessing(source)
end)

AddEventHandler('virus-lsdmushroom:playerDropped', function(playerId, reason)
	CancelProcessing(playerId)
end)

RegisterServerEvent('virus-lsdmushroom:onPlayerDeath')
AddEventHandler('virus-lsdmushroom:onPlayerDeath', function(data)
	local src = source
	CancelProcessing(src)
end)


CTRPFW.Functions.CreateCallback('mushroom:ingredient', function(source, cb)
    local src = source
    local Ply = CTRPFW.Functions.GetPlayer(src)
    local mushroom = Ply.Functions.GetItemByName("mushroom")
	local sodiumoxide = Ply.Functions.GetItemByName("sodiumoxide")
	local aspirine = Ply.Functions.GetItemByName("aspirine")
    local gbottle = Ply.Functions.GetItemByName("gbottle")

    if mushroom ~= nil and sodiumoxide ~= nil and aspirine ~= nil and gbottle ~= nil then
        cb(true)
    else
        cb(false)
    end
end)


