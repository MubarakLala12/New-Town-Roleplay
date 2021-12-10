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
	SetupAttachmentssItemsInfo()
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



Citizen.CreateThread(function()
	while true do
		local ped = GetPlayerPed(-1)
		local pos = GetEntityCoords(ped)
		local inRange = false
		local distance = GetDistanceBetweenCoords(pos, Config.AttachmentssCrafting["location"].x, Config.AttachmentssCrafting["location"].y, Config.AttachmentssCrafting["location"].z, true)

	if distance < 10 then
		inRange = true
		if distance < 1.5 then
			if PlayerJob.name == "mechanic" and PlayerJob.gradelabel == "Boss" or PlayerJob.gradelabel == "MANAGER" then 
				DrawText3D(Config.AttachmentssCrafting["location"].x, Config.AttachmentssCrafting["location"].y, Config.AttachmentssCrafting["location"].z, "~g~E~w~ - Mechanic Table")
				if IsControlJustPressed(0, Keys["E"]) then
					local crafting = {}
					crafting.label = "Mechanic Crafting"
					crafting.items = GetAttachmentssThresholdItems()
					TriggerServerEvent("inventory:server:OpenInventory", "attachmentss_crafting", math.random(1, 99), crafting)
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



function SetupAttachmentssItemsInfo()
	itemInfos = {
		[1] = {costs = CTRPFW.Shared.Items["electronickit"]["label"] .. ": 5x, " ..CTRPFW.Shared.Items["trojan_usb"]["label"] .. ": 5x, "..CTRPFW.Shared.Items["clutch"]["label"] .. ": 20x." ..CTRPFW.Shared.Items["wire"]["label"] .. ": 20x."},
		[2] = {costs = CTRPFW.Shared.Items["rubber"]["label"] .. ": 15x, " ..CTRPFW.Shared.Items["weapon_petrolcan"]["label"] .. ": 1x, " ..CTRPFW.Shared.Items["metalscrap"]["label"] .. ": 20x" ..CTRPFW.Shared.Items["aluminum"]["label"] .. ": 15x." ..CTRPFW.Shared.Items["steel"]["label"] .. ": 20x."..CTRPFW.Shared.Items["wire"]["label"] .. ": 20x."},
		[3] = {costs = CTRPFW.Shared.Items["metalscrap"]["label"] .. ": 15x, " ..CTRPFW.Shared.Items["steel"]["label"] .. ": 17x, " ..CTRPFW.Shared.Items["iron"]["label"] .. ": 9x" ..CTRPFW.Shared.Items["rubber"]["label"] .. ": 15x." ..CTRPFW.Shared.Items["steel"]["label"] .. ": 20x."},
	}

	local items = {}
	for k, item in pairs(Config.AttachmentssCrafting["items"]) do
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
	Config.AttachmentssCrafting["items"] = items
end

function GetAttachmentssThresholdItems()
	SetupAttachmentssItemsInfo()
	local items = {}
	for k, item in pairs(Config.AttachmentssCrafting["items"]) do
		if CTRPFW.Functions.GetPlayerData().metadata["attachmentcraftingrep"] >= Config.AttachmentssCrafting["items"][k].threshold then
			items[k] = Config.AttachmentssCrafting["items"][k]
			
		end
	end
	return items
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