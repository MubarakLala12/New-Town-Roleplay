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

local ismenu = false
local ismenu2 = false
local currentGarage = 1
local ppp
Citizen.CreateThread(function()
    while true do
        ppp = 2500
        if isLoggedIn and CTRPFW ~= nil then
            ppp = 2000
            if PlayerJob.name == 'police' then
                ppp = 1000
                local pos = GetEntityCoords(PlayerPedId())

               
                for k, v in pairs(Config.Locations["duty"]) do
                    if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 5) then
                        if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 1.5) then
                            ppp = 7
                            if onDuty then
                                DrawText3D(v.x, v.y, v.z, "~r~E~w~ - Leave service")
                            else
                                DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Go on duty")
                            end
                            if IsControlJustReleased(0, Keys["E"]) then
                                onDuty = not onDuty
                                TriggerServerEvent("CTRPFW:ToggleDuty")
                                TriggerServerEvent("police:server:UpdateBlips")
                                
                                TriggerServerEvent("police:server:UpdateCurrentCops")

                                TriggerEvent('ctrp-policealerts:ToggleDuty', onDuty)
                            end
                        elseif (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 4.5) then
                            DrawText3D(v.x, v.y, v.z, "In/Out service")
                        end  
                    end
                end

                for k, v in pairs(Config.Locations["evidence"]) do
                    if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 2) then
                        if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 1.0) then
                            ppp = 7
                            DrawText3D(v.x, v.y, v.z, "~g~E~w~ -    Evidence stash")
                            if IsControlJustReleased(0, Keys["E"]) then
                                TriggerServerEvent("inventory:server:OpenInventory", "stash", "policeevidence", {
                                    maxweight = 4000000,
                                    slots = 500,
                                })
                                TriggerEvent("inventory:client:SetCurrentStash", "policeevidence")
                            end
                        elseif (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, v.x, v.y, v.z, true) < 1.5) then
                            DrawText3D(v.x, v.y, v.z, "evidence stash")
                        end
                    end
                end

                for k, v in pairs(Config.Locations["evidence2"]) do
                    if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 2) then
                        if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 1.0) then
                            ppp = 7
                            DrawText3D(v.x, v.y, v.z, "~g~E~w~ - evidence stash")
                            if IsControlJustReleased(0, Keys["E"]) then
                                TriggerServerEvent("inventory:server:OpenInventory", "stash", "policeevidence2", {
                                    maxweight = 4000000,
                                    slots = 500,
                                })
                                TriggerEvent("inventory:client:SetCurrentStash", "policeevidence2")
                            end
                        elseif (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 1.5) then
                            DrawText3D(v.x, v.y, v.z, "evidence stash")
                        end
                    end
                end

                for k, v in pairs(Config.Locations["evidence3"]) do
                    if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 2) then
                        if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 1.0) then
                            ppp = 7
                            DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Evidence stash")
                            if IsControlJustReleased(0, Keys["E"]) then
                                TriggerServerEvent("inventory:server:OpenInventory", "stash", "policeevidence3", {
                                    maxweight = 4000000,
                                    slots = 500,
                                })
                                TriggerEvent("inventory:client:SetCurrentStash", "policeevidence3")
                            end
                        elseif (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 1.5) then
                            DrawText3D(v.x, v.y, v.z, "evidence stash")
                        end
                    end
                end

                for k, v in pairs(Config.Locations["trash"]) do
                    if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 2) then
                        if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 1.0) then
                            ppp = 7
                            DrawText3D(v.x, v.y, v.z, "~r~E~w~ - Bin")
                            if IsControlJustReleased(0, Keys["E"]) then
                                TriggerServerEvent("inventory:server:OpenInventory", "stash", "policetrash", {
                                    maxweight = 4000000,
                                    slots = 300,
                                })
                                TriggerEvent("inventory:client:SetCurrentStash", "policetrash")
                            end
                        elseif (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, v.x, v.y, v.z, true) < 1.5) then
                            DrawText3D(v.x, v.y, v.z, "Bin")
                        end
                    end
                end

                for k, v in pairs(Config.Locations["vehicle"]) do
                    if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 7.5) then
                         if onDuty then
                            DrawMarker(2, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 0, 0, 222, false, false, false, true, false, false, false)
                            if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 1.5) then
                                ppp = 7
                                if IsPedInAnyVehicle(PlayerPedId(), false) then
                                     DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Store vehicle")
                                else
                                     DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Vehicles")
                                end
                                if IsControlJustReleased(0, Keys["E"]) then
                                    if IsPedInAnyVehicle(PlayerPedId(), false) then
                                        -- TriggerServerEvent("qb-pmi:server:vehicleStore", GetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId())))
                                        CheckPlayers(GetVehiclePedIsIn(PlayerPedId()))
                                        
                                    else
                                        --  MenuGarage()
                                        
                                        ismenu = true
                                        PoliceGarage()
                                         currentGarage = k
                                        --  Menu.hidden = not Menu.hidden
                                    end
                                end
                                Menu.renderGUI()
                            else
                                if ismenu then
                                    ismenu = false
                                    MenuV:CloseAll() 
                                end
                            end
                        end
                    end
                end

                for k, v in pairs(Config.Locations["impound"]) do
                    if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 3.0) then
                        if onDuty then
                            DrawMarker(2, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 0, 0, 222, false, false, false, true, false, false, false)
                            if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 1.5) then
                                ppp = 7
                                if IsPedInAnyVehicle(PlayerPedId(), false) then
                                    DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Store vehicle")
                                else
                                    DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Vehicles")
                                end
                                if IsControlJustReleased(0, Keys["E"]) then
                                    if IsPedInAnyVehicle(PlayerPedId(), false) then
                                        CheckPlayers(GetVehiclePedIsIn(PlayerPedId()))
                                    else
                                        ismenu2 = true
                                        PoliceImpound()
                                        currentGarage = k
                                        -- Menu.hidden = not Menu.hidden
                                    end
                                end
                                Menu.renderGUI()
                            else
                                if ismenu2 then
                                    ismenu2 = false
                                    MenuV:CloseAll() 
                                end
                            end
                        end
                    
                    end
                end

                for k, v in pairs(Config.Locations["helicopter"]) do
                    if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 7.5) then
                        if onDuty then
                            DrawMarker(2, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 0, 0, 222, false, false, false, true, false, false, false)
                            if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 1.5) then
                                ppp = 7
                                if IsPedInAnyVehicle(PlayerPedId(), false) then
                                    DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Helicopter storage")
                                else
                                    DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Take Helicopter")
                                end
                                if IsControlJustReleased(0, Keys["E"]) then
                                    if IsPedInAnyVehicle(PlayerPedId(), false) then
                                        CheckPlayers(GetVehiclePedIsIn(PlayerPedId()))
                                        TriggerServerEvent("qb-pmi:server:vehicleStore", GetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId())))
                                    else
                                        local coords = Config.Locations["helicopter"][k]
                                        CTRPFW.Functions.SpawnVehicle(Config.Helicopter, function(veh)
                                            SetVehicleNumberPlateText(veh, "ZULU"..tostring(math.random(1000, 9999)))
                                            SetEntityHeading(veh, coords.h)
                                            exports['LegacyFuel']:SetFuel(veh, 100.0)
                                            closeMenuFull()
                                            TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
                                            TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                                            TriggerServerEvent("qb-pmi:server:vehicleTakeout", GetVehicleNumberPlateText(veh), GetEntityModel(veh))
                                            SetVehicleEngineOn(veh, true, true)
                                        end, coords, true)
                                    end
                                end
                            end
                        end
                    end
                end

                for k, v in pairs(Config.Locations["armory"]) do
                    if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 4.5) then
                        if onDuty then
                            if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 1.5) then
                                ppp = 7
                                DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Armory")
                                if IsControlJustReleased(0, Keys["E"]) then
                                    SetWeaponSeries()
                                    TriggerServerEvent("inventory:server:OpenInventory", "shop", 'police', Config.Items)
                                end
                            elseif (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 2.5) then
                                DrawText3D(v.x, v.y, v.z, "Armory")
                            end
                        end
                    end
                end

                for k, v in pairs(Config.Locations["stash"]) do
                    if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 4.5) then
                        if onDuty then
                            if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 1.5) then
                                ppp = 7
                                DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Personal stash")
                                if IsControlJustReleased(0, Keys["E"]) then
                                    TriggerServerEvent("inventory:server:OpenInventory", "stash", "policestash_"..CTRPFW.Functions.GetPlayerData().citizenid)
                                    TriggerEvent("inventory:client:SetCurrentStash", "policestash_"..CTRPFW.Functions.GetPlayerData().citizenid)
                                end
                            elseif (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 2.5) then
                                DrawText3D(v.x, v.y, v.z, "Personal stash")
                            end
                        end
                    end
                end
                
                for k, v in pairs(Config.Locations["snacks"]) do
                    if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 4.5) then
                        if onDuty then
                            if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 1.5) then
                                ppp = 7
                                DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Snacks")
                                if IsControlJustReleased(0, Keys["E"]) then
                                    SetWeaponSeries()
                                    TriggerServerEvent("inventory:server:OpenInventory", "shop", 'police', Config.Itemssnacks)
                                end
                            elseif (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 2.5) then
                                DrawText3D(v.x, v.y, v.z, "Snacks")
                            end
                        end
                    end
                end

                if PlayerJob.gradelabel == "Senior Trooper" or PlayerJob.gradelabel == "Corporal" or PlayerJob.gradelabel == "Sergeant" or PlayerJob.gradelabel == "Lieutenant" or PlayerJob.gradelabel == "Captain" or PlayerJob.gradelabel == "Assistant Commissioner" or PlayerJob.gradelabel == "Deputy Commissioner" or PlayerJob.gradelabel == "Chief" or PlayerJob.gradelabel == "Commissioner" then
    
                    for k, v in pairs(Config.Locations["armory2"]) do
                        if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 4.5) then
                            if onDuty then
                                if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 1.5) then
                                    ppp = 7
                                    DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Weaponry")
                                    if IsControlJustReleased(0, Keys["E"]) then
                                        SetWeaponSeries()
                                        TriggerServerEvent("inventory:server:OpenInventory", "shop", 'police', Config.Items2)
                                    end
                                elseif (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 2.5) then
                                    DrawText3D(v.x, v.y, v.z, "Weaponry")
                                end
                            end
                        end
                    end
                end

                for k, v in pairs(Config.Locations["fingerprint"]) do
                    if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 4.5) then
                        if onDuty then
                            if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 1.5) then
                                ppp = 7
                                DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Scan fingerprint")
                                if IsControlJustReleased(0, Keys["E"]) then
                                    local player, distance = GetClosestPlayer()
                                    if player ~= -1 and distance < 1.5 then
                                        local playerId = GetPlayerServerId(player)
                                        TriggerServerEvent("police:server:showFingerprint", playerId)
                                    else
                                        CTRPFW.Functions.Notify("No one nearby!", "error")
                                    end
                                end
                            elseif (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 2.5) then
                                DrawText3D(v.x, v.y, v.z, "Finger scan")
                            end
                        end
                    end
                end
            end
        end
        Citizen.Wait(ppp)
    end
