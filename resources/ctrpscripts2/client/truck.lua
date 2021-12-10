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

isLoggedIn = true
local PlayerJob = {}
local JobsDone = 0
local LocationsDone = {}
local CurrentLocation = nil
local CurrentBlip = nil
local hasBox = false
local isWorking = false
local currentCount = 0
local CurrentPlate = nil
local CurrentTow = nil
local jobscando = 4
local jobsdone = 0
local cooldowntime = 0
local selectedVeh = nil
local TruckVehBlip = nil
RegisterNetEvent('updatejobs')
AddEventHandler('updatejobs', function()
jobscando = math.random(4,8)
currentCount = 0
 CTRPFW.Functions.Notify('You Have '..jobscando.." Jobs to do", 'success')
end)
RegisterNetEvent('CTRPFW:Client:OnPlayerLoaded')
AddEventHandler('CTRPFW:Client:OnPlayerLoaded', function()
    isLoggedIn = true
    PlayerJob = CTRPFW.Functions.GetPlayerData().job
    CurrentLocation = nil
    CurrentBlip = nil
    hasBox = false
    isWorking = false
    JobsDone = 0

    if PlayerJob.name == "trucker" then
        TruckVehBlip = AddBlipForCoord(Config.Locationstruck["vehicle"].coords.x, Config.Locationstruck["vehicle"].coords.y, Config.Locationstruck["vehicle"].coords.z)
        SetBlipSprite(TruckVehBlip, 326)
        SetBlipDisplay(TruckVehBlip, 4)
        SetBlipScale(TruckVehBlip, 0.6)
        SetBlipAsShortRange(TruckVehBlip, true)
        SetBlipColour(TruckVehBlip, 5)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(Config.Locationstruck["vehicle"].label)
        EndTextCommandSetBlipName(TruckVehBlip)
    end
end)

RegisterNetEvent('CTRPFW:Client:OnPlayerUnload')
AddEventHandler('CTRPFW:Client:OnPlayerUnload', function()
    RemoveTruckerBlips()
    CurrentLocation = nil
    CurrentBlip = nil
    hasBox = false
    isWorking = false
    JobsDone = 0
end)

RegisterNetEvent('CTRPFW:Client:OnJobUpdate')
AddEventHandler('CTRPFW:Client:OnJobUpdate', function(JobInfo)
    local OldlayerJob = PlayerJob.name
    PlayerJob = JobInfo

    if PlayerJob.name == "trucker" then
        TruckVehBlip = AddBlipForCoord(Config.Locationstruck["vehicle"].coords.x, Config.Locationstruck["vehicle"].coords.y, Config.Locationstruck["vehicle"].coords.z)
        SetBlipSprite(TruckVehBlip, 326)
        SetBlipDisplay(TruckVehBlip, 4)
        SetBlipScale(TruckVehBlip, 0.6)
        SetBlipAsShortRange(TruckVehBlip, true)
        SetBlipColour(TruckVehBlip, 5)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(Config.Locationstruck["vehicle"].label)
        EndTextCommandSetBlipName(TruckVehBlip)
    elseif OldlayerJob == "trucker" then
        RemoveTruckerBlips()
    end
end)
RegisterNetEvent('startcooldown')
AddEventHandler('startcooldown', function()
cooldowntime = 900000

end)

Citizen.CreateThread(function()
while true do
Citizen.Wait(1)
if cooldowntime >= 1 then
Citizen.Wait(1000)
cooldowntime = cooldowntime - 1000
end
end
end)

