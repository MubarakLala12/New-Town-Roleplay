Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

isLoggedIn = true

isHandcuffed = false
cuffType = 1
isEscorted = false
draggerId = 0
PlayerJob = {}
onDuty = false

databankOpen = false

-- CTRPFW = nil
Citizen.CreateThread(function()
    while CTRPFW == nil do
        -- TriggerEvent("CTRPFW:GetObject", function(obj) CTRPFW = obj end)
        Citizen.Wait(200)
    end
    SetCarItemsInfo()
end)

Citizen.CreateThread(function()
    for k, station in pairs(Config.Locations["stations"]) do
        local blip = AddBlipForCoord(station.coords.x, station.coords.y, station.coords.z)
        SetBlipSprite(blip, 60)
        SetBlipAsShortRange(blip, true)
        SetBlipScale(blip, 0.8)
        SetBlipColour(blip, 29)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(station.label)
        EndTextCommandSetBlipName(blip)
    end
end)

RegisterNetEvent('CTRPFW:Client:OnJobUpdate')
AddEventHandler('CTRPFW:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
    TriggerServerEvent("police:server:UpdateBlips")
    if JobInfo.name == "police" then
        if PlayerJob.onduty then
            TriggerServerEvent("CTRPFW:ToggleDuty")
            onDuty = false
        end
    end

    if (PlayerJob ~= nil) and PlayerJob.name ~= "police" then
        if DutyBlips ~= nil then
            for k, v in pairs(DutyBlips) do
                RemoveBlip(v)
            end
        end
        DutyBlips = {}
    end
end)

RegisterNetEvent('police:client:setDuty')
AddEventHandler('police:client:setDuty', function(duty)
    if(PlayerJob.name == nil) then
        PlayerJob = CTRPFW.Functions.GetPlayerData().job
    end
    onDuty = duty
end)

RegisterNetEvent('CTRPFW:Client:OnPlayerLoaded')
AddEventHandler('CTRPFW:Client:OnPlayerLoaded', function()
    isLoggedIn = true
    PlayerJob = CTRPFW.Functions.GetPlayerData().job
    onDuty = CTRPFW.Functions.GetPlayerData().job.onduty
    isHandcuffed = false
    TriggerServerEvent("CTRPFW:Server:SetMetaData", "ishandcuffed", false)
    TriggerServerEvent("police:server:SetHandcuffStatus", false)
    TriggerServerEvent("police:server:UpdateBlips")
    TriggerServerEvent("police:server:UpdateCurrentCops")
    TriggerServerEvent("police:server:CheckBills")

    if CTRPFW.Functions.GetPlayerData().metadata["tracker"] then
        local trackerClothingData = {outfitData = {["accessory"] = { item = 13, texture = 0}}}
        TriggerEvent('ctrp-clothing:client:loadOutfit', trackerClothingData)
    else
        local trackerClothingData = {outfitData = {["accessory"]   = { item = -1, texture = 0}}}
        TriggerEvent('ctrp-clothing:client:loadOutfit', trackerClothingData)
    end

    if (PlayerJob ~= nil) and PlayerJob.name ~= "police" then
        if DutyBlips ~= nil then
            for k, v in pairs(DutyBlips) do
                RemoveBlip(v)
            end
        end
        DutyBlips = {}
    end
end)

--[[RegisterNetEvent('police:client:sendBillingMail')
AddEventHandler('police:client:sendBillingMail', function(amount)
    SetTimeout(math.random(2500, 4000), function()
        local gender = "Mr."
        if CTRPFW.Functions.GetPlayerData().charinfo.gender == 1 then
            gender = "Mrs."
        end
        local charinfo = CTRPFW.Functions.GetPlayerData().charinfo
        TriggerServerEvent('ctrp-phone:server:sendNewMail', {
            sender = "Police - CJCA",
            subject = "Debt collection",
            message = "Dear " .. gender .. " " .. charinfo.lastname .. ",<br /><br />The Central Judicial Collection Agency (CJCA) charged the fines you received from the police.<br />There is <strong>$"..amount.."</strong> withdrawn from your account.<br /><br />Kind regards,<br />Mr. I.K. Graai",
            button = {}
        })
    end)
end)]]

RegisterNetEvent('police:client:sendBillingMail')
AddEventHandler('police:client:sendBillingMail', function(amount , fname, lname)
    SetTimeout(math.random(2500, 4000), function()
        local gender = "Mr."
        if CTRPFW.Functions.GetPlayerData().charinfo.gender == 1 then
            gender = "Mrs."
        end
        local charinfo = CTRPFW.Functions.GetPlayerData().charinfo
        TriggerServerEvent('ctrp-phone:server:sendNewMail', {
            sender = "LSPD",
            subject = "Police Collection",
            message = "Dear " .. gender .. " " .. charinfo.lastname .. ",<br /><br />The Central Judicial Collection Agency (CJCA) charged the fines you received from the police.<br />There is <strong>$"..amount.."</strong> withdrawn from your account.<br /><br />Kind regards,<br />"..fname.." "..lname.." ",
            button = {}
        })
    end)
end)

