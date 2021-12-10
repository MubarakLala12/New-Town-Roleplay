Citizen.CreateThread(function()

    while Config.RemoveHeadshots do
            Citizen.Wait(2000)
            SetPedSuffersCriticalHits(globalPed, false)
    end

end)