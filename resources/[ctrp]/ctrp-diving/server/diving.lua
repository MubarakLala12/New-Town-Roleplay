local CurrentDivingArea = math.random(1, #CTRPDiving.Locations)

CTRPFW.Functions.CreateCallback('ctrp-diving:server:GetDivingConfig', function(source, cb)
    cb(CTRPDiving.Locations, CurrentDivingArea)
end)

RegisterServerEvent('ctrp-diving:server:TakeCoral')
AddEventHandler('ctrp-diving:server:TakeCoral', function(Area, Coral, Bool)
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)
    local CoralType = math.random(1, #CTRPDiving.CoralTypes)
    local Amount = math.random(1, CTRPDiving.CoralTypes[CoralType].maxAmount)
    local ItemData = CTRPFW.Shared.Items[CTRPDiving.CoralTypes[CoralType].item]

    if Amount > 1 then
        for i = 1, Amount, 1 do
            Player.Functions.AddItem(ItemData["name"], 1)
            TriggerClientEvent('inventory:client:ItemBox', src, ItemData, "add")
            Citizen.Wait(250)
        end
    else
        Player.Functions.AddItem(ItemData["name"], Amount)
        TriggerClientEvent('inventory:client:ItemBox', src, ItemData, "add")
    end

    if (CTRPDiving.Locations[Area].TotalCoral - 1) == 0 then
        for k, v in pairs(CTRPDiving.Locations[CurrentDivingArea].coords.Coral) do
            v.PickedUp = false
        end
        CTRPDiving.Locations[CurrentDivingArea].TotalCoral = CTRPDiving.Locations[CurrentDivingArea].DefaultCoral

        local newLocation = math.random(1, #CTRPDiving.Locations)
        while (newLocation == CurrentDivingArea) do
            Citizen.Wait(3)
            newLocation = math.random(1, #CTRPDiving.Locations)
        end
        CurrentDivingArea = newLocation
        
        TriggerClientEvent('ctrp-diving:client:NewLocations', -1)
    else
        CTRPDiving.Locations[Area].coords.Coral[Coral].PickedUp = Bool
        CTRPDiving.Locations[Area].TotalCoral = CTRPDiving.Locations[Area].TotalCoral - 1
    end

    TriggerClientEvent('ctrp-diving:server:UpdateCoral', -1, Area, Coral, Bool)
end)

RegisterServerEvent('ctrp-diving:server:RemoveGear')
AddEventHandler('ctrp-diving:server:RemoveGear', function()
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)

    Player.Functions.RemoveItem("diving_gear", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, CTRPFW.Shared.Items["diving_gear"], "remove")
end)

RegisterServerEvent('ctrp-diving:server:GiveBackGear')
AddEventHandler('ctrp-diving:server:GiveBackGear', function()
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)
    
    Player.Functions.AddItem("diving_gear", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, CTRPFW.Shared.Items["diving_gear"], "add")
end)