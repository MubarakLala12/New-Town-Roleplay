CTRPFW = nil

Citizen.CreateThread(function()
  while CTRPFW == nil do
      TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)
      Citizen.Wait(200)
  end
end)

local GuiOpened = false
local RadioChannel = nil
local Emergency = false

RegisterNetEvent('radioGui')
AddEventHandler('radioGui', function()
  openGui()
end)

RegisterNetEvent('ChannelSet')
AddEventHandler('ChannelSet', function(chan)
  SendNUIMessage({set = true, setChannel = chan})
end)

RegisterNetEvent('radio:resetNuiCommand')
AddEventHandler('radio:resetNuiCommand', function()
    SendNUIMessage({reset = true})
end)

RegisterNetEvent('radio:leave')
AddEventHandler('radio:leave', function()
	exports["pma-voice"]:removePlayerFromRadio()
	exports["pma-voice"]:setRadioChannel(0)
end)

function openGui()
  local radio = hasRadio()
  local job = CTRPFW.Functions.GetPlayerData().job.name
  if job == "police" then
    Emergency = true
  elseif job == "ambulance" then
    Emergency = true
  elseif job == "doctor" then
    Emergency = true
  end

  if not GuiOpened and radio then
    GuiOpened = true
    SetNuiFocus(false,false)
    SetNuiFocus(true,true)
    SendNUIMessage({open = true, jobType = Emergency})
  else
    GuiOpened = false
    SetNuiFocus(false,false)
    SendNUIMessage({open = false, jobType = Emergency})
  end

  TriggerEvent("animation:radio",GuiOpened)
end


function hasRadio()
  local retval = nil

  CTRPFW.Functions.TriggerCallback('CTRPFW:HasItem', function(result)
    retval = result
  end, 'radio')

  while retval == nil do
    Wait(1)
  end

  return retval
end

Citizen.CreateThread(function()
  while true do
    if CTRPFW ~= nil then
      if isLoggedIn then
        CTRPFW.Functions.TriggerCallback('radio:server:GetItem', function(hasItem)
          if not hasItem then
              exports["pma-voice"]:setRadioChannel(0)
              exports["pma-voice"]:removePlayerFromRadio()
              CTRPFW.Functions.Notify('You are removed from your current frequency!', 'error')
          end
        end, "radio")
      end
    end
    Citizen.Wait(10000)
  end
end)

