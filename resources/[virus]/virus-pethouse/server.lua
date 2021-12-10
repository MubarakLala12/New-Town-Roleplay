CTRPFW = nil
TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)

RegisterServerEvent("virus-pethouse:SendLanguage")
AddEventHandler("virus-pethouse:SendLanguage", function()
    local s = source
    TriggerClientEvent("virus-pethouse:UpdateLanguage", s, K9Config.Languages[K9Config.LanguageChoice])
end)


RegisterServerEvent("virus-pethouse:spawnpet")
AddEventHandler("virus-pethouse:spawnpet", function()
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)  
        if K9Config.OpenMenuIdentifierRestriction then
            local foundIdentifier = false
            for a = 1, #K9Config.LicenseIdentifiers do
                if not foundIdentifier then
                    if GetPlayerId('license', src) == K9Config.LicenseIdentifiers[a] then
                        foundIdentifier = true
                    end
                end
            end
            for b = 1, #K9Config.SteamIdentifiers do
                if not foundIdentifier then
                    if GetPlayerId('steam', src) == K9Config.SteamIdentifiers[b] then
                        foundIdentifier = true
                    end
                end
            end
            if foundIdentifier then
                TriggerClientEvent("virus-pethouse:OpenMenu", src, K9Config.OpenMenuPedRestriction, K9Config.PedsList)
                return
            else
                TriggerClientEvent("virus-pethouse:IdentifierRestricted", src)
            end
        else
            TriggerClientEvent("virus-pethouse:OpenMenu", src, K9Config.OpenMenuPedRestriction, K9Config.PedsList)
        end
end)

RegisterServerEvent("virus-pethouse:RequestVehicleToggle")
AddEventHandler("virus-pethouse:RequestVehicleToggle", function()
    local src = source
    print("Requested Vehicle Toggle")
    TriggerClientEvent("virus-pethouse:ToggleVehicle", src, K9Config.VehicleRestriction, K9Config.VehiclesList)
end)

RegisterServerEvent("virus-pethouse:RequestItems")
AddEventHandler("virus-pethouse:RequestItems", function()
    print("Requested Items")
    local src = source
    TriggerClientEvent("virus-pethouse:SearchVehicle", src, K9Config.Items, K9Config.OpenDoorsOnSearch)
end)

--[[ Functions ]]--
function GetPlayerId(type, id)
    local identifiers = GetPlayerIdentifiers(id)
    for i = 1, #identifiers do
        if string.find(identifiers[i], type, 1) ~= nil then
            return identifiers[i]
        end
    end
    return false
end


RegisterCommand('petshop', function(source)
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)
    TriggerClientEvent('virus-pethouse:spawnpetz' , src)
end)


RegisterCommand('putpet', function(source)
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)
    TriggerClientEvent('virus-pethouse:ToggleVehicle' , src)
end)

RegisterCommand('sit', function(source)
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)
    TriggerClientEvent('virus-pethouse:sit' , src)
end)

RegisterCommand('laydown', function(source)
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)
    TriggerClientEvent('virus-pethouse:laydown' , src)
end)