Citizen.CreateThread(function()

    if(Config.UseCustomWeaponDamages)then
        for k, v in pairs(Config.Weapons) do
            Citizen.Wait(50)
            SetWeaponDamageModifier(v.hash, v.damageMultiplier) 
        end
    end

end)