CTRPFW = {}
CTRPFW.Config = CTRPConfig
CTRPFW.Shared = CTRPShared
CTRPFW.ServerCallbacks = {}
CTRPFW.UseableItems = {}

function GetCoreObject()
	return CTRPFW
end

RegisterServerEvent('CTRPFW:GetObject')
AddEventHandler('CTRPFW:GetObject', function(cb)
	cb(GetCoreObject())
end)