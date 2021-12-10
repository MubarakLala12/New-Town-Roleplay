fx_version 'cerulean'
game { 'gta5' }

description 'Police'

shared_scripts {
	'@ctrpfw/import.lua',
}

client_scripts {
	'@menuv/menuv.lua',
	'config.lua',
	'client/main.lua',
	'client/camera.lua',
	'client/interactions.lua',
	'client/job.lua',
	'client/gui.lua',
	'client/heli.lua',
	--'client/anpr.lua',
	'client/evidence.lua',
	'client/objects.lua',
	'client/tracker.lua',
	'client/gsr_cl.lua',
	'client/cl_badge.lua',
	'client/safe_police.lua',
	
}

server_scripts {
	'config.lua',
	'server/main.lua',
	'server/gsr_sv.lua',
	'server/safe_police.lua',
}

ui_page "html/index.html"

files {
    "html/index.html",
    "html/vue.min.js",
	"html/script.js",
	"html/tablet-frame.png",
	"html/fingerprint.png",
	"html/main.css",
	"html/vcr-ocd.ttf",
}

exports {
	'IsHandcuffed',
	'IsArmoryWhitelist'
}

dependencies {
    'menuv',
}