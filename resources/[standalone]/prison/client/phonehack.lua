-------------------LOCAL KEY------------------------------------------------------------------------------------------------------------------------------------
local Keys = {
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

CTRPFW = nil 

local Vcacbins = {}

Citizen.CreateThread(function()
    while CTRPFW == nil do
        TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)
        Citizen.Wait(200)
    end
	
	while CTRPFW.Functions.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end
    PlayerData = CTRPFW.Functions.GetPlayerData()
    
end)

RegisterNetEvent('CTRPFW:Client:OnPlayerLoaded')
AddEventHandler('CTRPFW:Client:OnPlayerLoaded', function()
    CTRPFW.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
        PlayerData = CTRPFW.Functions.GetPlayerData()
    end)
end)

RegisterNetEvent('CTRPFW:Client:OnJobUpdate')
AddEventHandler('CTRPFW:Client:OnJobUpdate', function(JobInfo)
    PlayerData.job = JobInfo
end)

function hintToDisplay(text)
	SetTextComponentFormat("STRING")
	AddTextComponentString(text)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function DrawText3D2(x, y, z, text)
  
    local onScreen,_x,_y=World3dToScreen2d(x, y, z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 100)
end


local isProcessing = false

Citizen.CreateThread(function()
    Citizen.Wait(10)

    while true do
        local sleepThread = 1000
        local pCoords = GetEntityCoords(PlayerPedId())
        local tableObj = GetClosestObjectOfType(pCoords, 0.8, `p_phonebox_01b_s`, false, false, false)
        local text = GetOffsetFromEntityInWorldCoords(tableObj, 0.0, 0.0, 0.0)
        
        if tableObj ~= 0 then
           
          
            sleepThread = 7
            local PlayerPed = PlayerPedId()
            local PlayerPos = GetEntityCoords(PlayerPed)
            local binCoords = GetEntityCoords(tableObj)
            
            DrawText3D2(text.x, text.y, text.z+0.9,"~g~[E]~w~ Robbery ~r~(PHONE) ~w~")
            if IsControlJustReleased(0, Keys['E']) then
                local virusCheckitem = 'wire'
                local hasItem = false
				local s1 = false
                CTRPFW.Functions.TriggerCallback('CTRPFW:HasItem', function(result)
					hasItem = result
					s1 = true
                end, virusCheckitem)
                
                while(not s1) do
					Citizen.Wait(100)
                end

                if (hasItem) then
                    if not Vcacbins[tableObj] then
                        Vcacbins[tableObj] = true
                        CTRPFW.Functions.Notify("Attention signal to the police sent","error", 3000)
                        step1()

                    else
                        CTRPFW.Functions.Notify("You\'ve already broken into this phone","error", 3000)
                    end

                else
                    CTRPFW.Functions.Notify("You don\'t have the tool to break in","error", 3000)
                end


            end
           
        end
       
        Citizen.Wait(sleepThread)
    end
end)

function LoadDict2(dict)
    RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
	  	Citizen.Wait(10)
    end
end

function step1()
    isProcessing = true
    
    LoadDict2('amb@prop_human_parking_meter@male@idle_a')
    TaskPlayAnim(GetPlayerPed(-1), 'amb@prop_human_parking_meter@male@idle_a', 'idle_a', 8.0, -8.0, -1, 1, 0.0, 0, 0, 0)
    
   CTRPFW.Functions.Progressbar("search_register", "Robbery in progress..", 20000, false, true, {
       disableMovement = true,
       disableCarMovement = true,
       disableMouse = false,
       disableCombat = true,
       disableInventory = true,
   }, {}, {}, {}, function()
                   

   LoadDict2('amb@prop_human_parking_meter@male@exit')
   TaskPlayAnim(GetPlayerPed(-1), 'amb@prop_human_parking_meter@male@exit', 'exit', 8.0, -8.0, -1, 1, 0.0, 0, 0, 0)
   ClearPedTasks(GetPlayerPed(-1))
       local timeLeft = 1000 * 1 / 1000

       while timeLeft > 0 do
           Citizen.Wait(1000)
           timeLeft = timeLeft - 1
            TriggerServerEvent("prison:virus:phone")
           
       end
   
       ClearPedTasks(GetPlayerPed(-1))
   end, function()
       ClearPedTasks(GetPlayerPed(-1))
   end)
 

   ClearPedTasks(GetPlayerPed(-1))
  isProcessing = false
end

