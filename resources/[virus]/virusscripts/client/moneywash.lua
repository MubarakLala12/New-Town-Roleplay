-- CTRPFW = nil

-- Citizen.CreateThread(function()
--     while true do
--         Citizen.Wait(10)
--         if CTRPFW == nil then
--             TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)
--             Citizen.Wait(200)
--         end
--     end
-- end)

local value = 0

RegisterNetEvent('CTRPFW:Client:OnPlayerLoaded')
AddEventHandler('CTRPFW:Client:OnPlayerLoaded', function()
    PlayerJob = CTRPFW.Functions.GetPlayerData().job
    onDuty = true
end)

RegisterNetEvent('CTRPFW:Client:SetDuty')
AddEventHandler('CTRPFW:Client:SetDuty', function(duty)
    onDuty = duty
end)

RegisterNetEvent('CTRPFW:Client:OnJobUpdate')
AddEventHandler('CTRPFW:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
    onDuty = true
end)

RegisterNetEvent('police:SetCopCount')
AddEventHandler('police:SetCopCount', function(amount)
    CurrentCops = amount
end)

local washing = false
local timer = 0
local collect = false
local washer = 0



Citizen.CreateThread(function()
	while true do 
		Citizen.Wait(1)
		local inRange = false
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        

        --DrawMarker(markerConfig.markerType, tpLocations.pOne.x, tpLocations.pOne.y, tpLocations.pOne.z + 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.5, 0.15, 255, 55, 15, 255, false, false, false, true, false, false, false)
        
        for location, val in pairs(tpLocations) do
            local Enter = val['Enter']
            local Exit = val['Exit']
            local dstCheckEnter, dstCheckExit = vector3(Enter['x'], Enter['y'], Enter['z']), vector3(Exit['x'], Exit['y'], Exit['z'])
            local distenter, distexit = #(pos - dstCheckEnter), #(pos - dstCheckExit)

            -- DrawMarker(markerConfig.markerType, Enter['x'], Enter['y'], Enter['z'] + 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.5, 0.15, 255, 55, 15, 255, false, false, false, true, false, false, false)
            
            if distenter < 10.0 then
                inRange = true
                if distenter < 1.5 then                                    
                    DrawText3D(Enter['x'], Enter['y'], Enter['z'], "~g~E~w~ - Enter")
                    if IsControlJustReleased(1, Keys['E']) then
                        TriggerServerEvent("InteractSound_SV:PlayOnSource", "passcode", 0.3)
                        DisplayOnscreenKeyboard(1, "Enter Passcode", "", "Enter Passcode", "", "", "", 16 + 1)
                        while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
                            Citizen.Wait(7)
                        end
                        input = GetOnscreenKeyboardResult()
                        if input == password then
                            openHouseAnim()
                            DoScreenFadeOut(500)
                            Citizen.Wait(1500)
                            SetEntityCoords(ped, Exit['x'], Exit['y'], Exit['z'])
                            DoScreenFadeIn(500)
                            TriggerServerEvent("InteractSound_SV:PlayOnSource", "houses_door_close", 0.1)
                        else
                            CTRPFW.Functions.Notify("Wrong passcode, get it from drug dealers!", "error")
                        end
                    end
                end
            end

            if distexit < 10.0 then
                inRange = true
                if distexit < 1.5 then      
                    DrawText3D(Exit['x'], Exit['y'], Exit['z'], "~g~E~w~ - Exit")
                    if IsControlJustReleased(1, Keys['E']) then
                        openHouseAnim()
                        DoScreenFadeOut(500)
                        Citizen.Wait(1500)
                        SetEntityCoords(ped, Enter['x'], Enter['y'], Enter['z'])
                        DoScreenFadeIn(500)
                        TriggerServerEvent("InteractSound_SV:PlayOnSource", "houses_door_close", 0.1)
                    end
                end
            end

            if washing and distexit < 16.0 and Config.ShowTimer then
                inRange = true
                DrawText3D(washCoordX, washCoordY, washCoordZ, "Time left on washer: " .. timer .. ' seconds.')      
            end  

            if not inRange then
                Wait(1500)
            end
        end

		-- if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, tpLocations.pOne.x, tpLocations.pOne.y, tpLocations.pOne.z, true) < 5.0 then
		-- 	inRange = true
        --     if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, tpLocations.pOne.x, tpLocations.pOne.y, tpLocations.pOne.z, true) < 1.5 then                                    
        --         DrawText3D(tpLocations.pOne.x, tpLocations.pOne.y, tpLocations.pOne.z, "~g~E~w~ - Enter In")
        --         if IsControlJustReleased(1, Keys['E']) then
        --             TriggerServerEvent("InteractSound_SV:PlayOnSource", "passcode", 0.3)
        --             passcode()
        --         end
		-- 	end
        -- end

        -- if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, tpLocations.tpOne.x, tpLocations.tpOne.y, tpLocations.tpOne.z, true) < 5.0 then
		-- 	inRange = true
        --     if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, tpLocations.tpOne.x, tpLocations.tpOne.y, tpLocations.tpOne.z, true) < 1.5 then      
        --         DrawText3D(tpLocations.tpOne.x, tpLocations.tpOne.y, tpLocations.tpOne.z, "~g~E~w~ - Exit Out")
        --         if IsControlJustReleased(1, Keys['E']) then
        --             leave()
        --         end
		-- 	end
        -- end
	end
