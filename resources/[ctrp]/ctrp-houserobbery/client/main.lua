CTRPFW = nil

Citizen.CreateThread(function()
	while CTRPFW == nil do
		TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)
		Citizen.Wait(0)
	end
end)

-- Code
local disturbance = 0
local inside = false
local currentHouse = nil
local closestHouse

local inRange

local lockpicking = false

local houseObj = {}
local POIOffsets = nil
local usingAdvanced = false

local requiredItemsShowed = false

local requiredItems = {}

CurrentCops = 0

RegisterNetEvent('CTRPFW:Client:OnPlayerLoaded')
AddEventHandler('CTRPFW:Client:OnPlayerLoaded', function()
    CTRPFW.Functions.TriggerCallback('ctrp-houserobbery:server:GetHouseConfig', function(HouseConfig)
        Config.Houses = HouseConfig
    end)
end)

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
    Citizen.Wait(500)
    requiredItems = {
        [1] = {name = CTRPFW.Shared.Items["lockpick"]["name"], image = CTRPFW.Shared.Items["lockpick"]["image"]},
        [2] = {name = CTRPFW.Shared.Items["screwdriverset"]["name"], image = CTRPFW.Shared.Items["screwdriverset"]["image"]},
    }
    while true do
        inRange = false
        local PlayerPed = GetPlayerPed(-1)
        local PlayerPos = GetEntityCoords(PlayerPed)
        closestHouse = nil

        if CTRPFW ~= nil then
            local hours = GetClockHours()
            if hours >= Config.MinimumTime or hours <= Config.MaximumTime then
                if not inside then
                    for k, v in pairs(Config.Houses) do
                        local dist = GetDistanceBetweenCoords(PlayerPos, Config.Houses[k]["coords"]["x"], Config.Houses[k]["coords"]["y"], Config.Houses[k]["coords"]["z"], true)

                        if dist <= 1.5 then
                            closestHouse = k
                            inRange = true
                            
                            if CurrentCops >= Config.MinimumHouseRobberyPolice then
                                if Config.Houses[k]["opened"] then
                                    DrawText3Ds(Config.Houses[k]["coords"]["x"], Config.Houses[k]["coords"]["y"], Config.Houses[k]["coords"]["z"], '~g~E~w~ - To enter')
                                    if IsControlJustPressed(0, Keys["E"]) then
                                        enterRobberyHouse(k)
                                    end
                                else
                                    if not requiredItemsShowed then
                                        requiredItemsShowed = false
                                        TriggerEvent('inventory:client:requiredItems', requiredItems, false)
                                    end
                                end
                            end
                        end
                    end
                end
            end

            if inside then
                Citizen.Wait(1000)
            end

            if not inRange then
                if requiredItemsShowed then
                    requiredItemsShowed = false
                    TriggerEvent('inventory:client:requiredItems', requiredItems, false)
                end
                Citizen.Wait(1000)
            end
        end

        Citizen.Wait(5)
    end
end)

function closestNPC()
    local playerCoords = GetEntityCoords(GetPlayerPed(-1))
    local handle, ped = FindFirstPed()
    local success
    local rped = nil
    local distanceFrom = 999.0
    local pedcount = 0
    repeat
        local pos = GetEntityCoords(ped)
        local distance = GetDistanceBetweenCoords(playerCoords, pos, true)
        if distance < 25.0 and ped ~= GetPlayerPed(-1) and not IsPedAPlayer(ped) then
            pedcount = pedcount + 1
            if (distance < distanceFrom) then
                distanceFrom = distance
                rped = ped
            end
        end
        success, ped = FindNextPed(handle)
    until not success
    EndFindPed(handle)
    return distanceFrom, pedcount
end

