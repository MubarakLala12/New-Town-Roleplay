--------------------
-- CTRPFW Core Stuff --
--------------------
CTRPFW = nil

Citizen.CreateThread(function()
    while CTRPFW == nil do
        TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)
        Citizen.Wait(200)
    end
end)


---------------
-- Variables --
---------------
local mining = false
local miningwash = false
local isWashing = false
local isMelting = false



---------------------
-- Citizen Threads --
---------------------

Citizen.CreateThread(function()
	while CTRPFW == nil do TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end) Wait(0) end
    CTRPFW.Functions.TriggerCallback('ctrp-mining:processcoords', function(servercoords)
        process = servercoords
	end)
end)

Citizen.CreateThread(function()
	while CTRPFW == nil do TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end) Wait(0) end
    CTRPFW.Functions.TriggerCallback('ctrp-mining:process2coords', function(servercoords)
        process2 = servercoords
	end)
end)

Citizen.CreateThread(function()
	while CTRPFW == nil do TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end) Wait(0) end
    CTRPFW.Functions.TriggerCallback('ctrp-mining:process3coords', function(servercoords)
        process3 = servercoords
	end)
end)

Citizen.CreateThread(function()
	while CTRPFW == nil do TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end) Wait(0) end
    CTRPFW.Functions.TriggerCallback('ctrp-mining:process4coords', function(servercoords)
        process4 = servercoords
	end)
end)



Citizen.CreateThread(function()
    while true do
        local closeTo = 0
        for k, v in pairs(Config.MiningPositions) do
            if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), v.coords, true) <= 2.5 then
                closeTo = v
                break
            end
        end
        
        if type(closeTo) == 'table' then
            while GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), closeTo.coords, true) <= 2.5 do
                local counter = 0
                Wait(0)
                helpText(Strings['press_mine'])
                if IsControlJustReleased(0, 38) then
                    local player, distance = CTRPFW.Functions.GetClosestPlayer()
                    if distance == -1 or distance >= 9.0 then
                        mining = true
                        SetEntityCoords(PlayerPedId(), closeTo.coords)
                        SetEntityHeading(PlayerPedId(), closeTo.heading)
                        FreezeEntityPosition(PlayerPedId(), true)

                        local model = loadModel(GetHashKey(Config.Objects['pickaxe']))
                        local axe = CreateObject(model, GetEntityCoords(PlayerPedId()), true, false, false)
                        AttachEntityToEntity(axe, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.09, 0.03, -0.02, -78.0, 13.0, 28.0, false, true, true, true, 0, true)

                        while mining do
                            Wait(0)
                            SetCurrentPedWeapon(PlayerPedId(), GetHashKey('WEAPON_UNARMED'))
                            helpText(Strings['mining_info'])
                            DisableControlAction(0, 24, true)
                            if IsDisabledControlJustReleased(0, 215) then
                                local dict = loadDict('melee@hatchet@streamed_core')
                                TaskPlayAnim(PlayerPedId(), dict, 'plyr_rear_takedown_b', 8.0, -8.0, -1, 2, 0, false, false, false)
                                local timer = GetGameTimer() + 800
                                while GetGameTimer() <= timer do Wait(0) DisableControlAction(0, 24, true) end
                                ClearPedTasks(PlayerPedId())

                                TriggerServerEvent('ctrp-mining:getItemNew')

                            elseif IsControlJustReleased(0, 194) then
                                DeleteObject(axe)
                                FreezeEntityPosition(PlayerPedId(), false)
                                break
                            end
                        end
                        mining = false
                        DeleteObject(axe)
                        FreezeEntityPosition(PlayerPedId(), false)
                    else
                        CTRPFW.Functions.Notify(Strings['someone_close'], "error")
                    end
                end
            end
        end
        Wait(250)
    end
end)


