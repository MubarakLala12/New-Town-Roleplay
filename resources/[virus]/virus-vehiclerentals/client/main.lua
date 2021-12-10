Keys = {
    ['ESC'] = 322, ['F1'] = 288, ['F2'] = 289, ['F3'] = 170, ['F5'] = 166, ['F6'] = 167, ['F7'] = 168, ['F8'] = 169, ['F9'] = 56, ['F10'] = 57,
    ['~'] = 243, ['1'] = 157, ['2'] = 158, ['3'] = 160, ['4'] = 164, ['5'] = 165, ['6'] = 159, ['7'] = 161, ['8'] = 162, ['9'] = 163, ['-'] = 84, ['='] = 83, ['BACKSPACE'] = 177,
    ['TAB'] = 37, ['Q'] = 44, ['W'] = 32, ['E'] = 38, ['R'] = 45, ['T'] = 245, ['Y'] = 246, ['U'] = 303, ['P'] = 199, ['['] = 39, [']'] = 40, ['ENTER'] = 18,
    ['CAPS'] = 137, ['A'] = 34, ['S'] = 8, ['D'] = 9, ['F'] = 23, ['G'] = 47, ['H'] = 74, ['K'] = 311, ['L'] = 182,
    ['LEFTSHIFT'] = 21, ['Z'] = 20, ['X'] = 73, ['C'] = 26, ['V'] = 0, ['B'] = 29, ['N'] = 249, ['M'] = 244, [','] = 82, ['.'] = 81,
    ['LEFTCTRL'] = 36, ['LEFTALT'] = 19, ['SPACE'] = 22, ['RIGHTCTRL'] = 70,
    ['HOME'] = 213, ['PAGEUP'] = 10, ['PAGEDOWN'] = 11, ['DELETE'] = 178,
    ['LEFT'] = 174, ['RIGHT'] = 175, ['TOP'] = 27, ['DOWN'] = 173,
}

CTRPFW = nil

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        if CTRPFW == nil then
            TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)
            Citizen.Wait(200)
        end
    end
end)

-- Code

local isLoggedIn = false
local RentedVehiclePlate = nil
local CurrentRentalPoint = nil
local RentedVehicleData = nil

RegisterNetEvent('CTRPFW:Client:OnPlayerLoaded')
AddEventHandler('CTRPFW:Client:OnPlayerLoaded', function()
    isLoggedIn = true
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

Citizen.CreateThread(function()
    while true do
        local inRange = false
        local ped = GetPlayerPed(-1)
        local pos = GetEntityCoords(ped)

        if isLoggedIn then
            for k, v in pairs(Config.RentalPoint) do
                local dist = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.RentalPoint[k]["coords"][1]["x"], Config.RentalPoint[k]["coords"][1]["y"], Config.RentalPoint[k]["coords"][1]["z"])

                if dist < 15 then
                    inRange = true
                    DrawMarker(38, Config.RentalPoint[k]["coords"][1]["x"], Config.RentalPoint[k]["coords"][1]["y"], Config.RentalPoint[k]["coords"][1]["z"], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.6, 0.6, 0.4, 255, 255, 255, 255, 0, 0, 0, 1, 0, 0, 0)

                    if dist < 1 then
                        DrawText3Ds(Config.RentalPoint[k]["coords"][1]["x"], Config.RentalPoint[k]["coords"][1]["y"], Config.RentalPoint[k]["coords"][1]["z"] + 0.35, '~g~E~w~ - To rent bicycle')
                        if IsControlJustPressed(0, Keys["E"]) then
                            RentalMenu()
                            Menu.hidden = not Menu.hidden
                            CurrentRentalPoint = k
                        end
                        Menu.renderGUI()
                    end

                    if dist > 1.5 then
                        CloseMenu()
                    end
                end
            end

            for k, v in pairs(Config.DeliveryPoint) do
                local dist = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.DeliveryPoint[k]["coords"]["x"], Config.DeliveryPoint[k]["coords"]["y"], Config.DeliveryPoint[k]["coords"]["z"])

                if dist < 15 then
                    inRange = true
                    DrawMarker(38, Config.DeliveryPoint[k]["coords"]["x"], Config.DeliveryPoint[k]["coords"]["y"], Config.DeliveryPoint[k]["coords"]["z"], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 155, 22, 22, 255, 0, 0, 0, 1, 0, 0, 0)

                    if dist < 1 then
                        DrawText3Ds(Config.DeliveryPoint[k]["coords"]["x"], Config.DeliveryPoint[k]["coords"]["y"], Config.DeliveryPoint[k]["coords"]["z"] + 0.35, '~g~E~w~ - Return bicycle')
                        if IsControlJustPressed(0, Keys["E"]) then
                            ReturnVehicle()
                            Menu.hidden = not Menu.hidden
                            CurrentRentalPoint = k
                        end
                        Menu.renderGUI()
                    end

                    if dist > 1.5 then
                        CloseMenu()
                    end
                end
            end
        end

        if not inRange then
            Citizen.Wait(1500)
        end

        Citizen.Wait(3)
    end
end)