end)

-- function enter()
-- 	local ped = PlayerPedId()
-- 	openHouseAnim()
--     DoScreenFadeOut(500)
--     Citizen.Wait(1500)
--     SetEntityCoords(ped, tpLocations.tpOne.x, tpLocations.tpOne.y, tpLocations.tpOne.z)
-- 	DoScreenFadeIn(500)
-- 	TriggerServerEvent("InteractSound_SV:PlayOnSource", "houses_door_close", 0.1)
-- end

-- function leave()
-- 	local ped = PlayerPedId()
-- 	openHouseAnim()
--     DoScreenFadeOut(500)
--     Citizen.Wait(1500)
--     SetEntityCoords(ped, tpLocations.pOne.x, tpLocations.pOne.y, tpLocations.pOne.z)
-- 	DoScreenFadeIn(500)
-- 	TriggerServerEvent("InteractSound_SV:PlayOnSource", "houses_door_close", 0.1)
-- end

-- function passcode()
--     DisplayOnscreenKeyboard(1, "Enter Passcode", "", "Enter Passcode", "", "", "", 16 + 1)
--     while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
--         Citizen.Wait(7)
--     end
--     input = GetOnscreenKeyboardResult()
--     if input == password then
--         enter()
--     else
--         CTRPFW.Functions.Notify("Wrong passcode, get it from drug dealers!", "error")
--     end
-- end

