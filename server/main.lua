local Core = exports['rsg-core']:GetCoreObject()

lib.callback.register('bangdai-bounty:server:addPaySlip', function(source)
    local src = source
    local Player = Core.Functions.GetPlayer(src)
    if not Player then return false end

    local payment = Player.Functions.AddMoney('cash', Config.Price, 'bounty-hunter')
    if not payment then
        print("Failed to add payment for player: " .. src)
        return false
    end

    return true
end)