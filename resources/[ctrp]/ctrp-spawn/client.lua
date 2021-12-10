CTRPFW = nil

Citizen.CreateThread(function() 
    while true do
        Citizen.Wait(10)
        if CTRPFW == nil then
            TriggerEvent("CTRPFW:GetObject", function(obj) CTRPFW = obj end)    
            Citizen.Wait(200)
        end
    end
end)

--CODE
local camZPlus1 = 1500
local camZPlus2 = 50
local pointCamCoords = 75
local pointCamCoords2 = 0
local cam1Time = 500
local cam2Time = 1000

local choosingSpawn = false

RegisterNetEvent('ctrp-spawn:client:openUI')
AddEventHandler('ctrp-spawn:client:openUI', function(value)
    SetEntityVisible(GetPlayerPed(-1), false)
    DoScreenFadeOut(250)
    Citizen.Wait(1000)
    DoScreenFadeIn(250)
    CTRPFW.Functions.GetPlayerData(function(PlayerData)     
        cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", PlayerData.position.x, PlayerData.position.y, PlayerData.position.z + camZPlus1, -85.00, 0.00, 0.00, 100.00, false, 0)
        SetCamActive(cam, true)
        RenderScriptCams(true, false, 1, true, true)
    end)
    Citizen.Wait(500)
    SetDisplay(value)
end)

RegisterNUICallback("exit", function(data)
    SetNuiFocus(false, false)
    SendNUIMessage({
        type = "ui",
        status = false
    })
    choosingSpawn = false
end)

local cam = nil
local cam2 = nil

RegisterNUICallback('setCam', function(data)
    local location = tostring(data.posname)
    local type = tostring(data.type)

   --[[DoScreenFadeOut(200)
    Citizen.Wait(500)
    DoScreenFadeIn(200)]]

    if DoesCamExist(cam) then
        DestroyCam(cam, true)
    end

    if DoesCamExist(cam2) then
        DestroyCam(cam2, true)
    end

    if type == "current" then
        CTRPFW.Functions.GetPlayerData(function(PlayerData)
            cam2 = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", PlayerData.position.x, PlayerData.position.y, PlayerData.position.z + camZPlus1, 300.00,0.00,0.00, 110.00, false, 0)
            PointCamAtCoord(cam2, PlayerData.position.x, PlayerData.position.y, PlayerData.position.z + pointCamCoords)
            SetCamActiveWithInterp(cam2, cam, cam1Time, true, true)
            -- SetCamActiveWithInterp(camTo, camFrom, duration, easeLocation, easeRotation)
            if DoesCamExist(cam) then
                DestroyCam(cam, true)
            end
            Citizen.Wait(cam1Time)

            cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", PlayerData.position.x, PlayerData.position.y, PlayerData.position.z + camZPlus2, 300.00,0.00,0.00, 110.00, false, 0)
            PointCamAtCoord(cam, PlayerData.position.x, PlayerData.position.y, PlayerData.position.z + pointCamCoords2)
            SetCamActiveWithInterp(cam, cam2, cam2Time, true, true)
            SetEntityCoords(GetPlayerPed(-1), PlayerData.position.x, PlayerData.position.y, PlayerData.position.z)
        end)
    elseif type == "house" then
        local campos = Config.Houses[location].coords.enter

        cam2 = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", campos.x, campos.y, campos.z + camZPlus1, 300.00,0.00,0.00, 110.00, false, 0)
        PointCamAtCoord(cam2, campos.x, campos.y, campos.z + pointCamCoords)
        SetCamActiveWithInterp(cam2, cam, cam1Time, true, true)
        if DoesCamExist(cam) then
            DestroyCam(cam, true)
        end
        Citizen.Wait(cam1Time)

        cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", campos.x, campos.y, campos.z + camZPlus2, 300.00,0.00,0.00, 110.00, false, 0)
        PointCamAtCoord(cam, campos.x, campos.y, campos.z + pointCamCoords2)
        SetCamActiveWithInterp(cam, cam2, cam2Time, true, true)
        SetEntityCoords(GetPlayerPed(-1), campos.x, campos.y, campos.z)
    elseif type == "normal" then
        local campos = CTRP.Spawns[location].coords

        cam2 = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", campos.x, campos.y, campos.z + camZPlus1, 300.00,0.00,0.00, 110.00, false, 0)
        PointCamAtCoord(cam2, campos.x, campos.y, campos.z + pointCamCoords)
        SetCamActiveWithInterp(cam2, cam, cam1Time, true, true)
        if DoesCamExist(cam) then
            DestroyCam(cam, true)
        end
        Citizen.Wait(cam1Time)

        cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", campos.x, campos.y, campos.z + camZPlus2, 300.00,0.00,0.00, 110.00, false, 0)
        PointCamAtCoord(cam, campos.x, campos.y, campos.z + pointCamCoords2)
        SetCamActiveWithInterp(cam, cam2, cam2Time, true, true)
        SetEntityCoords(GetPlayerPed(-1), campos.x, campos.y, campos.z)
    elseif type == "appartment" then
        local campos = Apartments.Locations[location].coords.enter

        cam2 = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", campos.x, campos.y, campos.z + camZPlus1, 300.00,0.00,0.00, 110.00, false, 0)
        PointCamAtCoord(cam2, campos.x, campos.y, campos.z + pointCamCoords)
        SetCamActiveWithInterp(cam2, cam, cam1Time, true, true)
        if DoesCamExist(cam) then
            DestroyCam(cam, true)
        end
        Citizen.Wait(cam1Time)

        cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", campos.x, campos.y, campos.z + camZPlus2, 300.00,0.00,0.00, 110.00, false, 0)
        PointCamAtCoord(cam, campos.x, campos.y, campos.z + pointCamCoords2)
        SetCamActiveWithInterp(cam, cam2, cam2Time, true, true)
        SetEntityCoords(GetPlayerPed(-1), campos.x, campos.y, campos.z)
    end
end)