Citizen.CreateThread(function()
    while true do

        local ped = GetPlayerPed(-1)
        local pos = GetEntityCoords(ped)

        if inside then
            if(GetDistanceBetweenCoords(pos, Config.Houses[currentHouse]["coords"]["x"] + POIOffsets.exit.x, Config.Houses[currentHouse]["coords"]["y"] + POIOffsets.exit.y, Config.Houses[currentHouse]["coords"]["z"] - Config.MinZOffset + POIOffsets.exit.z, true) < 1.5)then
                DrawText3Ds(Config.Houses[currentHouse]["coords"]["x"] + POIOffsets.exit.x, Config.Houses[currentHouse]["coords"]["y"] + POIOffsets.exit.y, Config.Houses[currentHouse]["coords"]["z"] - Config.MinZOffset + POIOffsets.exit.z, '~g~E~w~ - To leave the house')
                if IsControlJustPressed(0, Keys["E"]) then
                    leaveRobberyHouse(currentHouse)
                end
            end

            for k, v in pairs(Config.Houses[currentHouse]["furniture"]) do
                if (GetDistanceBetweenCoords(pos, Config.Houses[currentHouse]["coords"]["x"] + Config.Houses[currentHouse]["furniture"][k]["coords"]["x"], Config.Houses[currentHouse]["coords"]["y"] + Config.Houses[currentHouse]["furniture"][k]["coords"]["y"], Config.Houses[currentHouse]["coords"]["z"] + Config.Houses[currentHouse]["furniture"][k]["coords"]["z"] - Config.MinZOffset, true) < 0.7) then
                    if not Config.Houses[currentHouse]["furniture"][k]["searched"] then
                        if not Config.Houses[currentHouse]["furniture"][k]["isBusy"] then
                            DrawText3Ds(Config.Houses[currentHouse]["coords"]["x"] + Config.Houses[currentHouse]["furniture"][k]["coords"]["x"], Config.Houses[currentHouse]["coords"]["y"] + Config.Houses[currentHouse]["furniture"][k]["coords"]["y"], Config.Houses[currentHouse]["coords"]["z"] + Config.Houses[currentHouse]["furniture"][k]["coords"]["z"] - Config.MinZOffset, '~g~E~w~ - '..Config.Houses[currentHouse]["furniture"][k]["text"])
                            
                                if IsControlJustReleased(0, Keys["E"]) then
                                    searchCabin(k)
                                
                            end
                        else
                            DrawText3Ds(Config.Houses[currentHouse]["coords"]["x"] + Config.Houses[currentHouse]["furniture"][k]["coords"]["x"], Config.Houses[currentHouse]["coords"]["y"] + Config.Houses[currentHouse]["furniture"][k]["coords"]["y"], Config.Houses[currentHouse]["coords"]["z"] + Config.Houses[currentHouse]["furniture"][k]["coords"]["z"] - Config.MinZOffset, 'Picking the lock..')
                        end
                    else
                        DrawText3Ds(Config.Houses[currentHouse]["coords"]["x"] + Config.Houses[currentHouse]["furniture"][k]["coords"]["x"], Config.Houses[currentHouse]["coords"]["y"] + Config.Houses[currentHouse]["furniture"][k]["coords"]["y"], Config.Houses[currentHouse]["coords"]["z"] + Config.Houses[currentHouse]["furniture"][k]["coords"]["z"] - Config.MinZOffset, 'Cabin is empty..')
                    end
                end
            end

            TriggerEvent("robbery:guiupdate", math.ceil(disturbance))

            if GetEntitySpeed(GetPlayerPed(-1)) > 1.4 then
                local distance, pedcount = closestNPC()
                local alteredsound = 0.2
                if pedcount > 0 then
                    alteredsound = alteredsound + (pedcount / 100)
                    local distancealter = (8.0 - distance) / 100
                    alteredsound = alteredsound + distancealter
                end

                disturbance = disturbance + alteredsound
                if GetEntitySpeed(GetPlayerPed(-1)) > 2.0 then
                    disturbance = disturbance + alteredsound
                end

                if GetEntitySpeed(GetPlayerPed(-1)) > 3.0 then
                    disturbance = disturbance + alteredsound
                end
            else
                disturbance = disturbance - 0.04
                if disturbance < 0 then
                    disturbance = 0
                end
            end

            if disturbance > 85 then
                if not calledin then
                    local num = 150 - disturbance
                    num = math.random(math.ceil(num))
                    local fuckup = math.ceil(num)

                    if fuckup == 2 and GetEntitySpeed(GetPlayerPed(-1)) > 0.8 then
                        calledin = true
                        PoliceCall()
                    end
                end
            end
            if IsPedShooting(PlayerPedId()) then
                disturbance = 90
                PoliceCall()
            end
            
        end

        if not inside then 
            Citizen.Wait(5000)
        end

        Citizen.Wait(3)
    end
end)

