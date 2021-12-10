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
local currentGarage = 1
Citizen.CreateThread(function()
    while true do
        sleep = 2500
        if isLoggedIn and CTRPFW ~= nil then
            local pos = GetEntityCoords(PlayerPedId())
            sleep = 2000
            if PlayerJob.name == "doctor" then

                for k, v in pairs(Config.Locations["duty"]) do
                    if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 5) then
                        sleep = 7
                        if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 1.5) then
                            sleep = 7
                            if onDuty then
                                DrawText3D(v.x, v.y, v.z, "~r~E~w~ - Leave service")
                            else
                                DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Go on duty")
                            end
                            if IsControlJustReleased(0, Keys["E"]) then
                                onDuty = not onDuty
                                TriggerServerEvent("CTRPFW:ToggleDuty")
                                TriggerServerEvent("police:server:UpdateBlips")
                            end
                        elseif (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 4.5) then
                            DrawText3D(v.x, v.y, v.z, "In/Out service")
                        end  
                    end
                end

                for k, v in pairs(Config.Locations["armory"]) do
                    if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 4.5) then
                        sleep = 7
                        if onDuty then
                            if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 1.5) then
                                sleep = 7
                                DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Safe")
                                if IsControlJustReleased(0, Keys["E"]) then
                                    TriggerServerEvent("inventory:server:OpenInventory", "shop", "hospital", Config.Items)
                                end
                            elseif (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 2.5) then
                                DrawText3D(v.x, v.y, v.z, "Safe")
                            end
                        end
                    end
                end

                for k, v in pairs(Config.Locations["pstash"]) do
                    if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 4.5) then
                        sleep = 7
                       -- if onDuty then
                            if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 1.5) then
                                sleep = 7
                                DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Personal Stash")
                                if IsControlJustReleased(0, Keys["E"]) then

                                    TriggerServerEvent("inventory:server:OpenInventory", "stash", "drstash"..CTRPFW.Functions.GetPlayerData().citizenid)
                                    TriggerEvent("inventory:client:SetCurrentStash", "drstash"..CTRPFW.Functions.GetPlayerData().citizenid)

                                    
                                end
                            elseif (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 2.5) then
                                DrawText3D(v.x, v.y, v.z, "Stash")
                            end
                       -- end
                    end
                end

                for k, v in pairs(Config.Locations["vehicle"]) do
                    if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 4.5) then
                        sleep = 7
                        if onDuty then
                            DrawMarker(2, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 0, 0, 222, false, false, false, true, false, false, false)
                            if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 1.5) then
                                sleep = 7
                                if IsPedInAnyVehicle(PlayerPedId(), false) then
                                    DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Vehicle storage")
                                else
                                    DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Vehicles")
                                end
                                if IsControlJustReleased(0, Keys["E"]) then
                                    if IsPedInAnyVehicle(PlayerPedId(), false) then
                                        CheckPlayers(GetVehiclePedIsIn(PlayerPedId()))
                                    else
                                        ismenu = true
                                        EMSGarage()
                                        currentGarage = k
                                        -- Menu.hidden = not Menu.hidden
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

                for k, v in pairs(Config.Locations["helicopter"]) do
                    if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 7.5) then
                        sleep = 7
                        if onDuty then
                            DrawMarker(2, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 0, 0, 222, false, false, false, true, false, false, false)
                            if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 1.5) then
                                sleep = 7
                                if IsPedInAnyVehicle(PlayerPedId(), false) then
                                    DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Helicopter storage")
                                else
                                    DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Helicopter packs")
                                end
                                if IsControlJustReleased(0, Keys["E"]) then
                                    if IsPedInAnyVehicle(PlayerPedId(), false) then
                                        CheckPlayers(GetVehiclePedIsIn(PlayerPedId()))
                                    else
                                        local coords = Config.Locations["helicopter"][k]
                                        CTRPFW.Functions.SpawnVehicle(Config.Helicopter, function(veh)
                                            SetVehicleNumberPlateText(veh, "LIFE"..tostring(math.random(1000, 9999)))
                                            SetEntityHeading(veh, coords.h)
                                            exports['LegacyFuel']:SetFuel(veh, 100.0)
                                            closeMenuFull()
                                            TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
                                            TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                                            SetVehicleEngineOn(veh, true, true)
                                        end, coords, true)
                                    end
                                end
                            end
                        end
                    end
                end
            end
            local currentHospital = 1
            for k, v in pairs(Config.Locations["main"]) do
                if (GetDistanceBetweenCoords(pos,v.x,v.y,v.z, true) < 1.5) then
                    sleep = 7
                    DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Take the elevator to the roof")
                    if IsControlJustReleased(0, Keys["E"]) then
                        DoScreenFadeOut(500)
                        while not IsScreenFadedOut() do
                            Citizen.Wait(10)
                        end

                        currentHospital = k

                        local coords = Config.Locations["roof"][currentHospital]
                        SetEntityCoords(PlayerPedId(), coords.x, coords.y, coords.z, 0, 0, 0, false)
                        SetEntityHeading(PlayerPedId(), coords.h)

                        Citizen.Wait(100)

                        DoScreenFadeIn(1000)
                    end
                end
            end

            for k, v in pairs(Config.Locations["roof"]) do
                if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 1.5) then
                    sleep = 7
                    DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Take the lift down")
                    if IsControlJustReleased(0, Keys["E"]) then
                        DoScreenFadeOut(500)
                        while not IsScreenFadedOut() do
                            Citizen.Wait(10)
                        end

                        currentHospital = k

                        local coords = Config.Locations["main"][currentHospital]
                        SetEntityCoords(PlayerPedId(), coords.x, coords.y, coords.z, 0, 0, 0, false)
                        SetEntityHeading(PlayerPedId(), coords.h)

                        Citizen.Wait(100)

                        DoScreenFadeIn(1000)
                    end
                end
            end

            for k, v in pairs(Config.Locations["mains"]) do
                if (GetDistanceBetweenCoords(pos,v.x,v.y,v.z, true) < 1.5) then
                    sleep = 7
                    DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Take the elevator to the main floor")
                    if IsControlJustReleased(0, Keys["E"]) then
                        DoScreenFadeOut(500)
                        while not IsScreenFadedOut() do
                            Citizen.Wait(10)
                        end

                        currentHospital = k

                        local coords = Config.Locations["roofs"][currentHospital]
                        SetEntityCoords(PlayerPedId(), coords.x, coords.y, coords.z, 0, 0, 0, false)
                        SetEntityHeading(PlayerPedId(), coords.h)

                        Citizen.Wait(100)

                        DoScreenFadeIn(1000)
                    end
                end
            end
                --added backdoor
            for k, v in pairs(Config.Locations["roofs"]) do
                if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 1.5) then
                    sleep = 7
                    DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Take the lift down")
                    if IsControlJustReleased(0, Keys["E"]) then
                        DoScreenFadeOut(500)
                        while not IsScreenFadedOut() do
                            Citizen.Wait(10)
                        end

                        currentHospital = k

                        local coords = Config.Locations["mains"][currentHospital]
                        SetEntityCoords(PlayerPedId(), coords.x, coords.y, coords.z, 0, 0, 0, false)
                        SetEntityHeading(PlayerPedId(), coords.h)

                        Citizen.Wait(100)

                        DoScreenFadeIn(1000)
                    end
                end
            end

             --second
             for k, v in pairs(Config.Locations["roofcd"]) do
                if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 1.5) then
                    sleep = 7
                    DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Take the lift down")
                    if IsControlJustReleased(0, Keys["E"]) then
                        DoScreenFadeOut(500)
                        while not IsScreenFadedOut() do
                            Citizen.Wait(10)
                        end

                        currentHospital = k

                        local coords = Config.Locations["maincd"][currentHospital]
                        SetEntityCoords(PlayerPedId(), coords.x, coords.y, coords.z, 0, 0, 0, false)
                        SetEntityHeading(PlayerPedId(), coords.h)

                        Citizen.Wait(100)

                        DoScreenFadeIn(1000)
                    end
                end
            end

            for k, v in pairs(Config.Locations["maincd"]) do
                if (GetDistanceBetweenCoords(pos,v.x,v.y,v.z, true) < 1.5) then
                    sleep = 7
                    DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Take the elevator to the main floor")
                    if IsControlJustReleased(0, Keys["E"]) then
                        DoScreenFadeOut(500)
                        while not IsScreenFadedOut() do
                            Citizen.Wait(10)
                        end

                        currentHospital = k

                        local coords = Config.Locations["roofcd"][currentHospital]
                        SetEntityCoords(PlayerPedId(), coords.x, coords.y, coords.z, 0, 0, 0, false)
                        SetEntityHeading(PlayerPedId(), coords.h)

                        Citizen.Wait(100)

                        DoScreenFadeIn(1000)
                    end
                end
            end

            --cityhall
            for k, v in pairs(Config.Locations["roofch"]) do
                if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 1.5) then
                    sleep = 7
                    DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Take the lift down")
                    if IsControlJustReleased(0, Keys["E"]) then
                        DoScreenFadeOut(500)
                        while not IsScreenFadedOut() do
                            Citizen.Wait(10)
                        end

                        currentHospital = k

                        local coords = Config.Locations["mainch"][currentHospital]
                        SetEntityCoords(PlayerPedId(), coords.x, coords.y, coords.z, 0, 0, 0, false)
                        SetEntityHeading(PlayerPedId(), coords.h)

                        Citizen.Wait(100)

                        DoScreenFadeIn(1000)
                    end
                end
            end

            for k, v in pairs(Config.Locations["mainch"]) do
                if (GetDistanceBetweenCoords(pos,v.x,v.y,v.z, true) < 1.5) then
                    sleep = 7
                    DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Take the elevator to the 1st floor")
                    if IsControlJustReleased(0, Keys["E"]) then
                        DoScreenFadeOut(500)
                        while not IsScreenFadedOut() do
                            Citizen.Wait(10)
                        end

                        currentHospital = k

                        local coords = Config.Locations["roofch"][currentHospital]
                        SetEntityCoords(PlayerPedId(), coords.x, coords.y, coords.z, 0, 0, 0, false)
                        SetEntityHeading(PlayerPedId(), coords.h)

                        Citizen.Wait(100)

                        DoScreenFadeIn(1000)
                    end
                end
            end

            for k, v in pairs(Config.Locations["roofch1"]) do
                if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 1.5) then
                    sleep = 7
                    DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Take the lift down")
                    if IsControlJustReleased(0, Keys["E"]) then
                        DoScreenFadeOut(500)
                        while not IsScreenFadedOut() do
                            Citizen.Wait(10)
                        end

                        currentHospital = k

                        local coords = Config.Locations["mainch1"][currentHospital]
                        SetEntityCoords(PlayerPedId(), coords.x, coords.y, coords.z, 0, 0, 0, false)
                        SetEntityHeading(PlayerPedId(), coords.h)

                        Citizen.Wait(100)

                        DoScreenFadeIn(1000)
                    end
                end
            end

            for k, v in pairs(Config.Locations["mainch1"]) do
                if (GetDistanceBetweenCoords(pos,v.x,v.y,v.z, true) < 1.5) then
                    sleep = 7
                    DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Take the elevator to the 2nd floor")
                    if IsControlJustReleased(0, Keys["E"]) then
                        DoScreenFadeOut(500)
                        while not IsScreenFadedOut() do
                            Citizen.Wait(10)
                        end

                        currentHospital = k

                        local coords = Config.Locations["roofch1"][currentHospital]
                        SetEntityCoords(PlayerPedId(), coords.x, coords.y, coords.z, 0, 0, 0, false)
                        SetEntityHeading(PlayerPedId(), coords.h)

                        Citizen.Wait(100)

                        DoScreenFadeIn(1000)
                    end
                end
            end

            for k, v in pairs(Config.Locations["roofch2"]) do
                if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 1.5) then
                    sleep = 7
                    DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Take the lift down")
                    if IsControlJustReleased(0, Keys["E"]) then
                        DoScreenFadeOut(500)
                        while not IsScreenFadedOut() do
                            Citizen.Wait(10)
                        end

                        currentHospital = k

                        local coords = Config.Locations["mainch2"][currentHospital]
                        SetEntityCoords(PlayerPedId(), coords.x, coords.y, coords.z, 0, 0, 0, false)
                        SetEntityHeading(PlayerPedId(), coords.h)

                        Citizen.Wait(100)

                        DoScreenFadeIn(1000)
                    end
                end
            end

            for k, v in pairs(Config.Locations["mainch2"]) do
                if (GetDistanceBetweenCoords(pos,v.x,v.y,v.z, true) < 1.5) then
                    sleep = 7
                    DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Take the elevator to the 3rd floor")
                    if IsControlJustReleased(0, Keys["E"]) then
                        DoScreenFadeOut(500)
                        while not IsScreenFadedOut() do
                            Citizen.Wait(10)
                        end

                        currentHospital = k

                        local coords = Config.Locations["roofch2"][currentHospital]
                        SetEntityCoords(PlayerPedId(), coords.x, coords.y, coords.z, 0, 0, 0, false)
                        SetEntityHeading(PlayerPedId(), coords.h)

                        Citizen.Wait(100)

                        DoScreenFadeIn(1000)
                    end
                end
            end

            if PlayerJob.name == "governor" then
                for k, v in pairs(Config.Locations["roofch3"]) do
                    if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 1.5) then
                        sleep = 7
                        DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Take the lift down")
                        if IsControlJustReleased(0, Keys["E"]) then
                            DoScreenFadeOut(500)
                            while not IsScreenFadedOut() do
                                Citizen.Wait(10)
                            end

                            currentHospital = k

                            local coords = Config.Locations["mainch3"][currentHospital]
                            SetEntityCoords(PlayerPedId(), coords.x, coords.y, coords.z, 0, 0, 0, false)
                            SetEntityHeading(PlayerPedId(), coords.h)

                            Citizen.Wait(100)

                            DoScreenFadeIn(1000)
                        end
                    end
                end

            
                for k, v in pairs(Config.Locations["mainch3"]) do
                    if (GetDistanceBetweenCoords(pos,v.x,v.y,v.z, true) < 1.5) then
                        sleep = 7
                        DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Take the elevator to the Governor floor")
                        if IsControlJustReleased(0, Keys["E"]) then
                            DoScreenFadeOut(500)
                            while not IsScreenFadedOut() do
                                Citizen.Wait(10)
                            end

                            currentHospital = k

                            local coords = Config.Locations["roofch3"][currentHospital]
                            SetEntityCoords(PlayerPedId(), coords.x, coords.y, coords.z, 0, 0, 0, false)
                            SetEntityHeading(PlayerPedId(), coords.h)

                            Citizen.Wait(100)

                            DoScreenFadeIn(1000)
                        end
                    end
                end
            end  

            for k, v in pairs(Config.Locations["mainch4"]) do
                if (GetDistanceBetweenCoords(pos,v.x,v.y,v.z, true) < 1.5) then
                    sleep = 7
                    DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Take the elevator to the parking")
                    if IsControlJustReleased(0, Keys["E"]) then
                        DoScreenFadeOut(500)
                        while not IsScreenFadedOut() do
                            Citizen.Wait(10)
                        end

                        currentHospital = k

                        local coords = Config.Locations["mainch"][currentHospital]
                        SetEntityCoords(PlayerPedId(), coords.x, coords.y, coords.z, 0, 0, 0, false)
                        SetEntityHeading(PlayerPedId(), coords.h)

                        Citizen.Wait(100)

                        DoScreenFadeIn(1000)
                    end
                end
            end


             --court 
            for k, v in pairs(Config.Locations["mainc"]) do
                if (GetDistanceBetweenCoords(pos,v.x,v.y,v.z, true) < 1.5) then
                    sleep = 7
                    DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Take the elevator Up")
                    if IsControlJustReleased(0, Keys["E"]) then
                        DoScreenFadeOut(500)
                        while not IsScreenFadedOut() do
                            Citizen.Wait(10)
                        end

                        currentHospital = k

                        local coords = Config.Locations["roofc"][currentHospital]
                        SetEntityCoords(PlayerPedId(), coords.x, coords.y, coords.z, 0, 0, 0, false)
                        SetEntityHeading(PlayerPedId(), coords.h)

                        Citizen.Wait(100)

                        DoScreenFadeIn(1000)
                    end
                end
            end

            for k, v in pairs(Config.Locations["roofc"]) do
                if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 1.5) then
                    sleep = 7
                    DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Take the elevator down")
                    if IsControlJustReleased(0, Keys["E"]) then
                        DoScreenFadeOut(500)
                        while not IsScreenFadedOut() do
                            Citizen.Wait(10)
                        end

                        currentHospital = k

                        local coords = Config.Locations["mainc"][currentHospital]
                        SetEntityCoords(PlayerPedId(), coords.x, coords.y, coords.z, 0, 0, 0, false)
                        SetEntityHeading(PlayerPedId(), coords.h)

                        Citizen.Wait(100)

                        DoScreenFadeIn(1000)
                    end
                end
            end

            --coke
            for k, v in pairs(Config.Locations["maincoke"]) do
                if (GetDistanceBetweenCoords(pos,v.x,v.y,v.z, true) < 1.5) then
                    sleep = 7
                    DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Get Out")
                    if IsControlJustReleased(0, Keys["E"]) then
                        DoScreenFadeOut(500)
                        while not IsScreenFadedOut() do
                            Citizen.Wait(10)
                        end

                        currentHospital = k

                        local coords = Config.Locations["roofcoke"][currentHospital]
                        SetEntityCoords(PlayerPedId(), coords.x, coords.y, coords.z, 0, 0, 0, false)
                        SetEntityHeading(PlayerPedId(), coords.h)

                        Citizen.Wait(100)

                        DoScreenFadeIn(1000)
                    end
                end
            end

            for k, v in pairs(Config.Locations["roofcoke"]) do
                if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 1.5) then
                    sleep = 7
                    DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Get In")
                    if IsControlJustReleased(0, Keys["E"]) then
                        DoScreenFadeOut(500)
                        while not IsScreenFadedOut() do
                            Citizen.Wait(10)
                        end

                        currentHospital = k

                        local coords = Config.Locations["maincoke"][currentHospital]
                        SetEntityCoords(PlayerPedId(), coords.x, coords.y, coords.z, 0, 0, 0, false)
                        SetEntityHeading(PlayerPedId(), coords.h)

                        Citizen.Wait(100)

                        DoScreenFadeIn(1000)
                    end
                end
            end
        end
        Wait(sleep)
    end