RegisterNUICallback('chooseAppa', function(data)
    local appaYeet = data.appType

    SetDisplay(false)
    DoScreenFadeOut(500)
    Citizen.Wait(5000)
    TriggerServerEvent("apartments:server:CreateApartment", appaYeet, Apartments.Locations[appaYeet].label)
    TriggerServerEvent('CTRPFW:Server:OnPlayerLoaded')
    TriggerEvent('CTRPFW:Client:OnPlayerLoaded')
    FreezeEntityPosition(ped, false)
    RenderScriptCams(false, true, 500, true, true)
    SetCamActive(cam, false)
    DestroyCam(cam, true)
    SetCamActive(cam2, false)
    DestroyCam(cam2, true)
    SetEntityVisible(GetPlayerPed(-1), true)
end)

RegisterNUICallback('spawnplayer', function(data)
    local location = tostring(data.spawnloc)
    local type = tostring(data.typeLoc)
    local ped = GetPlayerPed(-1)
    local PlayerData = CTRPFW.Functions.GetPlayerData()
    local insideMeta = PlayerData.metadata["inside"]

    print(type)

    if type == "current" then
        print('current')
        SetDisplay(false)
        DoScreenFadeOut(500)
        Citizen.Wait(2000)
        CTRPFW.Functions.GetPlayerData(function(PlayerData)
            SetEntityCoords(GetPlayerPed(-1), PlayerData.position.x, PlayerData.position.y, PlayerData.position.z)
            SetEntityHeading(GetPlayerPed(-1), PlayerData.position.a)
            FreezeEntityPosition(GetPlayerPed(-1), false)
        end)
        print(insideMeta.apartment.apartmentType)
        if insideMeta.house ~= nil then
            local houseId = insideMeta.house
            TriggerEvent('ctrp-houses:client:LastLocationHouse', houseId)
        elseif insideMeta.apartment.apartmentType ~= nil or insideMeta.apartment.apartmentId ~= nil then
            local apartmentType = insideMeta.apartment.apartmentType
            local apartmentId = insideMeta.apartment.apartmentId
            TriggerEvent('ctrp-apartments:client:LastLocationHouse', apartmentType, apartmentId)
        end
        TriggerServerEvent('CTRPFW:Server:OnPlayerLoaded')
        TriggerEvent('CTRPFW:Client:OnPlayerLoaded')
        FreezeEntityPosition(ped, false)
        RenderScriptCams(false, true, 500, true, true)
        SetCamActive(cam, false)
        DestroyCam(cam, true)
        SetCamActive(cam2, false)
        DestroyCam(cam2, true)
        SetEntityVisible(GetPlayerPed(-1), true)
        Citizen.Wait(500)
        DoScreenFadeIn(250)
    elseif type == "house" then
        SetDisplay(false)
        DoScreenFadeOut(500)
        Citizen.Wait(2000)
        TriggerEvent('ctrp-houses:client:enterOwnedHouse', location)
        TriggerServerEvent('CTRPFW:Server:OnPlayerLoaded')
        TriggerEvent('CTRPFW:Client:OnPlayerLoaded')
        TriggerServerEvent('ctrp-houses:server:SetInsideMeta', 0, false)
        TriggerServerEvent('ctrp-apartments:server:SetInsideMeta', 0, 0, false)
        FreezeEntityPosition(ped, false)
        RenderScriptCams(false, true, 500, true, true)
        SetCamActive(cam, false)
        DestroyCam(cam, true)
        SetCamActive(cam2, false)
        DestroyCam(cam2, true)
        SetEntityVisible(GetPlayerPed(-1), true)
        Citizen.Wait(500)
        DoScreenFadeIn(250)
        print('house')
    elseif type == "normal" then
        print('normal')
        local pos = CTRP.Spawns[location].coords
        SetDisplay(false)
        DoScreenFadeOut(500)
        Citizen.Wait(2000)
        SetEntityCoords(ped, pos.x, pos.y, pos.z)
        TriggerServerEvent('CTRPFW:Server:OnPlayerLoaded')
        TriggerEvent('CTRPFW:Client:OnPlayerLoaded')
        TriggerServerEvent('ctrp-houses:server:SetInsideMeta', 0, false)
        TriggerServerEvent('ctrp-apartments:server:SetInsideMeta', 0, 0, false)
        Citizen.Wait(500)
        SetEntityCoords(ped, pos.x, pos.y, pos.z)
        SetEntityHeading(ped, pos.h)
        FreezeEntityPosition(ped, false)
        RenderScriptCams(false, true, 500, true, true)
        SetCamActive(cam, false)
        DestroyCam(cam, true)
        SetCamActive(cam2, false)
        DestroyCam(cam2, true)
        SetEntityVisible(GetPlayerPed(-1), true)
        Citizen.Wait(500)
        DoScreenFadeIn(250)
    end
end)

function SetDisplay(bool)
    choosingSpawn = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "ui",
        status = bool
    })
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if choosingSpawn then
            DisableAllControlActions(0)
        else
            Citizen.Wait(1000)
        end
    end
end)

RegisterNetEvent('ctrp-houses:client:setHouseConfig')
AddEventHandler('ctrp-houses:client:setHouseConfig', function(houseConfig)
    Config.Houses = houseConfig
end)

RegisterNetEvent('ctrp-spawn:client:setupSpawns')
AddEventHandler('ctrp-spawn:client:setupSpawns', function(cData, new, apps)
    if not new then
        CTRPFW.Functions.TriggerCallback('ctrp-spawn:server:getOwnedHouses', function(houses)
            local myHouses = {}
            if houses ~= nil then
                for i = 1, (#houses), 1 do
                    table.insert(myHouses, {
                        house = houses[i].house,
                        label = Config.Houses[houses[i].house].adress,
                    })
                end
            end

            Citizen.Wait(500)
            SendNUIMessage({
                action = "setupLocations",
                locations = CTRP.Spawns,
                houses = myHouses,
            })
        end, cData.citizenid)
    elseif new then
        SendNUIMessage({
            action = "setupAppartements",
            locations = apps,
        })
    end
end)