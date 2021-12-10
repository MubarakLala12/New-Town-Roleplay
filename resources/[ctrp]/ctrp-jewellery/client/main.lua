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

local robberyAlert = false
local isLoggedIn = false
local firstAlarm = false
local OnHackDonet = false

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
    isLoggedIn = true
end)

RegisterNetEvent('CTRPFW:Client:OnPlayerUnload')
AddEventHandler('CTRPFW:Client:OnPlayerUnload', function()
    isLoggedIn = false
end)


local hackX = -631.45  --starting
local hackY = -230.27
local hackZ = 38.06

Citizen.CreateThread(function()
    while true do
		Citizen.Wait(30 * 60000)
		print('VIRUSOP')
		TriggerServerEvent('ctrp-jewellery:server:updateTable', false)
	end
end)

Citizen.CreateThread(function()
    while true do
	Citizen.Wait(7)
		local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
		local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, hackX, hackY, hackZ)
---
		if dist <= 2.5 then
		DrawMarker(27, hackX, hackY, hackZ-0.97, 0, 0, 0, 0, 0, 0, 0.90, 0.90, 0.90, 255, 255, 255, 200, 0, 0, 0, 0)
		else
		Citizen.Wait(1500)
		end
		
		if dist <= 2.5 then
		DrawText3Ds(hackX, hackY, hackZ, "~g~[E]~w~ To Hack Glasses")
		end
--
		if dist <= 0.5 then
            if IsControlJustPressed(0, Keys['E']) then
                CTRPFW.Functions.TriggerCallback('ctrp-jewellery:server:getCops', function(cops)
                    if cops >= Config.RequiredCops then
                        TriggerEvent("mhackings:show")
                        TriggerEvent("mhackings:start", math.random(5, 9), math.random(10, 18), OnHackDone) 
                    else
                        CTRPFW.Functions.Notify('Not enough police...', 'error')
                    end
                end)
                if Config.useCoD then
                    cooldown()
                else
                    TriggerServerEvent('ctrp-jewellery:server:updateTable', false)
                end
			end			
		end
	end
end)

function cooldown()
	Citizen.Wait(Config.codTime)
	TriggerServerEvent('ctrp-jewellery:server:updateTable', false)
end

RegisterNetEvent('ctrp-jewellery:client:syncTable')
AddEventHandler('ctrp-jewellery:client:syncTable', function(bool)
    inUse = bool
end)

Citizen.CreateThread(function()
    while true do
        local ped = GetPlayerPed(-1)
        local pos = GetEntityCoords(ped)
        inRange = false
        sleep = 2500
        if CTRPFW ~= nil then
            if isLoggedIn then
                sleep =2000
                PlayerData = CTRPFW.Functions.GetPlayerData()
                for case,_ in pairs(Config.Locations) do
                    local dist = GetDistanceBetweenCoords(pos, Config.Locations[case]["coords"]["x"], Config.Locations[case]["coords"]["y"], Config.Locations[case]["coords"]["z"])
                    local storeDist = GetDistanceBetweenCoords(pos, Config.JewelleryLocation["coords"]["x"], Config.JewelleryLocation["coords"]["y"], Config.JewelleryLocation["coords"]["z"])
                    if dist < 30 then
                        inRange = true
                        if dist < 3.0 then
                            sleep = 7
                            if dist < 0.6 then
                                if not Config.Locations[case]["isBusy"] and not Config.Locations[case]["isOpened"] then
                                    if OnHackDonet then
                                        DrawText3Ds(Config.Locations[case]["coords"]["x"], Config.Locations[case]["coords"]["y"], Config.Locations[case]["coords"]["z"], '[E] Smash showcase')
                                        if IsControlJustPressed(0, Keys["E"]) then
                                            CTRPFW.Functions.TriggerCallback('ctrp-jewellery:server:getCops', function(cops)
                                                if cops >= Config.RequiredCops then
                                                    if validWeapon() then
                                                        smashVitrine(case)
                                                    else
                                                        CTRPFW.Functions.Notify('Your weapon isnt strong enough..', 'error')
                                                    end
                                                else
                                                    CTRPFW.Functions.Notify('Not enough police...', 'error')
                                                end
                                            end)
                                        end     
                                    end
                                end    
                            end

                            if storeDist < 2 then
                                if not firstAlarm then
                                    if validWeapon() then
                                        TriggerServerEvent('ctrp-jewellery:server:PoliceAlertMessage', "Suspicious situation", pos, true)
                                        firstAlarm = true
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end

        -- if not inRange then
        --     Citizen.Wait(2000)
        -- end

        Citizen.Wait(sleep)
    end
end)

function OnHackDone(success, timeremaining)
    if success then
        TriggerEvent('mhackings:hide')
        OnHackDonet = true
    else
        TriggerEvent('mhackings:hide')
	end
end

function loadParticle()
	if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
    RequestNamedPtfxAsset("scr_jewelheist")
    end
    while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
    Citizen.Wait(0)
    end
    SetPtfxAssetNextCall("scr_jewelheist")
end

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(3)
    end
end

function validWeapon()
    local ped = GetPlayerPed(-1)
    local pedWeapon = GetSelectedPedWeapon(ped)

    for k, v in pairs(Config.WhitelistedWeapons) do
        if pedWeapon == k then
            return true
        end
    end
    return false
end

local smashing = false