end)
-- local aaa
-- Citizen.CreateThread(function()
--     while true do
--         aaa = 2500
--         if isLoggedIn and CTRPFW ~= nil then
            
--         end
--         Citizen.Wait(aaa)
--     end 
-- end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        if isStatusChecking then
            for k, v in pairs(statusChecks) do
                local x,y,z = table.unpack(GetPedBoneCoords(statusCheckPed, v.bone))
                DrawText3D(x, y, z, v.label)
            end
        end

        if isHealingPerson then
            if not IsEntityPlayingAnim(PlayerPedId(), healAnimDict, healAnim, 3) then
                loadAnimDict(healAnimDict)
                TaskPlayAnim(PlayerPedId(), healAnimDict, healAnim, 3.0, 3.0, -1, 49, 0, 0, 0, 0)
            end
        end
    end
end)

RegisterNetEvent('hospital:client:SendAlert')
AddEventHandler('hospital:client:SendAlert', function(msg)
    PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0, 0, 1)
    TriggerEvent("chatMessage", "PAGER", "error", msg)
end)

RegisterNetEvent('112:client:SendAlert')
AddEventHandler('112:client:SendAlert', function(msg, blipSettings)
    if (PlayerJob.name == "police" or PlayerJob.name == "doctor") and onDuty then
        if blipSettings ~= nil then
            local transG = 250
            local blip = AddBlipForCoord(blipSettings.x, blipSettings.y, blipSettings.z)
            SetBlipSprite(blip, blipSettings.sprite)
            SetBlipColour(blip, blipSettings.color)
            SetBlipDisplay(blip, 4)
            SetBlipAlpha(blip, transG)
            SetBlipScale(blip, blipSettings.scale)
            SetBlipAsShortRange(blip, false)
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentString(blipSettings.text)
            EndTextCommandSetBlipName(blip)
            while transG ~= 0 do
                Wait(180 * 4)
                transG = transG - 1
                SetBlipAlpha(blip, transG)
                if transG == 0 then
                    SetBlipSprite(blip, 2)
                    RemoveBlip(blip)
                    return
                end
            end
        end
    end
end)

