local alcoholCount = 0
local onWeed = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        if alcoholCount > 0 then
            Citizen.Wait(1000 * 60 * 15)
            alcoholCount = alcoholCount - 1
        else
            Citizen.Wait(2000)
        end
    end
end)
--[[RegisterNetEvent("consumables:client:UseJoint")
AddEventHandler("consumables:client:UseJoint", function()
    
    TriggerEvent('animations:client:EmoteCommandStart', {"smoke"})
    CTRPFW.Functions.Progressbar("smoke_joint", "Consumming..", 28000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items["joint"], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent('ctrp-hud:Server:RelieveStress', math.random(10, 15))
        TriggerEvent("evidence:client:SetStatus", "weedsmell", 300)
    end)
end)

RegisterNetEvent("consumables:client:UseJoint")
AddEventHandler("consumables:client:UseJoint", function()

    local playerPed = GetPlayerPed(-1)
    local playerPed = PlayerPedId()
  
    RequestAnimSet("MOVE_M@DRUNK@VERYDRUNK") 
    while not HasAnimSetLoaded("MOVE_M@DRUNK@VERYDRUNK") do
      Citizen.Wait(0)
    end    
    
    TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_SMOKING_POT", 0, 1)
    CTRPFW.Functions.Progressbar("smoke_joint", "Consumming..", 28000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items["joint"], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})

        TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_SMOKING_POT", 0, 1)
        Citizen.Wait(3000)
        ClearPedTasksImmediately(playerPed)
        SetTimecycleModifier("spectator6")
        SetPedMotionBlur(playerPed, true)
        SetPedMovementClipset(playerPed, "MOVE_M@DRUNK@VERYDRUNK", true)
        SetPedIsDrunk(playerPed, true)
        AnimpostfxPlay("ChopVision", 10000001, true)
        ShakeGameplayCam("DRUNK_SHAKE", 1.0)
        
        
        SetPedArmour(PlayerPedId(), 30)

        Citizen.Wait(30000)

        SetPedMoveRateOverride(PlayerId(),1.0)
        SetRunSprintMultiplierForPlayer(PlayerId(),1.0)
        SetPedIsDrunk(GetPlayerPed(-1), false)		
        SetPedMotionBlur(playerPed, false)
        ResetPedMovementClipset(GetPlayerPed(-1))
        AnimpostfxStopAll()
        ShakeGameplayCam("DRUNK_SHAKE", 0.0)
        SetTimecycleModifierStrength(0.0)

        TriggerServerEvent('ctrp-hud:Server:RelieveStress', math.random(18, 25))
        TriggerEvent("evidence:client:SetStatus", "weedsmell", 300)
    end)
end)]]

--[[RegisterNetEvent("consumables:client:UseJoint")
AddEventHandler("consumables:client:UseJoint", function()

    local playerPed = GetPlayerPed(-1)
    local playerPed = PlayerPedId()
  
       
    TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_SMOKING_POT", 0, 1)
    CTRPFW.Functions.Progressbar("smoke_joint", "Consumming..", 28000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items["joint"], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        Citizen.Wait(3000)
        ClearPedTasksImmediately(playerPed)  
        SetPedArmour(PlayerPedId(), 30)
        Citizen.Wait(3000)
        TriggerServerEvent('ctrp-hud:Server:RelieveStress', math.random(18, 25))
        TriggerEvent("evidence:client:SetStatus", "weedsmell", 300)
    end)
end)]]

--[[RegisterNetEvent("consumables:client:UseJoint")
AddEventHandler("consumables:client:UseJoint", function()

    local playerPed = GetPlayerPed(-1)
    local armor = 0
  
       
    TriggerEvent('animations:client:EmoteCommandStart', {"joint"})
    CTRPFW.Functions.Progressbar("smoke_joint", "Consumming..", 28000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items["joint"], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        armor = GetPedArmour(GetPlayerPed(-1))
        if armor == 100.0 then
            CTRPFW.Functions.Notify("कम मारो रे!" , "error")
        elseif armor >= 95.0 then
            CTRPFW.Functions.Notify("Armor Increased" , "error")
            SetPedArmour(PlayerPedId(), 100)
        elseif armor >= 85.0 then
            CTRPFW.Functions.Notify("Armor Increased" , "error")
            SetPedArmour(PlayerPedId(), 95)
        elseif armor >= 75.0 then
            CTRPFW.Functions.Notify("Armor Increased" , "error")
            SetPedArmour(PlayerPedId(), 85)
        elseif armor >= 65.0 then
            CTRPFW.Functions.Notify("Armor Increased" , "error")
            SetPedArmour(PlayerPedId(), 75)
        elseif armor >= 55.0 then
            CTRPFW.Functions.Notify("Armor Increased" , "error")
            SetPedArmour(PlayerPedId(), 65)
        elseif armor >= 45.0 then
            CTRPFW.Functions.Notify("Armor Increased" , "error")
            SetPedArmour(PlayerPedId(), 55)
        elseif armor >= 35.0 then
            CTRPFW.Functions.Notify("Armor Increased" , "error")
            SetPedArmour(PlayerPedId(), 45)
        elseif armor >= 25.0 then
            CTRPFW.Functions.Notify("Armor Increased" , "error")
            SetPedArmour(PlayerPedId(), 35)
        elseif armor >= 15.0 then
            CTRPFW.Functions.Notify("Armor Increased" , "error")
            SetPedArmour(PlayerPedId(), 25)
        else 
            SetPedArmour(PlayerPedId(), 15)
        end
        Citizen.Wait(3000)
        TriggerServerEvent('ctrp-hud:Server:RelieveStress', math.random(18, 25))
        TriggerEvent("evidence:client:SetStatus", "weedsmell", 300)
    end)
end)]]

--[[RegisterNetEvent("consumables:client:UseJoint")
AddEventHandler("consumables:client:UseJoint", function()

    local playerPed = GetPlayerPed(-1)
    local armor = 0
  
       
    TriggerEvent('animations:client:EmoteCommandStart', {"joint"})
    CTRPFW.Functions.Progressbar("smoke_joint", "Consumming..", 28000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items["joint"], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        armor = GetPedArmour(GetPlayerPed(-1))
        if armor == 100.0 then
            CTRPFW.Functions.Notify("कम मारो रे!" , "error")
        elseif armor >= 31.0 then
            print("VIRUSOP")
        elseif armor >= 20.0 then
            SetPedArmour(PlayerPedId(), 30)
        elseif armor >= 10.0 then
            SetPedArmour(PlayerPedId(), 20)
        elseif armor == 0.0 then
            SetPedArmour(PlayerPedId(), 10)
        end
        Citizen.Wait(3000)
        TriggerServerEvent('ctrp-hud:Server:RelieveStress', math.random(18, 25))
        TriggerEvent("evidence:client:SetStatus", "weedsmell", 300)
    end)
end)]]

