CTRPFW = nil

TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)

local SafeCodes = {}

Citizen.CreateThread(function()
    while true do 
        SafeCodes = {
            [1] = math.random(1000, 9999),
            [2] = {math.random(1, 149), math.random(150.0, 359.0), math.random(1, 149), math.random(150.0, 359.0), math.random(1, 149)},
            [3] = {math.random(1, 149), math.random(150.0, 359.0), math.random(1, 149), math.random(150.0, 359.0), math.random(1, 149)},
            [4] = math.random(1000, 9999),
            [5] = math.random(1000, 9999),
            [6] = {math.random(1, 149), math.random(150.0, 359.0), math.random(1, 149), math.random(150.0, 359.0), math.random(1, 149)},
            [7] = math.random(1000, 9999),
            [8] = math.random(1000, 9999),
            [9] = math.random(1000, 9999),
            [10] = {math.random(1, 149), math.random(150.0, 359.0), math.random(1, 149), math.random(150.0, 359.0), math.random(1, 149)},
            [11] = math.random(1000, 9999),
            [12] = math.random(1000, 9999),
            [13] = math.random(1000, 9999),
            [14] = {math.random(1, 149), math.random(150.0, 359.0), math.random(1, 149), math.random(150.0, 359.0), math.random(1, 149)},
            [15] = math.random(1000, 9999),
            [16] = math.random(1000, 9999),
            [17] = math.random(1000, 9999),
            [18] = {math.random(1, 149), math.random(150.0, 359.0), math.random(1, 149), math.random(150.0, 359.0), math.random(1, 149)},
            [19] = math.random(1000, 9999),
        }
        Citizen.Wait((1000 * 60) * 40)
    end
end)

RegisterServerEvent('ctrp-storerobbery:server:takeMoney')
AddEventHandler('ctrp-storerobbery:server:takeMoney', function(register, isDone)
    local src   = source
    local Player = CTRPFW.Functions.GetPlayer(src)

    Player.Functions.AddMoney('cash', math.random(60, 120), "robbery-store")
    if isDone then
        if math.random(1, 100) <= 17 then
            local code = SafeCodes[Config.Registers[register].safeKey]
            local info = {}
            if Config.Safes[Config.Registers[register].safeKey].type == "keypad" then
                info = {
                    label = "Safe code: "..tostring(code)
                }
            else
                info = {
                    label = "Safe code: "..tostring(math.floor((code[1] % 360) / 3.60)).."-"..tostring(math.floor((code[2] % 360) / 3.60)).."-"..tostring(math.floor((code[3] % 360) / 3.60)).."-"..tostring(math.floor((code[4] % 360) / 3.60)).."-"..tostring(math.floor((code[5] % 360) / 3.60))
                }
            end
            Player.Functions.AddItem("stickynote", 1, false, info)
            TriggerClientEvent('inventory:client:ItemBox', src, CTRPFW.Shared.Items["stickynote"], "add")
        end
    end
end)

RegisterServerEvent('ctrp-storerobbery:server:setRegisterStatus')
AddEventHandler('ctrp-storerobbery:server:setRegisterStatus', function(register)
    TriggerClientEvent('ctrp-storerobbery:client:setRegisterStatus', -1, register, true)
    Config.Registers[register].robbed   = true
    Config.Registers[register].time     = Config.resetTime
end)

RegisterServerEvent('ctrp-storerobbery:server:setSafeStatus')
AddEventHandler('ctrp-storerobbery:server:setSafeStatus', function(safe)
    TriggerClientEvent('ctrp-storerobbery:client:setSafeStatus', -1, safe, true)
    Config.Safes[safe].robbed = true

    SetTimeout(math.random(40, 80) * (60 * 1000), function()
        TriggerClientEvent('ctrp-storerobbery:client:setSafeStatus', -1, safe, false)
        Config.Safes[safe].robbed = false
    end)
end)

RegisterServerEvent('ctrp-storerobbery:server:SafeReward')
AddEventHandler('ctrp-storerobbery:server:SafeReward', function(safe)
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)
    Player.Functions.AddMoney('cash', math.random(1000, 3000), "robbery-safe-reward")
    local luck = math.random(1, 100)
    local odd = math.random(1, 100)
    if luck <= 10 then
        Player.Functions.AddItem("rolex", math.random(3, 7))
        TriggerClientEvent('inventory:client:ItemBox', src, CTRPFW.Shared.Items["rolex"], "add")
        if luck == odd then
            Citizen.Wait(500)
            Player.Functions.AddItem("goldbar", math.random(1, 2))
            TriggerClientEvent('inventory:client:ItemBox', src, CTRPFW.Shared.Items["goldbar"], "add")
        end
    end
end)

RegisterServerEvent('ctrp-storerobbery:server:callCops')
AddEventHandler('ctrp-storerobbery:server:callCops', function(type, safe, streetLabel, coords)
    local cameraId = 4
    if type == "safe" then
        cameraId = Config.Safes[safe].camId
    else
        cameraId = Config.Registers[safe].camId
    end
    local alertData = {
        title = "10-90C | Shop robbery",
        coords = {x = coords.x, y = coords.y, z = coords.z},
        description = "Someone is trying to rob a store at "..streetLabel.." (CAMERA ID: "..cameraId..")"
    }
    TriggerClientEvent("ctrp-storerobbery:client:robberyCall", -1, type, safe, streetLabel, coords)
    TriggerClientEvent("ctrp-phone:client:addPoliceAlert", -1, alertData)
end)

Citizen.CreateThread(function()
    while true do
        for k, v in pairs(Config.Registers) do
            if Config.Registers[k].time > 0 and (Config.Registers[k].time - Config.tickInterval) >= 0 then
                Config.Registers[k].time = Config.Registers[k].time - Config.tickInterval
            else
                Config.Registers[k].time = 0
                Config.Registers[k].robbed = false
                TriggerClientEvent('ctrp-storerobbery:client:setRegisterStatus', -1, k, false)
            end
        end
        Citizen.Wait(Config.tickInterval)
    end
end)

CTRPFW.Functions.CreateCallback('ctrp-storerobbery:server:isCombinationRight', function(source, cb, safe)
    cb(SafeCodes[safe])
end)

CTRPFW.Functions.CreateCallback('ctrp-storerobbery:server:getPadlockCombination', function(source, cb, safe)
    cb(SafeCodes[safe])
end)

CTRPFW.Functions.CreateCallback('ctrp-storerobbery:server:getRegisterStatus', function(source, cb)
    cb(Config.Registers)
end)

CTRPFW.Functions.CreateCallback('ctrp-storerobbery:server:getSafeStatus', function(source, cb)
    cb(Config.Safes)
end)