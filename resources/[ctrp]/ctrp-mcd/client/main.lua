CTRPFW = nil

Citizen.CreateThread(function()
    while CTRPFW == nil do
        TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)
        Citizen.Wait(200)
    end
end)

isLoggedIn = true
PlayerJob = {}

local onDuty = false

local blips = {

     {title="MC DONALD", colour=5, id=78, x = 82.79, y = 279.21, z = 110.21},
  }


Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.7)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)

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


RegisterNetEvent('CTRPFW:Client:OnPlayerLoaded')
AddEventHandler('CTRPFW:Client:OnPlayerLoaded', function()
    CTRPFW.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
        if PlayerData.job.onduty then
            if PlayerData.job.name == "mcd" then
                TriggerServerEvent("CTRPFW:ToggleDuty")
            end
        end
    end)
end)

RegisterNetEvent('CTRPFW:Client:OnJobUpdate')
AddEventHandler('CTRPFW:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
    onDuty = PlayerJob.onduty
end)

RegisterNetEvent('CTRPFW:Client:SetDuty')
AddEventHandler('CTRPFW:Client:SetDuty', function(duty)
    onDuty = duty
end)

Citizen.CreateThread(function()
    local c = Config.Locations["exit"]
    local Blip = AddBlipForCoord(c.x, c.y, c.z)

    SetBlipSprite (Blip, 0)
    SetBlipDisplay(Blip, 0)
    SetBlipScale  (Blip, 0)
    SetBlipAsShortRange(Blip, true)
    SetBlipColour(Blip, 0)
    SetBlipAlpha(Blip, 0)
end)

