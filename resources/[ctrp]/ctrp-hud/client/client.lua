-- local CTRPFW = nil
isLoggedIn = false

-- Citizen.CreateThread(function()
-- 	while CTRPFW == nil do
-- 		TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)
-- 		Citizen.Wait(200)
-- 	end
-- end)

RegisterNetEvent("CTRPFW:Client:OnPlayerLoaded")
AddEventHandler("CTRPFW:Client:OnPlayerLoaded", function()
    isLoggedIn = true
	TriggerEvent('circlemap')
end)

RegisterNetEvent("CTRPFW:Client:OnPlayerUnload")
AddEventHandler("CTRPFW:Client:OnPlayerUnload", function()
    isLoggedIn = false
end)

Citizen.CreateThread(function() 
    while true do
		sleep = 2500
		if isLoggedIn then
			sleep = 100
        	CTRPFW.Functions.GetPlayerData(function(PlayerData)
            	local player = PlayerPedId()
            	local health = GetEntityHealth(player) - 100
            	local hunger = PlayerData.metadata["hunger"]
            	local thirst = PlayerData.metadata["thirst"]
            	local stress = PlayerData.metadata["stress"]
            	local armor  = GetPedArmour(player)
				--local talking = false
				--local mumbleData = exports["mumble-voip"]:RetrieveMumbleData()

            	if IsEntityInWater(player) then
                	oxy = GetPlayerUnderwaterTimeRemaining(PlayerId()) * 10
            	else
                	oxy = 100 - GetPlayerSprintStaminaRemaining(PlayerId())
            	end

				if IsPauseMenuActive() then
					SendNUIMessage({show = false})
				end

--[[ 				if mumbleData and mumbleData[svrId] and not mumbleData[svrId].radioActive and NetworkIsPlayerTalking(PlayerId()) then 
					talking = 'normal'
				elseif mumbleData and mumbleData[svrId] and mumbleData[svrId].radioActive then 
					talking = 'radio'
				else 
					talking = false 
				end ]]

            	SendNUIMessage({
                	type = "updateStatusHud",
					show = true,
                	varSetHealth = health,
                	varSetArmor = armor,
                	varSetOxy = oxy,
                	--varSetVoice = mumbleData,
					--talking = talking,
                	varSetHunger = hunger,
                	varSetThirst = thirst,
                	varSetStress = stress,
            	})
			end)
        end
		Citizen.Wait(sleep)
    end
end)

local virusgandu = false
-- Radar While Driving
Citizen.CreateThread(function()
	while true do
		sleep = 500
		local player = PlayerPedId()
		local vehicle = GetVehiclePedIsIn(player, false)
		local vehicleIsOn = GetIsVehicleEngineRunning(vehicle)

		if IsPedInAnyVehicle(player, false) and vehicleIsOn then
			sleep = 100
			virusgandu = true
			DisplayRadar(true)
			local Kph = GetEntitySpeed(GetVehiclePedIsIn(PlayerPedId(), false)) * 3.6
			local fuel = GetVehicleFuelLevel(GetVehiclePedIsIn(PlayerPedId(), false))
			--local time = GetGameTimer()
			if virusgandu then
				SendNUIMessage({
					type = "speedBar",
					show = true,
					speedtext = Kph,
					fueltext = fuel,
					--timetext = time,
					
				})
			end

		else
			virusgandu = false
			DisplayRadar(false)
			SendNUIMessage({
				type = "speedBaroff",
				show = false,
				speedtext = Kph,
				fueltext = fuel,
				--timetext = time,
			})
		end
		Citizen.Wait(sleep)
	end
end)

function CalculateTimeToDisplay()
	hour = GetClockHours()
    minute = GetClockMinutes()
    
    local obj = {}
    
	if minute <= 9 then
		minute = "0" .. minute
    end
    
	if hour <= 9 then
		hour = "0" .. hour
    end
    
    obj.hour = hour
    obj.minute = minute

    return obj
end




--[[Round MiniMap
Citizen.CreateThread(function()
	RequestStreamedTextureDict("circlemap", false)
	while not HasStreamedTextureDictLoaded("circlemap") do
		Wait(100)
	end
	AddReplaceTexture("platform:/textures/graphics", "radarmasksm", "circlemap", "radarmasksm")
	
	SetMinimapClipType(1)
	SetMinimapComponentPosition('minimap', 'L', 'B', -0.0160, -0.06, 0.160, 0.220)
	SetMinimapComponentPosition('minimap_mask', 'L', 'B', 0.2, 0.12, 0.300, 0.300)
	SetMinimapComponentPosition('minimap_blur', 'L', 'B', -0.0, 0.020, 0.20, 0.300)

	local minimap = RequestScaleformMovie("minimap")
    SetRadarBigmapEnabled(true, false)
    Citizen.Wait(100)
    SetRadarBigmapEnabled(false, false)
	Citizen.Wait(1000)
    while true do
        Citizen.Wait(0)
        BeginScaleformMovieMethod(minimap, "SETUP_HEALTH_ARMOUR")
        ScaleformMovieMethodAddParamInt(3)
        EndScaleformMovieMethod()
    end
end)]]

TriggerEvent('circlemap')
AddEventHandler('circlemap', function()
    RequestStreamedTextureDict("circlemap", false)
	while not HasStreamedTextureDictLoaded("circlemap") do
		Wait(100)
	end
	AddReplaceTexture("platform:/textures/graphics", "radarmasksm", "circlemap", "radarmasksm")
	
	SetMinimapClipType(1)
	SetMinimapComponentPosition('minimap', 'L', 'B', -0.0160, -0.06, 0.160, 0.220)
	SetMinimapComponentPosition('minimap_mask', 'L', 'B', 0.2, 0.12, 0.300, 0.300)
	SetMinimapComponentPosition('minimap_blur', 'L', 'B', -0.0, 0.020, 0.20, 0.300)

	local minimap = RequestScaleformMovie("minimap")
    SetRadarBigmapEnabled(true, false)
    Citizen.Wait(100)
    SetRadarBigmapEnabled(false, false)
	Citizen.Wait(1000)
    while true do
        Citizen.Wait(0)
        BeginScaleformMovieMethod(minimap, "SETUP_HEALTH_ARMOUR")
        ScaleformMovieMethodAddParamInt(3)
        EndScaleformMovieMethod()
    end
end)