end)

-- Citizen.CreateThread(function()
--     while true do
--         Citizen.Wait(1)
--         if isLoggedIn then
--             if PlayerJob.name == 'police' and PlayerJob.gradelabel == "Sergeant" or PlayerJob.gradelabel == "Lieutenant" or PlayerJob.gradelabel == "Captain" or PlayerJob.gradelabel == "Assistant Chief" or PlayerJob.gradelabel == "Deputy Chief" or PlayerJob.gradelabel == "Chief" or PlayerJob.gradelabel == "Commissioner" then
--                 local pos = GetEntityCoords(PlayerPedId())

--                 for k, v in pairs(Config.Locations["armory2"]) do
--                     if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 4.5) then
--                         if onDuty then
--                             if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 1.5) then
--                                 DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Weaponry")
--                                 if IsControlJustReleased(0, Keys["E"]) then
--                                     SetWeaponSeries()
--                                     TriggerServerEvent("inventory:server:OpenInventory", "shop", 'police', Config.Items2)
--                                 end
--                             elseif (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 2.5) then
--                                 DrawText3D(v.x, v.y, v.z, "Weaponry")
--                             end
--                         end
--                     end
--                 end


--             else
--                 Citizen.Wait(2000)
--             end
--         end
--     end
-- end)

local inFingerprint = false
local FingerPrintSessionId = nil

