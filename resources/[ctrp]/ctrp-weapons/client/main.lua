Keys = {
	['ESC'] = 322, ['F1'] = 288, ['F2'] = 289, ['F3'] = 170, ['F5'] = 166, ['F6'] = 167, ['F7'] = 168, ['F8'] = 169, ['F9'] = 56, ['F10'] = 57,
	['~'] = 243, ['1'] = 157, ['2'] = 158, ['3'] = 160, ['4'] = 164, ['5'] = 165, ['6'] = 159, ['7'] = 161, ['8'] = 162, ['9'] = 163, ['-'] = 84, ['='] = 83, ['BACKSPACE'] = 177,
	['TAB'] = 37, ['Q'] = 44, ['W'] = 32, ['E'] = 38, ['R'] = 45, ['T'] = 245, ['Y'] = 246, ['U'] = 303, ['P'] = 199, ['['] = 39, [']'] = 40, ['ENTER'] = 18,
	['CAPS'] = 137, ['A'] = 34, ['S'] = 8, ['D'] = 9, ['F'] = 23, ['G'] = 47, ['H'] = 74, ['K'] = 311, ['L'] = 182,
	['LEFTSHIFT'] = 21, ['Z'] = 20, ['X'] = 73, ['C'] = 26, ['V'] = 0, ['B'] = 29, ['N'] = 249, ['M'] = 244, [','] = 82, ['.'] = 81,
	['LEFTCTRL'] = 36, ['LEFTALT'] = 19, ['SPACE'] = 22, ['RIGHTCTRL'] = 70,
	['HOME'] = 213, ['PAGEUP'] = 10, ['PAGEDOWN'] = 11, ['DELETE'] = 178,
	['LEFT'] = 174, ['RIGHT'] = 175, ['TOP'] = 27, ['DOWN'] = 173,
}

CTRPFW = nil

local isLoggedIn = true
local CurrentWeaponData = {}
local PlayerData = {}
local CanShoot = true

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

Citizen.CreateThread(function() 
    while true do
        Citizen.Wait(10)
        if CTRPFW == nil then
            TriggerEvent("CTRPFW:GetObject", function(obj) CTRPFW = obj end)    
            Citizen.Wait(200)
        end
    end
end)


Citizen.CreateThread(function() 
    while true do
        if isLoggedIn then
            TriggerServerEvent("weapons:server:SaveWeaponAmmo")
        end
        Citizen.Wait(60000)
    end
end)

Citizen.CreateThread(function()
    Wait(1000)
    if CTRPFW.Functions.GetPlayerData() ~= nil then
        TriggerServerEvent("weapons:server:LoadWeaponAmmo")
        isLoggedIn = true
        PlayerData = CTRPFW.Functions.GetPlayerData()

        CTRPFW.Functions.TriggerCallback("weapons:server:GetConfig", function(RepairPoints)
            for k, data in pairs(RepairPoints) do
                Config.WeaponRepairPoints[k].IsRepairing = data.IsRepairing
                Config.WeaponRepairPoints[k].RepairingData = data.RepairingData
            end
        end)
    end
end)

local MultiplierAmount = 0

