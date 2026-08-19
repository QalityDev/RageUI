fx_version 'cerulean'
game 'gta5'

name 'RageUI Standalone'
author 'Grande France'
description 'RageUI Menu Framework Standalone pour FiveM (ESX / OX / Standalone)'
version '1.0.0'

ui_page 'web/index.html'

client_scripts {
    'client/rageui.lua',
    'client/example.lua'
}

server_scripts {
    'server/main.lua'
}

files {
    'web/index.html',
    'web/style.css',
    'web/script.js'
}

exports {
    'GetRageUI'
}
