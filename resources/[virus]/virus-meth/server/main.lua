CTRPFW = nil

TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)

--local hiddenprocess = vector3(-1367.92,-318.34,39.52) -- Change this to whatever location you want. This is server side to prevent people from dumping the coords

local hiddenprocess = vector3(1707.26,-1633.24,111.84)
local hiddenstart = vector3(1707.26,-1633.24,111.84) -- Change this to whatever location you want. This is server side to prevent people from dumping the coords

RegisterNetEvent('virus-meth:updateTable')
AddEventHandler('virus-meth:updateTable', function(bool)
    TriggerClientEvent('virus-meth:syncTable', -1, bool)
end)

CTRPFW.Functions.CreateCallback('virus-meth:processcoords', function(source, cb)
    cb(hiddenprocess)
end)

CTRPFW.Functions.CreateCallback('virus-meth:startcoords', function(source, cb)
    cb(hiddenstart)
end)


RegisterServerEvent('virus-meth:ReturnDeposit')
AddEventHandler('virus-meth:ReturnDeposit', function(info)
	local _source = source
    local Player = CTRPFW.Functions.GetPlayer(_source)
    
    if info == 'cancel' then
        TriggerClientEvent("CTRPFW:Notify", _source, "You returned the vehicle", "success")
    elseif info == 'end' then
        TriggerClientEvent("CTRPFW:Notify", _source, "You returned the vehicle", "success")
    end
end)

-----------------------------VIRUS--------------------------------------


RegisterNetEvent("virus-meth:itemAdd")
AddEventHandler("virus-meth:itemAdd", function(item, count)
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)
    local luck1 = math.random(1, 100)
    local itemFound1 = true
    local itemCount1 = 1

    if itemFound1 then
        for i = 1, itemCount1, 1 do
            local randomItem = Config.DiveItems["type"]math.random(1, 1)
            local itemInfo = CTRPFW.Shared.Items[randomItem]
            if luck1 == 100 then
                randomItem = "acetone"
                itemInfo = CTRPFW.Shared.Items[randomItem]
               
                Player.Functions.AddItem(randomItem, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, itemInfo, "add")
               
			elseif luck1 >= 90 and luck1 <= 98 then
				randomItem = "acetone"
				itemInfo = CTRPFW.Shared.Items[randomItem]
                
                Player.Functions.AddItem(randomItem, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, itemInfo, "add")
            elseif luck1 >= 80 and luck1 <= 90 then
				randomItem = "acetone"
				itemInfo = CTRPFW.Shared.Items[randomItem]
                
                Player.Functions.AddItem(randomItem, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, itemInfo, "add")
                
			elseif luck1 >= 50 and luck1 <= 80 then
				randomItem = "acetone"
				itemInfo = CTRPFW.Shared.Items[randomItem]
                
                Player.Functions.AddItem(randomItem, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, itemInfo, "add")

            elseif luck1 >= 30 and luck1 <= 50 then
                randomItem = "acetone"
				itemInfo = CTRPFW.Shared.Items[randomItem]
                
                Player.Functions.AddItem(randomItem, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, itemInfo, "add")
                
			elseif luck1 >= 10 and luck1 <= 30 then
				randomItem = "acetone"
				itemInfo = CTRPFW.Shared.Items[randomItem]
                
                Player.Functions.AddItem(randomItem, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, itemInfo, "add")
                
            elseif luck1 >= 0 and luck1 <= 10 then
                randomItem = "acetone"
				itemInfo = CTRPFW.Shared.Items[randomItem]
                
                Player.Functions.AddItem(randomItem, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, itemInfo, "add")
                
            end
            Citizen.Wait(500)
        end
    end
end)


RegisterServerEvent('virus-meth:pickedup')
AddEventHandler('virus-meth:pickedup', function()
	local src = source
	local Player = CTRPFW.Functions.GetPlayer(src)

	Player.Functions.AddItem('sodiumoxide', 1)
	TriggerClientEvent("inventory:client:ItemBox", source, CTRPFW.Shared.Items['sodiumoxide'], "add")

end)