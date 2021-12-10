CTRPFW = nil

TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)

RegisterServerEvent('ctrp-taco:server:start:black')
AddEventHandler('ctrp-taco:server:start:black', function()
    local src = source
    
    TriggerClientEvent('ctrp-taco:start:black:job', src)
end)

RegisterServerEvent('ctrp-taco:server:reward:money')
AddEventHandler('ctrp-taco:server:reward:money', function()
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)
    
    Player.Functions.AddMoney("cash", Config.PaymentTaco, "taco-reward-money")
    TriggerClientEvent('CTRPFW:Notify', src, "Taco delivered! Go back to the taco shop for a new delivery")
end)

CTRPFW.Functions.CreateCallback('ctrp-tacos:server:GetConfig', function(source, cb)
    cb(Config)
end)

RegisterServerEvent('ctrp-tacos:server:get:stuff')
AddEventHandler('ctrp-tacos:server:get:stuff', function()
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)
    
    if Player ~= nil then
        Player.Functions.AddItem("taco-box", 1)
        TriggerClientEvent('inventory:client:ItemBox', source, CTRPFW.Shared.Items['taco-box'], "add")
    end
end)

CTRPFW.Functions.CreateCallback('ctrp-taco:server:get:ingredient', function(source, cb)
    local src = source
    local Ply = CTRPFW.Functions.GetPlayer(src)
    local lettuce = Ply.Functions.GetItemByName("lettuce")
    local meat = Ply.Functions.GetItemByName("meat")
    if lettuce ~= nil and meat ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

CTRPFW.Functions.CreateCallback('ctrp-taco:server:get:tacobox', function(source, cb)
    local src = source
    local Ply = CTRPFW.Functions.GetPlayer(src)
    local box = Ply.Functions.GetItemByName("taco-box")
    if box ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

CTRPFW.Functions.CreateCallback('ctrp-taco:server:get:tacos', function(source, cb)
    local src = source
    local Ply = CTRPFW.Functions.GetPlayer(src)
    local taco = Ply.Functions.GetItemByName('taco')
    if taco ~= nil then
        cb(true)
    else
        cb(false)
    end
end)