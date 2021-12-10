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
local hackCam = false
local inProcess = false
local stophack = false

PRISONCamLocations = {
	[1] =  { ['x'] = 1818.13,['y'] = 2597.74,['z'] = 49.12,['h'] = 22.5, ['info'] = ' Cam1', ["recent"] = false },
	[2] =  { ['x'] = 1792.83,['y'] = 2597.85,['z'] = 48.36,['h'] = 316.72, ['info'] = ' Cam2', ["recent"] = false },
	[3] =  { ['x'] = 1834.17,['y'] = 2602.4,['z'] = 50.26,['h'] = 81.72, ['info'] = ' Cam3', ["recent"] = false },
	[4] =  { ['x'] = 1836.2,['y'] = 2603.06,['z'] = 50.26,['h'] = 301.72, ['info'] = ' Cam4', ["recent"] = false },
	[5] =  { ['x'] = 1845.84,['y'] = 2575.01,['z'] = 49.56,['h'] = 321.72, ['info'] = ' Cam5', ["recent"] = false },
	[6] =  { ['x'] = 1673.14,['y'] = 2544.77,['z'] = 50.11,['h'] = 21.72, ['info'] = ' Cam6', ["recent"] = false },
	[7] =  { ['x'] = 1674.08,['y'] = 2542.86,['z'] = 50.11,['h'] = 226.72, ['info'] = ' Cam7', ["recent"] = false },
	[8] =  { ['x'] = 1691.13,['y'] = 2498.79,['z'] = 51.81,['h'] = 351.72, ['info'] = ' Cam8', ["recent"] = false },
	[9] =  { ['x'] = 1710.61,['y'] = 2538.8,['z'] = 51.81,['h'] = 324.22, ['info'] = ' Cam9', ["recent"] = false },
	[10] =  { ['x'] = 1721.63,['y'] = 2551.83,['z'] = 48.31,['h'] = 119.22, ['info'] = ' Cam10', ["recent"] = false },
	[11] =  { ['x'] = 1765.78,['y'] = 2554.08,['z'] = 51.51,['h'] = 96.72, ['info'] = ' Cam11', ["recent"] = false },
	
}

CTRPFW = nil 

--starting
local startX = 1630.13 
local startY = 2564.34
local startZ = 45.56

--doors

local doorX = 1817.82
local doorY = 2604.91
local doorZ = 45.57


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


Citizen.CreateThread(function()
    while true do
        Wait(600000)
        hackCam = false
		inProcess = false
    end
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


Citizen.CreateThread(function()
    while true do
	Citizen.Wait(0)
		local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
		local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, startX, startY, startZ)

		if dist <= 2.5 then
			if inProcess then
				--print('virus noob')
			else
				DrawText3Ds(startX, startY, startZ, "~g~[E]~w~ To Hack Prison Cam")
			end
		end
--
		if dist <= 0.5 then
			if inProcess then
				DisableControlAction(0, Keys['E'])
			else
				if IsControlJustPressed(0, Keys['E']) then -- "E"
                    CTRPFW.Functions.TriggerCallback('CTRPFW:HasItem', function(result)
                        if result then
                            inProcess = true
                            Start(4.7)
                        else
                            CTRPFW.Functions.Notify('Failed! Hence Captured by sensors', 'error')
                            TriggerServerEvent('prison:server:JailAlarm')
                            TriggerServerEvent("prison:server:SecurityLockdown")
                        end
                    end, 'radiochip')

			
				end			
			end
		end
	end
end)


RegisterCommand("prisoncam", function (source, args, rawCommand)

	local cam = args[1]

	if hackCam then
		CTRPFW.Functions.Notify("This camera appears to be faulty", "error")
	else
	
		if PlayerData.job ~= nil and PlayerData.job.name == 'police'  then
			TriggerEvent('prisoncams:camera', cam)
		end
	end

end)

inCam = false
cctvCam = 0
RegisterNetEvent("prisoncams:camera")
AddEventHandler("prisoncams:camera", function(camNumber)
	camNumber = tonumber(camNumber)
	if inCam then
		inCam = false
		PlaySoundFrontend(-1, "HACKING_SUCCESS", false)
		-- TriggerEvent('animation:tablet',false)
		Wait(250)
		ClearPedTasks(GetPlayerPed(-1))
	else
		if camNumber > 0 and camNumber < #PRISONCamLocations+1 then
			PlaySoundFrontend(-1, "HACKING_SUCCESS", false)
			TriggerEvent("prisoncams:startcamera",camNumber)
		else
			CTRPFW.Functions.Notify("This camera appears to be faulty", "error")
		end
	end
end)

