CTRPFW = nil
TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)


CTRPFW.Functions.CreateCallback('ctrp-coffee:server:IscoffeeAvailable', function(source, cb)
	local amount = 0
	for k, v in pairs(CTRPFW.Functions.GetPlayers()) do
        local Player = CTRPFW.Functions.GetPlayer(v)
        if Player ~= nil then 
            if (Player.PlayerData.job.name == "coffeeowner" or Player.PlayerData.job.name == "coffeemanager" or Player.PlayerData.job.name == "coffeeemployee" and Player.PlayerData.job.onduty) then
                amount = amount + 1
            end
        end
    end
    cb(amount)
end)
