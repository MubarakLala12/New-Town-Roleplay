--[[Citizen.CreateThread(function()
	while true do
		SetVehicleDensityMultiplierThisFrame(0.05)
	    SetPedDensityMultiplierThisFrame(1.0)
	    SetParkedVehicleDensityMultiplierThisFrame(1.0)
		SetScenarioPedDensityMultiplierThisFrame(0.0, 0.0)

		Citizen.Wait(3)
	end
end)]]

Citizen.CreateThread(function()
    while true do
        SetVehicleDensityMultiplierThisFrame(0.2)
	    SetPedDensityMultiplierThisFrame(1.0)
	    SetRandomVehicleDensityMultiplierThisFrame(0.2)
	    SetParkedVehicleDensityMultiplierThisFrame(1.0)
	    SetScenarioPedDensityMultiplierThisFrame(0.5, 0.5)

        Citizen.Wait(3)
    end
end)