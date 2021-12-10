local lastSelectedVehicleEntity
local startCountDown
local testDriveEntity
local lastPlayerCoords
local hashListLoadedOnMemory = {}
local vehcategory = nil
local inTheShop = false
local profileName
local profileMoney
local vehiclesTable = {}
local provisoryObject = {}
local rgbColorSelected = {255,255,255,}
local rgbSecondaryColorSelected = {255,255,255,}

CTRPFW = nil

Citizen.CreateThread(function ()
	while CTRPFW == nil do
		TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)
		Citizen.Wait(200)
	end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(3)
        local ped = PlayerPedId()
        local sleep = true
        for i = 1, #Config.Shops do
        local actualShop = Config.Shops[i].coords
        local dist = #(actualShop - GetEntityCoords(ped))
            if dist <= 5 then
                sleep = false
                DrawMarker(2, actualShop.x, actualShop.y, actualShop.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.25, 0.2, 0.1, 255, 0, 0, 155, 0, 0, 0, 1, 0, 0, 0)
                if dist <= 2.5 then
                    DrawText3Ds(actualShop.x, actualShop.y, actualShop.z + 0.2, '[~g~E~w~] - Browse Vehicle Shop')
                    if IsControlJustPressed(0, 38) then
                        vehcategory = Config.Shops[i].category
                        OpenVehicleShop()
                    end
                end
            end
        end
        if sleep then
            Wait(500)
        end
    end
end)


RegisterNetEvent('ctrp-testdrive.receiveInfo')
AddEventHandler('ctrp-testdrive.receiveInfo', function(bank, name)
    if name then
        profileName = name
    end
    profileMoney = bank
end)


RegisterNetEvent('ctrp-testdrive.successfulbuy')
AddEventHandler('ctrp-testdrive.successfulbuy', function(vehicleName,vehiclePlate,value)    
    SendNUIMessage(
        {
            type = "successful-buy",
            vehicleName = vehicleName,
            vehiclePlate = vehiclePlate,
            value = value
        }
    )       
    CloseNui()
end)

RegisterNetEvent('ctrp-testdrive.notify')
AddEventHandler('ctrp-testdrive.notify', function(type, message)    
    SendNUIMessage(
        {
            type = "notify",
            typenotify = type,
            message = message,
        }
    ) 
end)

RegisterNetEvent('ctrp-testdrive.vehiclesInfos')
AddEventHandler('ctrp-testdrive.vehiclesInfos', function() 
    print(vehcategory)
    for k,v in pairs(CTRPFW.Shared.Vehiclestest) do 
        if v.shop == vehcategory then
            vehiclesTable[v.category] = {}   
        end
    end 

    for k,v in pairs(CTRPFW.Shared.Vehiclestest) do
        if v.shop == vehcategory then
            provisoryObject = {
                brand = v.brand,
                name = v.name,
                price = v.price,
                model = v.model,
                qtd = 5000,
            }
            table.insert(vehiclesTable[v.category], provisoryObject)
        end
    end
end)


function OpenVehicleShop()
    inTheShop = true
    TriggerServerEvent("ctrp-testdrive.requestInfo")
    TriggerEvent('ctrp-testdrive.vehiclesInfos')
    Citizen.Wait(1000)
    SendNUIMessage(
        {
            data = vehiclesTable,
            type = "display",
            playerName = profileName,
            playerMoney = profileMoney,
            testDrive = Config.TestDrive
        }
    )
        ---- 228.35, -992.16, -99.35
    ----  223.15, -998.27, -99.0, 308.93,
    SetNuiFocus(true, true)
    RequestCollisionAtCoord(x, y, z)
    cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", 733.74, -2993.25, -38.70, 44.65, 0.00, 0.00, 60.00, false, 0)
    PointCamAtCoord(cam, 728.06, -2990.89, -39.27)
    SetCamActive(cam, true)
    RenderScriptCams(true, true, 1, true, true)
    SetFocusPosAndVel(733.74, -2994.25, -39.00, 0.0, 0.0, 0.0)
    DisplayHud(false)
    DisplayRadar(false)

    if lastSelectedVehicleEntity ~= nil then
        DeleteEntity(lastSelectedVehicleEntity)
    end
end

