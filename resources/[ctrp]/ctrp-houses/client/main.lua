local Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

inside = false
closesthouse = nil
hasKey = false
isOwned = false

isLoggedIn = true
local contractOpen = false

local cam = nil
local viewCam = false

local FrontCam = false
local eligible = false

stashLocation = nil
cupboardLocation = nil
outfitLocation = nil
logoutLocation = nil

local OwnedHouseBlips = {}

local CurrentDoorBell = 0
local rangDoorbell = nil

local houseObj = {}
local POIOffsets = nil
local entering = false
local data = nil

local CurrentHouse = nil

-- CTRPFW = nil

local inHoldersMenu = false

-- Citizen.CreateThread(function() 
--     while true do
--         Citizen.Wait(10)
--         if CTRPFW == nil then
--             TriggerEvent("CTRPFW:GetObject", function(obj) CTRPFW = obj end)    
--             Citizen.Wait(200)
--         end
--     end
-- end)

RegisterNetEvent('ctrp-houses:client:sellHouse')
AddEventHandler('ctrp-houses:client:sellHouse', function()
    if closesthouse ~= nil and hasKey then
        TriggerServerEvent('ctrp-houses:server:viewHouse', closesthouse)
    end
end)

--------------------------------------------------------------


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5000)

        if isLoggedIn then
            if not inside then
                SetClosestHouse()
            end
        end
    end
end)

RegisterNetEvent('ctrp-houses:client:EnterHouse')
AddEventHandler('ctrp-houses:client:EnterHouse', function()
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)

    if closesthouse ~= nil then
        local dist = GetDistanceBetweenCoords(pos, Config.Houses[closesthouse].coords.enter.x, Config.Houses[closesthouse].coords.enter.y, Config.Houses[closesthouse].coords.enter.z, true)
        if dist < 1.5 then
            if hasKey then
                enterOwnedHouse(closesthouse)
            else
                if not Config.Houses[closesthouse].locked then
                    enterNonOwnedHouse(closesthouse)
                end
            end
        end
    end
end)

RegisterNetEvent('ctrp-houses:client:RequestRing')
AddEventHandler('ctrp-houses:client:RequestRing', function()
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)

    if closesthouse ~= nil then
        TriggerServerEvent('ctrp-houses:server:RingDoor', closesthouse)
    end
end)

Citizen.CreateThread(function()
    Wait(1000)
    
    TriggerServerEvent('ctrp-houses:client:setHouses')
    isLoggedIn = true
    SetClosestHouse()
    TriggerEvent('ctrp-houses:client:setupHouseBlips')
    Citizen.Wait(100)
    TriggerEvent('ctrp-garages:client:setHouseGarage', closesthouse, hasKey)
    TriggerServerEvent("ctrp-houses:server:setHouses")
end)

function doorText(x, y, z, text)
    SetTextScale(0.325, 0.325)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.011, -0.025+ factor, 0.03, 0, 0, 0, 68)
    ClearDrawOrigin()
end

RegisterNetEvent('CTRPFW:Client:OnPlayerLoaded')
AddEventHandler('CTRPFW:Client:OnPlayerLoaded', function()
    TriggerServerEvent('ctrp-houses:client:setHouses')
    isLoggedIn = true
    SetClosestHouse()
    TriggerEvent('ctrp-houses:client:setupHouseBlips')
    Citizen.Wait(100)
    TriggerEvent('ctrp-garages:client:setHouseGarage', closesthouse, hasKey)
    TriggerServerEvent("ctrp-houses:server:setHouses")
    TriggerServerEvent("ctrp-houses:AutoStatuscheck")
end)

RegisterNetEvent('CTRPFW:Client:OnPlayerUnload')
AddEventHandler('CTRPFW:Client:OnPlayerUnload', function()
    isLoggedIn = false
    inside = false
    closesthouse = nil
    hasKey = false
    isOwned = false
    for k, v in pairs(OwnedHouseBlips) do
        RemoveBlip(v)
    end
end)

RegisterNetEvent('ctrp-houses:client:setHouseConfig')
AddEventHandler('ctrp-houses:client:setHouseConfig', function(houseConfig)
    Config.Houses = houseConfig
    --TriggerEvent("ctrp-houses:client:refreshHouse")
end)

RegisterNetEvent('ctrp-houses:client:lockHouse')
AddEventHandler('ctrp-houses:client:lockHouse', function(bool, house)
    Config.Houses[house].locked = bool
end)

RegisterNetEvent('ctrp-houses:client:createHouses')
AddEventHandler('ctrp-houses:client:createHouses', function(citizenid, tier)
    local pos = GetEntityCoords(PlayerPedId())
    local heading = GetEntityHeading(PlayerPedId())
    local s1, s2 = Citizen.InvokeNative(0x2EB41072B4C1E4C0, pos.x, pos.y, pos.z, Citizen.PointerValueInt(), Citizen.PointerValueInt())
    local street = GetStreetNameFromHashKey(s1)
    local coords = {
        enter 	= { x = pos.x, y = pos.y, z = pos.z, h = heading},
        cam 	= { x = pos.x, y = pos.y, z = pos.z, h = heading, yaw = -10.00},
    }
    street = street:gsub("%-", " ")
    print(citizenid)
    TriggerServerEvent('ctrp-houses:server:addNewHouse', street, coords, citizenid, tier)
end)

RegisterNetEvent('ctrp-houses:client:addGarage')
AddEventHandler('ctrp-houses:client:addGarage', function()
    if closesthouse ~= nil then 
        local pos = GetEntityCoords(PlayerPedId())
        local heading = GetEntityHeading(PlayerPedId())
        local coords = {
            x = pos.x,
            y = pos.y,
            z = pos.z,
            h = heading,
        }
        TriggerServerEvent('ctrp-houses:server:addGarage', closesthouse, coords)
    else
        CTRPFW.Functions.Notify("No house around..", "error")
    end
end)

RegisterNetEvent('ctrp-houses:client:toggleDoorlock')
AddEventHandler('ctrp-houses:client:toggleDoorlock', function()
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    
    if(GetDistanceBetweenCoords(pos, Config.Houses[closesthouse].coords.enter.x, Config.Houses[closesthouse].coords.enter.y, Config.Houses[closesthouse].coords.enter.z, true) < 1.5)then
        if hasKey then
            if Config.Houses[closesthouse].locked then
                TriggerServerEvent('ctrp-houses:server:lockHouse', false, closesthouse)
                CTRPFW.Functions.Notify("House is unlocked!", "success", 2500)
            else
                TriggerServerEvent('ctrp-houses:server:lockHouse', true, closesthouse)
                CTRPFW.Functions.Notify("House is locked!", "error", 2500)
            end
        else
            CTRPFW.Functions.Notify("You dont have the keys of the house...", "error", 3500)
        end
    else
        CTRPFW.Functions.Notify("There is no door to see??", "error", 3500)
    end
end)

