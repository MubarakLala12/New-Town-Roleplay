CTRPFW = nil

Citizen.CreateThread(function()
    while CTRPFW == nil do
        TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)
        Citizen.Wait(200)
    end
end)

-- Code

local InsideMethlab = true
local ClosestMethlab = 0
local CurrentTask = 0
local UsingLaptop = false
local CarryPackage = nil

local startX = 1005.73  --starting
local startY = -3200.38
local startZ = -38.52

local processX = 1012.35  --starting
local processY = -3195.0
local processZ = -38.99
local complete = false
local hacki = false


Citizen.CreateThread(function()
    while true do
	Citizen.Wait(0)
		local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
		local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, startX, startY, startZ)

		if dist <= 2.5 then
		DrawText3Ds(startX, startY, startZ, "~g~[E]~w~ To Process Meth")
		end
--
		if dist <= 0.5 then
			if IsControlJustPressed(0, Keys['E']) then -- "E"
                processmeth()
			end			
		end
	end
end)

Citizen.CreateThread(function()
    while true do
	Citizen.Wait(0)
		local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
		local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, processX, processY, processZ)

		if dist <= 2.5 then
		DrawText3Ds(processX, processY, processZ, "~g~[E]~w~ To Pack Meth")
		end

		if dist <= 0.5 then
			if IsControlJustPressed(0, Keys['E']) then -- "E"
                packmeth()
			end			
		end
	end
end)

function DrawText3Ds(x, y, z, text)
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

function SetClosestMethlab()
    local pos = GetEntityCoords(GetPlayerPed(-1), true)
    local current = nil
    local dist = nil
    for id, methlab in pairs(Config.Locations["laboratories"]) do
        if current ~= nil then
            if(GetDistanceBetweenCoords(pos, Config.Locations["laboratories"][id].coords.x, Config.Locations["laboratories"][id].coords.y, Config.Locations["laboratories"][id].coords.z, true) < dist)then
                current = id
                dist = GetDistanceBetweenCoords(pos, Config.Locations["laboratories"][id].coords.x, Config.Locations["laboratories"][id].coords.y, Config.Locations["laboratories"][id].coords.z, true)
            end
        else
            dist = GetDistanceBetweenCoords(pos, Config.Locations["laboratories"][id].coords.x, Config.Locations["laboratories"][id].coords.y, Config.Locations["laboratories"][id].coords.z, true)
            current = id
        end
    end
    ClosestMethlab = current
end

Citizen.CreateThread(function()
    Wait(500)
    CTRPFW.Functions.TriggerCallback('ctrp-methlab:server:GetData', function(data)
        Config.CurrentLab = data.CurrentLab
        -- print('Lab entry has been set to location: '..data.CurrentLab)
    end)

    CurrentTask = GetCurrentTask()

    -- print('Current Task: '..CurrentTask)

    while true do
        SetClosestMethlab()
        Citizen.Wait(1000)
    end
end)

