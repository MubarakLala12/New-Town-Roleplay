local IsCuffing = false
local NeededAttempts = 0
local SucceededAttempts = 0
local FailedAttemps = 0
local isCuffed = false

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(1)
        if isEscorted then
            DisableAllControlActions(0)
            EnableControlAction(0, 1, true)
			EnableControlAction(0, 2, true)
            EnableControlAction(0, Keys['T'], true)
            EnableControlAction(0, Keys['E'], true)
            EnableControlAction(0, Keys['ESC'], true)
        end

        if isHandcuffed then
            DisableControlAction(0, 24, true) -- Attack
			DisableControlAction(0, 257, true) -- Attack 2
			DisableControlAction(0, 25, true) -- Aim
			DisableControlAction(0, 263, true) -- Melee Attack 1

			DisableControlAction(0, Keys['R'], true) -- Reload
			DisableControlAction(0, Keys['SPACE'], true) -- Jump
			DisableControlAction(0, Keys['Q'], true) -- Cover
			DisableControlAction(0, Keys['TAB'], true) -- Select Weapon
			DisableControlAction(0, Keys['F'], true) -- Also 'enter'?

			DisableControlAction(0, Keys['F1'], true) -- Disable phone
			DisableControlAction(0, Keys['F2'], true) -- Inventory
			DisableControlAction(0, Keys['F3'], true) -- Animations
			DisableControlAction(0, Keys['F6'], true) -- Job

			DisableControlAction(0, Keys['C'], true) -- Disable looking behind
			DisableControlAction(0, Keys['X'], true) -- Disable clearing animation
			DisableControlAction(2, Keys['P'], true) -- Disable pause screen

			DisableControlAction(0, 59, true) -- Disable steering in vehicle
			DisableControlAction(0, 71, true) -- Disable driving forward in vehicle
			DisableControlAction(0, 72, true) -- Disable reversing in vehicle

			DisableControlAction(2, Keys['LEFTCTRL'], true) -- Disable going stealth

			DisableControlAction(0, 264, true) -- Disable melee
			DisableControlAction(0, 257, true) -- Disable melee
			DisableControlAction(0, 140, true) -- Disable melee
			DisableControlAction(0, 141, true) -- Disable melee
			DisableControlAction(0, 142, true) -- Disable melee
			DisableControlAction(0, 143, true) -- Disable melee
			DisableControlAction(0, 75, true)  -- Disable exit vehicle
			DisableControlAction(27, 75, true) -- Disable exit vehicle

            if (not IsEntityPlayingAnim(PlayerPedId(), "mp_arresting", "idle", 3) and not IsEntityPlayingAnim(PlayerPedId(), "mp_arrest_paired", "crook_p2_back_right", 3)) and not CTRPFW.Functions.GetPlayerData().metadata["isdead"] then
                loadAnimDict("mp_arresting")
                TaskPlayAnim(PlayerPedId(), "mp_arresting", "idle", 8.0, -8, -1, cuffType, 0, 0, 0, 0)
            end
        end
        if not isHandcuffed and not isEscorted then
            Citizen.Wait(2000)
        end
    end
end)

RegisterNetEvent('police:client:SetOutVehicle')
AddEventHandler('police:client:SetOutVehicle', function()
    if IsPedInAnyVehicle(PlayerPedId(), false) then
        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
        TaskLeaveVehicle(PlayerPedId(), vehicle, 16)
    end
end)

--[[RegisterNetEvent('police:client:PutInVehicle')
AddEventHandler('police:client:PutInVehicle', function()
    if isHandcuffed or isEscorted then
        local vehicle = CTRPFW.Functions.GetClosestVehicle()
        if DoesEntityExist(vehicle) then
			for i = GetVehicleMaxNumberOfPassengers(vehicle), 1, -1 do
                if IsVehicleSeatFree(vehicle, i) then
                    isEscorted = false
                    TriggerEvent('hospital:client:isEscorted', isEscorted)
                    ClearPedTasks(PlayerPedId())
                    DetachEntity(PlayerPedId(), true, false)

                    Citizen.Wait(100)
                    SetPedIntoVehicle(PlayerPedId(), vehicle, i)
                    return
                end
            end
		end
    end
end)]]