DrawText3Ds = function(x, y, z, text)
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

        local pos = GetEntityCoords(PlayerPedId(), true)
        local inRange = false

        if closesthouse ~= nil then
            if(GetDistanceBetweenCoords(pos, Config.Houses[closesthouse].coords.enter.x, Config.Houses[closesthouse].coords.enter.y, Config.Houses[closesthouse].coords.enter.z, false) < 30)then
                inRange = true
                if hasKey then
                    -- ENTER HOUSE
                    if not inside then
                        if closesthouse ~= nil then
                            if(GetDistanceBetweenCoords(pos, Config.Houses[closesthouse].coords.enter.x, Config.Houses[closesthouse].coords.enter.y, Config.Houses[closesthouse].coords.enter.z, true) < 1.5)then
                                DrawText3Ds(Config.Houses[closesthouse].coords.enter.x, Config.Houses[closesthouse].coords.enter.y, Config.Houses[closesthouse].coords.enter.z, '~b~E~w~ - To get in')
                                if IsControlJustPressed(0, Keys["E"]) then
                                    TriggerEvent('ctrp-houses:client:EnterHouse', closesthouse)
                                end
                            end
                        end
                    end

                    if CurrentDoorBell ~= 0 then
                        if(GetDistanceBetweenCoords(pos, Config.Houses[closesthouse].coords.enter.x + POIOffsets.exit.x, Config.Houses[closesthouse].coords.enter.y + POIOffsets.exit.y, Config.Houses[closesthouse].coords.enter.z - Config.MinZOffset + POIOffsets.exit.z, true) < 1.5)then
                            DrawText3Ds(Config.Houses[closesthouse].coords.enter.x + POIOffsets.exit.x, Config.Houses[closesthouse].coords.enter.y + POIOffsets.exit.y, Config.Houses[closesthouse].coords.enter.z - Config.MinZOffset + POIOffsets.exit.z + 0.35, '~g~G~w~ - To open the door')
                            if IsControlJustPressed(0, Keys["G"]) then
                                TriggerServerEvent("ctrp-houses:server:OpenDoor", CurrentDoorBell, closesthouse)
                                CurrentDoorBell = 0
                            end
                        end
                    end
                    -- EXIT HOUSE
                    if inside then
                        if not entering then
                            if POIOffsets ~= nil then
                                if POIOffsets.exit ~= nil then
                                    if(GetDistanceBetweenCoords(pos, Config.Houses[CurrentHouse].coords.enter.x + POIOffsets.exit.x, Config.Houses[CurrentHouse].coords.enter.y + POIOffsets.exit.y, Config.Houses[CurrentHouse].coords.enter.z - Config.MinZOffset + POIOffsets.exit.z, true) < 1.5)then
                                        DrawText3Ds(Config.Houses[CurrentHouse].coords.enter.x + POIOffsets.exit.x, Config.Houses[CurrentHouse].coords.enter.y + POIOffsets.exit.y, Config.Houses[CurrentHouse].coords.enter.z - Config.MinZOffset + POIOffsets.exit.z, '~g~E~w~ - To leave the house')
                                        DrawText3Ds(Config.Houses[CurrentHouse].coords.enter.x + POIOffsets.exit.x, Config.Houses[CurrentHouse].coords.enter.y + POIOffsets.exit.y, Config.Houses[CurrentHouse].coords.enter.z - Config.MinZOffset + POIOffsets.exit.z - 0.1, '~g~H~w~ - Watch camera')
                                        if IsControlJustPressed(0, Keys["E"]) then
                                            leaveOwnedHouse(CurrentHouse)
                                        end
                                        if IsControlJustPressed(0, Keys["H"]) then
                                            FrontDoorCam(Config.Houses[CurrentHouse].coords.enter)
                                        end
                                    end
                                end
                            end
                        end
                    end
                else
                    if not isOwned then
                        if closesthouse ~= nil then
                            if(GetDistanceBetweenCoords(pos, Config.Houses[closesthouse].coords.enter.x, Config.Houses[closesthouse].coords.enter.y, Config.Houses[closesthouse].coords.enter.z, true) < 1.5)then
                                if not viewCam and Config.Houses[closesthouse].locked then
                                    DrawText3Ds(Config.Houses[closesthouse].coords.enter.x, Config.Houses[closesthouse].coords.enter.y, Config.Houses[closesthouse].coords.enter.z, '~g~E~w~ - To view the house')
                                    if IsControlJustPressed(0, Keys["E"]) then
                                        TriggerServerEvent("ctrp-houses:ExistRent")
                                    end
                                -- elseif not viewCam and not Config.Houses[closesthouse].locked then
                                --     DrawText3Ds(Config.Houses[closesthouse].coords.enter.x, Config.Houses[closesthouse].coords.enter.y, Config.Houses[closesthouse].coords.enter.z, '[~g~E~w~] Om naar ~b~binnen~w~ te gaan')
                                --     if IsControlJustPressed(0, Keys["E"])  then
                                --         enterNonOwnedHouse(closesthouse)
                                --     end
                                end
                            end
                        end
                    elseif isOwned then
                        if closesthouse ~= nil then
                            if not inOwned then
                                -- if(GetDistanceBetweenCoords(pos, Config.Houses[closesthouse].coords.enter.x, Config.Houses[closesthouse].coords.enter.y, Config.Houses[closesthouse].coords.enter.z, true) < 1.5)then
                                    -- if not Config.Houses[closesthouse].locked then
                                    --     DrawText3Ds(Config.Houses[closesthouse].coords.enter.x, Config.Houses[closesthouse].coords.enter.y, Config.Houses[closesthouse].coords.enter.z, '[~g~E~w~] Om naar ~b~binnen~w~ te gaan')
                                    --     if IsControlJustPressed(0, Keys["E"])  then
                                    --         enterNonOwnedHouse(closesthouse)
                                    --     end
                                    -- else
                                    --     DrawText3Ds(Config.Houses[closesthouse].coords.enter.x, Config.Houses[closesthouse].coords.enter.y, Config.Houses[closesthouse].coords.enter.z, 'De deur is ~r~vergrendeld / ~g~G~w~ - Aanbellen')
                                    --     if IsControlJustPressed(0, Keys["G"]) then
                                    --         TriggerServerEvent('ctrp-houses:server:RingDoor', closesthouse)
                                    --     end
                                    -- end
                                -- end
                            elseif inOwned then
                                if POIOffsets ~= nil then
                                    if POIOffsets.exit ~= nil then
                                        if(GetDistanceBetweenCoords(pos, Config.Houses[CurrentHouse].coords.enter.x + POIOffsets.exit.x, Config.Houses[CurrentHouse].coords.enter.y + POIOffsets.exit.y, Config.Houses[CurrentHouse].coords.enter.z - Config.MinZOffset + POIOffsets.exit.z, true) < 1.5)then
                                            DrawText3Ds(Config.Houses[CurrentHouse].coords.enter.x + POIOffsets.exit.x, Config.Houses[CurrentHouse].coords.enter.y + POIOffsets.exit.y, Config.Houses[CurrentHouse].coords.enter.z - Config.MinZOffset + POIOffsets.exit.z, '~g~E~w~ - To leave home')
                                            if IsControlJustPressed(0, Keys["E"]) then
                                                leaveNonOwnedHouse(CurrentHouse)
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                    if inside and not isOwned then
                        if not entering then
                            if POIOffsets ~= nil then
                                if POIOffsets.exit ~= nil then
                                    if(GetDistanceBetweenCoords(pos, Config.Houses[CurrentHouse].coords.enter.x + POIOffsets.exit.x, Config.Houses[CurrentHouse].coords.enter.y + POIOffsets.exit.y, Config.Houses[CurrentHouse].coords.enter.z - Config.MinZOffset + POIOffsets.exit.z, true) < 1.5)then
                                        DrawText3Ds(Config.Houses[CurrentHouse].coords.enter.x + POIOffsets.exit.x, Config.Houses[CurrentHouse].coords.enter.y + POIOffsets.exit.y, Config.Houses[CurrentHouse].coords.enter.z - Config.MinZOffset + POIOffsets.exit.z, '~g~E~w~ - To leave home')
                                        if IsControlJustPressed(0, Keys["E"]) then
                                            leaveNonOwnedHouse(CurrentHouse)
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
                
                local StashObject = nil
                -- STASH
                if inside then
                    if CurrentHouse ~= nil then
                        if stashLocation ~= nil then
                            if(GetDistanceBetweenCoords(pos, stashLocation.x, stashLocation.y, stashLocation.z, true) < 1.5)then
                                DrawText3Ds(stashLocation.x, stashLocation.y, stashLocation.z, '~g~E~w~ - Stash')
                                if IsControlJustPressed(0, Keys["E"]) then
                                    local other = {}
                                    other.maxweight = 1000000
                                    other.slots = 50
                                    if Config.Houses[CurrentHouse].tier == 1 then
                                        other.maxweight = 3000000
                                        other.slots = 90
                                    end
                                    if Config.Houses[CurrentHouse].tier == 2 then
                                        other.maxweight = 3500000
                                        other.slots = 100
                                    end
                                    if Config.Houses[CurrentHouse].tier == 3 then
                                        other.maxweight = 4000000
                                        other.slots = 120
                                    end
                                    if Config.Houses[CurrentHouse].tier == 4 then
                                        other.maxweight = 4000000
                                        other.slots = 100
                                    end		
                                    if Config.Houses[CurrentHouse].tier == 5 then
                                        other.maxweight = 4500000
                                        other.slots = 100
                                    end
                                    if Config.Houses[CurrentHouse].tier == 6 then
                                        other.maxweight = 5000000
                                        other.slots = 130
                                    end
                                    if Config.Houses[CurrentHouse].tier == 7 then
                                        other.maxweight = 5500000
                                        other.slots = 150
                                    end	
                                    if Config.Houses[CurrentHouse].tier == 8 then
                                        other.maxweight = 5500000
                                        other.slots = 150
                                    end	
                                    if Config.Houses[CurrentHouse].tier == 9 then
                                        other.maxweight = 6000000
                                        other.slots = 150
                                    end	
                                    if Config.Houses[CurrentHouse].tier == 10 then
                                        other.maxweight = 6500000
                                        other.slots = 160
                                    end	
                                    if Config.Houses[CurrentHouse].tier == 11 then
                                        other.maxweight = 7000000
                                        other.slots = 170
                                    end
                                    if Config.Houses[CurrentHouse].tier == 12 then
                                        other.maxweight = 7000000
                                        other.slots = 170
                                    end
                                    if Config.Houses[CurrentHouse].tier == 13 then
                                        other.maxweight = 7000000
                                        other.slots = 170
                                    end	
                                    if Config.Houses[CurrentHouse].tier == 14 then
                                        other.maxweight = 10000000
                                        other.slots = 250
                                    end	
                                    TriggerServerEvent("inventory:server:OpenInventory", "stash", CurrentHouse, other)
                                    TriggerEvent("inventory:client:SetCurrentStash", CurrentHouse)
                                end
                            elseif(GetDistanceBetweenCoords(pos, stashLocation.x, stashLocation.y, stashLocation.z, true) < 3)then
                                DrawText3Ds(stashLocation.x, stashLocation.y, stashLocation.z, 'Stash')
                            end
                        end
                    end
                end

                local CupboardObject = nil
                -- Cupboard
                if inside then
                    if CurrentHouse ~= nil then
                        if cupboardLocation ~= nil then
                            if(GetDistanceBetweenCoords(pos, cupboardLocation.x, cupboardLocation.y, cupboardLocation.z, true) < 1.5)then
                                DrawText3Ds(cupboardLocation.x, cupboardLocation.y, cupboardLocation.z, '~g~E~w~ - Cupboard')
                                if IsControlJustPressed(0, Keys["E"]) then
                                    local other = {}
                                    other.maxweight = 500000
                                    other.slots = 50		
                                    TriggerServerEvent("inventory:server:OpenInventory", "stash", "Cupboard_"..CurrentHouse, other)
                                    TriggerEvent("inventory:client:SetCurrentStash","Cupboard_"..CurrentHouse)
                                end
                            elseif(GetDistanceBetweenCoords(pos, cupboardLocation.x, cupboardLocation.y, cupboardLocation.z, true) < 3)then
                                DrawText3Ds(cupboardLocation.x, cupboardLocation.y, cupboardLocation.z, 'Cupboard')
                            end
                        end
                    end
                end

                if inside then
                    if CurrentHouse ~= nil then
                        if outfitLocation ~= nil then
                            if(GetDistanceBetweenCoords(pos, outfitLocation.x, outfitLocation.y, outfitLocation.z, true) < 1.5)then
                                DrawText3Ds(outfitLocation.x, outfitLocation.y, outfitLocation.z, '~g~E~w~ - Outfits')
                                if IsControlJustPressed(0, Keys["E"]) then
                                    TriggerEvent('ctrp-clothing:client:openOutfitMenu')
                                end
                            elseif(GetDistanceBetweenCoords(pos, outfitLocation.x, outfitLocation.y, outfitLocation.z, true) < 3)then
                                DrawText3Ds(outfitLocation.x, outfitLocation.y, outfitLocation.z, 'Outfits')
                            end
                        end
                    end
                end

                if inside then
                    if CurrentHouse ~= nil then
                        if logoutLocation ~= nil then
                            if(GetDistanceBetweenCoords(pos, logoutLocation.x, logoutLocation.y, logoutLocation.z, true) < 1.5)then
                                DrawText3Ds(logoutLocation.x, logoutLocation.y, logoutLocation.z, '~g~E~w~ - logout')
                                if IsControlJustPressed(0, Keys["E"]) then
                                    DoScreenFadeOut(250)
                                    while not IsScreenFadedOut() do
                                        Citizen.Wait(10)
                                    end
                                    exports['ctrp-interior']:DespawnInterior(houseObj, function()
                                        TriggerEvent('ctrp-weathersync:client:EnableSync')
                                        SetEntityCoords(PlayerPedId(), Config.Houses[CurrentHouse].coords.enter.x, Config.Houses[CurrentHouse].coords.enter.y, Config.Houses[CurrentHouse].coords.enter.z + 0.5)
                                        SetEntityHeading(PlayerPedId(), Config.Houses[CurrentHouse].coords.enter.h)
                                        inOwned = false
                                        inside = false
                                        TriggerServerEvent('ctrp-houses:server:LogoutLocation')
                                    end)
                                end
                            elseif(GetDistanceBetweenCoords(pos, logoutLocation.x, logoutLocation.y, logoutLocation.z, true) < 3)then
                                DrawText3Ds(logoutLocation.x, logoutLocation.y, logoutLocation.z, 'logout')
                            end
                        end
                    end
                end
            end
        end
        if not inRange then
            Citizen.Wait(1500)
        end
    
        Citizen.Wait(7)
    end
