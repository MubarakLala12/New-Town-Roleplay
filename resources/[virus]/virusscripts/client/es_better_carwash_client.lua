-- CTRPFW = nil


-- Citizen.CreateThread(function()
-- 	while CTRPFW == nil do
-- 		TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)
-- 		Citizen.Wait(0)
-- 	end
-- end)
PlayerJob = {}


Key = 38 -- E

vehicleWashStation = {
	{-324.27, -90.16,  38.68},
	{-316.85, -93.13,  38.68},
	{823.11, -885.58,  25.35},
}



local timer2 = false
local mycie = false

function es_better_carwash_DrawSubtitleTimed(m_text, showtime)
	SetTextEntry_2('STRING')
	AddTextComponentString(m_text)
	DrawSubtitleTimed(showtime, 1)
end

function es_better_carwash_DrawNotification(m_text)
	SetNotificationTextEntry('STRING')
	AddTextComponentString(m_text)
	DrawNotification(true, false)
end

Citizen.CreateThread(function ()
	while true do
		Citizen.Wait(25)
		if IsPedSittingInAnyVehicle(PlayerPedId()) then 
			for i = 1, #vehicleWashStation do
				garageCoords2 = vehicleWashStation[i]

				if PlayerJob.name == "mechanic" then 
			
					if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), garageCoords2[1], garageCoords2[2], garageCoords2[3], true ) < 5 then
						if mycie == false then
							HelpPromt('Press ~INPUT_CONTEXT~ to ~b~clean ~s~vehicle')
							if IsControlJustPressed(1, Key) then
								TriggerServerEvent('es_better_carwash:checkmoney')
							end
						else
							HelpPromt('Press ~INPUT_CONTEXT~ to ~o~stop')
							if IsControlJustPressed(1, Key) then
								mycie = false
								timer2 = false
								StopParticleFxLooped(particles, 0)
								StopParticleFxLooped(particles2, 0)
								FreezeEntityPosition(GetVehiclePedIsUsing(PlayerPedId()), false)
							end
						end
					-- else
					-- 	Citizen.Wait(1500)
					end
				else
					Citizen.Wait(2000)
				end
			end
		else
			Citizen.Wait(2000)
		end
	end
end)

RegisterNetEvent('es_better_carwash:success')
AddEventHandler('es_better_carwash:success', function (price)
	local car = GetVehiclePedIsUsing(PlayerPedId())
	local coords = GetEntityCoords(PlayerPedId())
	mycie = true
	FreezeEntityPosition(car, true)
	if not HasNamedPtfxAssetLoaded("core") then
		RequestNamedPtfxAsset("core")
		while not HasNamedPtfxAssetLoaded("core") do
			Wait(1)
		end
	end
	UseParticleFxAssetNextCall("core")
	particles  = StartParticleFxLoopedAtCoord("ent_amb_waterfall_splash_p", coords.x, coords.y, coords.z, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
	UseParticleFxAssetNextCall("core")
	particles2  = StartParticleFxLoopedAtCoord("ent_amb_waterfall_splash_p", coords.x + 2, coords.y, coords.z, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
	timer = 5
	timer2 = true
    Citizen.CreateThread(function()
		while timer2 do
            Citizen.Wait(0)
            Citizen.Wait(1000)
            if(timer > 0)then
				timer = timer - 1
			elseif (timer == 0) then
				mycie = false
				WashDecalsFromVehicle(car, 1.0)
				SetVehicleDirtLevel(car)
				FreezeEntityPosition(car, false)
				--TriggerEvent("pNotify:SendNotification", {text = "Your vehicle has been cleaned! For 25$", type = "warning", queue = "global", timeout = 5000, layout = "centerLeft"})
				StopParticleFxLooped(particles, 0)
				StopParticleFxLooped(particles2, 0)
				timer2 = false
			end
        end
    end)
	Citizen.CreateThread(function()
        while true do
			Citizen.Wait(0)
			if mycie == true then
				for i = 1, #vehicleWashStation do
				garageCoords3 = vehicleWashStation[i]
				if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), garageCoords3[1], garageCoords3[2], garageCoords3[3], true ) < 4 then
					DrawText3D(garageCoords3[1], garageCoords3[2], garageCoords3[3] + 3, '~b~Cleaning... ~s~Time:~b~ '.. timer ..' ~s~seconds.')
				end
				end
			end
		end
	end)
end)

RegisterNetEvent('es_better_carwash:notenoughmoney')
AddEventHandler('es_better_carwash:notenoughmoney', function (moneyleft)
	TriggerEvent("pNotify:SendNotification", {text = "You don't have enough money! You need:" .. moneyleft .."$ more.", type = "warning", queue = "global", timeout = 5000, layout = "centerLeft"}) 
end)

function DrawText3D(x, y, z, text)
    local onScreen,_x,_y=World3dToScreen2d(x, y, z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
end

function HelpPromt(text)
	Citizen.CreateThread(function()
		SetTextComponentFormat("STRING")
		AddTextComponentString(text)
		DisplayHelpTextFromStringLabel(0, state, 0, -1)

	end)
end

RegisterNetEvent('CTRPFW:Client:OnPlayerLoaded')
AddEventHandler('CTRPFW:Client:OnPlayerLoaded', function()
    CTRPFW.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
    end)
    isLoggedIn = true
end)

RegisterNetEvent('CTRPFW:Client:OnJobUpdate')
AddEventHandler('CTRPFW:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
end)