RegisterNetEvent("consumables:client:Usecigarette")
AddEventHandler("consumables:client:Usecigarette", function()

    local playerPed = GetPlayerPed(-1)
    local armor = 0
  
    if not IsPedInAnyVehicle(playerPed, false) then
        TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_SMOKING_POT", 0, 1)
        Citizen.Wait(100)
        TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_SMOKING_POT", 0, 1)
        CTRPFW.Functions.Progressbar("smoke_joint", "Consumming..", 28000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items["cigarette"], "remove")
            Citizen.Wait(3000)
            ClearPedTasksImmediately(playerPed)
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            armor = GetPedArmour(GetPlayerPed(-1))
            if armor == 100.0 then
                CTRPFW.Functions.Notify("कम मारो रे!" , "error")
            elseif armor >= 31.0 then
                print("VIRUSOP")
            elseif armor >= 20.0 then
                SetPedArmour(PlayerPedId(), 30)
            elseif armor >= 10.0 then
                SetPedArmour(PlayerPedId(), 20)
            elseif armor == 0.0 then
                SetPedArmour(PlayerPedId(), 10)
            end
            Citizen.Wait(3000)
            TriggerServerEvent('virus-hudcomponent:Server:RelieveStress', math.random(18, 25))
        end)
    elseif IsPedInAnyVehicle(playerPed, false) then

        CTRPFW.Functions.Progressbar("smoke_joint", "Consumming..", 28000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items["cigarette"], "remove")
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            armor = GetPedArmour(GetPlayerPed(-1))
            if armor == 100.0 then
                CTRPFW.Functions.Notify("कम मारो रे!" , "error")
            elseif armor >= 31.0 then
                print("VIRUSOP")
            elseif armor >= 20.0 then
                SetPedArmour(PlayerPedId(), 30)
            elseif armor >= 10.0 then
                SetPedArmour(PlayerPedId(), 20)
            elseif armor == 0.0 then
                SetPedArmour(PlayerPedId(), 10)
            end
            Citizen.Wait(3000)
            TriggerServerEvent('virus-hudcomponent:Server:RelieveStress', math.random(18, 25))

        end)
    end
end)

RegisterNetEvent("consumables:client:UseJoint")
AddEventHandler("consumables:client:UseJoint", function()

    local playerPed = GetPlayerPed(-1)
    local armor = 0
  
    if not IsPedInAnyVehicle(playerPed, false) then
        TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_SMOKING_POT", 0, 1)
        Citizen.Wait(100)
        TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_SMOKING_POT", 0, 1)
        CTRPFW.Functions.Progressbar("smoke_joint", "Consumming..", 28000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items["joint"], "remove")
            Citizen.Wait(3000)
            ClearPedTasksImmediately(playerPed)
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            armor = GetPedArmour(GetPlayerPed(-1))
            if armor == 100.0 then
                CTRPFW.Functions.Notify("कम मारो रे!" , "error")
            elseif armor >= 31.0 then
                print("VIRUSOP")
            elseif armor >= 20.0 then
                SetPedArmour(PlayerPedId(), 30)
            elseif armor >= 10.0 then
                SetPedArmour(PlayerPedId(), 20)
            elseif armor == 0.0 then
                SetPedArmour(PlayerPedId(), 10)
            end
            Citizen.Wait(3000)
            TriggerServerEvent('virus-hudcomponent:Server:RelieveStress', math.random(18, 25))
            TriggerEvent("evidence:client:SetStatus", "weedsmell", 300)
        end)
    elseif IsPedInAnyVehicle(playerPed, false) then

        CTRPFW.Functions.Progressbar("smoke_joint", "Consumming..", 28000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items["joint"], "remove")
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            armor = GetPedArmour(GetPlayerPed(-1))
            if armor == 100.0 then
                CTRPFW.Functions.Notify("कम मारो रे!" , "error")
            elseif armor >= 31.0 then
                print("VIRUSOP")
            elseif armor >= 20.0 then
                SetPedArmour(PlayerPedId(), 30)
            elseif armor >= 10.0 then
                SetPedArmour(PlayerPedId(), 20)
            elseif armor == 0.0 then
                SetPedArmour(PlayerPedId(), 10)
            end
            Citizen.Wait(3000)
            TriggerServerEvent('virus-hudcomponent:Server:RelieveStress', math.random(18, 25))
            TriggerEvent("evidence:client:SetStatus", "weedsmell", 300)
        end)
    end
end)

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end

function EquipParachuteAnim()
    loadAnimDict("clothingshirt")
    TaskPlayAnim(GetPlayerPed(-1), "clothingshirt", "try_shirt_positive_d", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
end

function EquipArmorAnim()
    loadAnimDict("clothingtie")
    TaskPlayAnim(GetPlayerPed(-1), "clothingtie", "try_tie_negative_a", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
end

local ParachuteEquiped = false

RegisterNetEvent("consumables:client:UseParachute")
AddEventHandler("consumables:client:UseParachute", function()
    EquipParachuteAnim()
    CTRPFW.Functions.Progressbar("use_parachute", "Hang the parachute..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        local ped = GetPlayerPed(-1)
        TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items["parachute"], "remove")
        GiveWeaponToPed(ped, GetHashKey("GADGET_PARACHUTE"), 1, false)
        local ParachuteData = {
            outfitData = {
                ["bag"]   = { item = 7, texture = 0},  -- Nek / Das
            }
        }
        TriggerEvent('ctrp-clothing:client:loadOutfit', ParachuteData)
        ParachuteEquiped = true
        TaskPlayAnim(ped, "clothingshirt", "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
    end)
end)

RegisterNetEvent("consumables:client:ResetParachute")
AddEventHandler("consumables:client:ResetParachute", function()
    if ParachuteEquiped then
        EquipParachuteAnim()
        CTRPFW.Functions.Progressbar("reset_parachute", "Pack parachute..", 5000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            local ped = GetPlayerPed(-1)
            TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items["parachute"], "add")
            local ParachuteRemoveData = {
                outfitData = {
                    ["bag"] = { item = 0, texture = 0} -- Nek / Das
                }
            }
            TriggerEvent('ctrp-clothing:client:loadOutfit', ParachuteRemoveData)
            TaskPlayAnim(ped, "clothingshirt", "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
            TriggerServerEvent("ctrp-smallpenis:server:AddParachute")
            ParachuteEquiped = false
        end)
    else
        CTRPFW.Functions.Notify("You don't have a parachute on!", "error")
    end
end)

-- RegisterNetEvent("consumables:client:UseRedSmoke")
-- AddEventHandler("consumables:client:UseRedSmoke", function()
--     if ParachuteEquiped then
--         local ped = GetPlayerPed(-1)
--         SetPlayerParachuteSmokeTrailColor(ped, 255, 0, 0)
--         SetPlayerCanLeaveParachuteSmokeTrail(ped, true)
--         TriggerEvent("inventory:client:Itembox", CTRPFW.Shared.Items["smoketrailred"], "remove")
--     else
--         CTRPFW.Functions.Notify("You must have a parachute to activate smoke!", "error")
--     end
-- end)

RegisterNetEvent("consumables:client:UseArmor")
AddEventHandler("consumables:client:UseArmor", function()
    EquipArmorAnim()
    TriggerServerEvent("CTRPFW:Server:RemoveItem", "armor", 1)
    TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items["armor"], "remove")
    CTRPFW.Functions.Progressbar("use_armor", "Put on the vest..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        
        TriggerServerEvent('hospital:server:SetArmor', 75)
        
        SetPedArmour(GetPlayerPed(-1), 75)
    end)
end)
local currentVest = nil
local currentVestTexture = nil
RegisterNetEvent("consumables:client:UseHeavyArmor")
AddEventHandler("consumables:client:UseHeavyArmor", function()
    local ped = GetPlayerPed(-1)
    local PlayerData = CTRPFW.Functions.GetPlayerData()
    
    TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items["heavyarmor"], "remove")
    TriggerServerEvent("CTRPFW:Server:RemoveItem", "heavyarmor", 1)

    EquipArmorAnim()
    CTRPFW.Functions.Progressbar("use_heavyarmor", "Put on the vest..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        --[[if PlayerData.charinfo.gender == 0 then
            currentVest = GetPedDrawableVariation(ped, 9)
            currentVestTexture = GetPedTextureVariation(ped, 9)
            if GetPedDrawableVariation(ped, 9) == 7 then
                SetPedComponentVariation(ped, 9, 19, GetPedTextureVariation(ped, 9), 2)
            else
                SetPedComponentVariation(ped, 9, 5, 2, 2) -- blauw
            end
        else
            currentVest = GetPedDrawableVariation(ped, 30)
            currentVestTexture = GetPedTextureVariation(ped, 30)
            SetPedComponentVariation(ped, 9, 30, 0, 2)
        end]]
        SetPedArmour(ped, 100)
    end)
end)

