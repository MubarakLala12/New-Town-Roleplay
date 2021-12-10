
local PlayerData                = {}
local open 						= false

CTRPFW = nil
Citizen.CreateThread(function() 
    while CTRPFW == nil do
        TriggerEvent("CTRPFW:GetObject", function(obj) CTRPFW = obj end)
        Citizen.Wait(200)
    end
end)

RegisterNetEvent('CTRPFW:Client:OnPlayerLoaded')
AddEventHandler('CTRPFW:Client:OnPlayerLoaded', function()
	PlayerData = CTRPFW.Functions.GetPlayerData()
	
end)

function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())

    SetTextScale(0.32, 0.32)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 255)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 500
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 80)
end


local function drawHint(text)
	SetTextComponentFormat("STRING")
	AddTextComponentString(text)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

RegisterNUICallback('wygrana', function(data)
	CTRPFW.Functions.Notify('You won '..data.win..' chips!', "error")
end)

RegisterNUICallback('updateBets', function(data)
	--TriggerServerEvent('virus-slots:updateCoins', data.bets)
	print(data.bets)

	CTRPFW.Functions.Notify('Updated '..data.bets..' chips!', "success")
end)

function KeyboardInput(textEntry, inputText, maxLength)
    AddTextEntry('FMMC_KEY_TIP1', textEntry)
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", inputText, "", "", "", maxLength)

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(0)
    end

    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Citizen.Wait(500)
        return result
    else
        Citizen.Wait(500)
        return nil
    end
end

RegisterNetEvent("virus-slots:UpdateSlots")
AddEventHandler("virus-slots:UpdateSlots", function(lei)
	SetNuiFocus(true, true)
	open = true
	SendNUIMessage({
		showPacanele = "open",
		coinAmount = tonumber(lei)
	})
end)

RegisterNUICallback('exitWith', function(data, cb)
	cb('ok')
	SetNuiFocus(false, false)
	open = false
	TriggerServerEvent("virus-slots:PayOutRewards", math.floor(data.coinAmount))
end)

Citizen.CreateThread(function ()
	while true do
		Citizen.Wait(1)
		if open then
			DisableControlAction(0, 1, true) -- LookLeftRight
			DisableControlAction(0, 2, true) -- LookUpDown
			DisableControlAction(0, 24, true) -- Attack
			DisablePlayerFiring(GetPlayerPed(-1), true) -- Disable weapon firing
			DisableControlAction(0, 142, true) -- MeleeAttackAlternate
			DisableControlAction(0, 106, true) -- VehicleMouseControlOverride
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local coords = GetEntityCoords(GetPlayerPed(-1))
		for i=1, #Config.Sloty do
			local dis = GetDistanceBetweenCoords(coords, Config.Sloty[i].x, Config.Sloty[i].y, Config.Sloty[i].z, true)
			if dis <= 2.0 then
				
				DrawText3Ds(coords.x, coords.y, coords.z, 'Press E to play slots.')
				if IsControlJustReleased(1, 38) then
					TriggerServerEvent('virus-slots:BetsAndMoney')
				end
			end
		end
		--[[for i=1, #Config.Ruletka do
			local dis = GetDistanceBetweenCoords(coords, Config.Ruletka[i].x, Config.Ruletka[i].y, Config.Ruletka[i].z, true)
			if dis <= 2.0 then
				
				DrawText3Ds(coords.x, coords.y, coords.z, 'Press E to play roulette.')
				if IsControlJustReleased(1, 38) then
					--print('working')
					TriggerEvent('route68-roulette:start')
				end
			end
		end
		for i=1, #Config.Blackjack do
			local dis = GetDistanceBetweenCoords(coords, Config.Blackjack[i].x, Config.Blackjack[i].y, Config.Blackjack[i].z, true)
			if dis <= 2.0 then
				
				DrawText3Ds(coords.x, coords.y, coords.z, 'Press E to play blackjack.')
				if IsControlJustReleased(1, 38) then
					TriggerEvent('route68_blackjack:start')
				end
			end
		end]]
	end
end)

local coordonate = {
    {1088.1, 221.11, -49.21, nil, 185.5, nil, -1371020112},
    {1100.61, 195.55, -49.45, nil, 316.5, nil, 999748158},
	{1111.87, 209.85, -49.44, nil, 0.27, nil, 1535236204},
	{1110.49, 206.95, -49.44, nil, 125.78, nil, 1535236204},
	{1113.64, 207.14, -49.44, nil, 230.86, nil, 1535236204},
}

Citizen.CreateThread(function()

    for _,v in pairs(coordonate) do
      RequestModel(v[7])
      while not HasModelLoaded(v[7]) do
        Wait(1)
      end
  
      RequestAnimDict("mini@strip_club@idles@bouncer@base")
      while not HasAnimDictLoaded("mini@strip_club@idles@bouncer@base") do
        Wait(1)
      end
      ped =  CreatePed(4, v[7],v[1],v[2],v[3]-1, 3374176, false, true)
      SetEntityHeading(ped, v[5])
      FreezeEntityPosition(ped, true)
      SetEntityInvincible(ped, true)
      SetBlockingOfNonTemporaryEvents(ped, true)
      TaskPlayAnim(ped,"mini@strip_club@idles@bouncer@base","base", 8.0, 0.0, -1, 1, 0, 0, 0, 0)
	end

end)



