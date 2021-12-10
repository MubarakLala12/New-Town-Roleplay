resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

description 'Qbus:Apartments'

shared_scripts {
	'@ctrpfw/import.lua',
	"config.lua"
} 
server_scripts {
	"server/main.lua"
}

client_scripts {
	'@menuv/menuv.lua',
	"client/main.lua",
	"client/gui.lua"
}

dependencies {
	'ctrp-interior',
}