CTRPFW = nil
TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)

-- Code

CTRPFW.Functions.CreateCallback('ctrp-occasions:server:getVehicles', function(source, cb)
    CTRPFW.Functions.ExecuteSql(false, 'SELECT * FROM `occasion_vehicles`', function(result)
        if result[1] ~= nil then
            cb(result)
        else
            cb(nil)
        end
    end)
end)

CTRPFW.Functions.CreateCallback("ctrp-garage:server:checkVehicleOwner", function(source, cb, plate)
    local src = source
    local pData = CTRPFW.Functions.GetPlayer(src)

    exports['ghmattimysql']:execute('SELECT * FROM player_vehicles WHERE plate = @plate AND citizenid = @citizenid', {['@plate'] = plate, ['@citizenid'] = pData.PlayerData.citizenid}, function(result)
        if result[1] ~= nil then
            cb(true)
        else
            cb(false)
        end
    end)
end)

CTRPFW.Functions.CreateCallback("ctrp-occasions:server:getSellerInformation", function(source, cb, citizenid)
    local src = source

    exports['ghmattimysql']:execute('SELECT * FROM players WHERE citizenid = @citizenid', {['@citizenid'] = citizenid}, function(result)
        if result[1] ~= nil then
            cb(result[1])
        else
            cb(nil)
        end
    end)
end)

RegisterServerEvent('ctrp-occasions:server:ReturnVehicle')
AddEventHandler('ctrp-occasions:server:ReturnVehicle', function(vehicleData)
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)
    CTRPFW.Functions.ExecuteSql(false, "SELECT * FROM `occasion_vehicles` WHERE `plate` = '"..vehicleData['plate'].."' AND `occasionid` = '"..vehicleData["oid"].."'", function(result)
        if result[1] ~= nil then
            if result[1].seller == Player.PlayerData.citizenid then
                CTRPFW.Functions.ExecuteSql(false, "INSERT INTO `player_vehicles` (`steam`, `citizenid`, `vehicle`, `hash`, `mods`, `plate`, `state`) VALUES ('"..Player.PlayerData.steam.."', '"..Player.PlayerData.citizenid.."', '"..vehicleData["model"].."', '"..GetHashKey(vehicleData["model"]).."', '"..vehicleData["mods"].."', '"..vehicleData["plate"].."', '0')")
                CTRPFW.Functions.ExecuteSql(false, "DELETE FROM `occasion_vehicles` WHERE `occasionid` = '"..vehicleData["oid"].."' and `plate` = '"..vehicleData['plate'].."'")
                TriggerClientEvent("ctrp-occasions:client:ReturnOwnedVehicle", src, result[1])
                TriggerClientEvent('ctrp-occasion:client:refreshVehicles', -1)
            else
                TriggerClientEvent('CTRPFW:Notify', src, 'This is not your vehicle...', 'error', 3500)
            end
        else
            TriggerClientEvent('CTRPFW:Notify', src, 'Vehicle does not exist...', 'error', 3500)
        end
    end)
end)

--[[RegisterServerEvent('ctrp-occasions:server:sellVehicle')
AddEventHandler('ctrp-occasions:server:sellVehicle', function(vehiclePrice, vehicleData)
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)
    CTRPFW.Functions.ExecuteSql(true, "DELETE FROM `player_vehicles` WHERE `plate` = '"..vehicleData.plate.."' AND `vehicle` = '"..vehicleData.model.."'")
    CTRPFW.Functions.ExecuteSql(true, "INSERT INTO `occasion_vehicles` (`seller`, `price`, `description`, `plate`, `model`, `mods`, `occasionid`) VALUES ('"..Player.PlayerData.citizenid.."', '"..vehiclePrice.."', '"..escapeSqli(vehicleData.desc).."', '"..vehicleData.plate.."', '"..vehicleData.model.."', '"..json.encode(vehicleData.mods).."', '"..generateOID().."')")

    TriggerEvent("ctrp-log:server:sendLog", Player.PlayerData.citizenid, "vehiclesold", {model=vehicleData.model, vehiclePrice=vehiclePrice})
    TriggerEvent("ctrp-log:server:CreateLog", "vehicleshop", "Vehicle for  sale", "red", "**"..GetPlayerName(src) .. "** has a " .. vehicleData.model .. " List on sale for "..vehiclePrice)

    TriggerClientEvent('ctrp-occasion:client:refreshVehicles', -1)
end)]]

