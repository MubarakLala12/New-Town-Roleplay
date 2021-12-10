-- CTRPFW = nil
local hasShot = false

-- Citizen.CreateThread(function() 
--     while CTRPFW == nil do
--         TriggerEvent("CTRPFW:GetObject", function(obj) CTRPFW = obj end)    
--         Citizen.Wait(200)
--     end
-- end)

RegisterNetEvent('CTRPFW:Client:OnPlayerLoaded')
AddEventHandler('CTRPFW:Client:OnPlayerLoaded', function()
    PlayerData = CTRPFW.Functions.GetPlayerData()
end)

RegisterNetEvent("CTRPFW:checkGSR")
AddEventHandler("CTRPFW:checkGSR", function()
    local closestPlayer, closestDistance = GetClosestPlayer()

    if closestPlayer ~= -1 and closestDistance <= 3.0 then
        TriggerServerEvent('GSR:Status2', GetPlayerServerId(closestPlayer))
    else
        CTRPFW.Functions.Notify("No players nearby", "error")
    end
end)

RegisterNetEvent("CTRPFW:checkGSRgod")
AddEventHandler("CTRPFW:checkGSRgod", function(playerid)
    TriggerServerEvent('GSR:Status2', playerid)
end)


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

RegisterNetEvent("police:shot")
AddEventHandler("police:shot", function()
    TriggerServerEvent('GSR:SetGSR', timer)
    hasShot = true
    Citizen.Wait(1 * 1000)
end)

--[[Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        ped = PlayerPedId()
        if IsPedShooting(ped) then
            TriggerServerEvent('GSR:SetGSR', timer)
            hasShot = true
            Citizen.Wait(1 * 1000)
        end
    end
end)--]]

--[[Citizen.CreateThread(function()
    while true do
        Wait(7000)
        if Config.waterClean and hasShot then
            ped = PlayerPedId()
            if IsEntityInWater(ped) then
                CTRPFW.Functions.Progressbar("washing_gsr", "Washing off Gun Residue.", 7000, false, true, {
                    disableMovement = false,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {
                    animDict = "timetable@gardener@filling_can",
                    anim = "gar_ig_5_filling_can",
                    flags = 16,
                }, {}, {}, function() -- Done
                    if IsEntityInWater(ped) then
                        hasShot = false
                        TriggerServerEvent('GSR:Remove')
                        CTRPFW.Functions.Notify('You washed off all the Gunshot Residue in the water', 'success', 5000)
                    else
                        CTRPFW.Functions.Notify('You left the water too early and did not wash off the gunshot residue.','error', 5000)
                    end
                end, function() -- Cancel
                    CTRPFW.Functions.Notify("Canceled.", "error")
                end)
                Citizen.Wait(5000)
            else Citizen.Wait(5000)
            end
        end
    end
end)]]

Citizen.CreateThread(function()
    while true do
        Wait(7000)
        if Config.waterClean and hasShot then
            ped = PlayerPedId()
            if IsEntityInWater(ped) then
                CTRPFW.Functions.Progressbar("washing_gsr", "Washing off Gun Residue.", 2000, false, true, {
                    disableMovement = false,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {}, {}, {}, function() -- Done
                    if IsEntityInWater(ped) then
                        hasShot = false
                        TriggerServerEvent('GSR:Remove')
                        CTRPFW.Functions.Notify('You washed off all the Gunshot Residue in the water', 'success', 5000)
                    else
                        CTRPFW.Functions.Notify('You left the water too early and did not wash off the gunshot residue.','error', 5000)
                    end
                end, function() -- Cancel
                    CTRPFW.Functions.Notify("Canceled.", "error")
                end)
                Citizen.Wait(5000)
            else Citizen.Wait(5000)
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsEntityInWater(ped) and hasShot then
            local pos = GetEntityCoords(PlayerPedId())
            DrawText3D(pos.x,pos.y,pos.z, "Stay in water to wash off Gun Residue on you.")
        else
            Citizen.Wait(5000)
        end
    end
end)

function status()
    if hasShot then
        CTRPFW.Functions.TriggerCallback('GSR:Status', function(cb)
            print(cb)
            if not cb then
                hasShot = false
            end
        end)
    end
end

function updateStatus()
    status()
    SetTimeout(Config.gsrUpdateStatus, updateStatus)
end

updateStatus()