RegisterNetEvent('hospital:client:AiCall')
AddEventHandler('hospital:client:AiCall', function()
    local PlayerPeds = {}
    for _, player in ipairs(GetActivePlayers()) do
        local ped = GetPlayerPed(player)
        table.insert(PlayerPeds, ped)
    end
    local player = PlayerPedId()
    local coords = GetEntityCoords(player)
    local closestPed, closestDistance = CTRPFW.Functions.GetClosestPed(coords, PlayerPeds)
    local gender = CTRPFW.Functions.GetPlayerData().gender
    local s1, s2 = Citizen.InvokeNative(0x2EB41072B4C1E4C0, coords.x, coords.y, coords.z, Citizen.PointerValueInt(), Citizen.PointerValueInt())
    local street1 = GetStreetNameFromHashKey(s1)
    local street2 = GetStreetNameFromHashKey(s2)
    if closestDistance < 50.0 and closestPed ~= 0 then
        MakeCall(closestPed, gender, street1, street2)
    end
end)

function MakeCall(ped, male, street1, street2)
    local callAnimDict = "cellphone@"
    local callAnim = "cellphone_call_listen_base"
    local rand = (math.random(6,9) / 100) + 0.3
    local rand2 = (math.random(6,9) / 100) + 0.3
    local coords = GetEntityCoords(PlayerPedId())
    local blipsettings = {
        x = coords.x,
        y = coords.y,
        z = coords.z,
        sprite = 280,
        color = 4,
        scale = 0.9,
        text = "Wounded person"
    }

    if math.random(10) > 5 then
        rand = 0.0 - rand
    end

    if math.random(10) > 5 then
        rand2 = 0.0 - rand2
    end

    local moveto = GetOffsetFromEntityInWorldCoords(PlayerPedId(), rand, rand2, 0.0)

    TaskGoStraightToCoord(ped, moveto, 2.5, -1, 0.0, 0.0)
    SetPedKeepTask(ped, true)

    local dist = GetDistanceBetweenCoords(moveto, GetEntityCoords(ped), false)

    while dist > 3.5 and isDead do
        TaskGoStraightToCoord(ped, moveto, 2.5, -1, 0.0, 0.0)
        dist = GetDistanceBetweenCoords(moveto, GetEntityCoords(ped), false)
        Citizen.Wait(100)
    end

    ClearPedTasksImmediately(ped)
    TaskLookAtEntity(ped, PlayerPedId(), 5500.0, 2048, 3)
    TaskTurnPedToFaceEntity(ped, PlayerPedId(), 5500)

    Citizen.Wait(3000)

    --TaskStartScenarioInPlace(ped,"WORLD_HUMAN_STAND_MOBILE", 0, 1)
    loadAnimDict(callAnimDict)
    TaskPlayAnim(ped, callAnimDict, callAnim, 1.0, 1.0, -1, 49, 0, 0, 0, 0)

    SetPedKeepTask(ped, true)

    Citizen.Wait(5000)

    TriggerServerEvent("hospital:server:MakeDeadCall", blipsettings, male, street1, street2)

    SetEntityAsNoLongerNeeded(ped)
    ClearPedTasks(ped)