RegisterServerEvent('ctrp-occasions:server:sellVehicle')
AddEventHandler('ctrp-occasions:server:sellVehicle', function(vehiclePrice, vehicleData)
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)

    local financeVeh = false
    CTRPFW.Functions.ExecuteSql(false, "SELECT * FROM `player_vehicles` WHERE `citizenid` = '"..Player.PlayerData.citizenid.."'", function(results)

		for k,v in pairs(results) do
			if v.repaytime > 1 and v.finance > 1 then
				financeVeh = true  
			end	
		end

        if financeVeh then
            TriggerClientEvent('CTRPFW:Notify', src, 'You cannot sell Financed Vehicle...', 'error', 3500)
        else
            CTRPFW.Functions.ExecuteSql(true, "DELETE FROM `player_vehicles` WHERE `plate` = '"..vehicleData.plate.."' AND `vehicle` = '"..vehicleData.model.."'")
            CTRPFW.Functions.ExecuteSql(true, "INSERT INTO `occasion_vehicles` (`seller`, `price`, `description`, `plate`, `model`, `mods`, `occasionid`) VALUES ('"..Player.PlayerData.citizenid.."', '"..vehiclePrice.."', '"..escapeSqli(vehicleData.desc).."', '"..vehicleData.plate.."', '"..vehicleData.model.."', '"..json.encode(vehicleData.mods).."', '"..generateOID().."')")

            TriggerEvent("ctrp-log:server:sendLog", Player.PlayerData.citizenid, "vehiclesold", {model=vehicleData.model, vehiclePrice=vehiclePrice})
            TriggerEvent("ctrp-log:server:CreateLog", "vehicleshop", "Vehicle for  sale", "red", "**"..GetPlayerName(src) .. "** has a " .. vehicleData.model .. " List on sale for "..vehiclePrice)

            TriggerClientEvent('ctrp-occasion:client:refreshVehicles', -1)
        end
	end)
    
end)