RegisterNetEvent("prisoncams:startcamera")
AddEventHandler("prisoncams:startcamera", function(camNumber)

	-- TriggerEvent('animation:tablet',true)
	local camNumber = tonumber(camNumber)
	local x = PRISONCamLocations[camNumber]["x"]
	local y = PRISONCamLocations[camNumber]["y"]
	local z = PRISONCamLocations[camNumber]["z"]
	local h = PRISONCamLocations[camNumber]["h"]

	print("Starting VIRUS OP Cam")
	inCam = true

	SetTimecycleModifier("heliGunCam")
	SetTimecycleModifierStrength(1.0)
	local scaleform = RequestScaleformMovie("mp_big_message_freemode")
	while not HasScaleformMovieLoaded(scaleform) do
		Citizen.Wait(0)
	end

	local lPed = GetPlayerPed(-1)
	cctvCam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
	SetCamCoord(cctvCam,x,y,z+1.2)						
	SetCamRot(cctvCam, -15.0,0.0,h)
	SetCamFov(cctvCam, 110.0)
	RenderScriptCams(true, false, 0, 1, 0)
	PushScaleformMovieFunction(scaleform, "PLAY_CAM_MOVIE")
	SetFocusArea(x, y, z, 0.0, 0.0, 0.0)
	PopScaleformMovieFunctionVoid()

	while inCam do
		SetCamCoord(cctvCam,x,y,z+1.2)						
		-- SetCamRot(cctvCam, -15.0,0.0,h)
		PushScaleformMovieFunction(scaleform, "SET_ALT_FOV_HEADING")
		--PushScaleformMovieFunctionParameterFloat(GetEntityCoords(h).z)
		PushScaleformMovieFunctionParameterFloat(1.0)
		PushScaleformMovieFunctionParameterFloat(GetCamRot(cctvCam, 2).z)
		PopScaleformMovieFunctionVoid()
		DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
		Citizen.Wait(1)
	end
	ClearFocus()
	ClearTimecycleModifier()
	RenderScriptCams(false, false, 0, 1, 0)
	SetScaleformMovieAsNoLongerNeeded(scaleform)
	DestroyCam(cctvCam, false)
	SetNightvision(false)
	SetSeethrough(false)	

end)

Citizen.CreateThread(function ()
	while true do
		Citizen.Wait(0)
		if inCam then

			local rota = GetCamRot(cctvCam, 2)

			if IsControlPressed(1, Keys['N4']) then
				SetCamRot(cctvCam, rota.x, 0.0, rota.z + 0.7, 2)
			end

			if IsControlPressed(1, Keys['N6']) then
				SetCamRot(cctvCam, rota.x, 0.0, rota.z - 0.7, 2)
			end

			if IsControlPressed(1, Keys['N8']) then
				SetCamRot(cctvCam, rota.x + 0.7, 0.0, rota.z, 2)
			end

			if IsControlPressed(1, Keys['N5']) then
				SetCamRot(cctvCam, rota.x - 0.7, 0.0, rota.z, 2)
			end
		end
	end
end)



--hack

