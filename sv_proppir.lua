
local ESX = exports['es_extended']:getSharedObject()

lib.callback.register('parkingMeter:reward', function(source)
    local itemAmount = math.random(500, 2000)
    exports.ox_inventory:AddItem(source, 'money', itemAmount, nil, nil, nil)
end)

lib.callback.register('parkingMeter:getPoliceCount', function(source)
    return #ESX.GetExtendedPlayers('job', 'police')
end)
