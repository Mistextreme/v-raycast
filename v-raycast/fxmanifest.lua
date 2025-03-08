fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'V-Scripts https://discord.gg/M9fXSG7wa8'
description 'Get entity data from a raycast.'
version '1.0.0'

shared_script '@ox_lib/init.lua'
shared_script 'config.lua'

client_scripts {
    'client/*.lua'
}

server_scripts {
    'server/*.lua'
}
