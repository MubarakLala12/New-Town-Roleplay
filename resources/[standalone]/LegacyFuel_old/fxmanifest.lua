fx_version 'cerulean'
game { 'gta5' }

server_scripts {
	'config.lua',
	'source/fuel_server.lua'
}

client_scripts {
	'config.lua',
	'source/fuel_client.lua'
}

exports {
	'GetFuel',
	'SetFuel'
}