function smashVitrine(k)
    local animDict = "missheist_jewel"
    local animName = "smash_case"
    local ped = GetPlayerPed(-1)
    local plyCoords = GetOffsetFromEntityInWorldCoords(ped, 0, 0.6, 0)
    local pedWeapon = GetSelectedPedWeapon(ped)

    if math.random(1, 100) <= 80 and not IsWearingHandshoes() then
        TriggerServerEvent("evidence:server:CreateFingerDrop", plyCoords)
    elseif math.random(1, 100) <= 5 and IsWearingHandshoes() then
        TriggerServerEvent("evidence:server:CreateFingerDrop", plyCoords)
        CTRPFW.Functions.Notify("You have torn your self on the glass..", "error")
    end

    smashing = true

    CTRPFW.Functions.Progressbar("smash_vitrine", "Banging showcase..", Config.WhitelistedWeapons[pedWeapon]["timeOut"], false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerServerEvent('ctrp-jewellery:server:setVitrineState', "isOpened", true, k)
        TriggerServerEvent('ctrp-jewellery:server:setVitrineState', "isBusy", false, k)
        TriggerServerEvent('ctrp-jewellery:server:vitrineReward')
        TriggerServerEvent('ctrp-jewellery:server:setTimeout')
        TriggerServerEvent('ctrp-jewellery:server:PoliceAlertMessage', "Jewellery robbery", plyCoords, false)
        smashing = false
        TaskPlayAnim(ped, animDict, "exit", 3.0, 3.0, -1, 2, 0, 0, 0, 0)
    end, function() -- Cancel
        TriggerServerEvent('ctrp-jewellery:server:setVitrineState', "isBusy", false, k)
        TaskPlayAnim(ped, animDict, "exit", 3.0, 3.0, -1, 2, 0, 0, 0, 0)
    end)
    TriggerServerEvent('ctrp-jewellery:server:setVitrineState', "isBusy", true, k)

    Citizen.CreateThread(function()
        while smashing do
            loadAnimDict(animDict)
            TaskPlayAnim(ped, animDict, animName, 3.0, 3.0, -1, 2, 0, 0, 0, 0 )
            Citizen.Wait(500)
            TriggerServerEvent("InteractSound_SV:PlayOnSource", "breaking_vitrine_glass", 0.25)
            loadParticle()
            StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", plyCoords.x, plyCoords.y, plyCoords.z, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
            Citizen.Wait(2500)
        end
    end)
end

RegisterNetEvent('ctrp-jewellery:client:setVitrineState')
AddEventHandler('ctrp-jewellery:client:setVitrineState', function(stateType, state, k)
    Config.Locations[k][stateType] = state
end)

RegisterNetEvent('ctrp-jewellery:client:setAlertState')
AddEventHandler('ctrp-jewellery:client:setAlertState', function(bool)
    robberyAlert = bool
end)

RegisterNetEvent('ctrp-jewellery:client:PoliceAlertMessage')
AddEventHandler('ctrp-jewellery:client:PoliceAlertMessage', function(title, coords, blip)
    if blip then
        TriggerEvent('ctrp-policealerts:client:AddPoliceAlert', {
            timeOut = 5000,
            alertTitle = title,
            details = {
                [1] = {
                    icon = '<i class="fas fa-gem"></i>',
                    detail = "Jewellery Store",
                },
                [2] = {
                    icon = '<i class="fas fa-video"></i>',
                    detail = "31 | 32 | 33 | 34",
                },
                [3] = {
                    icon = '<i class="fas fa-globe-europe"></i>',
                    detail = "Rockford Dr",
                },
            },
            callSign = CTRPFW.Functions.GetPlayerData().metadata["callsign"],
        })
        PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
        Citizen.Wait(100)
        PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
        Citizen.Wait(100)
        PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
        local transG = 100
        local blip = AddBlipForRadius(coords.x, coords.y, coords.z, 100.0)
        SetBlipSprite(blip, 9)
        SetBlipColour(blip, 1)
        SetBlipAlpha(blip, transG)
        SetBlipAsShortRange(blip, false)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString("112 - Suspect situation jewellery")
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
    else
        if not robberyAlert then
            PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
            TriggerEvent('ctrp-policealerts:client:AddPoliceAlert', {
                timeOut = 5000,
                alertTitle = title,
                details = {
                    [1] = {
                        icon = '<i class="fas fa-gem"></i>',
                        detail = "Jewellery Store",
                    },
                    [2] = {
                        icon = '<i class="fas fa-video"></i>',
                        detail = "31 | 32 | 33 | 34",
                    },
                    [3] = {
                        icon = '<i class="fas fa-globe-europe"></i>',
                        detail = "Rockford Dr",
                    },
                },
                callSign = CTRPFW.Functions.GetPlayerData().metadata["callsign"],
            })
            robberyAlert = true
        end
    end
end)

function IsWearingHandshoes()
    local armIndex = GetPedDrawableVariation(GetPlayerPed(-1), 3)
    local model = GetEntityModel(GetPlayerPed(-1))
    local retval = true
    if model == GetHashKey("mp_m_freemode_01") then
        if Config.MaleNoHandshoes[armIndex] ~= nil and Config.MaleNoHandshoes[armIndex] then
            retval = false
        end
    else
        if Config.FemaleNoHandshoes[armIndex] ~= nil and Config.FemaleNoHandshoes[armIndex] then
            retval = false
        end
    end
    return retval
end

Citizen.CreateThread(function()
    Dealer = AddBlipForCoord(Config.JewelleryLocation["coords"]["x"], Config.JewelleryLocation["coords"]["y"], Config.JewelleryLocation["coords"]["z"])

    SetBlipSprite (Dealer, 617)
    SetBlipDisplay(Dealer, 4)
    SetBlipScale  (Dealer, 0.7)
    SetBlipAsShortRange(Dealer, true)
    SetBlipColour(Dealer, 3)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Jewellery Store")
    EndTextCommandSetBlipName(Dealer)
end)