RegisterNetEvent('police:client:showFingerprint')
AddEventHandler('police:client:showFingerprint', function(playerId)
    openFingerprintUI()
    FingerPrintSessionId = playerId
end)

RegisterNetEvent('police:client:showFingerprintId')
AddEventHandler('police:client:showFingerprintId', function(fid)
    SendNUIMessage({
        type = "updateFingerprintId",
        fingerprintId = fid
    })
    PlaySound(-1, "Event_Start_Text", "GTAO_FM_Events_Soundset", 0, 0, 1)
end)

RegisterNUICallback('doFingerScan', function(data)
    TriggerServerEvent('police:server:showFingerprintId', FingerPrintSessionId)
end)

function openFingerprintUI()
    SendNUIMessage({
        type = "fingerprintOpen"
    })
    inFingerprint = true
    SetNuiFocus(true, true)
end

RegisterNUICallback('closeFingerprint', function()
    SetNuiFocus(false, false)
    inFingerprint = false
end)

RegisterNetEvent('police:client:SendEmergencyMessage')
AddEventHandler('police:client:SendEmergencyMessage', function(message)
    local coords = GetEntityCoords(PlayerPedId())

    TriggerServerEvent("police:server:SendEmergencyMessage", coords, message)
    TriggerEvent("police:client:CallAnim")
end)

