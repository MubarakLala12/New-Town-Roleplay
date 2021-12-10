-- CTRPFW Command Events
RegisterNetEvent('CTRPFW:Command:TeleportToPlayer')
AddEventHandler('CTRPFW:Command:TeleportToPlayer', function(othersource)
	local coords = CTRPFW.Functions.GetCoords(GetPlayerPed(GetPlayerFromServerId(othersource)))
	local entity = GetPlayerPed(-1)
	if IsPedInAnyVehicle(Entity, false) then
		entity = GetVehiclePedIsUsing(entity)
	end
	SetEntityCoords(entity, coords.x, coords.y, coords.z)
	SetEntityHeading(entity, coords.a)
end)

RegisterNetEvent('CTRPFW:Command:TeleportToPlayer')
AddEventHandler('CTRPFW:Command:TeleportToPlayer', function(othersource)
    local coords = CTRPFW.Functions.GetCoords(GetPlayerPed(GetPlayerFromServerId(othersource)))
    local entity = GetPlayerPed(-1)
    if IsPedInAnyVehicle(entity, false) then
        entity = GetVehiclePedIsUsing(entity)
    end
    SetEntityCoords(entity, coords.x, coords.y, coords.z)
    SetEntityHeading(entity, coords.a)
end)

RegisterNetEvent('CTRPFW:Command:TeleportToCoords')
AddEventHandler('CTRPFW:Command:TeleportToCoords', function(x, y, z)
    local entity = GetPlayerPed(-1)
    if IsPedInAnyVehicle(entity, false) then
        entity = GetVehiclePedIsUsing(entity)
    end
    SetEntityCoords(entity, x, y, z)
end)

RegisterNetEvent('CTRPFW:Command:SpawnVehicle')
AddEventHandler('CTRPFW:Command:SpawnVehicle', function(model)
	CTRPFW.Functions.SpawnVehicle(model, function(vehicle)
		TaskWarpPedIntoVehicle(GetPlayerPed(-1), vehicle, -1)
		TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(vehicle))
	end)
end)

RegisterNetEvent('CTRPFW:Command:DeleteVehicle')
AddEventHandler('CTRPFW:Command:DeleteVehicle', function()
	local vehicle = CTRPFW.Functions.GetClosestVehicle()
	if IsPedInAnyVehicle(GetPlayerPed(-1)) then vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false) else vehicle = CTRPFW.Functions.GetClosestVehicle() end
	-- TriggerServerEvent('CTRPFW:Command:CheckOwnedVehicle', GetVehicleNumberPlateText(vehicle))
	CTRPFW.Functions.DeleteVehicle(vehicle)
end)

RegisterNetEvent('CTRPFW:Command:Revive')
AddEventHandler('CTRPFW:Command:Revive', function()
	local coords = CTRPFW.Functions.GetCoords(GetPlayerPed(-1))
	NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z+0.2, coords.a, true, false)
	SetPlayerInvincible(GetPlayerPed(-1), false)
	ClearPedBloodDamage(GetPlayerPed(-1))
end)

RegisterNetEvent('CTRPFW:Command:GoToMarker')
AddEventHandler('CTRPFW:Command:GoToMarker', function()
	Citizen.CreateThread(function()
		local entity = PlayerPedId()
		if IsPedInAnyVehicle(entity, false) then
			entity = GetVehiclePedIsUsing(entity)
		end
		local success = false
		local blipFound = false
		local blipIterator = GetBlipInfoIdIterator()
		local blip = GetFirstBlipInfoId(8)

		while DoesBlipExist(blip) do
			if GetBlipInfoIdType(blip) == 4 then
				cx, cy, cz = table.unpack(Citizen.InvokeNative(0xFA7C7F0AADF25D09, blip, Citizen.ReturnResultAnyway(), Citizen.ResultAsVector())) --GetBlipInfoIdCoord(blip)
				blipFound = true
				break
			end
			blip = GetNextBlipInfoId(blipIterator)
		end

		if blipFound then
			DoScreenFadeOut(250)
			while IsScreenFadedOut() do
				Citizen.Wait(250)
			end
			local groundFound = false
			local yaw = GetEntityHeading(entity)
			
			for i = 0, 1000, 1 do
				SetEntityCoordsNoOffset(entity, cx, cy, ToFloat(i), false, false, false)
				SetEntityRotation(entity, 0, 0, 0, 0 ,0)
				SetEntityHeading(entity, yaw)
				SetGameplayCamRelativeHeading(0)
				Citizen.Wait(0)
				--groundFound = true
				if GetGroundZFor_3dCoord(cx, cy, ToFloat(i), cz, false) then --GetGroundZFor3dCoord(cx, cy, i, 0, 0) GetGroundZFor_3dCoord(cx, cy, i)
					cz = ToFloat(i)
					groundFound = true
					break
				end
			end
			if not groundFound then
				cz = -300.0
			end
			success = true
		end

		if success then
			SetEntityCoordsNoOffset(entity, cx, cy, cz, false, false, true)
			SetGameplayCamRelativeHeading(0)
			if IsPedSittingInAnyVehicle(PlayerPedId()) then
				if GetPedInVehicleSeat(GetVehiclePedIsUsing(PlayerPedId()), -1) == PlayerPedId() then
					SetVehicleOnGroundProperly(GetVehiclePedIsUsing(PlayerPedId()))
				end
			end
			--HideLoadingPromt()
			DoScreenFadeIn(250)
		end
	end)
end)