RegisterNetEvent('police:client:PutInVehicle')
AddEventHandler('police:client:PutInVehicle', function()
    if isHandcuffed or isEscorted then
        local vehicle = CTRPFW.Functions.GetClosestVehicle()
        if DoesEntityExist(vehicle) then
			for i = GetVehicleMaxNumberOfPassengers(vehicle), 1, -1 do
                if IsVehicleSeatFree(vehicle, i) then
                    isEscorted = false
                    TriggerEvent('hospital:client:isEscorted', isEscorted)
                    ClearPedTasks(PlayerPedId())
                    DetachEntity(PlayerPedId(), true, false)

                    Citizen.Wait(100)
                    SetPedIntoVehicle(PlayerPedId(), vehicle, i)
                    return
                else 
                    isEscorted = false
                    TriggerEvent('hospital:client:isEscorted', isEscorted)
                    ClearPedTasks(PlayerPedId())
                    DetachEntity(PlayerPedId(), true, false)

                    Citizen.Wait(100)
                    if GetVehicleClass(vehicle) == 8 then
                        CTRPFW.Functions.Notify("Virus toh bunty hai! ", "error")
                    else
                        SetPedIntoVehicle(PlayerPedId(), vehicle, 0)
                    end
                
                end
            end
		end
    end
end)

RegisterNetEvent('police:client:SearchPlayer')
AddEventHandler('police:client:SearchPlayer', function()
    local player, distance = GetClosestPlayer()
    if player ~= -1 and distance < 2.5 then
        local playerId = GetPlayerServerId(player)
        TriggerServerEvent("inventory:server:OpenInventory", "otherplayer", playerId)
        TriggerServerEvent("police:server:SearchPlayer", playerId)
    else
        CTRPFW.Functions.Notify("No one nearby!", "error")
    end
end)

RegisterNetEvent('police:client:SeizeCash')
AddEventHandler('police:client:SeizeCash', function()
    local player, distance = GetClosestPlayer()
    if player ~= -1 and distance < 2.5 then
        local playerId = GetPlayerServerId(player)
        TriggerServerEvent("police:server:SeizeCash", playerId)
    else
        CTRPFW.Functions.Notify("No one nearby!", "error")
    end
end)

RegisterNetEvent('police:client:SeizeDriverLicense')
AddEventHandler('police:client:SeizeDriverLicense', function()
    local player, distance = GetClosestPlayer()
    if player ~= -1 and distance < 2.5 then
        local playerId = GetPlayerServerId(player)
        TriggerServerEvent("police:server:SeizeDriverLicense", playerId)
    else
        CTRPFW.Functions.Notify("No one nearby!", "error")
    end
end)


RegisterNetEvent('police:client:RobPlayer')
AddEventHandler('police:client:RobPlayer', function()
    local player, distance = GetClosestPlayer()
    if player ~= -1 and distance < 2.5 then
        local playerPed = GetPlayerPed(player)
        local playerId = GetPlayerServerId(player)
        if IsEntityPlayingAnim(playerPed, "mp_arresting", "idle", 3)  or IsTargetDead(playerId) then
            CTRPFW.Functions.Progressbar("robbing_player", "Robbing person..", math.random(5000, 7000), false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "random@shop_robbery",
                anim = "robbery_action_b",
                flags = 16,
            }, {}, {}, function() -- Done
                local plyCoords = GetEntityCoords(playerPed)
                local pos = GetEntityCoords(PlayerPedId())
                local dist = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, plyCoords.x, plyCoords.y, plyCoords.z, true)
                if dist < 2.5 then
                    StopAnimTask(PlayerPedId(), "random@shop_robbery", "robbery_action_b", 1.0)
                    TriggerServerEvent("inventory:server:OpenInventory", "otherplayer", playerId)
                    TriggerEvent("inventory:server:RobPlayer", playerId)
                else
                    CTRPFW.Functions.Notify("No one nearby!", "error")
                end
            end, function() -- Cancel
                StopAnimTask(PlayerPedId(), "random@shop_robbery", "robbery_action_b", 1.0)
                CTRPFW.Functions.Notify("Canceled..", "error")
            end)
        end
    else
        CTRPFW.Functions.Notify("No one nearby!", "error")
    end