end)

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(1)
        if inHoldersMenu then
            Menu.renderGUI()
        end
    end
end)

function openHouseAnim()
    loadAnimDict("anim@heists@keycard@") 
    TaskPlayAnim( PlayerPedId(), "anim@heists@keycard@", "exit", 5.0, 1.0, -1, 16, 0, 0, 0, 0 )
    Citizen.Wait(400)
    ClearPedTasks(PlayerPedId())
end

RegisterNetEvent('ctrp-houses:client:RingDoor')
AddEventHandler('ctrp-houses:client:RingDoor', function(player, house)
    if closesthouse == house and inside then
        CurrentDoorBell = player
        TriggerServerEvent("InteractSound_SV:PlayOnSource", "doorbell", 0.1)
        CTRPFW.Functions.Notify("Some one is ringing the door!")
    end
end)

function GetClosestPlayer()
    local closestPlayers = CTRPFW.Functions.GetPlayersFromCoords()
    local closestDistance = -1
    local closestPlayer = -1
    local coords = GetEntityCoords(PlayerPedId())

    for i=1, #closestPlayers, 1 do
        if closestPlayers[i] ~= PlayerId() then
            local pos = GetEntityCoords(GetPlayerPed(closestPlayers[i]))
            local distance = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, coords.x, coords.y, coords.z, true)

            if closestDistance == -1 or closestDistance > distance then
                closestPlayer = closestPlayers[i]
                closestDistance = distance
            end
        end
	end

	return closestPlayer, closestDistance
end

RegisterNetEvent('ctrp-houses:client:giveHouseKey')
AddEventHandler('ctrp-houses:client:giveHouseKey', function(data)
    local player, distance = GetClosestPlayer()
    if player ~= -1 and distance < 2.5 and closesthouse ~= nil then
        local playerId = GetPlayerServerId(player)
        local housedist = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), Config.Houses[closesthouse].coords.enter.x, Config.Houses[closesthouse].coords.enter.y, Config.Houses[closesthouse].coords.enter.z)
        
        if housedist < 10 then
            TriggerServerEvent('ctrp-houses:server:giveHouseKey', playerId, closesthouse)
        else
            CTRPFW.Functions.Notify("You'r not close enough to the door..", "error")
        end
    elseif closesthouse == nil then
        CTRPFW.Functions.Notify("There is no house near you", "error")
    else
        CTRPFW.Functions.Notify("No one around!", "error")
    end