RegisterNetEvent('police:client:sendBillingMail2')
AddEventHandler('police:client:sendBillingMail2', function(fid, fname, lname)
    SetTimeout(math.random(2500, 4000), function()
        local gender = "Mr."
        if CTRPFW.Functions.GetPlayerData().charinfo.gender == 1 then
            gender = "Mrs."
        end
        local charinfo = CTRPFW.Functions.GetPlayerData().charinfo
        TriggerServerEvent('ctrp-phone:server:sendNewMail', {
            sender = "Forensic Team",
            subject = "Details",
            message = "Dear " .. gender .. " " .. charinfo.firstname .." " .. charinfo.lastname .. ",<br /><br />Below are the details you asked for from the Forensic Team.<br /><br />Finger Print: <strong>"..fid.."</strong><br />Name: <strong>"..fname.." "..lname.."</strong> ",
            button = {}
        })
    end)
end)



local tabletProp = nil
RegisterNetEvent('police:client:toggleDatabank')
AddEventHandler('police:client:toggleDatabank', function()
    databankOpen = not databankOpen
    if databankOpen then
        RequestAnimDict("amb@code_human_in_bus_passenger_idles@female@tablet@base")
        while not HasAnimDictLoaded("amb@code_human_in_bus_passenger_idles@female@tablet@base") do
            Citizen.Wait(0)
        end
        local tabletModel = GetHashKey("prop_cs_tablet")
        local bone = GetPedBoneIndex(PlayerPedId(), 60309)
        RequestModel(tabletModel)
        while not HasModelLoaded(tabletModel) do
            Citizen.Wait(100)
        end
        tabletProp = CreateObject(tabletModel, 1.0, 1.0, 1.0, 1, 1, 0)
        AttachEntityToEntity(tabletProp, PlayerPedId(), bone, 0.03, 0.002, -0.0, 10.0, 160.0, 0.0, 1, 0, 0, 0, 2, 1)
        TaskPlayAnim(PlayerPedId(), "amb@code_human_in_bus_passenger_idles@female@tablet@base", "base", 3.0, 3.0, -1, 49, 0, 0, 0, 0)
        SetNuiFocus(true, true)
        SendNUIMessage({
            type = "databank",
        })
    else
        DetachEntity(tabletProp, true, true)
        DeleteObject(tabletProp)
        TaskPlayAnim(PlayerPedId(), "amb@code_human_in_bus_passenger_idles@female@tablet@base", "exit", 3.0, 3.0, -1, 49, 0, 0, 0, 0)
        SetNuiFocus(false, false)
        SendNUIMessage({
            type = "closedatabank",
        })
    end
end)


RegisterNUICallback("closeDatabank", function(data, cb)
    databankOpen = false
    DetachEntity(tabletProp, true, true)
    DeleteObject(tabletProp)
    SetNuiFocus(false, false)
    TaskPlayAnim(PlayerPedId(), "amb@code_human_in_bus_passenger_idles@female@tablet@base", "exit", 3.0, 3.0, -1, 49, 0, 0, 0, 0)
end)

RegisterNetEvent('CTRPFW:Client:OnPlayerUnload')
AddEventHandler('CTRPFW:Client:OnPlayerUnload', function()
    TriggerServerEvent('police:server:UpdateBlips')
    TriggerServerEvent("police:server:SetHandcuffStatus", false)
    TriggerServerEvent("police:server:UpdateCurrentCops")
    isLoggedIn = false
    isHandcuffed = false
    isEscorted = false
    onDuty = false
    ClearPedTasks(PlayerPedId())
    DetachEntity(PlayerPedId(), true, false)
    if DutyBlips ~= nil then
        for k, v in pairs(DutyBlips) do
            RemoveBlip(v)
        end
        DutyBlips = {}
    end
end)

local DutyBlips = {}
RegisterNetEvent('police:client:UpdateBlips')
AddEventHandler('police:client:UpdateBlips', function(players)
    if PlayerJob ~= nil and PlayerJob.name == 'police'  and onDuty then
        if DutyBlips ~= nil then
            for k, v in pairs(DutyBlips) do
                RemoveBlip(v)
            end
        end
        DutyBlips = {}
        if players ~= nil then
            for k, data in pairs(players) do
                local id = GetPlayerFromServerId(data.source)
                if NetworkIsPlayerActive(id) and GetPlayerPed(id) ~= PlayerPedId() then
                    CreateDutyBlips(id, data.label, data.job)
                end
            end
        end
	end
end)