Citizen.CreateThread(function()
    while true do
        if isLoggedIn then
            if CurrentWeaponData ~= nil and next(CurrentWeaponData) ~= nil then
                if IsPedShooting(GetPlayerPed(-1)) or IsControlJustPressed(0, 24) then
                    if CanShoot then
                        local weapon = GetSelectedPedWeapon(GetPlayerPed(-1))
                        local ammo = GetAmmoInPedWeapon(GetPlayerPed(-1), weapon)
                        if CTRPFW.Shared.Weapons[weapon]["name"] == "weapon_snowball" then
                            TriggerServerEvent('CTRPFW:Server:RemoveItem', "snowball", 1)
                        elseif CTRPFW.Shared.Weapons[weapon]["name"] == "weapon_pipebomb" then
                            TriggerServerEvent('CTRPFW:Server:RemoveItem', "weapon_pipebomb", 1)
                        elseif CTRPFW.Shared.Weapons[weapon]["name"] == "weapon_molotov" then
                            TriggerServerEvent('CTRPFW:Server:RemoveItem', "weapon_molotov", 1)
                        elseif CTRPFW.Shared.Weapons[weapon]["name"] == "weapon_stickybomb" then
                            TriggerServerEvent('CTRPFW:Server:RemoveItem', "weapon_stickybomb", 1)
                        else
                            if ammo > 0 then
                                MultiplierAmount = MultiplierAmount + 1
                            end
                        end
                    else
                        TriggerEvent('inventory:client:CheckWeapon')
                        SetCurrentPedWeapon(GetPlayerPed(-1), GetHashKey("WEAPON_UNARMED"), true)
                        CTRPFW.Functions.Notify("This weapon is broken and cannot be used.", "error")
                        MultiplierAmount = 0
                    end
                end
            end
        end
        Citizen.Wait(0)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local weapon = GetSelectedPedWeapon(GetPlayerPed(-1))
        local ammo = GetAmmoInPedWeapon(GetPlayerPed(-1), weapon)
        if weapon ~= 911657153 and weapon ~= -1169823560 and weapon ~= 615608432 and weapon ~= 741814745 then
            if ammo == 1 then
                DisableControlAction(0, 24, true) -- Attack
                DisableControlAction(0, 257, true) -- Attack 2
                if IsPedInAnyVehicle(GetPlayerPed(-1), true) then
                    SetPlayerCanDoDriveBy(PlayerId(), false)
                end
            elseif ammo > 1 then 
                EnableControlAction(0, 24, true) -- Attack
                EnableControlAction(0, 257, true) -- Attack 2
                if IsPedInAnyVehicle(GetPlayerPed(-1), true) then
                    SetPlayerCanDoDriveBy(PlayerId(), false)
                end
            end
        end
    end
end)

local AmmoTypes = {
    'AMMO_PISTOL',
    'AMMO_SMG',
    'AMMO_RIFLE',
    'AMMO_MG',
    'AMMO_SHOTGUN',
    'AMMO_SNIPER',
    'AMMO_WATER',
}

Citizen.CreateThread(function()
    while true do
        if IsControlJustReleased(0, 24) or IsDisabledControlJustReleased(0, 24) then
            local weapon = GetSelectedPedWeapon(GetPlayerPed(-1))
            local ammo = GetAmmoInPedWeapon(GetPlayerPed(-1), weapon)
            for k,v in pairs(AmmoTypes) do
                if CTRPFW.Shared.Weapons[weapon]["ammotype"] == v then
                    if ammo > 0 then
                        TriggerServerEvent("weapons:server:UpdateWeaponAmmo", CurrentWeaponData, tonumber(ammo))
                    else
                        TriggerEvent('inventory:client:CheckWeapon')
                        TriggerServerEvent("weapons:server:UpdateWeaponAmmo", CurrentWeaponData, 0)
                    end

                    if MultiplierAmount > 0 then
                        TriggerServerEvent("weapons:server:UpdateWeaponQuality", CurrentWeaponData, MultiplierAmount)
                        MultiplierAmount = 0
                    end
                end
            end
        end
        Citizen.Wait(1)
    end
end)

