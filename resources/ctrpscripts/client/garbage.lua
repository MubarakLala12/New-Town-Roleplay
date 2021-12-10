CTRPFW = nil

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        if CTRPFW == nil then
            TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)
            Citizen.Wait(200)
        end
    end
end)

isLoggedIn = false
PlayerJob = {}

local GarbageVehicle = nil
local hasVuilniswagen = false
local hasZak = false
local GarbageLocation = 0
local DeliveryBlip = nil
local IsWorking = false
local AmountOfBags = 0
local GarbageObject = nil
local EndBlip = nil
local GarbageBlip = nil
local Earnings = 0
local CanTakeBag = true
local jobscando = 0
RegisterNetEvent('updatejobsg')
AddEventHandler('updatejobsg', function()
jobscando = math.random(5,10)
currentCount = 0
 CTRPFW.Functions.Notify('You Have '..jobscando.." Jobs to do", 'success')
end)
RegisterNetEvent('CTRPFW:Client:OnPlayerLoaded')
AddEventHandler('CTRPFW:Client:OnPlayerLoaded', function()
    isLoggedIn = true
    PlayerJob = CTRPFW.Functions.GetPlayerData().job
    GarbageVehicle = nil
    hasVuilniswagen = false
    hasZak = false
    GarbageLocation = 0
    DeliveryBlip = nil
    IsWorking = false
    AmountOfBags = 0
    GarbageObject = nil
    EndBlip = nil

    if PlayerJob.name == "garbage" then
        GarbageBlip = AddBlipForCoord(Config.Locationsgarbage["main"].coords.x, Config.Locationsgarbage["main"].coords.y, Config.Locationsgarbage["main"].coords.z)
        SetBlipSprite(GarbageBlip, 318)
        SetBlipDisplay(GarbageBlip, 4)
        SetBlipScale(GarbageBlip, 0.6)
        SetBlipAsShortRange(GarbageBlip, true)
        SetBlipColour(GarbageBlip, 39)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(Config.Locationsgarbage["main"].label)
        EndTextCommandSetBlipName(GarbageBlip)
    end
end)

