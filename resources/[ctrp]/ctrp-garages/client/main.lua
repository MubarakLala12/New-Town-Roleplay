-- CTRPFW = nil

-- Citizen.CreateThread(function() 
--     while true do
--         Citizen.Wait(1)
--         if CTRPFW == nil then
--             TriggerEvent("CTRPFW:GetObject", function(obj) CTRPFW = obj end)    
--             Citizen.Wait(200)
--         end
--     end
-- end)

--- CODE

local currentHouseGarage = nil
local hasGarageKey = nil
local currentGarage = nil
local OutsideVehicles = {}

RegisterNetEvent('ctrp-garages:client:setHouseGarage')
AddEventHandler('ctrp-garages:client:setHouseGarage', function(house, hasKey)
    currentHouseGarage = house
    hasGarageKey = hasKey
end)

RegisterNetEvent('ctrp-garages:client:houseGarageConfig')
AddEventHandler('ctrp-garages:client:houseGarageConfig', function(garageConfig)
    HouseGarages = garageConfig
end)

RegisterNetEvent('ctrp-garages:client:addHouseGarage')
AddEventHandler('ctrp-garages:client:addHouseGarage', function(house, garageInfo)
    HouseGarages[house] = garageInfo
end)

-- function AddOutsideVehicle(plate, veh)
--     OutsideVehicles[plate] = veh
--     TriggerServerEvent('ctrp-garages:server:UpdateOutsideVehicles', OutsideVehicles)
-- end