Citizen.CreateThread(function(amt)
	while true do 
		Citizen.Wait(1)
		local inRange = false
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)

        if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, washLocations.pOne.x, washLocations.pOne.y, washLocations.pOne.z, true) < 10.5 then
            inRange = true
            DrawMarker(markerConfig.markerType, washLocations.pOne.x, washLocations.pOne.y, washLocations.pOne.z + 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.5, 0.15, 255, 55, 15, 255, false, false, false, true, false, false, false)
            if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, washLocations.pOne.x, washLocations.pOne.y, washLocations.pOne.z, true) < 0.5 then
                if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, washLocations.pOne.x, washLocations.pOne.y, washLocations.pOne.z, true) < 0.5 then      
                    if not washing and not collect then      
                        DrawText3D(washLocations.pOne.x, washLocations.pOne.y, washLocations.pOne.z, "~g~E~w~ - Start Washer")
                        if IsControlJustReleased(1, Keys['E']) then
                            CTRPFW.Functions.TriggerCallback('virus-moneywash:server:checkWash', function(HasItem, tamount)
                                if HasItem then
                                    -- TriggerServerEvent('virus-moneywash:server:getItem', amt)
                                    WashAnimation()
                                    CTRPFW.Functions.Progressbar("bills_wash", "Putting Black Money into the washer...", math.random(2000, 5000), false, true, {
                                        disableMovement = false,
                                        disableCarMovement = false,
                                        disableMouse = false,
                                        disableCombat = true,
                                    }, {
                                    animDict = "mp_car_bomb",
                                    anim = "car_bomb_mechanic",
                                    flags = 16,
                                    }, {}, {}, function() -- Done
                                        TriggerServerEvent('virus-moneywash:server:checkInv', amt)
                                        StopAnimTask(PlayerPedId(), "mp_car_bomb", "car_bomb_mechanic", 1.0)
                                        washer = 1
                                        value = tamount
                                    end, function()
                                        CTRPFW.Functions.Notify("Canceled..", "error")
                                    end) 
                                else
                                    CTRPFW.Functions.Notify("Where is black money?..", "error")
                                end
                            end)                       
                        end   
                    end
                end
            end
        end
        if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, washLocations.pTwo.x, washLocations.pTwo.y, washLocations.pTwo.z, true) < 10.5 then
            inRange = true
            DrawMarker(markerConfig.markerType, washLocations.pTwo.x, washLocations.pTwo.y, washLocations.pTwo.z + 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.5, 0.15, 255, 55, 15, 255, false, false, false, true, false, false, false)
            if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, washLocations.pTwo.x, washLocations.pTwo.y, washLocations.pTwo.z, true) < 0.5 then
                if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, washLocations.pTwo.x, washLocations.pTwo.y, washLocations.pTwo.z, true) < 0.5 then      
                    if not washing and not collect then      
                        DrawText3D(washLocations.pTwo.x, washLocations.pTwo.y, washLocations.pTwo.z, "~g~E~w~ - Start Washer")
                        if IsControlJustReleased(1, Keys['E']) then
                            CTRPFW.Functions.TriggerCallback('virus-moneywash:server:checkWash', function(HasItem, tamount)
                                if HasItem then
                                    -- TriggerServerEvent('virus-moneywash:server:getItem', amt)
                                    WashAnimation()
                                    CTRPFW.Functions.Progressbar("bills_wash", "Putting Black Money into the washer...", math.random(2000, 5000), false, true, {
                                        disableMovement = false,
                                        disableCarMovement = false,
                                        disableMouse = false,
                                        disableCombat = true,
                                    }, {
                                    animDict = "mp_car_bomb",
                                    anim = "car_bomb_mechanic",
                                    flags = 16,
                                    }, {}, {}, function() -- Done
                                        TriggerServerEvent('virus-moneywash:server:checkInv', amt)
                                        StopAnimTask(PlayerPedId(), "mp_car_bomb", "car_bomb_mechanic", 1.0)
                                        washer = 2
                                        value = tamount

                            
                                    end, function()
                                        CTRPFW.Functions.Notify("Canceled..", "error")
                                    end) 
                                else
                                    CTRPFW.Functions.Notify("Where is black money?..", "error")
                                end
                            end)                      
                        end    
                    end
                end
            end
        end
        
        if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, washLocations.pThree.x, washLocations.pThree.y, washLocations.pThree.z, true) < 10.5 then
            inRange = true
            DrawMarker(markerConfig.markerType, washLocations.pThree.x, washLocations.pThree.y, washLocations.pThree.z + 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.5, 0.15, 255, 55, 15, 255, false, false, false, true, false, false, false)
            if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, washLocations.pThree.x, washLocations.pThree.y, washLocations.pThree.z, true) < 0.5 then
                if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, washLocations.pThree.x, washLocations.pThree.y, washLocations.pThree.z, true) < 0.5 then      
                    if not washing and not collect then      
                        DrawText3D(washLocations.pThree.x, washLocations.pThree.y, washLocations.pThree.z, "~g~E~w~ - Start Washer")
                        if IsControlJustReleased(1, Keys['E']) then
                            CTRPFW.Functions.TriggerCallback('virus-moneywash:server:checkWash', function(HasItem, tamount)
                                if HasItem then
                                    -- TriggerServerEvent('virus-moneywash:server:getItem', amt)
                                    WashAnimation()
                                    CTRPFW.Functions.Progressbar("bills_wash", "Putting Black Money into the washer...", math.random(2000, 5000), false, true, {
                                        disableMovement = false,
                                        disableCarMovement = false,
                                        disableMouse = false,
                                        disableCombat = true,
                                    }, {
                                    animDict = "mp_car_bomb",
                                    anim = "car_bomb_mechanic",
                                    flags = 16,
                                    }, {}, {}, function() -- Done
                                        TriggerServerEvent('virus-moneywash:server:checkInv', amt)
                                        StopAnimTask(PlayerPedId(), "mp_car_bomb", "car_bomb_mechanic", 1.0)
                                        washer = 3
                                        value = tamount
                            
                                    end, function()
                                        CTRPFW.Functions.Notify("Canceled..", "error")
                                    end) 
                                else
                                    CTRPFW.Functions.Notify("Where is black money?..", "error")
                                end
                            end)                          
                        end 
                    end     
                end
            end	
        end

        if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, washLocations.pFour.x, washLocations.pFour.y, washLocations.pFour.z, true) < 10.5 then
            inRange = true
            DrawMarker(markerConfig.markerType, washLocations.pFour.x, washLocations.pFour.y, washLocations.pFour.z + 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.5, 0.15, 255, 55, 15, 255, false, false, false, true, false, false, false)
            if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, washLocations.pFour.x, washLocations.pFour.y, washLocations.pFour.z, true) < 0.5 then
                if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, washLocations.pFour.x, washLocations.pFour.y, washLocations.pFour.z, true) < 0.5 then      
                    if not washing and not collect then      
                        DrawText3D(washLocations.pFour.x, washLocations.pFour.y, washLocations.pFour.z, "~g~E~w~ - Start Washer")
                        if IsControlJustReleased(1, Keys['E']) then
                            CTRPFW.Functions.TriggerCallback('virus-moneywash:server:checkWash', function(HasItem, tamount)
                                if HasItem then
                                    -- TriggerServerEvent('virus-moneywash:server:getItem', amt)
                                    WashAnimation()
                                    CTRPFW.Functions.Progressbar("bills_wash", "Putting Black Money into the washer...", math.random(2000, 5000), false, true, {
                                        disableMovement = false,
                                        disableCarMovement = false,
                                        disableMouse = false,
                                        disableCombat = true,
                                    }, {
                                    animDict = "mp_car_bomb",
                                    anim = "car_bomb_mechanic",
                                    flags = 16,
                                    }, {}, {}, function() -- Done
                                        TriggerServerEvent('virus-moneywash:server:checkInv', amt)
                                        StopAnimTask(PlayerPedId(), "mp_car_bomb", "car_bomb_mechanic", 1.0)
                                        washer = 4
                                        value = tamount
                            
                                    end, function()
                                        CTRPFW.Functions.Notify("Canceled..", "error")
                                    end) 
                                else
                                    CTRPFW.Functions.Notify("Where is black money?..", "error")
                                end
                            end)                          
                        end   
                    end
                end
            end
        end

        if not inRange then
            Wait(1500)
        end
    end 
