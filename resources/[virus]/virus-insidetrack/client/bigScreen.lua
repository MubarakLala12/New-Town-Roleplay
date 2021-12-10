CTRPFW = nil
Citizen.CreateThread(function()
    while CTRPFW == nil do
        TriggerEvent("CTRPFW:GetObject", function(obj) CTRPFW = obj end)
    end
end)

local isLoggedIn = false 

RegisterNetEvent('CTRPFW:Client:OnPlayerLoaded')
AddEventHandler('CTRPFW:Client:OnPlayerLoaded', function()
    isLoggedIn = true
    loadBigScreen()
end)

local screenTarget, bigScreenScaleform = -1, -1
local bigScreenCoords = vector3(1090.95, 264.87, -49.84)
local bigScreenRender, isBigScreenLoaded = false, false



function registerTarget(name, objectModel)
    if not IsNamedRendertargetRegistered(name) then
        RegisterNamedRendertarget(name, false)
        LinkNamedRendertarget(objectModel)
    end

    return GetNamedRendertargetRenderId(name)
end

function loadBigScreen()
    screenTarget = registerTarget("casinoscreen_02", `vw_vwint01_betting_screen`)
    bigScreenScaleform = RequestScaleformMovie('HORSE_RACING_WALL')

    while not HasScaleformMovieLoaded(bigScreenScaleform) do
        Wait(0)
    end

    BeginScaleformMovieMethod(bigScreenScaleform, 'SHOW_SCREEN')
    ScaleformMovieMethodAddParamInt(0)
    EndScaleformMovieMethod()

    Citizen.InvokeNative(0xE6A9F00D4240B519, bigScreenScaleform, true)
    Utils.AddHorses(bigScreenScaleform)

    isBigScreenLoaded = true
end

function Utils:HandleBigScreen()
    while not self.InsideTrackActive do
        Wait(0)

        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local distance = #(playerCoords - bigScreenCoords)

        if (distance <= 30.0) then
            if not isBigScreenLoaded then
                loadBigScreen()
            end

            if not bigScreenRender then
                bigScreenRender = true
            end

            SetTextRenderId(screenTarget)
            SetScriptGfxDrawOrder(4)
            SetScriptGfxDrawBehindPausemenu(true)
            DrawScaleformMovieFullscreen(bigScreenScaleform, 255, 255, 255, 255)
            SetTextRenderId(GetDefaultScriptRendertargetRenderId())
        elseif bigScreenRender then
            bigScreenRender = false
            isBigScreenLoaded = false

            ReleaseNamedRendertarget("casinoscreen_02")
            SetScaleformMovieAsNoLongerNeeded(bigScreenScaleform)
        end
    end
end

Citizen.CreateThread(function()
    if not Utils.EnableBigScreen then
        return
    end
    
    Utils:HandleBigScreen()
end)