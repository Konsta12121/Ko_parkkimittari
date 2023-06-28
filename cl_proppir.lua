
local ESX = exports['es_extended']:getSharedObject()
local models = { `prop_park_ticket_01`, `prop_park_ticket_01`}

local function policeAlarm()
    local data = exports['cd_dispatch']:GetPlayerInfo()
    TriggerServerEvent('cd_dispatch:AddNotification', {
        job_table = {'police'},
        coords = data.coords,
        title = ' Pysäköintiautomaatti ',
        message = 'Pysäköintiautomaatin automaattinen hälytys lauennut kohteessa:  '..data.street,
        flash = 0,
        unique_id = data.unique_id,
        sound = 1,
        blip = {
            sprite = 431,
            scale = 1.2,
            colour = 3,
            flashes = false,
            text = '112 - Parkkiautomaatti',
            time = 5,
            radius = 0
        }
    })
end

exports.ox_target:addModel(models, {
    {
        name = 'parkingMeter',
        label = 'Ryöstä parkkimittari',
        icon = 'fa-solid fa-parking-square',
        items = 'lockpick',
        onSelect = function()
            local policeCount = lib.callback.await('parkingMeter:getPoliceCount', false)
            if policeCount < 1 then
                print('ei tarpeeks poliiseja')
                return
            end

            local success = lib.skillCheck({'medium ', 'medium ', {areaSize = 60, speedMultiplier = 0.5}, 'medium'}, {'w', 'a', 's', 'd'})
            if not success then
                policeAlarm()
                return
            end

            lib.callback.await('parkingMeter:reward', source)
        end,
    }
})
