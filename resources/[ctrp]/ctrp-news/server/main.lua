CTRPFW = nil
TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)

CTRPFW.Commands.Add("newscam", "Take news camera", {}, false, function(source, args)
    local Player = CTRPFW.Functions.GetPlayer(source)
    if Player.PlayerData.job.name == "reporter" then
        TriggerClientEvent("Cam:ToggleCam", source)
    end
end)

CTRPFW.Commands.Add("newsmic", "Take news microphone", {}, false, function(source, args)
    local Player = CTRPFW.Functions.GetPlayer(source)
    if Player.PlayerData.job.name == "reporter" then
        TriggerClientEvent("Mic:ToggleMic", source)
    end
end)

