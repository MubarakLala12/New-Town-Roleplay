CTRPFW = nil

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
		if CTRPFW == nil then

            TriggerEvent("CTRPFW:GetObject", function(obj) CTRPFW = obj end)
            Citizen.Wait(200)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
		Citizen.Wait(30 * 60000)
		print('Virus Coke Table')
		TriggerServerEvent('coke:updateTable', false)
	end
end)

local inUse = false
local process
local coord
local location = nil
local enroute
local fueling
local suntrap
local delivering
local hangar
local jerrycan
local checkBoat
local flying
local landing
local hasLanded
local pilot
local virusboat
local boathash
local driveHangar
local blip
local isProcessing = false


Citizen.CreateThread(function()
	while CTRPFW == nil do TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end) Wait(0) end
    CTRPFW.Functions.TriggerCallback('coke:processcoords', function(servercoords)
        process = servercoords
	end)
end)

Citizen.CreateThread(function()
	while CTRPFW == nil do TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end) Wait(0) end
    CTRPFW.Functions.TriggerCallback('coke:startcoords', function(servercoords)
        coord = servercoords
	end)
end)

--[[Citizen.CreateThread(function()
	local sleep
	while not coord do
		Citizen.Wait(0)
	end

	while true do
		sleep = 5
		local player = PlayerPedId()
		local playercoords = GetEntityCoords(player)
		local dist = #(vector3(playercoords.x, playercoords.y, playercoords.z)-vector3(coord.x, coord.y, coord.z))
		if not inUse then
			if dist <= 2.0 then
				sleep = 5
				DrawText3D(coord.x, coord.y, coord.z, 'Press ~g~[ E ]~w~ to rent a Boat')
				if IsControlJustPressed(1, 51) then
					CTRPFW.Functions.TriggerCallback('CTRPFW:HasItem', function(result)
						--CTRPFW.Functions.TriggerCallback('coke:pay' , function(success)
							if result then
								TriggerServerEvent('coke:paid')
								main()
							else
								CTRPFW.Functions.Notify("आपके पास आवश्यक सामग्री नहीं है|", "error")
							end
						--end)
					end, 'greychip')
				end
			else
				sleep = 2000
			end
		elseif dist <= 3 and inUse then
			sleep = 5
			DrawText3D(coord.x, coord.y, coord.z, 'Someone has already requested a boat.')
		else
			sleep = 5000
		end
		Citizen.Wait(sleep)
	end
end)]]

Citizen.CreateThread(function()
	local sleep
	while not coord do
		Citizen.Wait(0)
	end

	while true do
		sleep = 5
		local player = PlayerPedId()
		local playercoords = GetEntityCoords(player)
		local dist = #(vector3(playercoords.x, playercoords.y, playercoords.z)-vector3(coord.x, coord.y, coord.z))
		if not inUse then
			if dist <= 2.0 then
				sleep = 5
				DrawText3D(coord.x, coord.y, coord.z, 'Press ~g~[ E ]~w~ to rent a Boat')
				if IsControlJustPressed(1, 51) then
					CTRPFW.Functions.TriggerCallback('coke:itemTake', function(HasItem, type)
						if HasItem then
							TriggerServerEvent('coke:paid')
							main()
						else
							CTRPFW.Functions.Notify("आपके पास आवश्यक सामग्री नहीं है|", "error")

						end
					end)
				end
			else
				sleep = 2000
			end
		elseif dist <= 3 and inUse then
			sleep = 5
			DrawText3D(coord.x, coord.y, coord.z, 'Someone has already requested a boat.')
		else
			sleep = 5000
		end
		Citizen.Wait(sleep)
	end
end)




RegisterNetEvent('coke:syncTable')
AddEventHandler('coke:syncTable', function(bool)
    inUse = bool
end)

RegisterNetEvent('coke:onUse')
AddEventHandler('coke:onUse', function()
	if Config.useMythic then
		CTRPFW.Functions.Notify("You used Coke", "success")
	end
	local crackhead = PlayerPedId()
	SetPedArmour(crackhead, 30)
	SetTimecycleModifier("DRUG_gas_huffin")
	Citizen.Wait(Config.cokeTime)
	DoScreenFadeOut(1000)
	Citizen.Wait(1000)
	DoScreenFadeIn(2000)
	if Config.useMythic then
		CTRPFW.Functions.Notify("You are feeling normal now..", "success")
	end
	SetPedArmour(crackhead, 0)
	ClearTimecycleModifier()
end)

