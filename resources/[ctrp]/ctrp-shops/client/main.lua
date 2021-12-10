CTRPFW = nil

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        if CTRPFW == nil then
            TriggerEvent("CTRPFW:GetObject", function(obj) CTRPFW = obj end)
            Citizen.Wait(200)
        end
    end
end)

-- code

function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

--[[Citizen.CreateThread(function()
    while true do
        local InRange = false
        local PlayerPed = GetPlayerPed(-1)
        local PlayerPos = GetEntityCoords(PlayerPed)

        for shop, _ in pairs(Config.Locations) do
            local position = Config.Locations[shop]["coords"]
            for _, loc in pairs(position) do
                local dist = GetDistanceBetweenCoords(PlayerPos, loc["x"], loc["y"], loc["z"])
                if dist < 10 then
                    InRange = true
                    DrawMarker(2, loc["x"], loc["y"], loc["z"], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.25, 0.2, 0.1, 255, 255, 255, 155, 0, 0, 0, 1, 0, 0, 0)
                    if dist < 1 then
                        DrawText3Ds(loc["x"], loc["y"], loc["z"] + 0.15, '~g~E~w~ - Shop')
                        if IsControlJustPressed(0, Config.Keys["E"]) then
                            local ShopItems = {}
                            ShopItems.label = Config.Locations[shop]["label"]
                            ShopItems.items = Config.Locations[shop]["products"]
                            ShopItems.slots = 30
                            TriggerServerEvent("inventory:server:OpenInventory", "shop", "Itemshop_"..shop, ShopItems)
                        end
                    end
                end
            end
        end

        if not InRange then
            Citizen.Wait(5000)
        end
        Citizen.Wait(5)
    end
end)]]

Citizen.CreateThread(function()
    while true do
        local InRange = false
        local PlayerPed = GetPlayerPed(-1)
        local PlayerPos = GetEntityCoords(PlayerPed)

        for shop, _ in pairs(Config.Locations) do
            local position = Config.Locations[shop]["coords"]
            for _, loc in pairs(position) do
                local dist = GetDistanceBetweenCoords(PlayerPos, loc["x"], loc["y"], loc["z"])
                if dist < 10 then
                    InRange = true
                    DrawMarker(2, loc["x"], loc["y"], loc["z"], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.25, 0.2, 0.1, 255, 255, 255, 155, 0, 0, 0, 1, 0, 0, 0)
                    if dist < 1 then
                        DrawText3Ds(loc["x"], loc["y"], loc["z"] + 0.15, '~g~E~w~ - Shop')
                        if IsControlJustPressed(0, Config.Keys["E"]) then
                            if dist < 10 then
                                if Config.Locations[shop]["products"] == Config.Products["weapons"] then
                                    CTRPFW.Functions.TriggerCallback('CTRPFW:HasItem', function(result)
                                        if result then
                                            SetWeaponSeries()
                                            local ShopItems = {}
                                            ShopItems.label = Config.Locations[shop]["label"]
                                            ShopItems.items = Config.Locations[shop]["products"]
                                            ShopItems.slots = 30
                                            TriggerServerEvent("inventory:server:OpenInventory", "shop", "Itemshop"..shop, ShopItems)
                                        else
                                            CTRPFW.Functions.Notify("You don't have weapon license!", "error")
                                        end
                                    end, "weaponlicense")

                                elseif Config.Locations[shop]["products"] == Config.Products["inbag"] then
                                    CTRPFW.Functions.TriggerCallback('CTRPFW:HasItem', function(result)
                                        if result then
                                            CTRPFW.Functions.Notify("YOU ALREADY HAVE BAG!", "error")
                                        else
                                            
                                            local ShopItems = {}
                                            ShopItems.label = Config.Locations[shop]["label"]
                                            ShopItems.items = Config.Locations[shop]["products"]
                                            ShopItems.slots = 30
                                            TriggerServerEvent("inventory:server:OpenInventory", "shop", "Itemshop"..shop, ShopItems)
                                        end
                                    end, "invbag")
                                
                                else
                                    local ShopItems = {}
                                    ShopItems.label = Config.Locations[shop]["label"]
                                    ShopItems.items = Config.Locations[shop]["products"]
                                    ShopItems.slots = 30
                                    TriggerServerEvent("inventory:server:OpenInventory", "shop", "Itemshop_"..shop, ShopItems)
                                end
                            end
                        end
                    end
                end
            end
        end

        if not InRange then
            Citizen.Wait(5000)
        end
        Citizen.Wait(5)
    end
end)

