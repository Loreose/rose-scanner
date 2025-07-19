fx_version 'cerulean'
game {'gta5', 'rdr3'}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
lua54 'yes'

author 'Loreose'
description 'ROSE Model Scanner'
version '1.0.0'

client_scripts {
    'client.lua',
}

server_scripts {
    'server.lua',
}

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua',
}