RegisterNetEvent("consumables:client:ResetArmor")
AddEventHandler("consumables:client:ResetArmor", function()
    local ped = GetPlayerPed(-1)

    if currentVest ~= nil and currentVestTexture ~= nil then
        CTRPFW.Functions.Progressbar("remove_armor", "Removing vest..", 2500, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            --SetPedComponentVariation(ped, 9, currentVest, currentVestTexture, 2)
            SetPedArmour(ped, 0)
            TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items["heavyarmor"], "add")
            TriggerServerEvent("CTRPFW:Server:AddItem", "heavyarmor", 1)
        end)
    else
        CTRPFW.Functions.Notify("You are not wearing a vest..", "error")
    end
end)

--[[RegisterNetEvent("consumables:client:DrinkAlcohol")
AddEventHandler("consumables:client:DrinkAlcohol", function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"drink"})
    CTRPFW.Functions.Progressbar("snort_coke", "Consumming..", math.random(3000, 6000), false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items[itemName], "remove")
        TriggerServerEvent("CTRPFW:Server:RemoveItem", itemName, 1)
        TriggerServerEvent("CTRPFW:Server:SetMetaData", "thirst", CTRPFW.Functions.GetPlayerData().metadata["thirst"] + Consumeables[itemName])
        alcoholCount = alcoholCount + 1
        if alcoholCount > 1 and alcoholCount < 4 then
            TriggerEvent("evidence:client:SetStatus", "alcohol", 200)
        elseif alcoholCount >= 4 then
            TriggerEvent("evidence:client:SetStatus", "heavyalcohol", 200)
        end

    end, function() -- Cancel
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        CTRPFW.Functions.Notify("Canceled..", "error")
    end)
end)]]

RegisterNetEvent("consumables:client:DrinkAlcohol")
AddEventHandler("consumables:client:DrinkAlcohol", function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"drink"})
    local playerPed = PlayerPedId()
    local prop_name = 'prop_amb_beer_bottle'
    local x,y,z = table.unpack(GetEntityCoords(playerPed))
    local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
    local boneIndex = GetPedBoneIndex(playerPed, 18905)
    if not action then
        AttachEntityToEntity(prop, playerPed, boneIndex, 0.12, 0.008, 0.03, 240.0, -60.0, 0.0, true, true, false, true, 1, true)
    else
        DeleteObject(prop)
    end

    CTRPFW.Functions.Progressbar("snort_coke", "Consumming..", math.random(3000, 6000), false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items[itemName], "remove")
        TriggerServerEvent("CTRPFW:Server:RemoveItem", itemName, 1)
        TriggerServerEvent("CTRPFW:Server:SetMetaData", "thirst", CTRPFW.Functions.GetPlayerData().metadata["thirst"] + Consumeables[itemName])
        Drunk(2, true, 15000)
        alcoholCount = alcoholCount + 1
        if alcoholCount > 1 and alcoholCount < 4 then
            TriggerEvent("evidence:client:SetStatus", "alcohol", 200)
        elseif alcoholCount >= 4 then
            TriggerEvent("evidence:client:SetStatus", "heavyalcohol", 200)
        end
        DeleteObject(prop)
        action = false
    end, function() -- Cancel
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        CTRPFW.Functions.Notify("Canceled..", "error")
        DeleteObject(prop)
        action = false
    end)
end)

local time = 0

function Drunk(level, start, fuckboi)
    Citizen.CreateThread(function()
        local playerPed = GetPlayerPed(-1)
        time = time + fuckboi
        if start then
            DoScreenFadeOut(800)
            Wait(1000)
        end
        if level == 0 then
            RequestAnimSet("move_m@drunk@slightlydrunk")
            
            while not HasAnimSetLoaded("move_m@drunk@slightlydrunk") do
                Citizen.Wait(0)
            end
            SetPedMovementClipset(playerPed, "move_m@drunk@slightlydrunk", true)
  
        elseif level == 1 then
            RequestAnimSet("move_m@drunk@moderatedrunk")
            while not HasAnimSetLoaded("move_m@drunk@moderatedrunk") do
                Citizen.Wait(0)
            end
            SetPedMovementClipset(playerPed, "move_m@drunk@moderatedrunk", true)

        elseif level == 2 then
            RequestAnimSet("move_m@drunk@verydrunk")    
            while not HasAnimSetLoaded("move_m@drunk@verydrunk") do
                Citizen.Wait(0)
            end
            SetPedMovementClipset(playerPed, "move_m@drunk@verydrunk", true)

        end
        SetTimecycleModifier("spectator5")
        SetPedMotionBlur(playerPed, true)
        SetPedIsDrunk(playerPed, true)
        if start then
            DoScreenFadeIn(800)
        end
        Citizen.Wait(time)
        Reality()
    end)
end

function Reality()
    Citizen.CreateThread(function()
        local playerPed = GetPlayerPed(-1)
        DoScreenFadeOut(800)
        Wait(1000)
        ClearTimecycleModifier()
        ResetScenarioTypesEnabled()
        ResetPedMovementClipset(playerPed, 0)
        SetPedIsDrunk(playerPed, false)
        SetPedMotionBlur(playerPed, false)
        DoScreenFadeIn(800)
    end)
end


--[[RegisterNetEvent("consumables:client:Cokebaggy")
AddEventHandler("consumables:client:Cokebaggy", function()
    CTRPFW.Functions.Progressbar("snort_coke", "Consumming..", math.random(5000, 8000), false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "switch@trevor@trev_smoking_meth",
        anim = "trev_smoking_meth_loop",
        flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(GetPlayerPed(-1), "switch@trevor@trev_smoking_meth", "trev_smoking_meth_loop", 1.0)
        TriggerServerEvent("CTRPFW:Server:RemoveItem", "cokebaggy", 1)
        TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items["cokebaggy"], "remove")
        TriggerEvent("evidence:client:SetStatus", "widepupils", 200)
        CokeBaggyEffect()
    end, function() -- Cancel
        StopAnimTask(GetPlayerPed(-1), "switch@trevor@trev_smoking_meth", "trev_smoking_meth_loop", 1.0)
        CTRPFW.Functions.Notify("Canceled..", "error")
    end)
end)]]

RegisterNetEvent("consumables:client:Cokebaggy")
AddEventHandler("consumables:client:Cokebaggy", function()

    local playerPed = GetPlayerPed(-1)
    local playerPed = PlayerPedId()
    
    RequestAnimSet("MOVE_M@QUICK") 
      while not HasAnimSetLoaded("MOVE_M@QUICK") do
        Citizen.Wait(0)
    end    

    CTRPFW.Functions.Progressbar("snort_coke", "Consumming..", math.random(5000, 8000), false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "switch@trevor@trev_smoking_meth",
        anim = "trev_smoking_meth_loop",
        flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(GetPlayerPed(-1), "switch@trevor@trev_smoking_meth", "trev_smoking_meth_loop", 1.0)
        TriggerServerEvent("CTRPFW:Server:RemoveItem", "cokebaggy", 1)
        TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items["cokebaggy"], "remove")
        TriggerEvent("evidence:client:SetStatus", "widepupils", 200)
        --TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_SMOKING_POT", 0, 1)
        Citizen.Wait(3000)
        ClearPedTasksImmediately(playerPed)
        SetTimecycleModifier("spectator5")
        SetPedMotionBlur(playerPed, true)
        SetPedMovementClipset(playerPed, "MOVE_M@QUICK", true)
        SetPedIsDrunk(playerPed, true)
        SetPedMoveRateOverride(PlayerId(),10.0)
        SetRunSprintMultiplierForPlayer(PlayerId(),1.49)
        
        
        Citizen.Wait(20000)
    
        SetPedMoveRateOverride(PlayerId(),1.0)
        SetRunSprintMultiplierForPlayer(PlayerId(),1.0)
        SetPedIsDrunk(GetPlayerPed(-1), false)		
        SetPedMotionBlur(playerPed, false)
        ResetPedMovementClipset(GetPlayerPed(-1))
        AnimpostfxStopAll()
        
        SetTimecycleModifierStrength(0.0)
    end, function() -- Cancel
        StopAnimTask(GetPlayerPed(-1), "switch@trevor@trev_smoking_meth", "trev_smoking_meth_loop", 1.0)
        CTRPFW.Functions.Notify("Canceled..", "error")
    end)