function CreateDutyBlips(playerId, playerLabel, playerJob)
	local ped = GetPlayerPed(playerId)
	local blip = GetBlipFromEntity(ped)
	-- if not DoesBlipExist(blip) then
	-- 	blip = AddBlipForEntity(ped)
	-- 	SetBlipSprite(blip, 1)
	-- 	ShowHeadingIndicatorOnBlip(blip, true)
	-- 	SetBlipRotation(blip, math.ceil(GetEntityHeading(ped)))
    --     SetBlipShowCone(blip, true)
    --     SetBlipScale(blip, 1.0)
    --     if playerJob == "police" or playerJob == "police1" or playerJob == "police2" or playerJob == "police3" or playerJob == "police4" or playerJob == "police5" or playerJob == "police6" or playerJob == "police7" or playerJob == "police8" or playerJob == "police9" or playerJob == "police10" then
    --         SetBlipColour(blip, 38)
    --     else
    --         SetBlipColour(blip, 35)
    --     end
    --     SetBlipAsShortRange(blip, true)
    --     BeginTextCommandSetBlipName('STRING')
    --     AddTextComponentString(playerLabel)
    --     EndTextCommandSetBlipName(blip)

	-- 	table.insert(DutyBlips, blip)
	-- end
end

RegisterNetEvent('police:client:SendPoliceEmergencyAlert')
AddEventHandler('police:client:SendPoliceEmergencyAlert', function()
    local pos = GetEntityCoords(PlayerPedId())
    local s1, s2 = Citizen.InvokeNative(0x2EB41072B4C1E4C0, pos.x, pos.y, pos.z, Citizen.PointerValueInt(), Citizen.PointerValueInt())
    local street1 = GetStreetNameFromHashKey(s1)
    local street2 = GetStreetNameFromHashKey(s2)
    local streetLabel = street1
    if street2 ~= nil then 
        streetLabel = streetLabel .. " " .. street2
    end
    local alertTitle = "Assistance colleague"
    if PlayerJob.name == "doctor" then
        alertTitle = "Assistance " .. PlayerJob.label
    end

    local MyId = GetPlayerServerId(PlayerId())

    TriggerServerEvent("police:server:SendPoliceEmergencyAlert", streetLabel, pos, CTRPFW.Functions.GetPlayerData().metadata["callsign"])
    TriggerServerEvent('ctrp-policealerts:server:AddPoliceAlert', {
        timeOut = 20000,
        alertTitle = alertTitle,
        coords = {
            x = pos.x,
            y = pos.y,
            z = pos.z,
        },
        details = {
            [1] = {
                icon = '<i class="fas fa-passport"></i>',
                detail = MyId .. ' | ' .. CTRPFW.Functions.GetPlayerData().charinfo.firstname .. ' ' .. CTRPFW.Functions.GetPlayerData().charinfo.lastname,
            },
            [2] = {
                icon = '<i class="fas fa-globe-europe"></i>',
                detail = streetLabel,
            },
        },
        callSign = CTRPFW.Functions.GetPlayerData().metadata["callsign"],
    }, true)
end)

RegisterNetEvent('police:PlaySound')
AddEventHandler('police:PlaySound', function()
    PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
end)

--[[RegisterNetEvent('police:client:PoliceEmergencyAlert')
AddEventHandler('police:client:PoliceEmergencyAlert', function(callsign, streetLabel, coords)
    if PlayerData.job.name == 'police' or PlayerData.job.name == 'doctor') and onDuty) then
        local transG = 250
        local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
        SetBlipSprite(blip, 487)
        SetBlipColour(blip, 1)
        SetBlipDisplay(blip, 4)
        SetBlipAlpha(blip, transG)
        SetBlipScale(blip, 1.2)
        SetBlipFlashes(blip, true)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString("Assistance Colleague")
        EndTextCommandSetBlipName(blip)
        while transG ~= 0 do
            Wait(180 * 4)
            transG = transG - 1
            SetBlipAlpha(blip, transG)
            if transG == 0 then
                SetBlipSprite(blip, 2)
                RemoveBlip(blip)
                return
            end
        end
    end
end)]]

