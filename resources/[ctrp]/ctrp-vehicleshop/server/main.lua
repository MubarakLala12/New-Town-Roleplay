CTRPFW = nil
local pdmmoney = 0
TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)
local com = 0
local NumberCharset = {}
local Charset = {}

for i = 48,  57 do table.insert(NumberCharset, string.char(i)) end

for i = 65,  90 do table.insert(Charset, string.char(i)) end
for i = 97, 122 do table.insert(Charset, string.char(i)) end

-- code
Citizen.CreateThread(function()
while true do
    Citizen.Wait(1)
	TriggerClientEvent('setcom', -1, com)
end
end)
RegisterNetEvent('ctrp-vehicleshop:server:buyVehicle')
AddEventHandler('ctrp-vehicleshop:server:buyVehicle', function(vehicleData, garage)
    local src = source
    local pData = CTRPFW.Functions.GetPlayer(src)
    local cid = pData.PlayerData.citizenid
    local vData = CTRPFW.Shared.Vehicles[vehicleData["model"]]
    local balance = pData.PlayerData.money["bank"]

    if (balance - vData["price"]) >= 0 then
        local plate = GeneratePlate()
        CTRPFW.Functions.ExecuteSql(false, "INSERT INTO `player_vehicles` (`steam`, `citizenid`, `vehicle`, `hash`, `mods`, `plate`, `garage`) VALUES ('"..pData.PlayerData.steam.."', '"..cid.."', '"..vData["model"].."', '"..GetHashKey(vData["model"]).."', '{}', '"..plate.."', '"..garage.."')")
        TriggerClientEvent("CTRPFW:Notify", src, "Successful! Your vehicle was delivered to "..CTRP.GarageLabel[garage], "success", 5000)
        
       print("1")
       TriggerClientEvent('ctrp-moneysafesedm:server:DepositMoney', src , vData["price"])
	  
	   TriggerEvent("ctrp-log:server:sendLog", cid, "vehiclebought", {model=vData["model"], name=vData["name"], from="garage", location=CTRP.GarageLabel[garage], moneyType="bank", price=vData["price"], plate=plate})
        TriggerEvent("ctrp-log:server:CreateLog", "vehicleedmshop", "Vehicle purchased (EDM)", "green", "**"..GetPlayerName(src) .. "** has a " .. vData["name"] .. " bought for $" .. vData["price"])
    else
		TriggerClientEvent("CTRPFW:Notify", src, "You don't have enough money, you miss $"..format_thousand(vData["price"] - balance), "error", 5000)
    end
end)

RegisterNetEvent('ctrp-vehicleshop:server:buyShowroomVehicle')
AddEventHandler('ctrp-vehicleshop:server:buyShowroomVehicle', function(vehicle, class)
    local src = source
    local pData = CTRPFW.Functions.GetPlayer(src)
    local cid = pData.PlayerData.citizenid
    local balance = pData.PlayerData.money["bank"]
    local vehiclePrice = CTRPFW.Shared.Vehicles[vehicle]["price"]
    local plate = GeneratePlate()
    local date = os.date('%Y-%m-%d')
    local govMoney = vehiclePrice * 30 /100
    local pdmMoney = vehiclePrice * 70 /100

    if (balance - vehiclePrice) >= 0 then
        CTRPFW.Functions.ExecuteSql(false, "INSERT INTO `player_vehicles` (`steam`, `citizenid`, `vehicle`, `hash`, `mods`, `plate`, `state`, `date`, `buy_price`) VALUES ('"..pData.PlayerData.steam.."', '"..cid.."', '"..vehicle.."', '"..GetHashKey(vehicle).."', '{}', '"..plate.."', 0, '"..date.."', '"..vehiclePrice.."')")
        TriggerClientEvent("CTRPFW:Notify", src, "Successful! Your vehicle is waiting for you outside.", "success", 5000)
        TriggerClientEvent('ctrp-vehicleshop:client:buyShowroomVehicle', src, vehicle, plate)
        
         print("2")
         pData.Functions.RemoveItem('buycard', 1)
         --TriggerClientEvent('ctrp-moneysafe:client:DepositMoney', src, vehiclePrice)

         TriggerClientEvent('ctrp-moneysafespdm:client:DepositMoney', src, pdmMoney)
         TriggerClientEvent('ctrp-moneysafesgov:client:DepositMoney', src, govMoney)
	    
        TriggerEvent("ctrp-log:server:sendLog", cid, "vehiclebought", {model=vehicle, name=CTRPFW.Shared.Vehicles[vehicle]["name"], from="showroom", moneyType="bank", price=CTRPFW.Shared.Vehicles[vehicle]["price"], plate=plate})
        TriggerEvent("ctrp-log:server:CreateLog", "vehicleshop", "Vehicle purchased (showroom)", "green", "**"..GetPlayerName(src) .. "** has a " .. CTRPFW.Shared.Vehicles[vehicle]["name"] .. " bought for $" .. CTRPFW.Shared.Vehicles[vehicle]["price"])
    else
        TriggerClientEvent("CTRPFW:Notify", src, "You don't have enough money, you miss $"..format_thousand(vehiclePrice - balance), "error", 5000)
    end
end)


