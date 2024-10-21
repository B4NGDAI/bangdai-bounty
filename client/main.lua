lib.locale()
local starting = false
local createdped = {}
local timer = 0
local locationSets = {}
local timerRunning = false

function BountyHandle()
    if not starting then
        Wait(1000)
        MissionStart()
        TriggerEvent("rNotify:NotifyLeft", locale('NotifyTitle'), locale('KillingMessage'), 'swatches_gunsmith', 'gunsmith_engraving_30', 4000)
    else
        TriggerEvent("rNotify:NotifyLeft", locale('NotifyTitle'), locale('AlreadyMission'), 'swatches_gunsmith', 'gunsmith_engraving_30', 4000)
    end
end

CreateThread(function()
    for _, v in pairs(Config.LocationsB) do
        exports['rsg-target']:AddCircleZone(v.name, v.coords, 1, {
            name = v.name,
            debugPoly = false,
        }, {
            options = {
                {
                    type = "client",
                    label = locale('TargetLabel'),
                    action = BountyHandle
                }
            },
            distance = 2.0,
        })
        
        if v.showblip then
            local bountyBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, v.coords)
            SetBlipSprite(bountyBlip, -861219276)
            SetBlipScale(bountyBlip, Config.BlipBounty.blipScale)
            Citizen.InvokeNative(0x9CB1A1623062F402, bountyBlip, Config.BlipBounty.blipName)
        end
    end
end)

function MissionStart()
    locationSets = {}
    for k in pairs(Config.BountyLocation) do
        table.insert(locationSets, k)
    end
    local selectedSet = locationSets[math.random(#locationSets)]
    local chossenCoords = Config.BountyLocation[selectedSet]
    
    for k, coord in ipairs(chossenCoords) do
        local modelHash = GetHashKey(Config.models[math.random(#Config.models)].hash)
        local weaponHash = Config.weapons[math.random(#Config.weapons)].hash

        lib.requestModel(modelHash)

        createdped[k] = CreatePed(modelHash, coord.x, coord.y, coord.z, true, true, true, true)
        Citizen.InvokeNative(0x283978A15512B2FE, createdped[k], true)
        Citizen.InvokeNative(0x23F74C2FDA6E7C61, 953018525, createdped[k])
        GiveWeaponToPed_2(createdped[k], weaponHash, 50, true, true, 1, false, 0.5, 1.0, 1.0, true, 0, 0)
        SetCurrentPedWeapon(createdped[k], weaponHash, true)
        TaskCombatPed(createdped[k], PlayerPedId())
    end

    StartGpsMultiRoute(6, true, true)
    AddPointToGpsMultiRoute(chossenCoords[1].x, chossenCoords[1].y, chossenCoords[1].z)
    SetGpsMultiRouteRender(true)
    
    starting = true
    GameTimer()
    CreateThread(MissionLoop)
end

function MissionLoop()
    local playerPed = PlayerPedId()
    local totalTargets = #createdped
    local remainingTargets = totalTargets

    while starting do
        Wait(0)
        if timer <= 0 then
            TriggerEvent("rNotify:NotifyLeft", locale('NotifyTitle'), "You have failed to complete the mission in time.", 'swatches_gunsmith', 'gunsmith_engraving_30', 4000)
            StopMission()
        elseif IsEntityDead(playerPed) then
            TriggerEvent("rNotify:NotifyLeft", locale('NotifyTitle'), "You have lost your target.", 'swatches_gunsmith', 'gunsmith_engraving_30', 4000)
            StopMission()
        else
            local allDead = true
            for k, v in pairs(createdped) do
                if DoesEntityExist(v) and not IsEntityDead(v) then
                    allDead = false
                    local distance = #(GetEntityCoords(playerPed) - GetEntityCoords(v))
                    if distance < 25.0 then
                        TriggerEvent("rNotify:NotifyLeft", locale('NotifyTitle'), locale('KillAllTarget'), 'swatches_gunsmith', 'gunsmith_engraving_30', 4000)
                    end
                elseif DoesEntityExist(v) and IsEntityDead(v) then
                    DeleteEntity(v)
                    createdped[k] = nil
                    remainingTargets = remainingTargets - 1
                end
            end

            if allDead then
                local paycheck = lib.callback.await('bangdai-bounty:server:addPaySlip', false)
                if paycheck then
                    TriggerEvent("rNotify:NotifyLeft", locale('NotifyTitle'), locale('SuccessKillAll'), 'swatches_gunsmith', 'gunsmith_engraving_30', 4000)
                    StopMission()
                end
            end
        end
    end
end

function GameTimer()
    timer = 1200
    timerRunning = true
    jo.ui.initTimer()
    CreateThread(function()
        while timerRunning and timer > 0 do
            Wait(1000)
            if timer > 0 then
                timer = timer - 1
                jo.ui.startTimer(timer, 10)
            end
        end
        if timer <= 0 or not timerRunning then
            jo.ui.stopTimer()
        end
    end)
end

function StopMission()
    starting = false
    timerRunning = false
    SetGpsMultiRouteRender(false)
    jo.ui.stopTimer()
    for k, v in pairs(createdped) do
        if DoesEntityExist(v) then
            DeleteEntity(v)
        end
        createdped[k] = nil
    end
    locationSets = {}
    timer = 0
end

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        StopMission()
    end
end)