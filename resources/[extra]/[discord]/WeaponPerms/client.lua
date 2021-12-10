--------------------------
--- DiscordWeaponPerms ---
--------------------------
restrictedWeapons = {
{"weapon_p90","weapon_nsr","weapon_m4a4","weapon_specialcarbine_mk2","weapon_assaultrifle_mk2","weapon_pumpshotgun_mk2","COMPONENT_PISTOL_MK2_CAMO_10","COMPONENT_SPECIALCARBINE_MK2_CAMO_09","COMPONENT_ASSAULTRIFLE_MK2_CAMO_09","COMPONENT_PUMPSHOTGUN_MK2_CAMO_09"}, -- Weapon Perms (1)
}
--[[
Weapon components list: https://wiki.rage.mp/index.php?title=Weapons_Components
Weapon list: https://runtime.fivem.net/doc/natives/#_0xBF0FD6E56C964FCB
]]--
isAllowed = {}
RegisterNetEvent('DiscordWeaponPerms:CheckPerms:Return')
AddEventHandler('DiscordWeaponPerms:CheckPerms:Return', function(hasPerms)
	isAllowed = hasPerms
end)
function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end
    return false
end
alreadyRan = false
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(4000)
		if not alreadyRan then
			TriggerServerEvent("DiscordWeaponPerms:CheckPerms")
			alreadyRan = true
		end
		--TriggerServerEvent("Print:PrintDebug", "It gets here 1") -- DEBUG - GET RID OF
		local ped = GetPlayerPed(-1)
		local weapon = GetSelectedPedWeapon(ped)
		local restrictedStr = ""
		local requiredPerm = nil
		for i=1, #restrictedWeapons do
			local weaponArr = restrictedWeapons[i]
			for j=1, #weaponArr do
				-- Check if the weapon is restricted and for what group, or if it's the attachment
				if weapon == GetHashKey(weaponArr[j]) then
					-- This weapon is restricted unless they have this role perm
					requiredPerm = i
					restrictedStr = weaponArr[j]
					break
				elseif (HasPedGotWeaponComponent(ped, weapon, GetHashKey(weaponArr[j]))) then
					-- It's restricted unless they have this role perm
					requiredPerm = i
					restrictedStr = weaponArr[j]
					break
				end
			end
		end
		--TriggerServerEvent("Print:PrintDebug", "It gets here 2") -- DEBUG - GET RID OF
		-- Check their perms
		if not has_value(isAllowed, requiredPerm) and requiredPerm ~= nil then
			-- Does not have perms to use this
			RemoveWeaponFromPed(ped, weapon)
			TriggerServerEvent("WeaponPerm:notification")
		end
		--TriggerServerEvent("Print:PrintDebug", "It gets here 3") -- DEBUG - GET RID OF
	end
end)

function DisplayNotification( text )
    SetNotificationTextEntry( "STRING" )
    AddTextComponentString( text )
    DrawNotification( false, false )
end