end

RegisterNetEvent('hospital:client:RevivePlayer')
AddEventHandler('hospital:client:RevivePlayer', function()
    CTRPFW.Functions.GetPlayerData(function(PlayerData)
        if ((PlayerJob.name == "doctor") and onDuty) then
            CTRPFW.Functions.TriggerCallback('CTRPFW:HasItem', function(result)
                if result then
                    local player, distance = GetClosestPlayer()
                    if player ~= -1 and distance < 5.0 then
                        local playerId = GetPlayerServerId(player)
                        isHealingPerson = true
                        TriggerServerEvent("CTRPFW:Server:RemoveItem", "firstaid", 1)
                        TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items["firstaid"], "remove")

                        CTRPFW.Functions.Progressbar("hospital_revive", "Help the person up..", 5000, false, true, {
                            disableMovement = false,
                            disableCarMovement = false,
                            disableMouse = false,
                            disableCombat = true,
                        }, {
                            animDict = healAnimDict,
                            anim = healAnim,
                            flags = 16,
                        }, {}, {}, function() -- Done
                            isHealingPerson = false
                            StopAnimTask(PlayerPedId(), healAnimDict, "exit", 1.0)
                            CTRPFW.Functions.Notify("You helped the person!")
                            TriggerServerEvent("hospital:server:RevivePlayer", playerId)
                        end, function() -- Cancel
                            isHealingPerson = false
                            StopAnimTask(PlayerPedId(), healAnimDict, "exit", 1.0)
                            CTRPFW.Functions.Notify("Fail!", "error")
                        end)
                    end
                else
                    CTRPFW.Functions.Notify("You don't have First-Aid Kit!", "error")
                end
            
            end, 'firstaid')
        else
            CTRPFW.Functions.Notify("You are not authorised or off duty", "error")
        end
    end)