Citizen.CreateThread(function()
	local sleep
	while not process do
		Citizen.Wait(0)
	end
	while true do
		sleep = 5
		local player = GetPlayerPed(-1)
		local playercoords = GetEntityCoords(player)
		local dist = #(vector3(playercoords.x,playercoords.y,playercoords.z)-vector3(process.x,process.y,process.z))
		if dist <= 3 and not isWashing then
			sleep = 5
			DrawText3D(process.x, process.y, process.z, 'Press [ E ] to wash')
			if IsControlJustPressed(1, 51) then
				isWashing = true
				CTRPFW.Functions.TriggerCallback('CTRPFW:HasItem', function(result)
                        if result then
                            washing()
                        else
                            CTRPFW.Functions.Notify("You don't have material", "error")
                            isWashing = false
                        end
				end, 'stone')
			end
		else
			sleep = 1500
		end
		Citizen.Wait(sleep)
	end
end)

Citizen.CreateThread(function()
	local sleep
	while not process3 do
		Citizen.Wait(0)
	end
	while true do
		sleep = 5
		local player = GetPlayerPed(-1)
		local playercoords = GetEntityCoords(player)
		local dist = #(vector3(playercoords.x,playercoords.y,playercoords.z)-vector3(process3.x,process3.y,process3.z))
		if dist <= 3 and not isWashing then
			sleep = 5
			DrawText3D(process3.x, process3.y, process3.z, 'Press [ E ] to wash')
			if IsControlJustPressed(1, 51) then
				isWashing = true
				CTRPFW.Functions.TriggerCallback('CTRPFW:HasItem', function(result)
                        if result then
                            washing2()
                        else
                            CTRPFW.Functions.Notify("You don't have material", "error")
                            isWashing = false
                        end
				end, 'stone')
			end
		else
			sleep = 1500
		end
		Citizen.Wait(sleep)
	end
end)

Citizen.CreateThread(function()
	local sleep
	while not process4 do
		Citizen.Wait(0)
	end
	while true do
		sleep = 5
		local player = GetPlayerPed(-1)
		local playercoords = GetEntityCoords(player)
		local dist = #(vector3(playercoords.x,playercoords.y,playercoords.z)-vector3(process4.x,process4.y,process4.z))
		if dist <= 3 and not isWashing then
			sleep = 5
			DrawText3D(process4.x, process4.y, process4.z, 'Press [ E ] to wash')
			if IsControlJustPressed(1, 51) then
				isWashing = true
				CTRPFW.Functions.TriggerCallback('CTRPFW:HasItem', function(result)
                        if result then
                            washing3()
                        else
                            CTRPFW.Functions.Notify("You don't have material", "error")
                            isWashing = false
                        end
				end, 'stone')
			end
		else
			sleep = 1500
		end
		Citizen.Wait(sleep)
	end
end)


--melting

Citizen.CreateThread(function()
	local sleep
	while not process2 do
		Citizen.Wait(0)
	end
	while true do
		sleep = 5
		local player = GetPlayerPed(-1)
		local playercoords = GetEntityCoords(player)
		local dist = #(vector3(playercoords.x,playercoords.y,playercoords.z)-vector3(process2.x,process2.y,process2.z))
		if dist <= 3 and not isMelting then
			sleep = 5
			DrawText3D(process2.x, process2.y, process2.z, 'Press [ E ] to melt')
			if IsControlJustPressed(1, 51) then
				isMelting = true
				CTRPFW.Functions.TriggerCallback('CTRPFW:HasItem', function(result)
                        if result then
                            melting()
                        else
                            CTRPFW.Functions.Notify("You don't have enough ", "error")
                            isMelting = false
                        end
				end, 'washedstone')
			end
		else
			sleep = 1500
		end
		Citizen.Wait(sleep)
	end
end)





loadModel = function(model)
    while not HasModelLoaded(model) do Wait(0) RequestModel(model) end
    return model
end

loadDict = function(dict, anim)
    while not HasAnimDictLoaded(dict) do Wait(0) RequestAnimDict(dict) end
    return dict
