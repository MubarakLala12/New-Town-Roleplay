CTRPFW = nil
TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)

local AlarmActivated = false

RegisterServerEvent('prison:server:SetJailStatus')
AddEventHandler('prison:server:SetJailStatus', function(jailTime)
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)
    Player.Functions.SetMetaData("injail", jailTime)
    if jailTime > 0 then
        if Player.PlayerData.job.name ~= "unemployed" then
            Player.Functions.SetJob("unemployed")
            TriggerClientEvent('CTRPFW:Notify', src, "You are unemployed..")
        end
    end
end)

RegisterServerEvent('prison:server:SaveJailItems')
AddEventHandler('prison:server:SaveJailItems', function(jailTime)
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)
    local amount = 10
    if Player.PlayerData.metadata["jailitems"] == nil or next(Player.PlayerData.metadata["jailitems"]) == nil then
        Player.Functions.SetMetaData("jailitems", Player.PlayerData.items)
        Player.Functions.AddMoney('cash', 80)
        Citizen.Wait(2000)
        Player.Functions.ClearInventory()
    end
end)

RegisterServerEvent('prison:server:GiveJailItems')
AddEventHandler('prison:server:GiveJailItems', function()
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)
    Player.Functions.ClearInventory()
    Citizen.Wait(1000)
    for k, v in pairs(Player.PlayerData.metadata["jailitems"]) do
        Player.Functions.AddItem(v.name, v.amount, false, v.info)
    end
    Citizen.Wait(1000)
    Player.Functions.SetMetaData("jailitems", {})
end)

RegisterServerEvent('prison:server:SecurityLockdown')
AddEventHandler('prison:server:SecurityLockdown', function()
    local src = source
    TriggerClientEvent("prison:client:SetLockDown", -1, true)
    for k, v in pairs(CTRPFW.Functions.GetPlayers()) do
        local Player = CTRPFW.Functions.GetPlayer(v)
        if Player ~= nil then
            if Player.PlayerData.job.name == "police" and Player.PlayerData.job.onduty then
                TriggerClientEvent("prison:client:PrisonBreakAlert", v)
            end
        end
	end
end)

RegisterServerEvent('prison:server:SetGateHit')
AddEventHandler('prison:server:SetGateHit', function(key)
    local src = source
    TriggerClientEvent("prison:client:SetGateHit", -1, key, true)
    if math.random(1, 100) <= 50 then
        for k, v in pairs(CTRPFW.Functions.GetPlayers()) do
            local Player = CTRPFW.Functions.GetPlayer(v)
            if Player ~= nil then
                if Player.PlayerData.job.name == "police" and Player.PlayerData.job.onduty then
                    TriggerClientEvent("prison:client:PrisonBreakAlert", v)
                end
            end
        end
    end
end)

RegisterServerEvent('prison:server:CheckRecordStatus')
AddEventHandler('prison:server:CheckRecordStatus', function()
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)
    local CriminalRecord = Player.PlayerData.metadata["criminalrecord"]
    local currentDate = os.date("*t")

    if (CriminalRecord["date"].month + 1) == 13 then
        CriminalRecord["date"].month = 0
    end

    if CriminalRecord["hasRecord"] then
        if currentDate.month == (CriminalRecord["date"].month + 1) or currentDate.day == (CriminalRecord["date"].day - 1) then
            CriminalRecord["hasRecord"] = false
            CriminalRecord["date"] = nil
        end
    end
end)

RegisterServerEvent('prison:server:JailAlarm')
AddEventHandler('prison:server:JailAlarm', function()
    if not AlarmActivated then
        TriggerClientEvent('prison:client:JailAlarm', -1, true)
        SetTimeout(5 * (60 * 1000), function()
            TriggerClientEvent('prison:client:JailAlarm', -1, false)
        end)
    end
end)

CTRPFW.Functions.CreateUseableItem("electronickit", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.GetItemByName(item.name) then
        TriggerClientEvent("electronickit:UseElectronickit", source)
    end
end)

CTRPFW.Functions.CreateCallback('prison:server:IsAlarmActive', function(source, cb)
    cb(AlarmActivated)
end)

RegisterNetEvent("prison:virus:wire")
AddEventHandler("prison:virus:wire", function(item, count)
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)
    local luck1 = math.random(1, 100)
    local itemFound1 = true
    local itemCount1 = 1

    if itemFound1 then
        for i = 1, itemCount1, 1 do
            local randomItem = Config.jailItem["type"]math.random(1, 1)
            local itemInfo = CTRPFW.Shared.Items[randomItem]
            if luck1 == 100 then
                randomItem = "electronickit"
                itemInfo = CTRPFW.Shared.Items[randomItem]
               
                Player.Functions.AddItem(randomItem, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, itemInfo, "add")
            elseif luck1 >= 80 and luck1 <= 90 then
                randomItem = "phone"
                itemInfo = CTRPFW.Shared.Items[randomItem]
               
                Player.Functions.AddItem(randomItem, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, itemInfo, "add")
            elseif luck1 >= 40 and luck1 <= 80 then
                randomItem = "wire"
                itemInfo = CTRPFW.Shared.Items[randomItem]
               
                Player.Functions.AddItem(randomItem, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, itemInfo, "add")
            elseif luck1 >= 10 and luck1 <= 40 then
                TriggerClientEvent('CTRPFW:Notify', src, "No Item Found " , "error")
            end
            Citizen.Wait(500)
        end
    end
end)

RegisterNetEvent("prison:virus:phone")
AddEventHandler("prison:virus:phone", function(item, count)
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)
    local luck1 = math.random(1, 100)
    local itemFound1 = true
    local itemCount1 = 1

    if itemFound1 then
        for i = 1, itemCount1, 1 do
            local randomItem = Config.jailItem["type"]math.random(1, 1)
            local itemInfo = CTRPFW.Shared.Items[randomItem]
            if luck1 >= 10 and luck1 <= 40 or luck1 == 100 then
                randomItem = "radiochip"
                itemInfo = CTRPFW.Shared.Items[randomItem]
               
                Player.Functions.AddItem(randomItem, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, itemInfo, "add")
            end
            Citizen.Wait(500)
        end
    end
end)