end)

RegisterNetEvent('hospital:client:CheckStatus')
AddEventHandler('hospital:client:CheckStatus', function()
    CTRPFW.Functions.GetPlayerData(function(PlayerData)
        if ((PlayerJob.name == "police" or PlayerJob.name == "doctor") and onDuty) then
            local player, distance = GetClosestPlayer()
            if player ~= -1 and distance < 5.0 then
                local playerId = GetPlayerServerId(player)
                statusCheckPed = GetPlayerPed(player)
                CTRPFW.Functions.TriggerCallback('hospital:GetPlayerStatus', function(result)
                    if result ~= nil then
                        for k, v in pairs(result) do
                            if k ~= "BLEED" and k ~= "WEAPONWOUNDS" then
                                table.insert(statusChecks, {bone = Config.BoneIndexes[k], label = v.label .." (".. Config.WoundStates[v.severity] ..")"})
                            elseif result["WEAPONWOUNDS"] ~= nil then
                                for k, v in pairs(result["WEAPONWOUNDS"]) do
                                    TriggerEvent("chatMessage", "STATUS CHECK", "error", WeaponDamageList[v])
                                end
                            elseif result["BLEED"] > 0 then
                                TriggerEvent("chatMessage", "STATUS CHECK", "error", "Is "..Config.BleedingStates[v].label)
                            end
                        end
                        isStatusChecking = true
                        statusCheckTime = Config.CheckTime
                    end
                end, playerId)
            end
        else
            CTRPFW.Functions.Notify("You are not authorised or off duty", "error")
        end
    end)
end)

