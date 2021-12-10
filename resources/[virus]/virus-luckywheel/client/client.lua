CTRPFW = nil
local isLoggedIn = false
local _wheel = nil

local _wheelPos = vector3(1109.76, 227.89, -49.64)
local _baseWheelPos = vector3(1111.05, 229.81, -50.38)
local Keys = {
	["ESC"] = 322, ["BACKSPACE"] = 177, ["E"] = 38, ["ENTER"] = 18,	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173
}
local _isRolling = false



RegisterNetEvent('CTRPFW:Client:OnPlayerLoaded')
AddEventHandler('CTRPFW:Client:OnPlayerLoaded', function()
    isLoggedIn = true
end)

Citizen.CreateThread(function()
	while CTRPFW == nil do
		TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)
		Citizen.Wait(0)
	end
    while not isLoggedIn do 
        Citizen.Wait(1000)
    end
    
    local model = GetHashKey('vw_prop_vw_luckywheel_02a')
    local baseWheelModel = GetHashKey('vw_prop_vw_luckywheel_01a')

    Citizen.CreateThread(function()
        RequestModel(model)
        while not HasModelLoaded(model) do
            Citizen.Wait(0)
        end
        _wheel = CreateObject(model, 1111.05, 229.81, -50.38, false, false, true)
        SetEntityHeading(_wheel, 0.0)
        SetModelAsNoLongerNeeded(model)
    end)


end)

RegisterNetEvent("virus-luckywheel:doRoll")
AddEventHandler("virus-luckywheel:doRoll", function(_priceIndex) 
    _isRolling = true
    SetEntityHeading(_wheel, 76.0)
    SetEntityRotation(_wheel, 0.0, 0.0, 0.0, 1, true)
    Citizen.CreateThread(function()
        local speedIntCnt = 1
        local rollspeed = 1.0
        local _winAngle = (_priceIndex - 1) * 18
        local _rollAngle = _winAngle + (360 * 8)
        local _midLength = (_rollAngle / 2)
        local intCnt = 0
        while speedIntCnt > 0 do
            local retval = GetEntityRotation(_wheel, 1)
            if _rollAngle > _midLength then
                speedIntCnt = speedIntCnt + 1
            else
                speedIntCnt = speedIntCnt - 1
                if speedIntCnt < 0 then
                    speedIntCnt = 0
                    
                end
            end
            intCnt = intCnt + 1
            rollspeed = speedIntCnt / 10
            local _y = retval.y - rollspeed
            _rollAngle = _rollAngle - rollspeed
    
            SetEntityRotation(_wheel, 0.0, _y, 0.0, 1, true)

            Citizen.Wait(0)
        end
    end)
end)

RegisterNetEvent("virus-luckywheel:rollFinished")
AddEventHandler("virus-luckywheel:rollFinished", function() 
    _isRolling = false
end)

function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end 

function doRoll()
    if not _isRolling then
        TriggerServerEvent("CTRPFW:Server:RemoveItem", "wheelcoin", 1)
        _isRolling = true
        local playerPed = PlayerPedId()
        local _lib = 'anim_casino_a@amb@casino@games@lucky7wheel@female'
        if IsPedMale(playerPed) then
            _lib = 'anim_casino_a@amb@casino@games@lucky7wheel@male'
        end
        local lib, anim = _lib, 'enter_right_to_baseidle'
        loadAnimDict(lib)
        local _movePos = vector3(1109.41, 229.43, -49.64)
        TaskGoStraightToCoord(playerPed,  _movePos.x,  _movePos.y,  _movePos.z,  1.0,  -1,  253.79,  0.0)
        local _isMoved = false
        while not _isMoved do
            local coords = GetEntityCoords(PlayerPedId())
            if coords.x >= (_movePos.x - 0.01) and coords.x <= (_movePos.x + 0.01) and coords.y >= (_movePos.y - 0.01) and coords.y <= (_movePos.y + 0.01) then
                _isMoved = true
            end
            Citizen.Wait(0)
        end
        Citizen.Wait(1000)
        TaskPlayAnim(playerPed, lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
        while IsEntityPlayingAnim(playerPed, lib, anim, 3) do
            Citizen.Wait(0)
            DisableAllControlActions(0)
        end
        TaskPlayAnim(playerPed, lib, 'enter_to_armraisedidle', 8.0, -8.0, -1, 0, 0, false, false, false)
        while IsEntityPlayingAnim(playerPed, lib, 'enter_to_armraisedidle', 3) do
            Citizen.Wait(0)
            DisableAllControlActions(0)
        end
        TriggerServerEvent("virus-luckywheel:getLucky")
        TaskPlayAnim(playerPed, lib, 'armraisedidle_to_spinningidle_high', 8.0, -8.0, -1, 0, 0, false, false, false)
    end
end

Citizen.CreateThread(function()
	while true do
        Citizen.Wait(1)
        local coords = GetEntityCoords(PlayerPedId())
        DrawMarker(2, 1109.41, 229.43, -49.64, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.25, 0.2, 0.1, 255, 0, 0, 155, 0, 0, 0, 1, 0, 0, 0)
        if(GetDistanceBetweenCoords(coords, 1109.41, 229.43, -49.64, true) < 1.0) and not _isRolling then
            DrawText3Ds(1109.41, 229.43, -49.64 + 0.15, '~g~E~w~ - Start Lucky Wheel')
            if IsControlJustReleased(0, Keys['E']) then
                CTRPFW.Functions.TriggerCallback('ctrp-casino:server:virusVerify', function(HasItem, type)
                    if HasItem then
                        doRoll()
                    else
                        CTRPFW.Functions.Notify("You don't have rights to use due to lacks in requirement!", "error")
                    end
                end) 
            end
        end		
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
