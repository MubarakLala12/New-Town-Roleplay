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

local inRadialMenu = false

function setupSubItems()
    CTRPFW.Functions.GetPlayerData(function(PlayerData)
        if PlayerData.metadata["isdead"] then
            if PlayerData.job.name == "police" or PlayerData.job.name == "doctor"  then
                Config.MenuItems[4].items = {
                    [1] = {
                        id = 'emergencybutton2',
                        title = 'Emergencybutton',
                        icon = '#general',
                        type = 'client',
                        event = 'police:client:SendPoliceEmergencyAlert',
                        shouldClose = true,
                    },
                }
            end
        else
            if Config.JobInteractions[PlayerData.job.name] ~= nil and next(Config.JobInteractions[PlayerData.job.name]) ~= nil then
                Config.MenuItems[4].items = Config.JobInteractions[PlayerData.job.name]
            else
                Config.MenuItems[4].items = {}
            end
        end
    end)

    local Vehicle = GetVehiclePedIsIn(GetPlayerPed(-1))

    if Vehicle ~= nil or Vehicle ~= 0 then
        local AmountOfSeats = GetVehicleModelNumberOfSeats(GetEntityModel(Vehicle))

        if AmountOfSeats == 2 then
            Config.MenuItems[3].items[3].items = {
                [1] = {
                    id    = -1,
                    title = 'Driver',
                    icon = '#vehicleseat',
                    type = 'client',
                    event = 'ctrp-radialmenu:client:ChangeSeat',
                    shouldClose = false,
                },
                [2] = {
                    id    = 0,
                    title = 'Passenger',
                    icon = '#vehicleseat',
                    type = 'client',
                    event = 'ctrp-radialmenu:client:ChangeSeat',
                    shouldClose = false,
                },
            }
        elseif AmountOfSeats == 3 then
            Config.MenuItems[3].items[3].items = {
                [4] = {
                    id    = -1,
                    title = 'Driver',
                    icon = '#vehicleseat',
                    type = 'client',
                    event = 'ctrp-radialmenu:client:ChangeSeat',
                    shouldClose = false,
                },
                [1] = {
                    id    = 0,
                    title = 'Passenger',
                    icon = '#vehicleseat',
                    type = 'client',
                    event = 'ctrp-radialmenu:client:ChangeSeat',
                    shouldClose = false,
                },
                [3] = {
                    id    = 1,
                    title = 'Others',
                    icon = '#vehicleseat',
                    type = 'client',
                    event = 'ctrp-radialmenu:client:ChangeSeat',
                    shouldClose = false,
                },
            }
        elseif AmountOfSeats == 4 then
            Config.MenuItems[3].items[3].items = {
                [4] = {
                    id    = -1,
                    title = 'Driver',
                    icon = '#vehicleseat',
                    type = 'client',
                    event = 'ctrp-radialmenu:client:ChangeSeat',
                    shouldClose = false,
                },
                [1] = {
                    id    = 0,
                    title = 'Passenger',
                    icon = '#vehicleseat',
                    type = 'client',
                    event = 'ctrp-radialmenu:client:ChangeSeat',
                    shouldClose = false,
                },
                [3] = {
                    id    = 1,
                    title = 'Rear seat left',
                    icon = '#vehicleseat',
                    type = 'client',
                    event = 'ctrp-radialmenu:client:ChangeSeat',
                    shouldClose = false,
                },
                [2] = {
                    id    = 2,
                    title = 'Rear seat right',
                    icon = '#vehicleseat',
                    type = 'client',
                    event = 'ctrp-radialmenu:client:ChangeSeat',
                    shouldClose = false,
                },
            }
        end
    end
end

function openRadial(bool)
    setupSubItems()

    SetNuiFocus(bool, bool)
    SendNUIMessage({
        action = "ui",
        radial = bool,
        items = Config.MenuItems
    })
    inRadialMenu = bool
end

function closeRadial(bool)
    SetNuiFocus(false, false)
    inRadialMenu = bool
end

function getNearestVeh()
    local pos = GetEntityCoords(GetPlayerPed(-1))
    local entityWorld = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0.0, 20.0, 0.0)

    local rayHandle = CastRayPointToPoint(pos.x, pos.y, pos.z, entityWorld.x, entityWorld.y, entityWorld.z, 10, GetPlayerPed(-1), 0)
    local _, _, _, _, vehicleHandle = GetRaycastResult(rayHandle)
    return vehicleHandle
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(3)

        if IsControlJustPressed(0, Keys["F1"]) then
            openRadial(true)
            SetCursorLocation(0.5, 0.5)
        end
    end