end

helpText = function(msg)
    BeginTextCommandDisplayHelp('STRING')
    AddTextComponentSubstringPlayerName(msg)
    EndTextCommandDisplayHelp(0, false, true, -1)
end



Citizen.CreateThread(function()
    local blip = AddBlipForCoord(282.53, 2847.5, 43.64)
	SetBlipSprite(blip, 0)
	SetBlipDisplay(blip, 0)
	SetBlipScale(blip, 0)
	SetBlipAsShortRange(blip, true)
	SetBlipColour(blip, 5)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentSubstringPlayerName("Mining Sell")
    EndTextCommandSetBlipName(blip)
end)

Citizen.CreateThread(function()
    local blip = AddBlipForCoord(-1390.75,4314.45,0.52)
	SetBlipSprite(blip, 467)
	SetBlipDisplay(blip, 4)
	SetBlipScale(blip, 0.8)
	SetBlipAsShortRange(blip, true)
	SetBlipColour(blip, 5)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentSubstringPlayerName("Wash Mine")
    EndTextCommandSetBlipName(blip)
end)

Citizen.CreateThread(function()
    local blip = AddBlipForCoord(-1442.0,2251.75,17.04)
	SetBlipSprite(blip, 467)
	SetBlipDisplay(blip, 4)
	SetBlipScale(blip, 0.8)
	SetBlipAsShortRange(blip, true)
	SetBlipColour(blip, 5)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentSubstringPlayerName("Wash Mine")
    EndTextCommandSetBlipName(blip)
end)

Citizen.CreateThread(function()
    local blip = AddBlipForCoord(-1500.84,1575.53,104.82)
	SetBlipSprite(blip, 467)
	SetBlipDisplay(blip, 4)
	SetBlipScale(blip, 0.8)
	SetBlipAsShortRange(blip, true)
	SetBlipColour(blip, 5)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentSubstringPlayerName("Wash Mine")
    EndTextCommandSetBlipName(blip)
end)

Citizen.CreateThread(function()
    local blip = AddBlipForCoord(-590.69, 2069.47, 131.23)
	SetBlipSprite(blip, 527)
	SetBlipDisplay(blip, 4)
	SetBlipScale(blip, 0.8)
	SetBlipAsShortRange(blip, true)
	SetBlipColour(blip, 5)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentSubstringPlayerName("Mining")
    EndTextCommandSetBlipName(blip)
end)

-- Code

DrawText3D = function(x, y, z, text)
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

Citizen.CreateThread(function()
    while true do
        local ped = GetPlayerPed(-1)
        local pos = GetEntityCoords(ped)
        local inRange = false

        if not notInteressted then
            for k, v in pairs(Config.SellLocations) do
                local dist = GetDistanceBetweenCoords(pos, v["coords"]["x"], v["coords"]["y"], v["coords"]["z"], true)

                if dist < 20 then
                    inRange = true

                    if dist < 1 then
                        DrawText3D(v["coords"]["x"], v["coords"]["y"], v["coords"]["z"] - 0.1, '~g~E~w~ - Sell Mining Items')

                        if IsControlJustPressed(0, 38) then
                            TriggerServerEvent('ctrp-mining:sell')
                        end
                    end
                end
            end
        else
            Citizen.Wait(5000)
        end

        if not inRange then
            Citizen.Wait(1500)
        end

        Citizen.Wait(3)
    end
end)



function ClearTimeOut()
    notInteressted = not notInteressted
end