RegisterNUICallback('click', function(data, cb)
  PlaySound(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
end)

RegisterNUICallback('volumeUp', function(data, cb)
  local radioVol = exports["pma-voice"]:getRadioVolume("micClickVolume")
  local newVol = ((radioVol and tonumber(radioVol)) or 0.01) + 0.01
  exports["pma-voice"]:setVoiceProperty("micClickVolume", newVol)
  exports["pma-voice"]:setRadioVolume(newVol, RadioChannel)
  CTRPFW.Functions.Notify('Volume: ' .. tostring(newVol*100), 'success')
end)

RegisterNUICallback('volumeDown', function(data, cb)
  local radioVol = exports["pma-voice"]:getRadioVolume("micClickVolume")
  local newVol = ((radioVol and tonumber(radioVol)) or 0.01) - 0.01
  exports["pma-voice"]:setVoiceProperty("micClickVolume", newVol)
  exports["pma-voice"]:setRadioVolume(newVol, RadioChannel)
  CTRPFW.Functions.Notify('Volume: ' .. tostring(newVol*100), 'success')
end)

RegisterNUICallback('cleanClose', function(data, cb)
  TriggerEvent("InteractSound_CL:PlayOnOne","radioclick",0.6)
  GuiOpened = false
  SetNuiFocus(false,false)
  SendNUIMessage({open = false})
  TriggerEvent("animation:radio",GuiOpened)
end)

RegisterNUICallback('poweredOn', function(data, cb)
  if RadioChannel ~= nil then
    TriggerEvent("InteractSound_CL:PlayOnOne","radioclick",0.6)
    exports["pma-voice"]:setVoiceProperty("radioEnabled", true)
    exports["pma-voice"]:setRadioChannel(RadioChannel)
    exports["pma-voice"]:setVoiceProperty("micClickVolume", 0.5)
    exports["pma-voice"]:setRadioVolume(0.5, RadioChannel)
    CTRPFW.Functions.Notify('You turned on the radio', 'success')
  end
end)

RegisterNUICallback('poweredOff', function(data, cb)
  CTRPFW.Functions.Notify('You turned off the radio', 'error')
  exports["pma-voice"]:setRadioChannel(0)
  exports["pma-voice"]:removePlayerFromRadio()
end)

RegisterNUICallback('close', function(data, cb)
  TriggerEvent("InteractSound_CL:PlayOnOne","radioclick",0.6)
  local newChannel = tonumber(data.channel)
  
  if newChannel == nil then
    newChannel = 0
  end
  

  if newChannel == 0 then
    exports["pma-voice"]:setRadioChannel(0)
    exports["pma-voice"]:removePlayerFromRadio()
    CTRPFW.Functions.Notify('You can\'t join this channel', 'error')
  else
    RadioChannel = newChannel
    exports["pma-voice"]:SetRadioChannel(RadioChannel)
    CTRPFW.Functions.Notify('Joined radio channel ' .. tostring(RadioChannel), 'error')
  end

  GuiOpened = false
  SetNuiFocus(false,false)
  SendNUIMessage({open = false})
  TriggerEvent("animation:radio",GuiOpened)
end)

attachedPropRadio = 0
function removeAttachedPropRadio()
	if DoesEntityExist(attachedPropRadio) then
		DeleteEntity(attachedPropRadio)
		attachedPropRadio = 0
	end
end

function attachPropRadio()
  removeAttachedPropRadio()
	attachModelRadio = GetHashKey("prop_cs_hand_radio")
	SetCurrentPedWeapon(PlayerPedId(), 0xA2719263)
	local bone = GetPedBoneIndex(PlayerPedId(), 57005)
	--local x,y,z = table.unpack(GetEntityCoords(PlayerPedId(), true))
	RequestModel(attachModelRadio)
	while not HasModelLoaded(attachModelRadio) do
		Citizen.Wait(100)
	end
	attachedPropRadio = CreateObject(attachModelRadio, 1.0, 1.0, 1.0, 1, 1, 0)
	AttachEntityToEntity(attachedPropRadio, PlayerPedId(), bone, 0.1, 0.01, -0.02, 110.0, 120.0, -15.0, 1, 0, 0, 0, 2, 1)
end

RegisterNetEvent('animation:radio')
AddEventHandler('animation:radio', function(enable)
  removeAttachedPropRadio()
  local lPed = PlayerPedId()
  inPhone = enable

  RequestAnimDict("cellphone@")
  while not HasAnimDictLoaded("cellphone@") do
    Citizen.Wait(0)
  end

  TaskPlayAnim(lPed, "cellphone@", "cellphone_text_in", 2.0, 3.0, -1, 49, 0, 0, 0, 0)

  Citizen.Wait(300)
  if inPhone then
    attachPropRadio()
    Citizen.Wait(150)
    while inPhone do

      local dead = CTRPFW.Functions.GetPlayerData().metadata["isdead"]
      if dead then
        closeGui()
        inPhone = false
      end

      if not IsEntityPlayingAnim(lPed, "cellphone@", "cellphone_text_read_base", 3) and not IsEntityPlayingAnim(lPed, "cellphone@", "cellphone_swipe_screen", 3) then
        TaskPlayAnim(lPed, "cellphone@", "cellphone_text_read_base", 2.0, 3.0, -1, 49, 0, 0, 0, 0)
      end    
      Citizen.Wait(1)
    end
    ClearPedTasks(PlayerPedId())
  else
      Citizen.Wait(100)
      ClearPedTasks(PlayerPedId())
      TaskPlayAnim(lPed, "cellphone@", "cellphone_text_out", 2.0, 1.0, 5.0, 49, 0, 0, 0, 0)
      Citizen.Wait(400)
      removeAttachedPropRadio()
      Citizen.Wait(400)
      ClearPedTasks(PlayerPedId())
  end
  removeAttachedPropRadio()
end)

Citizen.CreateThread(function()

  while true do
    if GuiOpened then
      Citizen.Wait(1)
      DisableControlAction(0, 1, GuiOpened) -- LookLeftRight
      DisableControlAction(0, 2, GuiOpened) -- LookUpDown
      DisableControlAction(0, 14, GuiOpened) -- INPUT_WEAPON_WHEEL_NEXT
      DisableControlAction(0, 15, GuiOpened) -- INPUT_WEAPON_WHEEL_PREV
      DisableControlAction(0, 16, GuiOpened) -- INPUT_SELECT_NEXT_WEAPON
      DisableControlAction(0, 17, GuiOpened) -- INPUT_SELECT_PREV_WEAPON
      DisableControlAction(0, 99, GuiOpened) -- INPUT_VEH_SELECT_NEXT_WEAPON
      DisableControlAction(0, 100, GuiOpened) -- INPUT_VEH_SELECT_PREV_WEAPON
      DisableControlAction(0, 115, GuiOpened) -- INPUT_VEH_FLY_SELECT_NEXT_WEAPON
      DisableControlAction(0, 116, GuiOpened) -- INPUT_VEH_FLY_SELECT_PREV_WEAPON
      DisableControlAction(0, 142, GuiOpened) -- MeleeAttackAlternate
      DisableControlAction(0, 106, GuiOpened) -- VehicleMouseControlOverride
      DisablePlayerFiring(PlayerId(), true) -- Disable NUI Combat
    else
      Citizen.Wait(20)
    end    
  end
end)