function enterRobberyHouse(house)
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "houses_door_open", 0.25)
    openHouseAnim()
    Citizen.Wait(250)
    local coords = { x = Config.Houses[house]["coords"]["x"], y = Config.Houses[house]["coords"]["y"], z= Config.Houses[house]["coords"]["z"] - Config.MinZOffset}
    if Config.Houses[house]["tier"] == 1 then
        data = exports['ctrp-interior']:CreateTier1HouseFurnished(coords)
    end
    Citizen.Wait(100)
    houseObj = data[1]
    POIOffsets = data[2]
    inside = true
    currentHouse = house
    Citizen.Wait(500)
    SetRainFxIntensity(0.0)
    TriggerEvent('ctrp-weathersync:client:EnableSync')
    Citizen.Wait(100)
    SetWeatherTypePersist('EXTRASUNNY')
    SetWeatherTypeNow('EXTRASUNNY')
    SetWeatherTypeNowPersist('EXTRASUNNY')
    NetworkOverrideClockTime(23, 0, 0)
end

function leaveRobberyHouse(house)
    local ped = GetPlayerPed(-1)
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "houses_door_open", 0.25)
    openHouseAnim()
    Citizen.Wait(250)
    DoScreenFadeOut(250)
    Citizen.Wait(500)
    exports['ctrp-interior']:DespawnInterior(houseObj, function()
        TriggerEvent('ctrp-weathersync:client:EnableSync')
        Citizen.Wait(250)
        DoScreenFadeIn(250)
        SetEntityCoords(ped, Config.Houses[house]["coords"]["x"], Config.Houses[house]["coords"]["y"], Config.Houses[house]["coords"]["z"] + 0.5)
        SetEntityHeading(ped, Config.Houses[house]["coords"]["h"])
        inside = false
        currentHouse = nil
    end)
    TriggerEvent("robbery:guiclose")
    disturbance = 0
end

RegisterNetEvent('ctrp-houserobbery:client:ResetHouseState')
AddEventHandler('ctrp-houserobbery:client:ResetHouseState', function(house)
    Config.Houses[house]["opened"] = false
    for k, v in pairs(Config.Houses[house]["furniture"]) do
        v["searched"] = false
    end
end)

RegisterNetEvent('police:SetCopCount')
AddEventHandler('police:SetCopCount', function(amount)
    CurrentCops = amount
end)

RegisterNetEvent('ctrp-houserobbery:client:enterHouse')
AddEventHandler('ctrp-houserobbery:client:enterHouse', function(house)
    enterRobberyHouse(house)
end)

function openHouseAnim()
    loadAnimDict("anim@heists@keycard@") 
    TaskPlayAnim( GetPlayerPed(-1), "anim@heists@keycard@", "exit", 5.0, 1.0, -1, 16, 0, 0, 0, 0 )
    Citizen.Wait(400)
    ClearPedTasks(GetPlayerPed(-1))
end

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end