function updateSelectedVehicle(model)
    local hash = GetHashKey(model)

    if not HasModelLoaded(hash) then
        RequestModel(hash)
        while not HasModelLoaded(hash) do
            Citizen.Wait(10)
        end
    end

    if lastSelectedVehicleEntity ~= nil then
        DeleteEntity(lastSelectedVehicleEntity)
    end
  --  lastSelectedVehicleEntity = CreateVehicle(hash, 404.99, -949.60, -99.98, 50.117, 0, 1)
    
  lastSelectedVehicleEntity = CreateVehicle(hash, 728.06, -2990.89, -39.27, -440.65, 0, 1)


    local vehicleData = {}

    
    vehicleData.traction = GetVehicleMaxTraction(lastSelectedVehicleEntity)


    vehicleData.breaking = GetVehicleMaxBraking(lastSelectedVehicleEntity) * 0.9650553    
    if vehicleData.breaking >= 1.0 then
        vehicleData.breaking = 1.0
    end

    vehicleData.maxSpeed = GetVehicleEstimatedMaxSpeed(lastSelectedVehicleEntity) * 0.9650553
    if vehicleData.maxSpeed >= 50.0 then
        vehicleData.maxSpeed = 50.0
    end

    vehicleData.acceleration = GetVehicleAcceleration(lastSelectedVehicleEntity) * 2.6
    if  vehicleData.acceleration >= 1.0 then
        vehicleData.acceleration = 1.0
    end


    SendNUIMessage(
        {
            data = vehicleData,
            type = "updateVehicleInfos",        
        }
    )

    SetVehicleCustomPrimaryColour(lastSelectedVehicleEntity,  rgbColorSelected[1], rgbColorSelected[2], rgbColorSelected[3])
    SetVehicleCustomSecondaryColour(lastSelectedVehicleEntity,  rgbSecondaryColorSelected[1], rgbSecondaryColorSelected[2], rgbSecondaryColorSelected[3])
    SetEntityHeading(lastSelectedVehicleEntity, -440.65)
    SetVehicleDirtLevel(lastSelectedVehicleEntity)
    SetVehicleUndriveable(lastSelectedVehicleEntity, false)
    WashDecalsFromVehicle(lastSelectedVehicleEntity, 1.0)

end


function rotation(dir)
    local entityRot = GetEntityHeading(lastSelectedVehicleEntity) + dir
    SetEntityHeading(lastSelectedVehicleEntity, entityRot % 360)
end

RegisterNUICallback(
    "rotate",
    function(data, cb)
        if (data["key"] == "left") then
            rotation(2)
        else
            rotation(-2)
        end
        cb("ok")
    end
)


RegisterNUICallback(
    "SpawnVehicle",
    function(data, cb)
        updateSelectedVehicle(data.modelcar)
    end
)



RegisterNUICallback(
    "RGBVehicle",
    function(data, cb)
        if data.primary then
            rgbColorSelected = data.color
            SetVehicleCustomPrimaryColour(lastSelectedVehicleEntity, math.ceil(data.color[1]), math.ceil(data.color[2]), math.ceil(data.color[3]) )
        else
            rgbSecondaryColorSelected = data.color
            SetVehicleCustomSecondaryColour(lastSelectedVehicleEntity, math.ceil(data.color[1]), math.ceil(data.color[2]), math.ceil(data.color[3]))
        end
    end
)

RegisterNUICallback(
    "Buy",
    function(data, cb)

        local newPlate     = GeneratePlate()
        local vehicleProps = CTRPFW.Functions.GetVehicleProperties(lastSelectedVehicleEntity)
        vehicleProps.plate = newPlate

        TriggerServerEvent('ctrp-testdrive.CheckMoneyForVeh',data.modelcar, data.sale, data.name, vehicleProps)

        Wait(1500)        
        -- SendNUIMessage(
        --     {
        --         type = "updateMoney",
        --         playerMoney = profileMoney
        --     }
        -- )
    end
)


RegisterNetEvent('ctrp-testdrive.spawnVehicle')
AddEventHandler('ctrp-testdrive.spawnVehicle', function(model, plate)    
    local hash = GetHashKey(model)

    lastPlayerCoords = GetEntityCoords(PlayerPedId())
    
    if not HasModelLoaded(hash) then
        RequestModel(hash)
        while not HasModelLoaded(hash) do
            Citizen.Wait(10)
        end
    end
    
    
    local vehicleBuy = CreateVehicle(hash, -11.87, -1080.87, 25.71, 132.0, 1, 1)
    SetPedIntoVehicle(PlayerPedId(), vehicleBuy, -1)
    SetVehicleNumberPlateText(vehicleBuy, plate)
    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(vehicleBuy))
    
    SetVehicleCustomPrimaryColour(vehicleBuy,  math.ceil(rgbColorSelected[1]), math.ceil(rgbColorSelected[2]), math.ceil(rgbColorSelected[3]))
    SetVehicleCustomSecondaryColour(vehicleBuy,  math.ceil(rgbSecondaryColorSelected[1]), math.ceil(rgbSecondaryColorSelected[2]), math.ceil(rgbSecondaryColorSelected[3]))
end)