function main()
	local player = PlayerPedId()
	SetEntityCoords(player, coord.x-0.1,coord.y-0.1,coord.z-1, 0.0,0.0,0.0, false)
	SetEntityHeading(player, Config.doorHeading)
	playAnim("mp_common", "givetake1_a", 3000)
	Citizen.Wait(2000)
	TriggerServerEvent('coke:updateTable', true)
	if Config.useMythic then
		CTRPFW.Functions.Notify("Go to the Pier.", "success")
	end
	rand = math.random(1,#Config.locations)
	location = Config.locations[rand]
	blip1 = AddBlipForCoord(location.fuel.x,location.fuel.y,location.fuel.z)
	SetBlipRoute(blip1, true)
	enroute = true
	print('Virusop')
	Citizen.CreateThread(function()
		while enroute do
			sleep = 5
			local player = PlayerPedId()
			playerpos = GetEntityCoords(player)
			local disttocoord = #(vector3(location.fuel.x,location.fuel.y,location.fuel.z)-vector3(playerpos.x,playerpos.y,playerpos.z))
			if disttocoord <= 20 then
				--boatFly()
				BoatSpawn()
				enroute = false
			else
				sleep = 1500
			end
			Citizen.Wait(sleep)
		end
	end)
end

function BoatSpawn()

	if DoesEntityExist(virusboat) then

	    SetVehicleHasBeenOwnedByPlayer(virusboat,false)
		SetEntityAsNoLongerNeeded(virusboat)
		DeleteEntity(virusboat)
	end

	local boathash = GetHashKey("suntrap")

    RequestModel(boathash)
    while not HasModelLoaded(boathash) do
        Citizen.Wait(0)
    end

    virusboat = CreateVehicle(boathash, location.parking.x, location.parking.y, location.parking.z, 100, true, false)
    local plt = GetVehicleNumberPlateText(virusboat)
	SetVehicleHasBeenOwnedByPlayer(virusboat,true)

	local plate = GetVehicleNumberPlateText(virusboat)
	--TriggerServerEvent('garage:addKeys', plate)
	TriggerEvent("vehiclekeys:client:SetOwner", plate)
	SetVehicleFuelLevel(boat, 5)
	exports['LegacyFuel']:SetFuel(boat, 5)

	RemoveBlip(blip1)
	SetBlipRoute(blip1, false)

	suntrap = false
	delivering = true
	delivery()


    while true do
    	Citizen.Wait(1)
    	 DrawText3D(location.parking.x, location.parking.y, location.parking.z, "Cocaine Boat.")
		 if #(GetEntityCoords(PlayerPedId()) - vector3(location.parking.x, location.parking.y, location.parking.z)) < 8.0 then
    	 	return
    	 end
	end
end

function boatFly()


end


Citizen.CreateThread(function()
	checkBoat = true
	while checkBoat do
		sleep = 100
		if DoesEntityExist(virusboat) then
			if GetVehicleEngineHealth(virusboat) < 0 then
				if Config.useMythic then
					CTRPFW.Functions.Notify("Failed, your boat was Destroyed", "error")
				end
				TriggerServerEvent('coke:updateTable', false)
				RemoveBlip(blip)
				SetBlipRoute(blip, false)
				DeleteEntity(pickupSpawn)
				delivering = false
				checkBoat = false
			end
		else
			sleep = 3000
		end
		Citizen.Wait(sleep)
	end
end)

function delivery()
	if Config.useMythic then
		CTRPFW.Functions.Notify("Get in the boat and pick up the delivery marked on your GPS", "success")
	end
	local pickup = GetHashKey("prop_barrel_float_1")
	blip = AddBlipForCoord(location.delivery.x,location.delivery.y,location.delivery.z)
	SetBlipRoute(blip, true)
	RequestModel(pickup)
	while not HasModelLoaded(pickup) do
		Citizen.Wait(0)
	end
	local pickupSpawn = CreateObject(pickup, location.delivery.x,location.delivery.y,location.delivery.z, true, true, true)
	local player = PlayerPedId()
	Citizen.CreateThread(function()
		while delivering do
			sleep = 5
			local playerpos = GetEntityCoords(player)
			local disttocoord = #(vector3(location.delivery.x,location.delivery.y,location.delivery.z)-vector3(playerpos.x,playerpos.y,playerpos.z))
			if disttocoord <= 10 then
				RemoveBlip(blip)
				SetBlipRoute(blip, false)
				DrawText3D(location.delivery.x,location.delivery.y,location.delivery.z-1, 'Press ~g~[ E ]~w~ to pick up the delivery')
				if IsControlJustPressed(1, 51) then
					delivering = false

					CTRPFW.Functions.Progressbar("picking_", "Picking up the delivery..", lockpickTime, false, true, {
						disableMovement = true,
						disableCarMovement = true,
						disableMouse = false,
						disableCombat = true,
					}, {}, {}, {}, function() -- Done
						DeleteEntity(pickupSpawn)
					end, function() -- Cancel
						CTRPFW.Functions.Notify("Canceled!", "error")
					end)

					Citizen.Wait(2000)
					CTRPFW.Functions.Notify("Picked up the delivery. Return to the Pier marked on your GPS.", "success")
					Citizen.Wait(2000)
					final()
				end
			else
				sleep = 1500
			end
			Citizen.Wait(sleep)
		end
	end)
end
function DrawText3D(x, y, z, text)
	SetTextScale(0.35, 0.35)
	SetTextFont(4)
	SetTextProportional(1)
	SetTextColour(255, 255, 255, 215)
	SetTextEntry("STRING")
	SetTextCentre(true)
	AddTextComponentString(text)
	SetDrawOrigin(x,y,z, 0)
	DrawText(0.0, 0.0)
	local factor = (string.len(text)) / 370
	DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
	ClearDrawOrigin()
end
function final()
	CTRPFW.Functions.Notify("Deliver the boat back to a hangar", "success")
	blip = AddBlipForCoord(location.hangar.x,location.hangar.y,location.hangar.z)
	SetBlipRoute(blip, true)
	hangar = true
	local player = PlayerPedId()
	Citizen.CreateThread(function()
		while hangar do
			sleep = 5
			local playerpos = GetEntityCoords(player)
			local disttocoord = #(vector3(location.hangar.x,location.hangar.y,location.hangar.z)-vector3(playerpos.x,playerpos.y,playerpos.z))
			if IsPedInAnyBoat(PlayerPedId()) and disttocoord <= 10 then
				RemoveBlip(blip)
				SetBlipRoute(blip, false)
				DrawText3D(location.hangar.x,location.hangar.y,location.hangar.z-1, 'Press [E] to park the boat.')
				DrawMarker(27, location.hangar.x,location.hangar.y,location.hangar.z-0.9, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 2.0, 2.0, 2.0, 3, 252, 152, 100, false, true, 2, false, false, false, false)
				if IsControlJustPressed(1, 51) then
					hangar = false
					FreezeEntityPosition(virusboat, true)
					CTRPFW.Functions.Progressbar("lockpick_vehicledoor", "Returning..", 1000, false, true, {
						disableMovement = true,
						disableCarMovement = true,
						disableMouse = false,
						disableCombat = true,
					}, {}, {}, {}, function() -- Done
						DeleteEntity(virusboat)
					end, function() -- Cancel
						DeleteEntity(virusboat)
					end)

					Citizen.Wait(2000)
					TriggerServerEvent('coke:GiveItem')
					TaskLeaveVehicle(player, virusboat, 0)
					SetVehicleDoorsLocked(virusboat, 2)
					Citizen.Wait(1000)
					if Config.useCD then
						cooldown()
					else
						TriggerServerEvent('coke:updateTable', false)
					end
				end
			else
				sleep = 1500
			end
			Citizen.Wait(sleep)
		end
	end)
end

Citizen.CreateThread(function()
	local sleep
	while not process do
		Citizen.Wait(0)
	end
	while true do
		sleep = 5
		local player = PlayerPedId()
		local playercoords = GetEntityCoords(player)
		local dist = #(vector3(playercoords.x,playercoords.y,playercoords.z)-vector3(process.x,process.y,process.z))
		if dist <= 3 and not isProcessing then
			sleep = 5
			DrawText3D(process.x, process.y, process.z, 'Press [ E ] to process coke')
			if IsControlJustPressed(1, 51) then
				isProcessing = true
				CTRPFW.Functions.TriggerCallback('coke:ingredient', function(HasItem, type)
					if HasItem then
						processing()
					else
						CTRPFW.Functions.Notify("You are missing something", "error")
						isProcessing = false
					end
				end)
			end
		else
			sleep = 1500
		end
		Citizen.Wait(sleep)
	end
end)

function processing()
	local player = PlayerPedId()
	SetEntityCoords(player, process.x,process.y,process.z-1, 0.0, 0.0, 0.0, false)
	SetEntityHeading(player, 286.84)
	FreezeEntityPosition(player, true)
	playAnim("anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 30000)

	CTRPFW.Functions.Progressbar("coke-", "Breaking down the coke..", 30000, false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {}, {}, {}, function() -- Done
		FreezeEntityPosition(player, false)
		TriggerServerEvent('coke:processed')
		isProcessing = false
	end, function() -- Cancel
		isProcessing = false
		ClearPedTasksImmediately(player)
		FreezeEntityPosition(player, false)
	end)

end

function cooldown()
	Citizen.Wait(Config.cdTime)
	TriggerServerEvent('coke:updateTable', false)
end

function playAnimPed(animDict, animName, duration, buyer, x,y,z)
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do
      Citizen.Wait(0)
    end
    TaskPlayAnim(pilot, animDict, animName, 1.0, -1.0, duration, 49, 1, false, false, false)
    RemoveAnimDict(animDict)
end

function playAnim(animDict, animName, duration)
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do
      Citizen.Wait(0)
    end
    TaskPlayAnim(PlayerPedId(), animDict, animName, 1.0, -1.0, duration, 49, 1, false, false, false)
    RemoveAnimDict(animDict)
end
