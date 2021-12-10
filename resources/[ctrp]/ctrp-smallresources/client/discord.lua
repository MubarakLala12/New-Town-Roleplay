local WaitTime = 1000 -- How often do you want to update the status (In MS)
local appid = '880997968352776252' -- Make an application @ https://discordapp.com/developers/applications/ ID can be found there.
local asset = 'ctrp_logo_main' -- Go to https://discordapp.com/developers/applications/APPID/rich-presence/assets

function SetRP()
    local name = GetPlayerName(PlayerId())
    local id = GetPlayerServerId(PlayerId())

    SetDiscordAppId(appid)
	SetDiscordRichPresenceAsset(asset)
	SetDiscordRichPresenceAssetText('Crime Town Roleplay')
	SetDiscordRichPresenceAssetSmallText("Crime Town Roleplay")
end


Citizen.CreateThread(function()

	SetRP()

	while true do
		local pName = GetPlayerName(PlayerId())
		local playerCount = #GetActivePlayers()
		SetDiscordRichPresenceAction(0, "Join Discord", "https://discord.gg/j4FDFYdBFp")


		Citizen.Wait(WaitTime)

		SetRP()
		SetRichPresence(playerCount.."/64 & "..pName.." is enjoying the RP")
	end
end)