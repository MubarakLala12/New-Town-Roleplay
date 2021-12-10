fx_version 'cerulean'
game { 'gta5' }

name 'Virus Script'
version '1.0'

-- Client Scripts
client_script 'client/main.lua'

-- Server Scripts
server_script 'server/main.lua'

-- NUI Default Page
ui_page('client/html/index.html')

-- Files needed for NUI
files {
    'client/html/index.html',
    'client/html/sounds/*.ogg',
}
