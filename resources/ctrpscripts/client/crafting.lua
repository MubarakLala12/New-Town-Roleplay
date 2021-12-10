Keys = {
	['ESC'] = 322, ['F1'] = 288, ['F2'] = 289, ['F3'] = 170, ['F5'] = 166, ['F6'] = 167, ['F7'] = 168, ['F8'] = 169, ['F9'] = 56, ['F10'] = 57,
	['~'] = 243, ['1'] = 157, ['2'] = 158, ['3'] = 160, ['4'] = 164, ['5'] = 165, ['6'] = 159, ['7'] = 161, ['8'] = 162, ['9'] = 163, ['-'] = 84, ['='] = 83, ['BACKSPACE'] = 177,
	['TAB'] = 37, ['Q'] = 44, ['W'] = 32, ['E'] = 38, ['R'] = 45, ['T'] = 245, ['Y'] = 246, ['U'] = 303, ['P'] = 199, ['['] = 39, [']'] = 40, ['ENTER'] = 18,
	['CAPS'] = 137, ['A'] = 34, ['S'] = 8, ['D'] = 9, ['F'] = 23, ['G'] = 47, ['H'] = 74, ['K'] = 311, ['L'] = 182,
	['LEFTSHIFT'] = 21, ['Z'] = 20, ['X'] = 73, ['C'] = 26, ['V'] = 0, ['B'] = 29, ['N'] = 249, ['M'] = 244, [','] = 82, ['.'] = 81,
	['LEFTCTRL'] = 36, ['LEFTALT'] = 19, ['SPACE'] = 22, ['RIGHTCTRL'] = 70,
	['HOME'] = 213, ['PAGEUP'] = 10, ['PAGEDOWN'] = 11, ['DELETE'] = 178,
	['LEFT'] = 174, ['RIGHT'] = 175, ['TOP'] = 27, ['DOWN'] = 173,
}

CTRPFW = nil
local itemInfos = {}

Citizen.CreateThread(function()
	while CTRPFW == nil do
		TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)
		Citizen.Wait(0)
	end
	ItemsToItemInfo()
end)
PlayerJob = {}

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

local maxDistance = 1.25

--[[Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local pos, awayFromObject = GetEntityCoords(GetPlayerPed(-1)), true
		local craftObject = GetClosestObjectOfType(pos, 2.0, -573669520, false, false, false)
		if craftObject ~= 0 then
			local objectPos = GetEntityCoords(craftObject)
			if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, objectPos.x, objectPos.y, objectPos.z, true) < 1.5 then
				awayFromObject = false
				DrawText3D(objectPos.x, objectPos.y, objectPos.z + 1.0, "~g~E~w~ - Craft")
				if IsControlJustReleased(0, Keys["E"]) then
					local crafting = {}
					crafting.label = "Crafting"
					crafting.items = GetThresholdItems()
					TriggerServerEvent("inventory:server:OpenInventory", "crafting", math.random(1, 99), crafting)
				end
			end
		end

		if awayFromObject then
			Citizen.Wait(1000)
		end
	end
end)]]

Citizen.CreateThread(function()
	while true do
		local ped = GetPlayerPed(-1)
		local pos = GetEntityCoords(ped)
		local inRange = false
		local distance = GetDistanceBetweenCoords(pos, Config.CraftingItems["location"].x, Config.CraftingItems["location"].y, Config.CraftingItems["location"].z, true)

	if distance < 10 then
		inRange = true
		if distance < 1.5 then
			DrawText3D(Config.CraftingItems["location"].x, Config.CraftingItems["location"].y, Config.CraftingItems["location"].z, "~g~E~w~ - Craft")
			if IsControlJustPressed(0, Keys["E"]) then
				local crafting = {}
				crafting.label = "Crafting"
				crafting.items = GetThresholdItems()
				TriggerServerEvent("inventory:server:OpenInventory", "crafting", math.random(1, 99), crafting)
			end		

		end
	end

		if not inRange then
			Citizen.Wait(1000)
		end

		Citizen.Wait(3)
	end
end)

