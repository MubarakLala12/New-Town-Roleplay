fx_version 'cerulean'
game { 'gta5' }

ui_page "ui/index.html"

files {
    "ui/index.html",
    "ui/vue.min.js",
    "ui/script.js",
    "ui/badge.png",
	"ui/footer.png",
	"ui/mugshot.png"
}

server_scripts {
	"sv_mdt.lua",
	"sv_vehcolors.lua"
}

client_script "cl_mdt.lua"