end)

RegisterNetEvent("consumables:client:Crackbaggy")
AddEventHandler("consumables:client:Crackbaggy", function()
    CTRPFW.Functions.Progressbar("snort_coke", "Consumming..", math.random(7000, 10000), false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "switch@trevor@trev_smoking_meth",
        anim = "trev_smoking_meth_loop",
        flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(GetPlayerPed(-1), "switch@trevor@trev_smoking_meth", "trev_smoking_meth_loop", 1.0)
        TriggerServerEvent("CTRPFW:Server:RemoveItem", "crack_baggy", 1)
        TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items["crack_baggy"], "remove")
        TriggerEvent("evidence:client:SetStatus", "widepupils", 300)
        CrackBaggyEffect()
    end, function() -- Cancel
        StopAnimTask(GetPlayerPed(-1), "switch@trevor@trev_smoking_meth", "trev_smoking_meth_loop", 1.0)
        CTRPFW.Functions.Notify("Canceled..", "error")
    end)
end)

RegisterNetEvent('consumables:client:EcstasyBaggy')
AddEventHandler('consumables:client:EcstasyBaggy', function()
    CTRPFW.Functions.Progressbar("use_ecstasy", "Consumming", 3000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {
		animDict = "mp_suicide",
		anim = "pill",
		flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(GetPlayerPed(-1), "mp_suicide", "pill", 1.0)
        TriggerServerEvent("CTRPFW:Server:RemoveItem", "xtcbaggy", 1)
        TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items["xtcbaggy"], "remove")
        EcstasyEffect()
    end, function() -- Cancel
        StopAnimTask(GetPlayerPed(-1), "mp_suicide", "pill", 1.0)
        CTRPFW.Functions.Notify("Canceled", "error")
    end)
end)

RegisterNetEvent("consumables:client:Eat")
AddEventHandler("consumables:client:Eat", function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"eat"})
    CTRPFW.Functions.Progressbar("eat_something", "Eating..", 2500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("CTRPFW:Server:SetMetaData", "hunger", CTRPFW.Functions.GetPlayerData().metadata["hunger"] + Consumeables[itemName])
        TriggerServerEvent('virus-hudcomponent:Server:RelieveStress', math.random(2, 4))
    end)
end)

RegisterNetEvent("consumables:client:Drink")
AddEventHandler("consumables:client:Drink", function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"drink"})
    CTRPFW.Functions.Progressbar("drink_something", "Drinking..", 2500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("CTRPFW:Server:SetMetaData", "thirst", CTRPFW.Functions.GetPlayerData().metadata["thirst"] + Consumeables[itemName])
    end)
end)

RegisterNetEvent("consumables:client:TeaDrink")
AddEventHandler("consumables:client:TeaDrink", function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"drink"})
    CTRPFW.Functions.Progressbar("drink_something", "Drinking Hi-Tea..", 2500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("CTRPFW:Server:SetMetaData", "thirst", CTRPFW.Functions.GetPlayerData().metadata["thirst"] + Consumeables[itemName])
        TriggerServerEvent('virus-hudcomponent:Server:RelieveStress', math.random(20, 40))
    end)
end)


RegisterNetEvent("consumables:client:CDrink")
AddEventHandler("consumables:client:CDrink", function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"coffee"})
    CTRPFW.Functions.Progressbar("drink_something", "Drinking..", 2500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("CTRPFW:Server:SetMetaData", "thirst", CTRPFW.Functions.GetPlayerData().metadata["thirst"] + Consumeables[itemName])
        TriggerServerEvent('virus-hudcomponent:Server:RelieveStress', math.random(20, 30))
    end)
end)

RegisterNetEvent("consumables:client:SDrink")
AddEventHandler("consumables:client:SDrink", function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"soda"})
    CTRPFW.Functions.Progressbar("drink_something", "Drinking..", 2500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("CTRPFW:Server:SetMetaData", "thirst", CTRPFW.Functions.GetPlayerData().metadata["thirst"] + Consumeables[itemName])
    end)
end)

RegisterNetEvent("consumables:client:SaEat")
AddEventHandler("consumables:client:SaEat", function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"sandwich"})
    CTRPFW.Functions.Progressbar("eat_something", "Eating..", 2500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("CTRPFW:Server:SetMetaData", "hunger", CTRPFW.Functions.GetPlayerData().metadata["hunger"] + Consumeables[itemName])
        TriggerServerEvent('virus-hudcomponent:Server:RelieveStress', math.random(2, 4))
    end)
end)

function EcstasyEffect()
    local startStamina = 30
    SetFlash(0, 0, 500, 7000, 500)
    while startStamina > 0 do
        Citizen.Wait(1000)
        startStamina = startStamina - 1
        RestorePlayerStamina(PlayerId(), 1.0)
        if math.random(1, 100) < 51 then
            SetFlash(0, 0, 500, 7000, 500)
            ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.08)
        end
    end
    if IsPedRunning(GetPlayerPed(-1)) then
        SetPedToRagdoll(GetPlayerPed(-1), math.random(1000, 3000), math.random(1000, 3000), 3, 0, 0, 0)
    end

    startStamina = 0
end

function JointEffect()
     if not onWeed then
         local RelieveOdd = math.random(35, 45)
         onWeed = true
         local weedTime = Config.JointEffectTime
         Citizen.CreateThread(function()
             while onWeed do
                 SetPlayerHealthRechargeMultiplier(PlayerId(), 1.8)
                 Citizen.Wait(1000)
                 weedTime = weedTime - 1
                 if weedTime == RelieveOdd then
                     TriggerServerEvent('virus-hudcomponent:Server:RelieveStress', math.random(14, 18))
                 end
                 if weedTime <= 0 then
                     onWeed = false
                 end
             end
         end)
     end
end

function CrackBaggyEffect()
    local startStamina = 8
    AlienEffect()
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.3)
    while startStamina > 0 do
        Citizen.Wait(1000)
        if math.random(1, 100) < 10 then
            RestorePlayerStamina(PlayerId(), 1.0)
        end
        startStamina = startStamina - 1
        if math.random(1, 100) < 60 and IsPedRunning(GetPlayerPed(-1)) then
            SetPedToRagdoll(GetPlayerPed(-1), math.random(1000, 2000), math.random(1000, 2000), 3, 0, 0, 0)
        end
        if math.random(1, 100) < 51 then
            AlienEffect()
        end
    end
    if IsPedRunning(GetPlayerPed(-1)) then
        SetPedToRagdoll(GetPlayerPed(-1), math.random(1000, 3000), math.random(1000, 3000), 3, 0, 0, 0)
    end

    startStamina = 0
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
end

function CokeBaggyEffect()
    local startStamina = 20
    AlienEffect()
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.1)
    while startStamina > 0 do
        Citizen.Wait(1000)
        if math.random(1, 100) < 20 then
            RestorePlayerStamina(PlayerId(), 1.0)
        end
        startStamina = startStamina - 1
        if math.random(1, 100) < 10 and IsPedRunning(GetPlayerPed(-1)) then
            SetPedToRagdoll(GetPlayerPed(-1), math.random(1000, 3000), math.random(1000, 3000), 3, 0, 0, 0)
        end
        if math.random(1, 300) < 10 then
            AlienEffect()
            Citizen.Wait(math.random(3000, 6000))
        end
    end
    if IsPedRunning(GetPlayerPed(-1)) then
        SetPedToRagdoll(GetPlayerPed(-1), math.random(1000, 3000), math.random(1000, 3000), 3, 0, 0, 0)
    end

    startStamina = 0
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
end