RegisterNetEvent('police:client:PoliceEmergencyAlert')
AddEventHandler('police:client:PoliceEmergencyAlert', function(callsign, streetLabel, coords)
    if PlayerJob.name == 'police' and onDuty then        
        local transG = 250
        local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
        SetBlipSprite(blip, 487)
        SetBlipColour(blip, 1)
        SetBlipDisplay(blip, 4)
        SetBlipAlpha(blip, transG)
        SetBlipScale(blip, 1.2)
        SetBlipFlashes(blip, true)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString("Assistance Colleague")
        EndTextCommandSetBlipName(blip)
        while transG ~= 0 do
            Wait(180 * 4)
            transG = transG - 1
            SetBlipAlpha(blip, transG)
            if transG == 0 then
                SetBlipSprite(blip, 2)
                RemoveBlip(blip)
                return
            end
        end
    end
end)

RegisterNetEvent('police:client:gunhiestalert')
AddEventHandler('police:client:gunhiestalert', function(streetLabel, coords)
    if PlayerJob.name == 'police' and onDuty then        
        local transG = 250
        local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
        SetBlipSprite(blip, 568)
        SetBlipColour(blip, 1)
        SetBlipDisplay(blip, 4)
        SetBlipAlpha(blip, transG)
        SetBlipScale(blip, 1.2)
        SetBlipFlashes(blip, true)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString("Weapon Dealing")
        EndTextCommandSetBlipName(blip)
        while transG ~= 0 do
            Wait(180 * 4)
            transG = transG - 1
            SetBlipAlpha(blip, transG)
            if transG == 0 then
                SetBlipSprite(blip, 2)
                RemoveBlip(blip)
                return
            end
        end
    end
end)

RegisterNetEvent('police:client:OverspeedCall')
AddEventHandler('police:client:OverspeedCall', function(pos, alertTitle, streetLabel, modelPlate, modelName)
    if PlayerJob.name == 'police' and onDuty then
        TriggerEvent('ctrp-policealerts:client:AddPoliceAlert', {
            timeOut = 8000,
            alertTitle = alertTitle,
            coords = {
                x = pos.x,
                y = pos.y,
                z = pos.z,
            },
            details = {
                [1] = {
                    icon = '<i class="fas fa-car"></i>',
                    detail = modelName,
                },
                [2] = {
                    icon = '<i class="fas fa-closed-captioning"></i>',
                    detail = modelPlate,
                },
                [3] = {
                    icon = '<i class="fas fa-globe-europe"></i>',
                    detail = streetLabel,
                },
            },
            callSign = CTRPFW.Functions.GetPlayerData().metadata["callsign"],
        })
        PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
        local transG = 250
        local blip = AddBlipForCoord(pos.x, pos.y, pos.z)
        SetBlipSprite(blip, 380)
        SetBlipColour(blip, 1)
        SetBlipDisplay(blip, 4)
        SetBlipAlpha(blip, transG)
        SetBlipScale(blip, 1.0)
        SetBlipAsShortRange(blip, false)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString("Alert: Vehicle Overspeed")
        EndTextCommandSetBlipName(blip)
        while transG ~= 0 do
            Wait(180 * 4)
            transG = transG - 1
            SetBlipAlpha(blip, transG)
            if transG == 0 then
                SetBlipSprite(blip, 2)
                RemoveBlip(blip)
                return
            end
        end
    end
end)

RegisterNetEvent('police:client:GunShotAlert')
AddEventHandler('police:client:GunShotAlert', function(streetLabel, isAutomatic, fromVehicle, coords, vehicleInfo)
    if PlayerJob.name == 'police' and onDuty then        
        local msg = ""
        local blipSprite = 313
        local blipText = "10-13 | Shots fired"
        local MessageDetails = {}
        if fromVehicle then
            blipText = "Shots fired from a vehicle"
            MessageDetails = {
                [1] = {
                    icon = '<i class="fas fa-car"></i>',
                    detail = vehicleInfo.name,
                },
                [2] = {
                    icon = '<i class="fas fa-closed-captioning"></i>',
                    detail = vehicleInfo.plate,
                },
                [3] = {
                    icon = '<i class="fas fa-globe-europe"></i>',
                    detail = streetLabel,
                },
            }
        else
            blipText = "10-13 | Shots fired"
            MessageDetails = {
                [1] = {
                    icon = '<i class="fas fa-globe-europe"></i>',
                    detail = streetLabel,
                },
            }
        end

        TriggerEvent('ctrp-policealerts:client:AddPoliceAlert', {
            timeOut = 2000,
            alertTitle = blipText,
            coords = {
                x = coords.x,
                y = coords.y,
                z = coords.z,
            },
            details = MessageDetails,
            callSign = CTRPFW.Functions.GetPlayerData().metadata["callsign"],
        })

        PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
        local transG = 250
        local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
        SetBlipSprite(blip, blipSprite)
        SetBlipColour(blip, 1)
        SetBlipDisplay(blip, 4)
        SetBlipAlpha(blip, transG)
        SetBlipScale(blip, 0.8)
        SetBlipAsShortRange(blip, false)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString(blipText)
        EndTextCommandSetBlipName(blip)
        while transG ~= 0 do
            Wait(180 * 4)
            transG = transG - 1
            SetBlipAlpha(blip, transG)
            if transG == 0 then
                SetBlipSprite(blip, 2)
                RemoveBlip(blip)
                return
            end
        end
    end
end)

