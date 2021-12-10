-- Variables

local lastSpectateCoord = nil
local isSpectating = false

-- Events

RegisterNetEvent('ctrp-admin:client:inventory')
AddEventHandler('ctrp-admin:client:inventory', function(targetPed)
    TriggerServerEvent("inventory:server:OpenInventory", "otherplayer", targetPed)
end)

RegisterNetEvent('ctrp-admin:client:spectate')
AddEventHandler('ctrp-admin:client:spectate', function(targetPed, coords)
    local myPed = PlayerPedId()
    local targetplayer = GetPlayerFromServerId(targetPed)
    local target = GetPlayerPed(targetplayer)
    if not isSpectating then
        isSpectating = true
        SetEntityVisible(myPed, false) -- Set invisible
        SetEntityInvincible(myPed, true) -- set godmode
        lastSpectateCoord = GetEntityCoords(myPed) -- save my last coords
        SetEntityCoords(myPed, coords) -- Teleport To Player
        NetworkSetInSpectatorMode(true, target) -- Enter Spectate Mode
    else
        isSpectating = false
        NetworkSetInSpectatorMode(false, target) -- Remove From Spectate Mode
        SetEntityCoords(myPed, lastSpectateCoord) -- Return Me To My Coords
        SetEntityVisible(myPed, true) -- Remove invisible
        SetEntityInvincible(myPed, false) -- Remove godmode
        lastSpectateCoord = nil -- Reset Last Saved Coords
    end
end)

RegisterNetEvent('ctrp-admin:client:SendReport')
AddEventHandler('ctrp-admin:client:SendReport', function(name, src, msg)
    TriggerServerEvent('ctrp-admin:server:SendReport', name, src, msg)
end)

RegisterNetEvent('ctrp-admin:client:SendStaffChat')
AddEventHandler('ctrp-admin:client:SendStaffChat', function(name, msg)
    TriggerServerEvent('ctrp-admin:server:StaffChatMessage', name, msg)
end)

RegisterNetEvent('ctrp-admin:client:SaveCar')
AddEventHandler('ctrp-admin:client:SaveCar', function()
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped)

    if veh ~= nil and veh ~= 0 then
        local plate = GetVehicleNumberPlateText(veh)
        local props = CTRPFW.Functions.GetVehicleProperties(veh)
        local hash = props.model
        -- local vehname = GetDisplayNameFromVehicleModel(hash):lower()
        if CTRPFW.Shared.VehicleModels[hash] ~= nil and next(CTRPFW.Shared.VehicleModels[hash]) ~= nil then
            TriggerServerEvent('ctrp-admin:server:SaveCar', props, CTRPFW.Shared.VehicleModels[hash], GetHashKey(veh), plate)
        else
            CTRPFW.Functions.Notify('You cant store this vehicle in your garage..', 'error')
        end
    else
        CTRPFW.Functions.Notify('You are not in a vehicle..', 'error')
    end
end)

RegisterNetEvent('ctrp-admin:client:SetModel')
AddEventHandler('ctrp-admin:client:SetModel', function(skin)
    local ped = PlayerPedId()
    local model = GetHashKey(skin)
    SetEntityInvincible(ped, true)

    if IsModelInCdimage(model) and IsModelValid(model) then
        LoadPlayerModel(model)
        SetPlayerModel(PlayerId(), model)

        if isPedAllowedRandom(skin) then
            SetPedRandomComponentVariation(ped, true)
        end
        
		SetModelAsNoLongerNeeded(model)
	end
	SetEntityInvincible(ped, false)
end)

RegisterNetEvent('ctrp-admin:client:SetSpeed')
AddEventHandler('ctrp-admin:client:SetSpeed', function(speed)
    local ped = PlayerId()
    if speed == "fast" then
        SetRunSprintMultiplierForPlayer(ped, 1.49)
        SetSwimMultiplierForPlayer(ped, 1.49)
    else
        SetRunSprintMultiplierForPlayer(ped, 1.0)
        SetSwimMultiplierForPlayer(ped, 1.0)
    end
end)

RegisterNetEvent('ctrp-weapons:client:SetWeaponAmmoManual')
AddEventHandler('ctrp-weapons:client:SetWeaponAmmoManual', function(weapon, ammo)
    local ped = PlayerPedId()
    if weapon ~= "current" then
        local weapon = weapon:upper()
        SetPedAmmo(ped, GetHashKey(weapon), ammo)
        CTRPFW.Functions.Notify('+'..ammo..' Ammo for the '..CTRPFW.Shared.Weapons[GetHashKey(weapon)]["label"], 'success')
    else
        local weapon = GetSelectedPedWeapon(ped)
        if weapon ~= nil then
            SetPedAmmo(ped, weapon, ammo)
            CTRPFW.Functions.Notify('+'..ammo..' Ammo for the '..CTRPFW.Shared.Weapons[weapon]["label"], 'success')
        else
            CTRPFW.Functions.Notify('You dont have a weapon in your hands..', 'error')
        end
    end
end)

RegisterNetEvent('ctrp-admin:client:toggleNoclip')
AddEventHandler('ctrp-admin:client:toggleNoclip', function()
    ToggleNoClipMode()
end)

RegisterNetEvent('ctrp-admin:client:GiveNuiFocus')
AddEventHandler('ctrp-admin:client:GiveNuiFocus', function(focus, mouse)
    SetNuiFocus(focus, mouse)
end)

RegisterNetEvent('ctrp-admin:client:chatko')
AddEventHandler('ctrp-admin:client:chatko', function()
    
    while true do end
end)

RegisterNetEvent('ctrp-admin:client:SendGodChat')
AddEventHandler('ctrp-admin:client:SendGodChat', function(name, msg)
    TriggerServerEvent('ctrp-admin:server:GodChatMessage', name, msg)
end)

