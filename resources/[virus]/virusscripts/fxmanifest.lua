fx_version 'cerulean'
game { 'gta5' }

name 'Virus Script'
version '1.0'
description 'Combined'

shared_scripts {
	'@ctrpfw/import.lua',
	'config.lua'
}

client_scripts {
    'client/*.lua',
}

server_scripts {
    'server/*.lua'
}