RegisterNetEvent('police:client:VehicleCall')
AddEventHandler('police:client:VehicleCall', function(pos, alertTitle, streetLabel, modelPlate, modelName)
    if PlayerJob.name == 'police' and onDuty then
        TriggerEvent('ctrp-policealerts:client:AddPoliceAlert', {
            timeOut = 8000,
            alertTitle = alertTitle,
            coords = {
                x = pos.x,
                y = pos.y,
                z = pos.z,
            },
            details = {
                [1] = {
                    icon = '<i class="fas fa-car"></i>',
                    detail = modelName,
                },
                [2] = {
                    icon = '<i class="fas fa-closed-captioning"></i>',
                    detail = modelPlate,
                },
                [3] = {
                    icon = '<i class="fas fa-globe-europe"></i>',
                    detail = streetLabel,
                },
            },
            callSign = CTRPFW.Functions.GetPlayerData().metadata["callsign"],
        })
        PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
        local transG = 250
        local blip = AddBlipForCoord(pos.x, pos.y, pos.z)
        SetBlipSprite(blip, 380)
        SetBlipColour(blip, 1)
        SetBlipDisplay(blip, 4)
        SetBlipAlpha(blip, transG)
        SetBlipScale(blip, 1.0)
        SetBlipAsShortRange(blip, false)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString("Alert: Vehicle burglary")
        EndTextCommandSetBlipName(blip)
        while transG ~= 0 do
            Wait(180 * 4)
            transG = transG - 1
            SetBlipAlpha(blip, transG)
            if transG == 0 then
                SetBlipSprite(blip, 2)
                RemoveBlip(blip)
                return
            end
        end
    end
end)

RegisterNetEvent('police:client:HouseRobberyCall')
AddEventHandler('police:client:HouseRobberyCall', function(coords, msg, gender, streetLabel)
    if PlayerJob.name == 'police' and onDuty then
        TriggerEvent('ctrp-policealerts:client:AddPoliceAlert', {
            timeOut = 10000,
            alertTitle = "10-90D | Burglary attempt",
            coords = {
                x = coords.x,
                y = coords.y,
                z = coords.z,
            },
            details = {
                [1] = {
                    icon = '<i class="fas fa-venus-mars"></i>',
                    detail = gender,
                },
                [2] = {
                    icon = '<i class="fas fa-globe-europe"></i>',
                    detail = streetLabel,
                },
            },
            callSign = CTRPFW.Functions.GetPlayerData().metadata["callsign"],
        })

        PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
        local transG = 250
        local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
        SetBlipSprite(blip, 411)
        SetBlipColour(blip, 1)
        SetBlipDisplay(blip, 4)
        SetBlipAlpha(blip, transG)
        SetBlipScale(blip, 0.7)
        SetBlipAsShortRange(blip, false)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString("Alert: Burglary house")
        EndTextCommandSetBlipName(blip)
        while transG ~= 0 do
            Wait(180 * 4)
            transG = transG - 1
            SetBlipAlpha(blip, transG)
            if transG == 0 then
                SetBlipSprite(blip, 2)
                RemoveBlip(blip)
                return
            end
        end
    end
end)

RegisterNetEvent('112:client:SendPoliceAlert')
AddEventHandler('112:client:SendPoliceAlert', function(notifyType, data, blipSettings)
    if PlayerJob.name == 'police' and onDuty then
        if notifyType == "flagged" then
            TriggerEvent('ctrp-policealerts:client:AddPoliceAlert', {
                timeOut = 10000,
                alertTitle = "10-90 | Burglary attempt",
                details = {
                    [1] = {
                        icon = '<i class="fas fa-video"></i>',
                        detail = data.camId,
                    },
                    [2] = {
                        icon = '<i class="fas fa-closed-captioning"></i>',
                        detail = data.plate,
                    },
                    [3] = {
                        icon = '<i class="fas fa-globe-europe"></i>',
                        detail = data.streetLabel,
                    },
                },
                callSign = CTRPFW.Functions.GetPlayerData().metadata["callsign"],
            })
            RadarSound()
        end
    
        if blipSettings ~= nil then
            local transG = 250
            local blip = AddBlipForCoord(blipSettings.x, blipSettings.y, blipSettings.z)
            SetBlipSprite(blip, blipSettings.sprite)
            SetBlipColour(blip, blipSettings.color)
            SetBlipDisplay(blip, 4)
            SetBlipAlpha(blip, transG)
            SetBlipScale(blip, blipSettings.scale)
            SetBlipAsShortRange(blip, false)
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentString(blipSettings.text)
            EndTextCommandSetBlipName(blip)
            while transG ~= 0 do
                Wait(180 * 4)
                transG = transG - 1
                SetBlipAlpha(blip, transG)
                if transG == 0 then
                    SetBlipSprite(blip, 2)
                    RemoveBlip(blip)
                    return
                end
            end
        end
    end
end)