function SetWeaponSeries()
    for k, v in pairs(Config.Products["weapons"]) do
        if k < 10 then
            Config.Products["weapons"][k].info.serie = tostring(Config.RandomInt(2) .. Config.RandomStr(3) .. Config.RandomInt(1) .. Config.RandomStr(2) .. Config.RandomInt(3) .. Config.RandomStr(4))
        end
    end
end

function round(num, numDecimalPlaces)
    return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", num))
end

RegisterNetEvent('ctrp-shops:client:UpdateShop')
AddEventHandler('ctrp-shops:client:UpdateShop', function(shop, itemData, amount)
    TriggerServerEvent('ctrp-shops:server:UpdateShopItems', shop, itemData, amount)
end)

RegisterNetEvent('ctrp-shops:client:SetShopItems')
AddEventHandler('ctrp-shops:client:SetShopItems', function(shop, shopProducts)
    Config.Locations[shop]["products"] = shopProducts
end)

RegisterNetEvent('ctrp-shops:client:RestockShopItems')
AddEventHandler('ctrp-shops:client:RestockShopItems', function(shop, amount)
    if Config.Locations[shop]["products"] ~= nil then
        for k, v in pairs(Config.Locations[shop]["products"]) do
            Config.Locations[shop]["products"][k].amount = Config.Locations[shop]["products"][k].amount + amount
        end
    end
end)

