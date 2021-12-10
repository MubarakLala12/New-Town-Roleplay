resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'taquilla-job'

client_scripts {
	'config.lua',
	'client/main.lua',
	'client/gui.lua',
}

server_scripts {
    'server/main.lua',
	'config.lua',
}