Citizen.CreateThread(function()
     TruckerBlip = AddBlipForCoord(Config.Locationstruck["main"].coords.x, Config.Locationstruck["main"].coords.y, Config.Locationstruck["main"].coords.z)
    SetBlipSprite(TruckerBlip, 479)
    SetBlipDisplay(TruckerBlip, 4)
    SetBlipScale(TruckerBlip, 0.6)
    SetBlipAsShortRange(TruckerBlip, true)
    SetBlipColour(TruckerBlip, 5)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName(Config.Locationstruck["main"].label)
    EndTextCommandSetBlipName(TruckerBlip)
    while true do 
        Citizen.Wait(1)
        if isLoggedIn and CTRPFW ~= nil then
            if PlayerJob.name == "trucker" then
                if IsControlJustReleased(0, Keys["DEL"]) then
                    if IsPedInAnyVehicle(GetPlayerPed(-1)) and isTruckerVehicle(GetVehiclePedIsIn(GetPlayerPed(-1), false)) then
                        getNewLocation()
                        CurrentPlate = GetVehicleNumberPlateText(GetVehiclePedIsIn(GetPlayerPed(-1), false))
                    end
                end
                local pos = GetEntityCoords(GetPlayerPed(-1))
                if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locationstruck["vehicle"].coords.x, Config.Locationstruck["vehicle"].coords.y, Config.Locationstruck["vehicle"].coords.z, true) < 10.0) then
                    DrawMarker(2, Config.Locationstruck["vehicle"].coords.x, Config.Locationstruck["vehicle"].coords.y, Config.Locationstruck["vehicle"].coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 200, 200, 222, false, false, false, true, false, false, false)
                    if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locationstruck["vehicle"].coords.x, Config.Locationstruck["vehicle"].coords.y, Config.Locationstruck["vehicle"].coords.z, true) < 1.5) then
                        if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                            DrawText3D(Config.Locationstruck["vehicle"].coords.x, Config.Locationstruck["vehicle"].coords.y, Config.Locationstruck["vehicle"].coords.z, "~g~E~w~ - Store the vehicle")
                        else
                            DrawText3D(Config.Locationstruck["vehicle"].coords.x, Config.Locationstruck["vehicle"].coords.y, Config.Locationstruck["vehicle"].coords.z, "~g~E~w~ - Vehicle")
                        end
                        if IsControlJustReleased(0, Keys["E"]) then
                            if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                                if GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1)), -1) == GetPlayerPed(-1) then
                                    if isTruckerVehicle(GetVehiclePedIsIn(GetPlayerPed(-1), false)) then
                                        DeleteVehicle(GetVehiclePedIsIn(GetPlayerPed(-1)))
                                        TriggerServerEvent('ctrp-trucker:server:DoBail', false)
                                        TriggerEvent('startcooldown')
                                    else
                                        CTRPFW.Functions.Notify('This is not the commercial vehicle!', 'error')
                                    end
                                else
                                    CTRPFW.Functions.Notify('You must be a driver..')
                                end
                            else
                                MenuGarage()
                                Menu.hidden = not Menu.hidden
                            end
                        end
                        Menu.renderGUI()
                    end 
                end
    
                --[[if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locationstruck["main"].coords.x, Config.Locationstruck["main"].coords.y, Config.Locationstruck["main"].coords.z, true) < 4.5) then
                    if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locationstruck["main"].coords.x, Config.Locationstruck["main"].coords.y, Config.Locationstruck["main"].coords.z, true) < 1.5) then
                        DrawText3D(Config.Locationstruck["main"].coords.x, Config.Locationstruck["main"].coords.y, Config.Locationstruck["main"].coords.z, "~g~E~w~ - Payslip")
                        if IsControlJustReleased(0, Keys["E"]) then
                            if JobsDone > 0 then
                                TriggerServerEvent("ctrp-trucker:server:01101110", JobsDone)
                                JobsDone = 0
                                if #LocationsDone == #Config.Locationstruck["stores"] then
                                    LocationsDone = {}
                                end
                                if CurrentBlip ~= nil then
                                    RemoveBlip(CurrentBlip)
                                    CurrentBlip = nil
                                end
                            else
                                CTRPFW.Functions.Notify("You haven't done any work yet..", "error")
                            end
                        end
                    elseif (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locationstruck["main"].coords.x, Config.Locationstruck["main"].coords.y, Config.Locationstruck["main"].coords.z, true) < 2.5) then
                        DrawText3D(Config.Locationstruck["main"].coords.x, Config.Locationstruck["main"].coords.y, Config.Locationstruck["main"].coords.z, "Payslip")
                    end  
                end]]
    
                if CurrentLocation ~= nil  and currentCount < jobscando then
                    if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, CurrentLocation.x, CurrentLocation.y, CurrentLocation.z, true) < 40.0 then
                        if not IsPedInAnyVehicle(GetPlayerPed(-1)) then
                            if not hasBox then
                                local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), true)
                                if isTruckerVehicle(vehicle) and CurrentPlate == GetVehicleNumberPlateText(vehicle) then
                                    local trunkpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.8, 0)
                                    if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, trunkpos.x, trunkpos.y, trunkpos.z, true) < 1.5 and not isWorking then
                                        DrawText3D(trunkpos.x, trunkpos.y, trunkpos.z, "~g~E~w~ - Pick up products")
                                        if IsControlJustReleased(0, Keys["E"]) then
                                            isWorking = true
                                            CTRPFW.Functions.Progressbar("work_carrybox", "Pack box of products..", 2000, false, true, {
                                                disableMovement = true,
                                                disableCarMovement = true,
                                                disableMouse = false,
                                                disableCombat = true,
                                            }, {
                                                animDict = "anim@gangops@facility@servers@",
                                                anim = "hotwire",
                                                flags = 16,
                                            }, {}, {}, function() -- Done
                                                isWorking = false
                                                StopAnimTask(GetPlayerPed(-1), "anim@gangops@facility@servers@", "hotwire", 1.0)
                                                TriggerEvent('animations:client:EmoteCommandStart', {"box"})
                                                hasBox = true
                                            end, function() -- Cancel
                                                isWorking = false
                                                StopAnimTask(GetPlayerPed(-1), "anim@gangops@facility@servers@", "hotwire", 1.0)
                                                CTRPFW.Functions.Notify("Canceled..", "error")
                                            end)
                                        end
                                    else
                                        DrawText3D(trunkpos.x, trunkpos.y, trunkpos.z, "Pick up products")
                                    end
                                end
                            elseif hasBox then
                                if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, CurrentLocation.x, CurrentLocation.y, CurrentLocation.z, true) < 1.5 and not isWorking then
                                    DrawText3D(CurrentLocation.x, CurrentLocation.y, CurrentLocation.z, "~g~E~w~ - Deliver products")
                                    if IsControlJustReleased(0, Keys["E"]) then
                                        isWorking = true
                                        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                                        Citizen.Wait(500)
                                        TriggerEvent('animations:client:EmoteCommandStart', {"bumbin"})
                                        CTRPFW.Functions.Progressbar("work_dropbox", "Deliver box of products..", 2000, false, true, {
                                            disableMovement = true,
                                            disableCarMovement = true,
                                            disableMouse = false,
                                            disableCombat = true,
                                        }, {}, {}, {}, function() -- Done
                                            isWorking = false
                                            ClearPedTasks(GetPlayerPed(-1))
                                            hasBox = false
                                            currentCount = currentCount + 1
                                            if currentCount == CurrentLocation.dropcount then
                                                table.insert(LocationsDone, CurrentLocation.id)
                                                TriggerServerEvent("ctrp-shops:server:RestockShopItems", CurrentLocation.store)
                                                TriggerServerEvent("ctrp-trucker:server:01101110")
                                                TriggerServerEvent('ctrp-trucker:server:RewardItem')
                                                Citizen.Wait(1000)
                                                CTRPFW.Functions.Notify("You have delivered all products, Go to the next point")
                                                if CurrentBlip ~= nil then
                                                    RemoveBlip(CurrentBlip)
                                                    CurrentBlip = nil
                                                end
                                                CurrentLocation = nil
                                                currentCount = 0
                                                JobsDone = JobsDone + 1
                                                getNewLocation()
                                            end
                                        end, function() -- Cancel
                                            isWorking = false
                                            ClearPedTasks(GetPlayerPed(-1))
                                            CTRPFW.Functions.Notify("Cancelled..", "error")
                                        end)
                                    end
                                else
                                    DrawText3D(CurrentLocation.x, CurrentLocation.y, CurrentLocation.z, "Deliver products")
                                end
                            end
                        end
                    end
                end
            else
                Citizen.Wait(1000)
            end
        else
            Citizen.Wait(1000)
        end
    end
