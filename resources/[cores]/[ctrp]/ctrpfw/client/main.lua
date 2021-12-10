CTRPFW = {}
CTRPFW.PlayerData = {}
CTRPFW.Config = CTRPConfig
CTRPFW.Shared = CTRPShared
CTRPFW.ServerCallbacks = {}

isLoggedIn = false

function GetCoreObject()
	return CTRPFW
end

RegisterNetEvent('CTRPFW:GetObject')
AddEventHandler('CTRPFW:GetObject', function(cb)
	cb(GetCoreObject())
end)

RegisterNetEvent('CTRPFW:Client:OnPlayerLoaded')
AddEventHandler('CTRPFW:Client:OnPlayerLoaded', function()
	ShutdownLoadingScreenNui()
	isLoggedIn = true
end)

RegisterNetEvent('CTRPFW:Client:OnPlayerUnload')
AddEventHandler('CTRPFW:Client:OnPlayerUnload', function()
    isLoggedIn = false
end)