Citizen.CreateThread(function()
    Config.CurrentLab = math.random(1, #Config.Locations["laboratories"])

    while true do
        local inRange = false
        local ped = GetPlayerPed(-1)
        local pos = GetEntityCoords(ped)

        -- Exit distance check
        if InsideMethlab then
            if(GetDistanceBetweenCoords(pos, Config.Locations["exit"].coords.x, Config.Locations["exit"].coords.y, Config.Locations["exit"].coords.z, true) < 20)then
                inRange = true
                if(GetDistanceBetweenCoords(pos, Config.Locations["exit"].coords.x, Config.Locations["exit"].coords.y, Config.Locations["exit"].coords.z, true) < 1)then
                    DrawText3Ds(Config.Locations["exit"].coords.x, Config.Locations["exit"].coords.y, Config.Locations["exit"].coords.z, '~g~E~w~ - Leave methlab')
                    if IsControlJustPressed(0, Keys["E"]) then
                        ExitMethlab()
                    end
                end
            end
        end

        -- Laptop distance check
        if InsideMethlab then
            if(GetDistanceBetweenCoords(pos, Config.Locations["laptop"].coords.x, Config.Locations["laptop"].coords.y, Config.Locations["laptop"].coords.z, true) < 20)then
                inRange = true
                DrawMarker(2, Config.Locations["laptop"].coords.x, Config.Locations["laptop"].coords.y, Config.Locations["laptop"].coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.3, 0.1, 222, 11, 11, 155, false, false, false, true, false, false, false)
                if(GetDistanceBetweenCoords(pos, Config.Locations["laptop"].coords.x, Config.Locations["laptop"].coords.y, Config.Locations["laptop"].coords.z, true) < 1)then
                    DrawText3Ds(Config.Locations["laptop"].coords.x - 0.04, Config.Locations["laptop"].coords.y + 0.45, Config.Locations["laptop"].coords.z, '~g~E~w~ - Use laptop')
                    if IsControlJustPressed(0, Keys["E"]) then
                        if not complete then
                            if not hacki then
                                CTRPFW.Functions.TriggerCallback('CTRPFW:HasItem', function(result)
                                --StartHackingm()
                                    if result then
                                        TaskStartScenarioInPlace(GetPlayerPed(-1), "PROP_HUMAN_BUM_BIN", 0, true)
                                        CTRPFW.Functions.Progressbar("starting", "Hacking..", 10000, false, true, {}, {}, {}, {}, function() -- Done
                                            hacki = true
                                            TriggerEvent("virus-fingerprint:Start")
                                        end)
                                    else 
                                        CTRPFW.Functions.Notify("You\'re Missing Something", "error")
                                    end
                                end , "trojan_usb")
                            end
                        else
                            CTRPFW.Functions.Notify("You\'re already doing this work", "error")
                        end
                    end
                   
                end
            end
        end


        --if not Config.CooldownActive then
            if InsideMethlab then
                if CurrentTask == 1 then
                    if Config.Tasks[CurrentTask].ingredients.current == 0 then
                        if not Config.Ingredients["lab"].taken or CarryPackage ~= nil then
                            if(GetDistanceBetweenCoords(pos, Config.Ingredients["lab"].coords.x, Config.Ingredients["lab"].coords.y, Config.Ingredients["lab"].coords.z, true) < 20)then
                                inRange = true
                                DrawMarker(2, Config.Ingredients["lab"].coords.x, Config.Ingredients["lab"].coords.y, Config.Ingredients["lab"].coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.3, 0.1, 222, 11, 11, 155, false, false, false, true, false, false, false)
                                if(GetDistanceBetweenCoords(pos, Config.Ingredients["lab"].coords.x, Config.Ingredients["lab"].coords.y, Config.Ingredients["lab"].coords.z, true) < 1)then
                                    if CarryPackage == nil then
                                        DrawText3Ds(Config.Ingredients["lab"].coords.x, Config.Ingredients["lab"].coords.y, Config.Ingredients["lab"].coords.z, '~g~E~w~ - Grab Aluminium Oxide')
                                        if IsControlJustPressed(0, Keys["E"]) then
                                            TaskStartScenarioInPlace(GetPlayerPed(-1), "PROP_HUMAN_BUM_BIN", 0, true)
                                            CTRPFW.Functions.Progressbar("pickup_reycle_package", "Grabbing ingredients..", 5000, false, true, {
                                                disableMovement = true,
                                                disableCarMovement = true,
                                                disableMouse = false,
                                                disableCombat = true,
                                            }, {}, {}, {}, function() -- Done
                                                ClearPedTasks(GetPlayerPed(-1))
                                                TakeIngredients()
                                            end)
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end

           --[[ if InsideMethlab then
                if CurrentTask ~= 0 then
                    if(GetDistanceBetweenCoords(pos, Config.Tasks[CurrentTask].coords.x, Config.Tasks[CurrentTask].coords.y, Config.Tasks[CurrentTask].coords.z, true) < 20)then
                        inRange = true
                        DrawMarker(2, Config.Tasks[CurrentTask].coords.x,  Config.Tasks[CurrentTask].coords.y,  Config.Tasks[CurrentTask].coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.3, 0.1, 222, 11, 11, 155, false, false, false, true, false, false, false)
                        if(GetDistanceBetweenCoords(pos, Config.Tasks[CurrentTask].coords.x, Config.Tasks[CurrentTask].coords.y, Config.Tasks[CurrentTask].coords.z, true) < 1)then
                            DrawText3Ds(Config.Tasks[CurrentTask].coords.x, Config.Tasks[CurrentTask].coords.y, Config.Tasks[CurrentTask].coords.z, Config.Tasks[CurrentTask].label)
                            DrawText3Ds(Config.Tasks[CurrentTask].coords.x, Config.Tasks[CurrentTask].coords.y, Config.Tasks[CurrentTask].coords.z - 0.2, Config.Tasks[CurrentTask].ingredients.current..'/'..Config.Tasks[CurrentTask].ingredients.needed..' Ingrediënten')
                            if Config.Tasks[CurrentTask].ingredients.current == Config.Tasks[CurrentTask].ingredients.needed then
                                if not Config.Tasks[CurrentTask].started then
                                    if not Config.Tasks[CurrentTask].done then
                                        DrawText3Ds(Config.Tasks[CurrentTask].coords.x, Config.Tasks[CurrentTask].coords.y, Config.Tasks[CurrentTask].coords.z - 0.4, '[E] Start machine')
                                        if IsControlJustPressed(0, Keys["E"]) then
                                            StartMachine(CurrentTask)
                                        end
                                    else
                                        DrawText3Ds(Config.Tasks[CurrentTask].coords.x, Config.Tasks[CurrentTask].coords.y, Config.Tasks[CurrentTask].coords.z - 0.4, '[E] Take ingredients')
                                        if IsControlJustPressed(0, Keys["E"]) then
                                            FinishMachine(CurrentTask)
                                        end
                                    end
                                else
                                    DrawText3Ds(Config.Tasks[CurrentTask].coords.x, Config.Tasks[CurrentTask].coords.y, Config.Tasks[CurrentTask].coords.z - 0.4, 'Done in '..Config.Tasks[CurrentTask].timeremaining..'s')
                                end
                            else
                                if CurrentTask == 1 then
                                    if CarryPackage ~= nil then
                                        if Config.Tasks[CurrentTask].ingredients.current == 0 then
                                            DrawText3Ds(Config.Tasks[CurrentTask].coords.x, Config.Tasks[CurrentTask].coords.y, Config.Tasks[CurrentTask].coords.z + 0.2, '[E] Packing ingredients')
                                            if IsControlJustPressed(0, Keys["E"]) then
                                                DropIngredients()
                                                Config.Tasks[CurrentTask].ingredients.current = 1
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end]]

        if not inRange then
            Citizen.Wait(1000)
        end

        Citizen.Wait(3)
    end
end)

function StartMachine(k)
    Citizen.CreateThread(function()
        Config.Tasks[k].started = true
        while Config.Tasks[k].timeremaining > 0 do
            Config.Tasks[k].timeremaining = Config.Tasks[k].timeremaining - 1
            Citizen.Wait(1000)
        end
        Config.Tasks[k].started = false
        Config.Tasks[k].done = true
    end)
end

function FinishMachine(k)
    Config.Tasks[k].done = false
    Config.Tasks[k].timeremaining = Config.Tasks[k].duration
    Config.Tasks[k].ingredients.current = 0

    if CurrentTask + 1 > #Config.Tasks then
        Config.CooldownActive = true
    else
        -- print('next task')
    end
end

RegisterNetEvent('ctrp-methlab:client:UseLabKey')
AddEventHandler('ctrp-methlab:client:UseLabKey', function(labkey)
    if ClosestMethlab == Config.CurrentLab then
        local ped = GetPlayerPed(-1)
        local pos = GetEntityCoords(ped)

        local dist = GetDistanceBetweenCoords(pos, Config.Locations["laboratories"][ClosestMethlab].coords.x, Config.Locations["laboratories"][ClosestMethlab].coords.y, Config.Locations["laboratories"][ClosestMethlab].coords.z, true)
        if dist < 1 then
            if labkey == ClosestMethlab then
                EnterMethlab()
            else
                CTRPFW.Functions.Notify('This isn\'t the right key..', 'error')
            end
        end
    end
end)

function OpenLaptop()
    if not UsingLaptop then
        local ped = GetPlayerPed(-1)
        local dict = "mp_prison_break"
        local anim = "hack_loop"
        local flag = 0

        SetEntityCoords(ped, Config.Locations["laptop"].coords.x, Config.Locations["laptop"].coords.y, Config.Locations["laptop"].coords.z - 0.98, 0.0, 0.0, 0.0, false)
        SetEntityHeading(ped, Config.Locations["laptop"].coords.h)

        LoadAnimationDict(dict)
        TaskPlayAnim(ped, dict, anim, 2.0, 2.0, -1, flag, 0, false, false, false)

        Citizen.Wait(400)
        SendNUIMessage({
            action = "open",
            tasks = Config.Tasks,
        })
        SetNuiFocus(true, true)
        UsingLaptop = true
    end
end

function CloseLaptop()
    local ped = GetPlayerPed(-1)
    local dict = "mp_prison_break"
    local flag = 0

    TaskPlayAnim(ped, dict, "exit", 8.0, 8.0, -1, flag, 0, false, false, false)

    SetNuiFocus(false, false)
    UsingLaptop = false
end

RegisterNUICallback('Close', CloseLaptop)

function EnterMethlab()
    local ped = GetPlayerPed(-1)

    OpenDoorAnimation()
    InsideMethlab = true
    Citizen.Wait(500)
    DoScreenFadeOut(250)
    Citizen.Wait(250)
    SetEntityCoords(ped, Config.Locations["exit"].coords.x, Config.Locations["exit"].coords.y, Config.Locations["exit"].coords.z - 0.98)
    SetEntityHeading(ped, Config.Locations["exit"].coords.h)
    Citizen.Wait(1000)
    DoScreenFadeIn(250)
end

function ExitMethlab()
    local ped = GetPlayerPed(-1)
    local dict = "mp_heists@keypad@"
    local anim = "idle_a"
    local flag = 0
    local keypad = {
        coords = {x = 996.92, y = -3199.85, z = -36.4, h = 94.5, r = 1.0}, 
    }

    CurrentTask = GetCurrentTask()

    SetEntityCoords(ped, keypad.coords.x, keypad.coords.y, keypad.coords.z - 0.98)
    SetEntityHeading(ped, keypad.coords.h)

    LoadAnimationDict(dict) 

    TaskPlayAnim(ped, dict, anim, 8.0, 8.0, -1, flag, 0, false, false, false)
    Citizen.Wait(2500)
    TaskPlayAnim(ped, dict, "exit", 2.0, 2.0, -1, flag, 0, false, false, false)
    Citizen.Wait(1000)
    DoScreenFadeOut(250)
    Citizen.Wait(250)
    SetEntityCoords(ped, Config.Locations["laboratories"][Config.CurrentLab].coords.x, Config.Locations["laboratories"][Config.CurrentLab].coords.y, Config.Locations["laboratories"][Config.CurrentLab].coords.z - 0.98)
    SetEntityHeading(ped, Config.Locations["laboratories"][Config.CurrentLab].coords.h)
    InsideMethlab = false
    Citizen.Wait(1000)
    DoScreenFadeIn(250)
end

function LoadAnimationDict(dict)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Citizen.Wait(1)
    end
end

function OpenDoorAnimation()
    local ped = GetPlayerPed(-1)

    LoadAnimationDict("anim@heists@keycard@") 
    TaskPlayAnim(ped, "anim@heists@keycard@", "exit", 5.0, 1.0, -1, 16, 0, 0, 0, 0)
    Citizen.Wait(400)
    ClearPedTasks(ped)
end

function GetCurrentTask()
    local currenttask = nil
    for k, v in pairs(Config.Tasks) do
        if not v.completed then
            currenttask = k
            break
        end
    end
    return currenttask
end

function TakeIngredients()
    local pos = GetEntityCoords(GetPlayerPed(-1), true)
   
    TaskPlayAnim(GetPlayerPed(-1), "anim@heists@box_carry@" ,"idle", 5.0, -1, -1, 50, 0, false, false, false)
    
    AttachEntityToEntity(object, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 57005), 0.05, 0.1, -0.3, 300.0, 250.0, 20.0, true, true, false, true, 1, true)
    TriggerServerEvent("ctrp-methlab:server:receiveoxy")