end)
RegisterNetEvent('ctrp-trucker:removeblip')
AddEventHandler('ctrp-trucker:removeblip', function()
   RemoveBlip(TruckerBlip)
end)

function getNewLocation()
    local location = getNextClosestLocation()
    if location ~= 0 then
        CurrentLocation = {}
        CurrentLocation.id = location
        CurrentLocation.dropcount = math.random(1, 3)
        CurrentLocation.store = Config.Locationstruck["stores"][location].name
        CurrentLocation.x = Config.Locationstruck["stores"][location].coords.x
        CurrentLocation.y = Config.Locationstruck["stores"][location].coords.y
        CurrentLocation.z = Config.Locationstruck["stores"][location].coords.z

        CurrentBlip = AddBlipForCoord(CurrentLocation.x, CurrentLocation.y, CurrentLocation.z)
        SetBlipColour(CurrentBlip, 3)
        SetBlipRoute(CurrentBlip, true)
        SetBlipRouteColour(CurrentBlip, 3)
    else
        CTRPFW.Functions.Notify("You went to all the shops. Store Back the vehicle!")
        if CurrentBlip ~= nil then
            RemoveBlip(CurrentBlip)
            CurrentBlip = nil
        end
    end
end

function getNextClosestLocation()
    local pos = GetEntityCoords(GetPlayerPed(-1), true)
    local current = 0
    local dist = nil

    for k, _ in pairs(Config.Locationstruck["stores"]) do
        if current ~= 0 then
            if(GetDistanceBetweenCoords(pos, Config.Locationstruck["stores"][k].coords.x, Config.Locationstruck["stores"][k].coords.y, Config.Locationstruck["stores"][k].coords.z, true) < dist)then
                if not hasDoneLocation(k) then
                    current = k
                    dist = GetDistanceBetweenCoords(pos, Config.Locationstruck["stores"][k].coords.x, Config.Locationstruck["stores"][k].coords.y, Config.Locationstruck["stores"][k].coords.z, true)    
                end
            end
        else
            if not hasDoneLocation(k) then
                current = k
                dist = GetDistanceBetweenCoords(pos, Config.Locationstruck["stores"][k].coords.x, Config.Locationstruck["stores"][k].coords.y, Config.Locationstruck["stores"][k].coords.z, true)    
            end
        end
    end

    return current
