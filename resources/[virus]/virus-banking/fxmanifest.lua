fx_version 'adamant'
games {'gta5'}

--shared_script "@nevo-scripts/cl_errorlog.lua"

server_scripts {
    'config/config.lua',
    'server/wrappers/buisness.lua',
    'server/wrappers/useraccounts.lua',
    'server/wrappers/gangs.lua',
    'server/main.lua'
}

client_scripts {
    'config/config.lua',
    'client/main.lua',
    'client/nui.lua'
}

ui_page 'nui/index.html'

files {
    'nui/images/logo2.png',
    'nui/images/logo.png',
    'nui/scripting/jquery-ui.css',
    'nui/scripting/external/jquery/jquery.js',
    'nui/scripting/jquery-ui.js',
    'nui/style.css',
    'nui/index.html',
    'nui/virus-banking.js',
}