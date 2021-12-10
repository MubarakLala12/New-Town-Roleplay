local CTRPFW = nil

TriggerEvent('CTRPFW:GetObject', function(obj) 
    CTRPFW = obj 
end)




CTRPFW.Commands.Add("vape", "Drink vape", {}, false, function(source)
    TriggerClientEvent('Vape:StartVaping', source)
end)


	

CTRPFW.Commands.Add("bong", "Drink bong", {}, false, function(source)
	TriggerClientEvent('Bong:StartVaping', source)
end)


CTRPFW.Commands.Add("cigarett", "Drink Cigaratte", {}, false, function(source)
		local Player = CTRPFW.Functions.GetPlayer(source)
			TriggerClientEvent('Sigara:StartVaping', source)
			TriggerClientEvent("CTRPFW:Notify", source, "Vape Starting", "success")
end)

RegisterServerEvent("eff_smokes")
AddEventHandler("eff_smokes", function(entity)
	TriggerClientEvent("c_eff_smokes", -1, entity)
end)
