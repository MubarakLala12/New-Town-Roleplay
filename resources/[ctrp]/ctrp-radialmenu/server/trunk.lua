CTRPFW = nil
TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)

-- Code

local trunkBusy = {}

RegisterServerEvent('ctrp-trunk:server:setTrunkBusy')
AddEventHandler('ctrp-trunk:server:setTrunkBusy', function(plate, busy)
    trunkBusy[plate] = busy
end)

CTRPFW.Functions.CreateCallback('ctrp-trunk:server:getTrunkBusy', function(source, cb, plate)
    if trunkBusy[plate] then
        cb(true)
    end
    cb(false)
end)

RegisterServerEvent('ctrp-trunk:server:KidnapTrunk')
AddEventHandler('ctrp-trunk:server:KidnapTrunk', function(targetId, closestVehicle)
    TriggerClientEvent('ctrp-trunk:client:KidnapGetIn', targetId, closestVehicle)
end)

CTRPFW.Commands.Add("getintrunk", "Get in trunk", {}, false, function(source, args)
    TriggerClientEvent('ctrp-trunk:client:GetIn', source)
end)

CTRPFW.Commands.Add("kidnaptrunk", "Get in trunk", {}, false, function(source, args)
    TriggerClientEvent('ctrp-trunk:server:KidnapTrunk', source)
end)