Citizen.CreateThread(function()
	while true do
		local ped = GetPlayerPed(-1)
		local pos = GetEntityCoords(ped)
		local inRange = false
		local distance = GetDistanceBetweenCoords(pos, Config.AttachmentCrafting["location"].x, Config.AttachmentCrafting["location"].y, Config.AttachmentCrafting["location"].z, true)

	if distance < 10 then
		inRange = true
		if distance < 1.5 then
			if PlayerJob.name == "mcdowner" or PlayerJob.name == "mcdmanager" or PlayerJob.name == "mcdemployee" then 
				DrawText3D(Config.AttachmentCrafting["location"].x, Config.AttachmentCrafting["location"].y, Config.AttachmentCrafting["location"].z, "~g~E~w~ - Cook")
				if IsControlJustPressed(0, Keys["E"]) then
					local crafting = {}
					crafting.label = "MCD COOKING"
					crafting.items = GetAttachmentThresholdItems()
					TriggerServerEvent("inventory:server:OpenInventory", "attachment_crafting", math.random(1, 99), crafting)
				end
		    end
		end
	end

		if not inRange then
			Citizen.Wait(1000)
		end

		Citizen.Wait(3)
	end
end)

--[[function GetThresholdItems()
	local items = {}
	for k, item in pairs(Config.CraftingItems) do
		if CTRPFW.Functions.GetPlayerData().metadata["craftingrep"] >= Config.CraftingItems[k].threshold then
			items[k] = Config.CraftingItems[k]
		end
	end
	return items
end]]

function GetThresholdItems()
	local items = {}
	for k, item in pairs(Config.CraftingItems["items"]) do
		if CTRPFW.Functions.GetPlayerData().metadata["craftingrep"] >= Config.CraftingItems["items"][k].threshold then
			items[k] = Config.CraftingItems["items"][k]
		end
	end
	return items
end

function SetupAttachmentItemsInfo()
	itemInfos = {
		[1] = {costs = CTRPFW.Shared.Items["bread"]["label"] .. ": 1x, " .. CTRPFW.Shared.Items["veggies"]["label"] .. ": 1x, " .. CTRPFW.Shared.Items["sauce"]["label"] .. ": 1x" },
		[2] = {costs = CTRPFW.Shared.Items["bread"]["label"] .. ": 1x, " .. CTRPFW.Shared.Items["veggies"]["label"] .. ": 1x, " .. CTRPFW.Shared.Items["sauce"]["label"] .. ": 1x" .. CTRPFW.Shared.Items["chickenpatty"]["label"] .. ": 1x"},
		[3] = {costs = CTRPFW.Shared.Items["bun"]["label"] .. ": 1x, " .. CTRPFW.Shared.Items["veggies"]["label"] .. ": 1x, " .. CTRPFW.Shared.Items["cheese"]["label"] .. ": 1x, " .. CTRPFW.Shared.Items["sauce"]["label"] .. ": 1x"  .. CTRPFW.Shared.Items["vegpatty"]["label"] .. ": 1x"},
		[4] = {costs = CTRPFW.Shared.Items["bun"]["label"] .. ": 1x, " .. CTRPFW.Shared.Items["veggies"]["label"] .. ": 1x, " .. CTRPFW.Shared.Items["cheese"]["label"] .. ": 1x, " .. CTRPFW.Shared.Items["sauce"]["label"] .. ": 1x" .. CTRPFW.Shared.Items["chickenpatty"]["label"] .. ": 1x"},
		[5] = {costs = CTRPFW.Shared.Items["potato"]["label"] .. ": 1x, " .. CTRPFW.Shared.Items["oil"]["label"] .. ": 1x, " },
		
		[6] = {costs = CTRPFW.Shared.Items["oil"]["label"] .. ": 1x" .. CTRPFW.Shared.Items["cheese"]["label"] .. ": 1x," .. CTRPFW.Shared.Items["bread"]["label"] .. ": 2x,"},
		[7] = {costs = CTRPFW.Shared.Items["bun"]["label"] .. ": 1x" .. CTRPFW.Shared.Items["veggies"]["label"] .. ": 2x," .. CTRPFW.Shared.Items["cheese"]["label"] .. ": 3x," .. CTRPFW.Shared.Items["sauce"]["label"] .. ": 2x," .. CTRPFW.Shared.Items["vegpatty"]["label"] .. ": 3x,"},
		[8] = {costs = CTRPFW.Shared.Items["cuttedchicken"]["label"] .. ": 1x" .. CTRPFW.Shared.Items["bread"]["label"] .. ": 2x," .. CTRPFW.Shared.Items["sauce"]["label"] .. ": 2x,"},
		
		[9] = {costs = CTRPFW.Shared.Items["paneer"]["label"] .. ": 1x" .. CTRPFW.Shared.Items["masala"]["label"] .. ": 1x," .. CTRPFW.Shared.Items["bun"]["label"] .. ": 1x," .. CTRPFW.Shared.Items["veggies"]["label"] .. ": 1x," .. CTRPFW.Shared.Items["cheese"]["label"] .. ": 1x," .. CTRPFW.Shared.Items["sauce"]["label"] .. ": 1x,"},
		[10] = {costs = CTRPFW.Shared.Items["egg"]["label"] .. ": 1x" .. CTRPFW.Shared.Items["masala"]["label"] .. ": 1x," .. CTRPFW.Shared.Items["bun"]["label"] .. ": 1x," .. CTRPFW.Shared.Items["cheese"]["label"] .. ": 1x,"},
	}

	local items = {}
	for k, item in pairs(Config.AttachmentCrafting["items"]) do
		local itemInfo = CTRPFW.Shared.Items[item.name:lower()]
		items[item.slot] = {
			name = itemInfo["name"],
			amount = tonumber(item.amount),
			info = itemInfos[item.slot],
			label = itemInfo["label"],
			description = itemInfo["description"] ~= nil and itemInfo["description"] or "",
			weight = itemInfo["weight"], 
			type = itemInfo["type"], 
			unique = itemInfo["unique"], 
			useable = itemInfo["useable"], 
			image = itemInfo["image"],
			slot = item.slot,
			costs = item.costs,
			threshold = item.threshold,
			points = item.points,
		}
	end
	Config.AttachmentCrafting["items"] = items
