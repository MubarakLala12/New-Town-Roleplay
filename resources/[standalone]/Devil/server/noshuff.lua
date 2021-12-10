CTRPFW = nil
TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)

-- Code

CTRPFW.Commands.Add("shuff", "Switch from seats", {}, false, function(source, args)
    TriggerClientEvent('ctrp-seatshuff:client:Shuff', source)
end)