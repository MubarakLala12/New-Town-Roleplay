CTRPFW = nil
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        if CTRPFW == nil then
            TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)
            Citizen.Wait(200)
        end
    end
end)

RegisterNetEvent('CTRPFW:Client:OnPlayerLoaded')
AddEventHandler('CTRPFW:Client:OnPlayerLoaded', function(data)
    playerLoaded = true
end)

RegisterNetEvent('CTRPFW:Client:OnPlayerUnload')
AddEventHandler('CTRPFW:Client:OnPlayerUnload', function()
    playerData = nil
end)

RegisterNetEvent("hidemenu")
AddEventHandler("hidemenu", function()
    SetNuiFocus(false, false)
    SendNUIMessage({
        status = "closeATM"
    })
end)

RegisterNUICallback("NUIFocusOff", function(data, cb)
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "wthanks", 0.3)
    SetNuiFocus(false, false)
    SendNUIMessage({
        status = "closeATM"
    })
end)

RegisterNUICallback("playATMAnim", function(data, cb)
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "wpin", 0.3)
    local playerPed = GetPlayerPed(-1)
    local anim = 'amb@prop_human_atm@male@idle_a'
    RequestAnimDict(anim)
    while not HasAnimDictLoaded(anim) do
        Citizen.Wait(1)
    end

    if HasAnimDictLoaded(anim) then 
        TaskPlayAnim(GetPlayerPed(-1), anim, "idle_a", 1.0,-1.0, 3000, 1, 1, true, true, true)
    end
end)

RegisterNUICallback("doATMWithdraw", function(data, cb)
    if data ~= nil then
        TriggerServerEvent('virus-atms:server:doAccountWithdraw', data)
    end
end)

RegisterNetEvent('virus-atms:client:updateBankInformation')
AddEventHandler('virus-atms:client:updateBankInformation', function(banking)
    SendNUIMessage({
        status = "loadBankAccount",
        information = banking
    })
end)

function tprint (t, s)
    for k, v in pairs(t) do
        local kfmt = '["' .. tostring(k) ..'"]'
        if type(k) ~= 'string' then
            kfmt = '[' .. k .. ']'
        end
        local vfmt = '"'.. tostring(v) ..'"'
        if type(v) == 'table' then
            tprint(v, (s or '')..kfmt)
        else
            if type(v) ~= 'string' then
                vfmt = tostring(v)
            end
            print(type(t)..(s or '')..kfmt..' = '..vfmt)
        end
    end
end 

RegisterNUICallback("loadBankingAccount", function(data, cb)
    CTRPFW.Functions.TriggerCallback('virus-atms:server:loadBankAccount', function(banking)
        if banking ~= false and type(banking) == "table" then
            SendNUIMessage({
                status = "loadBankAccount",
                information = banking
            })
        else
            SetNuiFocus(false, false)
            SendNUIMessage({
                status = "closeATM"
            })
        end
    end, data.cid, data.cardnumber)
    print(data.cid, data.cardnumber)
end)

RegisterCommand('ts', function()
    CTRPFW.Functions.TriggerCallback('virus-atms:server:loadBankAccount', function(banking)
        if banking ~= false and type(banking) == "table" then
            SetNuiFocus(true, true)
            SendNUIMessage({
                status = "loadBankAccount",
                information = banking
            })
        else
            SetNuiFocus(false, false)
            SendNUIMessage({
                status = "closeATM"
            })
        end
    end, 'BJF20704', '6426696777343750')
end)

RegisterNetEvent('virus-atms:client:loadATM')
AddEventHandler('virus-atms:client:loadATM', function(cards)
    if cards ~= nil and cards[1] ~= nil then
        local playerPed = GetPlayerPed(-1)
        local playerCoords = GetEntityCoords(playerPed, true)
        for k, v in pairs(Config.ATMModels) do
            local hash = GetHashKey(v)
            local atm = IsObjectNearPoint(hash, playerCoords.x, playerCoords.y, playerCoords.z, 1.2)
            if atm then 
                local obj = GetClosestObjectOfType(playerCoords.x, playerCoords.y, playerCoords.z, 2.0, hash, false, false, false)
                local atmCoords = GetEntityCoords(obj, false)
                CTRPFW.Functions.Progressbar("accessing_atm", "Accessing ATM", 1500, false, true, {
                    disableMovement = false,
                    disableCarMovement = false,
                    disableMouse = false,
                    disableCombat = false,
                }, {}, {}, {}, function() -- Done
                    SetNuiFocus(true, true)
                    SendNUIMessage({
                        status = "openATMFrontScreen",
                        cards = cards,
                    })
                end, function()
                    CTRPFW.Functions.Notify("Failed!", "error")
                end)
            end
        end     
    else
        CTRPFW.Functions.Notify("You do not have a debit card to pay with, please visit a branch to order a card. or ensure one is on your person.", "error")
    end
end)

RegisterNUICallback("removeCard", function(data, cb)
    CTRPFW.Functions.TriggerCallback('virus-debitcard:server:deleteCard', function(hasDeleted)
        if hasDeleted then
            SetNuiFocus(false, false)
            SendNUIMessage({
                status = "closeATM"
            })
            CTRPFW.Functions.Notify('Card has deleted.', 'success')
        else
            CTRPFW.Functions.Notify('Failed to delete card.', 'error')
        end
    end, data)
end)