end)

RegisterNetEvent('ctrp-houses:client:givetheHouseKeyonrent')
AddEventHandler('ctrp-houses:client:givetheHouseKeyonrent', function(playerid)
    local player, distance = GetClosestPlayer()
    if player ~= -1 and distance < 2.5 and closesthouse ~= nil then
        local housedist = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), Config.Houses[closesthouse].coords.enter.x, Config.Houses[closesthouse].coords.enter.y, Config.Houses[closesthouse].coords.enter.z)
        local playerId = GetPlayerServerId(player)
        if housedist < 10 then
            TriggerServerEvent('ctrp-houses:server:giveHouseKeyonrent', playerId, closesthouse)
        else
            CTRPFW.Functions.Notify("You'r not close enough to the door..", "error")
        end
    elseif closesthouse == nil then
        CTRPFW.Functions.Notify("There is no house near you", "error")
    else
        CTRPFW.Functions.Notify("No one around!", "error")
    end
end)

RegisterNetEvent('ctrp-houses:client:removeHouseKeyonrent')
AddEventHandler('ctrp-houses:client:removeHouseKeyonrent', function(data,playerid)
    if closesthouse ~= nil then 
        local housedist = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), Config.Houses[closesthouse].coords.enter.x, Config.Houses[closesthouse].coords.enter.y, Config.Houses[closesthouse].coords.enter.z)
        if housedist < 5 then
            CTRPFW.Functions.TriggerCallback('ctrp-houses:server:getHouseOwner', function(result)
                if CTRPFW.Functions.GetPlayerData().citizenid == result then
                    inHoldersMenu = true
                    HouseKeysMenu()
                    Menu.hidden = not Menu.hidden
                else
                    CTRPFW.Functions.Notify("You're not a house owner..", "error")
                end
            end, closesthouse)
        else
            CTRPFW.Functions.Notify("You'r not close enough to the door..", "error")
        end
    else
        CTRPFW.Functions.Notify("You'r not close enough to the door..", "error")
    end
end)


RegisterNetEvent('ctrp-houses:client:removeHouseKey')
AddEventHandler('ctrp-houses:client:removeHouseKey', function(data)
    if closesthouse ~= nil then 
        local housedist = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), Config.Houses[closesthouse].coords.enter.x, Config.Houses[closesthouse].coords.enter.y, Config.Houses[closesthouse].coords.enter.z)
        if housedist < 5 then
            CTRPFW.Functions.TriggerCallback('ctrp-houses:server:getHouseOwner', function(result)
                if CTRPFW.Functions.GetPlayerData().citizenid == result then
                    inHoldersMenu = true
                    HouseKeysMenu()
                    Menu.hidden = not Menu.hidden
                else
                    CTRPFW.Functions.Notify("You're not a house owner..", "error")
                end
            end, closesthouse)
        else
            CTRPFW.Functions.Notify("You'r not close enough to the door..", "error")
        end
    else
        CTRPFW.Functions.Notify("You'r not close enough to the door..", "error")
    end
end)

RegisterNetEvent('ctrp-houses:client:refreshHouse')
AddEventHandler('ctrp-houses:client:refreshHouse', function(data)
    Citizen.Wait(100)
    SetClosestHouse()
    --TriggerEvent('ctrp-garages:client:setHouseGarage', closesthouse, hasKey)
end)

RegisterNetEvent('ctrp-houses:client:SpawnInApartment')
AddEventHandler('ctrp-houses:client:SpawnInApartment', function(house)
    local pos = GetEntityCoords(PlayerPedId())
    if rangDoorbell ~= nil then
        if(GetDistanceBetweenCoords(pos, Config.Houses[house].coords.enter.x, Config.Houses[house].coords.enter.y, Config.Houses[house].coords.enter.z, true) > 5)then
            return
        end
    end
    closesthouse = house
    enterNonOwnedHouse(house)
end)

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end 

function HouseKeysMenu()
    ped = PlayerPedId();
    MenuTitle = "Sleutels"
    ClearMenu()
    CTRPFW.Functions.TriggerCallback('ctrp-houses:server:getHouseKeyHolders', function(holders)
        ped = PlayerPedId();
        MenuTitle = "Sleutelhouders:"
        ClearMenu()
        if holders == nil or next(holders) == nil then
            CTRPFW.Functions.Notify("No key holders found..", "error", 3500)
            closeMenuFull()
        else
            for k, v in pairs(holders) do
                Menu.addButton(holders[k].firstname .. " " .. holders[k].lastname, "optionMenu", holders[k]) 
            end
        end
        Menu.addButton("Close Menu", "closeMenuFull", nil) 
    end, closesthouse)
end

function changeOutfit()
	Wait(200)
    loadAnimDict("clothingshirt")    	
	TaskPlayAnim(PlayerPedId(), "clothingshirt", "try_shirt_positive_d", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
	Wait(3100)
	TaskPlayAnim(PlayerPedId(), "clothingshirt", "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
end

function optionMenu(citizenData)
    ped = PlayerPedId();
    MenuTitle = "What now?"
    ClearMenu()
    Menu.addButton("Remove key", "removeHouseKey", citizenData) 
    Menu.addButton("Back", "HouseKeysMenu",nil)
end

function removeHouseKey(citizenData)
    TriggerServerEvent('ctrp-houses:server:removeHouseKey', closesthouse, citizenData)
    closeMenuFull()
end

function removeOutfit(oData)
    TriggerServerEvent('clothes:removeOutfit', oData.outfitname)
    CTRPFW.Functions.Notify(oData.outfitname.." Is removed", "success", 2500)
    closeMenuFull()
end

function closeMenuFull()
    Menu.hidden = true
    currentGarage = nil
    inHoldersMenu = false
    ClearMenu()
end

function ClearMenu()
	--Menu = {}
	Menu.GUI = {}
	Menu.buttonCount = 0
	Menu.selection = 0
end

function openContract(bool)
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "toggle",
        status = bool,
    })
    contractOpen = bool
end

