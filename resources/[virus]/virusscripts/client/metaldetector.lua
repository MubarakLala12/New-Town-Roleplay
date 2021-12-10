---------VIRUS--------------

local weapons = {
	
    'WEAPON_PISTOL',
    'WEAPON_NIGHTSTICK',
	'WEAPON_HAMMER',
	'WEAPON_BAT',
	'WEAPON_HATCHET',
	'WEAPON_MACHETE',
	'WEAPON_SWITCHBLADE',
    'WEAPON_BATTLEAXE',
 	'WEAPON_PISTOL_MK2',
	'WEAPON_COMBATPISTOL',
	'WEAPON_APPISTOL',
	'WEAPON_PISTOL50',
	'WEAPON_REVOLVER',
	'WEAPON_SNSPISTOL',
	'WEAPON_HEAVYPISTOL',
	'WEAPON_VINTAGEPISTOL',
    'WEAPON_MICROSMG',
    'WEAPON_KNIFE',
    'radio',
    'metalscrap',
    
	
}

------------WEAPON COUNT---------------------------------------------------

local weaponamount = 18 --------------ATTENTION WRITE AMOUNT LIST WEAPON

--------------------------------------------------------------------------


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
--------------------------------------------------------------------------------------------------------------------------------------------------------------

local CurrentWeaponData = {}
local currentWeapon = nil
local arma = ''
local hasBagd = false
local s1d = false
local count = true
local test = true
local mio = true
-- CTRPFW = nil 
PlayerJob = {}
------------------------------------------------CORE---------------------------------

-- Citizen.CreateThread(function()
--     while CTRPFW == nil do
--         TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)
--         Citizen.Wait(200)
--     end
	
	
-- end)

----------------onload player--------------------------------------------------------
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
-------------------------------------------------------------------------------------

------------------------------------TEXT DRAW3D-----------------------------------
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
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 0)
end
----------------------------------------------------------------------------------

-------------------------------------------METALDETECTORS--------------------------------------------------------------
Citizen.CreateThread(function()
    while true do

        --local sleepThread = 500

        local ped = PlayerPedId()
        local pedCoords = GetEntityCoords(ped, 0)

       if PlayerJob.name ~= nil then 

            for detector, v in pairs(Config.Detectors) do

                local distanceCheck = GetDistanceBetweenCoords(pedCoords, v.x, v.y, v.z, true)

                if distanceCheck <= 2.0 then

                    
                    if distanceCheck <= 1.5 then           
                       
                                if count then
                              
                                    CheckWeapon()

                                elseif PlayerJob.name == "police" then
                                    TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 15, "detector", 0.0)
                                                        
                                end
                            

                    else
                       
                        count = true
                        test = true
                    end

                else
                    count = true
                    test = true
                
                end 
           
            end

        elseif PlayerJob.name == "police" then
            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 15, "detector", 0.0)

       
        end

        Citizen.Wait(100)

    end
end)


function CheckWeapon()
    
for i = 1, #weapons do
   
        arma = weapons[i]
        Citizen.Wait(0)
    if test then
     
       CTRPFW.Functions.TriggerCallback('CTRPFW:HasItem', function(result)
        hasBagd = result
        s1d = true

        end, arma)

             while(not s1d) do
                     Citizen.Wait(1)
             end

             if (hasBagd) then
                if PlayerJob.name == "police" then
                    TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 15, "detector", 0.0)
                else
                    count = false
                     test = false
                    TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 15, "detector", 0.1)
                
                     Citizen.Wait(5000)
                end
                     
             end
    end 
   
    if i >= weaponamount then

        count = false
       
    end


end
    Citizen.Wait(0)

end

--[[
Citizen.CreateThread(function()
    while true do

        

        local ped = PlayerPedId()
        local pedCoords = GetEntityCoords(ped, 0)

       if PlayerData.job ~= nil and PlayerData.job.name ~= "police" then ---------add job to esclude

            for detector, v in pairs(Config.Detectors) do

                local distanceCheck = GetDistanceBetweenCoords(pedCoords, v.x, v.y, v.z, true)

                if distanceCheck <= 1.7 then

                else
                   -- count = true
                  --  test = true
                end

                if distanceCheck <= 3.0 then

                    DrawText3D2( v.x, v.y, v.z+0.7, "Metal Detector")
               
                end
                

            end
        else
       --     sleepThread = 1500
        end

        Citizen.Wait(1)

    end
end)
]]--

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)

        local plyCoords = GetEntityCoords(PlayerPedId(), false)
        local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, Config.craft1X, Config.craft1Y, Config.craft1Z)
        local dist2 = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, 433.68, -981.91, 30.71)
       
        local vehicled = GetVehiclePedIsIn(PlayerPedId(), true)
        local playerPeds = PlayerPedId()
        local name = GetPlayerName(PlayerId())
        
        
		if dist <= 15 then
			DrawMarker(2, Config.craft1X, Config.craft1Y, Config.craft1Z+ 0.7, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 50, 155, 255, 155, false, false, false, true, false, false, false)
           
        end
        if dist <= 2.0 then
		    if GetPedInVehicleSeat(vehicled, -1) == PlayerPedId() then
            else
               
                -------------creo il testo-------------------------------------------------
                DrawText3D2(Config.craft1X, Config.craft1Y, Config.craft1Z+0.9, Config.Text)
                ---------------------------------------------------------------------------
                
                if IsControlJustPressed(0, Keys['G']) then 
                TriggerEvent("inventory:client:SetCurrentStash", "Secstash_"..CTRPFW.Functions.GetPlayerData().citizenid)
                TriggerServerEvent("inventory:server:OpenInventory", "stash", "Secstash_"..CTRPFW.Functions.GetPlayerData().citizenid, {
                maxweight = 4000000,
                slots = 15,
                 })   
                 count = true
                 test = true
                 hasBagd = false
                end

                -----------------------------------------------fine pressione tasto-----------------------------------------------
               
            end
            -----------------------------------------------fine controllo se sono in  macchina---------------------------------------
		
		end	
        ---------------------------------------------------fine ingresso marker 1-------------------------------------------------------

    end
    -------fine while-------------------------------------------------------------------------------------------------
end)