end

function DropIngredients()
    ClearPedTasks(GetPlayerPed(-1))
    DetachEntity(CarryPackage, true, true)
    DeleteObject(CarryPackage)
    CarryPackage = nil
end


function processmeth()
	CTRPFW.Functions.TriggerCallback('ctrp-methlab:server:ingredient', function(HasItem, type)
        if HasItem then
            local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0.9, -0.98))
		
			LoadAnimationDict('amb@medic@standing@tendtodead@idle_a')
            TaskPlayAnim(GetPlayerPed(-1), 'amb@medic@standing@tendtodead@idle_a', 'idle_a', 8.0, -8.0, -1, 1, 0.0, 0, 0, 0)
          
            TriggerServerEvent("InteractSound_SV:PlayOnSource", "machine", 0.1)
			CTRPFW.Functions.Progressbar("process-", "Processing..", 18000, false, true, {
				disableMovement = true,
				disableCarMovement = true,
				disableMouse = false,
				disableCombat = true,
			}, {}, {}, {}, function()
				TriggerServerEvent("ctrp-methlab:server:processed")
				ClearPedTasks(GetPlayerPed(-1))
			
			end, function() -- Cancel
				LoadAnimationDict('amb@medic@standing@tendtodead@exit')
				TaskPlayAnim(GetPlayerPed(-1), 'amb@medic@standing@tendtodead@exit', 'exit', 8.0, -8.0, -1, 1, 0.0, 0, 0, 0)
				ClearPedTasks(GetPlayerPed(-1))
				
				FreezeEntityPosition(GetPlayerPed(-1),false)
            end)
        else
		
		CTRPFW.Functions.Notify("You have ingredients", "error")
		end
	end)
