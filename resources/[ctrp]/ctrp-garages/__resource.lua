resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'


shared_scripts { 
	'@ctrpfw/import.lua',
    'SharedConfig.lua'
}

client_scripts {
    '@menuv/menuv.lua',
    'client/main.lua',
    'client/gui.lua',
    
}

server_scripts {
    'server/main.lua',
}

dependencies {
    'menuv',
}