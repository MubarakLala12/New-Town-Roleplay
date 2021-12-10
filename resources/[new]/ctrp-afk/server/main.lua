RegisterServerEvent("KickForAFK")
AddEventHandler("KickForAFK", function()
	DropPlayer(source, "You Have Been Kicked For Being AFK")
end)

CTRPFW.Functions.CreateCallback('ctrp-afkkick:server:GetPermissions', function(source, cb)
    local group = CTRPFW.Functions.GetPermission(source)
    cb(group)
end)