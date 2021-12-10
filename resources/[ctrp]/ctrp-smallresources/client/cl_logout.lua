-------------------------DEVELOPED BY VIRUS-----------------------------------------

--------------------
-- CTRPFW Core Stuff --
--------------------
CTRPFW = nil

Citizen.CreateThread(function()
    while CTRPFW == nil do
        TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)
        Citizen.Wait(200)
    end
end)

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
  

-------------------------
--Written by VIRUS
-------------------------
------------------CONFIG----------------------
local byeX = -212.08  --starting
local byeY = -1033.77
local byeZ = 30.14

local bye2X = 475.63  --starting
local bye2Y = -980.67
local bye2Z = 30.69

local bye3X = 332.89  --starting
local bye3Y = -568.85
local bye3Z = 43.28

local bye4X = 437.87 --starting
local bye4Y = -624.34
local bye4Z = 28.71

local bye5X = 82.59 --starting
local bye5Y = 6421.85
local bye5Z = 31.68

local bye6X = -1290.18 --starting
local bye6Y = -564.97
local bye6Z = 41.23



Citizen.CreateThread(function()
	local byec = AddBlipForCoord(byeX, byeY, byeZ)
		SetBlipSprite (byec, 430)
		SetBlipDisplay(byec, 4)
		SetBlipScale  (byec, 0.75)
		SetBlipColour (byec, 0)
		SetBlipAsShortRange(byec, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('Train Station')
		EndTextCommandSetBlipName(byec)
end)






------------------DEVELOPED BY VIRUS-----------------------------------------
---------------------
-- Citizen --
---------------------

Citizen.CreateThread(function()
    while true do
	Citizen.Wait(0)
		local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
		local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, byeX, byeY, byeZ)
---


		
		if dist <= 1.0 then
		DrawText3D(byeX, byeY, byeZ, "~g~[E]~w~ To LOGOUT")
		end
--
		if dist <= 1.0 then
			if IsControlJustPressed(0, Keys['E']) then -- "E"
				TriggerServerEvent('virus-stations:server:LogoutLocation')
			end			
		end
	end
end)

Citizen.CreateThread(function()
    while true do
	Citizen.Wait(0)
		local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
		local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, bye2X, bye2Y, bye2Z)
---


		
		if dist <= 1.0 then
		DrawText3D(bye2X, bye2Y, bye2Z, "~g~[E]~w~ To LOGOUT")
		end
--
		if dist <= 1.0 then
			if IsControlJustPressed(0, Keys['E']) then -- "E"
				TriggerServerEvent('virus-stations:server:LogoutLocation')
			end			
		end
	end
end)

Citizen.CreateThread(function()
    while true do
	Citizen.Wait(0)
		local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
		local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, bye3X, bye3Y, bye3Z)
---


		
		if dist <= 1.0 then
		DrawText3D(bye3X, bye3Y, bye3Z, "~g~[E]~w~ To LOGOUT")
		end
--
		if dist <= 1.0 then
			if IsControlJustPressed(0, Keys['E']) then -- "E"
				TriggerServerEvent('virus-stations:server:LogoutLocation')
			end			
		end
	end
end)

Citizen.CreateThread(function()
    while true do
	Citizen.Wait(0)
		local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
		local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, bye4X, bye4Y, bye4Z)
---


		
		if dist <= 1.0 then
		DrawText3D(bye4X, bye4Y, bye4Z, "~g~[E]~w~ To LOGOUT")
		end
--
		if dist <= 1.0 then
			if IsControlJustPressed(0, Keys['E']) then -- "E"
				TriggerServerEvent('virus-stations:server:LogoutLocation')
			end			
		end
	end
end)

Citizen.CreateThread(function()
    while true do
	Citizen.Wait(0)
		local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
		local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, bye5X, bye5Y, bye5Z)
---


		
		if dist <= 1.0 then
		DrawText3D(bye5X, bye5Y, bye5Z, "~g~[E]~w~ To LOGOUT")
		end
--
		if dist <= 1.0 then
			if IsControlJustPressed(0, Keys['E']) then -- "E"
				TriggerServerEvent('virus-stations:server:LogoutLocation')
			end			
		end
	end
end)

Citizen.CreateThread(function()
    while true do
	Citizen.Wait(0)
		local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
		local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, bye6X, bye6Y, bye6Z)
---


		
		if dist <= 1.0 then
		DrawText3D(bye6X, bye6Y, bye6Z, "~g~[E]~w~ To LOGOUT")
		end
--
		if dist <= 1.0 then
			if IsControlJustPressed(0, Keys['E']) then -- "E"
				TriggerServerEvent('virus-stations:server:LogoutLocation')
			end			
		end
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