end)

RegisterNetEvent('police:client:JailCommand')
AddEventHandler('police:client:JailCommand', function(playerId, time)
    TriggerServerEvent("police:server:JailPlayer", playerId, tonumber(time))
end)

RegisterNetEvent('police:client:BillCommand')
AddEventHandler('police:client:BillCommand', function(playerId, price)
    TriggerServerEvent("police:server:BillPlayer", playerId, tonumber(price))
end)

--[[RegisterNetEvent('police:client:BillCommand')
AddEventHandler('police:client:BillCommand', function(playerId, price)
    local player, distance = GetClosestPlayer()
    if player ~= -1 and distance < 2.5 then
        local playerId = GetPlayerServerId(player)
        TriggerServerEvent("police:server:BillPlayer", playerId, tonumber(price))
    else
        CTRPFW.Functions.Notify("No one nearby!", "error")
    end
end)]]

RegisterNetEvent('police:client:JailPlayer')
AddEventHandler('police:client:JailPlayer', function()
    local player, distance = GetClosestPlayer()
    if player ~= -1 and distance < 2.5 then
        local playerId = GetPlayerServerId(player)
        DisplayOnscreenKeyboard(1, "", "", "", "", "", "", 20)
        while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
            Citizen.Wait(7)
        end
        local time = GetOnscreenKeyboardResult()
        if tonumber(time) > 0 then
            TriggerServerEvent("police:server:JailPlayer", playerId, tonumber(time))
        else
            CTRPFW.Functions.Notify("Time must be higher than 0..", "error")
        end
    else
        CTRPFW.Functions.Notify("No one nearby!", "error")
    end
end)

RegisterNetEvent('police:client:BillPlayer')
AddEventHandler('police:client:BillPlayer', function()
    local player, distance = GetClosestPlayer()
    if player ~= -1 and distance < 2.5 then
        local playerId = GetPlayerServerId(player)
        DisplayOnscreenKeyboard(1, "", "", "", "", "", "", 20)
        while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
            Citizen.Wait(7)
        end
        local price = GetOnscreenKeyboardResult()
        if tonumber(price) > 0 then
            TriggerServerEvent("police:server:BillPlayer", playerId, tonumber(price))
        else
            CTRPFW.Functions.Notify("Amount must be higher than 0..", "error")
        end
    else
        CTRPFW.Functions.Notify("No one nearby!", "error")
    end
end)

RegisterNetEvent('police:client:PutPlayerInVehicle')
AddEventHandler('police:client:PutPlayerInVehicle', function()
    local player, distance = GetClosestPlayer()
    if player ~= -1 and distance < 2.5 then
        local playerId = GetPlayerServerId(player)
        if not isHandcuffed and not isEscorted then
            TriggerServerEvent("police:server:PutPlayerInVehicle", playerId)
        end
    else
        CTRPFW.Functions.Notify("No one nearby!", "error")
    end
end)

RegisterNetEvent('police:client:SetPlayerOutVehicle')
AddEventHandler('police:client:SetPlayerOutVehicle', function()
    local player, distance = GetClosestPlayer()
    if player ~= -1 and distance < 2.5 then
        local playerId = GetPlayerServerId(player)
        if not isHandcuffed and not isEscorted then
            TriggerServerEvent("police:server:SetPlayerOutVehicle", playerId)
        end
    else
        CTRPFW.Functions.Notify("No one nearby!", "error")
    end
end)

