CTRPFW = nil
isLoggedIn = true

local menuOpen = false
local wasOpen = false

Citizen.CreateThread(function() 
    while true do
        Citizen.Wait(10)
        if CTRPFW == nil then
            TriggerEvent("CTRPFW:GetObject", function(obj) CTRPFW = obj end)    
            Citizen.Wait(200)
        end
    end
end)

local spawnedWeeds = 0
local weedPlants = {}
local isPickingUp, isProcessing = false, false

local f = true
local b = 0

function DrawText2D(x, y, text)  
			SetTextFont(0)
			SetTextProportional(1)
			SetTextScale(0.0, 0.3)
			SetTextColour(128, 128, 128, 255)
			SetTextDropshadow(0, 0, 0, 0, 255)
			SetTextEdge(1, 0, 0, 0, 255)
			SetTextDropShadow()
			SetTextOutline()
			SetTextEntry("STRING")
			--AddTextComponentString("~w~Press ~b~[E]~w~ to pickup Cannabis")
			DrawText(x, y)

end

Citizen.CreateThread(
    function()
        local g = false
        while true do
            Citizen.Wait(5000)
            if f then
				local h = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), Config.CircleZones.WeedField.coords, true)
                if h < 100 and not g then
                    SpawnWeedPlants()
                    g = true
                elseif h > 250 and g then
                    Citizen.Wait(900000)
                    g = false
                end
            else
                Citizen.Wait(10000)
            end
        end
    end
)

RegisterNetEvent("CTRPFW:Client:OnPlayerLoaded")
AddEventHandler("CTRPFW:Client:OnPlayerLoaded", function()
	--CheckCoords()
	--[[Citizen.Wait(1000)
	local coords = GetEntityCoords(PlayerPedId())
	if GetDistanceBetweenCoords(coords, Config.CircleZones.WeedField.coords, true) < 2000 then
		SpawnWeedPlants()
	end--]]
end)

--[[function CheckCoords()
	Citizen.CreateThread(function()
		while true do
			local coords = GetEntityCoords(PlayerPedId())
			print('Now')
			if GetDistanceBetweenCoords(coords, Config.CircleZones.WeedField.coords, true) < 2000 then
				SpawnWeedPlants()
			end
			--Citizen.Wait(30 * 60000)
			Citizen.Wait(20 * 60000)
		end
	end)
end

AddEventHandler('onResourceStart', function(resource)
	if resource == GetCurrentResourceName() then
		CheckCoords()
	end
end)--]]

-- Citizen.CreateThread(function()
-- 	while true do
-- 		Citizen.Wait(0)
-- 		local playerPed = PlayerPedId()
-- 		local coords = GetEntityCoords(playerPed)

-- 		if GetDistanceBetweenCoords(coords, Config.CircleZones.WeedProcessing.coords, true) < 1 then
-- 			DrawMarker(27, Config.CircleZones.WeedProcessing.coords.x, Config.CircleZones.WeedProcessing.coords.y, Config.CircleZones.WeedProcessing.coords.z - 0.66 , 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 0, 0, 200, 0, 0, 0, 0)

-- 			if not isProcessing then
-- 				--CTRPFW.Functions.Draw2DText('Press ~g~[ E ]~w~ to Process Cannabis')
-- 			end

-- 			if IsControlJustReleased(0, 38) and not isProcessing then
-- 				TriggerServerEvent('ctrp-weed:processCannabis')
-- 				-- 	if result then
-- 				-- 		ProcessWeed()
-- 				-- 	else
-- 				-- 		CTRPFW.Functions.Notify('You do not have enough Cannabis to process..', 'error')
-- 				-- 	end
-- 				-- end, 'cannabis')
-- 			end
-- 		else
-- 			Citizen.Wait(500)
-- 		end
-- 	end
-- end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)

		if GetDistanceBetweenCoords(coords, Config.CircleZones.WeedProcessing.coords, true) < 1 then
			DrawMarker(27, Config.CircleZones.WeedProcessing.coords.x, Config.CircleZones.WeedProcessing.coords.y, Config.CircleZones.WeedProcessing.coords.z - 0.66 , 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 0, 0, 200, 0, 0, 0, 0)

			if not isProcessing then
				DrawText2D(Config.CircleZones.WeedProcessing.coords.x, Config.CircleZones.WeedProcessing.coords.y, Config.CircleZones.WeedProcessing.coords.z, 'Press ~b~[ E ]~w~ to start packing your ~g~Weed')
			end

			if IsControlJustReleased(0, 38) and not isProcessing then
				CTRPFW.Functions.TriggerCallback('weed:ingredient', function(HasItem, type)
					if HasItem then
						ProcessWeed()
					else
						CTRPFW.Functions.Notify('You dont have enough Materials', 'error')
					end
				end)
			end
		else
			Citizen.Wait(500)
		end
	end