RegisterServerEvent('ctrp-occasions:server:buyVehicle')
AddEventHandler('ctrp-occasions:server:buyVehicle', function(vehicleData)
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)

    CTRPFW.Functions.ExecuteSql(false, "SELECT * FROM `occasion_vehicles` WHERE `plate` = '"..vehicleData['plate'].."' AND `occasionid` = '"..vehicleData["oid"].."'", function(result)
        if result[1] ~= nil and next(result[1]) ~= nil then
            if Player.PlayerData.money.cash >= result[1].price then
                local SellerCitizenId = result[1].seller
                local SellerData = CTRPFW.Functions.GetPlayerByCitizenId(SellerCitizenId)
                -- New price calculation minus tax
                local NewPrice = math.ceil((result[1].price / 100) * 77)

                Player.Functions.RemoveMoney('cash', result[1].price)

                -- Insert vehicle for buyer
                CTRPFW.Functions.ExecuteSql(false, "INSERT INTO `player_vehicles` (`steam`, `citizenid`, `vehicle`, `hash`, `mods`, `plate`, `state`) VALUES ('"..Player.PlayerData.steam.."', '"..Player.PlayerData.citizenid.."', '"..result[1].model.."', '"..GetHashKey(result[1].model).."', '"..result[1].mods.."', '"..result[1].plate.."', '0')")

                -- Handle money transfer
                if SellerData ~= nil then
                    -- Add money for online
                    SellerData.Functions.AddMoney('bank', NewPrice)
                else
                    -- Add money for offline
                    CTRPFW.Functions.ExecuteSql(true, "SELECT * FROM `players` WHERE `citizenid` = '"..SellerCitizenId.."'", function(BuyerData)
                        if BuyerData[1] ~= nil then
                            local BuyerMoney = json.decode(BuyerData[1].money)
                            BuyerMoney.bank = BuyerMoney.bank + NewPrice
                            CTRPFW.Functions.ExecuteSql(false, "UPDATE `players` SET `money` = '"..json.encode(BuyerMoney).."' WHERE `citizenid` = '"..SellerCitizenId.."'")
                        end
                    end)
                end

                TriggerEvent("ctrp-log:server:sendLog", Player.PlayerData.citizenid, "vehiclebought", {model = result[1].model, from = SellerCitizenId, moneyType = "cash", vehiclePrice = result[1].price, plate = result[1].plate})
                TriggerEvent("ctrp-log:server:CreateLog", "vehicleshop", "Occasion bought", "green", "**"..GetPlayerName(src) .. "** Bought a occasion for "..result[1].price .. " (" .. result[1].plate .. ") of **"..SellerCitizenId.."**")
                TriggerClientEvent('ctrp-occasion:client:refreshVehicles', -1)

                -- Delete vehicle from Occasion
                CTRPFW.Functions.ExecuteSql(false, "DELETE FROM `occasion_vehicles` WHERE `plate` = '"..result[1].plate.."' and `occasionid` = '"..result[1].occasionid.."'")

                -- Send selling mail to seller
                TriggerEvent('ctrp-phone:server:sendNewMailToOffline', SellerCitizenId, {
                    sender = "Mosleys Occasions",
                    subject = "You sold a vehicle!",
                    message = "Your "..CTRPFW.Shared.Vehicles[result[1].model].name.." has been sold for $"..result[1].price..",-!"
                })
            elseif Player.PlayerData.money.bank >= result[1].price then
                local SellerCitizenId = result[1].seller
                local SellerData = CTRPFW.Functions.GetPlayerByCitizenId(SellerCitizenId)
                -- New price calculation minus tax
                local NewPrice = math.ceil((result[1].price / 100) * 77)

                Player.Functions.RemoveMoney('bank', result[1].price)

                -- Insert vehicle for buyer
                CTRPFW.Functions.ExecuteSql(false, "INSERT INTO `player_vehicles` (`steam`, `citizenid`, `vehicle`, `hash`, `mods`, `plate`, `state`) VALUES ('"..Player.PlayerData.steam.."', '"..Player.PlayerData.citizenid.."', '"..result[1].model.."', '"..GetHashKey(result[1].model).."', '"..result[1].mods.."', '"..result[1].plate.."', '0')")

                -- Handle money transfer
                if SellerData ~= nil then
                    -- Add money for online
                    SellerData.Functions.AddMoney('bank', NewPrice)
                else
                    -- Add money for offline
                    CTRPFW.Functions.ExecuteSql(true, "SELECT * FROM `players` WHERE `citizenid` = '"..SellerCitizenId.."'", function(BuyerData)
                        if BuyerData[1] ~= nil then
                            local BuyerMoney = json.decode(BuyerData[1].money)
                            BuyerMoney.bank = BuyerMoney.bank + NewPrice
                            CTRPFW.Functions.ExecuteSql(false, "UPDATE `players` SET `money` = '"..json.encode(BuyerMoney).."' WHERE `citizenid` = '"..SellerCitizenId.."'")
                        end
                    end)
                end

                TriggerEvent("ctrp-log:server:sendLog", Player.PlayerData.citizenid, "vehiclebought", {model = result[1].model, from = SellerCitizenId, moneyType = "cash", vehiclePrice = result[1].price, plate = result[1].plate})
                TriggerEvent("ctrp-log:server:CreateLog", "vehicleshop", "Occasion bought", "green", "**"..GetPlayerName(src) .. "** Bought a occasion for "..result[1].price .. " (" .. result[1].plate .. ") of **"..SellerCitizenId.."**")
                TriggerClientEvent('ctrp-occasion:client:refreshVehicles', -1)

                -- Delete vehicle from Occasion
                CTRPFW.Functions.ExecuteSql(false, "DELETE FROM `occasion_vehicles` WHERE `plate` = '"..result[1].plate.."' and `occasionid` = '"..result[1].occasionid.."'")

                -- Send selling mail to seller
                TriggerEvent('ctrp-phone:server:sendNewMailToOffline', SellerCitizenId, {
                    sender = "Mosleys Occasions",
                    subject = "You sold a vehicle!",
                    message = "You "..CTRPFW.Shared.Vehicles[result[1].model].name.." has been sold for $"..result[1].price..",-!"
                })
            else
                TriggerClientEvent('CTRPFW:Notify', src, 'You don\'t have enough cash...', 'error', 3500)
            end
        end
    end)
end)

function generateOID()
    local num = math.random(1, 10)..math.random(111, 999)

    return "OC"..num
end

function round(number)
    return number - (number % 1)
end

function escapeSqli(str)
    local replacements = { ['"'] = '\\"', ["'"] = "\\'" }
    return str:gsub( "['\"]", replacements ) -- or string.gsub( source, "['\"]", replacements )
end