end

function GetAttachmentThresholdItems()
	SetupAttachmentItemsInfo()
	local items = {}
	for k, item in pairs(Config.AttachmentCrafting["items"]) do
		if CTRPFW.Functions.GetPlayerData().metadata["attachmentcraftingrep"] >= Config.AttachmentCrafting["items"][k].threshold then
			items[k] = Config.AttachmentCrafting["items"][k]
		end
	end
	return items
end

function ItemsToItemInfo()
	itemInfos = {
		[1] = {costs = CTRPFW.Shared.Items["metalscrap"]["label"] .. " , " ..CTRPFW.Shared.Items["steel"]["label"] .. " , " ..CTRPFW.Shared.Items["iron"]["label"] .. " , "},
		[2] = {costs = CTRPFW.Shared.Items["metalscrap"]["label"] .. " , " ..CTRPFW.Shared.Items["plastic"]["label"] .. " , " ..CTRPFW.Shared.Items["aluminum"]["label"] .. " , " ..CTRPFW.Shared.Items["wire"]["label"] .. " , "},
		[3] = {costs = CTRPFW.Shared.Items["metalscrap"]["label"] .. " , " ..CTRPFW.Shared.Items["plastic"]["label"] .. " , "..CTRPFW.Shared.Items["aluminum"]["label"] .. " , " ..CTRPFW.Shared.Items["electronickit"]["label"] .. " , "},
		[4] = {costs = CTRPFW.Shared.Items["metalscrap"]["label"] .. " , " ..CTRPFW.Shared.Items["plastic"]["label"] .. " , "..CTRPFW.Shared.Items["aluminum"]["label"] .. " , " ..CTRPFW.Shared.Items["steel"]["label"] .. " , "..CTRPFW.Shared.Items["ironoxide"]["label"] .. " , "..CTRPFW.Shared.Items["aluminumoxide"]["label"] .. " , "},
		[5] = {costs = CTRPFW.Shared.Items["metalscrap"]["label"] .. " , " ..CTRPFW.Shared.Items["plastic"]["label"] .. " , "..CTRPFW.Shared.Items["steel"]["label"] .. " , "..CTRPFW.Shared.Items["clutch"]["label"] .. " , "..CTRPFW.Shared.Items["iron"]["label"] .. " , "..CTRPFW.Shared.Items["wire"]["label"] .. " , "..CTRPFW.Shared.Items["rubber"]["label"] .. " , "},
		[6] = {costs = CTRPFW.Shared.Items["metalscrap"]["label"] .. " , " ..CTRPFW.Shared.Items["aluminum"]["label"] .. " , "..CTRPFW.Shared.Items["steel"]["label"] .. " , "},
		[7] = {costs = CTRPFW.Shared.Items["metalscrap"]["label"] .. " , "..CTRPFW.Shared.Items["steel"]["label"] .. " , "..CTRPFW.Shared.Items["rubber"]["label"] .. " , "},
		[8] = {costs = CTRPFW.Shared.Items["screwdriverset"]["label"] .. " , " ..CTRPFW.Shared.Items["drill"]["label"] .. " , "..CTRPFW.Shared.Items["wire"]["label"] .. " , "},
		--[9] = {costs = CTRPFW.Shared.Items["plastic"]["label"] .. " , " ..CTRPFW.Shared.Items["lighter"]["label"] .. " , "},
		[9] = {costs = CTRPFW.Shared.Items["plastic"]["label"] .. " , " ..CTRPFW.Shared.Items["wire"]["label"] .. " , "..CTRPFW.Shared.Items["electronickit"]["label"] .. " , " ..CTRPFW.Shared.Items["trojan_usb"]["label"] .. " , "..CTRPFW.Shared.Items["metalscrap"]["label"] .. " , "..CTRPFW.Shared.Items["aluminum"]["label"] .. " , "..CTRPFW.Shared.Items["steel"]["label"] .. " , "..CTRPFW.Shared.Items["rubber"]["label"] .. " , "},
		[10] = {costs = CTRPFW.Shared.Items["screwdriverset"]["label"] .. " , " ..CTRPFW.Shared.Items["drill"]["label"] .. " , "..CTRPFW.Shared.Items["wire"]["label"] .. " , "},
		
	}

	local items = {}
	for k, item in pairs(Config.CraftingItems["items"]) do
		local itemInfo = CTRPFW.Shared.Items[item.name:lower()]
		items[item.slot] = {
			name = itemInfo["name"],
			amount = tonumber(item.amount),
			info = itemInfos[item.slot],
			label = itemInfo["label"],
			description = itemInfo["description"] ~= nil and itemInfo["description"] or "",
			weight = itemInfo["weight"], 
			type = itemInfo["type"], 
			unique = itemInfo["unique"], 
			useable = itemInfo["useable"], 
			image = itemInfo["image"],
			slot = item.slot,
			costs = item.costs,
			threshold = item.threshold,
			points = item.points,
		}
	end
	Config.CraftingItems["items"] = items
