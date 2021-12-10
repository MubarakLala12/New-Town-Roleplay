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

-- code

local isLoggedIn = false 

RegisterNetEvent('CTRPFW:Client:OnPlayerLoaded')
AddEventHandler('CTRPFW:Client:OnPlayerLoaded', function()
    isLoggedIn = true
end)


local InCasinoPage = false
local VirusCasino = {}

VirusCasino.Open = function()
    SendNUIMessage({
        action = "open"
    })
    SetNuiFocus(true, true)
    InCasinoPage = true
end

VirusCasino.Close = function()
    SendNUIMessage({
        action = "close"
    })
    SetNuiFocus(false, false)
    InCasinoPage = false
end

RegisterNUICallback('close', function()
    SetNuiFocus(false, false)
    InCasinoPage = false
end)


Citizen.CreateThread(function()
    while true do
        local InRange = false
        local PlayerPed = GetPlayerPed(-1)
        local PlayerPos = GetEntityCoords(PlayerPed)

            local dist = GetDistanceBetweenCoords(PlayerPos, 1116.03, 219.99, -49.44)
            if dist < 10 then
                InRange = true
                DrawMarker(2, 1116.03, 219.99, -49.44, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.25, 0.2, 0.1, 255, 0, 0, 155, 0, 0, 0, 1, 0, 0, 0)
                if dist < 1 then
                    DrawText3Ds(1116.03, 219.99, -49.44 + 0.15, '~g~E~w~ - Sell chips')
                    if IsControlJustPressed(0, Config.Keys["E"]) then
                        TriggerServerEvent('ctrp-casino:sharlock:sell')
                    end
                end
            end
            local dist2 = GetDistanceBetweenCoords(PlayerPos, 1087.14, 219.61, -49.2)
            if dist2 < 10 then
                InRange = true
                DrawMarker(2, 1087.14, 219.61, -49.2, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.25, 0.2, 0.1, 255, 0, 0, 155, 0, 0, 0, 1, 0, 0, 0)
                if dist2 < 1 then
                    DrawText3Ds(1087.14, 219.61, -49.2 + 0.15, '~g~E~w~ - Buy Membership')
                    if IsControlJustPressed(0, Config.Keys["E"]) then
                        --TriggerServerEvent('ctrp-casino:server:virusmembership')
                        TriggerServerEvent("InteractSound_SV:PlayOnSource", "casinowelcome", 0.8)
                        VirusCasino.Open()
                    end
                end
            end

            local dist3 = GetDistanceBetweenCoords(PlayerPos, 1111.42, 208.14, -49.44)
            if dist3 < 10 then
                InRange = true
                DrawMarker(2, 1111.42, 208.14, -49.44, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.25, 0.2, 0.1, 255, 0, 0, 155, 0, 0, 0, 1, 0, 0, 0)
                if dist3 < 5 then
                    DrawText3Ds(1111.42, 208.14, -49.44 + 0.15, '~g~E~w~ - Buy Drinks')
                    if IsControlJustPressed(0, Config.Keys["E"]) then
                        CTRPFW.Functions.TriggerCallback('CTRPFW:HasItem', function(result)
                            if result then
                                TriggerServerEvent("inventory:server:OpenInventory", "shop", 'casino', Config.casinoShops)
                            else
                                CTRPFW.Functions.Notify("You don't have casino membership", "error")
                            end
                        
                        end, 'casinomembership')
                    end
                end
            end

            --[[local dist4 = GetDistanceBetweenCoords(PlayerPos, 1142.05, 263.9, -51.84)
            if dist4 < 10 then
                InRange = true
                DrawMarker(2, 1142.05, 263.9, -51.84, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.25, 0.2, 0.1, 255, 0, 0, 155, 0, 0, 0, 1, 0, 0, 0)
                if dist4 < 5 then
                    DrawText3Ds(1142.05, 263.9, -51.84 + 0.15, '~g~E~w~ - Play roulette')
                    if IsControlJustPressed(0, Config.Keys["E"]) then
                        print('working')
					    TriggerEvent('virus-roulette:start')
                        
                        
                    end
                end
            end]]

            

        if not InRange then
            Citizen.Wait(5000)
        end
        Citizen.Wait(5)
    end
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

local idTypes = {
    ["casinomembership"] = {
        label = "Casino Membership",
        item = "casinomembership"
    }
    
}

RegisterNUICallback('requestId', function(data)
    local idType = data.idType

    TriggerServerEvent('ctrp-casino:server:virusmembership')
    --CTRPFW.Functions.Notify('U got your '..idTypes[idType].label..' for $2000', 'success', 3500)
        
    
end)

RegisterNUICallback('requestLicenses', function(data, cb)
    local PlayerData = CTRPFW.Functions.GetPlayerData()
    
    local availableLicenses = {}
    
    cb(availableLicenses)
end)