RegisterNetEvent('police:client:EscortPlayer')
AddEventHandler('police:client:EscortPlayer', function()
    local player, distance = GetClosestPlayer()
    if player ~= -1 and distance < 2.5 then
        local playerId = GetPlayerServerId(player)
        if not isHandcuffed and not isEscorted then
            TriggerServerEvent("police:server:EscortPlayer", playerId)
        end
    else
        CTRPFW.Functions.Notify("No one nearby!", "error")
    end
end)

function IsHandcuffed()
    return isHandcuffed
end

RegisterNetEvent('police:client:KidnapPlayer')
AddEventHandler('police:client:KidnapPlayer', function()
    local player, distance = GetClosestPlayer()
    if player ~= -1 and distance < 2.5 then
        local playerId = GetPlayerServerId(player)
        if not IsPedInAnyVehicle(GetPlayerPed(player)) then
            if not isHandcuffed and not isEscorted then
                TriggerServerEvent("police:server:KidnapPlayer", playerId)
            end
        end
    else
        CTRPFW.Functions.Notify("No one nearby!", "error")
    end
end)

RegisterNetEvent('police:client:CuffPlayerSoft')
AddEventHandler('police:client:CuffPlayerSoft', function()
    if not IsPedRagdoll(PlayerPedId()) then
        local player, distance = GetClosestPlayer()
        if player ~= -1 and distance < 1.5 then
            local playerId = GetPlayerServerId(player)
            if not IsPedInAnyVehicle(GetPlayerPed(player)) and not IsPedInAnyVehicle(GetPlayerPed(PlayerPedId())) then
                TriggerServerEvent("police:server:CuffPlayer", playerId, true)
                HandCuffAnimation()
            else
                CTRPFW.Functions.Notify("You cant cuff someone in a vehicle", "error")
            end
        else
            CTRPFW.Functions.Notify("No one nearby!", "error")
        end
    else
        Citizen.Wait(2000)
    end
end)

RegisterNetEvent('police:client:CuffPlayerSofts')
AddEventHandler('police:client:CuffPlayerSofts', function()
    if not IsPedRagdoll(PlayerPedId()) then
        local player, distance = GetClosestPlayer()
        if player ~= -1 and distance < 1.5 then
            local playerId = GetPlayerServerId(player)
            if not IsPedInAnyVehicle(GetPlayerPed(player)) and not IsPedInAnyVehicle(GetPlayerPed(PlayerPedId())) then
                
                if not isCuffed then
                    isCuffed = true
                    TriggerServerEvent("police:server:CuffPlayer", playerId, true)
                    HandCuffAnimation()
                    TriggerServerEvent("CTRPFW:Server:RemoveItem", "handcuffs", 1)
                    TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items["handcuffs"], "remove")
                elseif isCuffed then
                    CTRPFW.Functions.Notify("Person is already cuffed!", "error")
                end
            else
                CTRPFW.Functions.Notify("You cant cuff someone in a vehicle", "error")
            end
        else
            CTRPFW.Functions.Notify("No one nearby!", "error")
        end
    else
        Citizen.Wait(2000)
    end
end)

RegisterNetEvent('police:client:CuffPlayer')
AddEventHandler('police:client:CuffPlayer', function()
    if not IsPedRagdoll(PlayerPedId()) then
        local player, distance = GetClosestPlayer()
        if player ~= -1 and distance < 1.5 then
            CTRPFW.Functions.TriggerCallback('CTRPFW:HasItem', function(result)
                if result then 
                    local playerId = GetPlayerServerId(player)
                    if not IsPedInAnyVehicle(GetPlayerPed(player)) and not IsPedInAnyVehicle(GetPlayerPed(PlayerPedId())) then
                        TriggerServerEvent("police:server:CuffPlayer", playerId, false)
                        HandCuffAnimation()
                    else
                        CTRPFW.Functions.Notify("You can\'t cuff someone in a vehicle", "error")
                    end
                else
                    CTRPFW.Functions.Notify("You don\'t have handcuffs on you", "error")
                end
            end, "handcuffs")
        else
            CTRPFW.Functions.Notify("No one nearby!", "error")
        end
    else
        Citizen.Wait(2000)
    end
end)

