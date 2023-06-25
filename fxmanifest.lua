        
fx_version('cerulean')
games({ 'gta5' })

lua54 'yes'

author "konsta#3868"

description "Ko_DarkWeb"

server_scripts{
  'sv_*.lua'
}

client_scripts{
    'cl_*.lua'
}

shared_script '@ox_lib/init.lua'