function enterOwnedHouse(house)
    CurrentHouse = house
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "houses_door_open", 0.25)
    openHouseAnim()
    inside = true
    Citizen.Wait(250)
    local coords = { x = Config.Houses[house].coords.enter.x, y = Config.Houses[house].coords.enter.y, z= Config.Houses[house].coords.enter.z - Config.MinZOffset}
    LoadDecorations(house)
    
    -- if Config.Houses[house].tier == 1 then
    --     data = exports['ctrp-interior']:CreateTier1House(coords)
    -- elseif Config.Houses[house].tier == 2 then
    --     data = exports['ctrp-interior']:CreateTrevorsShell(coords)
    -- elseif Config.Houses[house].tier == 3 then
    --     data = exports['ctrp-interior']:CreateMichaelShell(coords)
    -- elseif Config.Houses[house].tier == 4 then
    --     data = exports['ctrp-interior']:CreateApartmentShell(coords)
    -- elseif Config.Houses[house].tier == 5 then
    --     data = exports['ctrp-interior']:CreateCaravanShell(coords)
    -- elseif Config.Houses[house].tier == 6 then
    --     data = exports['ctrp-interior']:CreateFranklinShell(coords)
    -- elseif Config.Houses[house].tier == 7 then
    --     data = exports['ctrp-interior']:CreateFranklinAuntShell(coords)
    -- elseif Config.Houses[house].tier == 8 then
    --     data = exports['ctrp-interior']:CreateFuryShell01(coords)
    -- elseif Config.Houses[house].tier == 9 then
    --     data = exports['ctrp-interior']:CreateFuryShell02(coords)
    -- elseif Config.Houses[house].tier == 10 then
    --     data = exports['ctrp-interior']:CreateFuryShell03(coords)
    -- elseif Config.Houses[house].tier == 11 then
    --     data = exports['ctrp-interior']:CreateFuryShell05(coords)
    -- elseif Config.Houses[house].tier == 12 then
    --     data = exports['ctrp-interior']:CreateWarehouse(coords)
    -- end

    if Config.Houses[house].tier == 1 then
        data = exports['ctrp-interior']:CreateCaravanShell(coords)
    elseif Config.Houses[house].tier == 2 then
        data = exports['ctrp-interior']:CreateFuryShell01(coords)
    elseif Config.Houses[house].tier == 3 then
        data = exports['ctrp-interior']:CreateTier1House(coords)
    elseif Config.Houses[house].tier == 4 then
        data = exports['ctrp-interior']:CreateFuryShell05(coords)
    elseif Config.Houses[house].tier == 5 then
        data = exports['ctrp-interior']:CreateTrevorsShell(coords)
    elseif Config.Houses[house].tier == 6 then
        data = exports['ctrp-interior']:CreateApartmentShell(coords)
    elseif Config.Houses[house].tier == 7 then
        data = exports['ctrp-interior']:CreateFranklinAuntShell(coords)
    elseif Config.Houses[house].tier == 8 then
        data = exports['ctrp-interior']:CreateFranklinShell(coords)
    elseif Config.Houses[house].tier == 9 then
        data = exports['ctrp-interior']:CreateMichaelShell(coords)
    elseif Config.Houses[house].tier == 10 then
        data = exports['ctrp-interior']:CreateFuryShell02(coords)
    elseif Config.Houses[house].tier == 11 then
        data = exports['ctrp-interior']:CreateFuryShell03(coords)
    elseif Config.Houses[house].tier == 12 then
        data = exports['ctrp-interior']:CreateFuryShell04(coords)
    elseif Config.Houses[house].tier == 13 then
        data = exports['ctrp-interior']:CreateFuryShell06(coords)
    elseif Config.Houses[house].tier == 14 then
        data = exports['ctrp-interior']:CreateWarehouse(coords)
    end

    Citizen.Wait(100)
    houseObj = data[1]
    POIOffsets = data[2]
    print(POIOffsets)
    print(data[2])
    print(POIOffsets.exit.x)
    entering = true
    TriggerServerEvent('ctrp-houses:server:SetInsideMeta', house, true)
    Citizen.Wait(500)
    SetRainFxIntensity(0.0)
    TriggerEvent('ctrp-weathersync:client:DisableSync')
    TriggerEvent('ctrp-weed:client:getHousePlants', house)
    Citizen.Wait(100)
    SetWeatherTypePersist('EXTRASUNNY')
    SetWeatherTypeNow('EXTRASUNNY')
    SetWeatherTypeNowPersist('EXTRASUNNY')
    NetworkOverrideClockTime(23, 0, 0)
    entering = false
    setHouseLocations()
end

RegisterNetEvent('ctrp-houses:client:enterOwnedHouse')
AddEventHandler('ctrp-houses:client:enterOwnedHouse', function(house)
    CTRPFW.Functions.GetPlayerData(function(PlayerData)
		if PlayerData.metadata["injail"] == 0 then
			enterOwnedHouse(house)
		end
	end)
end)

RegisterNUICallback('HasEnoughMoney', function(data, cb)
    CTRPFW.Functions.TriggerCallback('ctrp-houses:server:HasEnoughMoney', function(hasEnough)
        
    end, data.objectData)
end)

RegisterNetEvent('ctrp-houses:client:LastLocationHouse')
AddEventHandler('ctrp-houses:client:LastLocationHouse', function(houseId)
    CTRPFW.Functions.GetPlayerData(function(PlayerData)
		if PlayerData.metadata["injail"] == 0 then
			enterOwnedHouse(houseId)
		end
	end)
end)

function leaveOwnedHouse(house)
    if not FrontCam then
        inside = false
        TriggerServerEvent("InteractSound_SV:PlayOnSource", "houses_door_open", 0.25)
        openHouseAnim()
        Citizen.Wait(250)
        DoScreenFadeOut(250)
        Citizen.Wait(500)
        exports['ctrp-interior']:DespawnInterior(houseObj, function()
            UnloadDecorations()
            TriggerEvent('ctrp-weathersync:client:EnableSync')
            Citizen.Wait(250)
            DoScreenFadeIn(250)
            SetEntityCoords(PlayerPedId(), Config.Houses[CurrentHouse].coords.enter.x, Config.Houses[CurrentHouse].coords.enter.y, Config.Houses[CurrentHouse].coords.enter.z + 0.2)
            SetEntityHeading(PlayerPedId(), Config.Houses[CurrentHouse].coords.enter.h)
            TriggerEvent('ctrp-weed:client:leaveHouse')
            TriggerServerEvent('ctrp-houses:server:SetInsideMeta', house, false)
            CurrentHouse = nil
        end)
    end
end

function enterNonOwnedHouse(house)
    CurrentHouse = house
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "houses_door_open", 0.25)
    openHouseAnim()
    inside = true
    Citizen.Wait(250)
    local coords = { x = Config.Houses[closesthouse].coords.enter.x, y = Config.Houses[closesthouse].coords.enter.y, z= Config.Houses[closesthouse].coords.enter.z - Config.MinZOffset}
    LoadDecorations(house)

    if Config.Houses[house].tier == 1 then
        data = exports['ctrp-interior']:CreateCaravanShell(coords)
    elseif Config.Houses[house].tier == 2 then
        data = exports['ctrp-interior']:CreateFuryShell01(coords)
    elseif Config.Houses[house].tier == 3 then
        data = exports['ctrp-interior']:CreateTier1House(coords)
    elseif Config.Houses[house].tier == 4 then
        data = exports['ctrp-interior']:CreateFuryShell05(coords)
    elseif Config.Houses[house].tier == 5 then
        data = exports['ctrp-interior']:CreateTrevorsShell(coords)
    elseif Config.Houses[house].tier == 6 then
        data = exports['ctrp-interior']:CreateApartmentShell(coords)
    elseif Config.Houses[house].tier == 7 then
        data = exports['ctrp-interior']:CreateFranklinAuntShell(coords)
    elseif Config.Houses[house].tier == 8 then
        data = exports['ctrp-interior']:CreateFranklinShell(coords)
    elseif Config.Houses[house].tier == 9 then
        data = exports['ctrp-interior']:CreateMichaelShell(coords)
    elseif Config.Houses[house].tier == 10 then
        data = exports['ctrp-interior']:CreateFuryShell02(coords)
    elseif Config.Houses[house].tier == 11 then
        data = exports['ctrp-interior']:CreateFuryShell03(coords)
    elseif Config.Houses[house].tier == 12 then
        data = exports['ctrp-interior']:CreateFuryShell04(coords)
    elseif Config.Houses[house].tier == 13 then
        data = exports['ctrp-interior']:CreateFuryShell06(coords)
    elseif Config.Houses[house].tier == 14 then
        data = exports['ctrp-interior']:CreateWarehouse(coords)
    end

    houseObj = data[1]
    POIOffsets = data[2]
    entering = true
    Citizen.Wait(500)
    SetRainFxIntensity(0.0)
    TriggerServerEvent('ctrp-houses:server:SetInsideMeta', house, true)
    TriggerEvent('ctrp-weathersync:client:DisableSync')
    TriggerEvent('ctrp-weed:client:getHousePlants', house)
    Citizen.Wait(100)
    SetWeatherTypePersist('EXTRASUNNY')
    SetWeatherTypeNow('EXTRASUNNY')
    SetWeatherTypeNowPersist('EXTRASUNNY')
    NetworkOverrideClockTime(23, 0, 0)
    entering = false
    inOwned = true
    setHouseLocations()
end

function leaveNonOwnedHouse(house)
    if not FrontCam then
        inside = false
        TriggerServerEvent("InteractSound_SV:PlayOnSource", "houses_door_open", 0.25)
        openHouseAnim()
        Citizen.Wait(250)
        DoScreenFadeOut(250)
        Citizen.Wait(500)
        exports['ctrp-interior']:DespawnInterior(houseObj, function()
            UnloadDecorations()
            TriggerEvent('ctrp-weathersync:client:EnableSync')
            Citizen.Wait(250)
            DoScreenFadeIn(250)
            SetEntityCoords(PlayerPedId(), Config.Houses[CurrentHouse].coords.enter.x, Config.Houses[CurrentHouse].coords.enter.y, Config.Houses[CurrentHouse].coords.enter.z + 0.2)
            SetEntityHeading(PlayerPedId(), Config.Houses[CurrentHouse].coords.enter.h)
            inOwned = false
            TriggerEvent('ctrp-weed:client:leaveHouse')
            TriggerServerEvent('ctrp-houses:server:SetInsideMeta', house, false)
            CurrentHouse = nil
        end)
    end
