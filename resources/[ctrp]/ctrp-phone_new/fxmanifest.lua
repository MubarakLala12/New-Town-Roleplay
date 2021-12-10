fx_version 'cerulean'
game { 'gta5' }

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/js/*.js',
    'html/img/*.png',
    'html/img/backgrounds/*.jpg',
    'html/img/apps/*.png',
    'html/css/*.css',
    'html/fonts/*.ttf'
}

client_scripts {
    'client/main.lua',
    'client/animations.lua',
    'client/photo.lua',
    '@ctrp-garages/SharedConfig.lua',
    '@ctrp-apartments/config.lua',
}

server_scripts {
    'server/main.lua',
    'config.lua',
    '@ctrp-garages/SharedConfig.lua',
    '@ctrp-apartments/config.lua',
}

exports {
    'InPhone'
}