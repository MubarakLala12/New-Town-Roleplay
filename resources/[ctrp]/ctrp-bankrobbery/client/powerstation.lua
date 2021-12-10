local closestStation = 0
local currentStation = 0
CurrentCops = 0
local currentFires = {}
local currentGate = 0

Citizen.CreateThread(function()
    while true do
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        local dist
        sleep = 2500
        if CTRPFW ~= nil then
            sleep = 1000
            local inRange = false
            for k, v in pairs(Config.PowerStations) do
                dist = GetDistanceBetweenCoords(pos, Config.PowerStations[k].coords.x, Config.PowerStations[k].coords.y, Config.PowerStations[k].coords.z)
                if dist < 5 then
                    closestStation = k
                    inRange = true
                    sleep = 7
                end
            end

            if not inRange then
                -- Citizen.Wait(1000)
                closestStation = 0
            end
        end
        Citizen.Wait(sleep)
    end
end)
local requiredItemsShowed = false
local requiredItems = {}
Citizen.CreateThread(function()
    Citizen.Wait(2000)
    requiredItems = {
        [1] = {name = CTRPFW.Shared.Items["thermite"]["name"], image = CTRPFW.Shared.Items["thermite"]["image"]},
    }
    while true do
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        sleep = 2500
        if CTRPFW ~= nil then
            sleep 1500
            if closestStation ~= 0 then
                if not Config.PowerStations[closestStation].hit then
                    sleep = 7
                    DrawMarker(2, Config.PowerStations[closestStation].coords.x, Config.PowerStations[closestStation].coords.y, Config.PowerStations[closestStation].coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.25, 0.25, 0.1, 255, 255, 255, 155, 0, 0, 0, 1, 0, 0, 0)
                    local dist = GetDistanceBetweenCoords(pos, Config.PowerStations[closestStation].coords.x, Config.PowerStations[closestStation].coords.y, Config.PowerStations[closestStation].coords.z)
                    if dist < 1 then
                        if not requiredItemsShowed then
                            requiredItemsShowed = true
                            TriggerEvent('inventory:client:requiredItems', requiredItems, true)
                        end
                    else
                        if requiredItemsShowed then
                            requiredItemsShowed = false
                            TriggerEvent('inventory:client:requiredItems', requiredItems, false)
                        end
                    end
                end
            end
        end

        Citizen.Wait(sleep)
    end
end)

RegisterNetEvent('police:SetCopCount')
AddEventHandler('police:SetCopCount', function(amount)
    CurrentCops = amount
end)

RegisterNetEvent("thermite:StartFire")
AddEventHandler("thermite:StartFire", function(coords, maxChildren, isGasFire)
    if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, GetEntityCoords(PlayerPedId())) < 100 then
        local pos = {
            x = coords.x, 
            y = coords.y,
            z = coords.z,
        }
        pos.z = pos.z - 0.9
        local fire = StartScriptFire(pos.x, pos.y, pos.z, maxChildren, isGasFire)
        table.insert(currentFires, fire)
    end
end)

RegisterNetEvent("thermite:StopFires")
AddEventHandler("thermite:StopFires", function()
    for k, v in ipairs(currentFires) do
        RemoveScriptFire(v)
    end
end)

RegisterNetEvent('thermite:UseThermite')
AddEventHandler('thermite:UseThermite', function()
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if closestStation ~= 0 then
        if math.random(1, 100) <= 85 and not IsWearingHandshoes() then
            TriggerServerEvent("evidence:server:CreateFingerDrop", pos)
        end
        local dist = GetDistanceBetweenCoords(pos, Config.PowerStations[closestStation].coords.x, Config.PowerStations[closestStation].coords.y, Config.PowerStations[closestStation].coords.z)
        if dist < 1.5 then
            if CurrentCops >= Config.MinimumThermitePolice then
                if not Config.PowerStations[closestStation].hit then
                    loadAnimDict("weapon@w_sp_jerrycan")
                    TaskPlayAnim(PlayerPedId(), "weapon@w_sp_jerrycan", "fire", 3.0, 3.9, 180, 49, 0, 0, 0, 0)
                    TriggerEvent('inventory:client:requiredItems', requiredItems, false)
                    SetNuiFocus(true, true)
                    SendNUIMessage({
                        action = "openThermite",
                        amount = math.random(5, 10),
                    })
                    currentStation = closestStation
                else
                    CTRPFW.Functions.Notify("It seems that the fuses have blown..", "error")
                end
            else
                CTRPFW.Functions.Notify("Not enough cops..", "error")
            end
        end
    elseif currentThermiteGate ~= 0 then
        if math.random(1, 100) <= 85 and not IsWearingHandshoes() then
            TriggerServerEvent("evidence:server:CreateFingerDrop", pos)
        end
        if CurrentCops >= Config.MinimumThermitePolice then
            currentGate = currentThermiteGate
            loadAnimDict("weapon@w_sp_jerrycan")
            TaskPlayAnim(PlayerPedId(), "weapon@w_sp_jerrycan", "fire", 3.0, 3.9, -1, 49, 0, 0, 0, 0)
            TriggerEvent('inventory:client:requiredItems', requiredItems, false)
            SetNuiFocus(true, true)
            SendNUIMessage({
                action = "openThermite",
                amount = math.random(5, 10),
            })
        else
            CTRPFW.Functions.Notify("Not enough cops..", "error")
        end
    end
end)

RegisterNetEvent('ctrp-bankrobbery:client:SetStationStatus')
AddEventHandler('ctrp-bankrobbery:client:SetStationStatus', function(key, isHit)
    Config.PowerStations[key].hit = isHit
end)

RegisterNUICallback('thermiteclick', function()
    PlaySound(-1, "CLICK_BACK", "WEB_NAVIGATION_SOUNDS_PHONE", 0, 0, 1)
end)

RegisterNUICallback('thermitefailed', function()
    PlaySound(-1, "Place_Prop_Fail", "DLC_Dmod_Prop_Editor_Sounds", 0, 0, 1)
    TriggerServerEvent("CTRPFW:Server:RemoveItem", "thermite", 1)
    TriggerEvent('inventory:client:ItemBox', CTRPFW.Shared.Items["thermite"], "remove")
    ClearPedTasks(PlayerPedId())
    local coords = GetEntityCoords(PlayerPedId())
    local randTime = math.random(10000, 15000)
    CreateFire(coords, randTime)
end)

RegisterNUICallback('thermitesuccess', function()
    ClearPedTasks(PlayerPedId())
    local time = 3
    local coords = GetEntityCoords(PlayerPedId())
    while time > 0 do 
        CTRPFW.Functions.Notify("Ignite in " .. time .. "..")
        Citizen.Wait(1000)
        time = time - 1
    end
    local randTime = math.random(10000, 15000)
    CreateFire(coords, randTime)
    if currentStation ~= 0 then
        CTRPFW.Functions.Notify("The fuses are broken", "success")
        TriggerServerEvent("ctrp-bankrobbery:server:SetStationStatus", currentStation, true)
    elseif currentGate ~= 0 then
        CTRPFW.Functions.Notify("The door is now open", "success")
        TriggerServerEvent('ctrp-doorlock:server:updateState', currentGate, false)
        currentGate = 0
    end
end)

RegisterNUICallback('closethermite', function()
    SetNuiFocus(false, false)
end)

function CreateFire(coords, time)
    for i = 1, math.random(1, 7), 1 do
        TriggerServerEvent("thermite:StartServerFire", coords, 24, false)
    end
    Citizen.Wait(time)
    TriggerServerEvent("thermite:StopFires")
end