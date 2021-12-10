CTRPFW = nil

Citizen.CreateThread(function()
    while CTRPFW == nil do
        TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)
        Citizen.Wait(200)
    end
end)

--[[Citizen.CreateThread(function()
    local blip = AddBlipForCoord(243.63, -1078.53, 29.29)
	SetBlipSprite(blip, 304)
	SetBlipDisplay(blip, 4)
	SetBlipScale(blip, 0.6)
	SetBlipAsShortRange(blip, true)
	SetBlipColour(blip, 5)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentSubstringPlayerName("Court of Justice")
    EndTextCommandSetBlipName(blip)
end)]]

Citizen.CreateThread(function()
    local blip = AddBlipForCoord(-530.19, -173.02, 38.22)
	SetBlipSprite(blip, 304)
	SetBlipDisplay(blip, 4)
	SetBlipScale(blip, 0.6)
	SetBlipAsShortRange(blip, true)
	SetBlipColour(blip, 5)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentSubstringPlayerName("Court of Justice")
    EndTextCommandSetBlipName(blip)
end)

RegisterNetEvent("ctrp-justice:client:showLawyerLicense")
AddEventHandler("ctrp-justice:client:showLawyerLicense", function(sourceId, data)
    local sourcePos = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(sourceId)), false)
    local pos = GetEntityCoords(GetPlayerPed(-1), false)
    if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, sourcePos.x, sourcePos.y, sourcePos.z, true) < 2.0) then
        TriggerEvent('chat:addMessage', {
            template = '<div class="chat-message advert"><div class="chat-message-body"><strong>{0}:</strong><br><br> <strong>Pass-ID:</strong> {1} <br><strong>First Name:</strong> {2} <br><strong>Last Name:</strong> {3} <br><strong>CSN:</strong> {4} </div></div>',
            args = {'Advocate pass', data.id, data.firstname, data.lastname, data.citizenid}
        })
    end
end)

RegisterNetEvent("ctrp-justice:client:showMayorPass")
AddEventHandler("ctrp-justice:client:showMayorPass", function(sourceId, data)
    local sourcePos = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(sourceId)), false)
    local pos = GetEntityCoords(GetPlayerPed(-1), false)
    if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, sourcePos.x, sourcePos.y, sourcePos.z, true) < 2.0) then
        TriggerEvent('chat:addMessage', {
            template = '<div class="chat-message advert"><div class="chat-message-body"><strong>{0}:</strong><br><br> <strong>Pass-ID:</strong> {1} <br><strong>First Name:</strong> {2} <br><strong>Last Name:</strong> {3} <br><strong>CSN:</strong> {4} </div></div>',
            args = {'Mayor Pass', data.id, data.firstname, data.lastname, data.citizenid}
        })
    end
end)


function DrawText3D(x, y, z, text)
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

RegisterNetEvent('covidvac:client:vaccination')
AddEventHandler('covidvac:client:vaccination', function(source)
    TriggerEvent("inventory:client:ItemBox", CTRPFW.Shared.Items["covidvac"], "remove")
    TriggerServerEvent("CTRPFW:Server:RemoveItem", "covidvac", 1)    
end)