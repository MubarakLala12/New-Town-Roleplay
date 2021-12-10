-- SELL DRUGS TO NPC BY VIRUS--

-- CTRPFW                 = nil
selling       = false
local has       = false

local policeMessage = {
    "Suspicious situation",
    "Possible drug dealing",
}

Citizen.CreateThread(function()
  	while CTRPFW.Functions.GetPlayerData().job == nil do
		Citizen.Wait(250)
	end
	
	PlayerData = CTRPFW.Functions.GetPlayerData()
end)

RegisterNetEvent('CTRPFW:Client:OnJobUpdate')
AddEventHandler('CTRPFW:Client:OnJobUpdate', function(job)
	CTRPFW.Functions.GetPlayerData().job = job
	Citizen.Wait(5000)
end)

local sellX = -1103.76  --R1
local sellY = -1688.54
local sellZ = 4.27

local sell2X = -1257.39  --R2
local sell2Y = -1461.88
local sell2Z = 4.26

local sell3X = -1193.03  --R3
local sell3Y = -1555.77
local sell3Z = 4.33

--[[Citizen.CreateThread(function()
	while true do
		Citizen.Wait(4)

		if ped ~= 0 then 
			if not IsPedDeadOrDying(ped) and not IsPedInAnyVehicle(ped) then
                        local pedType = GetPedType(ped)
				if ped ~= oldped and not selling and (IsPedAPlayer(ped) == false and pedType ~= 28) then
	
					local pos = GetEntityCoords(ped)
					DrawText3Ds(pos.x, pos.y, pos.z, 'Press E to sell coke')
					if IsControlJustPressed(1, 86) then
						CTRPFW.Functions.TriggerCallback('CTRPFW:HasItem', function(has)
							if has then
								selling = true
								interact()
							else
								CTRPFW.Functions.Notify('चटको!' , "error")
							end
						end, 'cokebaggy')
					end
					
				end
			else
				Citizen.Wait(500)
			end
		else
			Citizen.Wait(500)	
		end
	end
end)]]


currentped = nil
Citizen.CreateThread(function()

while true do
  Citizen.Wait(1)
  local player = PlayerPedId()
  local playerloc = GetEntityCoords(player, 0)
  local handle, ped = FindFirstPed()
  repeat
    success, ped = FindNextPed(handle)
    local pos = GetEntityCoords(ped)
    local distance = Vdist(pos.x, pos.y, pos.z, sellX ,  sellY ,  sellZ, sell2X ,  sell2Y ,  sell2Z)
	local distance2 = Vdist(pos.x, pos.y, pos.z, sell2X ,  sell2Y ,  sell2Z)
	local distance3 = Vdist(pos.x, pos.y, pos.z, sell3X ,  sell3Y ,  sell3Z)
	local dist = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, playerloc['x'], playerloc['y'], playerloc['z'], true)
	
    if IsPedInAnyVehicle(PlayerPedId()) == false then
      if DoesEntityExist(ped)then
        if IsPedDeadOrDying(ped) == false then
			if IsPedInAnyVehicle(ped) == false then
			  local pedType = GetPedType(ped)
			  if pedType ~= 28 and IsPedAPlayer(ped) == false then
				currentped = pos
				if distance < 100 or distance2 < 100 or distance3 < 100 then
				  if dist <= 2 and ped  ~= PlayerPedId() and ped ~= oldped then
					  --controllo
					  TriggerServerEvent('checkD')
					  if has == true then
					  DrawText3Ds(pos.x, pos.y, pos.z, 'Press E to sell coke')
					  if IsControlJustPressed(1, 86) then
							  oldped = ped
							  SetEntityAsMissionEntity(ped)
							  TaskStandStill(ped, 9.0)
							  pos1 = GetEntityCoords(ped)
							  Citizen.Wait(500)
							  TriggerEvent('sell')	   
					  end
					  end
				  end
				end
			  end
			end
		end
      end
    end
  until not success
  EndFindPed(handle)
  if not success then
	Citizen.Wait(2500)
  else
	Citizen.Wait(7)
  end
end
end)

RegisterNetEvent('sell')
AddEventHandler('sell', function()
    local player = PlayerPedId()
    local playerloc = GetEntityCoords(player, 0)
    local distance = GetDistanceBetweenCoords(pos1.x, pos1.y, pos1.z, playerloc['x'], playerloc['y'], playerloc['z'], true)

    if distance <= 2 then
		selling = true
		interact()  
    elseif distance > 2 then
      TriggerServerEvent('sell_dis')
    end
end)

RegisterNetEvent('checkR')
AddEventHandler('checkR', function(test)
  has = test
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)

		local playerPed = PlayerPedId()

		if not IsPedInAnyVehicle(playerPed) or not IsPedDeadOrDying(playerPed) then
			ped = GetPedInFront()
		else
			Citizen.Wait(500)
		end
    end
end)