end

RegisterNetEvent('ctrp-houses:client:setupHouseBlips')
AddEventHandler('ctrp-houses:client:setupHouseBlips', function()
    Citizen.CreateThread(function()
        Citizen.Wait(2000)
        if isLoggedIn then
            CTRPFW.Functions.TriggerCallback('ctrp-houses:server:getOwnedHouses', function(ownedHouses)
                if ownedHouses ~= nil then
                    for k, v in pairs(ownedHouses) do
                        local house = Config.Houses[ownedHouses[k]]
                        HouseBlip = AddBlipForCoord(house.coords.enter.x, house.coords.enter.y, house.coords.enter.z)

                        SetBlipSprite (HouseBlip, 40)
                        SetBlipDisplay(HouseBlip, 4)
                        SetBlipScale  (HouseBlip, 0.65)
                        SetBlipAsShortRange(HouseBlip, true)
                        SetBlipColour(HouseBlip, 3)

                        BeginTextCommandSetBlipName("STRING")
                        AddTextComponentSubstringPlayerName(house.adress)
                        EndTextCommandSetBlipName(HouseBlip)

                        table.insert(OwnedHouseBlips, HouseBlip)
                    end
                end
            end)
        end
    end)
end)

RegisterNetEvent('ctrp-houses:client:SetClosestHouse')
AddEventHandler('ctrp-houses:client:SetClosestHouse', function()
    SetClosestHouse()
end)

function setViewCam(coords, h, yaw)
    cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", coords.x, coords.y, coords.z, yaw, 0.00, h, 80.00, false, 0)
    SetCamActive(cam, true)
    RenderScriptCams(true, true, 500, true, true)
    viewCam = true
end

function FrontDoorCam(coords)
    DoScreenFadeOut(150)
    Citizen.Wait(500)
    cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", coords.x, coords.y, coords.z + 0.5, 0.0, 0.00, coords.h - 180, 80.00, false, 0)
    SetCamActive(cam, true)
    RenderScriptCams(true, true, 500, true, true)
    FrontCam = true
    FreezeEntityPosition(PlayerPedId(), true)
    Citizen.Wait(500)
    DoScreenFadeIn(150)
    SendNUIMessage({
        type = "frontcam",
        toggle = true,
        label = Config.Houses[closesthouse].adress
    })
    Citizen.CreateThread(function()
        while FrontCam do

            local instructions = CreateInstuctionScaleform("instructional_buttons")
            DrawScaleformMovieFullscreen(instructions, 255, 255, 255, 255, 0)
            SetTimecycleModifier("scanline_cam_cheap")
            SetTimecycleModifierStrength(1.0)

            if IsControlJustPressed(1, Keys["BACKSPACE"]) then
                DoScreenFadeOut(150)
                SendNUIMessage({
                    type = "frontcam",
                    toggle = false,
                })
                Citizen.Wait(500)
                RenderScriptCams(false, true, 500, true, true)
                FreezeEntityPosition(PlayerPedId(), false)
                SetCamActive(cam, false)
                DestroyCam(cam, true)
                ClearTimecycleModifier("scanline_cam_cheap")
                cam = nil
                FrontCam = false
                Citizen.Wait(500)
                DoScreenFadeIn(150)
            end

            local getCameraRot = GetCamRot(cam, 2)

            -- ROTATE UP
            if IsControlPressed(0, Keys["W"]) then
                if getCameraRot.x <= 0.0 then
                    SetCamRot(cam, getCameraRot.x + 0.7, 0.0, getCameraRot.z, 2)
                end
            end

            -- ROTATE DOWN
            if IsControlPressed(0, Keys["S"]) then
                if getCameraRot.x >= -50.0 then
                    SetCamRot(cam, getCameraRot.x - 0.7, 0.0, getCameraRot.z, 2)
                end
            end

            -- ROTATE LEFT
            if IsControlPressed(0, Keys["A"]) then
                SetCamRot(cam, getCameraRot.x, 0.0, getCameraRot.z + 0.7, 2)
            end

            -- ROTATE RIGHT
            if IsControlPressed(0, Keys["D"]) then
                SetCamRot(cam, getCameraRot.x, 0.0, getCameraRot.z - 0.7, 2)
            end

            Citizen.Wait(1)
        end
    end)
end

function CreateInstuctionScaleform(scaleform)
    local scaleform = RequestScaleformMovie(scaleform)
    while not HasScaleformMovieLoaded(scaleform) do
        Citizen.Wait(0)
    end
    PushScaleformMovieFunction(scaleform, "CLEAR_ALL")
    PopScaleformMovieFunctionVoid()
    
    PushScaleformMovieFunction(scaleform, "SET_CLEAR_SPACE")
    PushScaleformMovieFunctionParameterInt(200)
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(1)
    InstructionButton(GetControlInstructionalButton(1, 194, true))
    InstructionButtonMessage("Close Camera")
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "DRAW_INSTRUCTIONAL_BUTTONS")
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "SET_BACKGROUND_COLOUR")
    PushScaleformMovieFunctionParameterInt(0)
    PushScaleformMovieFunctionParameterInt(0)
    PushScaleformMovieFunctionParameterInt(0)
    PushScaleformMovieFunctionParameterInt(80)
    PopScaleformMovieFunctionVoid()

    return scaleform
end

function InstructionButton(ControlButton)
    N_0xe83a3e3557a56640(ControlButton)
end

function InstructionButtonMessage(text)
    BeginTextCommandScaleformString("STRING")
    AddTextComponentScaleform(text)
    EndTextCommandScaleformString()
end

function disableViewCam()
    if viewCam then
        RenderScriptCams(false, true, 500, true, true)
        SetCamActive(cam, false)
        DestroyCam(cam, true)
        viewCam = false
    end
end

RegisterNUICallback('buy', function()
    openContract(false)
    disableViewCam()
    TriggerServerEvent('ctrp-houses:server:buyHouse', closesthouse)
end)

RegisterNUICallback('rent', function()
    openContract(false)
    disableViewCam()
    TriggerServerEvent('ctrp-houses:server:rentHouse', closesthouse)
end)

RegisterNUICallback('exit', function()
    openContract(false)
    disableViewCam()
end)

RegisterNetEvent('ctrp-houses:client:ownthishouse')
AddEventHandler('ctrp-houses:client:ownthishouse', function(street, id)

    TriggerServerEvent('ctrp-houses:server:buyHouse', closesthouse, id)
    CTRPFW.Functions.Notify('You are owner of the house : '..street.. ' ', 'success', 5000)

end)

RegisterNetEvent('ctrp-houses:client:transferthishouse')
AddEventHandler('ctrp-houses:client:transferthishouse', function(street, housenumber , playerid , id)

    TriggerServerEvent('ctrp-houses:server:transferthishouse', closesthouse, housenumber , playerid, id)
    CTRPFW.Functions.Notify('You have transfered the house : '..street.. ' ', 'success', 5000)

end)

--[[RegisterNetEvent('ctrp-houses:client:viewHouse')
AddEventHandler('ctrp-houses:client:viewHouse', function(houseprice, brokerfee, bankfee, taxes, firstname, lastname)
    setViewCam(Config.Houses[closesthouse].coords.cam, Config.Houses[closesthouse].coords.cam.h, Config.Houses[closesthouse].coords.yaw)
    Citizen.Wait(500)
    openContract(true)
    SendNUIMessage({
        type = "setupContract",
        firstname = firstname,
        lastname = lastname,
        street = Config.Houses[closesthouse].adress,
        houseprice = houseprice,
        brokerfee = brokerfee,
        bankfee = bankfee,
        taxes = taxes,
        totalprice = (houseprice + brokerfee + bankfee + taxes)
    })
end)]]

