CreateThread(function()
    for k, v in ipairs(Config.zones) do
        local sphere = lib.zones.sphere({
            coords = v.coords,
            radius = v.radius,
            debug = v.debug,
    
            inside = function ()
            SetEntityInvincible(cache.ped, true)
            if IsControlJustPressed(0, 18) or IsControlJustPressed(0, 6) then
            SetCurrentPedWeapon(cache.ped, 'WEAPON_UNARMED', false)
            end

            local vehicle = GetVehiclePedIsIn(cache.ped, true)
            if vehicle then
            DeleteEntity(vehicle)
            end
            
            end,

            onEnter = function ()
                exports["esx_notify"]:Notify("info", 3000, "Beléptél A Védelmi Zónába!")
            end,
    
            onExit = function ()
                SetEntityInvincible(cache.ped, false)
                exports["esx_notify"]:Notify("info", 3000, "Kiléptél A Védelmi Zónából!")
            end
        })
        
        local blip = AddBlipForCoord(v.blipcoords)
        SetBlipSprite(blip, 487)
        SetBlipColour(blip, 1)
        SetBlipScale(blip, 1.2)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Safe Zone")
        EndTextCommandSetBlipName(blip)

        local blip1 = AddBlipForRadius(v.coords, v.radius)
        SetBlipColour(blip1, 1)
        SetBlipAlpha(blip1, 150)
    end
end)