RegisterNetEvent('police:client:SendEmergencyMessages')
AddEventHandler('police:client:SendEmergencyMessages', function(message)
    local coords = GetEntityCoords(PlayerPedId())

    TriggerServerEvent("police:server:SendEmergencyMessages", coords, message)
    TriggerEvent("police:client:CallAnim")
end)

RegisterNetEvent('police:client:EmergencySound')
AddEventHandler('police:client:EmergencySound', function()
    PlaySound(-1, "Event_Start_Text", "GTAO_FM_Events_Soundset", 0, 0, 1)
end)

RegisterNetEvent('police:client:CallAnim')
AddEventHandler('police:client:CallAnim', function()
    local isCalling = true
    local callCount = 5
    loadAnimDict("cellphone@")
    TaskPlayAnim(PlayerPedId(), 'cellphone@', 'cellphone_call_listen_base', 3.0, -1, -1, 49, 0, false, false, false)
    Citizen.Wait(1000)
    Citizen.CreateThread(function()
        while isCalling do
            Citizen.Wait(1000)
            callCount = callCount - 1
            if callCount <= 0 then
                isCalling = false
                StopAnimTask(PlayerPedId(), 'cellphone@', 'cellphone_call_listen_base', 1.0)
            end
        end
    end)
end)

RegisterNetEvent('police:client:ImpoundVehicle')
AddEventHandler('police:client:ImpoundVehicle', function(fullImpound, price)
    local vehicle = CTRPFW.Functions.GetClosestVehicle()
    if vehicle ~= 0 and vehicle ~= nil then
        local pos = GetEntityCoords(PlayerPedId())
        local vehpos = GetEntityCoords(vehicle)
        if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, vehpos.x, vehpos.y, vehpos.z, true) < 5.0) and not IsPedInAnyVehicle(PlayerPedId()) then
            local plate = GetVehicleNumberPlateText(vehicle)
            TriggerServerEvent("police:server:Impound", plate, fullImpound, price)
            CheckPlayers(vehicle)
        end
    end
end)

