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

scanId = 0
cityRobbery = false
local myspawns = {}
virussecuritycamCamLocations = {
	[1] =  { ['x'] = -1292.75,['y'] = -573.22,['z'] = 31.57,['h'] = 307.29, ['info'] = ' Cam1', ["recent"] = false },
	[2] =  { ['x'] = -1294.07,['y'] = -574.11,['z'] = 31.37,['h'] = 133.67, ['info'] = ' Cam2', ["recent"] = false },
	[3] =  { ['x'] = -1285.18,['y'] = -582.95,['z'] = 31.62,['h'] = 172.71, ['info'] = ' Cam3', ["recent"] = false },
	[4] =  { ['x'] = -1276.07,['y'] = -583.63,['z'] = 31.09,['h'] = 77.89, ['info'] = ' Cam4', ["recent"] = false },
	[5] =  { ['x'] = -1286.61,['y'] = -592.65,['z'] = 31.02,['h'] = 1.13, ['info'] = ' Cam5', ["recent"] = false },
	[6] =  { ['x'] = -1296.04,['y'] = -570.26,['z'] = 31.29,['h'] = 76.72, ['info'] = ' Cam6', ["recent"] = false },
	[7] =  { ['x'] = -1308.73,['y'] = -566.16,['z'] = 31.07,['h'] = 277.81, ['info'] = ' Cam7', ["recent"] = false },
	[8] =  { ['x'] = -1303.59,['y'] = -555.76,['z'] = 31.12,['h'] = 92.19, ['info'] = ' Cam8', ["recent"] = false },
	[9] =  { ['x'] = -1297.03,['y'] = -580.09,['z'] = 37.38,['h'] = 315.1, ['info'] = ' Cam9', ["recent"] = false },
	[10] =  { ['x'] = -1282.45,['y'] = -588.93,['z'] = 37.42,['h'] = 353.48, ['info'] = ' Cam10', ["recent"] = false },
	[11] =  { ['x'] = -1285.86,['y'] = -570.4,['z'] = 41.19,['h'] = 81.86, ['info'] = ' Cam11', ["recent"] = false },
	[12] =  { ['x'] = -1288.65,['y'] = -566.8,['z'] = 41.19,['h'] = 172.23, ['info'] = ' Cam12', ["recent"] = false },
	[13] =  { ['x'] = -1286.24,['y'] = -586.85,['z'] = 23.01,['h'] = 68.28, ['info'] = ' Cam13', ["recent"] = false },
	[14] =  { ['x'] = -1293.15,['y'] = -592.96,['z'] = 23.01,['h'] = 10.69, ['info'] = ' Cam14', ["recent"] = false },
	[15] =  { ['x'] = -1304.51,['y'] = -557.77,['z'] = 21.89,['h'] = 183.3, ['info'] = ' Cam15', ["recent"] = false },
	[16] =  { ['x'] = -1309.69,['y'] = -573.42,['z'] = 21.89,['h'] = 355.84, ['info'] = ' Cam16', ["recent"] = false },
	
}

CTRPFW = nil 


-----------------------------VIRUS---------------------------------

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


RegisterCommand("govcam", function (source, args, rawCommand)

	local cam = args[1]

	if PlayerData.job ~= nil and (PlayerData.job.name == "mayor" or PlayerData.job.name == "govem" or PlayerData.job.name == "governor" or PlayerData.job.name == "secretery" or PlayerData.job.name == "statet" or PlayerData.job.name == "stateacc" or PlayerData.job.name == "securityhead" or PlayerData.job.name == "security") then
		TriggerEvent('virus-securitycam:camera', cam)
	end

end)

inCam = false
virussecuritycamCam = 0
RegisterNetEvent("virus-securitycam:camera")
AddEventHandler("virus-securitycam:camera", function(camNumber)
	camNumber = tonumber(camNumber)
	if inCam then
		inCam = false
		PlaySoundFrontend(-1, "HACKING_SUCCESS", false)
		-- TriggerEvent('animation:tablet',false)
		Wait(250)
		ClearPedTasks(GetPlayerPed(-1))
	else
		if camNumber > 0 and camNumber < #virussecuritycamCamLocations+1 then
			PlaySoundFrontend(-1, "HACKING_SUCCESS", false)
			TriggerEvent("virus-securitycam:startcamera",camNumber)
		else
			CTRPFW.Functions.Notify("This camera appears to be faulty", "error")
		end
	end
end)

RegisterNetEvent("virus-securitycam:startcamera")
AddEventHandler("virus-securitycam:startcamera", function(camNumber)

	-- TriggerEvent('animation:tablet',true)
	local camNumber = tonumber(camNumber)
	local x = virussecuritycamCamLocations[camNumber]["x"]
	local y = virussecuritycamCamLocations[camNumber]["y"]
	local z = virussecuritycamCamLocations[camNumber]["z"]
	local h = virussecuritycamCamLocations[camNumber]["h"]

	print("Starting VIRUS OP Cam")
	inCam = true

	SetTimecycleModifier("heliGunCam")
	SetTimecycleModifierStrength(1.0)
	local scaleform = RequestScaleformMovie("mp_big_message_freemode")
	while not HasScaleformMovieLoaded(scaleform) do
		Citizen.Wait(0)
	end

	local lPed = GetPlayerPed(-1)
	virussecuritycamCam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
	SetCamCoord(virussecuritycamCam,x,y,z+1.2)						
	SetCamRot(virussecuritycamCam, -15.0,0.0,h)
	SetCamFov(virussecuritycamCam, 110.0)
	RenderScriptCams(true, false, 0, 1, 0)
	PushScaleformMovieFunction(scaleform, "PLAY_CAM_MOVIE")
	SetFocusArea(x, y, z, 0.0, 0.0, 0.0)
	PopScaleformMovieFunctionVoid()

	while inCam do
		SetCamCoord(virussecuritycamCam,x,y,z+1.2)						
		-- SetCamRot(virussecuritycamCam, -15.0,0.0,h)
		PushScaleformMovieFunction(scaleform, "SET_ALT_FOV_HEADING")
		PushScaleformMovieFunctionParameterFloat(GetEntityCoords(h).z)
		PushScaleformMovieFunctionParameterFloat(1.0)
		PushScaleformMovieFunctionParameterFloat(GetCamRot(virussecuritycamCam, 2).z)
		PopScaleformMovieFunctionVoid()
		DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
		Citizen.Wait(1)
	end
	ClearFocus()
	ClearTimecycleModifier()
	RenderScriptCams(false, false, 0, 1, 0)
	SetScaleformMovieAsNoLongerNeeded(scaleform)
	DestroyCam(virussecuritycamCam, false)
	SetNightvision(false)
	SetSeethrough(false)	

end)

Citizen.CreateThread(function ()
	while true do
		Citizen.Wait(0)
		if inCam then

			local rota = GetCamRot(virussecuritycamCam, 2)

			if IsControlPressed(1, Keys['N4']) then
				SetCamRot(virussecuritycamCam, rota.x, 0.0, rota.z + 0.7, 2)
			end

			if IsControlPressed(1, Keys['N6']) then
				SetCamRot(virussecuritycamCam, rota.x, 0.0, rota.z - 0.7, 2)
			end

			if IsControlPressed(1, Keys['N8']) then
				SetCamRot(virussecuritycamCam, rota.x + 0.7, 0.0, rota.z, 2)
			end

			if IsControlPressed(1, Keys['N5']) then
				SetCamRot(virussecuritycamCam, rota.x - 0.7, 0.0, rota.z, 2)
			end
		end
	end
end)