RegisterNetEvent('lockpicks:UseLockpick')
AddEventHandler('lockpicks:UseLockpick', function(isAdvanced)
    local hours = GetClockHours()
    if hours >= Config.MinimumTime or hours <= Config.MaximumTime then
        usingAdvanced = isAdvanced
        if usingAdvanced then
            if closestHouse ~= nil then
                if CurrentCops >= Config.MinimumHouseRobberyPolice then
                    if not Config.Houses[closestHouse]["opened"] then
                        PoliceCall()
                        TriggerEvent('ctrp-lockpick:client:openLockpick', lockpickFinish)
                        if math.random(1, 100) <= 85 and not IsWearingHandshoes() then
                            local pos = GetEntityCoords(GetPlayerPed(-1))
                            TriggerServerEvent("evidence:server:CreateFingerDrop", pos)
                        end
                    else
                        CTRPFW.Functions.Notify('Door is already open..', 'error', 3500)
                    end
                else
                    CTRPFW.Functions.Notify('Not enough cops..', 'error', 3500)
                end
            end
        else
            CTRPFW.Functions.TriggerCallback('CTRPFW:HasItem', function(result)
                if closestHouse ~= nil then
                    if result then
                        if CurrentCops >= Config.MinimumHouseRobberyPolice then
                            if not Config.Houses[closestHouse]["opened"] then
                                PoliceCall()
                                TriggerEvent('ctrp-lockpick:client:openLockpick', lockpickFinish)
                                if math.random(1, 100) <= 85 and not IsWearingHandshoes() then
                                    local pos = GetEntityCoords(GetPlayerPed(-1))
                                    TriggerServerEvent("evidence:server:CreateFingerDrop", pos)
                                end
                            else
                                CTRPFW.Functions.Notify('Door is open already..', 'error', 3500)
                            end
                        else
                            CTRPFW.Functions.Notify('Not enough cops..', 'error', 3500)
                        end
                    else
                        CTRPFW.Functions.Notify('It looks like you\'re missing something...', 'error', 3500)
                    end
                end
            end, "screwdriverset")
        end
    end
end)

function PoliceCall()
    local pos = GetEntityCoords(GetPlayerPed(-1))
    local chance = 75
    if GetClockHours() >= 1 and GetClockHours() <= 6 then
        chance = 25
    end
    if math.random(1, 100) <= chance then
        local closestPed = GetNearbyPed()
        if closestPed ~= nil then
            local s1, s2 = Citizen.InvokeNative(0x2EB41072B4C1E4C0, pos.x, pos.y, pos.z, Citizen.PointerValueInt(), Citizen.PointerValueInt())
            local streetLabel = GetStreetNameFromHashKey(s1)
            local street2 = GetStreetNameFromHashKey(s2)
            if street2 ~= nil and street2 ~= "" then 
                streetLabel = streetLabel .. " " .. street2
            end
            local gender = "Man"
            if CTRPFW.Functions.GetPlayerData().charinfo.gender == 1 then
                gender = "Woman"
            end
            local msg = "10-90D | Attempted hosue robbery by a " .. gender .." at " .. streetLabel
            TriggerServerEvent("police:server:HouseRobberyCall", pos, msg, gender, streetLabel)
        end
    end
end

function GetNearbyPed()
	local retval = nil
	local PlayerPeds = {}
    for _, player in ipairs(GetActivePlayers()) do
        local ped = GetPlayerPed(player)
        table.insert(PlayerPeds, ped)
    end
    local player = GetPlayerPed(-1)
    local coords = GetEntityCoords(player)
	local closestPed, closestDistance = CTRPFW.Functions.GetClosestPed(coords, PlayerPeds)
	if not IsEntityDead(closestPed) and closestDistance < 50.0 then
		retval = closestPed
	end
	return retval
end

function lockpickFinish(success)
    if success then
        TriggerServerEvent('ctrp-houserobbery:server:enterHouse', closestHouse)
        CTRPFW.Functions.Notify('You did it!', 'success', 2500)
    else
        if usingAdvanced then
            local itemInfo = CTRPFW.Shared.Items["advancedlockpick"]
            if math.random(1, 100) < 20 then
                TriggerServerEvent("CTRPFW:Server:RemoveItem", "advancedlockpick", 1)
                TriggerEvent('inventory:client:ItemBox', itemInfo, "remove")
            end
        else
            local itemInfo = CTRPFW.Shared.Items["lockpick"]
            if math.random(1, 100) < 40 then
                TriggerServerEvent("CTRPFW:Server:RemoveItem", "lockpick", 1)
                TriggerEvent('inventory:client:ItemBox', itemInfo, "remove")
            end
        end
        
        CTRPFW.Functions.Notify('It didn\'t work..', 'error', 2500)
    end
