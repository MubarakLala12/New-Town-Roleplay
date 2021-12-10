fx_version 'cerulean'
game 'gta5'

description 'CTRP Core'

shared_scripts { 
	'import.lua',
	'config.lua',
	'shared.lua'
}


server_scripts {
	"server/main.lua",
	"server/functions.lua",
	"server/player.lua",
	--"server/loops.lua",
	"server/events.lua",
	"server/commands.lua",
	"server/debug.lua",
}

client_scripts {
	"client/main.lua",
	"client/functions.lua",
	"client/loops.lua",
	"client/events.lua",
	"client/debug.lua",
}

ui_page {
	'html/ui.html'
}

files {
	'html/ui.html',
	'html/css/main.css',
	'html/js/app.js',
}