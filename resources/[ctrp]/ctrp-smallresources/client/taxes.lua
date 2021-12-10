CTRPFW = nil

TriggerEvent('CTRPFW:getObject', function(obj) CTRPFW = obj end)

Citizen.CreateThread(function()
	while true do
		Wait(60*60000) -- change time of payment
		TriggerServerEvent('ctrp-taxes')
	end
end)