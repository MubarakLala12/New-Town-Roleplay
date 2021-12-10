CTRPFW = nil
InBank = false
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        if CTRPFW == nil then
            TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)
            Citizen.Wait(200)
        end
    end
end)

playerData, playerLoaded = nil, false
local banks
blips = {}
local showing = false

RegisterNetEvent('CTRPFW:Client:OnPlayerLoaded')
AddEventHandler('CTRPFW:Client:OnPlayerLoaded', function(data)
    CTRPFW.Functions.TriggerCallback('virus-banking:server:requestBanks', function(banksdata)
        banks = banksdata
        playerData = data
        playerLoaded = true
        createBlips()
        if showing then
            showing = false
        end

        TriggerEvent("debug", 'Banking: Refresh Banks', 'success')
    end)
end)

RegisterCommand('refreshBanks', function()
    CTRPFW.Functions.TriggerCallback('virus-banking:server:requestBanks', function(banksdata)
        banks = banksdata
        playerLoaded = true
        createBlips()
        if showing then
            showing = false
        end

        TriggerEvent("debug", 'Banking: Refresh Banks', 'success')
    end)
end, "god")

RegisterNetEvent('CTRPFW:Client:OnPlayerUnload')
AddEventHandler('CTRPFW:Client:OnPlayerUnload', function()
    playerLoaded = false
    playerData = nil
    banks = nil
    removeBlips()
    if showing then
        showing = false
    end
end)

RegisterNetEvent('virus-banking:client:syncBanks')
AddEventHandler('virus-banking:client:syncBanks', function(data)
    banks = data
    if showing then
        showing = false
    end
end)

RegisterNetEvent('virus-banking:updateCash')
AddEventHandler('virus-banking:updateCash', function(data)
    if playerLoaded and playerData then
        playerData.cash = data
        currentCash = playerData.cash
    end
end)

function createBlips()
    for k, v in pairs(banks) do
        blips[k] = AddBlipForCoord(tonumber(v.x), tonumber(v.y), tonumber(v.z))
        SetBlipSprite(blips[k], Config.Blip.blipType)
        SetBlipDisplay(blips[k], 4)
        SetBlipScale  (blips[k], 0.6)
        SetBlipColour (blips[k], Config.Blip.blipColor)
        SetBlipAsShortRange(blips[k], true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(tostring(Config.Blip.blipName))
        EndTextCommandSetBlipName(blips[k])
    end
end

function removeBlips()
    for k, v in pairs(blips) do
        RemoveBlip(v)
    end
    blips = {}
end

function openAccountScreen()
    CTRPFW.Functions.TriggerCallback('virus-banking:getBankingInformation', function(banking)
        if banking ~= nil then
            --TriggerServerEvent("InteractSound_SV:PlayOnSource", "wmaze", 0.3)
            InBank = true
            SetNuiFocus(true, true)
            SendNUIMessage({
                status = "openbank",
                information = banking
            })

            TriggerEvent("debug", 'Banking: Open UI', 'success')
        end        
    end)
end

function atmRefresh()
    CTRPFW.Functions.TriggerCallback('virus-banking:getBankingInformation', function(infor)
        InBank = true
        SetNuiFocus(true, true)
        SendNUIMessage({
            status = "refreshatm",
            information = infor
        })
    end)
end

RegisterNetEvent('virus-banking:openBankScreen')
AddEventHandler('virus-banking:openBankScreen', function()
    openAccountScreen()
end)

RegisterNetEvent('virus-banking:client:usedMoneyBag')
AddEventHandler('virus-banking:client:usedMoneyBag', function(item)
    local playerCoords = GetEntityCoords(PlayerPedId())
    for k, v in pairs(banks) do 
        if v.bankType == "Paleto" and v.moneyBags ~= nil and v.bankOpen then
            local moneyBagDist = #(playerCoords - vector3(v.moneyBags.x, v.moneyBags.y, v.moneyBags.z))
            if moneyBagDist < 1.0 then
                CTRPFW.Functions.Progressbar("accessing_atm", "Cashier Counting Bag..", 60000, false, true, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {}, {}, {}, function() -- Done
                    TriggerServerEvent('virus-banking:server:unpackMoneyBag', item)
                end, function()
                    CTRPFW.Functions.Notify("Failed!", "error")
                end)
            end
        end
    end
end)

local letSleep = true
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        letSleep = true
        if playerLoaded and CTRPFW ~= nil and not InBank then 
            local playerPed = GetPlayerPed(-1)
            local playerCoords = GetEntityCoords(playerPed, true)
            if banks ~= nil then
                for k, v in pairs(banks) do 
                    local bankDist = #(playerCoords - vector3(v.x, v.y, v.z))
                    if bankDist < 3.0 then
                        letSleep = false

                        DrawMarker(2, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.2, 0.1, 55, 255, 55, 255, 0, 0, 0, 1, 0, 0, 0)

                        if v.bankType == "Paleto" and v.moneyBags ~= nil then
                            local moneyBagDist = #(playerCoords - vector3(v.moneyBags.x, v.moneyBags.y, v.moneyBags.z))
                            if v.bankOpen then
                                DrawMarker(27, v.moneyBags.x, v.moneyBags.y, v.moneyBags.z-0.99, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 138, 87, 165, 100, false, true, 2, true, nil, nil, false)
                            else
                                DrawMarker(27, v.moneyBags.x, v.moneyBags.y, v.moneyBags.z-0.99, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 0, 0, 100, false, true, 2, true, nil, nil, false)
                            end
                        end
                        if bankDist < 1.0 then
                            DrawText3Ds(v.x, v.y, v.z + 0.3, v.bankOpen and '[E] - Bank' or 'The bank is currently closed')

                            if v.bankOpen and IsControlJustPressed(0, 38) then
                                TriggerServerEvent("InteractSound_SV:PlayOnSource", "wmaze", 0.3)
                                openAccountScreen()
                            end
                        end
                    end
                end
            end
        elseif InBank then
            letSleep = false
            DisablePlayerFiring(PlayerId(), true)
        end

        if letSleep then
            Citizen.Wait(100)
        end
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

RegisterNetEvent('virus-banking:transferError')
AddEventHandler('virus-banking:transferError', function(msg)
    SendNUIMessage({
        status = "transferError",
        error = msg
    })
end)

RegisterNetEvent('virus-banking:successAlert')
AddEventHandler('virus-banking:successAlert', function(msg)
    SendNUIMessage({
        status = "successMessage",
        message = msg
    })
end)
