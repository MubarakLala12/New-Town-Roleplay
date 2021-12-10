
local inMenu = false

local keys = {
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

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        if CTRPFW == nil then
            TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)
            Citizen.Wait(200)
        end
    end
end)

local cardshowing = false

RegisterNetEvent("CTRPFW:Client:OnPlayerLoaded")
AddEventHandler("CTRPFW:Client:OnPlayerLoaded", function()
    Citizen.CreateThread(function()
        PlayerData = CTRPFW.Functions.GetPlayerData()
        while true do
            cardshowing = true
            Citizen.Wait(2500)
        end
    end)
end)

-- RegisterNetEvent("CTRPFW:Client:OnPlayerUnload")
-- AddEventHandler("CTRPFW:Client:OnPlayerUnload", function()
--     Citizen.CreateThread(function()
--         PlayerData = CTRPFW.Functions.GetPlayerData()
--         while true do
--             cardshowing = false
--             Citizen.Wait(2500)
--         end
--     end)
-- end)


RegisterNUICallback('close-btn', function()
	closeUI() 
end)

RegisterNUICallback('close-btn2', function()
	closeUI() 
end)



-- Close UI
function closeUI() 
	inMenu = false
	SetNuiFocus(false, false)
    SendNUIMessage({command = "close"})
	TriggerEvent('animations:client:EmoteCommandStart', {"c"})
end




Citizen.CreateThread(function()
	while true do
		Wait(0)
		if IsControlJustReleased(0, 322) and open or IsControlJustReleased(0, 177) and open then
			closeUI()
			inMenu = false
		end
	end
end)





-- Close menu on close
AddEventHandler('onResourceStop', function (resourceName)
	if (GetCurrentResourceName() ~= resourceName) then
	  return
    end
    if inMenu then
        closeUI()
    end
end)



local id = 0
local MugshotsCache = {}
local Answers = {}

function GetMugShotBase64(Ped,Tasparent)
	if not Ped then return end
	id = id + 1 
	
	local Handle
	
	if Tasparent then
		Handle = RegisterPedheadshotTransparent(Ped)
	else
		Handle = RegisterPedheadshot(Ped)
	end
	
	local timer = 2000
	while ((not Handle or not IsPedheadshotReady(Handle) or not IsPedheadshotValid(Handle)) and timer > 0) do
		Citizen.Wait(10)
		timer = timer - 10
	end

	local MugShotTxd = 'none'
	if (IsPedheadshotReady(Handle) and IsPedheadshotValid(Handle)) then
		MugshotsCache[id] = Handle
		MugShotTxd = GetPedheadshotTxdString(Handle)
	end

	SendNUIMessage({
		type = 'convert',
		pMugShotTxd = MugShotTxd,
		id = id,
	})
	
	while not Answers[id] do
		Citizen.Wait(10)
	end
	
	if MugshotsCache[id] then
		UnregisterPedheadshot(MugshotsCache[id])
		MugshotsCache[id] = nil
	end
	
	local CallBack = Answers[id]
	Answers[id] = nil
	
	return CallBack
end

local noobphoto = nil

RegisterNUICallback('Answer', function(data)
	Answers[data.Id] = data.Answer
	noobphoto = data.Answer

end)




AddEventHandler('onResourceStop', function(resourceName)
  if (GetCurrentResourceName() ~= resourceName) then
    return
  end
  for k,v in pairs(MugshotsCache) do
	UnregisterPedheadshot(v)
  end
end)


RegisterNetEvent('virus-idcard:client:open')
AddEventHandler('virus-idcard:client:open', function(sourceId,csn, name, name2, birth, gender, national, photo)
    
	if cardshowing == true then
		inMenu = true
		SetNuiFocus(true, true)
		TriggerEvent('virus:Client:phonebandh')

		--local canvas = GetMugShotBase64(GetPlayerPed(GetPlayerFromServerId(sourceId)), false)
		--print(canvas)
		--print(photo)
		SendNUIMessage({
			command = "open",
			name = name,
			name2 = name2,
			birth = birth,
			gender = gender,
			csn = csn,
			canvas = photo,	
    	})
	end
	
end)

RegisterNetEvent('virus-idcard:client:driveropen')
AddEventHandler('virus-idcard:client:driveropen', function(sourceId,csn, name, name2, birth, gender, national, photo)
    
    if cardshowing == true then
		inMenu = true
		SetNuiFocus(true, true)
		TriggerEvent('virus:Client:phonebandh')

		--local canvas = GetMugShotBase64(GetPlayerPed(GetPlayerFromServerId(sourceId)), false)
		--print(canvas)
		--print(photo)
		SendNUIMessage({
			command = "driveropen",
			name = name,
			name2 = name2,
			birth = birth,
			gender = gender,
			csn = csn,
			canvas = photo,
        
    	})
	end
end)