RegisterNetEvent('CTRPFW:Client:OnJobUpdate')
AddEventHandler('CTRPFW:Client:OnJobUpdate', function(JobInfo)
    isLoggedIn = true
    GarbageVehicle = nil
    hasVuilniswagen = false
    hasZak = false
    GarbageLocation = 0
    DeliveryBlip = nil
    IsWorking = false
    AmountOfBags = 0
    GarbageObject = nil
    EndBlip = nil

    if PlayerJob.name == "garbage" then
        if GarbageBlip ~= nil then
            RemoveBlip(GarbageBlip)
        end
    end

    if JobInfo.name == "garbage" then
        GarbageBlip = AddBlipForCoord(Config.Locationsgarbage["main"].coords.x, Config.Locationsgarbage["main"].coords.y, Config.Locationsgarbage["main"].coords.z)
        SetBlipSprite(GarbageBlip, 318)
        SetBlipDisplay(GarbageBlip, 4)
        SetBlipScale(GarbageBlip, 0.6)
        SetBlipAsShortRange(GarbageBlip, true)
        SetBlipColour(GarbageBlip, 39)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(Config.Locationsgarbage["main"].label)
        EndTextCommandSetBlipName(GarbageBlip)
    end

    PlayerJob = JobInfo
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

function DrawText3D2(coords, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(coords.x,coords.y,coords.z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

function LoadModel(hash)
    RequestModel(hash)
    while not HasModelLoaded(hash) do
        Citizen.Wait(10)
    end
end

function LoadAnimation(dict)
    RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(10)
	end
end

function BringBackCar()
    local veh = GetVehiclePedIsIn(GetPlayerPed(-1))
    DeleteVehicle(veh)
    if EndBlip ~= nil then
        RemoveBlip(EndBlip)
    end
    if DeliveryBlip ~= nil then
        RemoveBlip(DeliveryBlip)
    end
    if Earnings > 0 then
        PayCheckLoop(GarbageLocation)
    end
    GarbageVehicle = nil
    hasVuilniswagen = false
    hasZak = false
    GarbageLocation = 0
    DeliveryBlip = nil
    IsWorking = false
    AmountOfBags = 0
    GarbageObject = nil
    EndBlip = nil
end

function BringBackCar2()
    local veh = GetVehiclePedIsIn(GetPlayerPed(-1))
    DeleteVehicle(veh)
    if EndBlip ~= nil then
        RemoveBlip(EndBlip)
    end
    if DeliveryBlip ~= nil then
        RemoveBlip(DeliveryBlip)
    end
    --[[if Earnings > 0 then
        PayCheckLoop(GarbageLocation)
    end]]
    
    GarbageVehicle = nil
    hasVuilniswagen = false
    hasZak = false
    GarbageLocation = 0
    DeliveryBlip = nil
    IsWorking = false
    AmountOfBags = 0
    GarbageObject = nil
    EndBlip = nil
end

function PayCheckLoop(location)
    Citizen.CreateThread(function()
        while Earnings > 0 do
            local ped = GetPlayerPed(-1)
            local pos = GetEntityCoords(ped)
            local coords = Config.Locationsgarbage["paycheck"].coords
            local distance = GetDistanceBetweenCoords(pos, coords.x, coords.y, coords.z, true)

            if distance < 20 then
                DrawMarker(2, coords.x, coords.y, coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 233, 55, 22, 222, false, false, false, true, false, false, false)
                if distance < 1.5 then
                    DrawText3D(coords.x, coords.y, coords.z, "~g~E~w~ - Payslip")
                    if IsControlJustPressed(0, Keys["E"]) then
                        TriggerServerEvent('ctrp-garbagejob:server:PayShit', Earnings, location)
                        Earnings = 0
                    end
                elseif distance < 5 then
                    DrawText3D(coords.x, coords.y, coords.z, "Payslip")
                end
            end

            Citizen.Wait(1)
        end
    end)
end

Citizen.CreateThread(function()
    while true do
        local ped = GetPlayerPed(-1)
        local pos = GetEntityCoords(ped)
        local spawnplek = Config.Locationsgarbage["vehicle"].label
        local InVehicle = IsPedInAnyVehicle(GetPlayerPed(-1), false)
        local distance = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locationsgarbage["vehicle"].coords.x, Config.Locationsgarbage["vehicle"].coords.y, Config.Locationsgarbage["vehicle"].coords.z, true)

        if isLoggedIn then
            if PlayerJob.name == "garbage" then
                if distance < 10.0 then
                    DrawMarker(2, Config.Locationsgarbage["vehicle"].coords.x, Config.Locationsgarbage["vehicle"].coords.y, Config.Locationsgarbage["vehicle"].coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 233, 55, 22, 222, false, false, false, true, false, false, false)
                    if distance < 1.5 then
                        if InVehicle then
                            DrawText3D(Config.Locationsgarbage["vehicle"].coords.x, Config.Locationsgarbage["vehicle"].coords.y, Config.Locationsgarbage["vehicle"].coords.z, "~g~E~w~ - Store Garbage Truck")
                            if IsControlJustReleased(0, Keys["E"]) then
                                if IsWorking then
                                    BringBackCar2()
                                    CTRPFW.Functions.Notify("You scammed us as you left the job! No any refund of your deposit! CHATKO!")
                                else
                                    CTRPFW.Functions.TriggerCallback('ctrp-garbagejob:server:CheckBail', function(DidBail)
                                        if DidBail then
                                            BringBackCar()
                                            CTRPFW.Functions.Notify("You got back your $1000 - deposit!")
                                        
                                        else
                                            CTRPFW.Functions.Notify("You haven\'t put a deposit on this vehicle..")
                                        end
                                    end)
                                end
                            end
                        else
                            DrawText3D(Config.Locationsgarbage["vehicle"].coords.x, Config.Locationsgarbage["vehicle"].coords.y, Config.Locationsgarbage["vehicle"].coords.z, "~g~E~w~ - Garbage Truck")
                            if IsControlJustReleased(0, Keys["E"]) then
                                CTRPFW.Functions.TriggerCallback('ctrp-garbagejob:server:HasMoney', function(HasMoney)
                                    if HasMoney then
                                        local coords = Config.Locationsgarbage["vehicle"].coords
                                            CTRPFW.Functions.SpawnVehicle("trash", function(veh)
                                                GarbageVehicle = veh
                                                SetVehicleNumberPlateText(veh, "GARB"..tostring(math.random(1000, 9999)))
                                                SetEntityHeading(veh, coords.h)
                                                exports['LegacyFuel']:SetFuel(veh, 100.0)
                                                TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
                                                SetEntityAsMissionEntity(veh, true, true)
                                                TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                                                TriggerEvent('updatejobsg')
                                                SetVehicleEngineOn(veh, true, true)
                                                hasVuilniswagen = true
                                                GarbageLocation = 1
                                                IsWorking = true
                                                SetGarbageRoute()
                                                CTRPFW.Functions.Notify("You paid a $1000 - deposit!")
                                                CTRPFW.Functions.Notify("You started working, location has been set on your GPS!")
                                            end, coords, true)
                                        
                                    else
                                        CTRPFW.Functions.Notify("You don\'t have enough money for the deposit.. A deposit costs $1000-")
                                    end
                                end)
                            end
                        end
                    end
                end
            end
        end

        Citizen.Wait(1)
    end
end)

Citizen.CreateThread(function()
    while true do

        local ped = GetPlayerPed(-1)
        local pos = GetEntityCoords(ped)
        local inRange = false

        if isLoggedIn then
            if PlayerJob.name == "garbage" then
                if IsWorking then
                    if GarbageLocation ~= 0 then
                        if DeliveryBlip ~= nil then
                            local DeliveryData = Config.Locationsgarbage["vuilnisbakken"][GarbageLocation]
                            local Distance = GetDistanceBetweenCoords(pos, DeliveryData.coords.x, DeliveryData.coords.y, DeliveryData.coords.z, true)

                            if Distance < 20 or hasZak then
                                LoadAnimation('missfbi4prepp1')
                                DrawMarker(2, DeliveryData.coords.x, DeliveryData.coords.y, DeliveryData.coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 255, 55, 22, 255, false, false, false, false, false, false, false)
                                if not hasZak then
                                    if CanTakeBag then
                                        if Distance < 1.5 then
                                            DrawText3D2(DeliveryData.coords, "~g~E~w~ - Grab Garbage bag")
                                            if IsControlJustPressed(0, 51) then
                                                if AmountOfBags == 0 then
                                                    -- Here he puts how many bags must be delivered if it has not yet been determined
                                                    AmountOfBags = math.random(3, 5)
                                                end
                                                hasZak = true
                                                TakeAnim()
                                            end
                                        elseif Distance < 10 then
                                            DrawText3D2(DeliveryData.coords, "Stand here to take garbage bag.")
                                        end
                                    end
                                else
                                    if DoesEntityExist(GarbageVehicle) then
                                        if Distance < 10 then
                                            DrawText3D2(DeliveryData.coords, "Put the bag in your truck..")
                                        end

                                        local Coords = GetOffsetFromEntityInWorldCoords(GarbageVehicle, 0.0, -4.5, 0.0)
                                        local TruckDist = GetDistanceBetweenCoords(pos, Coords.x, Coords.y, Coords.z, true)

                                        if TruckDist < 2 then
                                            DrawText3D(Coords.x, Coords.y, Coords.z, "~g~E~w~ - Put away Garbage bag")
                                            if IsControlJustPressed(0, 51) then
                                                hasZak = false
                                                local AmountOfLocationsgarbage = #Config.Locationsgarbage["vuilnisbakken"]
                                                -- Kijkt of je alle zakken hebt afgeleverd
                                                if (AmountOfBags - 1) == 0 then
                                                    -- Alle zakken afgeleverd
                                                    Earnings = Earnings + math.random(240, 300)
                                                    if (GarbageLocation + 1) <= jobscando then
                                                        -- Hier zet ie je volgende locatie en ben je nog niet klaar met werken.
                                                        GarbageLocation = GarbageLocation + 1
                                                        SetGarbageRoute()
                                                        CTRPFW.Functions.Notify("All garbage bags are done, get to the next location!")
                                                        TriggerServerEvent("ctrp-garbagejob:server:RewardItem")
                                                    else
                                                        -- Hier ben je klaar met werken.
                                                        CTRPFW.Functions.Notify("You\'re done working! Head back to the duping ground.")
                                                        IsWorking = false
                                                        RemoveBlip(DeliveryBlip)
                                                        SetRouteBack()
                                                    end
                                                    AmountOfBags = 0
                                                    hasZak = false
                                                else
                                                    -- Hier heb je nog niet alle zakken afgeleverd
                                                    AmountOfBags = AmountOfBags - 1
                                                    if AmountOfBags > 1 then
                                                        CTRPFW.Functions.Notify("There are still "..AmountOfBags.." bags left!")
                                                    else
                                                        CTRPFW.Functions.Notify("There is still "..AmountOfBags.." bag left!")
                                                    end
                                                    hasZak = false
                                                end
                                                DeliverAnim()
                                            end
                                        elseif TruckDist < 10 then
                                            DrawText3D(Coords.x, Coords.y, Coords.z, "Stand here..")
                                        end
                                    else
                                        DrawText3D2(DeliveryData.coords, "You don\'t have a truck..")
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end

        if not IsWorking then
            Citizen.Wait(1000)
        end

        Citizen.Wait(1)
    end
end)

function SetGarbageRoute()
    local ped = GetPlayerPed(-1)
    local pos = GetEntityCoords(ped)
    local CurrentLocation = Config.Locationsgarbage["vuilnisbakken"][GarbageLocation]

    if DeliveryBlip ~= nil then
        RemoveBlip(DeliveryBlip)
    end

    DeliveryBlip = AddBlipForCoord(CurrentLocation.coords.x, CurrentLocation.coords.y, CurrentLocation.coords.z)
    SetBlipSprite(DeliveryBlip, 1)
    SetBlipDisplay(DeliveryBlip, 2)
    SetBlipScale(DeliveryBlip, 1.0)
    SetBlipAsShortRange(DeliveryBlip, false)
    SetBlipColour(DeliveryBlip, 27)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName(Config.Locationsgarbage["vuilnisbakken"][GarbageLocation].name)
    EndTextCommandSetBlipName(DeliveryBlip)
    SetBlipRoute(DeliveryBlip, true)
end

function SetRouteBack()
    local ped = GetPlayerPed(-1)
    local pos = GetEntityCoords(ped)
    local inleverpunt = Config.Locationsgarbage["vehicle"]

    EndBlip = AddBlipForCoord(inleverpunt.coords.x, inleverpunt.coords.y, inleverpunt.coords.z)
    SetBlipSprite(EndBlip, 1)
    SetBlipDisplay(EndBlip, 2)
    SetBlipScale(EndBlip, 1.0)
    SetBlipAsShortRange(EndBlip, false)
    SetBlipColour(EndBlip, 3)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName(Config.Locationsgarbage["vehicle"].name)
    EndTextCommandSetBlipName(EndBlip)
    SetBlipRoute(EndBlip, true)
end

function TakeAnim()
    local ped = GetPlayerPed(-1)

    LoadAnimation('missfbi4prepp1')
    TaskPlayAnim(ped, 'missfbi4prepp1', '_bag_walk_garbage_man', 6.0, -6.0, -1, 49, 0, 0, 0, 0)
    GarbageObject = CreateObject(GetHashKey("prop_cs_rub_binbag_01"), 0, 0, 0, true, true, true)
    AttachEntityToEntity(GarbageObject, ped, GetPedBoneIndex(ped, 57005), 0.12, 0.0, -0.05, 220.0, 120.0, 0.0, true, true, false, true, 1, true)

    AnimCheck()
end

function AnimCheck()
    Citizen.CreateThread(function()
        while true do
            local ped = GetPlayerPed(-1)

            if hasZak then
                if not IsEntityPlayingAnim(ped, 'missfbi4prepp1', '_bag_walk_garbage_man', 3) then
                    ClearPedTasksImmediately(ped)
                    LoadAnimation('missfbi4prepp1')
                    TaskPlayAnim(ped, 'missfbi4prepp1', '_bag_walk_garbage_man', 6.0, -6.0, -1, 49, 0, 0, 0, 0)
                end
            else
                break
            end

            Citizen.Wait(200)
        end
    end)
end

function DeliverAnim()
    local ped = GetPlayerPed(-1)

    LoadAnimation('missfbi4prepp1')
    TaskPlayAnim(ped, 'missfbi4prepp1', '_bag_throw_garbage_man', 8.0, 8.0, 1100, 48, 0.0, 0, 0, 0)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped, GetEntityHeading(GarbageVehicle))
    CanTakeBag = false

    SetTimeout(1250, function()
        DetachEntity(GarbageObject, 1, false)
        DeleteObject(GarbageObject)
        TaskPlayAnim(ped, 'missfbi4prepp1', 'exit', 8.0, 8.0, 1100, 48, 0.0, 0, 0, 0)
        FreezeEntityPosition(ped, false)
        GarbageObject = nil
        CanTakeBag = true
    end)
end

AddEventHandler('onResourceStop', function(resource)
    if GetCurrentResourceName() == resource then
        if GarbageObject ~= nil then
            DeleteEntity(GarbageObject)
            GarbageObject = nil
        end
    end
end)