function washing()
	local player = GetPlayerPed(-1)
	--SetEntityCoords(player, process.x,process.y,process.z-1, 0.0, 0.0, 0.0, false)
	--SetEntityHeading(player, 286.84)
	--FreezeEntityPosition(player, true)
	local dict = loadDict('amb@prop_human_bum_bin@idle_a')
    TaskPlayAnim((player), 'amb@prop_human_bum_bin@idle_a', 'idle_a', 8.0, 8.0, -1, 81, 0, 0, 0, 0)
    helpText(Strings['warning'])

	CTRPFW.Functions.Progressbar("wash-", "Washing..", 8000, false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {}, {}, {}, function() -- Done
		--[[FreezeEntityPosition(player, false)
        TriggerServerEvent('ctrp-mining:washing')]]
		CTRPFW.Functions.TriggerCallback('CTRPFW:HasItem', function(result5)
			if result5 then
				TriggerServerEvent('ctrp-mining:washing')
				
			else
				print("bc virus toh bunty hai??")
				CTRPFW.Functions.Notify("You don't have material", "error")
				isWashing = false
			end
		end, 'stone')
		FreezeEntityPosition(player, false)
		isWashing = false
	end, function() -- Cancel
		isWashing = false
		ClearPedTasksImmediately(player)
		FreezeEntityPosition(player, false)
	end)

end

function washing2()
	local player = GetPlayerPed(-1)
	--SetEntityCoords(player, process3.x,process3.y,process3.z-1, 0.0, 0.0, 0.0, false)
	--SetEntityHeading(player, 286.84)
	--FreezeEntityPosition(player, true)
	local dict = loadDict('amb@prop_human_bum_bin@idle_a')
    TaskPlayAnim((player), 'amb@prop_human_bum_bin@idle_a', 'idle_a', 8.0, 8.0, -1, 81, 0, 0, 0, 0)
    helpText(Strings['warning'])

	CTRPFW.Functions.Progressbar("wash-", "Washing..", 8000, false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {}, {}, {}, function() -- Done
		--[[FreezeEntityPosition(player, false)
        TriggerServerEvent('ctrp-mining:washing')]]
		CTRPFW.Functions.TriggerCallback('CTRPFW:HasItem', function(result4)
			if result4 then
				TriggerServerEvent('ctrp-mining:washing')
				
			else
				print("bc virus toh bunty hai??")
				CTRPFW.Functions.Notify("You don't have material", "error")
				isWashing = false
			end
		end, 'stone')
		FreezeEntityPosition(player, false)
		isWashing = false
	end, function() -- Cancel
		isWashing = false
		ClearPedTasksImmediately(player)
		FreezeEntityPosition(player, false)
	end)

end

function washing3()
	local player = GetPlayerPed(-1)
	--SetEntityCoords(player, process4.x,process4.y,process4.z-1, 0.0, 0.0, 0.0, false)
	--SetEntityHeading(player, 286.84)
	--FreezeEntityPosition(player, true)
	local dict = loadDict('amb@prop_human_bum_bin@idle_a')
    TaskPlayAnim((player), 'amb@prop_human_bum_bin@idle_a', 'idle_a', 8.0, 8.0, -1, 81, 0, 0, 0, 0)
    helpText(Strings['warning'])

	CTRPFW.Functions.Progressbar("wash-", "Washing..", 8000, false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {}, {}, {}, function() -- Done
		--[[FreezeEntityPosition(player, false)
        TriggerServerEvent('ctrp-mining:washing')]]
		CTRPFW.Functions.TriggerCallback('CTRPFW:HasItem', function(result3)
			if result3 then
				TriggerServerEvent('ctrp-mining:washing')
				
			else
				print("bc virus toh bunty hai??")
				CTRPFW.Functions.Notify("You don't have material", "error")
				isWashing = false
			end
		end, 'stone')
		FreezeEntityPosition(player, false)
		isWashing = false
	end, function() -- Cancel
		isWashing = false
		ClearPedTasksImmediately(player)
		FreezeEntityPosition(player, false)
	end)

end