RegisterNUICallback(
    "TestDrive",
    function(data, cb)        
        if Config.TestDrive then
            CTRPFW.Functions.TriggerCallback('ctrp-testdrive.ghuu', function(HasItem, type)
                if HasItem then
                    startCountDown = true

                        local hash = GetHashKey(data.vehicleModel)

                        lastPlayerCoords = GetEntityCoords(PlayerPedId())

                        if not HasModelLoaded(hash) then
                            RequestModel(hash)
                            while not HasModelLoaded(hash) do
                                Citizen.Wait(10)
                            end
                        end
                    
                        if testDriveEntity ~= nil then
                            DeleteEntity(testDriveEntity)
                        end
                        
                        TriggerServerEvent('ctrp-testdrive.CheckMoneyForTest')

                        local serverid = GetPlayerServerId(PlayerId())

                        testDriveEntity = CreateVehicle(hash, -1260.41, -3379.09, 13.94, 330.48, 1, 1)
                        SetPedIntoVehicle(PlayerPedId(), testDriveEntity, -1)
                        SetVehicleNumberPlateText(testDriveEntity, "TC "..tostring(serverid))
                        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(testDriveEntity))
                        local timeGG = GetGameTimer()

                        
                        SetVehicleCustomPrimaryColour(testDriveEntity,  math.ceil(rgbColorSelected[1]), math.ceil(rgbColorSelected[2]), math.ceil(rgbColorSelected[3]))
                        SetVehicleCustomSecondaryColour(testDriveEntity,  math.ceil(rgbSecondaryColorSelected[1]), math.ceil(rgbSecondaryColorSelected[2]), math.ceil(rgbSecondaryColorSelected[3]))

                        CloseNui()

                        while startCountDown do
                            local countTime
                            local jaanado = false
                            Citizen.Wait(1)
                            if GetGameTimer() < timeGG+tonumber(1000*Config.TestDriveTime) then
                                local secondsLeft = GetGameTimer() - timeGG
                                jaanado = true
                                drawTxt('Test Drive Time Remaining: ' .. math.ceil(Config.TestDriveTime - secondsLeft/1000),4,0.5,0.93,0.50,255,255,255,180)
                                TriggerEvent('vehiclekeys:client:allowed', jaanado)
                            else
                                DeleteEntity(testDriveEntity)
                                SetEntityCoords(PlayerPedId(), lastPlayerCoords)
                                startCountDown = false
                                jaanado = false
                                TriggerEvent('vehiclekeys:client:notallowed', jaanado)
                            end
                        end   
                        
                else
                    CTRPFW.Functions.Notify("You don't have enough money", "error")
                    CloseNui() 

                end    
            end)
        end
    end
)


RegisterNUICallback(
    "menuSelected",
    function(data, cb)
        local categoryVehicles

        local playerIdx = GetPlayerFromServerId(source)
        local ped = GetPlayerPed(playerIdx)
        
        if data.menuId ~= 'all' then
            categoryVehicles = vehiclesTable[data.menuId]
        else
            SendNUIMessage(
                {
                    data = vehiclesTable,
                    type = "display",
                    playerName = GetPlayerName(ped)
                }
            )
            return
        end

        SendNUIMessage(
            {
                data = categoryVehicles,
                type = "menu"
            }
        )
    end
)


RegisterNUICallback(
    "Close",
    function(data, cb)
        CloseNui()       
    end
)

function CloseNui()
    SendNUIMessage(
        {
            type = "hide"
        }
    )
    SetNuiFocus(false, false)
    if inTheShop then
        if lastSelectedVehicleEntity ~= nil then
            DeleteVehicle(lastSelectedVehicleEntity)
        end
        RenderScriptCams(false)
        DestroyAllCams(true)
        SetFocusEntity(GetPlayerPed(PlayerId())) 
        DisplayHud(true)
        DisplayRadar(true)
    end
    inTheShop = false
    vehiclesTable = {}
    provisoryObject = {}
end

function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.35, 0.35)
    SetTextFont(1)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
end
-----------------------------------------------------------------------------------------------------------------------------------------
function drawTxt(text,font,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextScale(scale,scale)
	SetTextColour(r,g,b,a)
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x,y)
end


-- local blip 

-- Create Blips
-- Citizen.CreateThread(function ()

--     for i = 1, #Config.Blip do    
--         local actualShop = Config.Blip[i]
--         blip = AddBlipForCoord(actualShop.x, actualShop.y, actualShop.z)

--         SetBlipSprite (blip, 326)
--         SetBlipDisplay(blip, 4)
--         SetBlipScale  (blip, 0.8)
--         SetBlipAsShortRange(blip, true)

--         BeginTextCommandSetBlipName("STRING")
--         AddTextComponentString('Car Dealer')
--         EndTextCommandSetBlipName(blip)
--     end
-- end)

AddEventHandler(
    "onResourceStop",
    function(resourceName)
        if resourceName == GetCurrentResourceName() then
           CloseNui()
           RemoveBlip(blip)
        end
    end
)
