fx_version 'cerulean'
game 'gta5'

description 'CTRP-Radio'
version '1.0.0'

shared_scripts {
  'config.lua',
  '@ctrpfw/import.lua'
}

client_scripts {
  'client.lua',
  'animation.lua'
}

server_script 'server.lua'

ui_page('html/ui.html')

files {'html/ui.html', 'html/js/script.js', 'html/css/style.css', 'html/img/cursor.png', 'html/img/radio.png'}