RegisterNetEvent('weapon:client:AddAmmo')
AddEventHandler('weapon:client:AddAmmo', function(type, amount, itemData)
    local ped = GetPlayerPed(-1)
    local weapon = GetSelectedPedWeapon(GetPlayerPed(-1))
    if CurrentWeaponData ~= nil then
    
        if CTRPFW.Shared.Weapons[weapon]["name"] ~= "weapon_unarmed" and CTRPFW.Shared.Weapons[weapon]["ammotype"] == type:upper() then
            local total = (GetAmmoInPedWeapon(GetPlayerPed(-1), weapon))
            local addamount = GetMaxAmmoInClip(ped, weapon, 1)
            local maxammo = 200 
            
            if type:upper() == 'AMMO_PISTOL' then
                maxammo = 120
            elseif type:upper() == 'AMMO_SMG' then
                maxammo = 180
            elseif type:upper() == 'AMMO_SHOTGUN' then
                maxammo = 60
            elseif type:upper() == 'AMMO_RIFLE' then
                maxammo = 200
            elseif type:upper() == 'AMMO_SNIPER' then
                maxammo = 20
            end

            if total < maxammo then
                CTRPFW.Functions.Progressbar("taking_bullets", "Loading bullets", math.random(500, 1000), false, true, {
                    disableMovement = false,
                    disableCarMovement = false,
                    disableMouse = false,
                    disableCombat = true,
                }, {}, {}, {}, function() -- Done
                    if CTRPFW.Shared.Weapons[weapon] ~= nil then
                        SetAmmoInClip(ped, weapon, 0)
                        SetPedAmmo(ped, weapon, total+addamount)
                        local total = (GetAmmoInPedWeapon(GetPlayerPed(-1), weapon))
                        if total >= maxammo then
                            SetPedAmmo(ped, weapon, maxammo)
                        end
                        TriggerServerEvent("weapons:server:AddWeaponAmmo", CurrentWeaponData, total+addamount)
                        TriggerServerEvent('CTRPFW:Server:RemoveItem', itemData.name, 1, itemData.slot)
                        TriggerEvent('inventory:client:ItemBox', CTRPFW.Shared.Items[itemData.name], "remove")
                        TriggerEvent('CTRPFW:Notify', "" .. addamount .." bullets loaded!", "success")
                    end
                end, function()
                    CTRPFW.Functions.Notify("Canceled", "error")
                end)
            else
                CTRPFW.Functions.Notify("Your weapon is already loaded.", "error")
            end
        else
            CTRPFW.Functions.Notify("You are not holding a weapon.", "error")
        end
    else
        CTRPFW.Functions.Notify("You are not holding a weapon.", "error")
    end
end)

RegisterNetEvent('CTRPFW:Client:OnPlayerLoaded')
AddEventHandler('CTRPFW:Client:OnPlayerLoaded', function()
    TriggerServerEvent("weapons:server:LoadWeaponAmmo")
    isLoggedIn = true
    PlayerData = CTRPFW.Functions.GetPlayerData()

    CTRPFW.Functions.TriggerCallback("weapons:server:GetConfig", function(RepairPoints)
        for k, data in pairs(RepairPoints) do
            Config.WeaponRepairPoints[k].IsRepairing = data.IsRepairing
            Config.WeaponRepairPoints[k].RepairingData = data.RepairingData
        end
    end)
end)

RegisterNetEvent('weapons:client:SetCurrentWeapon')
AddEventHandler('weapons:client:SetCurrentWeapon', function(data, bool)
    if data ~= false then
        CurrentWeaponData = data
    else
        CurrentWeaponData = {}
    end
    CanShoot = bool
end)

RegisterNetEvent('CTRPFW:Client:OnPlayerUnload')
AddEventHandler('CTRPFW:Client:OnPlayerUnload', function()
    isLoggedIn = false

    for k, v in pairs(Config.WeaponRepairPoints) do
        Config.WeaponRepairPoints[k].IsRepairing = false
        Config.WeaponRepairPoints[k].RepairingData = {}
    end
end)

RegisterNetEvent('weapons:client:SetWeaponQuality')
AddEventHandler('weapons:client:SetWeaponQuality', function(amount)
    if CurrentWeaponData ~= nil and next(CurrentWeaponData) ~= nil then
        TriggerServerEvent("weapons:server:SetWeaponQuality", CurrentWeaponData, amount)
    end
end)