end

function packmeth()
	CTRPFW.Functions.TriggerCallback('ctrp-methlab:server:packing', function(HasItem, type)
        if HasItem then
            local playerPed = PlayerPedId()
            TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_PARKING_METER", 0, true)
			CTRPFW.Functions.Progressbar("process-", "Packing..", 15000, false, true, {
				disableMovement = true,
				disableCarMovement = true,
				disableMouse = false,
				disableCombat = true,
			}, {}, {}, {}, function()
				TriggerServerEvent("ctrp-methlab:server:packed",3)
				ClearPedTasks(GetPlayerPed(-1))
				
			end, function() -- Cancel
				
				ClearPedTasks(GetPlayerPed(-1))
				
				FreezeEntityPosition(GetPlayerPed(-1),false)
            end)
        else
		
		CTRPFW.Functions.Notify("You Missing Something", "error")
		end
	end)
end

RegisterNetEvent('professor:meth:run')
AddEventHandler('professor:meth:run',function()
    hacki = false
    CreateAccetonVehicle()
end)

local AccetonPickups = {
	[1] =  { ['x'] =215.74, ['y'] =-1523.48, ['z'] =29.29},
	[2] =  { ['x'] =-159.39,['y'] = -1432.05,['z'] = 31.27},
	[3] =  { ['x'] =308.0,['y'] = -1286.34, ['z'] =30.71},
	[4] =  { ['x'] =65.59,['y'] = -1467.5, ['z'] =29.3},
	[5] =  { ['x'] =167.1,['y'] = -1709.67, ['z'] =29.29},
	[6] =  { ['x'] =368.09,['y'] = -1271.89, ['z'] =32.7},
	[7] =  { ['x'] =-355.88,['y'] = -1486.83, ['z'] =30.19},
	[8] =  { ['x'] =212.23, ['y'] =-1856.25, ['z'] =27.19 },
    -- [8] =  { ['x'] = -155.88,['y'] = -751.76,['z'] = 33.76,['h'] = 251.82, ['info'] = ' 8' },
}

