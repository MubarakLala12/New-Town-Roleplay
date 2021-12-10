Citizen.CreateThread(function()
	while Config.RollPrevention do
			if(not globalIsPedInAnyVehicle)then
				Citizen.Wait(4)
				if globalIsPlayerFreeAiming then
					DisableControlAction(0, 22, 1) -- 22 is the INPUT_JUMP key
				else
					Citizen.Wait(100)
				end
			else
				Citizen.Wait(500)
			end
	end
  end)