RegisterNetEvent('police:client:CheckStatus')
AddEventHandler('police:client:CheckStatus', function()
    CTRPFW.Functions.GetPlayerData(function(PlayerData)
        if PlayerJob.name == 'police' then
            local player, distance = GetClosestPlayer()
            if player ~= -1 and distance < 5.0 then
                local playerId = GetPlayerServerId(player)
                CTRPFW.Functions.TriggerCallback('police:GetPlayerStatus', function(result)
                    if result ~= nil then
                        for k, v in pairs(result) do
                            TriggerEvent("chatMessage", "STATUS", "warning", v)
                        end
                    end
                end, playerId)
            end
        end
    end)
end)

function PoliceImpound()
    ayush = MenuV:CreateMenu(false,"Police Impound", 'topright', 1, 59, 254, 'size-125', 'none', 'menuv')
    impound_VehicleList()
end

function impound_VehicleList()
    CTRPFW.Functions.TriggerCallback("police:GetImpoundedVehicles", function(result)
        ped = PlayerPedId();
        

        if result == nil then
            CTRPFW.Functions.Notify("There are no impounded vehicles", "error", 5000)
        else
            for k, v in pairs(result) do
                enginePercent = round(v.engine / 10, 0)
                bodyPercent = round(v.body / 10, 0)
                currentFuel = v.fuel
                ayush:AddButton({
                    icon = '🚔',
                    label = CTRPFW.Shared.Vehicles[v.vehicle]["name"] .." <br> Motor: " .. enginePercent .. " | Body: " .. bodyPercent.. " | Fuel: "..currentFuel,
                    select = function(btn)
                    MenuV:CloseAll()
                    impound_TakeOutVehicle(v)
                    end
                })
            end
            MenuV:OpenMenu(ayush)
        end
    end)
end

function impound_TakeOutVehicle(vehicle)
    enginePercent = round(vehicle.engine / 10, 0)
    bodyPercent = round(vehicle.body / 10, 0)
    currentFuel = vehicle.fuel
    local coords = Config.Locations["impound"][currentGarage]
    CTRPFW.Functions.SpawnVehicle(vehicle.vehicle, function(veh)
        CTRPFW.Functions.TriggerCallback('ctrp-garage:server:GetVehicleProperties', function(properties)
            CTRPFW.Functions.SetVehicleProperties(veh, properties)
            SetVehicleNumberPlateText(veh, vehicle.plate)
            SetEntityHeading(veh, coords.h)
            exports['LegacyFuel']:SetFuel(veh, vehicle.fuel)
            doCarDamage(veh, vehicle)
            TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
            TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
            SetVehicleEngineOn(veh, true, true)
        end, vehicle.plate)
    end, coords, true)
end


function MenuImpound()
    ped = PlayerPedId();
    MenuTitle = "Impounded"
    ClearMenu()
    Menu.addButton("Vehicles", "ImpoundVehicleList", nil)
    Menu.addButton("Close menu", "closeMenuFull", nil)
end

function ImpoundVehicleList()
    CTRPFW.Functions.TriggerCallback("police:GetImpoundedVehicles", function(result)
        ped = PlayerPedId();
        MenuTitle = "Vehicles:"
        ClearMenu()

        if result == nil then
            CTRPFW.Functions.Notify("There are no impounded vehicles", "error", 5000)
            closeMenuFull()
        else
            for k, v in pairs(result) do
                enginePercent = round(v.engine / 10, 0)
                bodyPercent = round(v.body / 10, 0)
                currentFuel = v.fuel

                Menu.addButton(CTRPFW.Shared.Vehicles[v.vehicle]["name"], "TakeOutImpound", v, "Impounded", " Engine: " .. enginePercent .. "%", " Body: " .. bodyPercent.. "%", " Fuel: "..currentFuel.. "%")
            end
        end

        Menu.addButton("Back", "MenuImpound",nil)
    end)
end

function TakeOutImpound(vehicle)
    enginePercent = round(vehicle.engine / 10, 0)
    bodyPercent = round(vehicle.body / 10, 0)
    currentFuel = vehicle.fuel
    local coords = Config.Locations["impound"][currentGarage]
    CTRPFW.Functions.SpawnVehicle(vehicle.vehicle, function(veh)
        CTRPFW.Functions.TriggerCallback('ctrp-garage:server:GetVehicleProperties', function(properties)
            CTRPFW.Functions.SetVehicleProperties(veh, properties)
            SetVehicleNumberPlateText(veh, vehicle.plate)
            SetEntityHeading(veh, coords.h)
            exports['LegacyFuel']:SetFuel(veh, vehicle.fuel)
            doCarDamage(veh, vehicle)
            closeMenuFull()
            TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
            TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
            
            SetVehicleEngineOn(veh, true, true)
        end, vehicle.plate)
    end, coords, true)
