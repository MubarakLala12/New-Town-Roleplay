CTRPFW = nil
SavedRadio = {}

TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)

CTRPFW.Functions.CreateUseableItem("radio", function(source, item)
	local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.GetItemByName(item.name) ~= nil then
		TriggerClientEvent("radioGui", source)
	end
end)

CTRPFW.Functions.CreateCallback('radio:server:GetItem', function(source, cb, item)
  local src = source
  local Player = CTRPFW.Functions.GetPlayer(src)
  if Player ~= nil then 
    local RadioItem = Player.Functions.GetItemByName(item)
    if RadioItem ~= nil then
      cb(true)
    else
      cb(false)
    end
  else
    cb(false)
  end
end)

RegisterServerEvent("CTRPFW:Player:OnRemovedItem")
AddEventHandler("CTRPFW:Player:OnRemovedItem", function(source, item)
    if item.name == 'radio' and GetItem(source, item.name).count < 1 then
      TriggerEvent("TokoVoip:removePlayerFromAllRadio", source)
    end
end)

function GetItem(source, item)
	local xPlayer = CTRPFW.Functions.GetPlayer(source)
	local count = 0

	for k,v in pairs(xPlayer['PlayerData']['items']) do
		if v.name == item then
			count = count + v.amount
		end
	end
	
	return { name = item, count = count }
end