CTRPFW = nil
TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)

local VehicleList = {}

CTRPFW.Functions.CreateCallback('vehiclekeys:CheckHasKey', function(source, cb, plate)
    local Player = CTRPFW.Functions.GetPlayer(source)
    cb(CheckOwner(plate, Player.PlayerData.citizenid))
end)

RegisterServerEvent('vehiclekeys:server:SetVehicleOwner')
AddEventHandler('vehiclekeys:server:SetVehicleOwner', function(plate)
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)
    if VehicleList ~= nil then
        if DoesPlateExist(plate) then
            for k, val in pairs(VehicleList) do
                if val.plate == plate then
                    table.insert(VehicleList[k].owners, Player.PlayerData.citizenid)
                end
            end
        else
            local vehicleId = #VehicleList+1
            VehicleList[vehicleId] = {
                plate = plate, 
                owners = {},
            }
            VehicleList[vehicleId].owners[1] = Player.PlayerData.citizenid
        end
    else
        local vehicleId = #VehicleList+1
        VehicleList[vehicleId] = {
            plate = plate, 
            owners = {},
        }
        VehicleList[vehicleId].owners[1] = Player.PlayerData.citizenid
    end
end)

RegisterServerEvent('vehiclekeys:server:GiveVehicleKeys')
AddEventHandler('vehiclekeys:server:GiveVehicleKeys', function(plate, target)
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)
    if CheckOwner(plate, Player.PlayerData.citizenid) then
        if CTRPFW.Functions.GetPlayer(target) ~= nil then
            TriggerClientEvent('vehiclekeys:client:SetOwner', target, plate)
            TriggerClientEvent('CTRPFW:Notify', src, "You gave the keys!")
            TriggerClientEvent('CTRPFW:Notify', target, "You got the keys!")
        else
            TriggerClientEvent('chatMessage', src, "SYSTEM", "error", "Player not online!")
        end
    else
        TriggerClientEvent('chatMessage', src, "SYSTEM", "error", "You dont have the keys of the vehicle!")
    end
end)

CTRPFW.Commands.Add("engine", "Toggle engine On/Off of the vehicle", {}, false, function(source, args)
	TriggerClientEvent('vehiclekeys:client:ToggleEngine', source)
end)

CTRPFW.Commands.Add("givekeys", "Give keys of the vehicle", {{name = "id", help = "Player id"}}, true, function(source, args)
	local src = source
    local target = tonumber(args[1])
    TriggerClientEvent('vehiclekeys:client:GiveKeys', src, target)
end)

function DoesPlateExist(plate)
    if VehicleList ~= nil then
        for k, val in pairs(VehicleList) do
            if val.plate == plate then
                return true
            end
        end
    end
    return false
end

function CheckOwner(plate, identifier)
    local retval = false
    if VehicleList ~= nil then
        for k, val in pairs(VehicleList) do
            if val.plate == plate then
                for key, owner in pairs(VehicleList[k].owners) do
                    if owner == identifier then
                        retval = true
                    end
                end
            end
        end
    end
    return retval
end

CTRPFW.Functions.CreateUseableItem("lockpick", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
    TriggerClientEvent("lockpicks:UseLockpick", source, false)
end)

CTRPFW.Functions.CreateUseableItem("advancedlockpick", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
    TriggerClientEvent("lockpicks:UseLockpick", source, true)
end)

local ItemList = {
    ["blackmoney"] = 1  ,
}

RegisterNetEvent("ctrp-vehiclekeys:server:searchVirus")
AddEventHandler("ctrp-vehiclekeys:server:searchVirus", function(item, count)
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)
    local luck = math.random(1, 100)
    local itemFound = true
    local itemCount = 1

    if itemFound then
        for i = 1, itemCount, 1 do
            local randomItem = ItemList["type"]math.random(1, 2)
            local itemInfo = CTRPFW.Shared.Items[randomItem]
            if luck >= 85 and luck <= 100 then
				TriggerClientEvent("vehiclekeys:client:doneVirus" , src)
                print('noob')
			elseif luck >= 50 and luck <= 80 then
				randomItem = "blackmoney"
				itemInfo = CTRPFW.Shared.Items[randomItem]
                
                Player.Functions.AddItem(randomItem, math.random(10,15))
                TriggerClientEvent('inventory:client:ItemBox', src, itemInfo, "add")

			elseif luck >= 10 and luck <= 50 then
                TriggerClientEvent('CTRPFW:Notify', src, "No Item Found!" , "error", 5000)
            elseif luck >= 0 and luck <= 10 then
                TriggerClientEvent('CTRPFW:Notify', src, "No Item Found!" , "error", 5000)
            end
            Citizen.Wait(500)
        end
    end
end)