RegisterNetEvent('police:client:unCuffPlayer')
AddEventHandler('police:client:unCuffPlayer', function(isSoftcuff)
    if not IsPedRagdoll(PlayerPedId()) then
        local player, distance = GetClosestPlayer()
        if player ~= -1 and distance < 1.5 then
            local playerId = GetPlayerServerId(player)
            if not IsPedInAnyVehicle(GetPlayerPed(player)) and not IsPedInAnyVehicle(GetPlayerPed(PlayerPedId())) then
                HandunCuffAnimation()
                Citizen.Wait(100)
                TriggerServerEvent("police:server:unCuffPlayer", playerId, false)
                isCuffed = false
                
            else
                CTRPFW.Functions.Notify("You can\'t uncuff someone in a vehicle", "error")
            end     
        else
            CTRPFW.Functions.Notify("No one nearby!", "error")
        end
    else
        Citizen.Wait(2000)
    end
end)

RegisterNetEvent('police:client:uncCuffPlayer')
AddEventHandler('police:client:uncCuffPlayer', function(isSoftcuff)
    if not IsPedRagdoll(PlayerPedId()) then
        local player, distance = GetClosestPlayer()
        if player ~= -1 and distance < 1.5 then
            local playerId = GetPlayerServerId(player)
            if not IsPedInAnyVehicle(GetPlayerPed(player)) and not IsPedInAnyVehicle(GetPlayerPed(PlayerPedId())) then
                HandunCuffAnimation()
                Citizen.Wait(100)
                TriggerServerEvent("police:server:unnCuffPlayer", playerId, false)
                isCuffed = false
                
            else
                CTRPFW.Functions.Notify("You can\'t uncuff someone in a vehicle", "error")
            end     
        else
            CTRPFW.Functions.Notify("No one nearby!", "error")
        end
    else
        Citizen.Wait(2000)
    end
end)

