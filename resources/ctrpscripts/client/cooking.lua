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

--FUCK U CREATED BY VIRUS
CTRPFW = nil
local itemInfos = {}

Citizen.CreateThread(function()
	while CTRPFW == nil do
		TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)
		Citizen.Wait(0)
	end
	SetupAttachmentsssItemsInfo()
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

--FUCK U CREATED BY VIRUS

Citizen.CreateThread(function()
	while true do
		local ped = GetPlayerPed(-1)
		local pos = GetEntityCoords(ped)
		local inRange = false
		local distance = GetDistanceBetweenCoords(pos, Config.AttachmentsssCrafting["location"].x, Config.AttachmentsssCrafting["location"].y, Config.AttachmentsssCrafting["location"].z, true)

	if distance < 10 then
		inRange = true
		if distance < 1.5 then
			if PlayerJob.name == "dhaba" then 
				DrawText3D(Config.AttachmentsssCrafting["location"].x, Config.AttachmentsssCrafting["location"].y, Config.AttachmentsssCrafting["location"].z, "~g~E~w~ - Dhaba")
				if IsControlJustPressed(0, Keys["E"]) then
					local crafting = {}
					crafting.label = "ढाबा"
					crafting.items = GetAttachmentsssThresholdItems()
					TriggerServerEvent("inventory:server:OpenInventory", "attachmentsss_crafting", math.random(1, 99), crafting)
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



function SetupAttachmentsssItemsInfo()
	itemInfos = {
		[1] = {costs = CTRPFW.Shared.Items["knor"]["label"] .. ": 1x, " ..CTRPFW.Shared.Items["water_bottle"]["label"] .. ": 1x,"},
		[2] = {costs = CTRPFW.Shared.Items["manchow"]["label"] .. ": 1x, " ..CTRPFW.Shared.Items["water_bottle"]["label"] .. ": 1x,"},
		[3] = {costs = CTRPFW.Shared.Items["cuttedchicken"]["label"] .. ": 1x, " ..CTRPFW.Shared.Items["oil"]["label"] .. ": 1x, " ..CTRPFW.Shared.Items["masala"]["label"] .. ": 1x" ..CTRPFW.Shared.Items["veggies"]["label"] .. ": 1x."},
		[4] = {costs = CTRPFW.Shared.Items["paneer"]["label"] .. ": 1x, " ..CTRPFW.Shared.Items["oil"]["label"] .. ": 1x, " ..CTRPFW.Shared.Items["masala"]["label"] .. ": 1x" ..CTRPFW.Shared.Items["veggies"]["label"] .. ": 1x." ..CTRPFW.Shared.Items["water_bottle"]["label"] .. ": 1x."},
		[5] = {costs = CTRPFW.Shared.Items["cuttedchicken"]["label"] .. ": 1x, " ..CTRPFW.Shared.Items["oil"]["label"] .. ": 1x, " ..CTRPFW.Shared.Items["masala"]["label"] .. ": 1x" ..CTRPFW.Shared.Items["veggies"]["label"] .. ": 1x." ..CTRPFW.Shared.Items["water_bottle"]["label"] .. ": 1x."},
		[6] = {costs = CTRPFW.Shared.Items["golgappa"]["label"] .. ": 1x, " ..CTRPFW.Shared.Items["oil"]["label"] .. ": 1x,"},
		[7] = {costs = CTRPFW.Shared.Items["salt"]["label"] .. ": 1x, " ..CTRPFW.Shared.Items["water_bottle"]["label"] .. ": 1x,"},
		[8] = {costs = CTRPFW.Shared.Items["flour"]["label"] .. ": 1x, " ..CTRPFW.Shared.Items["water_bottle"]["label"] .. ": 1x,"},
		[9] = {costs = CTRPFW.Shared.Items["flour"]["label"] .. ": 1x, " ..CTRPFW.Shared.Items["water_bottle"]["label"] .. ": 1x," ..CTRPFW.Shared.Items["butter"]["label"] .. ": 1x,"},
	}

	local items = {}
	for k, item in pairs(Config.AttachmentsssCrafting["items"]) do
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
	Config.AttachmentsssCrafting["items"] = items
end

function GetAttachmentsssThresholdItems()
	SetupAttachmentsssItemsInfo()
	local items = {}
	for k, item in pairs(Config.AttachmentsssCrafting["items"]) do
		if CTRPFW.Functions.GetPlayerData().metadata["attachmentcraftingrep"] >= Config.AttachmentsssCrafting["items"][k].threshold then
			items[k] = Config.AttachmentsssCrafting["items"][k]
			
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