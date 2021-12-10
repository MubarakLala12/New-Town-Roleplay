local radioMenu = false
local isLoggedIn = false
local onRadio = false
local RadioChannel = 0

RegisterNetEvent('CTRPFW:Client:OnPlayerLoaded')
AddEventHandler('CTRPFW:Client:OnPlayerLoaded', function()
    isLoggedIn = true
end)

RegisterNetEvent('CTRPFW:Client:OnPlayerUnload')
AddEventHandler('CTRPFW:Client:OnPlayerUnload', function()
    isLoggedIn = false
    leaveradio()
end)

RegisterNetEvent('ctrp-radio:use')
AddEventHandler('ctrp-radio:use', function()
    toggleRadio(not radioMenu)
end)

RegisterNetEvent('ctrp-radio:onRadioDrop')
AddEventHandler('ctrp-radio:onRadioDrop', function()
    if RadioChannel ~= 0 then
        leaveradio()
    end
end)

-- Main Thread

Citizen.CreateThread(function()
    while true do
        Wait(1000)
        if isLoggedIn and onRadio then
            CTRPFW.Functions.TriggerCallback('ctrp-radio:server:GetItem', function(hasItem)
                if not hasItem then
                    if RadioChannel ~= 0 then
                        leaveradio()
                    end
                end
            end,"radio")
        end
    end
end)

-- Functions

function connecttoradio(channel)
    RadioChannel = channel
    if onRadio then
        exports["pma-voice"]:setRadioChannel(0)
    else
        onRadio = true
        exports["pma-voice"]:setVoiceProperty("radioEnabled", true)
    end

    exports["pma-voice"]:setRadioChannel(channel)

    if SplitStr(tostring(channel), ".")[2] ~= nil and SplitStr(tostring(channel), ".")[2] ~= "" then
        CTRPFW.Functions.Notify(Config.messages['joined_to_radio'] ..channel.. ' MHz </b>', 'success')
    else
        CTRPFW.Functions.Notify(Config.messages['joined_to_radio'] ..channel.. '.00 MHz </b>', 'success')
    end
end

function leaveradio()
    RadioChannel = 0
    onRadio = false
    exports["pma-voice"]:setRadioChannel(0)
    exports["pma-voice"]:setVoiceProperty("radioEnabled", false)
    CTRPFW.Functions.Notify(Config.messages['you_leave'] , 'error')
end

function SplitStr(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t = {}
    for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
        table.insert(t, str)
    end
    return t
end
  
function IsRadioOn()
    return onRadio
end

exports("IsRadioOn", IsRadioOn)

-- NUI
RegisterNUICallback('joinRadio', function(data, cb)
    local rchannel = tonumber(data.channel)
    if rchannel ~= nil then
        if rchannel <= Config.MaxFrequency and rchannel ~= 0 then
            if rchannel ~= RadioChannel then
                if rchannel <= Config.RestrictedChannels then
                    local xPlayer = CTRPFW.Functions.GetPlayerData()
                    if (xPlayer.job.name == 'police' or xPlayer.job.name == 'ems' or xPlayer.job.name == 'doctor') and xPlayer.job.onduty then
                        connecttoradio(rchannel)
                    else
                        CTRPFW.Functions.Notify(Config.messages['restricted_channel_error'], 'error')
                    end
                else
                    connecttoradio(rchannel)
                end
            else
                CTRPFW.Functions.Notify(Config.messages['you_on_radio'] , 'error')
            end
        else
            CTRPFW.Functions.Notify(Config.messages['invalid_radio'] , 'error')
        end
    else
        CTRPFW.Functions.Notify(Config.messages['invalid_radio'] , 'error')
    end
end)

function toggleRadio(toggle)
    radioMenu = toggle
    SetNuiFocus(radioMenu, radioMenu)
    if radioMenu then
        PhonePlayIn()
        SendNUIMessage({type = "open"})
    else
        PhonePlayOut()
        SendNUIMessage({type = "close"})
    end
end

RegisterNUICallback('leaveRadio', function(data, cb)
    if RadioChannel == 0 then
        CTRPFW.Functions.Notify(Config.messages['not_on_radio'], 'error')
    else
        leaveradio()
    end
end)

RegisterNUICallback('escape', function(data, cb)
    toggleRadio(false)
end)