Citizen.CreateThread(function()
    while true do
        if isLoggedIn then
            local inRange = false
            local ped = GetPlayerPed(-1)
            local pos = GetEntityCoords(ped)

            for k, data in pairs(Config.WeaponRepairPoints) do
                local distance = GetDistanceBetweenCoords(pos, data.coords.x, data.coords.y, data.coords.z, true)

                if distance < 10 then
                    inRange = true

                    if distance < 1 then
                        if data.IsRepairing then
                            if data.RepairingData.CitizenId ~= PlayerData.citizenid then
                                DrawText3Ds(data.coords.x, data.coords.y, data.coords.z, 'The repair shop is currently ~r~ NOT ~w~ available ..')
                            else
                                if not data.RepairingData.Ready then
                                    DrawText3Ds(data.coords.x, data.coords.y, data.coords.z, 'Your weapon is being repaired')
                                else
                                    DrawText3Ds(data.coords.x, data.coords.y, data.coords.z, '[E] Take back weapon')
                                end
                            end
                        else
                            if CurrentWeaponData ~= nil and next(CurrentWeaponData) ~= nil then
                                if not data.RepairingData.Ready then
                                    local WeaponData = CTRPFW.Shared.Weapons[GetHashKey(CurrentWeaponData.name)]
                                    local WeaponClass = (CTRPFW.Shared.SplitStr(WeaponData.ammotype, "_")[2]):lower()
                                    DrawText3Ds(data.coords.x, data.coords.y, data.coords.z, '[E] Repair weapon, ~g~$'..Config.WeaponRepairCotsts[WeaponClass]..'~w~')
                                    if IsControlJustPressed(0, Keys["E"]) then
                                        CTRPFW.Functions.TriggerCallback('weapons:server:RepairWeapon', function(HasMoney)
                                            if HasMoney then
                                                CurrentWeaponData = {}
                                            end
                                        end, k, CurrentWeaponData)
                                    end
                                else
                                    if data.RepairingData.CitizenId ~= PlayerData.citizenid then
                                        DrawText3Ds(data.coords.x, data.coords.y, data.coords.z, 'The repair shop is currently ~r~ NOT ~w~ available ..')
                                    else
                                        DrawText3Ds(data.coords.x, data.coords.y, data.coords.z, '[E] Take back weapon')
                                        if IsControlJustPressed(0, Keys["E"]) then
                                            TriggerServerEvent('weapons:server:TakeBackWeapon', k, data)
                                        end
                                    end
                                end
                            else
                                if data.RepairingData.CitizenId == nil then
                                    DrawText3Ds(data.coords.x, data.coords.y, data.coords.z, 'You dont have a weapon in your hand..')
                                elseif data.RepairingData.CitizenId == PlayerData.citizenid then
                                    DrawText3Ds(data.coords.x, data.coords.y, data.coords.z, '[E] Take back weapon')
                                    if IsControlJustPressed(0, Keys["E"]) then
                                        TriggerServerEvent('weapons:server:TakeBackWeapon', k, data)
                                    end
                                end
                            end
                        end
                    end
                end
            end
            if not inRange then
                Citizen.Wait(1000)
            end
        end
        Citizen.Wait(3)
    end
end)

RegisterNetEvent("weapons:client:SyncRepairShops")
AddEventHandler("weapons:client:SyncRepairShops", function(NewData, key)
    Config.WeaponRepairPoints[key].IsRepairing = NewData.IsRepairing
    Config.WeaponRepairPoints[key].RepairingData = NewData.RepairingData
end)