--[[function Remelting()
    local ped = PlayerPedId()
    RequestAnimDict("amb@prop_human_bum_bin@idle_a")
    remeltingActive = true
    Citizen.Wait(100)
    FreezeEntityPosition(ped, true)
    TaskPlayAnim((ped), 'amb@prop_human_bum_bin@idle_a', 'idle_a', 8.0, 8.0, -1, 81, 0, 0, 0, 0)
    TriggerEvent("ctrp-mining:timer")
    Citizen.Wait(15900)
    ClearPedTasks(ped)
    FreezeEntityPosition(ped, false)
    remeltingActive = false
end]]

function melting()
	local player = GetPlayerPed(-1)
	--SetEntityCoords(player, process2.x,process2.y,process2.z-1, 0.0, 0.0, 0.0, false)
	--SetEntityHeading(player, 286.84)
	--FreezeEntityPosition(player, true)
	local dict = loadDict('amb@prop_human_bum_bin@idle_a')
    TaskPlayAnim((player), 'amb@prop_human_bum_bin@idle_a', 'idle_a', 8.0, 8.0, -1, 81, 0, 0, 0, 0)
    helpText(Strings['warning1'])

	CTRPFW.Functions.Progressbar("melt-", "Melting..", 15000, false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {}, {}, {}, function() -- Done
		--[[FreezeEntityPosition(player, false)
        TriggerServerEvent('ctrp-mining:remelting')]]
		CTRPFW.Functions.TriggerCallback('CTRPFW:HasItem', function(result2)
			if result2 then
				TriggerServerEvent('ctrp-mining:remelting')
				
			else
				print("bc virus toh bunty hai??")
				CTRPFW.Functions.Notify("You don't have material", "error")
				isMelting = false
			end
		end, 'washedstone')
		ClearPedTasksImmediately(player)
		FreezeEntityPosition(player, false)
		isMelting = false
	end, function() -- Cancel
		isMelting = false
		ClearPedTasksImmediately(player)
		FreezeEntityPosition(player, false)
	end)

end

---------------
--STRESS CODE--
---------------

function virusStress()
	local player = GetPlayerPed(-1)
	TriggerServerEvent('virus-hudcomponent:Server:GainStress', math.random(0, 1))
	TriggerServerEvent("CTRPFW:Server:SetMetaData", "hunger", CTRPFW.Functions.GetPlayerData().metadata["hunger"] - 0.5)
	TriggerServerEvent("CTRPFW:Server:SetMetaData", "thirst", CTRPFW.Functions.GetPlayerData().metadata["thirst"] - 0.5)
end

---------------
--PLACE STRESS--
---------------


local stressX = -589.26 --Front Starting Point
local stressY = 2062.85
local stressZ = 130.93

local stress1X = -586.31  --Front Starting Point1
local stress1Y = 2046.47
local stress1Z = 129.66

local stress2X = -581.06 --Front Starting Point2
local stress2Y = 2035.45
local stress2Z = 128.72

local stress3X = -573.73 --Front Starting Point3
local stress3Y = 2026.71
local stress3Z = 127.34

local stress4X = -555.01 --Front Starting Point4
local stress4Y = 2003.17
local stress4Z = 126.47

local stress5X = -543.36 --Front Starting Point5
local stress5Y = 1983.43
local stress5Z = 126.38

local stress6X = -523.51 --Front Starting Point6
local stress6Y = 1979.46
local stress6Z = 126.08

local stress7X = -492.21 --Front Starting Point7
local stress7Y = 1983.52
local stress7Z = 124.22

local stress8X = -464.21 --Front Starting Point8
local stress8Y = 1996.17
local stress8Z = 122.9

local stress9X = -446.07 --Front Starting Point9
local stress9Y = 2014.44
local stress9Z = 122.9

local stress10X = -468.83 --Front Starting Point10
local stress10Y = 2071.68
local stress10Z = 119.91

local stress11X = -429.07 --Front Starting Point11
local stress11Y = 2063.56
local stress11Z = 120.08

local stress12X = -540.1 --Front Starting Point12
local stress12Y = 1952.62
local stress12Z = 125.69

