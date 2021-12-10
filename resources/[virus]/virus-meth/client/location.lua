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

local spawnedMeths = 0
local methBox = {}
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
	DrawText(x, y)
end

Citizen.CreateThread(
    function()
        local g = false
        while true do
            Citizen.Wait(5000)
            if f then
				local h = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), Config.CircleZones.MethField.coords, true)
                if h < 100 and not g then
                    SpawnMethPlants()
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

end)

function LoadDict(dict)
    RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
	  	Citizen.Wait(10)
    end
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local nearbyObject, nearbyID

		for i=1, #methBox, 1 do
			if GetDistanceBetweenCoords(coords, GetEntityCoords(methBox[i]), false) < 1 then
				nearbyObject, nearbyID = methBox[i], i
			end
		end

		if nearbyObject and IsPedOnFoot(playerPed) then

			if not isPickingUp then
				DrawText2D(0.4, 0.8, '~w~Press ~g~[E]~w~ to pickup')
			end

			if IsControlJustReleased(0, 38) and not isPickingUp then
				isPickingUp = true
				LoadDict('amb@medic@standing@tendtodead@idle_a')
			    TaskPlayAnim(GetPlayerPed(-1), 'amb@medic@standing@tendtodead@idle_a', 'idle_a', 8.0, -8.0, -1, 1, 0.0, 0, 0, 0)


				CTRPFW.Functions.Notify("रूको ज़रा सबर करो", "error", 10000)
				CTRPFW.Functions.Progressbar("search_register", "Taking Materials..", 10000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {}, {}, {}, function() -- Done
					ClearPedTasks(GetPlayerPed(-1))
					DeleteObject(nearbyObject)

					table.remove(methBox, nearbyID)
					spawnedMeths = spawnedMeths - 1
	
					TriggerServerEvent('virus-meth:pickedup')
                    ClearPedTasks(GetPlayerPed(-1))

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
		for k, v in pairs(methBox) do
			DeleteObject(v)
		end
	end
end)

function SpawnMethPlants()

	math.randomseed(GetGameTimer())
    local random = math.random(20, 30)
    RequestModel(2556863963)
    while not HasModelLoaded(2556863963) do
        Citizen.Wait(1)
    end
    while b < random do
		Citizen.Wait(1)
		local D = GenerateMethCoords()
		print(D)
		print(random)

        local E = CreateObject(2556863963, D.x, D.y, D.z, false, false, true)
        PlaceObjectOnGroundProperly(E)
        FreezeEntityPosition(E, true)
        table.insert(methBox, E)
        b = b + 1
    end
end

function ValidateMethCoord(methCoords)
	if spawnedMeths > 0 then
		local validate = true

		for k, v in pairs(methBox) do
			if GetDistanceBetweenCoords(methCoords, GetEntityCoords(v), true) < 5 then
				validate = false
			end
		end

		if GetDistanceBetweenCoords(methCoords, Config.CircleZones.MethField.coords, false) > 50 then
			validate = false
		end

		return validate
	else
		return true
	end
end

function GenerateMethCoords()
	while true do
		Citizen.Wait(1)

		local methCoordX, methCoordY

		math.randomseed(GetGameTimer())
		local modX = math.random(-90, 90)

		Citizen.Wait(100)

		math.randomseed(GetGameTimer())
		local modY = math.random(-90, 90)

		methCoordX = Config.CircleZones.MethField.coords.x + modX
		methCoordY = Config.CircleZones.MethField.coords.y + modY

		local coordZ = GetCoordZ(methCoordX, methCoordY)
		local coord = vector3(methCoordX, methCoordY, coordZ)

		if ValidateMethCoord(coord) then
			return coord
		end
	end
end



function GetCoordZ(x, y)
    local groundCheckHeights = { 40.0, 41.0, 42.0, 43.0, 44.0, 45.0, 46.0, 47.0, 48.0, 49.0, 50.0, 51.0, 52.0, 53.0, 54.0, 55.0, 56.0, 57.0, 58.0, 59.0, 60.0, 61.0, 62.0, 63.0, 64.0, 65.0, 66.0, 67.0, 68.0, 69.0, 70.0}
	for i, height in ipairs(groundCheckHeights) do
        local foundGround, z = GetGroundZFor_3dCoord(x, y, height)

        if foundGround then
            return z
        end
    end

    return 70.0
end
