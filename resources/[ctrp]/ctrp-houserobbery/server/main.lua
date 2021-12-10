CTRPFW = nil
TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)

-- Code

CTRPFW.Functions.CreateCallback('ctrp-houserobbery:server:GetHouseConfig', function(source, cb)
    cb(Config.Houses)
end)

RegisterServerEvent('ctrp-houserobbery:server:enterHouse')
AddEventHandler('ctrp-houserobbery:server:enterHouse', function(house)
    local src = source
    local itemInfo = CTRPFW.Shared.Items["lockpick"]
    local Player = CTRPFW.Functions.GetPlayer(src)
    
    if not Config.Houses[house]["opened"] then
        ResetHouseStateTimer(house)
        TriggerClientEvent('ctrp-houserobbery:client:setHouseState', -1, house, true)
    end
    TriggerClientEvent('ctrp-houserobbery:client:enterHouse', src, house)
    Config.Houses[house]["opened"] = true
end)

function ResetHouseStateTimer(house)
    -- Cannot parse math.random "directly" inside the tonumber function
    local num = math.random(800000, 1000000)
    local time = tonumber(num)
    Citizen.SetTimeout(time, function()
        Config.Houses[house]["opened"] = false
        for k, v in pairs(Config.Houses[house]["furniture"]) do
            v["searched"] = false
        end
        TriggerClientEvent('ctrp-houserobbery:client:ResetHouseState', -1, house)
    end)
end

RegisterServerEvent('ctrp-houserobbery:server:searchCabin')
AddEventHandler('ctrp-houserobbery:server:searchCabin', function(cabin, house)
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)
    local luck = math.random(1, 10)
    local itemFound = math.random(1, 4)
    local itemCount = 1

    local Tier = 1
    if Config.Houses[house]["tier"] == 1 then
        Tier = 1
    elseif Config.Houses[house]["tier"] == 2 then
        Tier = 2
    elseif Config.Houses[house]["tier"] == 3 then
        Tier = 3
    end

    if itemFound < 4 then
        if luck == 10 then
            itemCount = 2
        elseif luck >= 6 and luck <= 8 then
            itemCount = 1
        end

        for i = 1, itemCount, 1 do
            local randomItem = Config.Rewards[Tier][Config.Houses[house]["furniture"][cabin]["type"]][math.random(1, #Config.Rewards[Tier][Config.Houses[house]["furniture"][cabin]["type"]])]
            local itemInfo = CTRPFW.Shared.Items[randomItem]
            if math.random(1, 100) == 69 then
                randomItem = "painkillers"
                itemInfo = CTRPFW.Shared.Items[randomItem]
                Player.Functions.AddItem(randomItem, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, itemInfo, "add")
            else
                if not itemInfo["unqiue"] then
                    local itemAmount = math.random(1, 2)
                    if randomItem == "plastic" then
                        itemAmount = math.random(8, 10)
                    elseif randomItem == "goldchain" then
                        itemAmount = math.random(1, 2)
                    elseif randomItem == "advancedlockpick" then
                        itemAmount = math.random(1, 2)
                    elseif randomItem == "pistol_ammo" then
                        itemAmount = math.random(1, 2)
                    elseif randomItem == "rifle_ammo" then
                        itemAmount = math.random(1, 2)
                    elseif randomItem == "smg_ammo" then
                        itemAmount = math.random(1, 2)
                    elseif randomItem == "wire" then
                        itemAmount = math.random(1, 2)
                    elseif randomItem == "redchip" then
                        itemAmount = math.random(1, 1)
                    elseif randomItem == "bluechip" then
                        itemAmount = math.random(1, 1)
                    elseif randomItem == "handcuffs" then
                        itemAmount = math.random(1, 2)
                    elseif randomItem == "weed_og-kush_seed" then
                        itemAmount = math.random(1, 2)
                    elseif randomItem == "diamond_ring" then
                        itemAmount = math.random(1, 2)
                    elseif randomItem == "rolex" then
                        itemAmount = math.random(1, 2)
                    elseif randomItem == "blackmoney" then
                        itemAmount = math.random(10, 200)
                    end
                    Player.Functions.AddItem(randomItem, itemAmount)
                else
                    Player.Functions.AddItem(randomItem, 1)
                end
                TriggerClientEvent('inventory:client:ItemBox', src, itemInfo, "add")
            end
            Citizen.Wait(500)
            -- local weaponChance = math.random(1, 100)
        end
    else
        TriggerClientEvent('CTRPFW:Notify', src, 'The cabin is empty bro', 'error', 3500)
    end

    Config.Houses[house]["furniture"][cabin]["searched"] = true
    TriggerClientEvent('ctrp-houserobbery:client:setCabinState', -1, house, cabin, true)
end)

RegisterServerEvent('ctrp-houserobbery:server:SetBusyState')
AddEventHandler('ctrp-houserobbery:server:SetBusyState', function(cabin, house, bool)
    Config.Houses[house]["furniture"][cabin]["isBusy"] = bool
    TriggerClientEvent('ctrp-houserobbery:client:SetBusyState', -1, cabin, house, bool)
end)