RegisterNetEvent('police:client:PoliceAlertMessage')
AddEventHandler('police:client:PoliceAlertMessage', function(title, streetLabel, coords)
    if PlayerJob.name == 'police' and onDuty then
        TriggerEvent('ctrp-policealerts:client:AddPoliceAlert', {
            timeOut = 10000,
            alertTitle = title,
            details = {
                [1] = {
                    icon = '<i class="fas fa-globe-europe"></i>',
                    detail = streetLabel,
                },
            },
            callSign = CTRPFW.Functions.GetPlayerData().metadata["callsign"],
        })

        PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
        local transG = 100
        local blip = AddBlipForRadius(coords.x, coords.y, coords.z, 100.0)
        SetBlipSprite(blip, 9)
        SetBlipColour(blip, 1)
        SetBlipAlpha(blip, transG)
        SetBlipAsShortRange(blip, false)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString("911 - "..title)
        EndTextCommandSetBlipName(blip)
        while transG ~= 0 do
            Wait(180 * 4)
            transG = transG - 1
            SetBlipAlpha(blip, transG)
            if transG == 0 then
                SetBlipSprite(blip, 2)
                RemoveBlip(blip)
                return
            end
        end
    end
end)

RegisterNetEvent('police:server:SendEmergencyMessageCheck')
AddEventHandler('police:server:SendEmergencyMessageCheck', function(MainPlayer, message, coords)
    local PlayerData = CTRPFW.Functions.GetPlayerData()
    if PlayerData.job.name == 'police' or PlayerData.job.name == 'doctor' and onDuty then
        TriggerEvent('chatMessage', "911 ALERT - " .. MainPlayer.PlayerData.charinfo.firstname .. " " .. MainPlayer.PlayerData.charinfo.lastname .. " ("..MainPlayer.PlayerData.source..")", "warning", message)
        TriggerEvent("police:client:EmergencySound")
        local transG = 250
        local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
        SetBlipSprite(blip, 280)
        SetBlipColour(blip, 1)
        SetBlipDisplay(blip, 4)
        SetBlipAlpha(blip, transG)
        SetBlipScale(blip, 0.9)
        SetBlipAsShortRange(blip, false)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString("911 alert")
        EndTextCommandSetBlipName(blip)
        while transG ~= 0 do
            Wait(180 * 4)
            transG = transG - 1
            SetBlipAlpha(blip, transG)
            if transG == 0 then
                SetBlipSprite(blip, 2)
                RemoveBlip(blip)
                return
            end
        end
    end
end)

RegisterNetEvent('police:server:SendEmergencyMessageChecks')
AddEventHandler('police:server:SendEmergencyMessageChecks', function(MainPlayer, message, coords)
    local PlayerData = CTRPFW.Functions.GetPlayerData()
    if PlayerData.job.name == 'police' or PlayerData.job.name == 'doctor' and onDuty then
        TriggerEvent('chatMessage', "311 ALERT - " .. MainPlayer.PlayerData.charinfo.firstname .. " " .. MainPlayer.PlayerData.charinfo.lastname .. " ("..MainPlayer.PlayerData.source..")", "warning", message)
        TriggerEvent("police:client:EmergencySound")
        local transG = 250
        local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
        SetBlipSprite(blip, 280)
        SetBlipColour(blip, 1)
        SetBlipDisplay(blip, 4)
        SetBlipAlpha(blip, transG)
        SetBlipScale(blip, 0.9)
        SetBlipAsShortRange(blip, false)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString("311 alert")
        EndTextCommandSetBlipName(blip)
        while transG ~= 0 do
            Wait(180 * 4)
            transG = transG - 1
            SetBlipAlpha(blip, transG)
            if transG == 0 then
                SetBlipSprite(blip, 2)
                RemoveBlip(blip)
                return
            end
        end
    end
end)

RegisterNetEvent('police:client:Send112AMessage')
AddEventHandler('police:client:Send112AMessage', function(message)
    local PlayerData = CTRPFW.Functions.GetPlayerData()
    if PlayerData.job.name == 'police' or PlayerData.job.name == 'doctor' and onDuty then
        TriggerEvent('chatMessage', "ANONYMOUS REPORT", "warning", message)
        TriggerEvent("police:client:EmergencySound")
    end
end)