end)

-- Citizen.CreateThread(function(amt)
-- 	while true do 
-- 		Citizen.Wait(1)
-- 		local inRange = false
--         local pos = GetEntityCoords(PlayerPedId())
--         local ped = PlayerPedId()

--         --DrawMarker(markerConfig.markerType, washLocations.pOne.x, washLocations.pOne.y, washLocations.pOne.z + 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.5, 0.15, 255, 55, 15, 255, false, false, false, true, false, false, false)

-- 		if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, washLocations.pOne.x, washLocations.pOne.y, washLocations.pOne.z, true) < 0.5 then
-- 			inRange = true
--             if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, washLocations.pOne.x, washLocations.pOne.y, washLocations.pOne.z, true) < 0.5 then      
--                 if not washing and not collect then      
--                     DrawText3D(washLocations.pOne.x, washLocations.pOne.y, washLocations.pOne.z, "~g~E~w~ - Start Washer")
--                         if IsControlJustReleased(1, Keys['E']) then
--                             CTRPFW.Functions.TriggerCallback('virus-moneywash:server:checkWash', function(HasItem, type)
--                                 if HasItem then
--                                     TriggerServerEvent('virus-moneywash:server:getItem', amt)
--                                     WashAnimation()
--                                     CTRPFW.Functions.Progressbar("bills_wash", "Putting Black Money into the washer...", math.random(2000, 5000), false, true, {
--                                         disableMovement = false,
--                                         disableCarMovement = false,
--                                         disableMouse = false,
--                                         disableCombat = true,
--                                     }, {
--                                     animDict = "mp_car_bomb",
--                                     anim = "car_bomb_mechanic",
--                                     flags = 16,
--                                     }, {}, {}, function() -- Done
--                                         TriggerServerEvent('virus-moneywash:server:checkInv', amt)
--                                         StopAnimTask(PlayerPedId(), "mp_car_bomb", "car_bomb_mechanic", 1.0)
--                                         washer = 1

                            
--                                     end, function()
--                                         CTRPFW.Functions.Notify("Canceled..", "error")
--                                     end) 
--                                 else
--                                     CTRPFW.Functions.Notify("Where is black money?..", "error")
--                                 end
--                             end)                 
--                         end

