fx_version 'cerulean'
game { 'gta5' }

shared_scripts {
	'@ctrpfw/import.lua',
	'config.lua'
}

server_scripts {
	'source/fuel_server.lua'
}

client_scripts {
	'source/fuel_client.lua'
}

exports {
	'GetFuel',
	'SetFuel'
}
