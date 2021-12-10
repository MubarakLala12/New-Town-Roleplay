-- CTRPFW = nil
-- TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)

local doorInfo = {}

RegisterServerEvent('ctrp-doorlock:server:setupDoors')
AddEventHandler('ctrp-doorlock:server:setupDoors', function()
	local src = source
	TriggerClientEvent("ctrp-doorlock:client:setDoors", CTRP.Doors)
end)

RegisterServerEvent('ctrp-doorlock:server:updateState')
AddEventHandler('ctrp-doorlock:server:updateState', function(doorID, state)
	local src = source
	local Player = CTRPFW.Functions.GetPlayer(src)
	
	CTRP.Doors[doorID].locked = state

	TriggerClientEvent('ctrp-doorlock:client:setState', -1, doorID, state)
end)