end

RegisterNetEvent('ctrp-houserobbery:client:setHouseState')
AddEventHandler('ctrp-houserobbery:client:setHouseState', function(house, state)
    Config.Houses[house]["opened"] = state
end)

local openingDoor = false
local SucceededAttempts = 0
local NeededAttempts = 4


function searchCabin(cabin)
    if math.random(1, 100) <= 85 and not IsWearingHandshoes() then
        local pos = GetEntityCoords(GetPlayerPed(-1))
        TriggerServerEvent("evidence:server:CreateFingerDrop", pos)
    end
    if math.random(100) > 95 then
        disturbance = disturbance + 10
    end
    local lockpickTime = math.random(15000, 30000)
    LockpickDoorAnim(lockpickTime)
    TriggerServerEvent('ctrp-houserobbery:server:SetBusyState', cabin, currentHouse, true)
    CTRPFW.Functions.Progressbar("search_cabin", "Searching the box..", lockpickTime, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "veh@break_in@0h@p_m_one@",
        anim = "low_force_entry_ds",
        flags = 16,
    }, {}, {}, function() -- Done
        openingDoor = false
        ClearPedTasks(GetPlayerPed(-1))
        TriggerServerEvent('ctrp-houserobbery:server:searchCabin', cabin, currentHouse)
        Config.Houses[currentHouse]["furniture"][cabin]["searched"] = true
        TriggerServerEvent('ctrp-houserobbery:server:SetBusyState', cabin, currentHouse, false)
    end, function() -- Cancel
        openingDoor = false
        ClearPedTasks(GetPlayerPed(-1))
        TriggerServerEvent('ctrp-houserobbery:server:SetBusyState', cabin, currentHouse, false)
        CTRPFW.Functions.Notify("Canceled..", "error")
    end)
    Citizen.CreateThread(function()
        if disturbance > 20 then
            TriggerServerEvent('virus-hudcomponent:Server:GainStress', math.random(5, 10))
            Citizen.Wait(5000)
        end
    end)
end

function LockpickDoorAnim(time)
    time = time / 1000
    loadAnimDict("veh@break_in@0h@p_m_one@")
    TaskPlayAnim(GetPlayerPed(-1), "veh@break_in@0h@p_m_one@", "low_force_entry_ds" ,3.0, 3.0, -1, 16, 0, false, false, false)
    openingDoor = true
    Citizen.CreateThread(function()
        while openingDoor do
            TaskPlayAnim(PlayerPedId(), "veh@break_in@0h@p_m_one@", "low_force_entry_ds", 3.0, 3.0, -1, 16, 0, 0, 0, 0)
            Citizen.Wait(1000) disturbance = disturbance + 3.65
            time = time - 1
            if time <= 0 then
                openingDoor = false
                StopAnimTask(GetPlayerPed(-1), "veh@break_in@0h@p_m_one@", "low_force_entry_ds", 1.0)
            end
        end
    end)
end

RegisterNetEvent('ctrp-houserobbery:client:setCabinState')
AddEventHandler('ctrp-houserobbery:client:setCabinState', function(house, cabin, state)
    Config.Houses[house]["furniture"][cabin]["searched"] = state
end)

RegisterNetEvent('ctrp-houserobbery:client:SetBusyState')
AddEventHandler('ctrp-houserobbery:client:SetBusyState', function(cabin, house, bool)
    Config.Houses[house]["furniture"][cabin]["isBusy"] = bool
end)

function IsWearingHandshoes()
    local armIndex = GetPedDrawableVariation(GetPlayerPed(-1), 3)
    local model = GetEntityModel(GetPlayerPed(-1))
    local retval = true
    if model == GetHashKey("mp_m_freemode_01") then
        if Config.MaleNoHandshoes[armIndex] ~= nil and Config.MaleNoHandshoes[armIndex] then
            retval = false
        end
    else
        if Config.FemaleNoHandshoes[armIndex] ~= nil and Config.FemaleNoHandshoes[armIndex] then
            retval = false
        end
    end
    return retval
end