end)

RegisterNUICallback('closeRadial', function()
    closeRadial(false)
end)

RegisterNUICallback('selectItem', function(data)
    local itemData = data.itemData
    if itemData.type == 'client' then
        TriggerEvent(itemData.event, itemData)
    elseif itemData.type == 'server' then
        TriggerServerEvent(itemData.event, itemData)
    end
end)

RegisterNetEvent('ctrp-radialmenu:client:noPlayers')
AddEventHandler('ctrp-radialmenu:client:noPlayers', function(data)
    CTRPFW.Functions.Notify('There arrent any people close', 'error', 2500)
end)

RegisterNetEvent('ctrp-radialmenu:client:giveidkaart')
AddEventHandler('ctrp-radialmenu:client:giveidkaart', function(data)
    print('Im a trigerd event :)')
end)

RegisterNetEvent('ctrp-radialmenu:client:openDoor')
AddEventHandler('ctrp-radialmenu:client:openDoor', function(data)
    local string = data.id
    local replace = string:gsub("door", "")
    local door = tonumber(replace)
    local ped = GetPlayerPed(-1)
    local closestVehicle = nil

    if IsPedInAnyVehicle(ped, false) then
        closestVehicle = GetVehiclePedIsIn(ped)
    else
        closestVehicle = getNearestVeh()
    end

    if closestVehicle ~= 0 then
        if closestVehicle ~= GetVehiclePedIsIn(ped) then
            local plate = GetVehicleNumberPlateText(closestVehicle)
            if GetVehicleDoorAngleRatio(closestVehicle, door) > 0.0 then
                if not IsVehicleSeatFree(closestVehicle, -1) then
                    TriggerServerEvent('ctrp-radialmenu:trunk:server:Door', false, plate, door)
                else
                    SetVehicleDoorShut(closestVehicle, door, false)
                end
            else
                if not IsVehicleSeatFree(closestVehicle, -1) then
                    TriggerServerEvent('ctrp-radialmenu:trunk:server:Door', true, plate, door)
                else
                    SetVehicleDoorOpen(closestVehicle, door, false, false)
                end
            end
        else
            if GetVehicleDoorAngleRatio(closestVehicle, door) > 0.0 then
                SetVehicleDoorShut(closestVehicle, door, false)
            else
                SetVehicleDoorOpen(closestVehicle, door, false, false)
            end
        end
    else
        CTRPFW.Functions.Notify('There is no vehicle in sight...', 'error', 2500)
    end
end)

RegisterNetEvent('ctrp-radialmenu:client:setExtra')
AddEventHandler('ctrp-radialmenu:client:setExtra', function(data)
    local string = data.id
    local replace = string:gsub("extra", "")
    local extra = tonumber(replace)
    local ped = GetPlayerPed(-1)
    local veh = GetVehiclePedIsIn(ped)
    local enginehealth = 1000.0
    local bodydamage = 1000.0

    if veh ~= nil then
        local plate = GetVehicleNumberPlateText(closestVehicle)

        if GetPedInVehicleSeat(veh, -1) == GetPlayerPed(-1) then
            if DoesExtraExist(veh, extra) then
                if IsVehicleExtraTurnedOn(veh, extra) then
                    enginehealth = GetVehicleEngineHealth(veh)
                    bodydamage = GetVehicleBodyHealth(veh)
                    SetVehicleExtra(veh, extra, 1)
                    SetVehicleEngineHealth(veh, enginehealth)
                    SetVehicleBodyHealth(veh, bodydamage)
                    CTRPFW.Functions.Notify('Extra ' .. extra .. ' Deactivated', 'error', 2500)
                else
                    enginehealth = GetVehicleEngineHealth(veh)
                    bodydamage = GetVehicleBodyHealth(veh)
                    SetVehicleExtra(veh, extra, 0)
                    SetVehicleEngineHealth(veh, enginehealth)
                    SetVehicleBodyHealth(veh, bodydamage)
                    CTRPFW.Functions.Notify('Extra ' .. extra .. ' Activated', 'success', 2500)
                end
            else
                CTRPFW.Functions.Notify('Extra ' .. extra .. ' Its not present on this vehicle ', 'error', 2500)
            end
        else
            CTRPFW.Functions.Notify('Your not a driver of a vehicle !', 'error', 2500)
        end
    end
end)

