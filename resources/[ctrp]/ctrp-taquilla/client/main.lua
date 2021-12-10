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

     {title="Tequi-La-La", colour=5, id=93, x = -560.18, y = 286.62, z = 82.18},
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
            if PlayerData.job.name == "taq" then
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
            if PlayerJob.name == "taq" then
                local pos = GetEntityCoords(GetPlayerPed(-1))
                local StashDistance = GetDistanceBetweenCoords(pos, Config.Locations["stash"].x, Config.Locations["stash"].y, Config.Locations["stash"].z, true)
                local OnDutyDistance = GetDistanceBetweenCoords(pos, Config.Locations["duty"].x, Config.Locations["duty"].y, Config.Locations["duty"].z, true)
                local VehicleDistance = GetDistanceBetweenCoords(pos, Config.Locations["vehicle"].x, Config.Locations["vehicle"].y, Config.Locations["vehicle"].z, true)

                local BeerFilling = GetDistanceBetweenCoords(pos, Config.Locations["beerfill"].x, Config.Locations["beerfill"].y, Config.Locations["beerfill"].z, true)
                local Storages = GetDistanceBetweenCoords(pos, Config.Locations["storage"].x, Config.Locations["storage"].y, Config.Locations["storage"].z, true)

                if onDuty then
                    if StashDistance < 20 then
                        inRange = true
                        DrawMarker(2, Config.Locations["stash"].x, Config.Locations["stash"].y, Config.Locations["stash"].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)

                        if StashDistance < 1 then
                            DrawText3Ds(Config.Locations["stash"].x, Config.Locations["stash"].y, Config.Locations["stash"].z, "[E] Open Stash")
                            if IsControlJustReleased(0, Keys["E"]) then
                                TriggerEvent("inventory:client:SetCurrentStash", "taqstash")
                                TriggerServerEvent("inventory:server:OpenInventory", "stash", "taqstash", {
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
                
                if BeerFilling < 20 then
                    inRange = true
                    if BeerFilling < 1 then
                        
                        DrawText3Ds(Config.Locations["beerfill"].x, Config.Locations["beerfill"].y, Config.Locations["beerfill"].z, "[E] Fill Beer Bottle")

                        if IsControlJustReleased(0, Keys["E"]) then
                            
                            CTRPFW.Functions.TriggerCallback('CTRPFW:HasItem', function(result)
                                if result then
                                    beerFilling()
                                else
                                    CTRPFW.Functions.Notify("You don't have empty_bottle", "error")
                                end
                            
                            end, 'empty_bottle')
                            
                        end
                    end
                end

                if Storages < 20 then
                    inRange = true
                    if Storages < 1 then
                        
                        DrawText3Ds(Config.Locations["storage"].x, Config.Locations["storage"].y, Config.Locations["storage"].z, "[E] Storage")

                        if IsControlJustReleased(0, Keys["E"]) then
                            TriggerEvent('animations:client:EmoteCommandStart', {"leanbar"})
                            TriggerServerEvent("inventory:server:OpenInventory", "shop", 'taquilla', Config.taqShops)
                            Citizen.Wait(3000)
                            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                                
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

function beerFilling()

    TriggerServerEvent("CTRPFW:Server:RemoveItem", "empty_bottle", 1)
    TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items["empty_bottle"], "remove")
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "sodaop", 0.8)
    CTRPFW.Functions.Progressbar("empty_bottle", "Filling Beer in Bottle..", 8000, false, true, {
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
        TriggerServerEvent("CTRPFW:Server:AddItem", "beer", 1)
        TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items["beer"], "add")
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