function AlienEffect()
    StartScreenEffect("DrugsMichaelAliensFightIn", 3.0, 0)
    Citizen.Wait(math.random(5000, 8000))
    StartScreenEffect("DrugsMichaelAliensFight", 3.0, 0)
    Citizen.Wait(math.random(5000, 8000))
    StartScreenEffect("DrugsMichaelAliensFightOut", 3.0, 0)
    StopScreenEffect("DrugsMichaelAliensFightIn")
    StopScreenEffect("DrugsMichaelAliensFight")
    StopScreenEffect("DrugsMichaelAliensFightOut")
end
--added{oxy and joint use}

--[[RegisterNetEvent("consumables:client:MakeJoint")
AddEventHandler("consumables:client:MakeJoint", function()
    CTRPFW.Functions.Progressbar("smoke_joint", "Making Joint..", 1500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items["cannabis"], "remove")
        TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items["joint"], "add")
        TriggerServerEvent("CTRPFW:Server:AddItem", "joint", 1)
    end)
end)]]

RegisterNetEvent("consumables:client:MakeJoint")
AddEventHandler("consumables:client:MakeJoint", function()
    CTRPFW.Functions.TriggerCallback('joint:ingredient', function(HasItem, type)
        if HasItem then
            CTRPFW.Functions.Progressbar("smoke_joint", "Making Joint..", 5000, false, true, {
                disableMovement = false,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "anim@amb@business@weed@weed_inspecting_high_dry@",
		        anim = "weed_inspecting_high_base_inspector",
		        flags = 49,
            }, {}, {}, function() -- Done
                StopAnimTask(GetPlayerPed(-1), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
                
                TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items["weed_2og"], "remove")
                TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items["rolling_paper"], "remove")
                TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items["joint"], "add")
                
                
                TriggerServerEvent("CTRPFW:Server:RemoveItem", 'weed_2og', 1)
                TriggerServerEvent("CTRPFW:Server:RemoveItem", 'rolling_paper', 1)
                TriggerServerEvent("CTRPFW:Server:AddItem", "joint", 1)
                StopAnimTask(GetPlayerPed(-1), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
            end)
        else
            CTRPFW.Functions.Notify("आपके पास आवश्यक सामग्री नहीं है|", "error")
            isProcessing = false
        end
    end)
end)

RegisterNetEvent("consumables:client:UseOxy")
AddEventHandler("consumables:client:UseOxy", function()
    CTRPFW.Functions.Progressbar("use_bandage", "Take Oxy", 3000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {
		animDict = "mp_suicide",
		anim = "pill",
		flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(GetPlayerPed(-1), "mp_suicide", "pill", 1.0)
        --TriggerServerEvent("CTRPFW:Server:RemoveItem", "oxy", 1)
        --TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items["oxy"], "remove")
        TriggerEvent("hospital:client:HealInjuries", source ,"full")
        TriggerServerEvent('virus-hudcomponent:Server:RelieveStress', math.random(10, 20))
    end, function() -- Cancel
        StopAnimTask(GetPlayerPed(-1), "mp_suicide", "pill", 1.0)
        CTRPFW.Functions.Notify("Fail", "error")
    end)
end)


RegisterNetEvent("consumables:client:paracetamol")
AddEventHandler("consumables:client:paracetamol", function()
    CTRPFW.Functions.Progressbar("use_bandage", "Taking Paracetamol", 3000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {
		animDict = "mp_suicide",
		anim = "pill",
		flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(GetPlayerPed(-1), "mp_suicide", "pill", 1.0)
        TriggerServerEvent("CTRPFW:Server:RemoveItem", "paracetamol", 1)
        TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items["paracetamol"], "remove")
        --TriggerEvent("hospital:client:HealInjuries", source ,"partial")
        SetEntityHealth(GetPlayerPed(-1), GetEntityHealth(GetPlayerPed(-1)) + 5)
        
        TriggerServerEvent('virus-hudcomponent:Server:RelieveStress', math.random(30, 40))
    end, function() -- Cancel
        StopAnimTask(GetPlayerPed(-1), "mp_suicide", "pill", 1.0)
        CTRPFW.Functions.Notify("Fail", "error")
    end)
end)

RegisterNetEvent("consumables:client:aspirine")
AddEventHandler("consumables:client:aspirine", function()
    CTRPFW.Functions.Progressbar("use_bandage", "Taking Aspirine", 3000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {
		animDict = "mp_suicide",
		anim = "pill",
		flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(GetPlayerPed(-1), "mp_suicide", "pill", 1.0)
        TriggerServerEvent("CTRPFW:Server:RemoveItem", "aspirine", 1)
        TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items["aspirine"], "remove")
        --TriggerEvent("hospital:client:HealInjuries", source ,"partial")
        SetEntityHealth(GetPlayerPed(-1), GetEntityHealth(GetPlayerPed(-1)) + 6)
        TriggerServerEvent('virus-hudcomponent:Server:RelieveStress', math.random(30, 40))
        CrackBaggyEffect()
    end, function() -- Cancel
        StopAnimTask(GetPlayerPed(-1), "mp_suicide", "pill", 1.0)
        CTRPFW.Functions.Notify("Fail", "error")
    end)
end)

RegisterNetEvent("consumables:client:disprin")
AddEventHandler("consumables:client:disprin", function()
    CTRPFW.Functions.Progressbar("use_bandage", "Taking Disprin", 3000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {
		animDict = "mp_suicide",
		anim = "pill",
		flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(GetPlayerPed(-1), "mp_suicide", "pill", 1.0)
        TriggerServerEvent("CTRPFW:Server:RemoveItem", "disprin", 1)
        TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items["disprin"], "remove")
        TriggerServerEvent('virus-hudcomponent:Server:RelieveStress', math.random(50, 60))
    end, function() -- Cancel
        StopAnimTask(GetPlayerPed(-1), "mp_suicide", "pill", 1.0)
        CTRPFW.Functions.Notify("Fail", "error")
    end)
end)

RegisterNetEvent("consumables:client:heparin")
AddEventHandler("consumables:client:heparin", function()
    CTRPFW.Functions.Progressbar("use_bandage", "Taking Heparin", 3000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {
		animDict = "mp_suicide",
		anim = "pill",
		flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(GetPlayerPed(-1), "mp_suicide", "pill", 1.0)
        TriggerServerEvent("CTRPFW:Server:RemoveItem", "heparin", 1)
        TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items["heparin"], "remove")
        --TriggerEvent("hospital:client:HealInjuries", source ,"partial")
        SetEntityHealth(GetPlayerPed(-1), GetEntityHealth(GetPlayerPed(-1)) + 7)
        TriggerServerEvent('virus-hudcomponent:Server:RelieveStress', math.random(20, 30))
    end, function() -- Cancel
        StopAnimTask(GetPlayerPed(-1), "mp_suicide", "pill", 1.0)
        CTRPFW.Functions.Notify("Fail", "error")
    end)
end)

RegisterNetEvent("consumables:client:ibuprofen")
AddEventHandler("consumables:client:ibuprofen", function()
    CTRPFW.Functions.Progressbar("use_bandage", "Taking Ibuprofen", 3000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {
		animDict = "mp_suicide",
		anim = "pill",
		flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(GetPlayerPed(-1), "mp_suicide", "pill", 1.0)
        TriggerServerEvent("CTRPFW:Server:RemoveItem", "ibuprofen", 1)
        TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items["ibuprofen"], "remove")
        --TriggerEvent("hospital:client:HealInjuries", source ,"full")
        SetEntityHealth(GetPlayerPed(-1), GetEntityHealth(GetPlayerPed(-1)) + 15)
        TriggerServerEvent('virus-hudcomponent:Server:RelieveStress', math.random(50, 60))
    end, function() -- Cancel
        StopAnimTask(GetPlayerPed(-1), "mp_suicide", "pill", 1.0)
        CTRPFW.Functions.Notify("Fail", "error")
    end)
end)

