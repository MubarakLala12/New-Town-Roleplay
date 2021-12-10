CTRPFW = nil
TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)

CTRPFW.Functions.CreateCallback('ctrp-government:server:IsgovernmentAvailable', function(source, cb)
	local amount = 0
	for k, v in pairs(CTRPFW.Functions.GetPlayers()) do
        local Player = CTRPFW.Functions.GetPlayer(v)
        if Player ~= nil then 
            if (Player.PlayerData.job.name == "mayor" or Player.PlayerData.job.name == "govem" or Player.PlayerData.job.name == "governor" or Player.PlayerData.job.name == "secretery" or Player.PlayerData.job.name == "statet" or Player.PlayerData.job.name == "stateacc" or Player.PlayerData.job.name == "securityhead" or Player.PlayerData.job.name == "security" and Player.PlayerData.job.onduty) then
                amount = amount + 1
            end
        end
    end
    cb(amount)
end)