end

function MenuOutfits()
    ped = PlayerPedId();
    MenuTitle = "Outfits"
    ClearMenu()
    Menu.addButton("My Outfits", "OutfitsLijst", nil)
    Menu.addButton("Close menu", "closeMenuFull", nil)
end

function changeOutfit()
	Wait(200)
    loadAnimDict("clothingshirt")
	TaskPlayAnim(PlayerPedId(), "clothingshirt", "try_shirt_positive_d", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
	Wait(3100)
	TaskPlayAnim(PlayerPedId(), "clothingshirt", "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
end

function OutfitsLijst()
    CTRPFW.Functions.TriggerCallback('apartments:GetOutfits', function(outfits)
        ped = PlayerPedId();
        MenuTitle = "My Outfits :"
        ClearMenu()

        if outfits == nil then
            CTRPFW.Functions.Notify("You have no outfits saved...", "error", 3500)
            closeMenuFull()
        else
            for k, v in pairs(outfits) do
                Menu.addButton(outfits[k].outfitname, "optionMenu", outfits[k])
            end
        end
        Menu.addButton("Back", "MenuOutfits",nil)
    end)
end

function optionMenu(outfitData)
    ped = PlayerPedId();
    MenuTitle = "What now?"
    ClearMenu()

    Menu.addButton("Choose Outfit", "selectOutfit", outfitData)
    Menu.addButton("Delete Outfit", "removeOutfit", outfitData)
    Menu.addButton("Back", "OutfitsLijst",nil)
end

function selectOutfit(oData)
    TriggerServerEvent('clothes:selectOutfit', oData.model, oData.skin)
    CTRPFW.Functions.Notify(oData.outfitname.." chosen", "success", 2500)
    closeMenuFull()
    changeOutfit()
end

function removeOutfit(oData)
    TriggerServerEvent('clothes:removeOutfit', oData.outfitname)
    CTRPFW.Functions.Notify(oData.outfitname.." is deleted", "success", 2500)
    closeMenuFull()
end

local ayush

function PoliceGarage()
    ayush = MenuV:CreateMenu(false,"Police Garage", 'topright', 1, 59, 254, 'size-125', 'none', 'menuv')
    ayush_VehicleList()
end

function ayush_VehicleList()
    local grade = CTRPFW.Functions.GetPlayerData().job.grade
    for k, v in pairs(Config.Vehicles[grade]) do
        ayush:AddButton({
            icon = '🚔',
            label = v,
            select = function(btn)
            MenuV:CloseAll()
            ayush_TakeOutVehicle(k)
            end
        })
    end
    MenuV:OpenMenu(ayush)
end

function ayush_TakeOutVehicle(vehicleInfo)
    local coords = Config.Locations["vehicle"][currentGarage]
    local callSign = CTRPFW.Functions.GetPlayerData().metadata["callsign"]
    -- TriggerServerEvent("qb-pmi:server:vehicleTakeout", GetVehicleNumberPlateText(vehicle), GetEntityModel(vehicle))
    CTRPFW.Functions.SpawnVehicle(vehicleInfo, function(veh)
        SetVehicleNumberPlateText(veh, callSign)
        SetEntityHeading(veh, coords.h)
        exports['LegacyFuel']:SetFuel(veh, 100.0)
        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
        TriggerServerEvent("qb-pmi:server:vehicleTakeout", GetVehicleNumberPlateText(veh), GetEntityModel(veh))
        TriggerServerEvent("inventory:server:addTrunkItems", GetVehicleNumberPlateText(veh), Config.CarItems)
        SetVehicleEngineOn(veh, true, true)
        SetVehicleDirtLevel(veh)
        WashDecalsFromVehicle(veh, 1.0)
    end, coords, true)
end

function MenuGarage()
    ped = PlayerPedId();
    MenuTitle = "Garage"
    ClearMenu()
    Menu.addButton("Vehicles", "VehicleList", nil)
    Menu.addButton("Close menu", "closeMenuFull", nil)
end

function VehicleList(isDown)
    ped = PlayerPedId();
    MenuTitle = "Vehicles:"
    local grade = CTRPFW.Functions.GetPlayerData().job.grade
    ClearMenu()
    for k, v in pairs(Config.Vehicles[grade]) do
        Menu.addButton(v, "TakeOutVehicle", k, "Garage", " Motor: 100%", " Body: 100%", " Fuel: 100%")
    end
    if IsArmoryWhitelist() then
        for veh, label in pairs(Config.WhitelistedVehicles) do
            Menu.addButton(label, "TakeOutVehicle", veh, "Garage", " Motor: 100%", " Body: 100%", " Fuel: 100%")
        end
    end

    Menu.addButton("Back", "MenuGarage",nil)
end

function TakeOutVehicle(vehicleInfo)
    local coords = Config.Locations["vehicle"][currentGarage]
    local callSign = CTRPFW.Functions.GetPlayerData().metadata["callsign"]

    CTRPFW.Functions.SpawnVehicle(vehicleInfo, function(veh)
        SetVehicleNumberPlateText(veh, callSign)
        SetEntityHeading(veh, coords.h)
        exports['LegacyFuel']:SetFuel(veh, 100.0)
        closeMenuFull()
        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
        TriggerServerEvent("inventory:server:addTrunkItems", GetVehicleNumberPlateText(veh), Config.CarItems)
        SetVehicleEngineOn(veh, true, true)
        SetVehicleDirtLevel(veh)
        WashDecalsFromVehicle(veh, 1.0)
    end, coords, true)
end

function closeMenuFull()
    Menu.hidden = true
    currentGarage = nil
    ClearMenu()
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

    if engine  > 1000.0 then
        engine = 950.0
    end

	if body < 150.0 then
		body = 150.0
	end
	if body < 950.0 then
		smash = true
	end

	if body < 920.0 then
		damageOutside = true
	end

	if body < 920.0 then
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

function SetCarItemsInfo()
	local items = {}
	for k, item in pairs(Config.CarItems) do
		local itemInfo = CTRPFW.Shared.Items[item.name:lower()]
		items[item.slot] = {
			name = itemInfo["name"],
			amount = tonumber(item.amount),
			info = item.info,
			label = itemInfo["label"],
			description = itemInfo["description"] ~= nil and itemInfo["description"] or "",
			weight = itemInfo["weight"],
			type = itemInfo["type"],
			unique = itemInfo["unique"],
			useable = itemInfo["useable"],
			image = itemInfo["image"],
			slot = item.slot,
		}
	end
	Config.CarItems = items
end

function IsArmoryWhitelist()
    local retval = false
    local citizenid = CTRPFW.Functions.GetPlayerData().citizenid
    for k, v in pairs(Config.ArmoryWhitelist) do
        if v == citizenid then
            retval = true
            break
        end
    end
    return retval
end

function SetWeaponSeries()
    for k, v in pairs(Config.Items.items) do
        if k < 6 then
            Config.Items.items[k].info.serie = tostring(Config.RandomInt(2) .. Config.RandomStr(3) .. Config.RandomInt(1) .. Config.RandomStr(2) .. Config.RandomInt(3) .. Config.RandomStr(4))
        end
    end
end

function round(num, numDecimalPlaces)
    return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", num))
end

function CheckPlayers(vehicle)
    for i = -1, 5,1 do                
        seat = GetPedInVehicleSeat(vehicle,i)
        if seat ~= 0 then
            TaskLeaveVehicle(seat,vehicle,0)
            SetVehicleDoorsLocked(vehicle)
            Wait(1500)
            CTRPFW.Functions.DeleteVehicle(vehicle)
            TriggerServerEvent("qb-pmi:server:vehicleStore", GetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId())))
        end
   end
end
