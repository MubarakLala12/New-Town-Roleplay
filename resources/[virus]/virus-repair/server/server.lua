CTRPFW = nil
TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)

CTRPFW.Commands.Add("mecrepair", "Mechanic Repair", {}, false, function(source, args)
	local _player = CTRPFW.Functions.GetPlayer(source)
	if _player.PlayerData.job.name == "mechanic" or _player.PlayerData.job.name == "infimechanic" then 
		TriggerClientEvent('virus-repair:client:triggerMenu', source)
	else 
		TriggerClientEvent('chatMessage', source, "SYSTEM", "error", "This command is for Mechanic!")
	end
end)