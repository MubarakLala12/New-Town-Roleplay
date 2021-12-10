-- CTRPFW = nil

-- Citizen.CreateThread(function()
-- 	while CTRPFW == nil do
-- 		TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)
-- 		Citizen.Wait(0)
-- 	end
-- end)

local closestDoorKey, closestDoorValue = nil, nil
local maxDistance = 1.25

RegisterNetEvent('ctrp-doorlock:client:setState')
AddEventHandler('ctrp-doorlock:client:setState', function(doorID, state)
	CTRP.Doors[doorID].locked = state
end)

RegisterNetEvent('ctrp-doorlock:client:setDoors')
AddEventHandler('ctrp-doorlock:client:setDoors', function(doorList)
	CTRP.Doors = doorList
end)

RegisterNetEvent('CTRPFW:Client:OnPlayerLoaded')
AddEventHandler('CTRPFW:Client:OnPlayerLoaded', function()
    TriggerServerEvent("ctrp-doorlock:server:setupDoors")
end)

RegisterNetEvent('lockpicks:UseLockpick')
AddEventHandler('lockpicks:UseLockpick', function()
	local ped = PlayerPedId()
	local pos = GetEntityCoords(ped)
	CTRPFW.Functions.TriggerCallback('ctrp-radio:server:GetItem', function(hasItem)
		for k, v in pairs(CTRP.Doors) do
			local dist = GetDistanceBetweenCoords(pos, CTRP.Doors[k].textCoords.x, CTRP.Doors[k].textCoords.y, CTRP.Doors[k].textCoords.z)
			if dist < 1.5 then
				if CTRP.Doors[k].pickable then
					if CTRP.Doors[k].locked then
						if hasItem then
							closestDoorKey, closestDoorValue = k, v
							TriggerEvent('ctrp-lockpick:client:openLockpick', lockpickFinish)
						else
							CTRPFW.Functions.Notify("You are missing a toolkit..", "error")
						end
					else
						CTRPFW.Functions.Notify('The door is already unlocked??', 'error', 2500)
					end
				else
					CTRPFW.Functions.Notify('The door lock is too strong', 'error', 2500)
				end
			end
		end
    end, "screwdriverset")
end)

function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