RegisterNetEvent('ctrp-houses:client:viewHouse')
AddEventHandler('ctrp-houses:client:viewHouse', function(realestate, contact,estimateamount, firstname, lastname)
    setViewCam(Config.Houses[closesthouse].coords.cam, Config.Houses[closesthouse].coords.cam.h, Config.Houses[closesthouse].coords.yaw)
    Citizen.Wait(500)
    openContract(true)
    SendNUIMessage({
        type = "setupContract",
        firstname = firstname,
        lastname = lastname,
        street = Config.Houses[closesthouse].adress,
        --[[houseprice = 'lol',
        brokerfee = brokerfee,
        bankfee = bankfee,
        taxes = 'lol',
        totalprice = (houseprice + brokerfee + bankfee + taxes)
        totalprice = 'lol',
        rentprice = 'lol',
        insttime = 'lol']]
        realestate = realestate,
        contact = contact,
        estimateamount = estimateamount
    })
end)

function SetClosestHouse()
    local pos = GetEntityCoords(PlayerPedId(), true)
    local current = nil
    local dist = nil
    if not inside then
        for id, house in pairs(Config.Houses) do
            if current ~= nil then
                if(GetDistanceBetweenCoords(pos, Config.Houses[id].coords.enter.x, Config.Houses[id].coords.enter.y, Config.Houses[id].coords.enter.z, true) < dist)then
                    current = id
                    dist = GetDistanceBetweenCoords(pos, Config.Houses[id].coords.enter.x, Config.Houses[id].coords.enter.y, Config.Houses[id].coords.enter.z, true)
                end
            else
                dist = GetDistanceBetweenCoords(pos, Config.Houses[id].coords.enter.x, Config.Houses[id].coords.enter.y, Config.Houses[id].coords.enter.z, true)
                current = id
            end
        end
        closesthouse = current
    
        if closesthouse ~= nil then 
            CTRPFW.Functions.TriggerCallback('ctrp-houses:server:hasKey', function(result)
                hasKey = result
            end, closesthouse)
        
            CTRPFW.Functions.TriggerCallback('ctrp-houses:server:isOwned', function(result)
                isOwned = result
            end, closesthouse)
        end
    end
    TriggerEvent('ctrp-garages:client:setHouseGarage', closesthouse, hasKey)
end

function setHouseLocations()
    if closesthouse ~= nil then
        CTRPFW.Functions.TriggerCallback('ctrp-houses:server:getHouseLocations', function(result)
            if result ~= nil then
                if result.stash ~= nil then
                    stashLocation = json.decode(result.stash)
                end

                if result.cupboard ~= nil then
                    cupboardLocation = json.decode(result.cupboard)
                end

                if result.outfit ~= nil then
                    outfitLocation = json.decode(result.outfit)
                end

                if result.logout ~= nil then
                    logoutLocation = json.decode(result.logout)
                end
            end
        end, closesthouse)
    end
end

RegisterNetEvent('ctrp-houses:client:setLocation')
AddEventHandler('ctrp-houses:client:setLocation', function(data)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    local coords = {x = pos.x, y = pos.y, z = pos.z}

    if inside then
        if hasKey then
            if data.id == 'setstash' then
                TriggerServerEvent('ctrp-houses:server:setLocation', coords, closesthouse, 1)
            elseif data.id == 'setoutift' then
                TriggerServerEvent('ctrp-houses:server:setLocation', coords, closesthouse, 2)
            elseif data.id == 'setlogout' then
                TriggerServerEvent('ctrp-houses:server:setLocation', coords, closesthouse, 3)
            elseif data.id == 'setcupboard' then
                TriggerServerEvent('ctrp-houses:server:setLocation', coords, closesthouse, 4)
            end
        else
            CTRPFW.Functions.Notify('You do not own the house..', 'error')
        end
    else    
        CTRPFW.Functions.Notify('You are not in a house..', 'error')
    end
end)

RegisterNetEvent('ctrp-houses:client:refreshLocations')
AddEventHandler('ctrp-houses:client:refreshLocations', function(house, location, type)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)

    if closesthouse == house then
        if inside then
            if type == 1 then
                stashLocation = json.decode(location)
            elseif type == 2 then
                outfitLocation = json.decode(location)
            elseif type == 3 then
                logoutLocation = json.decode(location)
            elseif type == 4 then
                cupboardLocation = json.decode(location)
            end
        end
    end
end)

local RamsDone = 0

function DoRamAnimation(bool)
    local ped = PlayerPedId()
    local dict = "missheistfbi3b_ig7"
    local anim = "lift_fibagent_loop"

    if bool then
        RequestAnimDict(dict)
        while not HasAnimDictLoaded(dict) do
            Citizen.Wait(1)
        end
        TaskPlayAnim(ped, dict, anim, 8.0, 8.0, -1, 1, -1, false, false, false)
    else
        RequestAnimDict(dict)
        while not HasAnimDictLoaded(dict) do
            Citizen.Wait(1)
        end
        TaskPlayAnim(ped, dict, "exit", 8.0, 8.0, -1, 1, -1, false, false, false)
    end
end

RegisterNetEvent('ctrp-houses:client:HomeInvasion')
AddEventHandler('ctrp-houses:client:HomeInvasion', function()
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    local Skillbar = exports['ctrp-skillbar']:GetSkillbarObject()

    if closesthouse ~= nil then
      
                local dist = GetDistanceBetweenCoords(pos, Config.Houses[closesthouse].coords.enter.x, Config.Houses[closesthouse].coords.enter.y, Config.Houses[closesthouse].coords.enter.z, true)
                if Config.Houses[closesthouse].IsRaming == nil then
                    Config.Houses[closesthouse].IsRaming = false
                end
        
                if dist < 1 then
                    if Config.Houses[closesthouse].locked then
                        if not Config.Houses[closesthouse].IsRaming then
                            DoRamAnimation(true)
                            Skillbar.Start({
                                duration = math.random(5000, 10000),
                                pos = math.random(10, 30),
                                width = math.random(10, 20),
                            }, function()
                                if RamsDone + 1 >= Config.RamsNeeded then
                                    TriggerServerEvent('ctrp-houses:server:lockHouse', false, closesthouse)
                                    CTRPFW.Functions.Notify('It worked the door is now out.', 'success')
                                    TriggerServerEvent('ctrp-houses:server:SetHouseRammed', true, closesthouse)
                                    DoRamAnimation(false)
                                else
                                    DoRamAnimation(true)
                                    Skillbar.Repeat({
                                        duration = math.random(500, 1000),
                                        pos = math.random(10, 30),
                                        width = math.random(5, 12),
                                    })
                                    RamsDone = RamsDone + 1
                                end
                            end, function()
                                RamsDone = 0
                                TriggerServerEvent('ctrp-houses:server:SetRamState', false, closesthouse)
                                CTRPFW.Functions.Notify('It failed try again.', 'error')
                                DoRamAnimation(false)
                            end)
                            TriggerServerEvent('ctrp-houses:server:SetRamState', true, closesthouse)
                        else
                            CTRPFW.Functions.Notify('Someone is already working on the door..', 'error')
                        end
                    else
                        CTRPFW.Functions.Notify('19/5000 This house is already open..', 'error')
                    end
                else
                    CTRPFW.Functions.Notify('You\'re not near a house..', 'error')
                end

    else
        CTRPFW.Functions.Notify('You\'re not near a house..', 'error')
    end
end)

RegisterNetEvent('ctrp-houses:client:SetRamState')
AddEventHandler('ctrp-houses:client:SetRamState', function(bool, house)
    Config.Houses[house].IsRaming = bool
end)

RegisterNetEvent('ctrp-houses:client:SetHouseRammed')
AddEventHandler('ctrp-houses:client:SetHouseRammed', function(bool, house)
    Config.Houses[house].IsRammed = bool
end)