end

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


------Ayush Crafting tp---------------

Citizen.CreateThread(function()
    while true do
	Citizen.Wait(0)
		local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
		local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, 1418.6, 6339.57, 24.03)
		
		if dist <= 2.5 then
		DrawText3D(1418.6, 6339.57, 24.03, "~g~[E]~w~ To Hack")
		end

		if dist <= 0.5 then
            if IsControlJustPressed(0, Keys['E']) then
                TriggerEvent("mhackings:show")
                TriggerEvent("mhackings:start", math.random(5, 9), math.random(10, 18), crafthacking) 
			end			
		end
	end
end)


function crafthacking(success, timeremaining)
    if success then
        TriggerEvent('mhackings:hide')
        local entity = GetPlayerPed(-1)
	    SetEntityCoords(entity, 1021.72, -2398.3, 30.14)
    else
        TriggerEvent('mhackings:hide')
	end
end

Citizen.CreateThread(function()
    while true do
		local inRange = false
        local ped = GetPlayerPed(-1)
        local pos = GetEntityCoords(ped)
		local dist = GetDistanceBetweenCoords(pos, 998.29, -2390.82, 30.14, true)
		if dist < 2 then
        	inRange = true
            DrawMarker(2, 998.29, -2390.82, 30.14, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.15, 255, 255, 255, 255, 0, 0, 0, 1, 0, 0, 0)

                if dist < 1 then
                    DrawText3D(998.29, -2390.82, 30.14, '~g~[E]~w~ To go outside')
                    if IsControlJustReleased(0, 51) then
                        local entity = GetPlayerPed(-1)
	    				SetEntityCoords(entity, 1417.02, 6339.16, 24.4)
                    end
                end
        end

        if not inRange then
            Citizen.Wait(1000)
        end

        Citizen.Wait(3)
    end
end)