function format_thousand(v)
    local s = string.format("%d", math.floor(v))
    local pos = string.len(s) % 3
    if pos == 0 then pos = 3 end
    return string.sub(s, 1, pos)
            .. string.gsub(string.sub(s, pos+1), "(...)", ".%1")
end

function GeneratePlate()
    local plate = tostring(GetRandomNumber(1)) .. GetRandomLetter(2) .. tostring(GetRandomNumber(3)) .. GetRandomLetter(2)
    CTRPFW.Functions.ExecuteSql(true, "SELECT * FROM `player_vehicles` WHERE `plate` = '"..plate.."'", function(result)
        while (result[1] ~= nil) do
            plate = tostring(GetRandomNumber(1)) .. GetRandomLetter(2) .. tostring(GetRandomNumber(3)) .. GetRandomLetter(2)
        end
        return plate
    end)
    return plate:upper()
end

function GetRandomNumber(length)
	Citizen.Wait(1)
	math.randomseed(GetGameTimer())
	if length > 0 then
		return GetRandomNumber(length - 1) .. NumberCharset[math.random(1, #NumberCharset)]
	else
		return ''
	end
end

function GetRandomLetter(length)
	Citizen.Wait(1)
	math.randomseed(GetGameTimer())
	if length > 0 then
		return GetRandomLetter(length - 1) .. Charset[math.random(1, #Charset)]
	else
		return ''
	end
end

RegisterServerEvent('ctrp-vehicleshop:server:setShowroomCarInUse')
AddEventHandler('ctrp-vehicleshop:server:setShowroomCarInUse', function(showroomVehicle, bool)
    CTRP.ShowroomVehicles[showroomVehicle].inUse = bool
    TriggerClientEvent('ctrp-vehicleshop:client:setShowroomCarInUse', -1, showroomVehicle, bool)
end)

RegisterServerEvent('ctrp-vehicleshop:server:setShowroomVehicle')
AddEventHandler('ctrp-vehicleshop:server:setShowroomVehicle', function(vData, k)
    CTRP.ShowroomVehicles[k].chosenVehicle = vData
    TriggerClientEvent('ctrp-vehicleshop:client:setShowroomVehicle', -1, vData, k)
end)

RegisterServerEvent('ctrp-vehicleshop:server:SetCustomShowroomVeh')
AddEventHandler('ctrp-vehicleshop:server:SetCustomShowroomVeh', function(vData, k)
    CTRP.ShowroomVehicles[k].vehicle = vData
    TriggerClientEvent('ctrp-vehicleshop:client:SetCustomShowroomVeh', -1, vData, k)
end)

CTRPFW.Commands.Add("sellv", "Sell", {}, false, function(source, args)
    local Player = CTRPFW.Functions.GetPlayer(source)
    local TargetId = args[1]

    if Player.PlayerData.job.name == "edm" then
        if TargetId ~= nil then
            TriggerClientEvent('ctrp-vehicleshop:client:SellCustomVehicle', source, TargetId)
        else
            TriggerClientEvent('CTRPFW:Notify', source, 'You must provide a Player ID!', 'error')
        end
    else
        TriggerClientEvent('CTRPFW:Notify', source, 'You are not a Vehicle Dealer', 'error')
    end
end)

CTRPFW.Commands.Add("testdrive", "Take Test of vehicle", {}, false, function(source, args)
    local Player = CTRPFW.Functions.GetPlayer(source)
    local TargetId = args[1]

    if Player.PlayerData.job.name == "edm" then
        TriggerClientEvent('ctrp-vehicleshop:client:DoTestrit', source, GeneratePlate())
    else
        TriggerClientEvent('CTRPFW:Notify', source, 'You are not a Vehicle Dealer', 'error')
    end
end)

CTRPFW.Commands.Add("setcom", "Set Vehicle Commission", {{name="commission", help="Commission"}}, true, function(source, args)
    local Player = CTRPFW.Functions.GetPlayer(source)
    local com2 = table.concat(args, " ")
    
    if Player.PlayerData.job.name == "pdm" then
        com = com2
    else
        TriggerClientEvent('CTRPFW:Notify', source, 'You are not a Vehicle Dealer', 'error')
    end   
end)

CTRPFW.Commands.Add("givetest", "Give Test of vehicle", {}, false, function(source, args)
    local Player = CTRPFW.Functions.GetPlayer(source)
    local TargetId = args[1]

    if Player.PlayerData.job.name == "pdm" then
        TriggerClientEvent('ctrp-vehicleshop:client:DoTestrit2', source, GeneratePlate())
    else
        TriggerClientEvent('CTRPFW:Notify', source, 'You are not a Vehicle Dealer', 'error')
    end
end)

RegisterServerEvent('ctrp-vehicleshop:server:SellCustomVehicle')
AddEventHandler('ctrp-vehicleshop:server:SellCustomVehicle', function(TargetId, ShowroomSlot)
    TriggerClientEvent('ctrp-vehicleshop:client:SetVehicleBuying', TargetId, ShowroomSlot)
end)

RegisterServerEvent('ctrp-vehicleshop:server:ConfirmVehicle')
AddEventHandler('ctrp-vehicleshop:server:ConfirmVehicle', function(ShowroomVehicle)
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)
    local VehPrice = CTRPFW.Shared.Vehicles[ShowroomVehicle.vehicle].price
    local plate = GeneratePlate()

    if Player.PlayerData.money.bank >= VehPrice then
       
       
        TriggerClientEvent('ctrp-moneysafesedm:client:DepositMoney', src, VehPrice)
	   print("3")
        TriggerClientEvent('ctrp-vehicleshop:client:ConfirmVehicle', src, ShowroomVehicle, plate)
        CTRPFW.Functions.ExecuteSql(false, "INSERT INTO `player_vehicles` (`steam`, `citizenid`, `vehicle`, `hash`, `mods`, `plate`, `state`) VALUES ('"..Player.PlayerData.steam.."', '"..Player.PlayerData.citizenid.."', '"..ShowroomVehicle.vehicle.."', '"..GetHashKey(ShowroomVehicle.vehicle).."', '{}', '"..plate.."', 0)")
	else
        TriggerClientEvent('CTRPFW:Notify', src, 'You don\'t have enough money ... You miss ('..(Player.PlayerData.money.bank - VehPrice)..',-)')     
    end
end)

-- CTRPFW.Functions.CreateCallback('ctrp-vehicleshop:server:SellVehicle', function(source, cb, vehicle, plate)
--     local VehicleData = CTRPFW.Shared.VehicleModels[vehicle]
--     local src = source
--     local Player = CTRPFW.Functions.GetPlayer(src)

--     CTRPFW.Functions.ExecuteSql(false, "SELECT * FROM `player_vehicles` WHERE `citizenid` = '"..Player.PlayerData.citizenid.."' AND `plate` = '"..plate.."'", function(result)
--         if result[1] ~= nil then
--             Player.Functions.AddMoney('bank', math.ceil(VehicleData["price"] / 100 * 60))
--             CTRPFW.Functions.ExecuteSql(false, "DELETE FROM `player_vehicles` WHERE `citizenid` = '"..Player.PlayerData.citizenid.."' AND `plate` = '"..plate.."'")
--             cb(true)
--         else
--             cb(false)
--         end
--     end)
-- end)

--------------------
--FINANCE SCRIPT--
--------------------
--BY VIRUS--
--------------------


--TRIGGER EVENT 

RegisterNetEvent('ctrp-vehicleshop:server:financeShowroomVehicle')
AddEventHandler('ctrp-vehicleshop:server:financeShowroomVehicle', function(vehicle, class)
    local src = source
    local pData = CTRPFW.Functions.GetPlayer(src)
    local cid = pData.PlayerData.citizenid
    local balance = pData.PlayerData.money["bank"]
    local vehiclePrice = CTRPFW.Shared.Vehicles[vehicle]["price"]
    local vehiclePrices = CTRPFW.Shared.Vehicles[vehicle]["price"] / 5
    local plate = GeneratePlate()
    local date = os.date('%Y-%m-%d')
    local repayTime = 168 -- Hours
    local downPay = math.ceil(vehiclePrice / 5)

    if (balance - downPay) >= 0 then
        CTRPFW.Functions.ExecuteSql(false, "INSERT INTO `player_vehicles` (`steam`, `citizenid`, `vehicle`, `hash`, `mods`, `plate`, `finance`, `repaytime`, `date`, `buy_price`, `repayam`,`state`, `fdate`) VALUES ('"..pData.PlayerData.steam.."', '"..cid.."', '"..vehicle.."', '"..GetHashKey(vehicle).."', '{}', '"..plate.."', '"..(vehiclePrice - downPay).."', '"..repayTime.."', '"..date.."', '"..vehiclePrice.."', '"..vehiclePrices.."', 0 , '"..date.."')")
        TriggerClientEvent("CTRPFW:Notify", src, "Successful! Your vehicle is waiting for you outside.", "success", 5000)
        TriggerClientEvent('ctrp-vehicleshop:client:buyShowroomVehicle', src, vehicle, plate)
        
         print("2")
         
         pData.Functions.RemoveItem('financepaper', 1)
         TriggerClientEvent('ctrp-moneysafespdm:client:DepositMoney', src, downPay)
	    
        TriggerEvent("ctrp-log:server:sendLog", cid, "vehiclebought", {model=vehicle, name=CTRPFW.Shared.Vehicles[vehicle]["name"], from="showroom", moneyType="bank", price=CTRPFW.Shared.Vehicles[vehicle]["price"], plate=plate})
        TriggerEvent("ctrp-log:server:CreateLog", "vehicleshop", "Vehicle bought on Finance", "green", "**"..GetPlayerName(src) .. "** Bought a" .. CTRPFW.Shared.Vehicles[vehicle]["name"] .. "for Downpayement of $" .. CTRPFW.Shared.Vehicles[vehicle]["price"])
    else
        TriggerClientEvent("CTRPFW:Notify", src, "You don't have enough money, you miss $"..format_thousand(downPay - balance), "error", 5000)
    end
end)

--EVENT TO MINUS 1 HOUR 

local timer = ((60 * 1000) * 60) -- 60 minute timer -- 1 Hour
function updateFinance()
    exports['ghmattimysql']:execute('SELECT repaytime, plate FROM player_vehicles WHERE repaytime > @repaytime', {
        ['@repaytime'] = 0
    }, function(result)
        for i=1, #result do
            local financeTimer = result[i].repaytime
            local plate = result[i].plate
            local newTimer = financeTimer - 1  ---1 Hour Cut
            if financeTimer ~= nil then
                CTRPFW.Functions.ExecuteSql(false, "UPDATE `player_vehicles` SET `repaytime`='"..newTimer.."'  WHERE `plate`='"..plate.."'")
            end
        end
    end)
    SetTimeout(timer, updateFinance)
end
SetTimeout(timer, updateFinance)


--EVENT TO CHECK FINANCE OUTSTANDINGS 

RegisterNetEvent('ctrp-vehicleshop:CheckFinanceStatus')
AddEventHandler('ctrp-vehicleshop:CheckFinanceStatus', function()
    local src = source
	local Player = CTRPFW.Functions.GetPlayer(source)

	local foundOwedVeh = false
    CTRPFW.Functions.ExecuteSql(false, "SELECT * FROM `player_vehicles` WHERE `citizenid` = '"..Player.PlayerData.citizenid.."'", function(results)
		-- Looping through results:
		for k,v in pairs(results) do
			if v.repaytime < 1 and v.repayam > 1 then
				foundOwedVeh = true
            elseif v.repaytime < 72 and v.repayam > 1 then
                local financeTime = v.repaytime
                TriggerClientEvent("CTRPFW:Notify", src, "You have one Finance which you have to pay in "..financeTime.. " hours", "error", 10000)
			end	
		end
		
		if foundOwedVeh then
            -- Editing found vehicle:
            exports['ghmattimysql']:execute("SELECT * FROM player_vehicles WHERE citizenid = @citizenid", {['@citizenid'] = Player.PlayerData.citizenid}, function(vehData)
				-- loop through vehicles again and delete:
				for k,v in pairs(vehData) do
					if v.repaytime < 1 and v.repayam > 1 then

						local vehPlate = v.plate
						local vehModel = v.vehicle
                        local financeAmount = v.finance
                        local financePayment = v.repayam

                        --if Player.PlayerData.money["bank"] >= financePayment then
                
                            TriggerClientEvent("CTRPFW:Notify", src, "You have 1 Finance of your Vehicle Plate: " ..vehPlate.. " installment cost: $ " ..financePayment.." . ", "error", 10000) 
                            TriggerClientEvent("CTRPFW:Notify", src, "Kindly pay in 10min else vehicle will be seized ", "error", 10000)
                            TriggerClientEvent("virus-vehicleshop:mail" , src, vehPlate , vehModel , financePayment)
                      
                            
                        
                            Citizen.Wait(600000)
                            exports['ghmattimysql']:execute("SELECT * FROM player_vehicles WHERE citizenid = @citizenid", {['@citizenid'] = Player.PlayerData.citizenid}, function(vehData)
                                -- loop through vehicles again and delete:
                                for k,v in pairs(vehData) do
                                    if v.repaytime < 1 and v.repayam > 1 then
                                        local vehPlate = v.plate
                                        local vehModel = v.vehicle
                                        local deposit = v.depotprice
                                        local depositCut = deposit / 10
                                        local final = deposit + financePayment + depositCut
                                        local dated = os.date('%Y-%m-%d')
                                        -- CTRPFW.Functions.ExecuteSql(true, "DELETE FROM `player_vehicles` WHERE `plate` = '"..vehPlate.."' AND `vehicle` = '"..vehModel.."'")
                                        exports['ghmattimysql']:execute('UPDATE player_vehicles SET state = @state, depotprice = @depotprice WHERE plate = @plate', {['@state'] = 0, ['@depotprice'] = final, ['@plate'] = vehPlate})
                                        if financePayment >= 1 then
                                            TriggerClientEvent('ctrp-moneysafespdm:client:DepositMoney1', src, financePayment) 
                                            CTRPFW.Functions.ExecuteSql(false, "UPDATE `player_vehicles` SET `finance`='"..(financeAmount - financePayment).."' WHERE `plate`='"..vehPlate.."'")
                                            CTRPFW.Functions.ExecuteSql(false, "UPDATE `player_vehicles` SET `repaytime`='168' WHERE `plate`='"..vehPlate.."'")
                                            CTRPFW.Functions.ExecuteSql(false, "UPDATE `player_vehicles` SET `fdate`='"..dated.."' WHERE `plate`='"..vehPlate.."'")
                                        elseif financePayment < 1 then
                                            CTRPFW.Functions.ExecuteSql(false, "UPDATE `player_vehicles` SET `finance`='0' WHERE `plate`='"..vehPlate.."'")
                                            CTRPFW.Functions.ExecuteSql(false, "UPDATE `player_vehicles` SET `repaytime`='0' WHERE `plate`='"..vehPlate.."'")
                                            CTRPFW.Functions.ExecuteSql(false, "UPDATE `player_vehicles` SET `repayam`='0' WHERE `plate`='"..vehPlate.."'")
                                        elseif financeAmount == 0 then
                                            CTRPFW.Functions.ExecuteSql(false, "UPDATE `player_vehicles` SET `finance`='0' WHERE `plate`='"..vehPlate.."'")
                                            CTRPFW.Functions.ExecuteSql(false, "UPDATE `player_vehicles` SET `repaytime`='0' WHERE `plate`='"..vehPlate.."'")
                                            CTRPFW.Functions.ExecuteSql(false, "UPDATE `player_vehicles` SET `repayam`='0' WHERE `plate`='"..vehPlate.."'")
                                        end
                                    end
                                end
                            end)
                            TriggerClientEvent("CTRPFW:Notify", src, "We Have Seized Your Vehicle", "error", 7000) 
                        --end

                    
					end
				end
            end)
        
			
        end
	end)
end)

--EVENT TO CHECK FINANCE
RegisterNetEvent('ctrp-vehicleshop:CheckcmdFinanceStatus')
AddEventHandler('ctrp-vehicleshop:CheckcmdFinanceStatus', function()
    local src = source
	local Player = CTRPFW.Functions.GetPlayer(source)

	local foundOwedVeh = false
    CTRPFW.Functions.ExecuteSql(false, "SELECT * FROM `player_vehicles` WHERE `citizenid` = '"..Player.PlayerData.citizenid.."'", function(results)
		-- Looping through results:
		for k,v in pairs(results) do
			if v.repaytime < 1 and v.repayam > 1 then
				foundOwedVeh = true
            elseif v.repaytime < 72 and v.repayam > 1 then
                local financeTime = v.repaytime
                TriggerClientEvent("CTRPFW:Notify", src, "You have one Finance which you have to pay in "..financeTime.. " hours", "error", 10000)
			end	
		end
		
		if foundOwedVeh then
            -- Editing found vehicle:
            exports['ghmattimysql']:execute("SELECT * FROM player_vehicles WHERE citizenid = @citizenid", {['@citizenid'] = Player.PlayerData.citizenid}, function(vehData)
				-- loop through vehicles again and delete:
				for k,v in pairs(vehData) do
					if v.repaytime < 1 and v.repayam > 1 then

						local vehPlate = v.plate
						local vehModel = v.vehicle
                        local financeAmount = v.finance
                        local financePayment = v.repayam

                        --if Player.PlayerData.money["bank"] >= financePayment then
                
                            TriggerClientEvent("CTRPFW:Notify", src, "You have 1 Finance of your Vehicle Plate: " ..vehPlate.. " installment cost: $ " ..financePayment.." . ", "error", 10000) 
                            TriggerClientEvent("CTRPFW:Notify", src, "Kindly pay in 10min else vehicle will be seized ", "error", 10000)
                            TriggerClientEvent("virus-vehicleshop:mail" , src, vehPlate , vehModel , financePayment)
                      
                            
                        
                            Citizen.Wait(600000)
                            exports['ghmattimysql']:execute("SELECT * FROM player_vehicles WHERE citizenid = @citizenid", {['@citizenid'] = Player.PlayerData.citizenid}, function(vehData)
                                -- loop through vehicles again and delete:
                                for k,v in pairs(vehData) do
                                    if v.repaytime < 1 and v.repayam > 1 then
                                        local vehPlate = v.plate
                                        local vehModel = v.vehicle
                                        local deposit = v.depotprice
                                        local depositCut = deposit / 10
                                        local final = deposit + financePayment + depositCut
                                        local dated = os.date('%Y-%m-%d')
                                        -- CTRPFW.Functions.ExecuteSql(true, "DELETE FROM `player_vehicles` WHERE `plate` = '"..vehPlate.."' AND `vehicle` = '"..vehModel.."'")
                                        exports['ghmattimysql']:execute('UPDATE player_vehicles SET state = @state, depotprice = @depotprice WHERE plate = @plate', {['@state'] = 0, ['@depotprice'] = final, ['@plate'] = vehPlate})
                                        if financePayment >= 1 then
                                            TriggerClientEvent('ctrp-moneysafespdm:client:DepositMoney1', src, financePayment) 
                                            CTRPFW.Functions.ExecuteSql(false, "UPDATE `player_vehicles` SET `finance`='"..(financeAmount - financePayment).."' WHERE `plate`='"..vehPlate.."'")
                                            CTRPFW.Functions.ExecuteSql(false, "UPDATE `player_vehicles` SET `repaytime`='168' WHERE `plate`='"..vehPlate.."'")
                                            CTRPFW.Functions.ExecuteSql(false, "UPDATE `player_vehicles` SET `fdate`='"..dated.."' WHERE `plate`='"..vehPlate.."'")
                                        elseif financePayment < 1 then
                                            CTRPFW.Functions.ExecuteSql(false, "UPDATE `player_vehicles` SET `finance`='0' WHERE `plate`='"..vehPlate.."'")
                                            CTRPFW.Functions.ExecuteSql(false, "UPDATE `player_vehicles` SET `repaytime`='0' WHERE `plate`='"..vehPlate.."'")
                                            CTRPFW.Functions.ExecuteSql(false, "UPDATE `player_vehicles` SET `repayam`='0' WHERE `plate`='"..vehPlate.."'")
                                        elseif financeAmount == 0 then
                                            CTRPFW.Functions.ExecuteSql(false, "UPDATE `player_vehicles` SET `finance`='0' WHERE `plate`='"..vehPlate.."'")
                                            CTRPFW.Functions.ExecuteSql(false, "UPDATE `player_vehicles` SET `repaytime`='0' WHERE `plate`='"..vehPlate.."'")
                                            CTRPFW.Functions.ExecuteSql(false, "UPDATE `player_vehicles` SET `repayam`='0' WHERE `plate`='"..vehPlate.."'")
                                        end
                                    end
                                end
                            end)
                            TriggerClientEvent("CTRPFW:Notify", src, "We Have Seized Your Vehicle", "error", 7000) 
                        --end

                    
					end
				end
            end)
        elseif not foundOwedVeh then
            
            TriggerClientEvent("CTRPFW:Notify", src, "No any dues!", "error", 5000) 
			
        end
	end)
end)

--EVENT TO PAY WEEKLY FINANCE
RegisterNetEvent('ctrp-vehicleshop:PayFinance')
AddEventHandler('ctrp-vehicleshop:PayFinance', function()
    local src = source
	local Player = CTRPFW.Functions.GetPlayer(source)

	local foundOwedVeh = false
    CTRPFW.Functions.ExecuteSql(false, "SELECT * FROM `player_vehicles` WHERE `citizenid` = '"..Player.PlayerData.citizenid.."'", function(results)
		-- Looping through results:
		for k,v in pairs(results) do
			if v.repaytime < 1 and v.repayam > 1 then
				foundOwedVeh = true
            
			end	
		end
		
		if foundOwedVeh then
            -- Editing found vehicle:
            exports['ghmattimysql']:execute("SELECT * FROM player_vehicles WHERE citizenid = @citizenid", {['@citizenid'] = Player.PlayerData.citizenid}, function(vehData)
				-- loop through vehicles again and delete:
				for k,v in pairs(vehData) do
					if v.repaytime < 1 and v.repayam > 1 then

						local vehPlate = v.plate
						local vehModel = v.vehicle
                        local financeAmount = v.finance
                        local financePayment = v.repayam
                        local date = os.date('%Y-%m-%d')

                        if Player.PlayerData.money["bank"] >= financePayment then
                            
                                TriggerClientEvent("CTRPFW:Notify", src, "You have 1 Finance of your Vehicle Plate: " ..vehPlate.. " installment cost: $ " ..financePayment.." . ", "error", 5000) 
                                Citizen.Wait(100)

                                --Player.Functions.RemoveMoney('bank', financePayment)
                                TriggerClientEvent('ctrp-moneysafespdm:client:DepositMoney', src, financePayment) 
                                TriggerClientEvent("CTRPFW:Notify", src, "Paid Finance of $" ..financePayment.. " . ", "error", 10000) 
                                CTRPFW.Functions.ExecuteSql(false, "UPDATE `player_vehicles` SET `finance`='"..(financeAmount - financePayment).."' WHERE `plate`='"..vehPlate.."'")
                                CTRPFW.Functions.ExecuteSql(false, "UPDATE `player_vehicles` SET `repaytime`='168' WHERE `plate`='"..vehPlate.."'")
                                CTRPFW.Functions.ExecuteSql(false, "UPDATE `player_vehicles` SET `fdate`='"..date.."' WHERE `plate`='"..vehPlate.."'")
                                TriggerClientEvent("virus-vehicleshop:paidmail" , src, vehPlate , vehModel , financePayment)

                        elseif financePayment < 1 then
                                CTRPFW.Functions.ExecuteSql(false, "UPDATE `player_vehicles` SET `finance`='0' WHERE `plate`='"..vehPlate.."'")
                                CTRPFW.Functions.ExecuteSql(false, "UPDATE `player_vehicles` SET `repaytime`='0' WHERE `plate`='"..vehPlate.."'")
                                CTRPFW.Functions.ExecuteSql(false, "UPDATE `player_vehicles` SET `repayam`='0' WHERE `plate`='"..vehPlate.."'")
                                TriggerClientEvent("CTRPFW:Notify", src, "No Any Finance!", "error", 7000) 

                        elseif financeAmount == 0 then
                                CTRPFW.Functions.ExecuteSql(false, "UPDATE `player_vehicles` SET `finance`='0' WHERE `plate`='"..vehPlate.."'")
                                CTRPFW.Functions.ExecuteSql(false, "UPDATE `player_vehicles` SET `repaytime`='0' WHERE `plate`='"..vehPlate.."'")
                                CTRPFW.Functions.ExecuteSql(false, "UPDATE `player_vehicles` SET `repayam`='0' WHERE `plate`='"..vehPlate.."'")
                                TriggerClientEvent("CTRPFW:Notify", src, "No Any Finance!", "error", 7000) 
                        
                        --[[elseif Player.PlayerData.money["bank"] < financePayment then

                            exports['ghmattimysql']:execute("SELECT * FROM player_vehicles WHERE citizenid = @citizenid", {['@citizenid'] = Player.PlayerData.citizenid}, function(vehData)
                                -- loop through vehicles again and delete:
                                for k,v in pairs(vehData) do
                                    if v.repaytime < 1 and v.repayam > 1 then
                                        local vehPlate = v.plate
                                        local vehModel = v.vehicle
                                        CTRPFW.Functions.ExecuteSql(true, "DELETE FROM `player_vehicles` WHERE `plate` = '"..vehPlate.."' AND `vehicle` = '"..vehModel.."'")
                                    end
                                end
                            end)
                            TriggerClientEvent("CTRPFW:Notify", src, "We Have Taken Your Vehicle", "error", 7000)]]
                        else 
                            TriggerClientEvent("CTRPFW:Notify", src, "You don't have money", "error", 7000)
                        end
                   
					end
				end
            end)
        elseif not foundOwedVeh then
            
            TriggerClientEvent("CTRPFW:Notify", src, "No any dues!", "error", 7000) 
        end
	end)
end)

----------------------------------------------------

--EVENT TO PAY FULL FINANCE AMOUNT
RegisterNetEvent('ctrp-vehicleshop:PayFullFinance')
AddEventHandler('ctrp-vehicleshop:PayFullFinance', function()
    local src = source
	local Player = CTRPFW.Functions.GetPlayer(source)

	local foundOwedVeh = false
    CTRPFW.Functions.ExecuteSql(false, "SELECT * FROM `player_vehicles` WHERE `citizenid` = '"..Player.PlayerData.citizenid.."'", function(results)
		-- Looping through results:
		for k,v in pairs(results) do
			if v.repaytime > 1 and v.finance > 1 then
				foundOwedVeh = true
            
			end	
		end
		
		if foundOwedVeh then
            -- Editing found vehicle:
            exports['ghmattimysql']:execute("SELECT * FROM player_vehicles WHERE citizenid = @citizenid", {['@citizenid'] = Player.PlayerData.citizenid}, function(vehData)
				-- loop through vehicles again and delete:
				for k,v in pairs(vehData) do
					if v.repaytime > 1 and v.finance > 1 then

						local vehPlate = v.plate
						local vehModel = v.vehicle
                        local financeAmount = v.finance
                        local financePayment = v.repayam
                        local date = os.date('%Y-%m-%d')

                        if Player.PlayerData.money["bank"] >= financePayment then
                            
                            TriggerClientEvent("ctrp-vehicleshop:client:sendFullFinance" , src, vehPlate , vehModel , financeAmount)
                        else 
                            TriggerClientEvent("CTRPFW:Notify", src, "You don't have money", "error", 7000)

                        end
                   
					end
				end
            end)
        elseif not foundOwedVeh then
            
            TriggerClientEvent("CTRPFW:Notify", src, "No any dues!", "error", 7000) 
        end
	end)
end)




--FUNCTION TO PAY FULL FINANCE AMOUNT 
RegisterNetEvent('ctrp-vehicleshop:PayFullFinances')
AddEventHandler('ctrp-vehicleshop:PayFullFinances', function()
    local src = source
	local Player = CTRPFW.Functions.GetPlayer(source)

	local foundOwedVeh = false
    CTRPFW.Functions.ExecuteSql(false, "SELECT * FROM `player_vehicles` WHERE `citizenid` = '"..Player.PlayerData.citizenid.."'", function(results)
		-- Looping through results:
		for k,v in pairs(results) do
			if v.repaytime > 1 and v.finance > 1 then
				foundOwedVeh = true
            
			end	
		end
		
		if foundOwedVeh then
            -- Editing found vehicle:
            exports['ghmattimysql']:execute("SELECT * FROM player_vehicles WHERE citizenid = @citizenid", {['@citizenid'] = Player.PlayerData.citizenid}, function(vehData)
				-- loop through vehicles again and delete:
				for k,v in pairs(vehData) do
					if v.repaytime > 1 and v.finance > 1 then

						local vehPlate = v.plate
						local vehModel = v.vehicle
                        local financeAmount = v.finance
                        local financePayment = v.repayam


                        if Player.PlayerData.money["bank"] >= financeAmount then

                            TriggerClientEvent("ctrp-vehicleshop:client:billFullFinance" , src, vehPlate , vehModel , financeAmount)
                            Citizen.Wait(100)
                            --Player.Functions.RemoveMoney('bank', financeAmount)
                            TriggerClientEvent('ctrp-moneysafespdm:client:DepositMoney', src, financeAmount) 
                            CTRPFW.Functions.ExecuteSql(false, "UPDATE `player_vehicles` SET `finance`='0' WHERE `plate`='"..vehPlate.."'")
                            CTRPFW.Functions.ExecuteSql(false, "UPDATE `player_vehicles` SET `repaytime`='0' WHERE `plate`='"..vehPlate.."'")
                            CTRPFW.Functions.ExecuteSql(false, "UPDATE `player_vehicles` SET `repayam`='0' WHERE `plate`='"..vehPlate.."'")

                            TriggerClientEvent("CTRPFW:Notify", src, "Received Full Finance Receipt", "error", 7000)
                            
                        else 
                            TriggerClientEvent("CTRPFW:Notify", src, "You don't have money", "error", 7000)

                        end
                   
					end
				end
            end)
        elseif not foundOwedVeh then
            
            TriggerClientEvent("CTRPFW:Notify", src, "No any dues!", "error", 7000) 
        end
	end)
end)

----------------------------------------------------------

--EVENT TO CHECK ALREADY FINANCED VEHICLE
RegisterNetEvent('ctrp-vehicleshop:checkalready')
AddEventHandler('ctrp-vehicleshop:checkalready', function()
    local src = source
	local Player = CTRPFW.Functions.GetPlayer(source)

	local foundOwedVeh = false
    CTRPFW.Functions.ExecuteSql(false, "SELECT * FROM `player_vehicles` WHERE `citizenid` = '"..Player.PlayerData.citizenid.."'", function(results)

		for k,v in pairs(results) do
			if v.repaytime > 1 and v.finance > 1 then
				foundOwedVeh = true
               
			end	
		end

        if foundOwedVeh then
            TriggerClientEvent("CTRPFW:Notify", src, "You already have one finance vehicle!", "error", 7000) 
        else
            TriggerClientEvent('ctrp-vehicleshop:client:cf' , src)
        end
		

	end)
end)


--COMMANDS

CTRPFW.Commands.Add("payfinance", "Pay Finance", {}, false, function(source)
	local src = source
    local Player = CTRPFW.Functions.GetPlayer(source)
    TriggerClientEvent("ctrp-vehicleshop:client:payfinance" , source)
end)

CTRPFW.Commands.Add("checkfinance", "Check Finance", {}, false, function(source)
	local src = source
    local Player = CTRPFW.Functions.GetPlayer(source)
    TriggerClientEvent("ctrp-vehicleshop:client:cfinance" , source)
end)

CTRPFW.Commands.Add("payfullfinance", "Pay Full Finance", {}, false, function(source)
	local src = source
    local Player = CTRPFW.Functions.GetPlayer(source)
    TriggerClientEvent("ctrp-vehicleshop:client:payfullfinance" , source)
end)


