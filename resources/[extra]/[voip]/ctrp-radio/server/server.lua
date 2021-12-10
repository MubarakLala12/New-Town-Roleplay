CTRPFW = nil
TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)

-- Code

CTRPFW.Functions.CreateUseableItem("radio", function(source, item)
  local Player = CTRPFW.Functions.GetPlayer(source)
  TriggerClientEvent('ctrp-radio:use', source)
end)

CTRPFW.Functions.CreateCallback('ctrp-radio:server:GetItem', function(source, cb, item)
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