--                     end
-- 			end
--         end

--         --DrawMarker(markerConfig.markerType, washLocations.pTwo.x, washLocations.pTwo.y, washLocations.pTwo.z + 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.5, 0.15, 255, 55, 15, 255, false, false, false, true, false, false, false)

-- 		if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, washLocations.pTwo.x, washLocations.pTwo.y, washLocations.pTwo.z, true) < 0.5 then
-- 			inRange = true
--             if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, washLocations.pTwo.x, washLocations.pTwo.y, washLocations.pTwo.z, true) < 0.5 then      
--                 if not washing and not collect then      
--                     DrawText3D(washLocations.pTwo.x, washLocations.pTwo.y, washLocations.pTwo.z, "~g~E~w~ - Start Washer")
--                         if IsControlJustReleased(1, Keys['E']) then
--                             CTRPFW.Functions.TriggerCallback('virus-moneywash:server:checkWash', function(HasItem, type)
--                                 if HasItem then
--                                     TriggerServerEvent('virus-moneywash:server:getItem', amt)
--                                     WashAnimation()
--                                     CTRPFW.Functions.Progressbar("bills_wash", "Putting Black Money into the washer...", math.random(2000, 5000), false, true, {
--                                         disableMovement = false,
--                                         disableCarMovement = false,
--                                         disableMouse = false,
--                                         disableCombat = true,
--                                     }, {
--                                     animDict = "mp_car_bomb",
--                                     anim = "car_bomb_mechanic",
--                                     flags = 16,
--                                     }, {}, {}, function() -- Done
--                                         TriggerServerEvent('virus-moneywash:server:checkInv', amt)
--                                         StopAnimTask(PlayerPedId(), "mp_car_bomb", "car_bomb_mechanic", 1.0)
--                                         washer = 2

                            
--                                     end, function()
--                                         CTRPFW.Functions.Notify("Canceled..", "error")
--                                     end) 
--                                 else
--                                     CTRPFW.Functions.Notify("Where is black money?..", "error")
--                                 end
--                             end)                        
--                         end
                        
--                     end
-- 			end
--         end

--         --DrawMarker(markerConfig.markerType, washLocations.pThree.x, washLocations.pThree.y, washLocations.pThree.z + 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.5, 0.15, 255, 55, 15, 255, false, false, false, true, false, false, false)

-- 		if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, washLocations.pThree.x, washLocations.pThree.y, washLocations.pThree.z, true) < 0.5 then
-- 			inRange = true
--             if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, washLocations.pThree.x, washLocations.pThree.y, washLocations.pThree.z, true) < 0.5 then      
--                 if not washing and not collect then      
--                     DrawText3D(washLocations.pThree.x, washLocations.pThree.y, washLocations.pThree.z, "~g~E~w~ - Start Washer")
--                         if IsControlJustReleased(1, Keys['E']) then
--                             CTRPFW.Functions.TriggerCallback('virus-moneywash:server:checkWash', function(HasItem, type)
--                                 if HasItem then
--                                     TriggerServerEvent('virus-moneywash:server:getItem', amt)
--                                     WashAnimation()
--                                     CTRPFW.Functions.Progressbar("bills_wash", "Putting Black Money into the washer...", math.random(2000, 5000), false, true, {
--                                         disableMovement = false,
--                                         disableCarMovement = false,
--                                         disableMouse = false,
--                                         disableCombat = true,
--                                     }, {
--                                     animDict = "mp_car_bomb",
--                                     anim = "car_bomb_mechanic",
--                                     flags = 16,
--                                     }, {}, {}, function() -- Done
--                                         TriggerServerEvent('virus-moneywash:server:checkInv', amt)
--                                         StopAnimTask(PlayerPedId(), "mp_car_bomb", "car_bomb_mechanic", 1.0)
--                                         washer = 3

                            
--                                     end, function()
--                                         CTRPFW.Functions.Notify("Canceled..", "error")
--                                     end) 
--                                 else
--                                     CTRPFW.Functions.Notify("Where is black money?..", "error")
--                                 end
--                             end)                     
--                         end
                        
