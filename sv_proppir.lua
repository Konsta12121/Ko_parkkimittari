
local ESX = exports['es_extended']:getSharedObject()

lib.callback.register('palkkio', function()
    local itemAmount = math.random(500, 2000)
    exports.ox_inventory:AddItem(source, 'money', itemAmount, nil, nil, nil)
end)

lib.callback.register("onkoryostettu", function()
    while true do
        if ryostettu then
            TriggerClientEvent('esx:showNotification', source, 'Tää on jo ryöstetty!', 'error', 3000)
            SetTimeout(600000, function()
                ryostettu = false
            
            end)
        else
                ryostettu = true
            lib.callback("ryosto", source, false)
           end
   Wait(1000)
    end
end)


lib.callback.register('onkopopo', function(source)
    local poliisi = 0
    local pelaajas = GetPlayers()
    for i=1, #pelaajas, 1 do
        local pelaaja = ESX.GetPlayerFromId(pelaajas[i])
        if pelaaja ~= nil and pelaaja.job.name == 'police' then
            poliisi = poliisi + 1
        end
    end
    if poliisi >= 1 then
        lib.callback.await('ryosto', source)
    else
        print("eikyttia")
    end
end)
