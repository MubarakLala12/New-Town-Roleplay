fx_version 'bodacious'
game 'gta5'

name "BetterFight"
description "A better fight system for FiveM."
author "SpecialStos"
version "1.1.9"

client_scripts {
    'config.lua',
    'garbageCollector.lua',
    'crosshair/crosshair.lua',
    'recoil/recoil.lua',
    'recoil/exports.lua',
    'recoil/components.lua',
    'disableHeadshot/disableHeadshot.lua',
    'viewCamForcer/viewCamForcer.lua',
    'weaponDamages/weaponDamages.lua',
    'jumpSpamPrevention/jumpSpamPrevention.lua',
    'rollPrevention/rollPrevention.lua',
    'removeWhipping/removeWhipping.lua',
}

server_scripts {
    'config.lua',
    'versionCheck/versionCheck.lua',
}


exports {
    'AlterSpecificGunRecoil',
    'AlterGeneralGunRecoil',
    'ResetAllGunRecoil',
    'ViewCamForcerJoined',
}

ui_page "/crosshair/html/index.html"

files {
    '/crosshair/html//index.html',
    '/crosshair/html//css/style.css',
    '/crosshair/html//js/script.js',
    '/crosshair/html//img/crosshair.png'
}