RegisterNetEvent('police:client:SendToJail')
AddEventHandler('police:client:SendToJail', function(time)
    TriggerServerEvent("police:server:SetHandcuffStatus", false)
    isHandcuffed = false
    isEscorted = false
    ClearPedTasks(PlayerPedId())
    DetachEntity(PlayerPedId(), true, false)
    TriggerEvent("prison:client:Enter", time)
end)

function RadarSound()
    PlaySoundFrontend( -1, "Beep_Green", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1 )
    Citizen.Wait(100)
    PlaySoundFrontend( -1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1 )
    Citizen.Wait(100)
    PlaySoundFrontend( -1, "Beep_Green", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1 )
    Citizen.Wait(100)
    PlaySoundFrontend( -1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1 )
    Citizen.Wait(100)
end

function GetClosestPlayer()
    local closestPlayers = CTRPFW.Functions.GetPlayersFromCoords()
    local closestDistance = -1
    local closestPlayer = -1
    local coords = GetEntityCoords(PlayerPedId())

    for i=1, #closestPlayers, 1 do
        if closestPlayers[i] ~= PlayerId() then
            local pos = GetEntityCoords(GetPlayerPed(closestPlayers[i]))
            local distance = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, coords.x, coords.y, coords.z, true)

            if closestDistance == -1 or closestDistance > distance then
                closestPlayer = closestPlayers[i]
                closestDistance = distance
            end
        end
	end

	return closestPlayer, closestDistance
end

function DrawText3D(x,y,z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local p = GetGameplayCamCoords()
    local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
    local scale = (1 / distance) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov
    if onScreen then
        SetTextScale(0.3, 0.3)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextOutline()
        SetTextColour(255, 255, 255, 215)
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
        --local factor = (string.len(text)) / 370
		--DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 100)
      end
  end

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(10)
    end
end


local PoliceGarages = {
    { ['x'] = 424.1455, ['y'] = -1023.361, ['z'] = 28.92278, ['h'] = 300.83587 }, ---MRPD
    { ['x'] = 293.09509, ['y'] = -581.854, ['z'] = 43.193058, ['h'] = 152.69309 }, ---PILLBOX
    ---{ ['x'] = 1855.5954, ['y'] = 3674.6323, ['z'] = 33.661075, ['h'] = 30.010299 }, ---SHANDI PD AND HOSPITAL
    { ['x'] = -459.241, ['y'] = 6002.0151, ['z'] = 31.342147, ['h'] = 200.63348 }, ---Polito pd
    { ['x'] = -439.5925, ['y'] = 6029.1791, ['z'] = 31.340551, ['h'] = 274.22802 }, ----palito hospital
    { ['x'] = 1855.5954, ['y'] = 3674.6323, ['z'] = 33.661075, ['h'] = 30.010299 } ----Prision
    -- { ['x'] = -342.9639, ['y'] = -136.1628, ['z'] = 39.009616, ['h'] = 270.94482 },
    -- { ['x'] = -211.3267, ['y'] = -1326.596, ['z'] = 30.89038, ['h'] = 261.77297 },
    -- { ['x'] = 731.14245, ['y'] = -1088.785, ['z'] = 22.163265, ['h'] = 300.03933 },
	-- { ['x'] = -1629.60, ['y'] = -1141.96, ['z'] = 0.86, ['h'] = 146.34 },
	-- { ['x'] = -2814.367, ['y'] = 2380.24, ['z'] = 0.31, ['h'] = 65.84 },
	-- { ['x'] = -641.04, ['y'] = 6357.82, ['z'] = -0.23, ['h'] = 61.35 },
	-- { ['x'] = 1543.67, ['y'] = 3900.56, ['z'] = 30.43, ['h'] = 143.82 }
}

function IsNearPoliceGarage()
    local plyPed = PlayerPedId()
    local plyCoords = GetEntityCoords(plyPed)

    for k,v in pairs(PoliceGarages) do
        local distance = GetDistanceBetweenCoords(plyCoords.x, plyCoords.y,plyCoords.z, v.x, v.y, v.z)
        if distance < 100 then
            return true
        end
    end

    return false
end

