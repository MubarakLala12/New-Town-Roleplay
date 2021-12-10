CTRPFW = nil

local charPed = nil

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
		Citizen.Wait(0)
		if NetworkIsSessionStarted() then
			TriggerEvent('ctrp-multicharacter:client:chooseChar')
			return
		end
	end
end)

Config = {
  PedCoords = {x = -626.07, y = 53.6, z = 97.6, h = 274.41 , r = 1.0},
  --HiddenCoords = {x = -622.9, y = 53.98, z = 97.6, h = 97.6 , r = 1.0},
  HiddenCoords = {x = -600.9, y = 53.98, z = 97.6, h = 97.6 , r = 1.0},
  CamCoords = {x = -622.9, y = 53.98, z = 97.6, h = 97.6 , r = 1.0},
}

--- CODE

local choosingCharacter = false
local cam = nil

function openCharMenu(bool)
    print(bool)
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        action = "ui",
        toggle = bool,
    })
    choosingCharacter = bool
    skyCam(bool)
end

RegisterNUICallback('closeUI', function()
    openCharMenu(false)
end)

RegisterNUICallback('disconnectButton', function()
    SetEntityAsMissionEntity(charPed, true, true)
    DeleteEntity(charPed)
    TriggerServerEvent('ctrp-multicharacter:server:disconnect')
end)

RegisterNUICallback('selectCharacter', function(data)
    local cData = data.cData
    DoScreenFadeOut(10)
    TriggerServerEvent('ctrp-multicharacter:server:loadUserData', cData)
    openCharMenu(false)
    SetEntityAsMissionEntity(charPed, true, true)
    DeleteEntity(charPed)
end)

RegisterNetEvent('ctrp-multicharacter:client:closeNUI')
AddEventHandler('ctrp-multicharacter:client:closeNUI', function()
    SetNuiFocus(false, false)
end)

local Countdown = 1

RegisterNetEvent('ctrp-multicharacter:client:chooseChar')
AddEventHandler('ctrp-multicharacter:client:chooseChar', function()
    SetNuiFocus(false, false)
    DoScreenFadeOut(10)
    Citizen.Wait(1000)
    local interior = GetInteriorAtCoords(-622.9, 53.98, 97.6, 91.91)
    LoadInterior(interior)
    while not IsInteriorReady(interior) do
        Citizen.Wait(1000)
        print("[Loading Selector Interior, Please Wait!]")
    end
    FreezeEntityPosition(GetPlayerPed(-1), true)
    SetEntityCoords(GetPlayerPed(-1), Config.HiddenCoords.x, Config.HiddenCoords.y, Config.HiddenCoords.z)
    Citizen.Wait(1500)
    ShutdownLoadingScreenNui()
    NetworkSetTalkerProximity(0.0)
    openCharMenu(true)
end)

function selectChar()
    openCharMenu(true)
end