Citizen.CreateThread(function()
    while true do
        local inRange = false

        if isLoggedIn then
            if PlayerJob.name == "mcd" then
                local pos = GetEntityCoords(GetPlayerPed(-1))
                local StashDistance = GetDistanceBetweenCoords(pos, Config.Locations["stash"].x, Config.Locations["stash"].y, Config.Locations["stash"].z, true)
                local OnDutyDistance = GetDistanceBetweenCoords(pos, Config.Locations["duty"].x, Config.Locations["duty"].y, Config.Locations["duty"].z, true)
                local VehicleDistance = GetDistanceBetweenCoords(pos, Config.Locations["vehicle"].x, Config.Locations["vehicle"].y, Config.Locations["vehicle"].z, true)

                local shakeFilling = GetDistanceBetweenCoords(pos, Config.Locations["shakefill"].x, Config.Locations["shakefill"].y, Config.Locations["shakefill"].z, true)
                local shakeFilling2 = GetDistanceBetweenCoords(pos, Config.Locations["shakefill2"].x, Config.Locations["shakefill2"].y, Config.Locations["shakefill2"].z, true)
                local Hotfilling = GetDistanceBetweenCoords(pos, Config.Locations["hotfill"].x, Config.Locations["hotfill"].y, Config.Locations["hotfill"].z, true)
                local Shop = GetDistanceBetweenCoords(pos, Config.Locations["inShop"].x, Config.Locations["inShop"].y, Config.Locations["inShop"].z, true)

                if onDuty then
                    if StashDistance < 20 then
                        inRange = true
                        --DrawMarker(2, Config.Locations["stash"].x, Config.Locations["stash"].y, Config.Locations["stash"].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)

                        if StashDistance < 1 then
                            DrawText3Ds(Config.Locations["stash"].x, Config.Locations["stash"].y, Config.Locations["stash"].z, "[E] Open Stash")
                            if IsControlJustReleased(0, Keys["E"]) then
                                TriggerEvent("inventory:client:SetCurrentStash", "mcdstash")
                                TriggerServerEvent("inventory:server:OpenInventory", "stash", "mcdstash", {
                                    maxweight = 4000000,
                                    slots = 500,
                                })
                            end
                        end
                    end
                end

                if onDuty then
                    if VehicleDistance < 20 then
                        inRange = true
                        DrawMarker(2, Config.Locations["vehicle"].x, Config.Locations["vehicle"].y, Config.Locations["vehicle"].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)
                        if VehicleDistance < 1 then
                            local InVehicle = IsPedInAnyVehicle(GetPlayerPed(-1))

                            if InVehicle then
                                DrawText3Ds(Config.Locations["vehicle"].x, Config.Locations["vehicle"].y, Config.Locations["vehicle"].z, '[E] Hide the vehicle')
                                if IsControlJustPressed(0, Keys["E"]) then
                                    DeleteVehicle(GetVehiclePedIsIn(GetPlayerPed(-1)))
                                end
                            else
                                DrawText3Ds(Config.Locations["vehicle"].x, Config.Locations["vehicle"].y, Config.Locations["vehicle"].z, '[E] Grab vehicle')
                                if IsControlJustPressed(0, Keys["E"]) then
                                    if IsControlJustPressed(0, Keys["E"]) then
                                        VehicleList()
                                        Menu.hidden = not Menu.hidden
                                    end
                                end
                                Menu.renderGUI()
                            end
                        end
                    end
                end

                if OnDutyDistance < 20 then
                    inRange = true
                    DrawMarker(2, Config.Locations["duty"].x, Config.Locations["duty"].y, Config.Locations["duty"].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)

                    if OnDutyDistance < 1 then
                        if not onDuty then
                            DrawText3Ds(Config.Locations["duty"].x, Config.Locations["duty"].y, Config.Locations["duty"].z, "[E] On Duty")
                        else
                            DrawText3Ds(Config.Locations["duty"].x, Config.Locations["duty"].y, Config.Locations["duty"].z, "[E] Off Duty")
                        end
                        if IsControlJustReleased(0, Keys["E"]) then
                            TriggerServerEvent("CTRPFW:ToggleDuty")
                        end
                    end
                end

                if shakeFilling < 20 then
                    inRange = true
                    if shakeFilling < 1 then
                        
                        DrawText3Ds(Config.Locations["shakefill"].x, Config.Locations["shakefill"].y, Config.Locations["shakefill"].z, "[E] Fill Strawberry Shake | [N] Fill Mango Shake")

                        if IsControlJustReleased(0, Keys["E"]) then
                            
                            CTRPFW.Functions.TriggerCallback('CTRPFW:HasItem', function(result)
                                if result then
                                    StrawberryFilling()
                                else
                                    CTRPFW.Functions.Notify("You don't have empty glass", "error")
                                end
                            
                            end, 'mcd-glass')

                        elseif IsControlJustReleased(0, Keys["N"]) then

                            CTRPFW.Functions.TriggerCallback('CTRPFW:HasItem', function(result)
                                if result then
                                    MangoFilling()
                                else
                                    CTRPFW.Functions.Notify("You don't have empty glass", "error")
                                end
                            
                            end, 'mcd-glass')
                       
                        end
                    end
                end

                if shakeFilling2 < 20 then
                    inRange = true
                    if shakeFilling2 < 1 then
                        
                        DrawText3Ds(Config.Locations["shakefill2"].x, Config.Locations["shakefill2"].y, Config.Locations["shakefill2"].z, "[E] Fill Ice tea | [N] Fill Iced Latte")

                        if IsControlJustReleased(0, Keys["E"]) then
                            
                            CTRPFW.Functions.TriggerCallback('CTRPFW:HasItem', function(result)
                                if result then
                                    iceFilling()
                                else
                                    CTRPFW.Functions.Notify("You don't have empty glass", "error")
                                end
                            
                            end, 'mcd-glass')

                        elseif IsControlJustReleased(0, Keys["N"]) then

                            CTRPFW.Functions.TriggerCallback('CTRPFW:HasItem', function(result)
                                if result then
                                    icedFilling()
                                else
                                    CTRPFW.Functions.Notify("You don't have empty glass", "error")
                                end
                            
                            end, 'mcd-glass')
                           
                        end
                    end
                end

                if Hotfilling < 20 then
                    inRange = true
                    if Hotfilling < 1 then
                        
                        DrawText3Ds(Config.Locations["hotfill"].x, Config.Locations["hotfill"].y, Config.Locations["hotfill"].z, "[E] Fill Cappuccino | [N] Fill Hot Chocolate | [F] Fill Caramel Latte")

                        if IsControlJustReleased(0, Keys["E"]) then
                            
                            CTRPFW.Functions.TriggerCallback('CTRPFW:HasItem', function(result)
                                if result then
                                    cappuccinoFilling()
                                else
                                    CTRPFW.Functions.Notify("You don't have empty cup", "error")
                                end
                            
                            end, 'mcd-cup')

                        elseif IsControlJustReleased(0, Keys["N"]) then

                            CTRPFW.Functions.TriggerCallback('CTRPFW:HasItem', function(result)
                                if result then
                                    ChocolateFilling()
                                else
                                    CTRPFW.Functions.Notify("You don't have empty cup", "error")
                                end
                            
                            end, 'mcd-cup')

                        elseif IsControlJustReleased(0, Keys["F"]) then

                            CTRPFW.Functions.TriggerCallback('CTRPFW:HasItem', function(result)
                                if result then
                                    CaramelFilling()
                                else
                                    CTRPFW.Functions.Notify("You don't have empty cup", "error")
                                end
                            
                            end, 'mcd-cup')
                                 
                        end
                    end
                end

                if onDuty then
                    if Shop < 20 then
                        inRange = true
                        
                        if Shop < 1 then
                            DrawText3Ds(Config.Locations["inShop"].x, Config.Locations["inShop"].y, Config.Locations["inShop"].z, "[E] Open Storage")
                            if IsControlJustReleased(0, Keys["E"]) then
                                TriggerServerEvent("inventory:server:OpenInventory", "shop", 'mcdshop', Config.mcdShops)
                            end
                        end
                    end
                end

                if not inRange then
                    Citizen.Wait(1500)
                end
            else
                Citizen.Wait(1500)
            end
        else
            Citizen.Wait(1500)
        end

        Citizen.Wait(3)
    end
end)

