CTRPFW = nil
PlayerData = {}
isLoggedIn = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
		if CTRPFW == nil then

            TriggerEvent("CTRPFW:GetObject", function(obj) CTRPFW = obj end)
            Citizen.Wait(200)
        end
    end
end)

RegisterNetEvent('CTRPFW:Client:OnPlayerLoaded')
AddEventHandler('CTRPFW:Client:OnPlayerLoaded', function()
    isLoggedIn = true
    PlayerData = CTRPFW.Functions.GetPlayerData()
end)

Citizen.CreateThread(function()
    while true do
		Citizen.Wait(30 * 60000)
		print('Virus Meth')
		TriggerServerEvent('virus-meth:updateTable', false)
	end
end)

local ownsSub = false
local inUse = false
local process
local coord
local location = nil
local enroute
local fueling
local felon
local delivering
local hangar
local jerrycan
local checkcar
local flying
local landing
local hasLanded
local pilot
local virusmeth
local carhash
local driveHangar
local blip



local InService = false
local Hired = true
local BlipSell = nil
local BlipEnd = nil
local BlipCancel = nil
local TargetPos = nil
local NearVan = false
local LastGoal = 0
local DeliveriesCount = 0
local Delivered = false
local xxx = nil
local yyy = nil
local zzz = nil
local Blipy = {}
local JuzBlip = false
local locsDelivered = false

RegisterNetEvent('CTRPFW:Client:OnPlayerUnload')
AddEventHandler('CTRPFW:Client:OnPlayerUnload', function()
	EndMeth()
end)


Citizen.CreateThread(function()
	while CTRPFW == nil do TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end) Wait(0) end
    CTRPFW.Functions.TriggerCallback('virus-meth:processcoords', function(servercoords)
        process = servercoords
	end)
end)

Citizen.CreateThread(function()
	while CTRPFW == nil do TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end) Wait(0) end
    CTRPFW.Functions.TriggerCallback('virus-meth:startcoords', function(servercoords)
        coord = servercoords
	end)
end)


RegisterNetEvent('virus-meth:syncTable')
AddEventHandler('virus-meth:syncTable', function(bool)
    inUse = bool
end)

RegisterNetEvent("virus-meth:startDealing")
AddEventHandler("virus-meth:startDealing", function()
	ownsSub = true
	TriggerEvent('CTRPFW:Notify',"A car has been left outside for you. Go to Agent of Boss Virus marked on map!")
	main()
end)