Citizen.CreateThread(function()
    for store,_ in pairs(Config.Locations) do
        StoreBlip = AddBlipForCoord(Config.Locations[store]["coords"][1]["x"], Config.Locations[store]["coords"][1]["y"], Config.Locations[store]["coords"][1]["z"])
        SetBlipColour(StoreBlip, 0)

        if Config.Locations[store]["products"] == Config.Products["normal"] then
            SetBlipSprite(StoreBlip, 52)
            SetBlipScale(StoreBlip, 0.6)
        elseif Config.Locations[store]["products"] == Config.Products["ophone"] then
            SetBlipSprite(StoreBlip, 606)
            SetBlipScale(StoreBlip, 0.7)
        elseif Config.Locations[store]["products"] == Config.Products["gearshop"] then
            SetBlipSprite(StoreBlip, 52)
            SetBlipScale(StoreBlip, 0.6)
        elseif Config.Locations[store]["products"] == Config.Products["hardware"] then
            SetBlipSprite(StoreBlip, 402)
            SetBlipScale(StoreBlip, 0.8)
        elseif Config.Locations[store]["products"] == Config.Products["weapons"] then
            SetBlipSprite(StoreBlip, 110)
            SetBlipScale(StoreBlip, 0.85)
        elseif Config.Locations[store]["products"] == Config.Products["leisureshop"] then
            SetBlipSprite(StoreBlip, 52)
            SetBlipScale(StoreBlip, 0.6)
            SetBlipColour(StoreBlip, 3)
        -- elseif Config.Locations[store]["products"] == Config.Products["mustapha"] then
        --     SetBlipSprite(StoreBlip, 439)
        --     SetBlipScale(StoreBlip, 0.6)
        --     SetBlipColour(StoreBlip, 3)
        elseif Config.Locations[store]["products"] == Config.Products["coffeeshop"] then
            SetBlipSprite(StoreBlip, 140)
            SetBlipScale(StoreBlip, 0.55)
        elseif Config.Locations[store]["products"] == Config.Products["weedsuper"] then
            SetBlipSprite(StoreBlip, 140)
            SetBlipScale(StoreBlip, 0.55)
        elseif Config.Locations[store]["products"] == Config.Products["casinohb"] then
            SetBlipSprite(StoreBlip, 605)
            SetBlipScale(StoreBlip, 0.75)
        elseif Config.Locations[store]["products"] == Config.Products["Diego"] then
            SetBlipSprite(StoreBlip, 524)
            SetBlipScale(StoreBlip, 0.55)
        elseif Config.Locations[store]["products"] == Config.Products["bahama"] then
            SetBlipSprite(StoreBlip, 279)
            SetBlipScale(StoreBlip, 0.55)
            SetBlipColour(StoreBlip, 1)
        --[[elseif Config.Locations[store]["products"] == Config.Products["taquila"] then
            SetBlipSprite(StoreBlip, 93)
            SetBlipScale(StoreBlip, 0.75)
            SetBlipColour(StoreBlip, 0)]]
        elseif Config.Locations[store]["products"] == Config.Products["waterclub"] then
            SetBlipSprite(StoreBlip, 93)
            SetBlipScale(StoreBlip, 0.65)
            SetBlipColour(StoreBlip, 0)
        -- elseif Config.Locations[store]["products"] == Config.Products["weazelnews"] then
        --     SetBlipSprite(StoreBlip, 0)
        -- elseif Config.Locations[store]["products"] == Config.Products["cinema"] then
        --     SetBlipSprite(StoreBlip, 135)
        --     SetBlipScale(StoreBlip, 0.75)
        --     SetBlipColour(StoreBlip, 4)
        elseif Config.Locations[store]["products"] == Config.Products["comedyclub"] then
            SetBlipSprite(StoreBlip, 102)
            SetBlipScale(StoreBlip, 0.75)
            SetBlipColour(StoreBlip, 1)
        elseif Config.Locations[store]["products"] == Config.Products["unicorn"] then
            SetBlipSprite(StoreBlip, 121)
            SetBlipScale(StoreBlip, 0.65)
            SetBlipColour(StoreBlip, 1)
        elseif Config.Locations[store]["products"] == Config.Products["hotdog"] then
            SetBlipSprite(StoreBlip, 0)          
        -- elseif Config.Locations[store]["products"] == Config.Products["petrolpump"] then
        --     SetBlipSprite(StoreBlip, 0)
        elseif Config.Locations[store]["products"] == Config.Products["grocerystoreold"] then
            SetBlipSprite(StoreBlip, 103)
            SetBlipScale(StoreBlip, 0.70)
            SetBlipColour(StoreBlip, 5)
        -- elseif Config.Locations[store]["products"] == Config.Products["mechanic"] then 
        --     SetBlipSprite(StoreBlip, 0)
        -- elseif Config.Locations[store]["products"] == Config.Products["grocerystore1"] then
        --     SetBlipSprite(StoreBlip, 0)
        -- elseif Config.Locations[store]["products"] == Config.Products["grocerystore3"] then
        --     SetBlipSprite(StoreBlip, 0)
        -- elseif Config.Locations[store]["products"] == Config.Products["grocerystore4"] then
        --     SetBlipSprite(StoreBlip, 0)
        elseif Config.Locations[store]["products"] == Config.Products["gov"] then
            SetBlipSprite(StoreBlip, 0)
        -- elseif Config.Locations[store]["products"] == Config.Products["inbag"] then
        --     SetBlipSprite(StoreBlip, 568)
        --     SetBlipScale(StoreBlip, 0.60)
        end

        SetBlipDisplay(StoreBlip, 4)
        SetBlipAsShortRange(StoreBlip, true)


        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(Config.Locations[store]["label"])
        EndTextCommandSetBlipName(StoreBlip)
    end
end)