RegisterNetEvent('police:livery')
AddEventHandler('police:livery', function(livery)

    if not IsNearPoliceGarage() then
        return
    end

    local plyPed = PlayerPedId()
    if IsPedInAnyVehicle(plyPed) then
        local vehicle = GetVehiclePedIsIn(PlayerPedId())

        if GetVehicleLiveryCount(vehicle) == -1 then
            TriggerEvent('chat:addMessage', {
                template = '<div class="chat-message server">SYSTEM: {0}</div>',
                args = { 'Vehicle dont have any liveries' }
            })
            return
        end

        if livery and GetVehicleLiveryCount(vehicle) >= livery then
            SetVehicleLivery(vehicle, livery, true)
            return
        else
            TriggerEvent('chat:addMessage', {
                template = '<div class="chat-message server">Available Liveries: {0}</div>',
                args = { GetVehicleLiveryCount(vehicle) }
            })
            return
        end
    
    else
        TriggerEvent('chat:addMessage', {
            template = '<div class="chat-message server">SYSTEM: {0}</div>',
            args = { 'You have to be in vehicle' }
        })
        return
    end
end)

RegisterNetEvent('police:extras')
AddEventHandler('police:extras', function(extra)

    if not IsNearPoliceGarage() then
        return
    end

    local plyPed = PlayerPedId()
    if IsPedInAnyVehicle(plyPed) then
        local vehicle = GetVehiclePedIsIn(PlayerPedId())

        if extra == '' or extra == nil then
            local total = 0
            for id = 0, 12 do
                if DoesExtraExist(vehicle, id) then
                    total = total + 1
                end
            end

            TriggerEvent("debug", 'Police: Available Extras ' .. total, 'success')

            TriggerEvent('chat:addMessage', {
                template = '<div class="chat-message server">Available Extras: {0}</div>',
                args = { total }
            })

            return
        end

        if extra == 'all' then
            for id = 0, 12 do
                if DoesExtraExist(vehicle, id) then
                    SetVehicleExtra(vehicle, id, false)
                end
            end

            TriggerEvent("debug", 'Police: Enable All Extras', 'success')


            return
        end

        if extra == 'remove' then
            for id = 0, 12 do
                if DoesExtraExist(vehicle, id) then
                    SetVehicleExtra(vehicle, id, true)
                end
            end

            TriggerEvent("debug", 'Police: Disable All Extras', 'error')

            return
        end

        if DoesExtraExist(vehicle, extra) then
            if IsVehicleExtraTurnedOn(vehicle, extra)  then
                SetVehicleExtra(vehicle, extra, true)
                TriggerEvent("debug", 'Police: Disable Extra ' .. extra, 'error')
            else
                SetVehicleExtra(vehicle, extra, false)
                TriggerEvent("debug", 'Police: Enable Extra ' .. extra, 'success')
            end
        else
            TriggerEvent('chat:addMessage', {
                template = '<div class="chat-message server">SYSTEM: {0}</div>',
                args = { 'Invaild Vehicle Extra' }
            })
            return
		end

    else
        TriggerEvent('chat:addMessage', {
            template = '<div class="chat-message server">SYSTEM: {0}</div>',
            args = { 'You have to be in vehicle' }
        })
        return
    end
end)

RegisterNetEvent('police:fix')
AddEventHandler('police:fix', function()
    if not IsNearPoliceGarage() then
        return
    end

    if IsPedInAnyVehicle(PlayerPedId()) then
	    local ped = PlayerPedId()
		local veh = GetVehiclePedIsIn(ped)
        FreezeEntityPosition(veh, true)
        CTRPFW.Functions.Progressbar("repair_vehicle", "Repairing..", math.random(10000, 20000), false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function()
            SetVehicleFixed(GetVehiclePedIsIn(PlayerPedId()))
            TriggerEvent('chat:addMessage', {
                template = '<div class="chat-message system">SYSTEM: {0}</div>',
                args = { 'Fixed!' }
            })
            FreezeEntityPosition(veh, false)
        end, function()
            ClearPedTasks(PlayerPedId())

        end)
    else
        TriggerEvent('chat:addMessage', {
            template = '<div class="chat-message server">SYSTEM: {0}</div>',
            args = { 'You have to be in vehicle' }
        })
        return
    end
end)

RegisterNetEvent('police:windowtint')
AddEventHandler('police:windowtint', function(num)
    if not IsNearPoliceGarage() then
        return
    end

    if IsPedInAnyVehicle(PlayerPedId()) then
        local props = CTRPFW.Functions.GetVehicleProperties(GetVehiclePedIsIn(PlayerPedId()))
        props["modEngine"] = 3
        props['windowTint'] = num
        CTRPFW.Functions.SetVehicleProperties(GetVehiclePedIsIn(PlayerPedId()), props)
        SetVehicleWindowTint(GetVehiclePedIsIn(PlayerPedId()))
        TriggerEvent('chat:addMessage', {
            template = '<div class="chat-message system">SYSTEM: {0}</div>',
            args = { 'Installed!' }
        })
    else
        TriggerEvent('chat:addMessage', {
            template = '<div class="chat-message server">SYSTEM: {0}</div>',
            args = { 'You have to be in vehicle' }
        })
        return
    end
end)
