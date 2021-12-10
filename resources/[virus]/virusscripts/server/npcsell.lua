-- CTRPFW = nil
-- TriggerEvent("CTRPFW:GetObject", function(obj) CTRPFW = obj end)

RegisterNetEvent('virus-sellnpc:dodeal')
AddEventHandler('virus-sellnpc:dodeal', function()
	local src = source
	local Player = CTRPFW.Functions.GetPlayer(src)
	if Player ~= nil then
		local weedprice = math.random(1000, 1200)
		local weedamount = 1
		
		local finalamount = weedprice * weedamount

		
		TriggerClientEvent("CTRPFW:Notify", src, 'कड़क माल है', "success", 8000)

		Player.Functions.RemoveItem('cokebaggy', weedamount)
		TriggerClientEvent("inventory:client:ItemBox", source, CTRPFW.Shared.Items['cokebaggy'], "remove")
		--Player.Functions.AddMoney('cash', finalamount)
		Player.Functions.AddItem('blackmoney', finalamount)
	end
end)

--VIRUSFW---

RegisterNetEvent('checkD')
AddEventHandler('checkD', function()
	local Player = CTRPFW.Functions.GetPlayer(source)
	if Player ~= nil then
		local coke = Player.Functions.GetItemByName('cokebaggy')
		if coke == nil then
			TriggerClientEvent("checkR", source, false)
		else
			if coke.amount >= 1 then
			TriggerClientEvent("checkR", source, true)
			else
			TriggerClientEvent("checkR", source, false)
			end
		end
	end
end)

RegisterNetEvent('sell_dis')
AddEventHandler('sell_dis', function()
	TriggerClientEvent('CTRPFW:Notify', source, 'You walked away', "error",2000)  
end)
