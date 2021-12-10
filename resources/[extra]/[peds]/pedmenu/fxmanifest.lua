fx_version 'cerulean'
game { 'gta5' }

description "Add-On Ped Skinchange Menu" -- Resource Descrption

dependencies {
    'NativeUI',
}

client_script {
	'@NativeUI/NativeUI.lua',
	'Client/Preload.lua',
	'Config.lua',
	'Client/Client.lua',
}

server_script {
	'Server/Server.lua',
}

-- Add-On Ped Skinchange Menu Made By: FlatracerMOD (aka Flatracer)