function GetPedInFront()
	local player = PlayerId()
	local plyPed = GetPlayerPed(player)
	local plyPos = GetEntityCoords(plyPed, false)
	local plyOffset = GetOffsetFromEntityInWorldCoords(plyPed, 0.0, 1.3, 0.0)
	local rayHandle = StartShapeTestCapsule(plyPos.x, plyPos.y, plyPos.z, plyOffset.x, plyOffset.y, plyOffset.z, 1.0, 12, plyPed, 7)
	local _, _, _, _, ped = GetShapeTestResult(rayHandle)
	return ped
end

function DrawText3Ds(x, y, z, text)
	local onScreen,_x,_y=World3dToScreen2d(x,y,z)
	local factor = #text / 370
	local px,py,pz=table.unpack(GetGameplayCamCoords())
	
	SetTextScale(0.35, 0.35)
	SetTextFont(4)
	SetTextProportional(1)
	SetTextColour(255, 255, 255, 215)
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(text)
	DrawText(_x,_y)
	DrawRect(_x,_y + 0.0125, 0.015 + factor, 0.03, 0, 0, 0, 120)
end

function interact()

	oldped = ped
	SetEntityAsMissionEntity(ped)
	TaskStandStill(ped, 9.0)

	CTRPFW.Functions.Progressbar("Sell", "Attempting to secure a sale...", 1500, false, true, {}, {}, {}, {}, function()
	Citizen.Wait(1500)
	
	if PlayerData.job.name == 'police' then
		CTRPFW.Functions.Notify("The buyer has seen you before, they know you\'re a cop!", "error", 4000)
		SetPedAsNoLongerNeeded(oldped)
		selling = false
		return
	end

	if ped ~= oldped then
		CTRPFW.Functions.Notify("You acted sketchy (moved far away) and the buyer was no longer interested.", "error", 5000)
		SetPedAsNoLongerNeeded(oldped)
		selling = false
		return
	end

	local percent = math.random(1, 11)

	if percent <= 4 then
		CTRPFW.Functions.Notify("The buyer was not interested.", "error", 4000)
	elseif percent <= 9 then
		TriggerEvent("animation", source)
		Citizen.Wait(1500)
		TriggerServerEvent('virus-sellnpc:dodeal')
		TriggerEvent("evidence:client:SetStatus", "widepupils", 200)
	else
		local playerCoords = GetEntityCoords(PlayerPedId())
		streetName,_ = GetStreetNameAtCoord(playerCoords.x, playerCoords.y, playerCoords.z)
		streetName = GetStreetNameFromHashKey(streetName)

		CTRPFW.Functions.Notify("The buyer is calling the police!", "error", 4000)
		--TriggerServerEvent('virus-sellnpc:saleInProgress', streetName)
		callPolice()
	end
	
	selling = false
	SetPedAsNoLongerNeeded(oldped)
end)

AddEventHandler('skinchanger:loadSkin', function(character)
	playerGender = character.sex
end)

--[[RegisterNetEvent('animation')
AddEventHandler('animation', function()
  local pid = PlayerPedId()
  RequestAnimDict("amb@prop_human_bum_bin@idle_b")
  		while (not HasAnimDictLoaded("amb@prop_human_bum_bin@idle_b")) do Citizen.Wait(0) end
		TaskPlayAnim(pid,"amb@prop_human_bum_bin@idle_b","idle_d",100.0, 200.0, 0.3, 120, 0.2, 0, 0, 0)
		TaskPlayAnim(ped,"amb@prop_human_bum_bin@idle_b","idle_d",100.0, 200.0, 0.3, 120, 0.2, 0, 0, 0)
		Wait(1500)
		StopAnimTask(pid, "amb@prop_human_bum_bin@idle_b","idle_d", 1.0)
		StopAnimTask(ped, "amb@prop_human_bum_bin@idle_b","idle_d", 1.0)
	end)
end]]

RegisterNetEvent('animation')
AddEventHandler('animation', function()
  local pid = PlayerPedId()
  RequestAnimDict("mp_safehouselost@")
  		while (not HasAnimDictLoaded("mp_safehouselost@")) do Citizen.Wait(0) end
		TaskPlayAnim(pid,"mp_safehouselost@","package_dropoff",100.0, 200.0, 0.3, 120, 0.2, 0, 0, 0)
		TaskPlayAnim(ped,"mp_safehouselost@","package_dropoff",100.0, 200.0, 0.3, 120, 0.2, 0, 0, 0)
		Wait(1500)
		StopAnimTask(pid, "mp_safehouselost@","package_dropoff", 1.0)
		StopAnimTask(ped, "mp_safehouselost@","package_dropoff", 1.0)
	end)
end

function callPolice(coords)
    local title = policeMessage[math.random(1, #policeMessage)]
    local pCoords = GetEntityCoords(PlayerPedId())
    local s1, s2 = Citizen.InvokeNative(0x2EB41072B4C1E4C0, pCoords.x, pCoords.y, pCoords.z, Citizen.PointerValueInt(), Citizen.PointerValueInt())
    local street1 = GetStreetNameFromHashKey(s1)
    local street2 = GetStreetNameFromHashKey(s2)
    local streetLabel = street1
    if street2 ~= nil then streetLabel = street1..' '..street2 end

    TriggerServerEvent('police:server:PoliceAlertMessage', title, streetLabel, coords)
    hasTarget = false
    Citizen.Wait(5000)
end