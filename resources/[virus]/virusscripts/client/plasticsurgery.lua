-- CTRPFW = nil

-- Citizen.CreateThread(function()
--     while true do
--         Citizen.Wait(1)
-- 		if CTRPFW == nil then

--             TriggerEvent("CTRPFW:GetObject", function(obj) CTRPFW = obj end)
--             Citizen.Wait(200)
--         end
--     end
-- end)


local blips = {

	{title="Plastic Surgery", colour=0, id=267, x = -449.09, y = -340.53, z = 34.5},
	

	  
	
 }

Citizen.CreateThread(function()

   for _, info in pairs(blips) do
	 info.blip = AddBlipForCoord(info.x, info.y, info.z)
	 SetBlipSprite(info.blip, info.id)
	 SetBlipDisplay(info.blip, 4)
	 SetBlipScale(info.blip, 0.6)
	 SetBlipColour(info.blip, info.colour)
	 SetBlipAsShortRange(info.blip, true)
	 BeginTextCommandSetBlipName("STRING")
	 AddTextComponentString(info.title)
	 EndTextCommandSetBlipName(info.blip)
   end
end)



local startX = -449.09  --starting
local startY = -340.53
local startZ = 34.5

Citizen.CreateThread(function()
    while true do
	Citizen.Wait(0)
		local plyCoords = GetEntityCoords(PlayerPedId(), false)
		local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, startX, startY, startZ)
		local range = false

		if dist <= 2.5 then
		range = true
		DrawText3D(startX, startY, startZ, "~r~[E]~w~ For Plastic Surgery")
		end

		if dist <= 1.5 then
			if IsControlJustReleased(0, 38) then -- "E"
				CTRPFW.Functions.TriggerCallback('CTRPFW:HasItem', function(result)
					if result then
						TriggerServerEvent("virus-plasticsurgery:surgery")
						TriggerEvent("ctrp-clothes:client:CreateFirstCharacter")
					else
						CTRPFW.Functions.Notify("You Don't Have Surgery Pass , Contact Doctor", "error")
					end
			
				end, 'surgerypass')		
			end			
		end
		if not range then
			Citizen.Wait(1500)
		else
			Citizen.Wait(7)
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