RegisterNetEvent('hospital:client:TreatWounds')
AddEventHandler('hospital:client:TreatWounds', function()
    CTRPFW.Functions.GetPlayerData(function(PlayerData)
        if ((PlayerJob.name == "doctor") and onDuty) then
            CTRPFW.Functions.TriggerCallback('CTRPFW:HasItem', function(result)
                if result then
                    local player, distance = GetClosestPlayer()
                    if player ~= -1 and distance < 5.0 then
                        local playerId = GetPlayerServerId(player)
                        isHealingPerson = true
                        TriggerServerEvent("CTRPFW:Server:RemoveItem", "bandage", 1)
                        TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items["bandage"], "remove")

                        CTRPFW.Functions.Progressbar("hospital_healwounds", "Wounds heal..", 5000, false, true, {
                            disableMovement = false,
                            disableCarMovement = false,
                            disableMouse = false,
                            disableCombat = true,
                        }, {
                            animDict = healAnimDict,
                            anim = healAnim,
                            flags = 16,
                        }, {}, {}, function() -- Done
                            isHealingPerson = false
                            StopAnimTask(PlayerPedId(), healAnimDict, "exit", 1.0)
                            CTRPFW.Functions.Notify("You helped the person!")
                            TriggerServerEvent("hospital:server:TreatWounds", playerId)
                        end, function() -- Cancel
                            isHealingPerson = false
                            StopAnimTask(PlayerPedId(), healAnimDict, "exit", 1.0)
                            CTRPFW.Functions.Notify("Fail!", "error")
                        end)
                    end
                else
                    CTRPFW.Functions.Notify("You don't have bandage!", "error")
                end
            
            end, 'bandage')
        else
            CTRPFW.Functions.Notify("You are not authorised or off duty", "error")
        end
    end)