Citizen.CreateThread(function()
    for k, v in pairs(Config.RentalPoint) do
        RentalPoint = AddBlipForCoord(v["coords"][1]["x"], v["coords"][1]["y"], v["coords"][1]["z"])

        SetBlipSprite (RentalPoint, 559)
        SetBlipDisplay(RentalPoint, 4)
        SetBlipScale  (RentalPoint, 0.80)
        SetBlipAsShortRange(RentalPoint, true)
        SetBlipColour(RentalPoint, 3)

        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName("Bicycle Rental")
        EndTextCommandSetBlipName(RentalPoint)
    end

    -- for k, v in pairs(Config.DeliveryPoint) do
    --     DeliveryPoint = AddBlipForCoord(v["coords"]["x"], v["coords"]["y"], v["coords"]["z"])

    --     SetBlipSprite (DeliveryPoint, 357)
    --     SetBlipDisplay(DeliveryPoint, 4)
    --     SetBlipScale  (DeliveryPoint, 0.55)
    --     SetBlipAsShortRange(DeliveryPoint, true)
    --     SetBlipColour(DeliveryPoint, 0)

    --     BeginTextCommandSetBlipName("STRING")
    --     AddTextComponentSubstringPlayerName("Bicycle Return")
    --     EndTextCommandSetBlipName(DeliveryPoint)
    -- end
end)

-- Menu's

RentVehicleMenu = function()
    ClearMenu()
    for k, v in pairs(Config.RentalVehicle) do
        Menu.addButton(Config.RentalVehicle[k]["label"].." - Deposit Costs: $"..Config.RentalVehicle[k]["price"], "RentVehicle", k)
    end
    Menu.addButton("Back", "RentalMenu", nil)
end

RentVehicle = function(selectedVehicle)
    local ped = GetPlayerPed(-1)

    if IsPedInAnyVehicle(ped) then
        CTRPFW.Functions.Notify('this can only when not in a vehicle..', 'error')
        return
    end

    local vehiclePlate = "CTRP"..math.random(1, 100)
    TriggerServerEvent('virus-vehiclerentals:server:SetVehicleRented', vehiclePlate, true, Config.RentalVehicle[selectedVehicle])

    RentedVehicleData = selectedVehicle
end

RegisterNetEvent('virus-vehiclerentals:server:SpawnRentedVehicle')
AddEventHandler('virus-vehiclerentals:server:SpawnRentedVehicle', function(vehiclePlate, vehicleData)
    local ped = GetPlayerPed(-1)
    local coords = {
        x = Config.RentalPoint[CurrentRentalPoint]["coords"][2]["x"],
        y = Config.RentalPoint[CurrentRentalPoint]["coords"][2]["y"],
        z = Config.RentalPoint[CurrentRentalPoint]["coords"][2]["z"],
    }

    local isnetworked = isnetworked ~= nil and isnetworked or true

    local model = GetHashKey(vehicleData["model"])

    RequestModel(model)
    while not HasModelLoaded(model) do
        Citizen.Wait(10)
    end

    local veh = CreateVehicle(model, coords.x, coords.y, coords.z, coords.a, isnetworked, false)
    local netid = NetworkGetNetworkIdFromEntity(veh)

    SetVehicleHasBeenOwnedByPlayer(vehicle,  true)
    SetNetworkIdCanMigrate(netid, true)
    --SetEntityAsMissionEntity(veh, true, true)
    SetVehicleNeedsToBeHotwired(veh, false)
    SetVehRadioStation(veh, "OFF")

    SetVehicleNumberPlateText(veh, vehiclePlate)
    TaskWarpPedIntoVehicle(ped, veh, -1)
    exports['LegacyFuel']:SetFuel(veh, 100)
    SetVehicleEngineOn(veh, true, true)
    RentedVehiclePlate = vehiclePlate
    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))

    SetModelAsNoLongerNeeded(model)
    RentalMenu()
end)

ReturnVehicle = function()
    if RentedVehiclePlate ~= nil then
        Menu.addButton("To confirm", "AcceptReturn", nil)
        Menu.addButton("Back", "RentalMenu", nil)
        return
    end
    CTRPFW.Functions.Notify('You do not have a deposit open..', 'error')
end

AcceptReturn = function()
    local Ped = GetPlayerPed(-1)
    local CurrentVehicle = GetVehiclePedIsIn(Ped)
    local VehiclePlate = GetVehicleNumberPlateText(CurrentVehicle)
    if noSpace(VehiclePlate) ~= noSpace(RentedVehiclePlate) then
        CTRPFW.Functions.Notify('This is not a rental vehicle..', 'error')
    else
        TriggerServerEvent('virus-vehiclerentals:server:SetVehicleRented', RentedVehiclePlate, false, Config.RentalVehicle[RentedVehicleData])
        CTRPFW.Functions.DeleteVehicle(CurrentVehicle)
        RentedVehiclePlate = nil
        RentedVehicleData = nil
    end
    RentalMenu()
end

-- Menu Functions

RentalMenu = function()
    ClearMenu()
    Menu.addButton("Rent vehicle", "RentVehicleMenu", nil)
    Menu.addButton("Close Menu", "CloseMenu", nil)
end

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
