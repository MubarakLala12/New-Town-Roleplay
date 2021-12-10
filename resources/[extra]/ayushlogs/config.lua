Config = {}

Config.AllLogs = true											-- Enable/Disable All Logs Channel
Config.postal = true  											-- set to false if you want to disable nerest postal (https://forum.cfx.re/t/release-postal-code-map-minimap-new-improved-v1-2/147458)
Config.username = "CTRP LOGS" 							-- Bot Username
Config.avatar = "https://cdn.discordapp.com/attachments/755443626619699271/850470236544434196/LOGO_1.png"				-- Bot Avatar
Config.communtiyName = "Crime Town Roleplay"					-- Icon top of the embed
Config.communtiyLogo = "https://cdn.discordapp.com/attachments/755443626619699271/850470236544434196/LOGO_1.png"		-- Icon top of the embed
Config.FooterText = "ctrp © ayush"						-- Footer text for the embed
Config.FooterIcon = "https://cdn.discordapp.com/attachments/755443626619699271/850470236544434196/LOGO_1.png"			-- Footer icon for the embed


Config.weaponLog = true  			-- set to false to disable the shooting weapon logs
Config.InlineFields = true			-- set to false if you don't want the player details next to each other

Config.playerID = true				-- set to false to disable Player ID in the logs
Config.steamID = true				-- set to false to disable Steam ID in the logs
Config.steamURL = true				-- set to false to disable Steam URL in the logs
Config.discordID = true				-- set to false to disable Discord ID in the logs
Config.license = true				-- set to false to disable license in the logs
Config.IP = true					-- set to false to disable IP in the logs

-- Change color of the default embeds here
-- It used Decimal or Hex color codes. They will both work.
Config.BaseColors ={		-- For more info have a look at the docs: https://docs.prefech.com
	chat = "#A1A1A1",				-- Chat Message
	joins = "#3AF241",				-- Player Connecting
	leaving = "#F23A3A",			-- Player Disconnected
	deaths = "#000000",				-- Shooting a weapon
	shooting = "#2E66F2",			-- Player Died
	resources = "#EBEE3F",			-- Resource Stopped/Started	
}


Config.webhooks = {		-- For more info have a look at the docs: https://docs.prefech.com
	all = "https://discord.com/api/webhooks/850471254041296926/8D2wpPbgZUvwLucH89blLF2j7Au5cbySU-AHpWgstta88B6NsYf_xGp_U-DGWZtpBQaW",		-- All logs will be send to this channel
	chat = "https://discord.com/api/webhooks/850471417241665537/N5OOdDGUxSlE2hrGbzFnmHQ161bDWNXKkM-Non6cXSQ7x0iD-2X0qYGZ4iMd6cXqk8Jq",		-- Chat Message
	joins = "https://discord.com/api/webhooks/850471505955389461/GlkK2bqAnbu7_76NPLXPW4b-1P12UYqMHRpTpJIJ_tE22Cg7cG89pKA9ehTSgcQnUv44",		-- Player Connecting
	leaving = "https://discord.com/api/webhooks/850471598540193833/5SdoItPGBfYhgPmgqTbj0IwVYtYjlFHUqsl9wMArBZAsoRqrEEeBvT0sIaYOcHjML9dW",	-- Player Disconnected
	deaths = "https://discord.com/api/webhooks/850471722204921876/NTbLsNr-7zuxH8EhRLsC02hGxYkr5lVZOik3dNfSuQVdUfD1ZvmkagTGhsed7F_GNcj1",		-- Shooting a weapon
	shooting = "https://discord.com/api/webhooks/850471815365132359/d0g7ESXk0fGTOpygKSm4bkEMTEplMX6TngW07xCAOnFEF3xlLIAI74EKfx3t5tSqcG-7",	-- Player Died
	resources = "https://discord.com/api/webhooks/850471902316462150/Ah056M6xou5AXnvmgVMvBQ36BwqERZ8LRaaUfeUsrDm9q0pkHkO5KGz1NzIYlYjwTWcg",	-- Resource Stopped/Started	
}

Config.TitleIcon = {		-- For more info have a look at the docs: https://docs.prefech.com
	chat = "💬",				-- Chat Message
	joins = "📥",				-- Player Connecting
	leaving = "📤",			-- Player Disconnected
	deaths = "💀",				-- Shooting a weapon
	shooting = "🔫",			-- Player Died
	resources = "🔧",			-- Resource Stopped/Started	
}

Config.Plugins = {
	--["PluginName"] = {color = "#FFFFFF", icon = "🔗", webhook = "DISCORD_WEBHOOK"},
	["NameChange"] = {color = "#03fc98", icon = "🔗", webhook = "DISCORD_WEBHOOK"},
}


 --Debug shizzels :D
Config.debug = false
Config.versionCheck = "1.3.0"