RegisterNetEvent("consumables:client:MethPooch")
AddEventHandler("consumables:client:MethPooch", function()

    local playerPed = GetPlayerPed(-1)
    local playerPed = PlayerPedId()
  
    RequestAnimSet("move_m@drunk@slightlydrunk") 
    while not HasAnimSetLoaded("move_m@drunk@slightlydrunk") do
      Citizen.Wait(0)
    end    

    CTRPFW.Functions.Progressbar("use_bandage", "Taking Meth", 3000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {
		animDict = "mp_suicide",
		anim = "pill",
		flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(GetPlayerPed(-1), "mp_suicide", "pill", 1.0)
        TriggerServerEvent("CTRPFW:Server:RemoveItem", "meth_pooch", 1)
        TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items["meth_pooch"], "remove")
        TriggerEvent("evidence:client:SetStatus", "Meth", 300)

        Citizen.Wait(3000)
        ClearPedTasksImmediately(playerPed)
        SetPedMotionBlur(playerPed, true)
        SetPedMovementClipset(playerPed, "move_m@drunk@slightlydrunk", true)
        SetPedIsDrunk(playerPed, true)
        SetTimecycleModifier("spectator5")
        AnimpostfxPlay("SuccessMichael", 10000001, true)
        ShakeGameplayCam("DRUNK_SHAKE", 1.5)
        
        SetEntityHealth(GetPlayerPed(-1), 200)
    --vvvvvvvvvvvvvvvv
        Citizen.Wait(100000)
    --^^^^^^^^^^^^^^^^
    --Time of effect
    --  after wait stop all effects
        SetPedMoveRateOverride(PlayerId(),1.0)
        SetRunSprintMultiplierForPlayer(PlayerId(),1.0)
        SetPedIsDrunk(GetPlayerPed(-1), false)		
        SetPedMotionBlur(playerPed, false)
        ResetPedMovementClipset(GetPlayerPed(-1))
        AnimpostfxStopAll()
        ShakeGameplayCam("DRUNK_SHAKE", 0.0)
        SetTimecycleModifierStrength(0.0)
       
        TriggerServerEvent('virus-hudcomponent:Server:RelieveStress', math.random(10, 20))
    end, function() -- Cancel
        StopAnimTask(GetPlayerPed(-1), "mp_suicide", "pill", 1.0)
        CTRPFW.Functions.Notify("Fail", "error")
    end)
end)


RegisterNetEvent("consumables:client:Acideffect")
AddEventHandler("consumables:client:Acideffect", function()

    local playerPed = GetPlayerPed(-1)
    local playerPed = PlayerPedId()
  
    RequestAnimSet("move_m@drunk@slightlydrunk") 
    while not HasAnimSetLoaded("move_m@drunk@slightlydrunk") do
      Citizen.Wait(0)
    end    

    CTRPFW.Functions.Progressbar("use_bandage", "Taking Acid", 3000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {
		animDict = "mp_suicide",
		anim = "pill",
		flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(GetPlayerPed(-1), "mp_suicide", "pill", 1.0)
        TriggerServerEvent("CTRPFW:Server:RemoveItem", "acid", 1)
        TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items["acid"], "remove")
        TriggerEvent("evidence:client:SetStatus", "Acid", 300)

        Drunk(2, true, 150000)
        exports["acidtrip"]:DoAcid(120000)
       
        TriggerServerEvent('virus-hudcomponent:Server:RelieveStress', math.random(10, 20))
    end, function() -- Cancel
        StopAnimTask(GetPlayerPed(-1), "mp_suicide", "pill", 1.0)
        CTRPFW.Functions.Notify("Fail", "error")
    end)
end)


--BABAKADHABA
--STARTER

RegisterNetEvent("consumables:client:tsoup")
AddEventHandler("consumables:client:tsoup", function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"drink"})
    CTRPFW.Functions.Progressbar("drink_something", "Eating Soup", 2500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("CTRPFW:Server:SetMetaData", "thirst", CTRPFW.Functions.GetPlayerData().metadata["thirst"] + Consumeables[itemName])
    end)
end)

RegisterNetEvent("consumables:client:msoup")
AddEventHandler("consumables:client:msoup", function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"drink"})
    CTRPFW.Functions.Progressbar("drink_something", "Eating Soup", 2500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("CTRPFW:Server:SetMetaData", "thirst", CTRPFW.Functions.GetPlayerData().metadata["thirst"] + Consumeables[itemName])
    end)
end)

RegisterNetEvent("consumables:client:rggol")
AddEventHandler("consumables:client:rggol", function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"eat"})
    CTRPFW.Functions.Progressbar("eat_something", "Eating Golgappa..", 2500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("CTRPFW:Server:SetMetaData", "hunger", CTRPFW.Functions.GetPlayerData().metadata["hunger"] + Consumeables[itemName])
        TriggerServerEvent('virus-hudcomponent:Server:RelieveStress', math.random(1, 2))
    end)
end)


--DESERTS

RegisterNetEvent("consumables:client:belachi")
AddEventHandler("consumables:client:belachi", function()
    CTRPFW.Functions.Progressbar("use_bandage", "Eating Baba Elaichi", 3000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {
		animDict = "mp_suicide",
		anim = "pill",
		flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(GetPlayerPed(-1), "mp_suicide", "pill", 1.0)
        -- TriggerServerEvent("CTRPFW:Server:RemoveItem", "belachi", 1)
        TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items["belachi"], "remove")
        TriggerServerEvent('virus-hudcomponent:Server:RelieveStress', math.random(5, 10))
    end, function() -- Cancel
        StopAnimTask(GetPlayerPed(-1), "mp_suicide", "pill", 1.0)
        CTRPFW.Functions.Notify("Fail", "error")
    end)
end)

RegisterNetEvent("consumables:client:gulabjamun")
AddEventHandler("consumables:client:gulabjamun", function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"eat"})
    CTRPFW.Functions.Progressbar("eat_something", "Eating gulabjamun..", 2500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("CTRPFW:Server:SetMetaData", "hunger", CTRPFW.Functions.GetPlayerData().metadata["hunger"] + Consumeables[itemName])
    end)
end)

RegisterNetEvent("consumables:client:rosogulla")
AddEventHandler("consumables:client:rosogulla", function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"eat"})
    CTRPFW.Functions.Progressbar("eat_something", "Eating rosogulla..", 2500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("CTRPFW:Server:SetMetaData", "hunger", CTRPFW.Functions.GetPlayerData().metadata["hunger"] + Consumeables[itemName])
    end)
end)

RegisterNetEvent("consumables:client:paan")
AddEventHandler("consumables:client:paan", function(itemName)
    TriggerEvent('ctrp-clothing:client:adjustfacewear')
    TriggerEvent('animations:client:EmoteCommandStart', {"eat"})
    CTRPFW.Functions.Progressbar("eat_something", "Eating paan..", 2500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        local PanData = {
            outfitData = {
                ["lipstick"]   = { item = 2, texture = 21},  -- Nek / Das
                --["lipstick"]   = { item = 8, texture = 21},
            },
        }
        
        TriggerEvent('ctrp-clothing:client:loadOutfit', PanData)
        TriggerServerEvent("CTRPFW:Server:SetMetaData", "hunger", CTRPFW.Functions.GetPlayerData().metadata["hunger"] + Consumeables[itemName])
    end)
end)

--main

RegisterNetEvent("consumables:client:cookedchicken")
AddEventHandler("consumables:client:cookedchicken", function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"eat"})
    CTRPFW.Functions.Progressbar("eat_something", "Eating Cooked Chicken..", 2500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("CTRPFW:Server:SetMetaData", "hunger", CTRPFW.Functions.GetPlayerData().metadata["hunger"] + Consumeables[itemName])
    end)
end)

