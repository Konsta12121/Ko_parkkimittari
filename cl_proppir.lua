
local ESX = exports['es_extended']:getSharedObject()

local options = {
    {
        name = 'konsta:mittaritii',
        onSelect = function()
            lib.callback.await("onkopopo", false)
        end,
        icon = 'fa-solid fa-road',
        label = 'Tiirikoidaksesi',
    },
    {
        name = 'ox:option2',
        event = 'ox_target:debug',
        icon = 'fa-solid fa-road',
        label = 'Tarvitsen Murtautumiskeikan',
        canInteract = function(entity , distance, coords, name, bone)
            return not IsEntityDead(entity)
        end
    }
}


local models = { `prop_park_ticket_01`}

exports.ox_target:addModel(models, options)
local dispach = true

lib.callback.register('ryosto', function()
    local itemc = exports.ox_inventory:GetItemCount('lockpick', nil, nil)
    local poliisi = 0 -- Define the 'poliisi' variable
    print(poliisi)
    if itemc >= 1 then
        local success = lib.skillCheck({'medium ', 'medium ', {areaSize = 60, speedMultiplier = 0.5}, 'medium'}, {'w', 'a', 's', 'd'})
        if success then
            lib.callback.await('palkkio', false)
        else
            ESX.ShowNotification('Kusit megapipppelin minipelin.', 5000, 'error') 
            if dispach then
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
        end
    else
        ESX.ShowNotification('Sulla ei ole edes tiirrikkaa...', 5000, 'error') -- 'error' should be a string
    end
end)
