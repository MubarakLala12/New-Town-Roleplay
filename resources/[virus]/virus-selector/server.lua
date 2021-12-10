CTRPFW = nil

TriggerEvent("CTRPFW:GetObject", function(obj) CTRPFW = obj end)

RegisterServerEvent('virus:selector:show', function()

    local src = source

    xPlayer = CTRPFW.Functions.GetPlayer(src)

    Data = {}

    Data.position = xPlayer.PlayerData.position

    Data.jail = false

    Data.job = xPlayer.PlayerData.job.name

    TriggerClientEvent('virus:selector:show', src, Data)

end)