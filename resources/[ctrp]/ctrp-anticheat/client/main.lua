-- Load CTRPFW and get permissions --
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

local group = Config.Group

-- Check if is decorating --

local IsDecorating = false

RegisterNetEvent('ctrp-anticheat:client:ToggleDecorate')
AddEventHandler('ctrp-anticheat:client:ToggleDecorate', function(bool)
  IsDecorating = bool
end)

-- Few frequently used locals --

local flags = 0 
-- local player = PlayerId()
-- local ped = GetPlayerPed(-1)

local isLoggedIn = false

RegisterNetEvent('CTRPFW:Client:OnPlayerLoaded')
AddEventHandler('CTRPFW:Client:OnPlayerLoaded', function()
    CTRPFW.Functions.TriggerCallback('ctrp-anticheat:server:GetPermissions', function(UserGroup)
        group = UserGroup
    end)
    isLoggedIn = true
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload')
AddEventHandler('QBCore:Client:OnPlayerUnload', function()
    isLoggedIn = false
    IsDecorating = false
    flags = 0
end)

-- Superjump --

Citizen.CreateThread(function()
	while true do
        Citizen.Wait(500)
 
        local ped = PlayerPedId()
        local player = PlayerId()

        if group == Config.Group and isLoggedIn then 
            if IsPedJumping(ped) then
                local firstCoord = GetEntityCoords(ped)
  
                while IsPedJumping(ped) do
                    Citizen.Wait(0)
                end
        
                local secondCoord = GetEntityCoords(ped)
                local lengthBetweenCoords = #(firstCoord - secondCoord)

                if (lengthBetweenCoords > Config.SuperJumpLength) then
                    flags = flags + 1      
                    TriggerServerEvent("ctrp-log:server:CreateLog", "anticheat", "Cheat detected!", "orange", "** @everyone " ..GetPlayerName(player).. "** has been flagged by the anticheat! **(Flag "..flags.." /"..Config.FlagsForBan.." | Superjump)**")         
                end
            end
        end
    end
end)

-- Speedhack --

Citizen.CreateThread(function()
	while true do
        Citizen.Wait(500)

        local ped = PlayerPedId()
        local player = PlayerId()
        local speed = GetEntitySpeed(ped) 
        local inveh = IsPedInAnyVehicle(ped, false)
        local ragdoll = IsPedRagdoll(ped)
        local jumping = IsPedJumping(ped)
        local falling = IsPedFalling(ped)
 
        if group == Config.Group and isLoggedIn then 
            if not inveh then
                if not ragdoll then 
                    if not falling then 
                        if not jumping then 
                            if speed > Config.MaxSpeed then 
                                flags = flags + 1 
                                TriggerServerEvent("ctrp-log:server:CreateLog", "anticheat", "Cheat detected!", "orange", "** @everyone " ..GetPlayerName(player).. "** has been flagged by the anticheat! **(Flag "..flags.." /"..Config.FlagsForBan.." | Speedhack)**")   
                            end
                        end
                    end
                end
            end
        end
    end
end)

-- Invisibility --

Citizen.CreateThread(function()
    while true do      
        Citizen.Wait(10000)

        local ped = PlayerPedId()
        local player = PlayerId()

        if group == Config.Group and isLoggedIn then 
            if not IsDecorating then 
                if not IsEntityVisible(ped) then
                    SetEntityVisible(ped, 1, 0)
                    TriggerEvent('CTRPFW:Notify', "CTRP-ANTICHEAT: You were invisble but now visible again!")
                    TriggerServerEvent("ctrp-log:server:CreateLog", "anticheat", "Made player visible", "green", "** @everyone " ..GetPlayerName(player).. "** was invisible and is visible again by the CTRP-Anticheat")            
                end 
            end
        end
    end
end)

-- Nightvision --

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(2000)

        local ped = PlayerPedId()
        local player = PlayerId()

        if group == Config.Group and isLoggedIn then 
            if GetUsingnightvision(true) then 
                if not IsPedInAnyHeli(ped) then
                    flags = flags + 1 
                    TriggerServerEvent("ctrp-log:server:CreateLog", "anticheat", "Cheat detected!", "orange", "** @everyone " ..GetPlayerName(player).. "** has been flagged by the anticheat! **(Flag "..flags.." /"..Config.FlagsForBan.." | Nightvision)**")
                end
            end
        end
    end
end)

