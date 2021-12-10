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

local ClosestSafe = nil
local IsAuthorized = false

local PlayerData = {}

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

function SetClosestSafe()
    local pos = GetEntityCoords(GetPlayerPed(-1), true)
    local current = nil
    local dist = nil
    for id, house in pairs(Config.Safes) do
        if current ~= nil then
            if(GetDistanceBetweenCoords(pos, Config.Safes[id].coords.x, Config.Safes[id].coords.y, Config.Safes[id].coords.z, true) < dist)then
                current = id
                dist = GetDistanceBetweenCoords(pos, Config.Safes[id].coords.x, Config.Safes[id].coords.y, Config.Safes[id].coords.z, true)
            end
        else
            dist = GetDistanceBetweenCoords(pos, Config.Safes[id].coords.x, Config.Safes[id].coords.y, Config.Safes[id].coords.z, true)
            current = id
        end
    end
    ClosestSafe = current
    if ClosestSafe ~= nil then
        if current == "pdm" then
            IsAuthorized = false
        end
    end
end

RegisterNetEvent("CTRPFW:Client:OnPlayerLoaded")
AddEventHandler("CTRPFW:Client:OnPlayerLoaded", function()
    Citizen.CreateThread(function()
        PlayerData = CTRPFW.Functions.GetPlayerData()
        while true do
            SetClosestSafe()
            Citizen.Wait(2500)
        end
    end)
end)

RegisterNetEvent('CTRPFW:Client:OnPlayerLoaded')
AddEventHandler('CTRPFW:Client:OnPlayerLoaded', function()
    CTRPFW.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
    end)
    isLoggedIn = true
end)

RegisterNetEvent('CTRPFW:Client:OnJobUpdate')
AddEventHandler('CTRPFW:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
end)


Citizen.CreateThread(function()
    while true do
        local inRange = false
        local ped = GetPlayerPed(-1)
        local pos = GetEntityCoords(ped)

        if ClosestSafe ~= nil then
            if PlayerData.job.name == ClosestSafe then
                if not IsAuthorized then
                    local data = Config.Safes[ClosestSafe]
                    local distance = GetDistanceBetweenCoords(pos, data.coords.x, data.coords.y, data.coords.z)
                    if PlayerJob.name == 'pdm' and PlayerJob.gradelabel == "Owner" then
                        if distance < 20 then
                            inRange = true
                            if distance < Config.MinimumSafeDistance then
                                DrawText3Ds(data.coords.x, data.coords.y, data.coords.z, '~g~$'..data.money)
                                DrawText3Ds(data.coords.x, data.coords.y, data.coords.z - 0.1, '~b~/deposit~w~ - Put money in the safe')
                                DrawText3Ds(data.coords.x, data.coords.y, data.coords.z - 0.2, '~b~/withdraw~w~ - Take money out of the safe')
                            end
                        end
                    end
                else
                    Citizen.Wait(1750)
                end
            else
                Citizen.Wait(1750)
            end
        else
            Citizen.Wait(1750)
        end
        Citizen.Wait(1)
    end
end)

RegisterNetEvent('ctrp-moneysafespdm:client:DepositMoney')
AddEventHandler('ctrp-moneysafespdm:client:DepositMoney', function(amount)
    if ClosestSafe ~= nil then
        if not IsAuthorized then
            local ped = GetPlayerPed(-1)
            local pos = GetEntityCoords(ped)
            local data = Config.Safes[ClosestSafe]
            
                TriggerServerEvent('ctrp-moneysafespdm:server:DepositMoney', ClosestSafe, amount)
        end
    end
end)

RegisterNetEvent('ctrp-moneysafespdm:client:DepositMoney1')
AddEventHandler('ctrp-moneysafespdm:client:DepositMoney1', function(amount)
    if ClosestSafe ~= nil then
        if not IsAuthorized then
            local ped = GetPlayerPed(-1)
            local pos = GetEntityCoords(ped)
            local data = Config.Safes[ClosestSafe]
            
                TriggerServerEvent('ctrp-moneysafespdm:server:DepositMoney1', ClosestSafe, amount)
        end
    end
end)

RegisterNetEvent('ctrp-moneysafespdm:client:WithdrawMoney')
AddEventHandler('ctrp-moneysafespdm:client:WithdrawMoney', function(amount)
    if ClosestSafe ~= nil then
        if not IsAuthorized then
            local ped = GetPlayerPed(-1)
            local pos = GetEntityCoords(ped)
            local data = Config.Safes[ClosestSafe]
            local distance = GetDistanceBetweenCoords(pos, data.coords.x, data.coords.y, data.coords.z)

            if distance < Config.MinimumSafeDistance then
                TriggerServerEvent('ctrp-moneysafespdm:server:WithdrawMoney', ClosestSafe, amount)
            end
        end
    end
end)

RegisterNetEvent('CTRPFW:Client:OnJobUpdate')
AddEventHandler('CTRPFW:Client:OnJobUpdate', function(JobInfo)
    PlayerData.job = JobInfo
end)

RegisterNetEvent('ctrp-moneysafespdm:client:UpdateSafe')
AddEventHandler('ctrp-moneysafespdm:client:UpdateSafe', function(SafeData, k)
    Config.Safes[k].money = SafeData.money
    Config.Safes[k].transactions = SafeData.transactions
end)
