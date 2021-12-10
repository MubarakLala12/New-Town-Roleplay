CTRPFW = nil
TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)

RegisterServerEvent('ctrp-pizzaruns:Payment')
AddEventHandler('ctrp-pizzaruns:Payment', function()
	local _source = source
	local Player = CTRPFW.Functions.GetPlayer(_source)
    Player.Functions.AddMoney("cash", 200, "sold-pizza")
    TriggerClientEvent("CTRPFW:Notify", _source, "You recieved $200", "success")
end)

RegisterServerEvent('ctrp-pizzaruns:TakeDeposit')
AddEventHandler('ctrp-pizzaruns:TakeDeposit', function()
	local _source = source
	local Player = CTRPFW.Functions.GetPlayer(_source)
    Player.Functions.RemoveMoney("bank", 200, _source, "pizza-deposit")
    TriggerClientEvent("CTRPFW:Notify", _source, "You were charged a deposit of $200", "error")
end)

RegisterServerEvent('ctrp-pizzaruns:ReturnDeposit')
AddEventHandler('ctrp-pizzaruns:ReturnDeposit', function(info)
	local _source = source
    local Player = CTRPFW.Functions.GetPlayer(_source)
    
    if info == 'cancel' then
        Player.Functions.AddMoney("cash", 0, "pizza-return-vehicle")
        TriggerClientEvent("CTRPFW:Notify", _source, "You returned the vehicle.", "success")
    elseif info == 'end' then
        Player.Functions.AddMoney("cash", 200, "pizza-return-vehicle")
        TriggerClientEvent("CTRPFW:Notify", _source, "You returned the vehicle.", "success")
    end
end)

-----------------------------VIRUS--------------------------------------