Citizen.CreateThread(function()
    while true do
        local inRange = false

        if isLoggedIn then
            local pos = GetEntityCoords(GetPlayerPed(-1))
                local publicstash = GetDistanceBetweenCoords(pos, Config.Locations["openstash"].x, Config.Locations["openstash"].y, Config.Locations["openstash"].z, true)
                local publicstash2 = GetDistanceBetweenCoords(pos, Config.Locations["openstash2"].x, Config.Locations["openstash2"].y, Config.Locations["openstash2"].z, true)
                local publicstash3 = GetDistanceBetweenCoords(pos, Config.Locations["openstash3"].x, Config.Locations["openstash3"].y, Config.Locations["openstash3"].z, true)

                if publicstash < 25 then
                    inRange = true
                    
                    if publicstash < 2 then
                        DrawText3Ds(Config.Locations["openstash"].x, Config.Locations["openstash"].y, Config.Locations["openstash"].z, "[E] Picking Order")
                        if IsControlJustReleased(0, Keys["E"]) then
                            TriggerEvent("inventory:client:SetCurrentStash", "open_mcdstash")
                            TriggerServerEvent("inventory:server:OpenInventory", "stash", "open_mcdstash", {
                                maxweight = 4000000,
                                slots = 500,
                            })
                        end
                    end
                end

                if publicstash2 < 25 then
                    inRange = true
                    
                    if publicstash2 < 2 then
                        DrawText3Ds(Config.Locations["openstash2"].x, Config.Locations["openstash2"].y, Config.Locations["openstash2"].z, "[E] Picking Order")
                        if IsControlJustReleased(0, Keys["E"]) then
                            TriggerEvent("inventory:client:SetCurrentStash", "open_mcdstash2")
                            TriggerServerEvent("inventory:server:OpenInventory", "stash", "open_mcdstash2", {
                                maxweight = 4000000,
                                slots = 500,
                            })
                        end
                    end
                end

                if publicstash3 < 25 then
                    inRange = true
                    
                    if publicstash3 < 2 then
                        DrawText3Ds(Config.Locations["openstash3"].x, Config.Locations["openstash3"].y, Config.Locations["openstash3"].z, "[E] Picking Order")
                        if IsControlJustReleased(0, Keys["E"]) then
                            TriggerEvent("inventory:client:SetCurrentStash", "open_mcdstash3")
                            TriggerServerEvent("inventory:server:OpenInventory", "stash", "open_mcdstash3", {
                                maxweight = 4000000,
                                slots = 500,
                            })
                        end
                    end
                end
                

            if not inRange then
                Citizen.Wait(1500)
            end

        else
            Citizen.Wait(1500)
        end

        Citizen.Wait(3)
    end
end)


