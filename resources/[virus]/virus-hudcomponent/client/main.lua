CTRPFW = nil
stress = 0

Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
}

isLoggedIn = true
PlayerJob = {}

Citizen.CreateThread(function() 
    while true do
        Citizen.Wait(10)
        if CTRPFW == nil then
            TriggerEvent("CTRPFW:GetObject", function(obj) CTRPFW = obj end)    
            Citizen.Wait(200)
        end
        if CTRPFW ~= nil then
            TriggerEvent("hud:client:SetMoney")
            return
        end
    end
end)

RegisterNetEvent("CTRPFW:Client:OnPlayerUnload")
AddEventHandler("CTRPFW:Client:OnPlayerUnload", function()
    isLoggedIn = false
    CTRPHud.Show = false
    SendNUIMessage({
        action = "hudtick",
        show = true,
    })
end)

RegisterNetEvent("CTRPFW:Client:OnPlayerLoaded")
AddEventHandler("CTRPFW:Client:OnPlayerLoaded", function()
    isLoggedIn = true
    CTRPHud.Show = true
    PlayerJob = CTRPFW.Functions.GetPlayerData().job
    HudStage = 2
    distanceSetting = 18.0
    Citizen.Wait(2000)

end)



local speed = 0.0
local seatbeltOn = false
local cruiseOn = false



function CalculateTimeToDisplay()
	hour = GetClockHours()
    minute = GetClockMinutes()
    
    local obj = {}
    
	if minute <= 9 then
		minute = "0" .. minute
    end
    
	if hour <= 9 then
		hour = "0" .. hour
    end
    
    obj.hour = hour
    obj.minute = minute

    return obj
end


local Rotating = "left"

--[[Citizen.CreateThread(function()
    while true do
        local ped = GetPlayerPed(-1)
        local PlayerHeading = GetEntityHeading(ped)
        if LastHeading ~= nil then
            if PlayerHeading < LastHeading then
                Rotating = "right"
            elseif PlayerHeading > LastHeading then
                Rotating = "left"
            end
        end
        LastHeading = PlayerHeading
        SendNUIMessage({
            action = "UpdateCompass",
            heading = PlayerHeading,
            lookside = Rotating,
        })
        Citizen.Wait(6)
    end
end)--]]

function GetDirectionText(heading)
    if ((heading >= 0 and heading < 45) or (heading >= 315 and heading < 360)) then
        return "North"
    elseif (heading >= 45 and heading < 135) then
        return "East"
    elseif (heading >=135 and heading < 225) then
        return "South"
    elseif (heading >= 225 and heading < 315) then
        return "West"
    end
end

local hudStatus = true

local usingSeatbelt = false

local hour = 0
local minute = 0



function drawRct(x,y,width,height,r,g,b,a)

	DrawRect(x + width/2, y + height/2, width, height, r, g, b, a)
end

function NdrawTxt(x, y, width, height, scale, text, r, g, b, a, center)
  SetTextFont(6)
  SetTextProportional(0)
  SetTextScale(scale, scale)
  SetTextColour(r, g, b, a)
  SetTextDropshadow(0, 0, 0, 0, 255)
  SetTextEdge(1, 1, 1, 1, 1)
  SetTextDropshadow(0, 0, 0, 0, 255)
  SetTextCentre(center)
  SetTextEntry("STRING")
  AddTextComponentString(text)
  DrawText(x - width / 2, y - height / 2 + 0.005)
end