RegisterNetEvent('ctrp-garages:client:takeOutDepot')
AddEventHandler('ctrp-garages:client:takeOutDepot', function(vehicle)
    if OutsideVehicles ~= nil and next(OutsideVehicles) ~= nil then
        if OutsideVehicles[vehicle.plate] ~= nil then
            local VehExists = DoesEntityExist(OutsideVehicles[vehicle.plate])
            if not VehExists then
                CTRPFW.Functions.SpawnVehicle(vehicle.vehicle, function(veh)
                    TriggerServerEvent("InteractSound_SV:PlayOnSource", "vout", 0.3)
                    CTRPFW.Functions.TriggerCallback('ctrp-garage:server:GetVehicleProperties', function(properties)
                        CTRPFW.Functions.SetVehicleProperties(veh, properties)
                        enginePercent = round(vehicle.engine / 10, 0)
                        bodyPercent = round(vehicle.body / 10, 0)
                        currentFuel = vehicle.fuel

                        if vehicle.plate ~= nil then
                            DeleteVehicle(OutsideVehicles[vehicle.plate])
                            OutsideVehicles[vehicle.plate] = veh
                            TriggerServerEvent('ctrp-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                        end

                        if vehicle.status ~= nil and next(vehicle.status) ~= nil then
                            TriggerServerEvent('ctrp-vehicletuning:server:LoadStatus', vehicle.status, vehicle.plate)
                        end
                        
                        if vehicle.drivingdistance ~= nil then
                            local amount = round(vehicle.drivingdistance / 1000, -2)
                            TriggerEvent('ctrp-hud:client:UpdateDrivingMeters', true, amount)
                            TriggerServerEvent('ctrp-vehicletuning:server:UpdateDrivingDistance', vehicle.drivingdistance, vehicle.plate)
                        end

                        if vehicle.vehicle == "urus" then
                            SetVehicleExtra(veh, 1, false)
                            SetVehicleExtra(veh, 2, true)
                        end

                        SetVehicleNumberPlateText(veh, vehicle.plate)
                        SetEntityHeading(veh, Depots[currentGarage].takeVehicle.h)
                        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
                        exports['LegacyFuel']:SetFuel(veh, vehicle.fuel)
                        SetEntityAsMissionEntity(veh, true, true)
                        doCarDamage(veh, vehicle)
                        TriggerServerEvent('ctrp-garage:server:updateVehicleState', 0, vehicle.plate, vehicle.garage)
                        CTRPFW.Functions.Notify("Vehicle out: Motor: " .. enginePercent .. "% Body: " .. bodyPercent.. "% Fuel: "..currentFuel.. "%", "primary", 4500)
                        closeMenuFull()
                        SetVehicleEngineOn(veh, true, true)
                    end, vehicle.plate)
                    TriggerEvent("vehiclekeys:client:SetOwner", vehicle.plate)
                end, Depots[currentGarage].spawnPoint, true)
            else
                local Engine = GetVehicleEngineHealth(OutsideVehicles[vehicle.plate])
                if Engine < 40.0 then
                    CTRPFW.Functions.SpawnVehicle(vehicle.vehicle, function(veh)
                        TriggerServerEvent("InteractSound_SV:PlayOnSource", "vout", 0.3)
                        CTRPFW.Functions.TriggerCallback('ctrp-garage:server:GetVehicleProperties', function(properties)
                            CTRPFW.Functions.SetVehicleProperties(veh, properties)
                            enginePercent = round(vehicle.engine / 10, 0)
                            bodyPercent = round(vehicle.body / 10, 0)
                            currentFuel = vehicle.fuel
    
                            if vehicle.plate ~= nil then
                                DeleteVehicle(OutsideVehicles[vehicle.plate])
                                OutsideVehicles[vehicle.plate] = veh
                                TriggerServerEvent('ctrp-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                            end

                            if vehicle.status ~= nil and next(vehicle.status) ~= nil then
                                TriggerServerEvent('ctrp-vehicletuning:server:LoadStatus', vehicle.status, vehicle.plate)
                            end
                            
                            if vehicle.drivingdistance ~= nil then
                                local amount = round(vehicle.drivingdistance / 1000, -2)
                                TriggerEvent('ctrp-hud:client:UpdateDrivingMeters', true, amount)
                                TriggerServerEvent('ctrp-vehicletuning:server:UpdateDrivingDistance', vehicle.drivingdistance, vehicle.plate)
                            end
    
                            SetVehicleNumberPlateText(veh, vehicle.plate)
                            SetEntityHeading(veh, Depots[currentGarage].takeVehicle.h)
                            TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
                            exports['LegacyFuel']:SetFuel(veh, vehicle.fuel)
                            SetEntityAsMissionEntity(veh, true, true)
                            doCarDamage(veh, vehicle)
                            TriggerServerEvent('ctrp-garage:server:updateVehicleState', 0, vehicle.plate, vehicle.garage)
                            CTRPFW.Functions.Notify("Vehicle Off: Motor: " .. enginePercent .. "% Body: " .. bodyPercent.. "% Fuel: "..currentFuel.. "%", "primary", 4500)
                            closeMenuFull()
                            SetVehicleEngineOn(veh, true, true)
                        end, vehicle.plate)
                        TriggerEvent("vehiclekeys:client:SetOwner", vehicle.plate)
                    end, Depots[currentGarage].spawnPoint, true)
                else
                    CTRPFW.Functions.Notify('You cannot duplicate this vehicle..', 'error')
                    AddTemporaryBlip(OutsideVehicles[vehicle.plate])
                end
            end
        else
            CTRPFW.Functions.SpawnVehicle(vehicle.vehicle, function(veh)
                TriggerServerEvent("InteractSound_SV:PlayOnSource", "vout", 0.3)
                CTRPFW.Functions.TriggerCallback('ctrp-garage:server:GetVehicleProperties', function(properties)
                    CTRPFW.Functions.SetVehicleProperties(veh, properties)
                    enginePercent = round(vehicle.engine / 10, 0)
                    bodyPercent = round(vehicle.body / 10, 0)
                    currentFuel = vehicle.fuel

                    if vehicle.plate ~= nil then
                        OutsideVehicles[vehicle.plate] = veh
                        TriggerServerEvent('ctrp-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                    end

                    if vehicle.status ~= nil and next(vehicle.status) ~= nil then
                        TriggerServerEvent('ctrp-vehicletuning:server:LoadStatus', vehicle.status, vehicle.plate)
                    end

                    SetVehicleNumberPlateText(veh, vehicle.plate)
                    SetEntityHeading(veh, Depots[currentGarage].takeVehicle.h)
                    TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
                    exports['LegacyFuel']:SetFuel(veh, vehicle.fuel)
                    SetEntityAsMissionEntity(veh, true, true)
                    doCarDamage(veh, vehicle)
                    TriggerServerEvent('ctrp-garage:server:updateVehicleState', 0, vehicle.plate, vehicle.garage)
                    CTRPFW.Functions.Notify("Vehicle out: Motor: " .. enginePercent .. "% Body: " .. bodyPercent.. "% Fuel: "..currentFuel.. "%", "primary", 4500)
                    closeMenuFull()
                    SetVehicleEngineOn(veh, true, true)
                end, vehicle.plate)
                TriggerEvent("vehiclekeys:client:SetOwner", vehicle.plate)
            end, Depots[currentGarage].spawnPoint, true)
        end
    else
        CTRPFW.Functions.SpawnVehicle(vehicle.vehicle, function(veh)
            TriggerServerEvent("InteractSound_SV:PlayOnSource", "vout", 0.3)
            CTRPFW.Functions.TriggerCallback('ctrp-garage:server:GetVehicleProperties', function(properties)
                CTRPFW.Functions.SetVehicleProperties(veh, properties)
                enginePercent = round(vehicle.engine / 10, 0)
                bodyPercent = round(vehicle.body / 10, 0)
                currentFuel = vehicle.fuel

                if vehicle.plate ~= nil then
                    OutsideVehicles[vehicle.plate] = veh
                    TriggerServerEvent('ctrp-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                end

                if vehicle.status ~= nil and next(vehicle.status) ~= nil then
                    TriggerServerEvent('ctrp-vehicletuning:server:LoadStatus', vehicle.status, vehicle.plate)
                end
                
                if vehicle.drivingdistance ~= nil then
                    local amount = round(vehicle.drivingdistance / 1000, -2)
                    TriggerEvent('ctrp-hud:client:UpdateDrivingMeters', true, amount)
                    TriggerServerEvent('ctrp-vehicletuning:server:UpdateDrivingDistance', vehicle.drivingdistance, vehicle.plate)
                end

                SetVehicleNumberPlateText(veh, vehicle.plate)
                SetEntityHeading(veh, Depots[currentGarage].takeVehicle.h)
                TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
                exports['LegacyFuel']:SetFuel(veh, vehicle.fuel)
                SetEntityAsMissionEntity(veh, true, true)
                doCarDamage(veh, vehicle)
                TriggerServerEvent('ctrp-garage:server:updateVehicleState', 0, vehicle.plate, vehicle.garage)
                CTRPFW.Functions.Notify("Vehicle out: Motor: " .. enginePercent .. "% Body: " .. bodyPercent.. "% Fuel: "..currentFuel.. "%", "primary", 4500)
                closeMenuFull()
                SetVehicleEngineOn(veh, true, true)
            end, vehicle.plate)
            TriggerEvent("vehiclekeys:client:SetOwner", vehicle.plate)
        end, Depots[currentGarage].spawnPoint, true)
    end

    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId(), false)))
end)

function AddTemporaryBlip(vehicle)  
    local VehicleCoords = GetEntityCoords(vehicle)
    local TempBlip = AddBlipForCoord(VehicleCoords)
    local VehicleData = CTRPFW.Shared.VehicleModels[GetEntityModel(vehicle)]

    SetBlipSprite (TempBlip, 225)
    SetBlipDisplay(TempBlip, 4)
    SetBlipScale  (TempBlip, 0.85)
    SetBlipAsShortRange(TempBlip, true)
    SetBlipColour(TempBlip, 0)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Temp Blip: "..VehicleData["name"])
    EndTextCommandSetBlipName(TempBlip)
    CTRPFW.Functions.Notify("Your "..VehicleData["name"].." is temporarily (1min) indicated on the map!", "success", 10000)

    SetTimeout(60 * 1000, function()
        CTRPFW.Functions.Notify('Your vehicle is NOT shown on the map anymore!', 'error')
        RemoveBlip(TempBlip)
    end)
end

DrawText3Ds = function(x, y, z, text)
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
    for k, v in pairs(Garages) do
        Garage = AddBlipForCoord(Garages[k].takeVehicle.x, Garages[k].takeVehicle.y, Garages[k].takeVehicle.z)

        SetBlipSprite (Garage, 357)
        SetBlipDisplay(Garage, 4)
        SetBlipScale  (Garage, 0.65)
        SetBlipAsShortRange(Garage, true)
        SetBlipColour(Garage, 3)

        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(Garages[k].label)
        EndTextCommandSetBlipName(Garage)
    end

    for k, v in pairs(Depots) do
        Depot = AddBlipForCoord(Depots[k].takeVehicle.x, Depots[k].takeVehicle.y, Depots[k].takeVehicle.z)

        SetBlipSprite (Depot, 68)
        SetBlipDisplay(Depot, 4)
        SetBlipScale  (Depot, 0.7)
        SetBlipAsShortRange(Depot, true)
        SetBlipColour(Depot, 5)

        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(Depots[k].label)
        EndTextCommandSetBlipName(Depot)
    end
end)