local carspawns = {
	[1] =  { ['x'] = 1730.59,['y'] = -1671.48,['z'] = 112.16,['h'] = 193.23 }
}

local carpick = {
    [1] = "felon",
    [2] = "kuruma",
    [3] = "sultan",
    [4] = "granger",
    [5] = "tailgater",
}

-- Citizen.CreateThread(function()
--     while true do
--         Citizen.Wait(7)
--         if not complete then
--             if IsControlJustPressed(0, 38) then
--                 CreateAccetonVehicle()
--             end 
--         end
--     end
-- end)


function CreateAccetonVehicle()

    local carName =carpick[math.random(#carpick)]
    -- print(carName)

    local spawnpoint = 1
    for i = 1, #carspawns do
	    local caisseo = GetClosestVehicle(carspawns[i]["x"], carspawns[i]["y"], carspawns[i]["z"], 3.500, 0, 70)
		if not DoesEntityExist(caisseo) then
			spawnpoint = i
		end
    end
    -- print(spawnpoint)
    local plateText = math.random(11111111,99999999)
	CTRPFW.Functions.SpawnVehicle(carName, function(veh)
        -- print(plateText)
        SetVehicleNumberPlateText(veh, plateText)
        SetEntityHeading(veh, carspawns[spawnpoint].h)
        exports['LegacyFuel']:SetFuel(veh, math.random(50,70))
        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
    end, carspawns[spawnpoint], true)
   
    complete = true
    Citizen.Wait(10)
    Acceton(plateText)
    -- while texti do
    -- 	Citizen.Wait(1)
    -- 	 DrawText3Ds(carspawns[spawnpoint]["x"], carspawns[spawnpoint]["y"], carspawns[spawnpoint]["z"], "Your Delivery Car (Stolen).")
    -- 	 if #(GetEntityCoords(PlayerPedId()) - vector3(carspawns[spawnpoint]["x"], carspawns[spawnpoint]["y"], carspawns[spawnpoint]["z"])) < 8.0 then
    -- 	 	return
    -- 	 end
    -- end
end

local done = true
local p = false
local am
local re = false
function Acceton(plateText)
    local pickups = 1
     am = math.random(3,5)
    -- am = 1
    --  print(randomloc.x,randomloc.y,randomloc.z)
    --  print(am)
    local first = true
    while complete do
        
        sleep = 1000
        if am > 0 then
            -- workstarted = false
            -- ret(plateText)
            if done then
                local randomloc =AccetonPickups[math.random(#AccetonPickups)]
                if first then
                    CTRPFW.Functions.Notify("wait for few seconds for location", "error")
                    first = false
                else
                    CTRPFW.Functions.Notify("wait for few seconds for next location", "error")
                end
                -- AddCancelBlip()
                Citizen.Wait(20000,30000)
                -- for i = 1, #AccetonPickups do
                --     pickups = i
                -- end
                Citizen.Wait(50)
                -- SetNewWaypoint(randomloc.x,randomloc.y)
                route(randomloc.x,randomloc.y,randomloc.z)
                
                done = false
                p = true
                Citizen.Wait(10)
                pick(randomloc)
            end
        else
            -- RemoveCancelBlip()
            AddFinnishBlip()
            workstarted = false
            re = true
            complete = false
            ret(plateText)
        end
        Citizen.Wait(sleep)
    end
end
local blipi = {}
function route(xxx,yyy,zzz)
    blipi['obj'] = AddBlipForCoord(xxx, yyy, zzz)
    SetBlipRoute(blipi['obj'], true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString('pickup')
	EndTextCommandSetBlipName(blipi['obj'])
end

-- function AddCancelBlip()
--     blipi['cancel'] = AddBlipForCoord(1730.59, -1671.48, 112.16)
-- 		SetBlipColour(blipi['cancel'], 59)
-- 	BeginTextCommandSetBlipName("STRING")
-- 	AddTextComponentString('cancel orders')
-- 	EndTextCommandSetBlipName(blipi['cancel'])
-- end
function AddFinnishBlip()
    blipi['end'] = AddBlipForCoord(1730.59, -1671.48, 112.16)
		SetBlipColour(blipi['end'], 2)
    SetBlipRoute(blipi['end'], true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString('finish work')
	EndTextCommandSetBlipName(blipi['end'])
end

function RemoveBlipObj()
    RemoveBlip(blipi['obj'])
end

-- function RemoveCancelBlip()
--     RemoveBlip(blipi['cancel'])
-- end


function RemoveAllBlips()
    -- RemoveBlip(blipi['obj'])
    -- RemoveBlip(blipi['cancel'])
    RemoveBlip(blipi['end'])
end

function ret(plateText)
    while not workstarted do
        sleep = 1000
        local c = GetEntityCoords(PlayerPedId())
        local store = vector3(1730.59, -1671.48, 112.16)
        local dit2 = GetDistanceBetweenCoords(c.x, c.y, c.z, store.x, store.y, store.z, false)
        if dit2 <= 20 then
            sleep = 7
            if dit2 <= 10 then
                DrawMarker(2, store.x, store.y, store.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 0, 0, 222, false, false, false, true, false, false, false)
                if dit2 <= 2 then
                    DrawText3Ds(store.x, store.y, store.z, "[~g~E~w~]")
                    local vehi = GetVehiclePedIsIn(PlayerPedId(), false)
                    local firstplate =tostring(plateText)
                    local secondplate = tostring(GetVehicleNumberPlateText(vehi))
                    -- print(firstplate, secondplate)
                    
                    if IsControlJustPressed(0, 38) then
                        if firstplate == secondplate then
                            CheckPlayers(GetVehiclePedIsIn(PlayerPedId()))
                            workstarted = true
                        else
                            CTRPFW.Functions.Notify("bewaqoof samjha he kiya same start car return karo warna chatko", "error")
                        end
                    end
                    
                elseif dit2 <= 5 then
                    DrawText3Ds(store.x, store.y, store.z, "Return vehicle")
                end
            end
        end
        Citizen.Wait(sleep)
    end
end

function pick(randomloc)
    while p do
        sleep = 1000
        local c = GetEntityCoords(PlayerPedId())
        local pickupCoords = randomloc
        local dist = GetDistanceBetweenCoords(c.x, c.y, c.z, pickupCoords.x, pickupCoords.y, pickupCoords.z, false)
        if dist <= 20 then
            sleep = 7
            if dist <= 10 then
                DrawMarker(2, pickupCoords.x, pickupCoords.y, pickupCoords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 0, 0, 222, false, false, false, true, false, false, false)
                if dist <= 2 then
                    DrawText3Ds(pickupCoords.x, pickupCoords.y, pickupCoords.z, "[~g~E~w~]")
                    if IsControlJustReleased(0, 38) then
                        if not IsPedInAnyVehicle(PlayerPedId(), false) then
                            -- CTRPFW.Functions.Progressbar("pickss", "Picking..", 10000, false, true, {}, {}, {}, {}, function() -- Done
                            --     p = false
                            --     RemoveBlipObj()
                            --     TriggerServerEvent('ctrp-methlab:server:re:ac')
                            --     am = am - 1
                            --     done = true
                            -- end)

                            CTRPFW.Functions.Progressbar("pickss", "Picking..", 10000, false, true, {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true,
                            }, {
                                animDict = "anim@gangops@facility@servers@",
                                anim = "hotwire",
                                flags = 16,
                            }, {}, {}, function() -- Done
                                p = false
                                RemoveBlipObj()
                                TriggerServerEvent('ctrp-methlab:server:re:ac')
                                am = am - 1
                                done = true
                            end)
                        else
                            CTRPFW.Functions.Notify("You Need To Get Out Of The Vehicle", "error")
                        end
                    end
                elseif dist <= 5 then
                    DrawText3Ds(pickupCoords.x, pickupCoords.y, pickupCoords.z, "Pickup Acceton")
                end
            end
        end
        Citizen.Wait(sleep)
    end  
end

function CheckPlayers(vehicle)
    for i = -1, 5,1 do                
        seat = GetPedInVehicleSeat(vehicle,i)
        if seat ~= 0 then
            TaskLeaveVehicle(seat,vehicle,0)
            SetVehicleDoorsLocked(vehicle)
            Wait(1500)
            CTRPFW.Functions.DeleteVehicle(vehicle)
            -- RemoveCancelBlip()
            RemoveAllBlips()
        end
   end
end