local zoneNames = {
 AIRP = "Los Santos International Airport",
 ALAMO = "Alamo Sea",
 ALTA = "Alta",
 ARMYB = "Fort Zancudo",
 BANHAMC = "Banham Canyon Dr",
 BANNING = "Banning",
 BAYTRE = "Baytree Canyon",
 BEACH = "Vespucci Beach",
 BHAMCA = "Banham Canyon",
 BRADP = "Braddock Pass",
 BRADT = "Braddock Tunnel",
 BURTON = "Burton",
 CALAFB = "Calafia Bridge",
 CANNY = "Raton Canyon",
 CCREAK = "Cassidy Creek",
 CHAMH = "Chamberlain Hills",
 CHIL = "Vinewood Hills",
 CHU = "Chumash",
 CMSW = "Chiliad Mountain State Wilderness",
 CYPRE = "Cypress Flats",
 DAVIS = "Davis",
 DELBE = "Del Perro Beach",
 DELPE = "Del Perro",
 DELSOL = "La Puerta",
 DESRT = "Grand Senora Desert",
 DOWNT = "Downtown",
 DTVINE = "Downtown Vinewood",
 EAST_V = "East Vinewood",
 EBURO = "El Burro Heights",
 ELGORL = "El Gordo Lighthouse",
 ELYSIAN = "Elysian Island",
 GALFISH = "Galilee",
 GALLI = "Galileo Park",
 golf = "GWC and Golfing Society",
 GRAPES = "Grapeseed",
 GREATC = "Great Chaparral",
 HARMO = "Harmony",
 HAWICK = "Hawick",
 HORS = "Vinewood Racetrack",
 HUMLAB = "Humane Labs and Research",
 JAIL = "Bolingbroke Penitentiary",
 KOREAT = "Little Seoul",
 LACT = "Land Act Reservoir",
 LAGO = "Lago Zancudo",
 LDAM = "Land Act Dam",
 LEGSQU = "Legion Square",
 LMESA = "La Mesa",
 LOSPUER = "La Puerta",
 MIRR = "Mirror Park",
 MORN = "Morningwood",
 MOVIE = "Richards Majestic",
 MTCHIL = "Mount Chiliad",
 MTGORDO = "Mount Gordo",
 MTJOSE = "Mount Josiah",
 MURRI = "Murrieta Heights",
 NCHU = "North Chumash",
 NOOSE = "N.O.O.S.E",
 OCEANA = "Pacific Ocean",
 PALCOV = "Paleto Cove",
 PALETO = "Paleto Bay",
 PALFOR = "Paleto Forest",
 PALHIGH = "Palomino Highlands",
 PALMPOW = "Palmer-Taylor Power Station",
 PBLUFF = "Pacific Bluffs",
 PBOX = "Pillbox Hill",
 PROCOB = "Procopio Beach",
 RANCHO = "Rancho",
 RGLEN = "Richman Glen",
 RICHM = "Richman",
 ROCKF = "Rockford Hills",
 RTRAK = "Redwood Lights Track",
 SanAnd = "San Andreas",
 SANCHIA = "San Chianski Mountain Range",
 SANDY = "Sandy Shores",
 SKID = "Mission Row",
 SLAB = "Stab City",
 STAD = "Maze Bank Arena",
 STRAW = "Strawberry",
 TATAMO = "Tataviam Mountains",
 TERMINA = "Terminal",
 TEXTI = "Textile City",
 TONGVAH = "Tongva Hills",
 TONGVAV = "Tongva Valley",
 VCANA = "Vespucci Canals",
 VESP = "Vespucci",
 VINE = "Vinewood",
 WINDF = "Ron Alternates Wind Farm",
 WVINE = "West Vinewood",
 ZANCUDO = "Zancudo River",
 ZP_ORT = "Port of South Los Santos",
 ZQ_UAR = "Davis Quartz"
}

local showCompass = true
local lastStreet = nil
local lastStreetName = ""
local zone = "Unknown";

function getCardinalDirectionFromHeading(heading)
    if heading >= 315 or heading < 45 then
        return ""
    elseif heading >= 45 and heading < 135 then
        return ""
    elseif heading >=135 and heading < 225 then
        return ""
    elseif heading >= 225 and heading < 315 then
        return ""
    end
end

