lua54 'yes'

use_experimental_fxv2_oal 'yes'

game 'gta5'

fx_version 'cerulean'

dependency 'esx_lib'

shared_script '@esx_lib/imports/shared/package.lua'

client_script 'client/**'


file { 

    'shared/**',
    'client/**', 
    'html/**'
    
}

ui 'html/index.html'