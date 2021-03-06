CTRPFW = nil
TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(1000)
        GenerateVehicleList()
        Citizen.Wait((1000 * 60) * 60)
    end
end)

RegisterServerEvent('ctrp-scrapyard:server:LoadVehicleList')
AddEventHandler('ctrp-scrapyard:server:LoadVehicleList', function()
    local src = source
    TriggerClientEvent("ctrp-scrapyard:client:setNewVehicles", src, Config.CurrentVehicles)
end)


RegisterServerEvent('ctrp-scrapyard:server:ScrapVehicle')
AddEventHandler('ctrp-scrapyard:server:ScrapVehicle', function(listKey)
    local src = source 
    local Player = CTRPFW.Functions.GetPlayer(src)
    if Config.CurrentVehicles[listKey] ~= nil then 
        for i = 1, math.random(4, 8), 1 do
            local item = Config.Items[math.random(1, #Config.Items)]
            Player.Functions.AddItem(item, math.random(5, 10))
            TriggerClientEvent('inventory:client:ItemBox', src, CTRPFW.Shared.Items[item], 'add')
            Citizen.Wait(500)
        end
        local Luck = math.random(1, 8)
        local Odd = math.random(1, 8)
        if Luck == Odd then
            local random = math.random(5, 20)
            Player.Functions.AddItem("rubber", random)
            TriggerClientEvent('inventory:client:ItemBox', src, CTRPFW.Shared.Items["rubber"], 'add')
        end
        Config.CurrentVehicles[listKey] = nil
        TriggerClientEvent("ctrp-scrapyard:client:setNewVehicles", -1, Config.CurrentVehicles)
    end
end)

function GenerateVehicleList()
    Config.CurrentVehicles = {}
    for i = 1, 20, 1 do
        local randVehicle = Config.Vehicles[math.random(1, #Config.Vehicles)]
        if not IsInList(randVehicle) then
            Config.CurrentVehicles[i] = randVehicle
        end
    end
    TriggerClientEvent("ctrp-scrapyard:client:setNewVehicles", -1, Config.CurrentVehicles)
end

function IsInList(name)
    local retval = false
    if Config.CurrentVehicles ~= nil and next(Config.CurrentVehicles) ~= nil then 
        for k, v in pairs(Config.CurrentVehicles) do
            if Config.CurrentVehicles[k] == name then 
                retval = true
            end
        end
    end
    return retval
end