Citizen.CreateThread(function()
    local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
    local currentStreetHash, intersectStreetHash = GetStreetNameAtCoord(x, y, z, currentStreetHash, intersectStreetHash)
    currentStreetName = GetStreetNameFromHashKey(currentStreetHash)
    intersectStreetName = GetStreetNameFromHashKey(intersectStreetHash)
    zone = tostring(GetNameOfZone(x, y, z))
    playerStreetsLocation = zoneNames[tostring(zone)]

    if not zone then
        zone = "UNKNOWN"
        zoneNames['UNKNOWN'] = zone
    elseif not zoneNames[tostring(zone)] then
        local undefinedZone = zone .. "" .. x .. "" .. y .. "" .. z
        zoneNames[tostring(zone)] = "Undefined Zone"
    end

    if intersectStreetName ~= nil and intersectStreetName ~= "" then
        playerStreetsLocation = currentStreetName .. "" .. intersectStreetName .. "" .. zoneNames[tostring(zone)]
    elseif currentStreetName ~= nil and currentStreetName ~= "" then
        playerStreetsLocation = currentStreetName .. "" .. zoneNames[tostring(zone)]
    else
        playerStreetsLocation = zoneNames[tostring(zone)]
    end

    while true do
        Citizen.Wait(2000)

		        local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
		        local currentStreetHash, intersectStreetHash = GetStreetNameAtCoord(x, y, z, currentStreetHash, intersectStreetHash)
		        currentStreetName = GetStreetNameFromHashKey(currentStreetHash)
		        intersectStreetName = GetStreetNameFromHashKey(intersectStreetHash)
		        zone = tostring(GetNameOfZone(x, y, z))
		        playerStreetsLocation = zoneNames[tostring(zone)]

		        if not zone then
		            zone = "UNKNOWN"
		            zoneNames['UNKNOWN'] = zone
		        elseif not zoneNames[tostring(zone)] then
		            local undefinedZone = zone .. " | " .. x .. " | " .. y .. " | " .. z
		            zoneNames[tostring(zone)] = "Undefined Zone"
		        end

		        if intersectStreetName ~= nil and intersectStreetName ~= "" then
		            playerStreetsLocation = currentStreetName .. " | " .. intersectStreetName .. " | " .. zoneNames[tostring(zone)]
		        elseif currentStreetName ~= nil and currentStreetName ~= "" then
		            playerStreetsLocation = currentStreetName .. " | " .. zoneNames[tostring(zone)]
		        else
		            playerStreetsLocation = zoneNames[tostring(zone)]
		        end

	end
end)

Citizen.CreateThread(function()

    while true do
        Citizen.Wait(1)
        DisplayRadar(true)
        if IsPedInAnyVehicle(PlayerPedId(), false) then

		  		local Mph = GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) * 3.6
				local fuel = GetVehicleFuelLevel(GetVehiclePedIsIn(GetPlayerPed(-1), false))
				local time = CalculateTimeToDisplay()


				if usingSeatbelt then
                    DisableControlAction(0, 75)
					drawTxt(0.678, 1.400, 1.0,1.0,0.5 , "~g~ BELT", 255, 255, 255, 255) 
				else
					drawTxt(0.678, 1.400, 1.0,1.0,0.5, "~w~ BELT", 255, 255, 255, 255)
				end

          --drawTxt(0.677, 1.395, 1.0,1.0,0.33 ,"" .. hour .. ":" .. minute, 255, 255, 255, 255)

	        SetTextFont(6)
	        SetTextProportional(1)
	        SetTextScale(0.0, 0.43)
	        SetTextColour(255, 255, 255, 255)
	        --SetTextDropshadow(0, 0, 0, 0, 255)
	        --SetTextEdge(1, 0, 0, 0, 255)
	        --SetTextDropShadow()
	        --SetTextOutline()
	        SetTextEntry("STRING")

	        if showCompass then
	        	compass = getCardinalDirectionFromHeading(math.floor(GetEntityHeading(GetPlayerPed(-1)) + 0.5))
	        	lastStreetName = compass .. "" .. playerStreetsLocation
	        end

	        AddTextComponentString(lastStreetName)
	        DrawText(0.450, 0.964)
      else
       DisplayRadar(false)
       Citizen.Wait(2000)
	    end
	end