RegisterNetEvent("weapons:client:EquipAttachment")
AddEventHandler("weapons:client:EquipAttachment", function(ItemData, attachment)
    local ped = GetPlayerPed(-1)
    local weapon = GetSelectedPedWeapon(ped)
    local WeaponData = CTRPFW.Shared.Weapons[weapon]
    
    if weapon ~= GetHashKey("WEAPON_UNARMED") then
        WeaponData.name = WeaponData.name:upper()
        if Config.WeaponAttachments[WeaponData.name] ~= nil then
            if Config.WeaponAttachments[WeaponData.name][attachment] ~= nil then
                TriggerServerEvent("weapons:server:EquipAttachment", ItemData, CurrentWeaponData, Config.WeaponAttachments[WeaponData.name][attachment])
            else
                CTRPFW.Functions.Notify("This weapon does not support this attachment..", "error")
            end
        end
    else
        CTRPFW.Functions.Notify("You dont have a weapon in your hand..", "error")
    end
end)

RegisterNetEvent("addAttachment")
AddEventHandler("addAttachment", function(component)
    local ped = GetPlayerPed(-1)
    local weapon = GetSelectedPedWeapon(ped)
    local WeaponData = CTRPFW.Shared.Weapons[weapon]
    GiveWeaponComponentToPed(ped, GetHashKey(WeaponData.name), GetHashKey(component))
end)

Citizen.CreateThread(function()
    while true do
        Wait(3)
        SetPedSuffersCriticalHits(PlayerPedId(), false)
    end
end) 

Citizen.CreateThread(function()
    while true do
    	N_0x4757f00bc6323cfe(GetHashKey("WEAPON_HEAVYPISTOL"), 0.46) 
        Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_VINTAGEPISTOL"), 0.43) 
        Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_SNSPISTOL"), 0.40) 
        Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_MACHETE"), 0.25) 
        Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_SWITCHBLADE"), 0.25) 
        Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_KNIFE"), 0.25) 
        Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_BAT"), 0.25) 
        Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_HATCHET"), 0.25) 
        Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_HAMMER"), 0.25) 
        Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_WRENCH"), 0.25) 
    	Wait(0)
    end
end)



-- function DrawText3D(x, y, z, text)
-- 	SetTextScale(0.35, 0.35)
--     SetTextFont(4)
--     SetTextProportional(1)
--     SetTextColour(255, 255, 255, 215)
--     SetTextEntry("STRING")
--     SetTextCentre(true)
--     AddTextComponentString(text)
--     SetDrawOrigin(x,y,z, 0)
--     DrawText(0.0, 0.0)
--     local factor = (string.len(text)) / 370
--     DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
--     ClearDrawOrigin()
-- end

-- Citizen.CreateThread(function()
--     while true do
-- 	Citizen.Wait(0)
-- 		local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
-- 		local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, 2287.83,1709.45,68.04)
		
-- 		if dist <= 2.5 then
-- 		DrawText3D(2287.83,1709.45,68.04, "~g~[E]~w~ To Enter")
-- 		end

-- 		if dist <= 0.5 then
--             if IsControlJustPressed(0, Keys['E']) then
--                 SetEntityCoords(entity, 207.21,-1018.33,-99.0)
-- 			end			
-- 		end
-- 	end
-- end)


-- Citizen.CreateThread(function()
--     while true do
-- 		local inRange = false
--         local ped = GetPlayerPed(-1)
--         local pos = GetEntityCoords(ped)
-- 		local dist = GetDistanceBetweenCoords(pos, 207.21,-1018.33,-99.0, true)
-- 		if dist < 2 then
--         	inRange = true
--             DrawMarker(2, 207.21,-1018.33,-99.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.15, 255, 255, 255, 255, 0, 0, 0, 1, 0, 0, 0)

--                 if dist < 1 then
--                     DrawText3D(207.21,-1018.33,-99.0, '~g~[E]~w~ To go outside')
--                     if IsControlJustReleased(0, 51) then
--                         local entity = GetPlayerPed(-1)
-- 	    				SetEntityCoords(entity, 2287.83,1709.45,68.04)
--                     end
--                 end
--         end

--         if not inRange then
--             Citizen.Wait(1000)
--         end

--         Citizen.Wait(3)
--     end
-- end)