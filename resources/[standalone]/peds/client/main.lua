-------------------------------------------------------------------- CREATE PEDS -------------------------------------------------------------------
--PEDS--
--http://ragepluginhook.net/PedModels.aspx--

-- Some Shop & Interior NPCs
Citizen.CreateThread(function()
    RequestModel(GetHashKey("a_m_y_business_02"))
	
    while not HasModelLoaded(GetHashKey("a_m_y_business_02")) do
        Wait(1)
    end
	
	if Config.EnableShops then
		for _, item in pairs(Config.Locations2) do
			local npc = CreatePed(4, 0xB3B3F5E6, item.x, item.y, item.z, item.heading, false, true)
			
			SetEntityHeading(npc, item.heading)
			FreezeEntityPosition(npc, false)
			SetEntityInvincible(npc, true)
			SetBlockingOfNonTemporaryEvents(npc, false)

		end

	end
end)