local professor
local professor2
function professor_menu_garage()
    professor = MenuV:CreateMenu(false, 'Garage', 'topright', 0, 100, 0, 'size-125', 'none', 'menuv')
    professor2 = MenuV:CreateMenu(false, 'My Vehicles', 'topright', 0, 100, 0, 'size-125', 'none', 'menuv')
    local professor_button = professor:AddButton({
        icon = '🚗',
        label = 'My Vehicles',
        value = professor2,
        description = 'Vehicle List You Have'
    })
    local professor_button2 = professor:AddButton({
        icon = '❌',
        label = 'Close',
        description = 'Enter To Close',
        select = function(btn)
            MenuV:CloseAll()
        end
    })
    professor_VehicleList()
    MenuV:OpenMenu(professor)
end

function professor_VehicleList()
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    for k, v in pairs(Garages) do
        local takeDist = #(pos - vector3(Garages[k].takeVehicle.x, Garages[k].takeVehicle.y, Garages[k].takeVehicle.z))
        if takeDist <= 1 then
            currentGarage = k
        end
    end
    CTRPFW.Functions.TriggerCallback("ctrp-garage:server:GetUserVehicles", function(result)
        ped = PlayerPedId();
        if result == nil then
            CTRPFW.Functions.Notify("You have no vehicles in this garage", "error", 5000)
            MenuV:CloseAll()
        else
            for k, v in pairs(result) do
                enginePercent = round(v.engine / 10, 0)
                bodyPercent = round(v.body / 10, 0)
                currentFuel = v.fuel
                curGarage = Garages[v.garage].label
                if v.state == 0 then
                    v.state = "Out"
                elseif v.state == 1 then
                    v.state = "Garage"
                elseif v.state == 2 then
                    v.state = "In Seizure"
                end
                local label2 = CTRPFW.Shared.Vehicles[v.vehicle]["name"]
                if CTRPFW.Shared.Vehicles[v.vehicle]["brand"] ~= nil then
                    label2 = CTRPFW.Shared.Vehicles[v.vehicle]["brand"].." "..CTRPFW.Shared.Vehicles[v.vehicle]["name"]
                end
                print(v.state)
                professor2:AddButton({
                    icon = '🚗',
                    label = label2 .." <br> Motor: " .. enginePercent .. " | Body: " .. bodyPercent.. " | Fuel: "..currentFuel,
                    description = v.state,
                    select = function(btn)
                        MenuV:CloseAll()
                        professor_TakeOutVehicle(v)
                    end
                })
            end
        end
    end, currentGarage)
end