function StrawberryFilling()

    TriggerServerEvent("CTRPFW:Server:RemoveItem", "mcd-glass", 1)
    TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items["mcd-glass"], "remove")
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "sodaop", 0.8)
    CTRPFW.Functions.Progressbar("empty_bottle", "Filling Strawberry Banana Smoothie ..", 8000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {
		animDict = "amb@prop_human_bum_shopping_cart@male@idle_a",
		anim = "idle_c",
		flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(GetPlayerPed(-1), "amb@prop_human_bum_shopping_cart@male@idle_a", "idle_c", 1.0)
        TriggerServerEvent("CTRPFW:Server:AddItem", "mcd-strawberry", 1)
        TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items["mcd-strawberry"], "add")
    end, function() -- Cancel
        StopAnimTask(GetPlayerPed(-1), "amb@prop_human_bum_shopping_cart@male@idle_a", "idle_c", 1.0)
        CTRPFW.Functions.Notify("Fail", "error")
    end)
end

function MangoFilling()

    TriggerServerEvent("CTRPFW:Server:RemoveItem", "mcd-glass", 1)
    TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items["mcd-glass"], "remove")
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "sodaop", 0.8)
    CTRPFW.Functions.Progressbar("empty_bottle", "Filling Mango Pineapple Smoothie ..", 8000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {
		animDict = "amb@prop_human_bum_shopping_cart@male@idle_a",
		anim = "idle_c",
		flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(GetPlayerPed(-1), "amb@prop_human_bum_shopping_cart@male@idle_a", "idle_c", 1.0)
        TriggerServerEvent("CTRPFW:Server:AddItem", "mcd-mango", 1)
        TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items["mcd-mango"], "add")
    end, function() -- Cancel
        StopAnimTask(GetPlayerPed(-1), "amb@prop_human_bum_shopping_cart@male@idle_a", "idle_c", 1.0)
        CTRPFW.Functions.Notify("Fail", "error")
    end)
end

function iceFilling()

    TriggerServerEvent("CTRPFW:Server:RemoveItem", "mcd-glass", 1)
    TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items["mcd-glass"], "remove")
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "sodaop", 0.8)
    CTRPFW.Functions.Progressbar("empty_bottle", "Filling Ice tea ..", 8000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {
		animDict = "amb@prop_human_bum_shopping_cart@male@idle_a",
		anim = "idle_c",
		flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(GetPlayerPed(-1), "amb@prop_human_bum_shopping_cart@male@idle_a", "idle_c", 1.0)
        TriggerServerEvent("CTRPFW:Server:AddItem", "mcd-icetea", 1)
        TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items["mcd-icetea"], "add")
    end, function() -- Cancel
        StopAnimTask(GetPlayerPed(-1), "amb@prop_human_bum_shopping_cart@male@idle_a", "idle_c", 1.0)
        CTRPFW.Functions.Notify("Fail", "error")
    end)
end

function icedFilling()

    TriggerServerEvent("CTRPFW:Server:RemoveItem", "mcd-glass", 1)
    TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items["mcd-glass"], "remove")
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "sodaop", 0.8)
    CTRPFW.Functions.Progressbar("empty_bottle", "Filling Iced Latte ..", 8000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {
		animDict = "amb@prop_human_bum_shopping_cart@male@idle_a",
		anim = "idle_c",
		flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(GetPlayerPed(-1), "amb@prop_human_bum_shopping_cart@male@idle_a", "idle_c", 1.0)
        TriggerServerEvent("CTRPFW:Server:AddItem", "mcd-iced", 1)
        TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items["mcd-iced"], "add")
    end, function() -- Cancel
        StopAnimTask(GetPlayerPed(-1), "amb@prop_human_bum_shopping_cart@male@idle_a", "idle_c", 1.0)
        CTRPFW.Functions.Notify("Fail", "error")
    end)
end


