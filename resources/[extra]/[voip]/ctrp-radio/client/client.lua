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

local radioMenu = false
local isLoggedIn = false

function enableRadio(enable)
  if enable then
    SetNuiFocus(enable, enable)
    PhonePlayIn()
    SendNUIMessage({
      type = "open",
    })
    radioMenu = enable
  end
end

RegisterNetEvent('CTRPFW:Client:OnPlayerLoaded')
AddEventHandler('CTRPFW:Client:OnPlayerLoaded', function()
    isLoggedIn = true
end)

RegisterNetEvent('CTRPFW:Client:OnPlayerUnload')
AddEventHandler('CTRPFW:Client:OnPlayerUnload', function()
    isLoggedIn = false
end)

Citizen.CreateThread(function()
  while true do
    if CTRPFW ~= nil then
      if isLoggedIn then
        CTRPFW.Functions.TriggerCallback('ctrp-radio:server:GetItem', function(hasItem)
          if not hasItem then
            if exports.tokovoip_script ~= nil and next(exports.tokovoip_script) ~= nil then
              local playerName = GetPlayerName(PlayerId())
              local getPlayerRadioChannel = exports.tokovoip_script:getPlayerData(playerName, "radio:channel")

              if getPlayerRadioChannel ~= "nil" then
                exports.tokovoip_script:removePlayerFromRadio(getPlayerRadioChannel)
                exports.tokovoip_script:setPlayerData(playerName, "radio:channel", "nil", true)
                CTRPFW.Functions.Notify('Your deleted out of the freqency!', 'error')
              end
            end
          end
        end, "radio")
      end
    end

    Citizen.Wait(10000)
  end
end)

RegisterNUICallback('joinRadio', function(data, cb)
  local _source = source
  local PlayerData = CTRPFW.Functions.GetPlayerData()
  local playerName = GetPlayerName(PlayerId())
  local getPlayerRadioChannel = exports.tokovoip_script:getPlayerData(playerName, "radio:channel")

  if tonumber(data.channel) <= Config.MaxFrequency then
    if tonumber(data.channel) ~= tonumber(getPlayerRadioChannel) then
      if tonumber(data.channel) <= Config.RestrictedChannels then
        if ((PlayerData.job.name == 'police' or PlayerData.job.name == "doctor") and PlayerData.job.onduty) then
          exports.tokovoip_script:removePlayerFromRadio(getPlayerRadioChannel)
          exports.tokovoip_script:setPlayerData(playerName, "radio:channel", tonumber(data.channel), true);
          exports.tokovoip_script:addPlayerToRadio(tonumber(data.channel), "Radio", "radio")
          if SplitStr(data.channel, ".")[2] ~= nil and SplitStr(data.channel, ".")[2] ~= "" then
            CTRPFW.Functions.Notify(Config.messages['joined_to_radio'] .. data.channel .. ' MHz </b>', 'success')
          else
            CTRPFW.Functions.Notify(Config.messages['joined_to_radio'] .. data.channel .. '.00 MHz </b>', 'success')
          end
        else
          CTRPFW.Functions.Notify(Config.messages['restricted_channel_error'], 'error')
        end
      end

      if tonumber(data.channel) == Config.RestrictedChannelsgov then
        if ((PlayerData.job.name == 'government') and PlayerData.job.onduty) then
          exports.tokovoip_script:removePlayerFromRadio(getPlayerRadioChannel)
          exports.tokovoip_script:setPlayerData(playerName, "radio:channel", tonumber(data.channel), true);
          exports.tokovoip_script:addPlayerToRadio(tonumber(data.channel), "Radio", "radio")
          if SplitStr(data.channel, ".")[2] ~= nil and SplitStr(data.channel, ".")[2] ~= "" then
            CTRPFW.Functions.Notify(Config.messages['joined_to_radio'] .. data.channel .. ' MHz </b>', 'success')
          else
            CTRPFW.Functions.Notify(Config.messages['joined_to_radio'] .. data.channel .. '.00 MHz </b>', 'success')
          end
        else
          CTRPFW.Functions.Notify(Config.messages['restricted_channel_error'], 'error')
        end
      end

      if tonumber(data.channel) > Config.RestrictedChannelsgov then
        exports.tokovoip_script:removePlayerFromRadio(getPlayerRadioChannel)
        exports.tokovoip_script:setPlayerData(playerName, "radio:channel", tonumber(data.channel), true);
        exports.tokovoip_script:addPlayerToRadio(tonumber(data.channel), "Radio", "radio")
        if SplitStr(data.channel, ".")[2] ~= nil and SplitStr(data.channel, ".")[2] ~= "" then
          CTRPFW.Functions.Notify(Config.messages['joined_to_radio'] .. data.channel .. ' MHz </b>', 'success')
        else
          CTRPFW.Functions.Notify(Config.messages['joined_to_radio'] .. data.channel .. '.00 MHz </b>', 'success')
        end
      end
    else
      if SplitStr(data.channel, ".")[2] ~= nil and SplitStr(data.channel, ".")[2] ~= "" then
        CTRPFW.Functions.Notify(Config.messages['you_on_radio'] .. data.channel .. ' MHz </b>', 'error')
      else
        CTRPFW.Functions.Notify(Config.messages['you_on_radio'] .. data.channel .. '.00 MHz </b>', 'error')
      end
    end
  else
    CTRPFW.Functions.Notify('This frequency is not available.', 'error')
  end
  cb('ok')
end)

RegisterNUICallback('leaveRadio', function(data, cb)
  local playerName = GetPlayerName(PlayerId())
  local getPlayerRadioChannel = exports.tokovoip_script:getPlayerData(playerName, "radio:channel")
  if getPlayerRadioChannel == "nil" then
    CTRPFW.Functions.Notify(Config.messages['not_on_radio'], 'error')
  else
    exports.tokovoip_script:removePlayerFromRadio(getPlayerRadioChannel)
    exports.tokovoip_script:setPlayerData(playerName, "radio:channel", "nil", true)
    if SplitStr(getPlayerRadioChannel, ".")[2] ~= nil and SplitStr(getPlayerRadioChannel, ".")[2] ~= "" then
      CTRPFW.Functions.Notify(Config.messages['you_leave'] .. getPlayerRadioChannel .. ' MHz </b>', 'error')
    else
      CTRPFW.Functions.Notify(Config.messages['you_leave'] .. getPlayerRadioChannel .. '.00 MHz </b>', 'error')
    end

  end
  cb('ok')
end)

RegisterNUICallback('escape', function(data, cb)
  SetNuiFocus(false, false)
  radioMenu = false
  PhonePlayOut()
  cb('ok')
end)

RegisterNetEvent('ctrp-radio:use')
AddEventHandler('ctrp-radio:use', function()
  enableRadio(true)
end)

RegisterNetEvent('ctrp-radio:onRadioDrop')
AddEventHandler('ctrp-radio:onRadioDrop', function()
  local playerName = GetPlayerName(PlayerId())
  local getPlayerRadioChannel = exports.tokovoip_script:getPlayerData(playerName, "radio:channel")

  if getPlayerRadioChannel ~= "nil" then
    exports.tokovoip_script:removePlayerFromRadio(getPlayerRadioChannel)
    exports.tokovoip_script:setPlayerData(playerName, "radio:channel", "nil", true)
    CTRPFW.Functions.Notify(Config.messages['you_leave'] .. getPlayerRadioChannel .. '.00 MHz </b>', 'error')
  end
end)

function SplitStr(inputstr, sep)
	if sep == nil then
			sep = "%s"
	end
	local t={}
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
			table.insert(t, str)
	end
	return t
end
