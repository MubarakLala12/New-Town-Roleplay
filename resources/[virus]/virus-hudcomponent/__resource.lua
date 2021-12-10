resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

description 'hud'

server_scripts {
	"config.lua",
	"server/money.lua",
	"server/main.lua",
}

client_scripts {
	"config.lua",
	"client/money.lua",
	"client/main.lua",
	"client/stress.lua",
}

ui_page {
	'html/ui.html'
}

files {
	'html/ui.html',
	'html/engine.png',
	'html/engine-red.png',
	'html/seatbelt.png',
	'html/seatbelt-on.png',
	'html/css/main.css',
	'html/css/pricedown_bl-webfont.ttf',
	'html/css/pricedown_bl-webfont.woff',
	'html/css/pricedown_bl-webfont.woff2',
	'html/css/gta-ui.ttf',
	'html/js/app.js',
	'html/css/pdown.ttf',
}