-- Thermalvision --

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(2000)

        local ped = PlayerPedId()

        if group == Config.Group and isLoggedIn then 
            if GetUsingseethrough(true) then 
                if not IsPedInAnyHeli(ped) then
                    flags = flags + 1
                    TriggerServerEvent("ctrp-log:server:CreateLog", "anticheat", "Cheat detected!", "orange", "** @everyone " ..GetPlayerName(player).. "** has been flagged by the anticheat! **(Flag "..flags.." /"..Config.FlagsForBan.." | Thermalvision)**") 
                end
            end
        end
    end
end)

-- Spawned car --

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        local ped = PlayerPedId()
        local player = PlayerId()
        local veh = GetVehiclePedIsIn(ped)
        local DriverSeat = GetPedInVehicleSeat(veh, -1)
        local plate = GetVehicleNumberPlateText(veh)

        if isLoggedIn then
            if group == Config.Group then
                if IsPedInAnyVehicle(ped, true) then
                    for _, BlockedPlate in pairs(Config.BlacklistedPlates) do
                        if plate == BlockedPlate then
                            if DriverSeat == ped then 
                                DeleteVehicle(veh)               
                                TriggerServerEvent("ctrp-anticheat:server:banPlayer", "Cheating")
                                TriggerServerEvent("ctrp-log:server:CreateLog", "anticheat", "Cheat detected!", "red", "** @everyone " ..GetPlayerName(player).. "** has been banned for cheating (Was in a spawned vehicle with the lincense plate **"..BlockedPlate.."**")         
                            end   
                        end
                    end
                end
            end
        end
    end
end)

-- Check if ped has weapon in inventory --

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5000)

        if isLoggedIn then

            local PlayerPed = PlayerPedId()
            local player = PlayerId()
            local CurrentWeapon = GetSelectedPedWeapon(PlayerPed)
            local WeaponInformation = CTRPFW.Shared.Weapons[CurrentWeapon]

            if WeaponInformation["name"] ~= "weapon_unarmed" then
                CTRPFW.Functions.TriggerCallback('ctrp-anticheat:server:HasWeaponInInventory', function(HasWeapon)
                    if not HasWeapon then
                        RemoveAllPedWeapons(PlayerPed, false)
                        TriggerServerEvent("ctrp-log:server:CreateLog", "anticheat", "Weapon deleted!", "orange", "** @everyone " ..GetPlayerName(player).. "** had a weapon on him that he didnt had in his inventory. CTRP Anticheat deleted the weapon.")  
                    end
                end, WeaponInformation)
            end

        end
    end
end)

-- Max flags reached = ban, log, explosion & break --

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)

        local player = PlayerId()
        
        if flags >= Config.FlagsForBan then
            -- TriggerServerEvent("ctrp-anticheat:server:banPlayer", "Cheating")
            -- AddExplosion(coords, EXPLOSION_GRENADE, 1000.0, true, false, false, true)
            TriggerServerEvent("ctrp-log:server:CreateLog", "anticheat", "Player banned! (Test)", "red", "** @everyone " ..GetPlayerName(player).. "** has been flagged to much and has been banned!")  
            flags = 0 
        end
    end
end)

RegisterNetEvent('ctrp-anticheat:client:NonRegisteredEventCalled')
AddEventHandler('ctrp-anticheat:client:NonRegisteredEventCalled', function(reason, CalledEvent)
    local player = PlayerId()
    -- local ped = GetPlayerPed(-1)

    TriggerServerEvent('ctrp-anticheat:server:banPlayer', reason)
    TriggerServerEvent("ctrp-log:server:CreateLog", "anticheat", "Player banned! (Test)", "red", "** @everyone " ..GetPlayerName(player).. "** has tried to trigger event **"..CalledEvent.." (LUA injector!)")  
end)