end)

function drawTxt(x,y ,width,height,scale, text, r,g,b,a)
    SetTextFont(6)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    --SetTextDropShadow(0, 0, 0, 0,255)
    --SetTextEdge(2, 0, 0, 0, 255)
    --SetTextDropShadow()
    --SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end



function CalculateTimeToDisplay()
  hour = GetClockHours()
  minute = GetClockMinutes()
  local type = 'AM'

 if hour == 1 or hour == 2 or hour == 3 or hour == 4 or hour == 5 or hour == 6 or hour == 7 or hour == 8 or hour == 9 or hour == 10 or hour == 11 or hour == 12 then
  type = 'AM'
 else
  type = 'PM'
 end

 if hour <= 9 then
  hour = "0" .. hour
 end
 if minute <= 9 then
  minute = "0" .. minute
 end
 minute = minute..' '..type
end

--SEATBELT--

local speedBuffer  = {}
local velBuffer    = {}
local wasInCar     = false
local carspeed = 0
local speed = 0

Citizen.CreateThread(function()
    Citizen.Wait(500)
    while true do
        local ped = GetPlayerPed(-1)
        local car = GetVehiclePedIsIn(ped)
        if car ~= 0 and (wasInCar or IsCar(car)) then
            wasInCar = true
            speedBuffer[2] = speedBuffer[1]
            speedBuffer[1] = GetEntitySpeed(car)
            if speedBuffer[2] ~= nil and GetEntitySpeedVector(car, true).y > 1.0 and speedBuffer[2] > 18.00 and (speedBuffer[2] - speedBuffer[1]) > (speedBuffer[2] * 0.465) and usingSeatbelt == false then
                local co = GetEntityCoords(ped, true)
                local fw = Fwv(ped)
                SetEntityCoords(ped, co.x + fw.x, co.y + fw.y, co.z - 0.47, true, true, true)
                SetEntityVelocity(ped, velBuffer[2].x-10/2, velBuffer[2].y-10/2, velBuffer[2].z-10/4)
                Citizen.Wait(1)
                SetPedToRagdoll(ped, 1000, 1000, 0, 0, 0, 0)
            end
            velBuffer[2] = velBuffer[1]
            velBuffer[1] = GetEntityVelocity(car)

            if IsControlJustPressed(0, 29) then
                if usingSeatbelt == false then
                    usingSeatbelt = true
                    CTRPFW.Functions.Notify("Belt On")
                    TriggerEvent('InteractSound_CL:PlayOnOne', 'buckle', 0.8)
                else
                    usingSeatbelt = false
                    CTRPFW.Functions.Notify("Belt Off")
                    TriggerEvent('InteractSound_CL:PlayOnOne', 'unbuckle', 0.8)
                end
            end
        elseif wasInCar then
            wasInCar = false
            usingSeatbelt = false
            speedBuffer[1], speedBuffer[2] = 0.0, 0.0
        end
        Citizen.Wait(5)
        speed = math.floor(GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) * 2.236936)
    end
end)


function IsCar(veh)
 local vc = GetVehicleClass(veh)
 return (vc >= 0 and vc <= 7) or (vc >= 9 and vc <= 15) or (vc >= 17 and vc <= 20)
end

function Fwv(entity)
 local hr = GetEntityHeading(entity) + 90.0
 if hr < 0.0 then hr = 360.0 + hr end
 hr = hr * 0.0174533
 return { x = math.cos(hr) * 2.0, y = math.sin(hr) * 2.0 }
end

