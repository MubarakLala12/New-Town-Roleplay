--
-- THREADS
--

CTRPFW = nil

Citizen.CreateThread(function()
    while CTRPFW == nil do
        TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)
        Citizen.Wait(200)
    end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local _sleep = true
		local _ped = PlayerPedId()
		local _pos = GetEntityCoords(_ped)
        local veh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		for i = 1, #Config.Zones, 1 do
			local dist = #((Config.Zones[i]) - vector3(_pos))
			if dist < 2 then
				_sleep = false
				DrawText3D(Config.Zones[i], "~g~E~s~ - To Open McDonald's Drive Thru Tab")
				if dist < 2 then
                    if IsControlJustPressed(0, 38) then
                        if IsPedInVehicle(GetPlayerPed(-1), veh, true) then
                            open(true)
                        else
                            CTRPFW.Functions.Notify("You are not in vehicle!", "error")
                        end
                    end
                       
				end
			end
		end
		if _sleep then Citizen.Wait(1000) end
	end
end)



--
-- CALLBACKS
--

RegisterNUICallback("makeanorder", function(data)
    TriggerServerEvent('virus-mcdonalds:makeanorder', data)
end)

RegisterNUICallback("exit", function(data)
    open(false)
end)

--
-- FUNCS
--

open = function(toggle)
    display = toggle
    SetNuiFocus(toggle, toggle)
    SendNUIMessage({
        type = "ui",
        status = toggle,
    })
end

DrawText3D = function(zone, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(zone, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end