RegisterNetEvent("consumables:client:pannermasala")
AddEventHandler("consumables:client:pannermasala", function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"eat"})
    CTRPFW.Functions.Progressbar("eat_something", "Eating Paneer Masala..", 2500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("CTRPFW:Server:SetMetaData", "hunger", CTRPFW.Functions.GetPlayerData().metadata["hunger"] + Consumeables[itemName])
    end)
end)

RegisterNetEvent("consumables:client:chickenmasala")
AddEventHandler("consumables:client:chickenmasala", function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"eat"})
    CTRPFW.Functions.Progressbar("eat_something", "Eating Chicken Masala..", 2500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("CTRPFW:Server:SetMetaData", "hunger", CTRPFW.Functions.GetPlayerData().metadata["hunger"] + Consumeables[itemName])
    end)
end)

RegisterNetEvent("consumables:client:chickenroll")
AddEventHandler("consumables:client:chickenroll", function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"eat"})
    CTRPFW.Functions.Progressbar("eat_something", "Eating Chicken Roll..", 2500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("CTRPFW:Server:SetMetaData", "hunger", CTRPFW.Functions.GetPlayerData().metadata["hunger"] + Consumeables[itemName])
    end)
end)

RegisterNetEvent("consumables:client:brownbread")
AddEventHandler("consumables:client:brownbread", function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"eat"})
    CTRPFW.Functions.Progressbar("eat_something", "Eating Brown Bread..", 2500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("CTRPFW:Server:SetMetaData", "hunger", CTRPFW.Functions.GetPlayerData().metadata["hunger"] + Consumeables[itemName])
    end)
end)

RegisterNetEvent("consumables:client:naan")
AddEventHandler("consumables:client:naan", function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"eat"})
    CTRPFW.Functions.Progressbar("eat_something", "Eating Naan..", 2500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("CTRPFW:Server:SetMetaData", "hunger", CTRPFW.Functions.GetPlayerData().metadata["hunger"] + Consumeables[itemName])
    end)
end)


RegisterNetEvent("virus-bag:client:UseBag")
AddEventHandler("virus-bag:client:UseBag", function()
    loadAnimDict("clothingtie")
    TaskPlayAnim(GetPlayerPed(-1), "clothingtie", "try_tie_negative_a", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
    CTRPFW.Functions.Notify("Bag is being opened..", "error")
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "invbag", 0.5)
    CTRPFW.Functions.Progressbar("bag", "Bag is opening..", 2500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        local VIRUSFWBagData = {
            outfitData = {
                ["bag"]   = { item = 41, texture = 0},  -- Nek / Das
            }
        }
        TriggerServerEvent("inventory:server:OpenInventory", "stash", "bag_"..CTRPFW.Functions.GetPlayerData().citizenid, {
            maxweight = 500000,
            slots = 20,
        })
        TriggerEvent("inventory:client:SetCurrentStash", "bag_"..CTRPFW.Functions.GetPlayerData().citizenid)
        
        TaskPlayAnim(ped, "clothingshirt", "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
        CTRPFW.Functions.Notify("Bag has been opened successfully", "success")
    end)
end)



--[[RegisterNetEvent("consumables:client:mushroomkhao")
AddEventHandler("consumables:client:mushroomkhao", function(itemName)
    TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items[itemName], "remove")
    TriggerEvent('animations:client:EmoteCommandStart', {"eat"})
    CTRPFW.Functions.Progressbar("eat_something", "Eating..", 2500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        
        TriggerEvent('animations:client:EmoteCommandStart', {"cough"})
        Citizen.Wait(6000)
        TriggerServerEvent("CTRPFW:Server:SetMetaData", "hunger", CTRPFW.Functions.GetPlayerData().metadata["hunger"] - 25)
        TriggerServerEvent("CTRPFW:Server:SetMetaData", "thirst", CTRPFW.Functions.GetPlayerData().metadata["thirst"] - 25)

        Citizen.Wait(6000)
        TriggerServerEvent("CTRPFW:Server:SetMetaData", "hunger", CTRPFW.Functions.GetPlayerData().metadata["hunger"] - 25)
        TriggerServerEvent("CTRPFW:Server:SetMetaData", "thirst", CTRPFW.Functions.GetPlayerData().metadata["thirst"] - 25)
        TriggerServerEvent('ctrp-hud:Server:GainStress', math.random(2, 5))
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    end)
end)

RegisterNetEvent("consumables:client:pmushroomkhao")
AddEventHandler("consumables:client:pmushroomkhao", function(itemName)
    TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items[itemName], "remove")
    TriggerEvent('animations:client:EmoteCommandStart', {"eat"})
    CTRPFW.Functions.Progressbar("eat_something", "Eating..", 2500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        
        TriggerEvent('animations:client:EmoteCommandStart', {"cough"})
        Citizen.Wait(6000)
        TriggerServerEvent("CTRPFW:Server:SetMetaData", "hunger", CTRPFW.Functions.GetPlayerData().metadata["hunger"] - 50)
        TriggerServerEvent("CTRPFW:Server:SetMetaData", "thirst", CTRPFW.Functions.GetPlayerData().metadata["thirst"] - 50)

        Citizen.Wait(6000)
        TriggerServerEvent("CTRPFW:Server:SetMetaData", "hunger", CTRPFW.Functions.GetPlayerData().metadata["hunger"] - 50)
        TriggerServerEvent("CTRPFW:Server:SetMetaData", "thirst", CTRPFW.Functions.GetPlayerData().metadata["thirst"] - 50)

        SetEntityHealth(GetPlayerPed(-1), 0)
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    end)
end)]]


RegisterNetEvent("consumables:client:mushroomkhao")
AddEventHandler("consumables:client:mushroomkhao", function(itemName)
    TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items[itemName], "remove")
    TriggerEvent('animations:client:EmoteCommandStart', {"eat"})
    CTRPFW.Functions.Progressbar("eat_something", "Eating..", 2500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        
        TriggerEvent('animations:client:EmoteCommandStart', {"cough"})
        Citizen.Wait(800)
        TriggerServerEvent("InteractSound_SV:PlayOnSource", "vomit", 0.3)
        Citizen.Wait(6000)
        TriggerServerEvent("CTRPFW:Server:SetMetaData", "hunger", CTRPFW.Functions.GetPlayerData().metadata["hunger"] - 25)
        TriggerServerEvent("CTRPFW:Server:SetMetaData", "thirst", CTRPFW.Functions.GetPlayerData().metadata["thirst"] - 25)

        Citizen.Wait(3000)
        TriggerServerEvent("InteractSound_SV:PlayOnSource", "vomit", 0.3)
        TriggerServerEvent("CTRPFW:Server:SetMetaData", "hunger", CTRPFW.Functions.GetPlayerData().metadata["hunger"] - 25)
        TriggerServerEvent("CTRPFW:Server:SetMetaData", "thirst", CTRPFW.Functions.GetPlayerData().metadata["thirst"] - 25)
        TriggerServerEvent('virus-hudcomponent:Server:GainStress', math.random(2, 5))
        Citizen.Wait(1000)
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    end)
end)

RegisterNetEvent("consumables:client:pmushroomkhao")
AddEventHandler("consumables:client:pmushroomkhao", function(itemName)
    TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items[itemName], "remove")
    TriggerEvent('animations:client:EmoteCommandStart', {"eat"})
    CTRPFW.Functions.Progressbar("eat_something", "Eating..", 2500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        
        TriggerEvent('animations:client:EmoteCommandStart', {"cough"})
        Citizen.Wait(800)
        TriggerServerEvent("InteractSound_SV:PlayOnSource", "vomit", 0.3)
        Citizen.Wait(6000)
        TriggerServerEvent("CTRPFW:Server:SetMetaData", "hunger", CTRPFW.Functions.GetPlayerData().metadata["hunger"] - 50)
        TriggerServerEvent("CTRPFW:Server:SetMetaData", "thirst", CTRPFW.Functions.GetPlayerData().metadata["thirst"] - 50)

        Citizen.Wait(3000)
        TriggerServerEvent("InteractSound_SV:PlayOnSource", "vomit", 0.3)
        TriggerServerEvent("CTRPFW:Server:SetMetaData", "hunger", CTRPFW.Functions.GetPlayerData().metadata["hunger"] - 50)
        TriggerServerEvent("CTRPFW:Server:SetMetaData", "thirst", CTRPFW.Functions.GetPlayerData().metadata["thirst"] - 50)


        SetEntityHealth(GetPlayerPed(-1), 0)
        Citizen.Wait(1000)
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    end)
end)