function DisableDisplayControlActions()
    DisableControlAction(0, 212, true) -- disable mouse look
    DisableControlAction(0, 213, true) -- disable mouse look

end


local StressGain = 0
local IsGaining = false



Citizen.CreateThread(function()
    while true do
        local ped = PlayerPedId()

        if IsPedShooting(PlayerPedId()) then
            local StressChance = math.random(1, 3)
            local odd = math.random(1, 3)
            if StressChance == odd then
                local PlusStress = math.random(2, 4) / 100
                StressGain = StressGain + PlusStress
            end
            if not IsGaining then
                IsGaining = true
            end
        else
            if IsGaining then
                IsGaining = false
            end
        end

        if (PlayerJob.name ~= "police") then
            if IsPlayerFreeAiming(PlayerId()) and not IsPedShooting(PlayerPedId()) then
                local CurrentWeapon = GetSelectedPedWeapon(ped)
                local WeaponData = CTRPFW.Shared.Weapons[CurrentWeapon]
                if WeaponData.name:upper() ~= "WEAPON_UNARMED" then
                    local StressChance = math.random(1, 20)
                    local odd = math.random(1, 20)
                    if StressChance == odd then
                        local PlusStress = math.random(1, 3) / 100
                        StressGain = StressGain + PlusStress
                    end
                end
                if not IsGaining then
                    IsGaining = true
                end
            else
                if IsGaining then
                    IsGaining = false
                end
            end
        end

        Citizen.Wait(2)
    end
end)

RegisterNetEvent('hud:client:UpdateStress')
AddEventHandler('hud:client:UpdateStress', function(newStress)
    stress = newStress
end)

Citizen.CreateThread(function()
    while true do
        if not IsGaining then
            StressGain = math.ceil(StressGain)
            if StressGain > 0 then
                CTRPFW.Functions.Notify('Increased stress', "primary", 2000)
                TriggerServerEvent('virus-hudcomponent:Server:UpdateStress', StressGain)
                StressGain = 0
            end
        end
        Citizen.Wait(1000)
    end
end)

function GetShakeIntensity(stresslevel)
    local retval = 0.05
    for k, v in pairs(CTRPStress.Intensity["shake"]) do
        if stresslevel >= v.min and stresslevel < v.max then
            retval = v.intensity
            break
        end
    end
    return retval
end

function GetEffectInterval(stresslevel)
    local retval = 60000
    for k, v in pairs(CTRPStress.EffectInterval) do
        if stresslevel >= v.min and stresslevel < v.max then
            retval = v.timeout
            break
        end
    end
    return retval
end

Citizen.CreateThread(function()
    while true do
        local ped = GetPlayerPed(-1)
        local Wait = GetEffectInterval(stress)
        if stress >= 100 then
            local ShakeIntensity = GetShakeIntensity(stress)
            local FallRepeat = math.random(2, 4)
            local RagdollTimeout = (FallRepeat * 1750)
            ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', ShakeIntensity)
            SetFlash(0, 0, 500, 3000, 500)

            if not IsPedRagdoll(ped) and IsPedOnFoot(ped) and not IsPedSwimming(ped) then
                local player = PlayerPedId()
                SetPedToRagdollWithFall(player, RagdollTimeout, RagdollTimeout, 1, GetEntityForwardVector(player), 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
            end

            Citizen.Wait(500)
            for i = 1, FallRepeat, 1 do
                Citizen.Wait(750)
                DoScreenFadeOut(200)
                Citizen.Wait(1000)
                DoScreenFadeIn(200)
                ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', ShakeIntensity)
                SetFlash(0, 0, 200, 750, 200)
            end
        elseif stress >= CTRPStress.MinimumStress then
            local ShakeIntensity = GetShakeIntensity(stress)
            ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', ShakeIntensity)
            SetFlash(0, 0, 500, 2500, 500)
        end
        Citizen.Wait(Wait)
    end
end)