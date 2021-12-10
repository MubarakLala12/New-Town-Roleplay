fx_version 'cerulean'
game { 'gta5' }

name 'Connectqueue'
version '1.0'

server_script "server/sv_queue_config.lua"
server_script "connectqueue.lua"

server_script "shared/sh_queue.lua"
client_script "shared/sh_queue.lua"