RegisterNetEvent("consumables:client:UsesJoint")
AddEventHandler("consumables:client:UsesJoint", function()

    local playerPed = GetPlayerPed(-1)
    local armor = 0
  
    if not IsPedInAnyVehicle(playerPed, false) then
        TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_SMOKING_POT", 0, 1)
        Citizen.Wait(100)
        TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_SMOKING_POT", 0, 1)
        CTRPFW.Functions.Progressbar("smoke_joint", "Consumming..", 28000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items["sjoint"], "remove")
            Citizen.Wait(3000)
            ClearPedTasksImmediately(playerPed)
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            armor = GetPedArmour(GetPlayerPed(-1))
            if armor == 100.0 then
                CTRPFW.Functions.Notify("कम मारो रे!" , "error")
            elseif armor >= 95.0 then
                CTRPFW.Functions.Notify("Armor Increased" , "error")
                SetPedArmour(PlayerPedId(), 100)
            elseif armor >= 85.0 then
                CTRPFW.Functions.Notify("Armor Increased" , "error")
                SetPedArmour(PlayerPedId(), 95)
            elseif armor >= 75.0 then
                CTRPFW.Functions.Notify("Armor Increased" , "error")
                SetPedArmour(PlayerPedId(), 85)
            elseif armor >= 65.0 then
                CTRPFW.Functions.Notify("Armor Increased" , "error")
                SetPedArmour(PlayerPedId(), 75)
            elseif armor >= 55.0 then
                CTRPFW.Functions.Notify("Armor Increased" , "error")
                SetPedArmour(PlayerPedId(), 65)
            elseif armor >= 45.0 then
                CTRPFW.Functions.Notify("Armor Increased" , "error")
                SetPedArmour(PlayerPedId(), 55)
            elseif armor >= 35.0 then
                CTRPFW.Functions.Notify("Armor Increased" , "error")
                SetPedArmour(PlayerPedId(), 45)
            elseif armor >= 25.0 then
                CTRPFW.Functions.Notify("Armor Increased" , "error")
                SetPedArmour(PlayerPedId(), 35)
            elseif armor >= 15.0 then
                CTRPFW.Functions.Notify("Armor Increased" , "error")
                SetPedArmour(PlayerPedId(), 25)
            else 
                SetPedArmour(PlayerPedId(), 15)
            end
            Citizen.Wait(3000)
            TriggerServerEvent('virus-hudcomponent:Server:RelieveStress', math.random(25, 45))
            TriggerEvent("evidence:client:SetStatus", "weedsmell", 300)
        end)
    elseif IsPedInAnyVehicle(playerPed, false) then

        CTRPFW.Functions.Progressbar("smoke_joint", "Consumming..", 28000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items["sjoint"], "remove")
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            armor = GetPedArmour(GetPlayerPed(-1))
            if armor == 100.0 then
                CTRPFW.Functions.Notify("कम मारो रे!" , "error")
            elseif armor >= 95.0 then
                CTRPFW.Functions.Notify("Armor Increased" , "error")
                SetPedArmour(PlayerPedId(), 100)
            elseif armor >= 85.0 then
                CTRPFW.Functions.Notify("Armor Increased" , "error")
                SetPedArmour(PlayerPedId(), 95)
            elseif armor >= 75.0 then
                CTRPFW.Functions.Notify("Armor Increased" , "error")
                SetPedArmour(PlayerPedId(), 85)
            elseif armor >= 65.0 then
                CTRPFW.Functions.Notify("Armor Increased" , "error")
                SetPedArmour(PlayerPedId(), 75)
            elseif armor >= 55.0 then
                CTRPFW.Functions.Notify("Armor Increased" , "error")
                SetPedArmour(PlayerPedId(), 65)
            elseif armor >= 45.0 then
                CTRPFW.Functions.Notify("Armor Increased" , "error")
                SetPedArmour(PlayerPedId(), 55)
            elseif armor >= 35.0 then
                CTRPFW.Functions.Notify("Armor Increased" , "error")
                SetPedArmour(PlayerPedId(), 45)
            elseif armor >= 25.0 then
                CTRPFW.Functions.Notify("Armor Increased" , "error")
                SetPedArmour(PlayerPedId(), 35)
            elseif armor >= 15.0 then
                CTRPFW.Functions.Notify("Armor Increased" , "error")
                SetPedArmour(PlayerPedId(), 25)
            else 
                SetPedArmour(PlayerPedId(), 15)
            end
            Citizen.Wait(3000)
            TriggerServerEvent('virus-hudcomponent:Server:RelieveStress', math.random(25, 45))
            TriggerEvent("evidence:client:SetStatus", "weedsmell", 300)
        end)
    end
end)

RegisterNetEvent("consumables:client:MakesJoint")
AddEventHandler("consumables:client:MakesJoint", function()
    CTRPFW.Functions.TriggerCallback('sjoint:ingredient', function(HasItem, type)
        if HasItem then
            CTRPFW.Functions.Progressbar("smoke_joint", "Making Joint..", 5000, false, true, {
                disableMovement = false,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "anim@amb@business@weed@weed_inspecting_high_dry@",
		        anim = "weed_inspecting_high_base_inspector",
		        flags = 49,
            }, {}, {}, function() -- Done
                StopAnimTask(GetPlayerPed(-1), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
                
                TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items["weed_skunk"], "remove")
                TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items["rolling_paper"], "remove")
                TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items["sjoint"], "add")
                
                
                TriggerServerEvent("CTRPFW:Server:RemoveItem", 'weed_skunk', 1)
                TriggerServerEvent("CTRPFW:Server:RemoveItem", 'rolling_paper', 1)
                TriggerServerEvent("CTRPFW:Server:AddItem", "sjoint", 1)
                StopAnimTask(GetPlayerPed(-1), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
            end)
        else
            CTRPFW.Functions.Notify("आपके पास आवश्यक सामग्री नहीं है|", "error")
            isProcessing = false
        end
    end)
end)

RegisterNetEvent("consumables:client:EatBurger")
AddEventHandler("consumables:client:EatBurger", function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"burger"})
    CTRPFW.Functions.Progressbar("eat_something", "Eating..", 2500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("CTRPFW:Server:SetMetaData", "hunger", CTRPFW.Functions.GetPlayerData().metadata["hunger"] + Consumeables[itemName])
        TriggerServerEvent('virus-hudcomponent:Server:RelieveStress', math.random(3, 5))
    end)
end)

RegisterNetEvent("consumables:client:OpenMeal")
AddEventHandler("consumables:client:OpenMeal", function(itemName)
    CTRPFW.Functions.Progressbar("smoke_joint", "OPENING MEAL..", 2000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "anim@amb@business@weed@weed_inspecting_high_dry@",
        anim = "weed_inspecting_high_base_inspector",
        flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(GetPlayerPed(-1), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
        
        TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items["mcd-burger"], "add")
        TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items["kurkakola"], "add")
        TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items["mcd-fries"], "add")
        
        
        TriggerServerEvent("CTRPFW:Server:AddItem", 'mcd-burger', 1)
        TriggerServerEvent("CTRPFW:Server:AddItem", 'kurkakola', 1)
        TriggerServerEvent("CTRPFW:Server:AddItem", "mcd-fries", 1)
        StopAnimTask(GetPlayerPed(-1), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
    end)
            
        
end)