end

function hasDoneLocation(locationId)
    local retval = false
    if LocationsDone ~= nil and next(LocationsDone) ~= nil then 
        for k, v in pairs(LocationsDone) do
            if v == locationId then
                retval = true
            end
        end
    end
    return retval
end

function isTruckerVehicle(vehicle)
    local retval = false
    for k, v in pairs(Config.Vehiclestruck) do
        if GetEntityModel(vehicle) == GetHashKey(k) then
            retval = true
        end
    end
    return retval
end

function MenuGarage()
    ped = GetPlayerPed(-1);
    MenuTitle = "Garage"
    ClearMenu()
    Menu.addButton("Vehicles", "VehicleList", nil)
    Menu.addButton("Close Menu", "closeMenuFull", nil) 
end

function VehicleList(isDown)
    ped = GetPlayerPed(-1);
    MenuTitle = "Vehicles:"
    ClearMenu()
    for k, v in pairs(Config.Vehiclestruck) do
        Menu.addButton(Config.Vehiclestruck[k], "TakeOutVehicle", k, "Garage", " Motor: 100%", " Body: 100%", " Fuel: 100%")
    end
        
    Menu.addButton("Back", "MenuGarage",nil)
end

function TakeOutVehicle(vehicleInfo)
if cooldowntime >= 1 then
    CTRPFW.Functions.Notify("You need to wait ".. cooldowntime/1000 .."seconds to start job again")
else
    TriggerServerEvent('ctrp-trucker:server:DoBail', true, vehicleInfo)
    selectedVeh = vehicleInfo
end
end

function RemoveTruckerBlips()
    if TruckVehBlip ~= nil then
        RemoveBlip(TruckVehBlip)
        TruckVehBlip = nil
    end

    if CurrentBlip ~= nil then
        RemoveBlip(CurrentBlip)
        CurrentBlip = nil
    end
end

RegisterNetEvent('ctrp-trucker:client:SpawnVehicle')
AddEventHandler('ctrp-trucker:client:SpawnVehicle', function()
    local vehicleInfo = selectedVeh
    local coords = Config.Locationstruck["vehicle"].coords
    CTRPFW.Functions.SpawnVehicle(vehicleInfo, function(veh)
        SetVehicleNumberPlateText(veh, "AMAZON"..tostring(math.random(10, 99)))
        SetEntityHeading(veh, coords.h)
        exports['LegacyFuel']:SetFuel(veh, 100.0)
        closeMenuFull()
        TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
        SetEntityAsMissionEntity(veh, true, true)
        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
        SetVehicleEngineOn(veh, true, true)
        CurrentPlate = GetVehicleNumberPlateText(veh)
        getNewLocation()
    end, coords, true)
end)

function closeMenuFull()
    Menu.hidden = true
    currentGarage = nil
    ClearMenu()
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