function round(num, numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
end



function lockpickFinish(success)
    if success then
		CTRPFW.Functions.Notify('Succes!', 'success', 2500)
		setDoorLocking(closestDoorValue, closestDoorKey)
    else
        CTRPFW.Functions.Notify('Failed..', 'error', 2500)
    end
end

function setDoorLocking(doorId, key)
	-- print(key)
	doorId.locking = true
	openDoorAnim()
    SetTimeout(400, function()
		doorId.locking = false
		doorId.locked = not doorId.locked
		TriggerServerEvent('ctrp-doorlock:server:updateState', key, doorId.locked)
	end)
end

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end

function IsAuthorized(doorID)
	local PlayerData = CTRPFW.Functions.GetPlayerData()
	local PlayerGang = CTRPFW.Functions.GetPlayerData().gang

	for _,job in pairs(doorID.authorizedJobs) do
		if job == PlayerData.job.name then
			return true
		elseif job == PlayerData.job.gradelabel then
			return true
		elseif job == PlayerGang.name then
			return true
		end
	end
	
	return false
end

function openDoorAnim()
    loadAnimDict("anim@heists@keycard@") 
    TaskPlayAnim( PlayerPedId(), "anim@heists@keycard@", "exit", 5.0, 1.0, -1, 16, 0, 0, 0, 0 )
	SetTimeout(400, function()
		ClearPedTasks(PlayerPedId())
	end)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(2500)
		for i = 1, #CTRP.Doors do
			local current = CTRP.Doors[i]
			if current.doors then
				for a = 1, #current.doors do
					local currentDoor = current.doors[a]
					if not currentDoor.object or not DoesEntityExist(currentDoor.object) then
						currentDoor.object = GetClosestObjectOfType(currentDoor.objCoords, 1.0, GetHashKey(currentDoor.objName), false, false, false)
					end
				end
			else
				if not current.object or not DoesEntityExist(current.object) then
					current.object = GetClosestObjectOfType(current.objCoords, 1.0, GetHashKey(current.objName), false, false, false)
				end
			end
		end
		-- for key, doorID in ipairs(CTRP.Doors) do
		-- 	if doorID.doors then
		-- 		for k,v in ipairs(doorID.doors) do
		-- 			if not v.object or not DoesEntityExist(v.object) then
		-- 				v.object = GetClosestObjectOfType(v.objCoords, 1.0, GetHashKey(v.objName), false, false, false)
		-- 			end
		-- 		end
		-- 	else
		-- 		if not doorID.object or not DoesEntityExist(doorID.object) then
		-- 			doorID.object = GetClosestObjectOfType(doorID.objCoords, 1.0, GetHashKey(doorID.objName), false, false, false)
		-- 		end
		-- 	end
		-- end

		-- Citizen.Wait(2500)
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		local playerCoords, awayFromDoors = GetEntityCoords(PlayerPedId()), true

		for i = 1, #CTRP.Doors do
			local current = CTRP.Doors[i]
			local distance

			if current.doors then
				distance = #(playerCoords - current.doors[1].objCoords)
			else
				distance = #(playerCoords - current.objCoords)
			end

			if current.distance then
				maxDistance = current.distance
			end

			if distance < 10 then
				awayFromDoors = false
				if current.doors then
					for a = 1, #current.doors do
						local currentDoor = current.doors[a]
						FreezeEntityPosition(currentDoor.object, current.locked)

						if current.locked and currentDoor.objYaw and GetEntityRotation(currentDoor.object).z ~= currentDoor.objYaw then
							SetEntityRotation(currentDoor.object, 0.0, 0.0, currentDoor.objYaw, 2, true)
						end
					end
				else
					FreezeEntityPosition(current.object, current.locked)

					if current.locked and current.objYaw and GetEntityRotation(current.object).z ~= current.objYaw then
						SetEntityRotation(current.object, 0.0, 0.0, current.objYaw, 2, true)
					end
				end
			end

			if distance < maxDistance then
				awayFromDoors = false
				if current.size then
					size = current.size
				end

				local isAuthorized = IsAuthorized(current)

				if isAuthorized then
					if current.locked then
						displayText = "[~g~E~w~] - Locked"
					elseif not current.locked then
						displayText = "[~g~E~w~] - Unlocked"
					end
				elseif not isAuthorized then
					if current.locked then
						displayText = "~r~Locked"
					elseif not current.locked then
						displayText = "~g~Unlocked"
					end
				end

				if current.locking then
					if current.locked then
						displayText = "~g~Unlocking.."
					else
						displayText = "~r~Locking.."
					end
				end

				if current.objCoords == nil then
					current.objCoords = current.textCoords
				end

				DrawText3Ds(current.objCoords.x, current.objCoords.y, current.objCoords.z, displayText)

				if IsControlJustReleased(0, 38) then
					if isAuthorized then
						setDoorLocking(current, i)
					else
						CTRPFW.Functions.Notify('Not Authorized', 'error')
					end
				end
			end
		end

		if awayFromDoors then
			Citizen.Wait(1000)
		end
		-- Citizen.Wait(5)
		-- local playerCoords, awayFromDoors = GetEntityCoords(PlayerPedId()), true 

		-- for k,doorID in ipairs(CTRP.Doors) do
		-- 	local distance

		-- 	if doorID.doors then
		-- 		distance = #(playerCoords - doorID.doors[1].objCoords)
		-- 	else
		-- 		distance = #(playerCoords - doorID.objCoords)
		-- 	end

		-- 	if doorID.distance then
		-- 		maxDistance = doorID.distance
		-- 	end
		-- 	if distance < 50 then
		-- 		awayFromDoors = false
		-- 		if doorID.doors then
		-- 			for _,v in ipairs(doorID.doors) do
		-- 				FreezeEntityPosition(v.object, doorID.locked)

		-- 				if doorID.locked and v.objYaw and GetEntityRotation(v.object).z ~= v.objYaw then
		-- 					SetEntityRotation(v.object, 0.0, 0.0, v.objYaw, 2, true)
		-- 				end
		-- 			end
		-- 		else
		-- 			FreezeEntityPosition(doorID.object, doorID.locked)

		-- 			if doorID.locked and doorID.objYaw and GetEntityRotation(doorID.object).z ~= doorID.objYaw then
		-- 				SetEntityRotation(doorID.object, 0.0, 0.0, doorID.objYaw, 2, true)
		-- 			end
		-- 		end
		-- 	end

		-- 	if distance < maxDistance then
		-- 		awayFromDoors = false
		-- 		if doorID.size then
		-- 			size = doorID.size
		-- 		end

		-- 		local isAuthorized = IsAuthorized(doorID)

		-- 		if isAuthorized then
		-- 			if doorID.locked then
		-- 				displayText = "~g~E~w~ - Locked"
		-- 			elseif not doorID.locked then
		-- 				displayText = "~g~E~w~ - Unlocked"
		-- 			end
		-- 		elseif not isAuthorized then
		-- 			if doorID.locked then
		-- 				displayText = "Locked"
		-- 			elseif not doorID.locked then
		-- 				displayText = "Unlocked"
		-- 			end
		-- 		end

		-- 		if doorID.locking then
		-- 			if doorID.locked then
		-- 				displayText = "Unlocking.."
		-- 			else
		-- 				displayText = "Locking.."
		-- 			end
		-- 		end

		-- 		if doorID.objCoords == nil then
		-- 			doorID.objCoords = doorID.textCoords
		-- 		end

		-- 		DrawText3Ds(doorID.objCoords.x, doorID.objCoords.y, doorID.objCoords.z, displayText)

		-- 		-- print(k)

		-- 		if IsControlJustReleased(0, 38) then
		-- 			if isAuthorized then
		-- 				setDoorLocking(doorID, k)
		-- 			end
		-- 		end
		-- 	end
		-- end

		-- if awayFromDoors then
		-- 	Citizen.Wait(1000)
		-- end
	end
end)

-- local props = {
-- 	"prison_prop_door1",
-- 	"prison_prop_door2",
-- 	"v_ilev_gtdoor",
-- 	"prison_prop_door1a"
-- }

-- Citizen.CreateThread(function()
-- 	while true do
-- 		for k, v in pairs(props) do
-- 			local ped = PlayerPedId()
-- 			local pos = GetEntityCoords(ped)
-- 			local ClosestDoor = GetClosestObjectOfType(pos.x, pos.y, pos.z, 5.0, GetHashKey(v), 0, 0, 0)
-- 			if ClosestDoor ~= 0 then
-- 				local DoorCoords = GetEntityCoords(ClosestDoor)
	
-- 				DrawText3Ds(DoorCoords.x, DoorCoords.y, DoorCoords.z, "OBJ: "..v..", x: "..round(DoorCoords.x, 0)..", y: "..round(DoorCoords.y, 0)..", z: "..round(DoorCoords.z, 0))
-- 			end
-- 		end
-- 		Citizen.Wait(1)
-- 	end
-- end)