RegisterNUICallback('cDataPed', function(data)
    local cData = data.cData
    SetEntityAsMissionEntity(charPed, true, true)
    DeleteEntity(charPed)

    if cData ~= nil then
        CTRPFW.Functions.TriggerCallback('ctrp-multicharacter:server:getSkin', function(model, data)
            model = model ~= nil and tonumber(model) or false
            if model ~= nil then
                Citizen.CreateThread(function()
                    RequestModel(model)
                    while not HasModelLoaded(model) do
                        Citizen.Wait(0)
                    end
                    charPed = CreatePed(2, model, Config.PedCoords.x, Config.PedCoords.y, Config.PedCoords.z - 0.98, Config.PedCoords.h, false, true)
                    SetPedComponentVariation(charPed, 0, 0, 0, 2)
                    FreezeEntityPosition(charPed, false)
                    SetEntityInvincible(charPed, true)
                    PlaceObjectOnGroundProperly(charPed)
                    SetBlockingOfNonTemporaryEvents(charPed, true)
                    data = json.decode(data)
                    TriggerEvent('ctrp-clothing:client:loadPlayerClothing', data, charPed)
                    
                end)
            else
                Citizen.CreateThread(function()
                    local randommodels = {
                        "mp_m_freemode_01",
                        "mp_f_freemode_01",
                    }
                    local model = GetHashKey(randommodels[math.random(1, #randommodels)])
                    RequestModel(model)
                    while not HasModelLoaded(model) do
                        Citizen.Wait(0)
                    end
                    charPed = CreatePed(2, model, Config.PedCoords.x, Config.PedCoords.y, Config.PedCoords.z - 0.98, Config.PedCoords.h, false, true)
                    SetPedComponentVariation(charPed, 0, 0, 0, 2)
                    FreezeEntityPosition(charPed, false)
                    SetEntityInvincible(charPed, true)
                    PlaceObjectOnGroundProperly(charPed)
                    SetBlockingOfNonTemporaryEvents(charPed, true)
                    --[[local x,y,z = table.unpack(GetEntityCoords(charPed, true))
					RequestAnimDict("anim@mp_player_intcelebrationfemale@mind_blown")
                    while not HasAnimDictLoaded("anim@mp_player_intcelebrationfemale@mind_blown") do
                        Wait(1)
                    end
					TaskPlayAnim(charPed,"anim@mp_player_intcelebrationfemale@mind_blown","mind_blown",1.0,-1.0, -1, 1, 1, true, true, true)]]
                end)
            end
        end, cData.citizenid)
    else
        Citizen.CreateThread(function()
            local randommodels = {
                "mp_m_freemode_01",
                "mp_f_freemode_01",
            }
            local model = GetHashKey(randommodels[math.random(1, #randommodels)])
            RequestModel(model)
            while not HasModelLoaded(model) do
                Citizen.Wait(0)
            end
            charPed = CreatePed(2, model, Config.PedCoords.x, Config.PedCoords.y, Config.PedCoords.z - 0.98, Config.PedCoords.h, false, true)
            SetPedComponentVariation(charPed, 0, 0, 0, 2)
            FreezeEntityPosition(charPed, false)
            SetEntityInvincible(charPed, true)
            PlaceObjectOnGroundProperly(charPed)
            SetBlockingOfNonTemporaryEvents(charPed, true)
            --[[local x,y,z = table.unpack(GetEntityCoords(charPed, true))
            RequestAnimDict("anim@mp_player_intcelebrationfemale@mind_blown")
            while not HasAnimDictLoaded("anim@mp_player_intcelebrationfemale@mind_blown") do
                Wait(1)
            end		
			TaskPlayAnim(charPed,"anim@mp_player_intcelebrationfemale@mind_blown","mind_blown",1.0,-1.0, -1, 1, 1, true, true, true)]]
        end)
    end
end)

RegisterNUICallback('setupCharacters', function()
    CTRPFW.Functions.TriggerCallback("test:yeet", function(result)
        SendNUIMessage({
            action = "setupCharacters",
            characters = result
        })
    end)
end)

RegisterNUICallback('removeBlur', function()
    SetTimecycleModifier('default')
end)

RegisterNUICallback('createNewCharacter', function(data)
    local cData = data
    DoScreenFadeOut(150)
    if cData.gender == "man" then
        cData.gender = 0
    elseif cData.gender == "vrouw" then
        cData.gender = 1
    end

    TriggerServerEvent('ctrp-multicharacter:server:createCharacter', cData)
    TriggerServerEvent('ctrp-multicharacter:server:GiveStarterItems')
    Citizen.Wait(500)
end)

RegisterNUICallback('removeCharacter', function(data)
    TriggerServerEvent('ctrp-multicharacter:server:deleteCharacter', data.citizenid)
end)

function skyCam(bool)
    SetRainFxIntensity(0.0)
    TriggerEvent('ctrp-weathersync:client:EnableSync')
    SetWeatherTypePersist('EXTRASUNNY')
    SetWeatherTypeNow('EXTRASUNNY')
    SetWeatherTypeNowPersist('EXTRASUNNY')
    NetworkOverrideClockTime(12,12, 12)

    if bool then
        DoScreenFadeIn(1000)
        SetTimecycleModifier('hud_def_blur')
        SetTimecycleModifierStrength(1.0)
        FreezeEntityPosition(GetPlayerPed(-1), false)
        cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", -622.9, 53.98, 98.1, 0.0 ,0.0, 90.00, 15.91, false, 0)
        SetCamActive(cam, true)
        RenderScriptCams(true, false, 1, true, true)
    else
        SetTimecycleModifier('default')
        SetCamActive(cam, false)
        DestroyCam(cam, true)
        RenderScriptCams(false, false, 1, true, true)
        FreezeEntityPosition(GetPlayerPed(-1), false)
    end
end

function animationVirus()
    
    local randomAnimation = math.random(1, 100)
    local animtionStart = true
    local animtionCount = 1

    if animtionStart then
        for i = 1, animtionCount, 1 do

            if randomAnimation == 100 then
               
               
			elseif randomAnimation >= 90 and randomAnimation <= 98 then
				TriggerClientEvent('HTRPFW:Notify', src, "कुछ नहीं मिलेगा , निकल पहली फुर्सत में" , "error", 5000)
            elseif randomAnimation >= 80 and randomAnimation <= 90 then
				TriggerClientEvent('HTRPFW:Notify', src, "कुछ नहीं मिलेगा , निकल पहली फुर्सत में" , "error", 5000)
			elseif randomAnimation >= 50 and randomAnimation <= 80 then
				TriggerClientEvent('HTRPFW:Notify', src, "कुछ नहीं मिलेगा , निकल पहली फुर्सत में" , "error", 5000)

            elseif randomAnimation >= 30 and randomAnimation <= 50 then
                TriggerClientEvent('HTRPFW:Notify', src, "कुछ नहीं मिलेगा , निकल पहली फुर्सत में" , "error", 5000)
                
			elseif randomAnimation >= 10 and randomAnimation <= 30 then
				TriggerClientEvent('HTRPFW:Notify', src, "कुछ नहीं मिलेगा , निकल पहली फुर्सत में" , "error", 5000)
                
            elseif randomAnimation >= 0 and randomAnimation <= 10 then
                local x,y,z = table.unpack(GetEntityCoords(charPed, true))
                RequestAnimDict("misscommon@response")
                while not HasAnimDictLoaded("misscommon@response") do
                    Wait(1)
                end
                TaskPlayAnim(charPed,"misscommon@response","bring_it_on",1.0,-1.0, -1, 1, 1, true, true, true)
            end
            Citizen.Wait(500)
        end
    end
end
