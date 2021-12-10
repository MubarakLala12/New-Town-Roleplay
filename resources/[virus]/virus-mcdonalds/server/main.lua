CTRPFW = nil
TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)


local _isitemvalid = false


ItemsPlayerCanBuy = { -- Prevents Exploiting...
  "mcd-wrap",
  "mcd-wrap-c",
  "mcd-burger",
  "mcd-burger-c",
  "mcd-fries",
  "mcd-nuggets",
  "mcd-maharaja",
  "mcd-chickenpop",
  "mcd-spicypaneer",
  "mcd-egg",
  "mcd-strawberry",
  "mcd-mango",
  "mcd-icetea",
  "mcd-iced",
  "mcd-cappuccino",
  "mcd-hchocolate",
  "mcd-caramel",
  "kurkakola",
  "combomeal",
}

RegisterServerEvent('virus-mcdonalds:makeanorder')
AddEventHandler('virus-mcdonalds:makeanorder', function(data)
    local _src = source
    local _char = CTRPFW.Functions.GetPlayer(_src)
    local _charmoney = _char.PlayerData.money["bank"]
    local _price = tonumber(data.price * data.amount)
    
    for k,v in pairs(ItemsPlayerCanBuy) do
      if v == data.item then
        _isitemvalid = true
      end
    end
    if _isitemvalid then
      if _charmoney >= _price and _price > 0 then
        
        _char.Functions.RemoveMoney('bank', _price)

        virusmcdItem = data.item
        
        print(data.item)
        --_char.addInventoryItem(data.item, data.amount)

        TriggerClientEvent("CTRPFW:Notify", _src, "You have placed the order , Please wait 1min , For - "..data.item.." " , "error", 5000)
        Citizen.Wait(math.random(30000,60000))
        TriggerClientEvent("CTRPFW:Notify", _src, "Your Order Ready! - "..data.item.." ", "error", 5000)
        _char.Functions.AddItem(data.item, data.amount)
        
     
      else
        TriggerClientEvent("CTRPFW:Notify", _src, "You don't have enough money! .", "error", 5000)
      end
    
    end
end)