local stress13X = -536.19 --Front Starting Point13
local stress13Y = 1913.8
local stress13Z = 122.97

local stress14X = -498.14 --Front Starting Point14
local stress14Y = 1893.58
local stress14Z = 120.05



Citizen.CreateThread(function()
    while true do
   
		local player = GetPlayerPed(-1)
		local pos = GetEntityCoords(player)
		local distance = Vdist(pos.x, pos.y, pos.z, stressX , stressY , stressZ, stress1X , stress1Y , stress1Z)
		local distance1 = Vdist(pos.x, pos.y, pos.z, stress1X , stress1Y , stress1Z)
		local distance2 = Vdist(pos.x, pos.y, pos.z, stress2X , stress2Y , stress2Z)
		local distance3 = Vdist(pos.x, pos.y, pos.z, stress3X , stress3Y , stress3Z)
		local distance4 = Vdist(pos.x, pos.y, pos.z, stress4X , stress4Y , stress4Z)
		local distance5 = Vdist(pos.x, pos.y, pos.z, stress5X , stress5Y , stress5Z)
		local distance6 = Vdist(pos.x, pos.y, pos.z, stress6X , stress6Y , stress6Z)
		local distance7 = Vdist(pos.x, pos.y, pos.z, stress7X , stress7Y , stress7Z)
		local distance8 = Vdist(pos.x, pos.y, pos.z, stress8X , stress8Y , stress8Z)
		local distance9 = Vdist(pos.x, pos.y, pos.z, stress9X , stress9Y , stress9Z)
		local distance10 = Vdist(pos.x, pos.y, pos.z, stress10X , stress10Y , stress10Z)
		local distance11 = Vdist(pos.x, pos.y, pos.z, stress11X , stress11Y , stress11Z)
		local distance12 = Vdist(pos.x, pos.y, pos.z, stress12X , stress12Y , stress12Z)
		local distance13 = Vdist(pos.x, pos.y, pos.z, stress13X , stress13Y , stress13Z)
		local distance14 = Vdist(pos.x, pos.y, pos.z, stress14X , stress14Y , stress14Z)

		if distance < 10 or distance1 < 10 or distance2 < 10 or distance3 < 10 or distance4 < 20 or distance5 < 20 or distance6 < 20 or distance7 < 20 or distance8 < 20 or distance12 < 30 then 
			TriggerEvent('CTRPFW:Notify', "Your body feeling heat.", "error")
			TriggerServerEvent("CTRPFW:Server:SetMetaData", "hunger", CTRPFW.Functions.GetPlayerData().metadata["hunger"] - 0.4)
			TriggerServerEvent("CTRPFW:Server:SetMetaData", "thirst", CTRPFW.Functions.GetPlayerData().metadata["thirst"] - 0.4)
			
		elseif distance9 < 50 or distance10 < 30 or distance11 < 30 or distance13 < 40 or distance14 < 20 then 
			TriggerEvent('CTRPFW:Notify', "Your body feeling more heat.", "error")
			TriggerServerEvent("CTRPFW:Server:SetMetaData", "hunger", CTRPFW.Functions.GetPlayerData().metadata["hunger"] - 0.8)
			TriggerServerEvent("CTRPFW:Server:SetMetaData", "thirst", CTRPFW.Functions.GetPlayerData().metadata["thirst"] - 0.8)
		
		end
		Citizen.Wait(10000)
        
    end
end)

--[[Citizen.CreateThread(function()
    while true do
        
		print('working')

		local player = GetPlayerPed(-1)
		local pos = GetEntityCoords(player)
		local distance1 = Vdist(pos.x, pos.y, pos.z, stress1X , stress1Y , stress1Z)


		if distance1 < 5  then
			TriggerEvent('CTRPFW:Notify', "Your Body starts getting sweat", "error")
			
		else 
			print('no notify')
		end
		Wait(30000)
        
    end
end)]]