function professor_TakeOutVehicle(vehicle)
    if vehicle.state == "Garage" then
        enginePercent = round(vehicle.engine / 10, 1)
        bodyPercent = round(vehicle.body / 10, 1)
        currentFuel = vehicle.fuel

        CTRPFW.Functions.SpawnVehicle(vehicle.vehicle, function(veh)
            CTRPFW.Functions.TriggerCallback('ctrp-garage:server:GetVehicleProperties', function(properties)

                if vehicle.plate ~= nil then
                    OutsideVehicles[vehicle.plate] = veh
                    TriggerServerEvent('ctrp-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                end

                if vehicle.status ~= nil and next(vehicle.status) ~= nil then
                    TriggerServerEvent('ctrp-vehicletuning:server:LoadStatus', vehicle.status, vehicle.plate)
                end

                if vehicle.vehicle == "urus" then
                    SetVehicleExtra(veh, 1, false)
                    SetVehicleExtra(veh, 2, true)
                end
                
                if vehicle.drivingdistance ~= nil then
                    local amount = round(vehicle.drivingdistance / 1000, -2)
                    TriggerEvent('ctrp-hud:client:UpdateDrivingMeters', true, amount)
                    TriggerServerEvent('ctrp-vehicletuning:server:UpdateDrivingDistance', vehicle.drivingdistance, vehicle.plate)
                end

                CTRPFW.Functions.SetVehicleProperties(veh, properties)
                SetVehicleNumberPlateText(veh, vehicle.plate)
                SetEntityHeading(veh, Garages[currentGarage].spawnPoint.h)
                exports['LegacyFuel']:SetFuel(veh, vehicle.fuel)
                doCarDamage(veh, vehicle)
                SetEntityAsMissionEntity(veh, true, true)
                TriggerServerEvent('ctrp-garage:server:updateVehicleState', 0, vehicle.plate, vehicle.garage)
                CTRPFW.Functions.Notify("Vehicle Off:Engine " .. enginePercent .. "% Body: " .. bodyPercent.. "% Fuel: "..currentFuel.. "%", "primary", 4500)
                TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
                TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                SetVehicleEngineOn(veh, true, true)
            end, vehicle.plate)

        end, Garages[currentGarage].spawnPoint, true)
    elseif vehicle.state == "Out" then
        CTRPFW.Functions.Notify("Is your vehicle in the Depot", "error", 2500)
    elseif vehicle.state == "In Seizure" then
        CTRPFW.Functions.Notify("This vehicle was impounded by the Police", "error", 4000)
    end
end

function professor_depot_menu_garage()
    professor = MenuV:CreateMenu(false, 'Depot', 'topright', 0, 100, 0, 'size-125', 'none', 'menuv')
    professor2 = MenuV:CreateMenu(false, 'Depot Vehicles', 'topright', 0, 100, 0, 'size-125', 'none', 'menuv')
    local professor_button = professor:AddButton({
        icon = '🚗',
        label = 'Depot Vehicles',
        value = professor2,
        description = 'Depot Vehicles List You Have'
    })
    local professor_button2 = professor:AddButton({
        icon = '❌',
        label = 'Close',
        description = 'Enter To Close',
        select = function(btn)
            MenuV:CloseAll()
        end
    })
    professor_DepotList()
    MenuV:OpenMenu(professor)
end

function professor_DepotList()
    CTRPFW.Functions.TriggerCallback("ctrp-garage:server:GetDepotVehicles", function(result)
        ped = PlayerPedId();
        if result == nil then
            CTRPFW.Functions.Notify("There are no vehicles in the Impound", "error", 5000)
            MenuV:CloseAll()
        else
            for k, v in pairs(result) do
                enginePercent = round(v.engine / 10, 0)
                bodyPercent = round(v.body / 10, 0)
                currentFuel = v.fuel


                if v.state == 0 then
                    v.state = "Depot"
                end

                local label2 = CTRPFW.Shared.Vehicles[v.vehicle]["name"]
                if CTRPFW.Shared.Vehicles[v.vehicle]["brand"] ~= nil then
                    label2 = CTRPFW.Shared.Vehicles[v.vehicle]["brand"].." "..CTRPFW.Shared.Vehicles[v.vehicle]["name"]
                end

                professor2:AddButton({
                    icon = '🚗',
                    label = label2 .." <br> Motor: " .. enginePercent .. " | Body: " .. bodyPercent.. " | Fuel: "..currentFuel,
                    description = v.depotprice,
                    select = function(btn)
                        MenuV:CloseAll()
                        professor_TakeOutDepotVehicle(v)
                    end
                })
            end
        end
    end)
end

function professor_TakeOutDepotVehicle(vehicle)
    if vehicle.state == "Depot" then
        TriggerServerEvent("ctrp-garage:server:PayDepotPrice", vehicle)
        Citizen.Wait(1000)
    end
end

function professor_Menu_House_Garage(house)
    professor = MenuV:CreateMenu(false, HouseGarages[house].label, 'topright', 0, 100, 0, 'size-125', 'none', 'menuv')
    professor2 = MenuV:CreateMenu(false, 'My Vehicles', 'topright', 0, 100, 0, 'size-125', 'none', 'menuv')
    local professor_button = professor:AddButton({
        icon = '🚗',
        label = 'My Vehicles',
        value = professor2,
        description = 'Vehicle List You Have'
    })
    local professor_button2 = professor:AddButton({
        icon = '❌',
        label = 'Close',
        description = 'Enter To Close',
    })
    professor_HouseGarage(house)
    MenuV:OpenMenu(professor)
end

function professor_HouseGarage(house)
    CTRPFW.Functions.TriggerCallback("ctrp-garage:server:GetHouseVehicles", function(result)
        ped = PlayerPedId();

        if result == nil then
            CTRPFW.Functions.Notify("You have no vehicles in your garage", "error", 5000)
            MenuV:CloseAll()
        else
            for k, v in pairs(result) do
                enginePercent = round(v.engine / 10, 0)
                bodyPercent = round(v.body / 10, 0)
                currentFuel = v.fuel
                curGarage = HouseGarages[house].label

                if v.state == 0 then
                    v.state = "Out"
                elseif v.state == 1 then
                    v.state = "Garage"
                elseif v.state == 2 then
                    v.state = "Depot"
                end

                local label2 = CTRPFW.Shared.Vehicles[v.vehicle]["name"]
                if CTRPFW.Shared.Vehicles[v.vehicle]["brand"] ~= nil then
                    label2 = CTRPFW.Shared.Vehicles[v.vehicle]["brand"].." "..CTRPFW.Shared.Vehicles[v.vehicle]["name"]
                end

                professor2:AddButton({
                    icon = '🚗',
                    label = label2 .." <br> Motor: " .. enginePercent .. " | Body: " .. bodyPercent.. " | Fuel: "..currentFuel,
                    description = v.state,
                    select = function(btn)
                        MenuV:CloseAll()
                        professor_TakeOutGarageVehicle(v)
                    end
                })
            end
        end
    end, house)
end

function professor_TakeOutGarageVehicle(vehicle)
    if vehicle.state == "Garage" then
        CTRPFW.Functions.SpawnVehicle(vehicle.vehicle, function(veh)
            CTRPFW.Functions.TriggerCallback('ctrp-garage:server:GetVehicleProperties', function(properties)
                CTRPFW.Functions.SetVehicleProperties(veh, properties)
                enginePercent = round(vehicle.engine / 10, 1)
                bodyPercent = round(vehicle.body / 10, 1)
                currentFuel = vehicle.fuel

                if vehicle.plate ~= nil then
                    OutsideVehicles[vehicle.plate] = veh
                    TriggerServerEvent('ctrp-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                end

                if vehicle.drivingdistance ~= nil then
                    local amount = round(vehicle.drivingdistance / 1000, -2)
                    TriggerEvent('ctrp-hud:client:UpdateDrivingMeters', true, amount)
                    TriggerServerEvent('ctrp-vehicletuning:server:UpdateDrivingDistance', vehicle.drivingdistance, vehicle.plate)
                end

                if vehicle.vehicle == "urus" then
                    SetVehicleExtra(veh, 1, false)
                    SetVehicleExtra(veh, 2, true)
                end

                if vehicle.status ~= nil and next(vehicle.status) ~= nil then
                    TriggerServerEvent('ctrp-vehicletuning:server:LoadStatus', vehicle.status, vehicle.plate)
                end

                SetVehicleNumberPlateText(veh, vehicle.plate)
                SetEntityHeading(veh, HouseGarages[currentHouseGarage].takeVehicle.w)
                TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
                exports['LegacyFuel']:SetFuel(veh, vehicle.fuel)
                SetEntityAsMissionEntity(veh, true, true)
                doCarDamage(veh, vehicle)
                TriggerServerEvent('ctrp-garage:server:updateVehicleState', 0, vehicle.plate, vehicle.garage)
                CTRPFW.Functions.Notify("Vehicle Off:Engine " .. enginePercent .. "% Body: " .. bodyPercent.. "% Fuel: "..currentFuel.. "%", "primary", 4500)
                TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                SetVehicleEngineOn(veh, true, true)
            end, vehicle.plate)
        end, HouseGarages[currentHouseGarage].takeVehicle, true)
    end
end

function MenuGarage()
    ped = PlayerPedId();
    MenuTitle = "Garage"
    ClearMenu()
    Menu.addButton("My vehicles", "VoertuigLijst", nil)
    Menu.addButton("Close Menu", "close", nil) 
end

function MenuDepot()
    ped = PlayerPedId();
    MenuTitle = "Depot"
    ClearMenu()
    Menu.addButton("Depot", "DepotLijst", nil)
    Menu.addButton("Close Menu", "close", nil) 
end

function MenuHouseGarage(house)
    ped = PlayerPedId();
    MenuTitle = HouseGarages[house].label
    ClearMenu()
    Menu.addButton("My vehicles", "HouseGarage", house)
    Menu.addButton("Close Menu", "close", nil) 
end

function yeet(label)
    print(label)
end

function HouseGarage(house)
    CTRPFW.Functions.TriggerCallback("ctrp-garage:server:GetHouseVehicles", function(result)
        ped = PlayerPedId();
        MenuTitle = "Depot Vehicles :"
        ClearMenu()

        if result == nil then
            CTRPFW.Functions.Notify("You have no vehicles in your garage", "error", 5000)
            closeMenuFull()
        else
            Menu.addButton(HouseGarages[house].label, "yeet", HouseGarages[house].label)

            for k, v in pairs(result) do
                enginePercent = round(v.engine / 10, 0)
                bodyPercent = round(v.body / 10, 0)
                currentFuel = v.fuel
                curGarage = HouseGarages[house].label

                if v.state == 0 then
                    v.state = "Out"
                elseif v.state == 1 then
                    v.state = "Garage"
                elseif v.state == 2 then
                    v.state = "Depot"
                end
                
                local label = CTRPFW.Shared.Vehicles[v.vehicle]["name"]
                if CTRPFW.Shared.Vehicles[v.vehicle]["brand"] ~= nil then
                    label = CTRPFW.Shared.Vehicles[v.vehicle]["brand"].." "..CTRPFW.Shared.Vehicles[v.vehicle]["name"]
                end

                Menu.addButton(label, "TakeOutGarageVehicle", v, v.state, " Motor: " .. enginePercent.."%", " Body: " .. bodyPercent.."%", " Fuel: "..currentFuel.."%")
            end
        end
            
        Menu.addButton("Back", "MenuHouseGarage", house)
    end, house)
end

function getPlayerVehicles(garage)
    local vehicles = {}

    return vehicles
end

function DepotLijst()
    CTRPFW.Functions.TriggerCallback("ctrp-garage:server:GetDepotVehicles", function(result)
        ped = PlayerPedId();
        MenuTitle = "Depot Vehicles :"
        ClearMenu()

        if result == nil then
            CTRPFW.Functions.Notify("There are no vehicles in the depot", "error", 5000)
            closeMenuFull()
        else
            Menu.addButton(Depots[currentGarage].label, "yeet", Depots[currentGarage].label)

            for k, v in pairs(result) do
                enginePercent = round(v.engine / 10, 0)
                bodyPercent = round(v.body / 10, 0)
                currentFuel = v.fuel


                if v.state == 0 then
                    v.state = "Depot"
                end

                local label = CTRPFW.Shared.Vehicles[v.vehicle]["name"]
                if CTRPFW.Shared.Vehicles[v.vehicle]["brand"] ~= nil then
                    label = CTRPFW.Shared.Vehicles[v.vehicle]["brand"].." "..CTRPFW.Shared.Vehicles[v.vehicle]["name"]
                end
                Menu.addButton(label, "TakeOutDepotVehicle", v, v.state .. " ($"..v.depotprice..",-)", " Motor: " .. enginePercent.."%", " Body: " .. bodyPercent.."%", " Fuel: "..currentFuel.."%")
            end
        end
            
        Menu.addButton("Back", "MenuDepot",nil)
    end)
end

function VoertuigLijst()
    CTRPFW.Functions.TriggerCallback("ctrp-garage:server:GetUserVehicles", function(result)
        ped = PlayerPedId();
        MenuTitle = "My Vehicles :"
        ClearMenu()

        if result == nil then
            CTRPFW.Functions.Notify("You have no vehicles in this garage", "error", 5000)
            closeMenuFull()
        else
            Menu.addButton(Garages[currentGarage].label, "yeet", Garages[currentGarage].label)

            for k, v in pairs(result) do
                enginePercent = round(v.engine / 10, 0)
                bodyPercent = round(v.body / 10, 0)
                currentFuel = v.fuel
                curGarage = Garages[v.garage].label


                if v.state == 0 then
                    v.state = "Out"
                elseif v.state == 1 then
                    v.state = "Garage"
                elseif v.state == 2 then
                    v.state = "In Seizure"
                end

                local label = CTRPFW.Shared.Vehicles[v.vehicle]["name"]
                if CTRPFW.Shared.Vehicles[v.vehicle]["brand"] ~= nil then
                    label = CTRPFW.Shared.Vehicles[v.vehicle]["brand"].." "..CTRPFW.Shared.Vehicles[v.vehicle]["name"]
                end

                Menu.addButton(label, "TakeOutVehicle", v, v.state, " Motor: " .. enginePercent .. "%", " Body: " .. bodyPercent.. "%", " Fuel: "..currentFuel.. "%")
            end
        end
            
        Menu.addButton("Back", "MenuGarage", nil)
    end, currentGarage)
end

-- Citizen.CreateThread(function()
--     while true do
--         if VehPlate ~= nil then
--             local veh = OutsideVehicles[VehPlate]
--             local Damage = GetVehicleBodyHealth(veh)
--         end

--         Citizen.Wait(1000)
--     end
-- end)

function TakeOutVehicle(vehicle)
    if vehicle.state == "Garage" then
        enginePercent = round(vehicle.engine / 10, 1)
        bodyPercent = round(vehicle.body / 10, 1)
        currentFuel = vehicle.fuel

        CTRPFW.Functions.SpawnVehicle(vehicle.vehicle, function(veh)
            TriggerServerEvent("InteractSound_SV:PlayOnSource", "vout", 0.3)
            CTRPFW.Functions.TriggerCallback('ctrp-garage:server:GetVehicleProperties', function(properties)

                if vehicle.plate ~= nil then
                    OutsideVehicles[vehicle.plate] = veh
                    TriggerServerEvent('ctrp-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                end

                if vehicle.status ~= nil and next(vehicle.status) ~= nil then
                    TriggerServerEvent('ctrp-vehicletuning:server:LoadStatus', vehicle.status, vehicle.plate)
                end

                if vehicle.vehicle == "urus" then
                    SetVehicleExtra(veh, 1, false)
                    SetVehicleExtra(veh, 2, true)
                end
                
                if vehicle.drivingdistance ~= nil then
                    local amount = round(vehicle.drivingdistance / 1000, -2)
                    TriggerEvent('ctrp-hud:client:UpdateDrivingMeters', true, amount)
                    TriggerServerEvent('ctrp-vehicletuning:server:UpdateDrivingDistance', vehicle.drivingdistance, vehicle.plate)
                end

                CTRPFW.Functions.SetVehicleProperties(veh, properties)
                SetVehicleNumberPlateText(veh, vehicle.plate)
                SetEntityHeading(veh, Garages[currentGarage].spawnPoint.h)
                exports['LegacyFuel']:SetFuel(veh, vehicle.fuel)
                doCarDamage(veh, vehicle)
                SetEntityAsMissionEntity(veh, true, true)
                TriggerServerEvent('ctrp-garage:server:updateVehicleState', 0, vehicle.plate, vehicle.garage)
                CTRPFW.Functions.Notify("Vehicle out: Motor: " .. enginePercent .. "% Body: " .. bodyPercent.. "% Fuel: "..currentFuel.. "%", "primary", 4500)
                closeMenuFull()
                TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
                TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                SetVehicleEngineOn(veh, true, true)
            end, vehicle.plate)
            
        end, Garages[currentGarage].spawnPoint, true)
    elseif vehicle.state == "Out" then
        CTRPFW.Functions.Notify("Is your vehicle in the depot??", "error", 2500)
    elseif vehicle.state == "In Seizure" then
        CTRPFW.Functions.Notify("This vehicle has been seized by the Police", "error", 4000)
    end
end

function TakeOutDepotVehicle(vehicle)
    if vehicle.state == "Depot" then
        TriggerServerEvent("ctrp-garage:server:PayDepotPrice", vehicle)
    end
end

function TakeOutGarageVehicle(vehicle)
    if vehicle.state == "Garage" then
        CTRPFW.Functions.SpawnVehicle(vehicle.vehicle, function(veh)
            TriggerServerEvent("InteractSound_SV:PlayOnSource", "vout", 0.3)
            CTRPFW.Functions.TriggerCallback('ctrp-garage:server:GetVehicleProperties', function(properties)
                CTRPFW.Functions.SetVehicleProperties(veh, properties)
                enginePercent = round(vehicle.engine / 10, 1)
                bodyPercent = round(vehicle.body / 10, 1)
                currentFuel = vehicle.fuel

                if vehicle.plate ~= nil then
                    OutsideVehicles[vehicle.plate] = veh
                    TriggerServerEvent('ctrp-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                end
                
                
                if vehicle.drivingdistance ~= nil then
                    local amount = round(vehicle.drivingdistance / 1000, -2)
                    TriggerEvent('ctrp-hud:client:UpdateDrivingMeters', true, amount)
                    TriggerServerEvent('ctrp-vehicletuning:server:UpdateDrivingDistance', vehicle.drivingdistance, vehicle.plate)
                end

                if vehicle.vehicle == "urus" then
                    SetVehicleExtra(veh, 1, false)
                    SetVehicleExtra(veh, 2, true)
                end

                if vehicle.status ~= nil and next(vehicle.status) ~= nil then
                    TriggerServerEvent('ctrp-vehicletuning:server:LoadStatus', vehicle.status, vehicle.plate)
                end

                SetVehicleNumberPlateText(veh, vehicle.plate)
                SetEntityHeading(veh, HouseGarages[currentHouseGarage].takeVehicle.h)
                TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
                exports['LegacyFuel']:SetFuel(veh, vehicle.fuel)
                SetEntityAsMissionEntity(veh, true, true)
                doCarDamage(veh, vehicle)
                TriggerServerEvent('ctrp-garage:server:updateVehicleState', 0, vehicle.plate, vehicle.garage)
                CTRPFW.Functions.Notify("Vehicle out: Motor: " .. enginePercent .. "% Body: " .. bodyPercent.. "% Fuel: "..currentFuel.. "%", "primary", 4500)
                closeMenuFull()
                TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                SetVehicleEngineOn(veh, true, true)
            end, vehicle.plate)
        end, HouseGarages[currentHouseGarage].takeVehicle, true)
    end
end

function doCarDamage(currentVehicle, veh)
	smash = false
	damageOutside = false
	damageOutside2 = false 
	local engine = veh.engine + 0.0
    local body = veh.body + 0.0

	if engine < 200.0 then
		engine = 200.0
    end
    
    if engine > 1000.0 then
        engine = 1000.0
    end

	if body < 150.0 then
        body = 150.0
        SetVehicleBodyHealth(currentVehicle, 150.0)
    end
    if body < 900.0 then
        SetVehicleBodyHealth(currentVehicle, 899.0)
        SetVehicleDirtLevel(currentVehicle, 0.1)
        smash = true
    end
    
    if body < 800.0 then
        SetVehicleBodyHealth(currentVehicle, 799.0)
        SetVehicleDirtLevel(currentVehicle, 0.1)
        damageOutside = true
    end
    
    if body < 500.0 then
        SetVehicleBodyHealth(currentVehicle, 499.0)
        SetVehicleDirtLevel(currentVehicle, 8.9)
        damageOutside2 = true
    end
    
    if body < 300.0 then
        SetVehicleBodyHealth(currentVehicle, 299.0)
        SetVehicleDirtLevel(currentVehicle, 15.0)
        damageOutside2 = true
    end
    
    Citizen.Wait(100)
    SetVehicleEngineHealth(currentVehicle, engine)
    if smash then
        SmashVehicleWindow(currentVehicle, 0)
        SmashVehicleWindow(currentVehicle, 1)
        SmashVehicleWindow(currentVehicle, 2)
        SmashVehicleWindow(currentVehicle, 3)
        SmashVehicleWindow(currentVehicle, 4)
    end
    if damageOutside then
        SetVehicleDoorBroken(currentVehicle, 1, true)
        SetVehicleDoorBroken(currentVehicle, 6, true)
        SetVehicleDoorBroken(currentVehicle, 4, true)
    end
    if damageOutside2 then
        SetVehicleTyreBurst(currentVehicle, 1, false, 990.0)
        SetVehicleTyreBurst(currentVehicle, 2, false, 990.0)
        SetVehicleTyreBurst(currentVehicle, 3, false, 990.0)
        SetVehicleTyreBurst(currentVehicle, 4, false, 990.0)
    end
    if body < 1000 then
		SetVehicleBodyHealth(currentVehicle, 985.1)
    end  
end

--[[function doCarDamage(currentVehicle, veh)
	smash = false
	damageOutside = false
	damageOutside2 = false 
	local engine = veh.engine + 0.0
	local body = veh.body + 0.0
	if engine < 200.0 then
		engine = 200.0
    end
    
    if engine > 1000.0 then
        engine = 1000.0
    end

	if body < 150.0 then
		body = 150.0
	end
	if body < 900.0 then
		smash = true
	end

	if body < 800.0 then
		damageOutside = true
	end

	if body < 500.0 then
		damageOutside2 = true
	end

    Citizen.Wait(100)
    SetVehicleEngineHealth(currentVehicle, engine)
	if smash then
		SmashVehicleWindow(currentVehicle, 0)
		SmashVehicleWindow(currentVehicle, 1)
		SmashVehicleWindow(currentVehicle, 2)
		SmashVehicleWindow(currentVehicle, 3)
		SmashVehicleWindow(currentVehicle, 4)
	end
	if damageOutside then
		SetVehicleDoorBroken(currentVehicle, 1, true)
		SetVehicleDoorBroken(currentVehicle, 6, true)
		SetVehicleDoorBroken(currentVehicle, 4, true)
	end
	if damageOutside2 then
		SetVehicleTyreBurst(currentVehicle, 1, false, 990.0)
		SetVehicleTyreBurst(currentVehicle, 2, false, 990.0)
		SetVehicleTyreBurst(currentVehicle, 3, false, 990.0)
		SetVehicleTyreBurst(currentVehicle, 4, false, 990.0)
	end
	if body < 1000 then
		SetVehicleBodyHealth(currentVehicle, 985.1)
	end
end]]

function close()
    Menu.hidden = true
end

function closeMenuFull()
    Menu.hidden = true
    currentGarage = nil
    ClearMenu()
end

function ClearMenu()
	--Menu = {}
	Menu.GUI = {}
	Menu.buttonCount = 0
	Menu.selection = 0
end

local ismenu = false

Citizen.CreateThread(function()
    Citizen.Wait(1000)
    while true do
        Citizen.Wait(5)
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        local inGarageRange = false

        for k, v in pairs(Garages) do
            local takeDist = GetDistanceBetweenCoords(pos, Garages[k].takeVehicle.x, Garages[k].takeVehicle.y, Garages[k].takeVehicle.z)
            if takeDist <= 15 then
                inGarageRange = true
                DrawMarker(2, Garages[k].takeVehicle.x, Garages[k].takeVehicle.y, Garages[k].takeVehicle.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 0, 0, 222, false, false, false, true, false, false, false)
                if takeDist <= 1.5 then
                    if not IsPedInAnyVehicle(ped) then
                        DrawText3Ds(Garages[k].takeVehicle.x, Garages[k].takeVehicle.y, Garages[k].takeVehicle.z + 0.5, '~g~E~w~ - Garage')
                        if IsControlJustPressed(1, 177) then
                            close()
                            PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                        end
                        if IsControlJustPressed(0, 38) then
                            ismenu = true
                            professor_menu_garage()
                            -- Menu.hidden = not Menu.hidden
                            currentGarage = k
                        end
                    else
                        DrawText3Ds(Garages[k].takeVehicle.x, Garages[k].takeVehicle.y, Garages[k].takeVehicle.z, Garages[k].label)
                    end
                end

                Menu.renderGUI()

                if takeDist >= 2 then
                    if ismenu then
                        ismenu = false
                        MenuV:CloseAll() 
                    end
                end
            end

            local putDist = GetDistanceBetweenCoords(pos, Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z)

            if putDist <= 25 and IsPedInAnyVehicle(ped) then
                inGarageRange = true
                DrawMarker(2, Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 255, 255, 255, 255, false, false, false, true, false, false, false)
                if putDist <= 1.5 then
                    DrawText3Ds(Garages[k].putVehicle.x, Garages[k].putVehicle.y, Garages[k].putVehicle.z + 0.5, '~g~E~w~ - Store vehicle')
                    if IsControlJustPressed(0, 38) then
                        local curVeh = GetVehiclePedIsIn(ped)
                        local plate = GetVehicleNumberPlateText(curVeh)
                        CTRPFW.Functions.TriggerCallback('ctrp-garage:server:checkVehicleOwner', function(owned)
                            if owned then
                                TriggerServerEvent("InteractSound_SV:PlayOnSource", "vstored", 0.3)
                                local bodyDamage = math.ceil(GetVehicleBodyHealth(curVeh))
                                local engineDamage = math.ceil(GetVehicleEngineHealth(curVeh))
                                local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
        
                                TriggerServerEvent('ctrp-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, k)
                                TriggerServerEvent('ctrp-garage:server:updateVehicleState', 1, plate, k)
                                TriggerServerEvent("updateVehicle", CTRPFW.Functions.GetVehicleProperties(curVeh))
                                TriggerServerEvent('vehiclemod:server:saveStatus', plate)
                                -- CTRPFW.Functions.DeleteVehicle(curVeh)
                                CheckPlayers(curVeh)
                                if plate ~= nil then
                                    OutsideVehicles[plate] = veh
                                    TriggerServerEvent('ctrp-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                end
                                CTRPFW.Functions.Notify("Vehicle stored in, "..Garages[k].label, "primary", 4500)
                            else
                                CTRPFW.Functions.Notify("Nobody owns this vehicle...", "error", 3500)
                            end
                        end, plate)
                    end
                end
            end
        end

        if not inGarageRange then
            Citizen.Wait(1000)
        end
    end
end)

Citizen.CreateThread(function()
    Citizen.Wait(2000)
    while true do
        Citizen.Wait(5)
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        local inGarageRange = false

        if HouseGarages ~= nil and currentHouseGarage ~= nil then
            if hasGarageKey and HouseGarages[currentHouseGarage] ~= nil then
                local takeDist = GetDistanceBetweenCoords(pos, HouseGarages[currentHouseGarage].takeVehicle.x, HouseGarages[currentHouseGarage].takeVehicle.y, HouseGarages[currentHouseGarage].takeVehicle.z)
                if takeDist <= 15 then
                    inGarageRange = true
                    DrawMarker(2, HouseGarages[currentHouseGarage].takeVehicle.x, HouseGarages[currentHouseGarage].takeVehicle.y, HouseGarages[currentHouseGarage].takeVehicle.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 0, 0, 222, false, false, false, true, false, false, false)
                    if takeDist < 2.0 then
                        if not IsPedInAnyVehicle(ped) then
                            DrawText3Ds(HouseGarages[currentHouseGarage].takeVehicle.x, HouseGarages[currentHouseGarage].takeVehicle.y, HouseGarages[currentHouseGarage].takeVehicle.z + 0.5, '~g~E~w~ - Garage')
                            if IsControlJustPressed(1, 177) then
                                close()
                                PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                            end
                            if IsControlJustPressed(0, 38) then
                                ismenu = true
                                professor_Menu_House_Garage(currentHouseGarage)
                                -- Menu.hidden = not Menu.hidden
                            end
                        elseif IsPedInAnyVehicle(ped) then
                            DrawText3Ds(HouseGarages[currentHouseGarage].takeVehicle.x, HouseGarages[currentHouseGarage].takeVehicle.y, HouseGarages[currentHouseGarage].takeVehicle.z + 0.5, '~g~E~w~ - To park')
                            if IsControlJustPressed(0, 38) then
                                local curVeh = GetVehiclePedIsIn(ped)
                                local plate = GetVehicleNumberPlateText(curVeh)
                                CTRPFW.Functions.TriggerCallback('ctrp-garage:server:checkVehicleHouseOwner', function(owned)
                                    if owned then
                                        TriggerServerEvent("InteractSound_SV:PlayOnSource", "vstored", 0.3)
                                        local bodyDamage = round(GetVehicleBodyHealth(curVeh), 1)
                                        local engineDamage = round(GetVehicleEngineHealth(curVeh), 1)
                                        local totalFuel = exports['LegacyFuel']:GetFuel(curVeh)
                
                                        TriggerServerEvent('ctrp-garage:server:updateVehicleStatus', totalFuel, engineDamage, bodyDamage, plate, currentHouseGarage)
                                        TriggerServerEvent('ctrp-garage:server:updateVehicleState', 1, plate, currentHouseGarage)
                                        --CTRPFW.Functions.DeleteVehicle(curVeh)
                                        CheckPlayers(curVeh)
                                        if plate ~= nil then
                                            OutsideVehicles[plate] = veh
                                            TriggerServerEvent('ctrp-garages:server:UpdateOutsideVehicles', OutsideVehicles)
                                        end
                                        CTRPFW.Functions.Notify("Vehicle stored, "..HouseGarages[currentHouseGarage].label, "primary", 4500)
                                    else
                                        CTRPFW.Functions.Notify("No one owns this vehicle...", "error", 3500)
                                    end
                                end, plate, currentHouseGarage)
                            end
                        end
                        
                        Menu.renderGUI()
                    end

                    if takeDist > 1.99 then
                        if ismenu then
                            ismenu = false
                            MenuV:CloseAll() 
                        end
                    end
                end
            end
        end
        
        if not inGarageRange then
            Citizen.Wait(5000)
        end
    end
end)

Citizen.CreateThread(function()
    Citizen.Wait(1000)
    while true do
        Citizen.Wait(5)
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        local inGarageRange = false

        for k, v in pairs(Depots) do
            local takeDist = GetDistanceBetweenCoords(pos, Depots[k].takeVehicle.x, Depots[k].takeVehicle.y, Depots[k].takeVehicle.z)
            if takeDist <= 15 then
                inGarageRange = true
                DrawMarker(2, Depots[k].takeVehicle.x, Depots[k].takeVehicle.y, Depots[k].takeVehicle.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 0, 0, 222, false, false, false, true, false, false, false)
                if takeDist <= 1.5 then
                    if not IsPedInAnyVehicle(ped) then
                        DrawText3Ds(Depots[k].takeVehicle.x, Depots[k].takeVehicle.y, Depots[k].takeVehicle.z + 0.5, '~g~E~w~ - Garage')
                        if IsControlJustPressed(1, 177) then
                            close()
                            PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
                        end
                        if IsControlJustPressed(0, 38) then
                            ismenu = true
                            professor_depot_menu_garage()
                            -- Menu.hidden = not Menu.hidden
                            currentGarage = k
                        end
                    end
                end

                Menu.renderGUI()

                if takeDist >= 2 then
                    if ismenu then
                        ismenu = false
                        MenuV:CloseAll() 
                    end
                end
            end
        end

        if not inGarageRange then
            Citizen.Wait(5000)
        end
    end
end)

function round(num, numDecimalPlaces)
    return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", num))
end

function round(num, numDecimalPlaces)
    if numDecimalPlaces and numDecimalPlaces>0 then
      local mult = 10^numDecimalPlaces
      return math.floor(num * mult + 0.5) / mult
    end
    return math.floor(num + 0.5)
end

function CheckPlayers(vehicle)
    for i = -1, 5,1 do                
        seat = GetPedInVehicleSeat(vehicle,i)
        if seat ~= 0 then
            TaskLeaveVehicle(seat,vehicle,0)
            SetVehicleDoorsLocked(vehicle)
            Wait(1500)
            CTRPFW.Functions.DeleteVehicle(vehicle)
        end
   end
end