end)


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)

		if GetDistanceBetweenCoords(coords, Config.CircleZones.WeedProcessing2.coords, true) < 1 then
			DrawMarker(27, Config.CircleZones.WeedProcessing2.coords.x, Config.CircleZones.WeedProcessing2.coords.y, Config.CircleZones.WeedProcessing2.coords.z - 0.66 , 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 0, 0, 200, 0, 0, 0, 0)

			if not isProcessing then
				DrawText2D(Config.CircleZones.WeedProcessing2.coords.x, Config.CircleZones.WeedProcessing2.coords.y, Config.CircleZones.WeedProcessing2.coords.z, 'Press ~b~[ E ]~w~ to start packing your ~g~2og Weed')
			end

			if IsControlJustReleased(0, 38) and not isProcessing then
				CTRPFW.Functions.TriggerCallback('weed:ingredient2', function(HasItem, type)
					if HasItem then
						
						ProcessWeed2()
					else
						CTRPFW.Functions.Notify('You dont have enough Materials', 'error')
					end
				end)
			end
		else
			Citizen.Wait(500)
		end
	end
end)



function ProcessWeed()
	isProcessing = true
	local playerPed = PlayerPedId()

	
	TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_PARKING_METER", 0, true)

	CTRPFW.Functions.Progressbar("search_register", "Processing..", 15000, false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {}, {}, {}, function() -- Done
		TriggerServerEvent('ctrp-weed:processCannabis')
		local timeLeft = Config.Delays.WeedProcessing / 1000

		while timeLeft > 0 do
			Citizen.Wait(1000)
			timeLeft = timeLeft - 1

			if GetDistanceBetweenCoords(GetEntityCoords(playerPed), Config.CircleZones.WeedProcessing.coords, false) > 4 then
				TriggerServerEvent('ctrp-weed:cancelProcessing')
				break
			end
		end
		ClearPedTasks(GetPlayerPed(-1))
	end, function()
		ClearPedTasks(GetPlayerPed(-1))
	end) -- Cancel
		
	
	isProcessing = false
end

function ProcessWeed2()
	isProcessing = true
	local playerPed = PlayerPedId()

	
	TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_PARKING_METER", 0, true)

	CTRPFW.Functions.Progressbar("search_register", "Processing..", 15000, false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {}, {}, {}, function()
		TriggerServerEvent("ctrp-weed:server:process")
		--TriggerServerEvent('ctrp-weed:processCannabis2')
		local timeLeft = Config.Delays.WeedProcessing / 1000

		while timeLeft > 0 do
			Citizen.Wait(1000)
			timeLeft = timeLeft - 1

			if GetDistanceBetweenCoords(GetEntityCoords(playerPed), Config.CircleZones.WeedProcessing.coords, false) > 4 then
				TriggerServerEvent('ctrp-weed:cancelProcessing')
				break
			end
		end
		ClearPedTasks(GetPlayerPed(-1))
	end, function()
		ClearPedTasks(GetPlayerPed(-1))
	end) -- Cancel
		
	
	isProcessing = false
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local nearbyObject, nearbyID

		for i=1, #weedPlants, 1 do
			if GetDistanceBetweenCoords(coords, GetEntityCoords(weedPlants[i]), false) < 1 then
				nearbyObject, nearbyID = weedPlants[i], i
			end
		end

		if nearbyObject and IsPedOnFoot(playerPed) then

			if not isPickingUp then
				DrawText2D(0.4, 0.8, '~w~Press ~g~[E]~w~ to pickup Cannabis')
			end

			if IsControlJustReleased(0, 38) and not isPickingUp then
				isPickingUp = true
				TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant', 0, false)

				CTRPFW.Functions.Notify("रूको ज़रा सबर करो", "error", 10000)
				CTRPFW.Functions.Progressbar("search_register", "Picking up Cannabis..", 10000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {}, {}, {}, function() -- Done
					ClearPedTasks(GetPlayerPed(-1))
					DeleteObject(nearbyObject)

					table.remove(weedPlants, nearbyID)
					spawnedWeeds = spawnedWeeds - 1
	
					TriggerServerEvent('ctrp-weed:pickedUpCannabis')
					TriggerServerEvent('ctrp-weed:weed')

				end, function()
					ClearPedTasks(GetPlayerPed(-1))
				end) -- Cancel

				isPickingUp = false
			end
		else
			Citizen.Wait(500)
		end
	end
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		for k, v in pairs(weedPlants) do
			DeleteObject(v)
		end
	end
