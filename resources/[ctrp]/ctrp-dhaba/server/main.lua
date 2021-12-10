CTRPFW = nil
TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)


CTRPFW.Functions.CreateCallback('ctrp-dhaba:server:IscoffeeAvailable', function(source, cb)
	local amount = 0
	for k, v in pairs(CTRPFW.Functions.GetPlayers()) do
        local Player = CTRPFW.Functions.GetPlayer(v)
        if Player ~= nil then 
            if (Player.PlayerData.job.name == "dh" or Player.PlayerData.job.name == "dh1" or Player.PlayerData.job.name == "dh2" or Player.PlayerData.job.name == "dh3" or Player.PlayerData.job.name == "dh4" and Player.PlayerData.job.onduty) then
                amount = amount + 1
            end
        end
    end
    cb(amount)
end)