--                     end     
-- 			end
--         end	
  
        
--         --DrawMarker(markerConfig.markerType, washLocations.pFour.x, washLocations.pFour.y, washLocations.pFour.z + 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.5, 0.15, 255, 55, 15, 255, false, false, false, true, false, false, false)

-- 		if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, washLocations.pFour.x, washLocations.pFour.y, washLocations.pFour.z, true) < 0.5 then
-- 			inRange = true
--             if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, washLocations.pFour.x, washLocations.pFour.y, washLocations.pFour.z, true) < 0.5 then      
--                 if not washing and not collect then      
--                     DrawText3D(washLocations.pFour.x, washLocations.pFour.y, washLocations.pFour.z, "~g~E~w~ - Start Washer")
--                         if IsControlJustReleased(1, Keys['E']) then
--                             CTRPFW.Functions.TriggerCallback('virus-moneywash:server:checkWash', function(HasItem, type)
--                                 if HasItem then
--                                     TriggerServerEvent('virus-moneywash:server:getItem', amt)
--                                     WashAnimation()
--                                     CTRPFW.Functions.Progressbar("bills_wash", "Putting Black Money into the washer...", math.random(2000, 5000), false, true, {
--                                         disableMovement = false,
--                                         disableCarMovement = false,
--                                         disableMouse = false,
--                                         disableCombat = true,
--                                     }, {
--                                     animDict = "mp_car_bomb",
--                                     anim = "car_bomb_mechanic",
--                                     flags = 16,
--                                     }, {}, {}, function() -- Done
--                                         TriggerServerEvent('virus-moneywash:server:checkInv', amt)
--                                         StopAnimTask(PlayerPedId(), "mp_car_bomb", "car_bomb_mechanic", 1.0)
--                                         washer = 4

                            
--                                     end, function()
--                                         CTRPFW.Functions.Notify("Canceled..", "error")
--                                     end) 
--                                 else
--                                     CTRPFW.Functions.Notify("Where is black money?..", "error")
--                                 end
--                             end)                  
--                         end
                        
--                     end
                    
                
-- 			end
--         end
--     end 
-- end)

RegisterNetEvent('virus-moneywash:client:washTimer')
AddEventHandler('virus-moneywash:client:washTimer', function()
        Citizen.Wait(0)
        local pos = GetEntityCoords(PlayerPedId())
        local ped = PlayerPedId()
        local inRange = false

        while washing do
            if washer == 1 then
                washCoordX = washLocations.pOne.x
                washCoordY = washLocations.pOne.y
                washCoordZ = washLocations.pOne.z
            elseif washer == 2 then
                washCoordX = washLocations.pTwo.x
                washCoordY = washLocations.pTwo.y
                washCoordZ = washLocations.pTwo.z
            elseif washer == 3 then
                washCoordX = washLocations.pThree.x
                washCoordY = washLocations.pThree.y
                washCoordZ = washLocations.pThree.z
            elseif washer == 4 then
                washCoordX = washLocations.pFour.x
                washCoordY = washLocations.pFour.y
                washCoordZ = washLocations.pFour.z
            end
            Citizen.Wait(0)
            DrawText3D(washCoordX, washCoordY, washCoordZ, "Time left on washer: " .. timer .. ' seconds.')               
        end
end)

