fx_version 'bodacious'

games { 'gta5' }

client_script 'settings.lua'

client_script 'client.lua'

server_script '@mysql-async/lib/MySQL.lua'

server_script 'server.lua'

ui_page 'interface/interface.html'

files {
    
    'interface/*'
    
}