-- Other stuff
RegisterNetEvent('CTRPFW:Player:SetPlayerData')
AddEventHandler('CTRPFW:Player:SetPlayerData', function(val)
	CTRPFW.PlayerData = val
end)

RegisterNetEvent('CTRPFW:Player:UpdatePlayerData')
AddEventHandler('CTRPFW:Player:UpdatePlayerData', function()
	local data = {}
	data.position = CTRPFW.Functions.GetCoords(GetPlayerPed(-1))
	TriggerServerEvent('CTRPFW:UpdatePlayer', data)
end)

RegisterNetEvent('CTRPFW:Player:UpdatePlayerPosition')
AddEventHandler('CTRPFW:Player:UpdatePlayerPosition', function()
	local position = CTRPFW.Functions.GetCoords(GetPlayerPed(-1))
	TriggerServerEvent('CTRPFW:UpdatePlayerPosition', position)
end)

--[[RegisterNetEvent('CTRPFW:Client:LocalOutOfCharacter')
AddEventHandler('CTRPFW:Client:LocalOutOfCharacter', function(playerId, playerName, message)
	local sourcePos = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(playerId)), false)
    local pos = GetEntityCoords(GetPlayerPed(-1), false)
    if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, sourcePos.x, sourcePos.y, sourcePos.z, true) < 20.0) then
		TriggerEvent("chatMessage", "OOC " .. playerName, "normal", message)
    end
end)]]

RegisterNetEvent('CTRPFW:Client:LocalOutOfCharacter')
AddEventHandler('CTRPFW:Client:LocalOutOfCharacter', function(playerId, playerName, message)
	local sourcePos = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(playerId)), false)
    local pos = GetEntityCoords(GetPlayerPed(-1), false)
    if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, sourcePos.x, sourcePos.y, sourcePos.z, true) < 50.0) then
		TriggerEvent("chatMessage", "OOC LOCAL " .. playerName, "normal", message)
    end
end)

RegisterNetEvent('CTRPFW:Client:OutOfCharacter')
AddEventHandler('CTRPFW:Client:OutOfCharacter', function(playerId, playerName, message)
	local sourcePos = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(playerId)), false)
    local pos = GetEntityCoords(GetPlayerPed(-1), false)
    if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, sourcePos.x, sourcePos.y, sourcePos.z, true)) then
		TriggerEvent("chatMessage", "OOC " .. playerName, "normal", message)
    end
end)

RegisterNetEvent('CTRPFW:Notify')
AddEventHandler('CTRPFW:Notify', function(text, type, length)
	CTRPFW.Functions.Notify(text, type, length)
end)

RegisterNetEvent('CTRPFW:Client:TriggerCallback')
AddEventHandler('CTRPFW:Client:TriggerCallback', function(name, ...)
	if CTRPFW.ServerCallbacks[name] ~= nil then
		CTRPFW.ServerCallbacks[name](...)
		CTRPFW.ServerCallbacks[name] = nil
	end
end)

RegisterNetEvent("CTRPFW:Client:UseItem")
AddEventHandler('CTRPFW:Client:UseItem', function(item)
	TriggerServerEvent("CTRPFW:Server:UseItem", item)
end)