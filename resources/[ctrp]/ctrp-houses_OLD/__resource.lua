resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 's1-wapenhandel'
version '1.0'

ui_page "html/index.html"

shared_scripts { 
	'@ctrpfw/import.lua',
	'config.lua'
}

client_scripts {
	'client/main.lua',
	'client/gui.lua',
	'client/decorate.lua',
}

server_scripts {
	'server/main.lua',
}

files {
	'html/index.html',
	'html/reset.css',
	'html/style.css',
	'html/script.js',
	'html/img/dynasty8-logo.png'
}

server_export {
	'hasKey',
}