CTRPFW = nil

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		if CTRPFW == nil then
			TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)
			Citizen.Wait(200)
		end
	end
end)

-- Code

local disableShuffle = true

Citizen.CreateThread(function()
	while true do
		local ped = GetPlayerPed(-1)
		local veh = GetVehiclePedIsIn(ped)

		if IsPedInAnyVehicle(ped, false) and disableShuffle then
			if GetPedInVehicleSeat(veh, false, 0) == ped then
				if GetIsTaskActive(ped, 165) then
					SetPedIntoVehicle(ped, veh, 0)
				end
			end
		end

		Citizen.Wait(2)
	end
end)

RegisterNetEvent("ctrp-seatshuff:client:Shuff")
AddEventHandler("ctrp-seatshuff:client:Shuff", function()
	local ped = GetPlayerPed(-1)
	if IsPedInAnyVehicle(ped, false) then
		disableShuffle = false
		SetTimeout(5000, function()
			disableShuffle = true
		end)
	else
		CancelEvent()
	end
end)