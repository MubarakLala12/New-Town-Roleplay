local kmh = 3.6
local mph = 2.23693629
local carspeed = 0
local driftmode = false
local speed = kmh
local drift_speed_limit = 100.0 
local toggle = 118
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if IsControlJustPressed(1, 118) then
			driftmode = not driftmode
			if driftmode then
				CTRPFW.Functions.Notify("Drift Mode on..", "error")
			else
				CTRPFW.Functions.Notify("Drift Mode off..", "error")
			end
		end
		if driftmode then
			if IsPedInAnyVehicle(GetPed(), false) then
				CarSpeed = GetEntitySpeed(GetCar()) * speed
				if GetPedInVehicleSeat(GetCar(), -1) == GetPed() then
					if CarSpeed <= drift_speed_limit then  
						if IsControlPressed(1, 21) then
							SetVehicleReduceGrip(GetCar(), true)
						else
							SetVehicleReduceGrip(GetCar(), false)
						end
					end
				end
			end
		end
	end 
end)
function GetPed() return GetPlayerPed(-1) end
function GetCar() return GetVehiclePedIsIn(GetPlayerPed(-1),false) end