--[[RegisterNetEvent('police:client:unnCuffPlayer')
AddEventHandler('police:client:unnCuffPlayer', function()
    if not IsPedRagdoll(PlayerPedId()) then
        local player, distance = GetClosestPlayer()
        if player ~= -1 and distance < 1.5 then
            CTRPFW.Functions.TriggerCallback('CTRPFW:HasItem', function(result)
                if result then 
                    
                    if not IsPedInAnyVehicle(GetPlayerPed(player)) and not IsPedInAnyVehicle(GetPlayerPed(PlayerPedId())) then
                        local Skillbar = exports['ctrp-skillbar']:GetSkillbarObject()
    
                        if NeededAttempts == 0 then
                            NeededAttempts = math.random(1, 2)
                        end
                        IsCuffing = true
                        SucceededAttempts = 0

                        if isAdvanced then
                            local maxwidth = 10
                            local maxduration = 1750
                            if FailedAttemps == 1 then
                                maxwidth = 10
                                maxduration = 1500
                            elseif FailedAttemps == 2 then
                                maxwidth = 9
                                maxduration = 1250
                            elseif FailedAttemps >= 3 then
                                maxwidth = 8
                                maxduration = 1000
                            end
                            widthAmount = math.random(5, maxwidth)
                            durationAmount = math.random(500, maxduration)
                        else        
                            local maxwidth = 10
                            local maxduration = 1500
                            if FailedAttemps == 1 then
                                maxwidth = 9
                                maxduration = 1250
                            elseif FailedAttemps == 2 then
                                maxwidth = 8
                                maxduration = 1000
                            elseif FailedAttemps >= 3 then
                                maxwidth = 7
                                maxduration = 800
                            end
                            widthAmount = math.random(5, maxwidth)
                            durationAmount = math.random(500, maxduration)
                        end

                        Skillbar.Start({
                            duration = math.random(5000, 10000),
                            pos = math.random(10, 30),
                            width = math.random(10, 20),
                        }, function()
                            if IsCuffing then
                                if SucceededAttempts + 1 >= NeededAttempts then
                                    local playerId = GetPlayerServerId(player)
                                    CTRPFW.Functions.Notify("You succeeded!")
                                    TriggerEvent("police:client:unCuffPlayer", playerId, false)
                                    isCuffed = false
                                    IsCuffing = false
                                    FailedAttemps = 0
                                    SucceededAttempts = 0
                                    NeededAttempts = 0
                                    TriggerServerEvent('ctrp-hud:Server:GainStress', math.random(2, 4))
                                else
                                    TaskPlayAnim(PlayerPedId(), dict, anim, 8.0, 8.0, -1, 16, -1, false, false, false)
                                    if isAdvanced then
                                        local maxwidth = 10
                                        local maxduration = 1750
                                        if FailedAttemps == 1 then
                                            maxwidth = 10
                                            maxduration = 1500
                                        elseif FailedAttemps == 2 then
                                            maxwidth = 9
                                            maxduration = 1250
                                        elseif FailedAttemps >= 3 then
                                            maxwidth = 8
                                            maxduration = 1000
                                        end
                                        widthAmount = math.random(5, maxwidth)
                                        durationAmount = math.random(400, maxduration)
                                    else        
                                        local maxwidth = 10
                                        local maxduration = 1300
                                        if FailedAttemps == 1 then
                                            maxwidth = 9
                                            maxduration = 1150
                                        elseif FailedAttemps == 2 then
                                            maxwidth = 8
                                            maxduration = 900
                                        elseif FailedAttemps >= 3 then
                                            maxwidth = 7
                                            maxduration = 750
                                        end
                                        widthAmount = math.random(5, maxwidth)
                                        durationAmount = math.random(300, maxduration)
                                    end

                                    SucceededAttempts = SucceededAttempts + 1
                                    Skillbar.Repeat({
                                        duration = durationAmount,
                                        pos = math.random(10, 50),
                                        width = widthAmount,
                                    })   
                                end
                            end
                        end, function()
                            if IsCuffing then
                                CTRPFW.Functions.Notify("You failed!", "error")
                                IsCuffing = false
                                FailedAttemps = FailedAttemps + 1
                                local c = math.random(2)
                                local o = math.random(2)
                                if c == o then
                                    TriggerServerEvent('ctrp-hud:Server:GainStress', math.random(1, 4))
                                end
                            end
                        end)               
                    else
                        CTRPFW.Functions.Notify("You can\'t uncuff someone in a vehicle", "error")
                    end
                else
                    CTRPFW.Functions.Notify("You don\'t have uncuff on you", "error")
                end
            end, "keyz")
        else
            CTRPFW.Functions.Notify("No one nearby!", "error")
        end
    else
        Citizen.Wait(2000)
    end
end)]]

RegisterNetEvent('police:client:unnCuffPlayer')
AddEventHandler('police:client:unnCuffPlayer', function()
    if not IsPedRagdoll(PlayerPedId()) then
        local player, distance = GetClosestPlayer()
        if player ~= -1 and distance < 1.5 then
            CTRPFW.Functions.TriggerCallback('CTRPFW:HasItem', function(result)
                if result then 
                    local playerId = GetPlayerServerId(player)
                    CTRPFW.Functions.Notify("You succeeded!")
                    TriggerEvent("police:client:uncCuffPlayer", playerId, false)
                    
                    isCuffed = false
                    IsCuffing = false
                else
                    CTRPFW.Functions.Notify("You don\'t have uncuff on you", "error")
                end
            end, "keyz")
        else
            CTRPFW.Functions.Notify("No one nearby!", "error")
        end
    else
        Citizen.Wait(2000)
    end
end)


