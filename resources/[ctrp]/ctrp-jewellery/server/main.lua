CTRPFW = nil
TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)

-- Code

local timeOut = false

local alarmTriggered = false

RegisterServerEvent('ctrp-jewellery:server:setVitrineState')
AddEventHandler('ctrp-jewellery:server:setVitrineState', function(stateType, state, k)
    Config.Locations[k][stateType] = state
    TriggerClientEvent('ctrp-jewellery:client:setVitrineState', -1, stateType, state, k)
end)

RegisterNetEvent('ctrp-jewellery:server:updateTable')
AddEventHandler('ctrp-jewellery:server:updateTable', function(bool)
    TriggerClientEvent('ctrp-jewellery:client:syncTable', -1, bool)
end)


RegisterServerEvent('ctrp-jewellery:server:vitrineReward')
AddEventHandler('ctrp-jewellery:server:vitrineReward', function()
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)
    local otherchance = math.random(1, 4)
    local odd = math.random(1, 4)

    if otherchance == odd then
        local item = math.random(1, #Config.VitrineRewards)
        local amount = math.random(Config.VitrineRewards[item]["amount"]["min"], Config.VitrineRewards[item]["amount"]["max"])
        if Player.Functions.AddItem(Config.VitrineRewards[item]["item"], amount) then
            TriggerClientEvent('inventory:client:ItemBox', src, CTRPFW.Shared.Items[Config.VitrineRewards[item]["item"]], 'add')
        else
            TriggerClientEvent('CTRPFW:Notify', src, 'You\'re ..', 'error')
        end
    else
        local amount = math.random(2, 4)
        if Player.Functions.AddItem("10kgoldchain", amount) then
            TriggerClientEvent('inventory:client:ItemBox', src, CTRPFW.Shared.Items["10kgoldchain"], 'add')
        else
            TriggerClientEvent('CTRPFW:Notify', src, 'You are carrying to much..', 'error')
        end
    end
end)

RegisterServerEvent('ctrp-jewellery:server:setTimeout')
AddEventHandler('ctrp-jewellery:server:setTimeout', function()
    if not timeOut then
        timeOut = true
        TriggerEvent('ctrp-scoreboard:server:SetActivityBusy', "jewellery", true)
        Citizen.CreateThread(function()
            Citizen.Wait(Config.Timeout)

            for k, v in pairs(Config.Locations) do
                Config.Locations[k]["isOpened"] = false
                TriggerClientEvent('ctrp-jewellery:client:setVitrineState', -1, 'isOpened', false, k)
                TriggerClientEvent('ctrp-jewellery:client:setAlertState', -1, false)
                TriggerEvent('ctrp-scoreboard:server:SetActivityBusy', "jewellery", false)
            end
            timeOut = false
            alarmTriggered = false
        end)
    end
end)

RegisterServerEvent('ctrp-jewellery:server:PoliceAlertMessage')
AddEventHandler('ctrp-jewellery:server:PoliceAlertMessage', function(title, coords, blip)
    local src = source
    local alertData = {
        title = title,
        coords = {x = coords.x, y = coords.y, z = coords.z},
        description = "Possible robbery going on at the Jewellery Store<br>Available camera's: 31, 32, 33, 34",
    }

    for k, v in pairs(CTRPFW.Functions.GetPlayers()) do
        local Player = CTRPFW.Functions.GetPlayer(v)
        if Player ~= nil then
            if Player.PlayerData.job.name == "police" and Player.PlayerData.job.onduty then
                if blip then
                    if not alarmTriggered then
                        TriggerClientEvent("ctrp-phone:client:addPoliceAlert", v, alertData)
                        TriggerClientEvent("ctrp-jewellery:client:PoliceAlertMessage", v, title, coords, blip)
                        alarmTriggered = true
                    end
                else
                    TriggerClientEvent("ctrp-phone:client:addPoliceAlert", v, alertData)
                    TriggerClientEvent("ctrp-jewellery:client:PoliceAlertMessage", v, title, coords, blip)
                end
            end
        end
    end
end)

CTRPFW.Functions.CreateCallback('ctrp-jewellery:server:getCops', function(source, cb)
	local amount = 0
    for k, v in pairs(CTRPFW.Functions.GetPlayers()) do
        local Player = CTRPFW.Functions.GetPlayer(v)
        if Player ~= nil then
            if Player.PlayerData.job.name == "police" and Player.PlayerData.job.onduty then
                amount = amount + 1
            end
        end
	end
	cb(amount)
end)