function main()
	local player = GetPlayerPed(-1)
	playAnim("mp_common", "givetake1_a", 3000)
	Citizen.Wait(2000)
	TriggerServerEvent('virus-meth:updateTable', true)
	if Config.useMythic then
		CTRPFW.Functions.Notify("Go to the point.", "success")
	end
	rand = math.random(1,#Config.locations)
	location = Config.locations[rand]
	blip1 = AddBlipForCoord(location.fuel.x,location.fuel.y,location.fuel.z)
	SetBlipRoute(blip1, true)
	enroute = true
	Citizen.CreateThread(function()
		while enroute do
			sleep = 5
			local player = GetPlayerPed(-1)
			playerpos = GetEntityCoords(player)
			local disttocoord = #(vector3(location.fuel.x,location.fuel.y,location.fuel.z)-vector3(playerpos.x,playerpos.y,playerpos.z))
			if disttocoord <= 20 then
				carSpawn()
				enroute = false
			else
				sleep = 1500
			end
			Citizen.Wait(sleep)
		end
	end)
end

function carSpawn()

	if DoesEntityExist(virusmeth) then

	    SetVehicleHasBeenOwnedByPlayer(virusmeth,false)
		SetEntityAsNoLongerNeeded(virusmeth)
		DeleteEntity(virusmeth)
	end

	local carhash = GetHashKey("felon")

    RequestModel(carhash)
    while not HasModelLoaded(carhash) do
        Citizen.Wait(0)
    end

    virusmeth = CreateVehicle(carhash, location.parking.x, location.parking.y, location.parking.z, 100, true, false)
    local plt = GetVehicleNumberPlateText(virusmeth)
	SetVehicleHasBeenOwnedByPlayer(virusmeth,true)

	local plate = GetVehicleNumberPlateText(virusmeth)
	TriggerEvent("vehiclekeys:client:SetOwner", plate)
	SetVehicleFuelLevel(car, 120)
	exports['LegacyFuel']:SetFuel(car, 120)

	RemoveBlip(blip1)
	SetBlipRoute(blip1, false)

	felon = false
	delivering = true
	ownsSub = true
	StartLocs()


    while true do
    	Citizen.Wait(1)
    	 DrawText3D(location.parking.x, location.parking.y, location.parking.z, "Meth Car.")
		 if #(GetEntityCoords(PlayerPedId()) - vector3(location.parking.x, location.parking.y, location.parking.z)) < 8.0 then
    	 	return
    	 end
	end
end

Citizen.CreateThread(function()
	checkcar = true
	while checkcar do
		sleep = 100
		if DoesEntityExist(virusmeth) then
			if GetVehicleEngineHealth(virusmeth) < 0 then
				if Config.useMythic then
					CTRPFW.Functions.Notify("Failed, your Meth Car was Destroyed", "error")
				end
				TriggerServerEvent('virus-meth:updateTable', false)
				RemoveBlip(blip)
				SetBlipRoute(blip, false)
				
				delivering = false
				checkcar = false
			end
		else
			sleep = 3000
		end
		Citizen.Wait(sleep)
	end
end)

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





function cooldown()
	Citizen.Wait(Config.cdTime)
	TriggerServerEvent('virus-meth:updateTable', false)
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
    TaskPlayAnim(GetPlayerPed(-1), animDict, animName, 1.0, -1.0, duration, 49, 1, false, false, false)
    RemoveAnimDict(animDict)
end


--Spawn Van
function StartLocs()
    if ownsSub then

        InService = true
        DrawTarget()
        AddCancelBlip()
    end
end

function DrawTarget()
    local RandomPoint = math.random(1, 18)
    if DeliveriesCount == 4 then
        RemoveCancelBlip()
        SetBlipRoute(BlipSell, false)
        AddFinnishBlip()
        Delivered = true
				xxx = nil
				yyy = nil
				zzz = nil
    else
      local locs = 4 - DeliveriesCount
      if locs == 1 then
        
      else
        if locs == 4 then
          locs = 'Four'
        elseif locs == 3 then
          locs = 'Three'
        elseif locs == 2 then
          locs = 'Two'
        end
       
      end
        if LastGoal == RandomPoint then
            DrawTarget()
        else
            if RandomPoint == 1 then
								xxx =-1190.15
								yyy =-1548.42
								zzz =4.48
                LastGoal = 1
            elseif RandomPoint == 2 then
								xxx =-1168.03
								yyy =-1580.2
								zzz =4.4
                LastGoal = 2
            elseif RandomPoint == 3 then
								xxx =-1131.07
								yyy =-1551.77
								zzz =4.6
                LastGoal = 3
            elseif RandomPoint == 4 then
                                xxx =-1154.93
								yyy =-1469.07
								zzz =4.38
                LastGoal = 4
            elseif RandomPoint == 5 then
								xxx =-1039.67
								yyy =-1023.13
								zzz =2.15
                LastGoal = 5
            elseif RandomPoint == 6 then
								xxx =-762.83
								yyy =-633.71
								zzz =30.28
                LastGoal = 6
            elseif RandomPoint == 7 then
								xxx =-677.97
								yyy =-854.82
								zzz =24.08
                LastGoal = 7
            elseif RandomPoint == 8 then
                                xxx =84.11
								yyy =-810.05
								zzz =31.42
                LastGoal = 8
            elseif RandomPoint == 9 then
								xxx =151.91
								yyy =-1478.2
								zzz =29.36
                LastGoal = 9
            elseif RandomPoint == 10 then
								xxx =68.9
								yyy =-1570.02
								zzz =29.6
                LastGoal = 10
            elseif RandomPoint == 11 then 
								xxx =216.03
								yyy =-1523.57
								zzz =29.29
                LastGoal = 11
            elseif RandomPoint == 12 then
								xxx =474.9
								yyy =-1456.86
								zzz =29.29
                LastGoal = 12
            elseif RandomPoint == 13 then
								xxx =465.47
								yyy =1673.28
								zzz =29.52
                LastGoal = 13
            elseif RandomPoint == 14 then
								xxx =379.5
								yyy =-1781.35
								zzz =29.46
                LastGoal = 14
            elseif RandomPoint == 15 then
								xxx =105.04
								yyy =-1689.92
								zzz =29.29
                LastGoal = 15
            elseif RandomPoint == 16 then
								xxx =-85.84
								yyy =-1270.59
								zzz =29.3
                LastGoal = 16
            elseif RandomPoint == 17 then
								xxx =-43.27
								yyy =-1041.91
								zzz =28.35
                LastGoal = 17
            elseif RandomPoint == 18 then
								xxx =48.68
								yyy =-1042.48
								zzz =29.59
                LastGoal = 18
            end
		    AddObjBlip(TargetPos)
        end
    end
end

--------------------
-- Creating Blips --
--------------------

function AddObjBlip(TargetPos)
    Blipy['obj'] = AddBlipForCoord(xxx, yyy, zzz)
    SetBlipRoute(Blipy['obj'], true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString('Object')
	EndTextCommandSetBlipName(Blipy['obj'])
end


function AddCancelBlip()
    Blipy['cancel'] = AddBlipForCoord(835.06, -795.28, 26.28)
	SetBlipColour(Blipy['cancel'], 59)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString('Cancel Meth')
	EndTextCommandSetBlipName(Blipy['cancel'])
end


function AddFinnishBlip()
    Blipy['end'] = AddBlipForCoord(835.06, -795.28, 26.28)
	SetBlipColour(Blipy['end'], 2)
    SetBlipRoute(Blipy['end'], true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString('Finish Meth')
	EndTextCommandSetBlipName(Blipy['end'])
end

------------------
-- Delete Blips --
------------------

function RemoveBlipObj()
    RemoveBlip(Blipy['obj'])
end

function RemoveCancelBlip()
    RemoveBlip(Blipy['cancel'])
end

function RemoveAllBlips()
    RemoveBlip(Blipy['obj'])
    RemoveBlip(Blipy['cancel'])
    RemoveBlip(Blipy['end'])
end

-------------------
-- DELIVERY AREA --
-------------------

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local ped = GetPlayerPed(-1)
        local pos = GetEntityCoords(ped)
        local dist = GetDistanceBetweenCoords(pos, xxx, yyy, zzz, true)
        if dist <= 25 and Hired then
            local DeliveryPoint = {
                ["x"] = xxx,
                ["y"] = yyy,
                ["z"] = zzz
            }
            DrawText3Ds(DeliveryPoint["x"],DeliveryPoint["y"],DeliveryPoint["z"], "~r~ Collect here ~s~[E]")
            if dist <= 8 then
                if IsControlJustReleased(0, 38) then
                    TakeLocs()

                end
            end
        end
    end
end)



-------------------
-- DELIVER locs --
-------------------

function loadAnimDict(dict)
	while ( not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(0)
	end
end



function TakeLocs()
    if not locsDelivered then

        locsDelivered = true
        DeliveriesCount = DeliveriesCount + 1
        RemoveBlipObj()
        SetBlipRoute(BlipSell, false)

		TriggerEvent('animations:client:EmoteCommandStart', {"inspect"})
		CTRPFW.Functions.Progressbar("Meth-", "Doing Something..", 3000, false, true, {
			disableMovement = true,
			disableCarMovement = true,
			disableMouse = false,
			disableCombat = true,
		}, {}, {}, {}, function() -- Done
			NextLoc()
        	TriggerServerEvent('virus-meth:itemAdd')
        	Citizen.Wait(2500)
        	locsDelivered = false
			TriggerEvent('animations:client:EmoteCommandStart', {"c"})
		end, function() -- Cancel
			locsDelivered = false
			TriggerEvent('animations:client:EmoteCommandStart', {"c"})
			
		end)
       
        
    end
end


function NextLoc()
    Citizen.Wait(300)
    DrawTarget()
end
-----------------
-- END OF WORK --
-----------------

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local ped = GetPlayerPed(-1)
        local pos = GetEntityCoords(ped)
        local DistanceFromEndZone = GetDistanceBetweenCoords(pos, 835.06, -795.28, 26.28, true)
        local DistanceFromCancelZone = GetDistanceBetweenCoords(pos, 835.06, -795.28, 26.28, true)
        if InService then
            if Delivered then
                if DistanceFromEndZone <= 2.5 then
                    local endPoint = { --x = 571.25, y = 116.78, z = 97.36
                        ["x"] = 835.06,
                        ["y"] = -795.28,
                        ["z"] = 26.28
                    }
                    DrawText3Ds(endPoint["x"],endPoint["y"],endPoint["z"], "Press [~g~E~s~] to ~r~return~s~ ")
                    if DistanceFromEndZone <= 7 then
                        if IsControlJustReleased(0, 38) then
                            EndMeth()
                        end
                    end
                end
            else
                if DistanceFromCancelZone <= 2.5 then
                    local cancel = { --x = 558.52, y = 121.27, z = 97.37
                        ["x"] = 835.06,
                        ["y"] = -795.28,
                        ["z"] = 26.28
                    }
                    DrawText3Ds(cancel["x"],cancel["y"],cancel["z"], "Press [~g~E~s~] to ~r~return~s~")
                    if DistanceFromCancelZone <= 7 then
                        if IsControlJustReleased(0, 38) then
							EndMeth()
                        end
                    end
                end
            end
        end
    end
end)


function EndMeth()
	RemoveAllBlips()
	DeleteEntity(virusmeth)

	InService = false
	BlipSell = nil
	BlipEnd = nil
	BlipCancel = nil
	TargetPos = nil
	LastGoal = nil
	DeliveriesCount = 0
	xxx = nil
	yy = nil
	zzz = nil
	ownsSub = false
	Delivered = false
						
end

----------------------
-- 3D text function --
----------------------
DrawText3Ds = function(x,y,z, text)
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