RegisterNetEvent('ctrp-houses:client:ResetHouse')
AddEventHandler('ctrp-houses:client:ResetHouse', function()
    local ped = PlayerPedId()

    if closesthouse ~= nil then
        if Config.Houses[closesthouse].IsRammed == nil then
            Config.Houses[closesthouse].IsRammed = false
            TriggerServerEvent('ctrp-houses:server:SetHouseRammed', false, closesthouse)
            TriggerServerEvent('ctrp-houses:server:SetRamState', false, closesthouse)
        end
        if Config.Houses[closesthouse].IsRammed then
            openHouseAnim()
            TriggerServerEvent('ctrp-houses:server:SetHouseRammed', false, closesthouse)
            TriggerServerEvent('ctrp-houses:server:SetRamState', false, closesthouse)
            TriggerServerEvent('ctrp-houses:server:lockHouse', true, closesthouse)
            RamsDone = 0
            CTRPFW.Functions.Notify('You locked the house again..', 'success')
        else
            CTRPFW.Functions.Notify('This door is not broken open  ..', 'error')
        end
    end
end)

RegisterNetEvent('virus-pethouse:spawnpetz')
AddEventHandler('virus-pethouse:spawnpetz', function()
    CTRPFW.Functions.TriggerCallback('CTRPFW:HasItem', function(result)
        if result then
            if closesthouse ~= nil then 
                local housedist = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), Config.Houses[closesthouse].coords.enter.x, Config.Houses[closesthouse].coords.enter.y, Config.Houses[closesthouse].coords.enter.z)
                if housedist < 8 then
                    CTRPFW.Functions.TriggerCallback('ctrp-houses:server:getHouseOwner', function(result)
                        if CTRPFW.Functions.GetPlayerData().citizenid == result then
                            TriggerServerEvent('virus-pethouse:spawnpet')
                        else
                            CTRPFW.Functions.Notify("You're not a house owner..", "error")
                        end
                    end, closesthouse)
                else
                    CTRPFW.Functions.Notify("You'r not close enough to the house.", "error")
                end
            else
                CTRPFW.Functions.Notify("You'r not close enough to the house..", "error")
            end
	        
        else
            CTRPFW.Functions.Notify("You Don't have Pet License!", "error")
        end
    end, 'petlicense')
end)

RegisterNetEvent('virus-houses:mail')
AddEventHandler('virus-houses:mail', function(hnumber , house , rentPayment)


    TriggerServerEvent('ctrp-phone:server:sendNewMail', {
        sender = "House Rent",
        subject = "Report",
        message = "Hi sir/mam , <br><br> Your House Plate : <strong>"..hnumber.. " | Location : " ..house.. "</strong> rent not settled yet! <br>Your Rent amount <strong> $ "..rentPayment.. "</strong> is left to be paid . Kindly pay by <strong>/payrent</strong> else we will seize your house <br><br> Real Estate",
        button = {}
    })
end)

RegisterNetEvent('virus-houses:paidmail')
AddEventHandler('virus-houses:paidmail', function(hnumber , house , rentPayment)


    TriggerServerEvent('ctrp-phone:server:sendNewMail', {
        sender = "House Rent",
        subject = "Receipt",
        message = "Hi sir/mam , <br><br> Your House Plate : <strong>"..hnumber.. " | Location : " ..house.. "</strong> whose Rent amount was <strong> $ "..rentPayment.. "</strong> is paid! . To check next Payment details , check on House app. To Pay full do <strong>/payfullrent</strong>. <br><br> Real Estate",
        button = {}
    })
end)

RegisterNetEvent('ctrp-houses:client:checkhouse')
AddEventHandler('ctrp-houses:client:checkhouse', function()
    TriggerServerEvent('ctrp-houses:server:viewHouse', closesthouse)
end)


RegisterNetEvent('ctrp-houses:client:payrent')
AddEventHandler('ctrp-houses:client:payrent', function()
    TriggerServerEvent('ctrp-houses:PayRent')
end)

RegisterNetEvent('ctrp-houses:client:cRent')
AddEventHandler('ctrp-houses:client:cRent', function()
    TriggerServerEvent('ctrp-houses:CheckRent')
end)


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

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(7)
        local inRange = false
        if isLoggedIn and CTRPFW ~= nil then
            local pos = GetEntityCoords(PlayerPedId())
            if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["main1"].coords.x, Config.Locations["main1"].coords.y, Config.Locations["main1"].coords.z, true) < 1.5 or GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["inside"].coords.x, Config.Locations["inside"].coords.y, Config.Locations["inside"].coords.z, true) < 1.5 then
                inRange = true
                if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["main1"].coords.x, Config.Locations["main1"].coords.y, Config.Locations["main1"].coords.z, true) < 1.5) then
                    DrawText3D(Config.Locations["main1"].coords.x, Config.Locations["main1"].coords.y, Config.Locations["main1"].coords.z, "~g~E~w~ - To Enter Real Estate Office")
                    if IsControlJustReleased(0, Keys["E"]) then
                        DoScreenFadeOut(500)
                        while not IsScreenFadedOut() do
                            Citizen.Wait(10)
                        end
    
                        SetEntityCoords(PlayerPedId(), Config.Locations["inside"].coords.x, Config.Locations["inside"].coords.y, Config.Locations["inside"].coords.z, 0, 0, 0, false)
                        SetEntityHeading(PlayerPedId(), Config.Locations["inside"].coords.h)
    
                        Citizen.Wait(100)
    
                        DoScreenFadeIn(1000)
                    end
                elseif (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["inside"].coords.x, Config.Locations["inside"].coords.y, Config.Locations["inside"].coords.z, true) < 1.5) then
                    DrawText3D(Config.Locations["inside"].coords.x, Config.Locations["inside"].coords.y, Config.Locations["inside"].coords.z, "~g~E~w~ - To go outside")
                    if IsControlJustReleased(0, Keys["E"]) then
                        DoScreenFadeOut(500)
                        while not IsScreenFadedOut() do
                            Citizen.Wait(10)
                        end
    
                        SetEntityCoords(PlayerPedId(), Config.Locations["outside"].coords.x, Config.Locations["outside"].coords.y, Config.Locations["outside"].coords.z, 0, 0, 0, false)
                        SetEntityHeading(PlayerPedId(), Config.Locations["outside"].coords.h)
    
                        Citizen.Wait(100)
    
                        DoScreenFadeIn(1000)
                    end
                end 
            end
        end
        if not inRange then
            Citizen.Wait(2500)
        end
    end
end)


local blips = {

    {title="Real Estate", colour=0, id=375, x = -117.04, y = -604.8, z = 36.28},
 }

Citizen.CreateThread(function()

   for _, info in pairs(blips) do
     info.blip = AddBlipForCoord(info.x, info.y, info.z)
     SetBlipSprite(info.blip, info.id)
     SetBlipDisplay(info.blip, 4)
     SetBlipScale(info.blip, 0.8)
     SetBlipColour(info.blip, 1)
     SetBlipAsShortRange(info.blip, true)
     BeginTextCommandSetBlipName("STRING")
     AddTextComponentString(info.title)
     EndTextCommandSetBlipName(info.blip)
   end
end)

RegisterNetEvent('virus-pethouse:spawnpetz')
AddEventHandler('virus-pethouse:spawnpetz', function()
    CTRPFW.Functions.TriggerCallback('CTRPFW:HasItem', function(result)
        if result then
            if closesthouse ~= nil then 
                local housedist = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), Config.Houses[closesthouse].coords.enter.x, Config.Houses[closesthouse].coords.enter.y, Config.Houses[closesthouse].coords.enter.z)
                if housedist < 10 then
                    CTRPFW.Functions.TriggerCallback('ctrp-houses:server:getHouseOwner', function(result)
                        if CTRPFW.Functions.GetPlayerData().citizenid == result then
                            TriggerServerEvent('virus-pethouse:spawnpet')
                        else
                            CTRPFW.Functions.Notify("You're not a house owner..", "error")
                        end
                    end, closesthouse)
                else
                    CTRPFW.Functions.Notify("You'r not close enough to the house.", "error")
                end
            else
                CTRPFW.Functions.Notify("You'r not close enough to the house..", "error")
            end
	        
        else
            CTRPFW.Functions.Notify("You Don't have Pet License!", "error")
        end
    end, 'petlicense')
end)




