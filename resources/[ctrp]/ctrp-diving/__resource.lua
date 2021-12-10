resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

shared_scripts { 
	'@ctrpfw/import.lua',
	'config.lua'
}

server_scripts {
	'server/main.lua',
    'server/diving.lua',
}

client_scripts {
    'client/main.lua',
    'client/boatshop.lua',
    'client/diving.lua',
    'client/garage.lua',
    'client/gui.lua',
    'client/shop.lua'
}