function cappuccinoFilling()

    TriggerServerEvent("CTRPFW:Server:RemoveItem", "mcd-cup", 1)
    TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items["mcd-cup"], "remove")
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "cmaking", 0.8)
    CTRPFW.Functions.Progressbar("empty_bottle", "Filling Cappuccino ..", 10000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {
		animDict = "amb@prop_human_bum_shopping_cart@male@idle_a",
		anim = "idle_c",
		flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(GetPlayerPed(-1), "amb@prop_human_bum_shopping_cart@male@idle_a", "idle_c", 1.0)
        TriggerServerEvent("CTRPFW:Server:AddItem", "mcd-cappuccino", 1)
        TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items["mcd-cappuccino"], "add")
    end, function() -- Cancel
        StopAnimTask(GetPlayerPed(-1), "amb@prop_human_bum_shopping_cart@male@idle_a", "idle_c", 1.0)
        CTRPFW.Functions.Notify("Fail", "error")
    end)
end

function ChocolateFilling()

    TriggerServerEvent("CTRPFW:Server:RemoveItem", "mcd-cup", 1)
    TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items["mcd-cup"], "remove")
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "cmaking", 0.8)
    CTRPFW.Functions.Progressbar("empty_bottle", "Filling Hot Chocolate ..", 10000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {
		animDict = "amb@prop_human_bum_shopping_cart@male@idle_a",
		anim = "idle_c",
		flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(GetPlayerPed(-1), "amb@prop_human_bum_shopping_cart@male@idle_a", "idle_c", 1.0)
        TriggerServerEvent("CTRPFW:Server:AddItem", "mcd-hchocolate", 1)
        TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items["mcd-hchocolate"], "add")
    end, function() -- Cancel
        StopAnimTask(GetPlayerPed(-1), "amb@prop_human_bum_shopping_cart@male@idle_a", "idle_c", 1.0)
        CTRPFW.Functions.Notify("Fail", "error")
    end)
end

function CaramelFilling()

    TriggerServerEvent("CTRPFW:Server:RemoveItem", "mcd-cup", 1)
    TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items["mcd-cup"], "remove")
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "cmaking", 0.8)
    CTRPFW.Functions.Progressbar("empty_bottle", "Filling Caramel Latte ..", 10000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {
		animDict = "amb@prop_human_bum_shopping_cart@male@idle_a",
		anim = "idle_c",
		flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(GetPlayerPed(-1), "amb@prop_human_bum_shopping_cart@male@idle_a", "idle_c", 1.0)
        TriggerServerEvent("CTRPFW:Server:AddItem", "mcd-caramel", 1)
        TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items["mcd-caramel"], "add")
    end, function() -- Cancel
        StopAnimTask(GetPlayerPed(-1), "amb@prop_human_bum_shopping_cart@male@idle_a", "idle_c", 1.0)
        CTRPFW.Functions.Notify("Fail", "error")
    end)
end

function niks()
    print('niks')
end

function OpenMenu()
    ClearMenu()
    Menu.addButton("Options", "VehicleOptions", nil)
    Menu.addButton("Close Menu", "CloseMenu", nil) 
end

function VehicleList()
    ClearMenu()
    for k, v in pairs(Config.Vehicles) do
        Menu.addButton(v, "SpawnListVehicle", k) 
    end
    Menu.addButton("Close Menu", "CloseMenu", nil) 
end

function SpawnListVehicle(model)
    local coords = {
        x = Config.Locations["vehicle"].x,
        y = Config.Locations["vehicle"].y,
        z = Config.Locations["vehicle"].z,
        h = Config.Locations["vehicle"].h,
    }
    local plate = "AC"..math.random(1111, 9999)
    CTRPFW.Functions.SpawnVehicle(model, function(veh)
        SetVehicleNumberPlateText(veh, "ACBV"..tostring(math.random(1000, 9999)))
        SetEntityHeading(veh, coords.h)
        exports['LegacyFuel']:SetFuel(veh, 100.0)
        Menu.hidden = true
        TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
        SetVehicleEngineOn(veh, true, true)
    end, coords, true)
end

-- Menu Functions

CloseMenu = function()
    Menu.hidden = true
    currentGarage = nil
    ClearMenu()
end

ClearMenu = function()
	--Menu = {}
	Menu.GUI = {}
	Menu.buttonCount = 0
	Menu.selection = 0
end

function noSpace(str)
    local normalisedString = string.gsub(str, "%s+", "")
    return normalisedString
end