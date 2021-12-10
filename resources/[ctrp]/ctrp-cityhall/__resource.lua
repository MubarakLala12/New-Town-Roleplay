resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

ui_page "html/index.html"

shared_scripts {
	'@ctrpfw/import.lua',
	"config.lua"
} 

server_scripts {
    "server/main.lua",
    "server/safe_gov.lua"
}

client_scripts {
	"client/main.lua",
    "client/safe_gov.lua"
}

files {
    "html/*.js",
    "html/*.html",
    "html/*.css",
    "html/img/*.png",
    "html/img/*.jpg"
}