end)

function SpawnWeedPlants()
	--[[while spawnedWeeds < 25 do
		Citizen.Wait(0)
		local weedCoords = GenerateWeedCoords()

		CTRPFW.Functions.SpawnLocalObject('prop_weed_02', weedCoords, function(obj)
			PlaceObjectOnGroundProperly(obj)
			FreezeEntityPosition(obj, true)
			table.insert(weedPlants, obj)
			spawnedWeeds = spawnedWeeds + 1
		end)
	end--]]
	math.randomseed(GetGameTimer())
    local random = math.random(20, 45)
    RequestModel(-305885281)
    while not HasModelLoaded(-305885281) do
        Citizen.Wait(1)
    end
    while b < random do
		Citizen.Wait(1)
		local D = GenerateWeedCoords()
		--print(D)

        local E = CreateObject(-305885281, D.x, D.y, D.z, false, false, true)
        PlaceObjectOnGroundProperly(E)
        FreezeEntityPosition(E, true)
        table.insert(weedPlants, E)
        b = b + 1
    end
end

function ValidateWeedCoord(plantCoord)
	if spawnedWeeds > 0 then
		local validate = true

		for k, v in pairs(weedPlants) do
			if GetDistanceBetweenCoords(plantCoord, GetEntityCoords(v), true) < 5 then
				validate = false
			end
		end

		if GetDistanceBetweenCoords(plantCoord, Config.CircleZones.WeedField.coords, false) > 50 then
			validate = false
		end

		return validate
	else
		return true
	end
end

function GenerateWeedCoords()
	while true do
		Citizen.Wait(1)

		local weedCoordX, weedCoordY

		math.randomseed(GetGameTimer())
		local modX = math.random(-90, 90)

		Citizen.Wait(100)

		math.randomseed(GetGameTimer())
		local modY = math.random(-90, 90)

		weedCoordX = Config.CircleZones.WeedField.coords.x + modX
		weedCoordY = Config.CircleZones.WeedField.coords.y + modY

		local coordZ = GetCoordZ(weedCoordX, weedCoordY)
		local coord = vector3(weedCoordX, weedCoordY, coordZ)

		if ValidateWeedCoord(coord) then
			return coord
		end
	end
end

--[[function GetCoordZ(x, y)
	local groundCheckHeights = { 40.0, 41.0, 42.0, 43.0, 44.0, 45.0, 46.0, 47.0, 48.0, 49.0, 50.0 }
	--local groundCheckHeights = { -13.0, -14.0, -15.0, -16.0, -17.0, -18.0, -19.0, -22.0, -26.0, -30.0} 

	for i, height in ipairs(groundCheckHeights) do
		local foundGround, z = GetGroundZFor_3dCoord(x, y, height)

		if foundGround then
			return z
		end
	end

	return 43.0
end

function GetCoordZ(x, y)
    --local groundCheckHeights = { 31.0, 32.0, 33.0, 34.0, 35.0, 36.0, 37.0, 38.0, 39.0, 40.0, 50.0 }
	local groundCheckHeights = { 18.0, 19.0, 20.0, 21.0, 22.0, 23.0, 24.0, 25.0, 26.0, 27.0, 28.0 }
    for i, height in ipairs(groundCheckHeights) do
        local foundGround, z = GetGroundZFor_3dCoord(x, y, height)

        if foundGround then
            return z
        end
    end

    return 31.0
end]]

function GetCoordZ(x, y)
    --local groundCheckHeights = { 31.0, 32.0, 33.0, 34.0, 35.0, 36.0, 37.0, 38.0, 39.0, 40.0, 50.0 }
	local groundCheckHeights = { 150.0,151.0,152.0,153.0,154.0, 155.0,156.0,158.0,159.0, 160.0,161.0,162.0,163.0,164.0, 165.0,166.0,167.0,168.0,169.0, 170.0, 171.0, 172.0, 173.0, 174.0, 175.0, 176.0, 177.0, 178.0, 179.0, 180.0, 185.0}
    for i, height in ipairs(groundCheckHeights) do
        local foundGround, z = GetGroundZFor_3dCoord(x, y, height)

        if foundGround then
            return z
        end
    end

    return 150.0
end