local output = {}
local Dat_1 = { [1] = { val1 = 0.4, }, [2] = { val1 = 0.4, }, [3] = { val1 = 0.4, }, [4] = { val1 = 0.4, }, [5] = { val1 = 0.4, }, [6] = { val1 = 0.4, }, [7] = { val1 = 0.4, }, }
local Dat_2 = { [1] = { val0 = 1, val1 = (0.02 * 0.55), val2 = 0, val3 = 1, val4 = true }, [2] = { val0 = 1, val1 = (0.025 * 0.55), val2 = 0, val3 = 1, val4 = true }, [3] = { val0 = 1, val1 = (0.03 * 0.55), val2 = 0, val3 = 1, val4 = true }, [4] = { val0 = 1, val1 = (0.035 * 0.55), val2 = 0, val3 = 1, val4 = true }, [5] = { val0 = 1, val1 = (0.04 * 0.55), val2 = 0, val3 = 1, val4 = true }, [6] = { val0 = 1, val1 = (0.045 * 0.55), val2 = 0, val3 = 1, val4 = true }, [7] = { val0 = 1, val1 = (0.05 * 0.55), val2 = 0, val3 = 1, val4 = true } }
function F_02536(arg1) BeginTextCommandDisplayHelp('STRING') AddTextComponentSubstringPlayerName(arg1) EndTextCommandDisplayHelp(0, false, true, -1) end
function F_02539() DisableControlAction(0, 73, false) DisableControlAction(0, 24, true) DisableControlAction(0, 257, true) DisableControlAction(0, 25, true) DisableControlAction(0, 263, true) DisableControlAction(0, 32, true) DisableControlAction(0, 34, true) DisableControlAction(0, 31, true) DisableControlAction(0, 30, true) DisableControlAction(0, 45, true) DisableControlAction(0, 22, true) DisableControlAction(0, 44, true) DisableControlAction(0, 37, true) DisableControlAction(0, 23, true) DisableControlAction(0, 288, true) DisableControlAction(0, 289, true) DisableControlAction(0, 170, true) DisableControlAction(0, 167, true) DisableControlAction(0, 73, true) DisableControlAction(2, 199, true) DisableControlAction(0, 47, true) DisableControlAction(0, 264, true) DisableControlAction(0, 257, true) DisableControlAction(0, 140, true) DisableControlAction(0, 141, true) DisableControlAction(0, 142, true) DisableControlAction(0, 143, true) end
function F_02540(arg1) if (Dat_1[arg1].val1 >= 0.51) and (Dat_1[arg1].val1 <= 0.62) then return true end return false end
function F_02541(arg1, arg2, arg3) local number number = ((1.0 - Cos(F_02542((arg3 * 3.141593)))) * 0.5); return ((arg1 * (1 - number)) + (arg2 * number)); end
function F_02542(arg1) return (arg1 * 57.29578) end
function F_02668(arg1)
    Citizen.CreateThread(function()
        local current = 1
        Dat_2[current].val0 = 0
        while true do
            F_02539()
            F_02536("Press ~INPUT_FRONTEND_CANCEL~ to abort hack")
            if IsControlJustReleased(2, 237) then
                if F_02540(current) then
                    PlaySoundFrontend(-1, "Pin_Good", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", true)
                    Dat_2[current].val0 = 1
                    Dat_2[current].val4 = false
                    Dat_1[current].val1 = 0.572
                    if current < 7 then
                        Dat_2[current+1].val0 = 0
                    end
                    current = current + 1
                    if current > 7 then
                        return
                    end
                else
                    PlaySoundFrontend(-1, "Pin_Bad", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", true)
                    if current > 1 then
                        Dat_2[current].val0 = 1
                        current = current - 1
                        Dat_2[current].val0 = 0
                        Dat_1[current].val1 = 0.572
                        Dat_2[current].val4 = true
                    end
                end
            elseif IsControlJustReleased(2, 202) then
                Abort()
                return
            end
            if stophack then
                return
            end
            Citizen.Wait(1)
        end
    end)
    Citizen.CreateThread(function()
        while true do
            for i = 1, #Dat_2, 1 do
                if Dat_2[i].val3 == 1 then
                    if Dat_2[i].val2 < 1.0 then
                        Dat_2[i].val2 = Dat_2[i].val2 + ((Dat_2[i].val1 * Timestep()) * (arg1 * 1.0))
                    else
                        Dat_2[i].val3 = 0
                    end
                elseif Dat_2[i].val2 > 0.0 then
                    Dat_2[i].val2 = Dat_2[i].val2 - ((Dat_2[i].val1 * Timestep()) * (arg1 * 1.0))
                else
                    Dat_2[i].val3 = 1
                end
                if Dat_2[i].val0 == 0 or Dat_2[i].val4 then
                    Dat_1[i].val1 = F_02541(0.744, 0.4, Dat_2[i].val2)
                end
                if stophack then
                    return
                end
            end
            Citizen.Wait(1)
        end
    end)
    Citizen.CreateThread(function()
        RequestStreamedTextureDict("HACKING_PC_desktop_0", false)
        RequestStreamedTextureDict("hackingNG", false)
        local scaleform = RequestScaleformMovieInteractive("HACKING_PC")

        while not HasScaleformMovieLoaded(scaleform) do
            Citizen.Wait(0)
        end
        PushScaleformMovieFunction(scaleform, "ADD_PROGRAM")
        PushScaleformMovieFunctionParameterFloat(1.0)
        PushScaleformMovieFunctionParameterFloat(4.0)
        PushScaleformMovieFunctionParameterString("My Computer")
        PopScaleformMovieFunctionVoid()

        PushScaleformMovieFunction(scaleform, "ADD_PROGRAM")
        PushScaleformMovieFunctionParameterFloat(6.0)
        PushScaleformMovieFunctionParameterFloat(6.0)
        PushScaleformMovieFunctionParameterString("Power Off")
        PopScaleformMovieFunctionVoid()

        PushScaleformMovieFunction(scaleform, "SET_BACKGROUND")
        PushScaleformMovieFunctionParameterInt(1)
        PopScaleformMovieFunctionVoid()

        while not HasStreamedTextureDictLoaded("hackingNG") do
            Citizen.Wait(1)
        end
        while true do
            DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255, 0)
            DrawSprite("hackingNG", "DHMain",0.50, 0.50, 0.731, 1.306, 0, 255, 255, 255, 255, 0)
            if Dat_2[1].val0 == 1 then
                DrawSprite("hackingNG", "DHComp", 0.35, Dat_1[1].val1, 0.4, 0.4, 0, 255, 255, 255, 255, 0)
            elseif Dat_2[1].val0 == 0 then
                DrawSprite("hackingNG", "DHCompHi", 0.35, Dat_1[1].val1, 0.4, 0.4, 0, 255, 255, 255, 255, 0)
            end
            if Dat_2[2].val0 == 1 then
                DrawSprite("hackingNG", "DHComp", 0.40, Dat_1[2].val1, 0.4, 0.4, 0, 255, 255, 255, 255, 0)
            elseif Dat_2[2].val0 == 0 then
                DrawSprite("hackingNG", "DHCompHi", 0.40, Dat_1[2].val1, 0.4, 0.4, 0, 255, 255, 255, 255, 0)
            end
            if Dat_2[3].val0 == 1 then
                DrawSprite("hackingNG", "DHComp", 0.45, Dat_1[3].val1, 0.4, 0.4, 0, 255, 255, 255, 255, 0)
            elseif Dat_2[3].val0 == 0 then
                DrawSprite("hackingNG", "DHCompHi", 0.45, Dat_1[3].val1, 0.4, 0.4, 0, 255, 255, 255, 255, 0)
            end
            if Dat_2[4].val0 == 1 then
                DrawSprite("hackingNG", "DHComp", 0.50, Dat_1[4].val1, 0.4, 0.4, 0, 255, 255, 255, 255, 0)
            elseif Dat_2[4].val0 == 0 then
                DrawSprite("hackingNG", "DHCompHi", 0.50, Dat_1[4].val1, 0.4, 0.4, 0, 255, 255, 255, 255, 0)
            end
            if Dat_2[5].val0 == 1 then
                DrawSprite("hackingNG", "DHComp", 0.55, Dat_1[5].val1, 0.4, 0.4, 0, 255, 255, 255, 255, 0)
            elseif Dat_2[5].val0 == 0 then
                DrawSprite("hackingNG", "DHCompHi", 0.55, Dat_1[5].val1, 0.4, 0.4, 0, 255, 255, 255, 255, 0)
            end
            if Dat_2[6].val0 == 1 then
                DrawSprite("hackingNG", "DHComp", 0.60, Dat_1[6].val1, 0.4, 0.4, 0, 255, 255, 255, 255, 0)
            elseif Dat_2[6].val0 == 0 then
                DrawSprite("hackingNG", "DHCompHi", 0.60, Dat_1[6].val1, 0.4, 0.4, 0, 255, 255, 255, 255, 0)
            end
            if Dat_2[7].val0 == 1 then
                DrawSprite("hackingNG", "DHComp", 0.65, Dat_1[7].val1, 0.4, 0.4, 0, 255, 255, 255, 255, 0)
            elseif Dat_2[7].val0 == 0 then
                DrawSprite("hackingNG", "DHCompHi", 0.65, Dat_1[7].val1, 0.4, 0.4, 0, 255, 255, 255, 255, 0)
            end
            if stophack == true then
                return
            end
            if Dat_2[1].val4 == false and Dat_2[2].val4 == false and Dat_2[3].val4 == false and Dat_2[4].val4 == false and Dat_2[5].val4 == false and Dat_2[6].val4 == false and Dat_2[7].val4 == false then
                PlaySoundFrontend(-1, "HACKING_SUCCESS", "", true)
                Citizen.Wait(2500)
                stophack = true
                TriggerEvent("datacrack", true)
				hackCam = true
                return
            end
            Citizen.Wait(1)
        end
    end)
end

function Abort()
    stophack = true
	CTRPFW.Functions.Notify("You have been captured while hacking cameras!", "error")
    TriggerEvent("datacrack", false)
	TriggerEvent('virus-cctv:client:Camhack')
    

end

function Start(arg1)
    local loc1
    if arg1 == nil then
        loc1 = 25
    elseif arg1 < 2 then
        loc1 = 25
    elseif arg1 > 5 then
        loc1 = 25
    else
        loc1 = arg1 * 10
    end
    Dat_1 = { [1] = { val1 = 0.4, }, [2] = { val1 = 0.4, }, [3] = { val1 = 0.4, }, [4] = { val1 = 0.4, }, [5] = { val1 = 0.4, }, [6] = { val1 = 0.4, }, [7] = { val1 = 0.4, }, }
    Dat_2 = { [1] = { val0 = 1, val1 = (0.02 * 0.55), val2 = 0, val3 = 1, val4 = true }, [2] = { val0 = 1, val1 = (0.025 * 0.55), val2 = 0, val3 = 1, val4 = true }, [3] = { val0 = 1, val1 = (0.03 * 0.55), val2 = 0, val3 = 1, val4 = true }, [4] = { val0 = 1, val1 = (0.035 * 0.55), val2 = 0, val3 = 1, val4 = true }, [5] = { val0 = 1, val1 = (0.04 * 0.55), val2 = 0, val3 = 1, val4 = true }, [6] = { val0 = 1, val1 = (0.045 * 0.55), val2 = 0, val3 = 1, val4 = true }, [7] = { val0 = 1, val1 = (0.05 * 0.55), val2 = 0, val3 = 1, val4 = true } }
    stophack = false
    F_02668(loc1)
end


RegisterNetEvent('virus-cctv:client:Camhack')
AddEventHandler('virus-cctv:client:Camhack', function()
    -- TriggerEvent("chatMessage", "ALERT", "error", "Attentie alle eenheden! Poging tot uitbraak in de gevangenis!")
    TriggerEvent('ctrp-policealerts:client:AddPoliceAlert', {
        timeOut = 10000,
        alertTitle = "Prison Camera Hack",
        details = {
            [1] = {
                icon = '<i class="fas fa-lock"></i>',
                detail = "Prison Cam Hack",
            },
            [2] = {
                icon = '<i class="fas fa-globe-europe"></i>',
                detail = "Route 68",
            },
        },
        callSign = CTRPFW.Functions.GetPlayerData().metadata["callsign"],
    })

    local BreakBlip = AddBlipForCoord(Config.Locations["middle"].coords.x, Config.Locations["middle"].coords.y, Config.Locations["middle"].coords.z)

    TriggerServerEvent('prison:server:JailAlarm')
	SetBlipSprite(BreakBlip , 161)
	SetBlipScale(BreakBlip , 3.0)
	SetBlipColour(BreakBlip, 3)
	PulseBlip(BreakBlip)
    PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
    Citizen.Wait(100)
    PlaySoundFrontend( -1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1 )
    Citizen.Wait(100)
    PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
    Citizen.Wait(100)
    PlaySoundFrontend( -1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1 )
    Citizen.Wait((1000 * 60 * 5))
    RemoveBlip(BreakBlip)
end)

Citizen.CreateThread(function()
    while true do
	Citizen.Wait(0)
		local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
		local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, doorX, doorY, doorZ)

		if dist <= 2.5 then
			if not hackCam then
				if PlayerData.job ~= nil and PlayerData.job.name == 'police'  then
					print('alert')
					TriggerEvent('virus-cctv:client:Camhacks')
					Citizen.Wait(60000)
				else
					print('alert')
					TriggerEvent('virus-cctv:client:Camhacks')
                    TriggerServerEvent('prison:server:JailAlarm')
                    TriggerServerEvent("prison:server:SecurityLockdown")
					Citizen.Wait(60000)
				end
			end
		end
	end
end)

RegisterNetEvent('virus-cctv:client:Camhacks')
AddEventHandler('virus-cctv:client:Camhacks', function()
    TriggerEvent('ctrp-policealerts:client:AddPoliceAlert', {
        timeOut = 10000,
        alertTitle = "Prison Cam Sensor",
        details = {
            [1] = {
                icon = '<i class="fas fa-lock"></i>',
                detail = "Sensor Found A guy near Main Prison Door",
            },
            [2] = {
                icon = '<i class="fas fa-globe-europe"></i>',
                detail = "Cam 1 , 2",
            },
        },
        callSign = CTRPFW.Functions.GetPlayerData().metadata["callsign"],
    })

    
end)