function collectMoney(amt)

    Citizen.CreateThread(function()

        while collect do
            if washer == 1 then
                collectCoordX = washLocations.pOne.x
                collectCoordY = washLocations.pOne.y
                collectCoordZ = washLocations.pOne.z
            elseif washer == 2 then
                collectCoordX = washLocations.pTwo.x
                collectCoordY = washLocations.pTwo.y
                collectCoordZ = washLocations.pTwo.z
            elseif washer == 3 then
                collectCoordX = washLocations.pThree.x
                collectCoordY = washLocations.pThree.y
                collectCoordZ = washLocations.pThree.z
            elseif washer == 4 then
                collectCoordX = washLocations.pFour.x
                collectCoordY = washLocations.pFour.y
                collectCoordZ = washLocations.pFour.z
            end

            local inRange = false
            local pos = GetEntityCoords(PlayerPedId())
            local ped = PlayerPedId()
        
            Citizen.Wait(0)
            DrawText3D(collectCoordX, collectCoordY, collectCoordZ, "~g~E~w~ - Collect Clean Money")

            if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, collectCoordX,collectCoordY, collectCoordZ, true) < 0.5 then
                inRange = true
                if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, collectCoordX,collectCoordY, collectCoordZ, true) < 0.5 then      
                    if IsControlJustReleased(1, Keys['E']) and inRange then
                        WashAnimation()
                        CTRPFW.Functions.Progressbar("bills_collect", "Collecting clean bill\'s from washer...", math.random(5000, 10000), false, true, {
                            disableMovement = false,
                            disableCarMovement = false,
                            disableMouse = false,
                            disableCombat = true,
                        }, {
                            animDict = "mp_car_bomb",
                            anim = "car_bomb_mechanic",
                            flags = 16,
                        }, {}, {}, function() -- Done
                            TriggerServerEvent('virus-moneywash:server:giveMoney', amt)
                            TriggerServerEvent("evidence:server:CreateFingerDrop", pos)
                            StopAnimTask(ped, "mp_car_bomb", "car_bomb_mechanic", 1.0)
                            collect = false                        
                        end, function()
                            CTRPFW.Functions.Notify("Canceled..", "error")
                        end) 
                    end                   
                end
            end            
        end
    end)
end

RegisterNetEvent('virus-moneywash:client:startTimer')
AddEventHandler('virus-moneywash:client:startTimer', function(amt)

    washing = true
    timer = math.ceil(0.005 * amt)
    if timer <= 60 then
        timer = 60
    end
    TriggerEvent('virus-moneywash:client:washTimer')

        while washing do
            timer = timer - 1
            if timer <= 0 then
                washing = false
                collect = true
                CTRPFW.Functions.Notify('Your clean cash is ready to be collected.', 'success', 50000)
                local taxes = (value / 100 * 10)
                local final = value - taxes

                collectMoney(final)
            end
            Citizen.Wait(1000)
        end
end)

function DrawText3D(x, y, z, text)
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
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 41, 11, 41, 60)    
    ClearDrawOrigin()
end

function WashAnimation()
    loadAnimDict("mp_car_bomb")
    TaskPlayAnim(PlayerPedId(), "mp_car_bomb", "car_bomb_mechanic" ,3.0, 3.0, -1, 16, 0, false, false, false)
    Citizen.CreateThread(function()
        while washing do
            TaskPlayAnim(PlayerPedId(), "mp_car_bomb", "car_bomb_mechanic", 3.0, 3.0, -1, 16, 0, 0, 0, 0)
            Citizen.Wait(2000)
        end
    end)
end

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end

function openHouseAnim()
    loadAnimDict("anim@heists@keycard@") 
    TaskPlayAnim( PlayerPedId(), "anim@heists@keycard@", "exit", 5.0, 1.0, -1, 16, 0, 0, 0, 0 )
    Citizen.Wait(400)
    ClearPedTasks(PlayerPedId())
end




function IsWearingHandshoes()
    local armIndex = GetPedDrawableVariation(PlayerPedId(), 3)
    local model = GetEntityModel(PlayerPedId())
    local retval = true
    if model == GetHashKey("mp_m_freemode_01") then
        if Barley.MaleNoHandshoes[armIndex] ~= nil and Barley.MaleNoHandshoes[armIndex] then
            retval = false
        end
    else
        if Barley.FemaleNoHandshoes[armIndex] ~= nil and Barley.FemaleNoHandshoes[armIndex] then
            retval = false
        end
    end
    return retval
end