RegisterNetEvent('ctrp-radialmenu:trunk:client:Door')
AddEventHandler('ctrp-radialmenu:trunk:client:Door', function(plate, door, open)
    local veh = GetVehiclePedIsIn(GetPlayerPed(-1))

    if veh ~= 0 then
        local pl = GetVehicleNumberPlateText(veh)

        if pl == plate then
            if open then
                SetVehicleDoorOpen(veh, door, false, false)
            else
                SetVehicleDoorShut(veh, door, false)
            end
        end
    end
end)

local Seats = {
    ["-1"] = "Driver's seat",
    ["0"] = "Passenger's seat",
    ["1"] = "Rear seat Left",
    ["2"] = "Rear seat Right",
}

RegisterNetEvent('ctrp-radialmenu:client:ChangeSeat')
AddEventHandler('ctrp-radialmenu:client:ChangeSeat', function(data)
    local Veh = GetVehiclePedIsIn(GetPlayerPed(-1))
    local IsSeatFree = IsVehicleSeatFree(Veh, data.id)
    local speed = GetEntitySpeed(Veh)
    local HasHarnass = exports['ctrp-smallresources']:HasHarness()
    if not HasHarnass then
        local kmh = (speed * 3.6);

        if IsSeatFree then
            if kmh <= 100.0 then
                SetPedIntoVehicle(GetPlayerPed(-1), Veh, data.id)
                CTRPFW.Functions.Notify('Your now on the  '..data.title..'!')
            else
                CTRPFW.Functions.Notify('The vehicle goes to fast..')
            end
        else
            CTRPFW.Functions.Notify('This seat is occupied..')
        end
    else
        CTRPFW.Functions.Notify('You have a race armor on u cant switch..', 'error')
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

local First = vector3(0.0, 0.0, 0.0)
local Second = vector3(5.0, 5.0, 5.0)

RegisterNetEvent('ctrp-radialmenu:client:flip:vehicle')
AddEventHandler('ctrp-radialmenu:client:flip:vehicle', function()
    local ped = PlayerPedId()
    local posped = GetEntityCoords(ped)
    local entityWorld = GetOffsetFromEntityInWorldCoords(ped, 0.0, 20.0, 0.0)
    local rayHandle = CastRayPointToPoint(posped.x, posped.y, posped.z, entityWorld.x, entityWorld.y, entityWorld.z, 10, ped, 0)
    local a, b, c, d, closestVehicle = GetRaycastResult(rayHandle)
    local Distance = GetDistanceBetweenCoords(c.x, c.y, c.z, posped.x, posped.y, posped.z, false);
    local vehicleCoords = GetEntityCoords(closestVehicle)
    local dimension = GetModelDimensions(GetEntityModel(closestVehicle), First, Second)
    if Distance < 6.0  and not IsPedInAnyVehicle(ped, false) then
        if GetDistanceBetweenCoords(GetEntityCoords(closestVehicle) + GetEntityForwardVector(closestVehicle), GetEntityCoords(ped), true) > GetDistanceBetweenCoords(GetEntityCoords(closestVehicle) + GetEntityForwardVector(closestVehicle) * -1, GetEntityCoords(ped), true) then
            -- if IsVehicleOnAllWheels(closestVehicle) then
                NetworkRequestControlOfEntity(closestVehicle)
                local coords = GetEntityCoords(ped)
                FreezeEntityPosition(ped, true)
                RequestAnimDict(dict)
                TaskPlayAnim(ped, dict, anim, 2.0, -8.0, -1, 35, 0, 0, 0, 0)
                CTRPFW.Functions.Progressbar("flipping", "Flipping vehicle..", math.random(10000, 15000), false, true, {
                    disableMovement = false,
                    disableCarMovement = false,
                    disableMouse = false,
                    disableCombat = true,
                }, {}, {}, {}, function() -- Done
                    isvehrotated = false
                    SetVehicleOnGroundProperly(closestVehicle)
                    DetachEntity(ped, false, false)
                    StopAnimTask(ped, dict, anim, 2.0)
                    FreezeEntityPosition(ped, false)
                end, function()
                    CTRPFW.Functions.Notify("Canceled..", "error")
                    DetachEntity(ped, false, false)
                    StopAnimTask(ped, dict, anim, 2.0)
                    FreezeEntityPosition(ped, false)
                end)
            -- else
            --     CTRPFW.Functions.Notify("not flipped", "error")
            -- end
        else
            CTRPFW.Functions.Notify("No vehicle / Vehicle not flipped", "error")
        end
    end
end)

