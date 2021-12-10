

Citizen.CreateThread(function()

    while Config.UseCustomCrosshair do
                local crosshair = false
                local toggled = false
                local aiming = true

                Citizen.Wait(100)
                if globalIsPedArmed then
                    local carcam = vehicleViewCam
                    local cam = viewCam
                        if (globalIsPlayerFreeAiming)  then

                            aiming = true
                            crosshair = true
                            toggled = false

                            Citizen.Wait(100)
                            if(Config.RemoveCrosshairOnFirstPerson)then
                                if(not viewcamforcer)then
                                    SendNUIMessage({
                                        display = "crosshairShow",
                                    })
                                end
                            else
                                SendNUIMessage({
                                    display = "crosshairShow",
                                })
                            end

                            if(globalIsPedInAnyVehicle)then
                                SendNUIMessage({
                                    display = "crosshairShow",
                                })
                            end

                        else
                            SendNUIMessage({
                                display = "crosshairHide",
                            })

                            crosshair = false
                            aiming = false
                            toggled = false
                            Citizen.Wait(500)
                        end
                end
                if not globalIsPedArmed then
                    SendNUIMessage({
                        display = "crosshairHide",
                    })
                    Citizen.Wait(1000)
                end
    end

    Citizen.Wait(1000)
    SendNUIMessage({
        display = "crosshairHide",
    })


end)


local scopedWeapons = 
{
    100416529,  -- WEAPON_SNIPERRIFLE
    205991906,  -- WEAPON_HEAVYSNIPER
    3342088282  -- WEAPON_MARKSMANRIFLE
}

local hide = false

function HashInTable(hash)
    for k, v in pairs( scopedWeapons ) do 
        if ( hash == v ) then 
            return true 
        end 
    end 

    return false 
end 

Citizen.CreateThread(function()
    while Config.UseCustomCrosshair do 
        
            local ped = globalPed

            if (DoesEntityExist(ped) and not IsEntityDead(ped)) then
                if(globalIsPedArmed)then
                    local hash = globalGetCurrentWeapon
            
                    if (globalIsPlayerFreeAiming and not HashInTable(hash)) then 
                        hide = true
                    else
                        hide = false 
                    end
                end
            else
                Citizen.Wait(1000)
            end
            Citizen.Wait(200)
    end 
end)

Citizen.CreateThread(function()
    while Config.UseCustomCrosshair do 
            if hide then
                HideHudComponentThisFrame(14)
            end
            Citizen.Wait(4)
    end 
end )