end)

local ayush
function EMSGarage()
    ayush = MenuV:CreateMenu(false,"EMS Garage", 'topright', 234, 31, 31, 'size-125', 'none', 'menuv')
    ayush_VehicleList()
end

function ayush_VehicleList()
    for k, v in pairs(Config.Vehicles) do
        ayush:AddButton({
            icon = '🚑',
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

    CTRPFW.Functions.SpawnVehicle(vehicleInfo, function(veh)
        SetVehicleNumberPlateText(veh, callSign)
        SetEntityHeading(veh, coords.h)
        exports['LegacyFuel']:SetFuel(veh, 100.0)
        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
        SetVehicleEngineOn(veh, true, true)
        SetVehicleDirtLevel(veh)
        WashDecalsFromVehicle(veh, 1.0)
    end, coords, true)
end


function MenuGarage(isDown)
    ped = PlayerPedId();
    MenuTitle = "Garage"
    ClearMenu()
    Menu.addButton("My Vehicles", "VehicleList", isDown)
    Menu.addButton("Close Menu", "closeMenuFull", nil)
end

function VehicleList(isDown)
    ped = PlayerPedId();
    MenuTitle = "Vehicles:"
    ClearMenu()
    for k, v in pairs(Config.Vehicles) do
        Menu.addButton(Config.Vehicles[k], "TakeOutVehicle", {k, isDown}, "Garage", " Motor: 100%", " Body: 100%", " Fuel: 100%")
    end

    Menu.addButton("Back", "MenuGarage",nil)
end

function TakeOutVehicle(vehicleInfo)
    local coords = Config.Locations["vehicle"][currentGarage]
    CTRPFW.Functions.SpawnVehicle(vehicleInfo[1], function(veh)
        SetVehicleNumberPlateText(veh, "AMBU"..tostring(math.random(1000, 9999)))
        SetEntityHeading(veh, coords.h)
        exports['LegacyFuel']:SetFuel(veh, 100.0)
        closeMenuFull()
        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
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