RegisterNetEvent('police:client:GetEscorted')
AddEventHandler('police:client:GetEscorted', function(playerId)
    CTRPFW.Functions.GetPlayerData(function(PlayerData)
        if PlayerData.metadata["isdead"] or isHandcuffed or PlayerData.metadata["inlaststand"] then
            if not isEscorted then
                isEscorted = true
                draggerId = playerId
                local dragger = GetPlayerPed(GetPlayerFromServerId(playerId))
                local heading = GetEntityHeading(dragger)
                SetEntityCoords(PlayerPedId(), GetOffsetFromEntityInWorldCoords(dragger, 0.0, 0.45, 0.0))
                AttachEntityToEntity(PlayerPedId(), dragger, 11816, 0.45, 0.45, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
            else
                isEscorted = false
                DetachEntity(PlayerPedId(), true, false)
            end
            TriggerEvent('hospital:client:isEscorted', isEscorted)
        end
    end)
end)

RegisterNetEvent('police:client:DeEscort')
AddEventHandler('police:client:DeEscort', function()
    isEscorted = false
    TriggerEvent('hospital:client:isEscorted', isEscorted)
    DetachEntity(PlayerPedId(), true, false)
end)

RegisterNetEvent('police:client:GetKidnappedTarget')
AddEventHandler('police:client:GetKidnappedTarget', function(playerId)
    CTRPFW.Functions.GetPlayerData(function(PlayerData)
        if PlayerData.metadata["isdead"] or PlayerData.metadata["inlaststand"] or isHandcuffed then
            if not isEscorted then
                isEscorted = true
                draggerId = playerId
                local dragger = GetPlayerPed(GetPlayerFromServerId(playerId))
                local heading = GetEntityHeading(dragger)
                RequestAnimDict("nm")

                while not HasAnimDictLoaded("nm") do
                    Citizen.Wait(10)
                end
                -- AttachEntityToEntity(PlayerPedId(), dragger, 11816, 0.45, 0.45, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
                AttachEntityToEntity(PlayerPedId(), dragger, 0, 0.27, 0.15, 0.63, 0.5, 0.5, 0.0, false, false, false, false, 2, false)
                TaskPlayAnim(PlayerPedId(), "nm", "firemans_carry", 8.0, -8.0, 100000, 33, 0, false, false, false)
            else
                isEscorted = false
                DetachEntity(PlayerPedId(), true, false)
                ClearPedTasksImmediately(PlayerPedId())
            end
            TriggerEvent('hospital:client:isEscorted', isEscorted)
        end
    end)
end)

local isEscorting = false

RegisterNetEvent('police:client:GetKidnappedDragger')
AddEventHandler('police:client:GetKidnappedDragger', function(playerId)
    CTRPFW.Functions.GetPlayerData(function(PlayerData)
        if not isEscorting then
            draggerId = playerId
            local dragger = PlayerPedId()
            RequestAnimDict("missfinale_c2mcs_1")

            while not HasAnimDictLoaded("missfinale_c2mcs_1") do
                Citizen.Wait(10)
            end
            TaskPlayAnim(dragger, "missfinale_c2mcs_1", "fin_c2_mcs_1_camman", 8.0, -8.0, 100000, 49, 0, false, false, false)
            isEscorting = true
        else
            local dragger = PlayerPedId()
            ClearPedSecondaryTask(dragger)
            ClearPedTasksImmediately(dragger)
            isEscorting = false
        end
        TriggerEvent('hospital:client:SetEscortingState', isEscorting)
        TriggerEvent('ctrp-kidnapping:client:SetKidnapping', isEscorting)
    end)
end)

RegisterNetEvent('police:client:GetCuffed')
AddEventHandler('police:client:GetCuffed', function(playerId, isSoftcuff)
    if not isHandcuffed then
        isHandcuffed = true
        TriggerServerEvent("police:server:SetHandcuffStatus", true)
        ClearPedTasksImmediately(PlayerPedId())
        if not isSoftcuff then
            cuffType = 16
            GetCuffedAnimation(playerId)
            CTRPFW.Functions.Notify("You are cuffed!")
        else
            cuffType = 49
            GetCuffedAnimation(playerId)
            CTRPFW.Functions.Notify("You are cuffed, but you can walk")
        end
    else
        
    end
end)

RegisterNetEvent('police:client:unGetCuffed')
AddEventHandler('police:client:unGetCuffed', function(playerId, isSoftcuff)
    if isHandcuffed or isSoftcuff then
        isHandcuffed = false
        isEscorted = false
        TriggerEvent('hospital:client:isEscorted', isEscorted)
        DetachEntity(PlayerPedId(), true, false)
        TriggerServerEvent("police:server:SetHandcuffStatus", false)
        ClearPedTasksImmediately(PlayerPedId())
        CTRPFW.Functions.Notify("You are uncuffed!")
    end
end)

Citizen.CreateThread(function()
    while true do
        TriggerEvent("tokovoip_script:ToggleRadioTalk", isHandcuffed)
        Citizen.Wait(2000)
    end
end)

function IsTargetDead(playerId)
    local retval = false
    CTRPFW.Functions.TriggerCallback('police:server:isPlayerDead', function(result)
        retval = result
    end, playerId)
    Citizen.Wait(100)
    return retval
end

function HandCuffAnimation()
    loadAnimDict("mp_arrest_paired")
	Citizen.Wait(100)
    TaskPlayAnim(PlayerPedId(), "mp_arrest_paired", "cop_p2_back_right", 3.0, 3.0, -1, 48, 0, 0, 0, 0)
	Citizen.Wait(3500)
    TaskPlayAnim(PlayerPedId(), "mp_arrest_paired", "exit", 3.0, 3.0, -1, 48, 0, 0, 0, 0)
end

function GetCuffedAnimation(playerId)
    local cuffer = GetPlayerPed(GetPlayerFromServerId(playerId))
    local heading = GetEntityHeading(cuffer)
    loadAnimDict("mp_arrest_paired")
    SetEntityCoords(PlayerPedId(), GetOffsetFromEntityInWorldCoords(cuffer, 0.0, 0.45, 0.0))
	Citizen.Wait(100)
	SetEntityHeading(PlayerPedId(), heading)
	TaskPlayAnim(PlayerPedId(), "mp_arrest_paired", "crook_p2_back_right", 3.0, 3.0, -1, 32, 0, 0, 0, 0)
	Citizen.Wait(2500)
end

function HandunCuffAnimation()
    loadAnimDict("mp_arresting")
	Citizen.Wait(100)
    TaskPlayAnim(PlayerPedId(), "mp_arresting", "a_uncuff", 3.0, 3.0, -1, 48, 0, 0, 0, 0)
	Citizen.Wait(3500)
    TaskPlayAnim(PlayerPedId(), "mp_arresting", "exit", 3.0, 3.0, -1, 48, 0, 0, 0, 0)
end

-- Citizen.CreateThread(function()
    -- local ped = PlayerPedId()
    -- ClearPedTasks(ped)
    -- local lib = "get_up@injured@prone_to_common"
    -- local anim = "shakehead_add"
    -- local timeout = 4933
    -- local myid = GetPlayerServerId(PlayerId())

    -- if myid == 1 then
        -- loadAnimDict(lib)
        -- TaskPlayAnim(ped, lib, anim, 3.0, 3.0, -1, 3, 0, 0, 0, 0)
    -- end
-- end)