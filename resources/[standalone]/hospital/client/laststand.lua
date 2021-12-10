-- CTRPFW = nil

-- Citizen.CreateThread(function()
--     while true do
--         Citizen.Wait(10)
--         if CTRPFW == nil then
--             TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)
--             Citizen.Wait(200)
--         end
--     end
-- end)

-- Config

Laststand = Laststand or {}
Laststand.ReviveInterval = 360
Laststand.MinimumRevive = 300

-- Code

InLaststand = false
CanBePickuped = false
LaststandTime = 0

lastStandDict = "combat@damage@writhe"
lastStandAnim = "writhe_loop"

isEscorted = false
isEscorting = false

RegisterNetEvent('hospital:client:SetEscortingState')
AddEventHandler('hospital:client:SetEscortingState', function(bool)
    isEscorting = bool
end)

RegisterNetEvent('hospital:client:isEscorted')
AddEventHandler('hospital:client:isEscorted', function(bool)
    isEscorted = bool
end)

function SetLaststand(bool, spawn)
    local ped = PlayerPedId()
    if bool then
        Wait(1000)
        local pos = GetEntityCoords(ped)
        local heading = GetEntityHeading(ped)

        while GetEntitySpeed(ped) > 0.5 or IsPedRagdoll(ped) do
            Citizen.Wait(10)
        end

        TriggerServerEvent("InteractSound_SV:PlayOnSource", "demo", 0.1)

        LaststandTime = Laststand.ReviveInterval

        NetworkResurrectLocalPlayer(pos.x, pos.y, pos.z + 0.5, heading, true, false)
        SetEntityHealth(ped, 150)

        if IsPedInAnyVehicle(PlayerPedId(), false) then
            LoadAnimation("veh@low@front_ps@idle_duck")
            TaskPlayAnim(ped, "veh@low@front_ps@idle_duck", "sit", 1.0, 8.0, -1, 1, -1, false, false, false)
        else
            LoadAnimation(lastStandDict)
            TaskPlayAnim(ped, lastStandDict, lastStandAnim, 1.0, 8.0, -1, 1, -1, false, false, false)
        end

        InLaststand = true

        Citizen.CreateThread(function()
            while InLaststand do
                if LaststandTime - 1 > Laststand.MinimumRevive then
                    LaststandTime = LaststandTime - 1
                    Config.DeathTime = LaststandTime
                elseif LaststandTime - 1 <= Laststand.MinimumRevive and LaststandTime - 1 ~= 0 then
                    LaststandTime = LaststandTime - 1
                    CanBePickuped = true
                    Config.DeathTime = LaststandTime
                elseif LaststandTime - 1 <= 0 then
                    CTRPFW.Functions.Notify("You are bled..", "error")
                    SetLaststand(false)
                    local killer_2, killerWeapon = NetworkGetEntityKillerOfPlayer(player)
                    local killer = GetPedSourceOfDeath(playerPed)
                    
                    if killer_2 ~= 0 and killer_2 ~= -1 then
                        killer = killer_2
                    end
    
                    local killerId = NetworkGetPlayerIndexFromPed(killer)
                    local killerName = killerId ~= -1 and GetPlayerName(killerId) .. " " .. "("..GetPlayerServerId(killerId)..")" or "Himself or NPC"
                    local weaponLabel = CTRPFW.Shared.Weapons[killerWeapon] ~= nil and CTRPFW.Shared.Weapons[killerWeapon]["label"] or "Unknown"
                    local weaponName = CTRPFW.Shared.Weapons[killerWeapon] ~= nil and CTRPFW.Shared.Weapons[killerWeapon]["name"] or "Unknown_Weapon"
                    TriggerServerEvent("ctrp-log:server:CreateLog", "death", GetPlayerName(player) .. " ("..GetPlayerServerId(player)..") is dead", "red", "**".. killerName .. "** has ".. GetPlayerName(player) .." murdered with **".. weaponLabel .. "** (" .. weaponName .. ")")
                    deathTime = 0
                    OnDeath()
                    DeathTimer()
                end
                Citizen.Wait(1000)
            end
        end)
    else
        TaskPlayAnim(ped, lastStandDict, "exit", 1.0, 8.0, -1, 1, -1, false, false, false)
        InLaststand = false
        CanBePickuped = false
        LaststandTime = 0
    end
    TriggerServerEvent("hospital:server:SetLaststandStatus", bool)
end

function LoadAnimation(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Citizen.Wait(100)
    end
end

RegisterNetEvent('hospital:client:UseFirstAid')
AddEventHandler('hospital:client:UseFirstAid', function()
    if not isEscorting then
        local player, distance = GetClosestPlayer()
        if player ~= -1 and distance < 1.5 then
            local playerId = GetPlayerServerId(player)
            TriggerServerEvent('hospital:server:UseFirstAid', playerId)
        end
    else
        CTRPFW.Functions.Notify('Action not possible!', 'error')
    end
end)

RegisterNetEvent('hospital:client:CanHelp')
AddEventHandler('hospital:client:CanHelp', function(helperId)
    if InLaststand then
        if LaststandTime <= 300 then
            TriggerServerEvent('hospital:server:CanHelp', helperId, true)
        else
            TriggerServerEvent('hospital:server:CanHelp', helperId, false)
        end
    else
        TriggerServerEvent('hospital:server:CanHelp', helperId, false)
    end
end)

RegisterNetEvent('hospital:client:HelpPerson')
AddEventHandler('hospital:client:HelpPerson', function(targetId)
    local ped = PlayerPedId()
    isHealingPerson = true
    CTRPFW.Functions.Progressbar("hospital_revive", "Help the person up..", math.random(30000, 60000), false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = healAnimDict,
        anim = healAnim,
        flags = 1,
    }, {}, {}, function() -- Done
        isHealingPerson = false
        ClearPedTasks(ped)
        CTRPFW.Functions.Notify("You helped the person up.")
        TriggerServerEvent("hospital:server:RevivePlayer", targetId)
    end, function() -- Cancel
        isHealingPerson = false
        ClearPedTasks(ped)
        CTRPFW.Functions.Notify("Cancelled!", "error")
    end)
end)