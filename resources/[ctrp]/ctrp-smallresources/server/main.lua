CTRPFW = nil

TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)

local VehicleNitrous = {}

RegisterServerEvent('tackle:server:TacklePlayer')
AddEventHandler('tackle:server:TacklePlayer', function(playerId)
    TriggerClientEvent("tackle:client:GetTackled", playerId)
end)

CTRPFW.Functions.CreateCallback('nos:GetNosLoadedVehs', function(source, cb)
    cb(VehicleNitrous)
end)

CTRPFW.Commands.Add("id", "What is my id?", {}, false, function(source, args)
    TriggerClientEvent('chatMessage', source, "SYSTEM", "warning", "ID: "..source)
end)

CTRPFW.Functions.CreateUseableItem("harness", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
    TriggerClientEvent('seatbelt:client:UseHarness', source, item)
end)

RegisterServerEvent('equip:harness')
AddEventHandler('equip:harness', function(item)
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)
    if Player.PlayerData.items[item.slot].info.uses - 1 == 0 then
        TriggerClientEvent("inventory:client:ItemBox", source, CTRPFW.Shared.Items['harness'], "remove")
        Player.Functions.RemoveItem('harness', 1)
    else
        Player.PlayerData.items[item.slot].info.uses = Player.PlayerData.items[item.slot].info.uses - 1
        Player.Functions.SetInventory(Player.PlayerData.items)
    end
end)

RegisterServerEvent('seatbelt:DoHarnessDamage')
AddEventHandler('seatbelt:DoHarnessDamage', function(hp, data)
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)

    if hp == 0 then
        Player.Functions.RemoveItem('harness', 1, data.slot)
    else
        Player.PlayerData.items[data.slot].info.uses = Player.PlayerData.items[data.slot].info.uses - 1
        Player.Functions.SetInventory(Player.PlayerData.items)
    end
end)

CTRPFW.Functions.CreateCallback('joint:ingredient', function(source, cb)
    local src = source
    local Ply = CTRPFW.Functions.GetPlayer(src)
    local weed_2og = Ply.Functions.GetItemByName("weed_2og")
    local rolling_paper = Ply.Functions.GetItemByName("rolling_paper")
    
    if weed_2og ~= nil and rolling_paper ~= nil then
        cb(true)
	else
        cb(false)
    end
end)

CTRPFW.Functions.CreateCallback('sjoint:ingredient', function(source, cb)
  local src = source
  local Ply = CTRPFW.Functions.GetPlayer(src)
  local weed_skunk = Ply.Functions.GetItemByName("weed_skunk")
  local rolling_paper = Ply.Functions.GetItemByName("rolling_paper")
  
  if weed_skunk ~= nil and rolling_paper ~= nil then
      cb(true)
else
      cb(false)
  end
end)


--[[RegisterServerEvent('ctrp-taxes')
AddEventHandler('ctrp-taxes', function(amount)
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)
    local bankamount = Player.PlayerData.money.bank
    local poor = 500
    local medium = 1500
    local rich = 30000
    local tax = (bankamount / 100 * 5) -- change for percentage/tax bracket
    local tax1 = (bankamount / 100 * 7) -- change for percentage/tax bracket
    local tax2 = (bankamount / 100 * 10) -- change for percentage/tax bracket
    local tax3 = (bankamount / 100 * 12) -- change for percentage/tax bracket
    
    if bankamount <= poor then
      Player.Functions.RemoveMoney('bank', tax, "Taxes paid")
      TriggerClientEvent('CTRPFW:Notify', source, "You have paid your taxes", "success")
      TriggerEvent("ctrp-log:server:CreateLog", "banking", "Taxes", "red", "**"..GetPlayerName(src) .. "** has paid $"..tax.."in taxes.")
    
    elseif bankamount > poor and bankamount <= medium then
        Player.Functions.RemoveMoney('bank', tax1, "Taxes paid")
        TriggerClientEvent('CTRPFW:Notify', source, "You have paid your taxes", "success")
        TriggerEvent("ctrp-log:server:CreateLog", "banking", "Taxes", "red", "**"..GetPlayerName(src) .. "** has paid $"..tax1.."in taxes.")
    
    elseif bankamount > medium and bankamount <= rich then
        Player.Functions.RemoveMoney('bank', tax2, "Taxes paid")
        TriggerClientEvent('CTRPFW:Notify', source, "You have paid your taxes", "success")
        TriggerEvent("ctrp-log:server:CreateLog", "banking", "Taxes", "red", "**"..GetPlayerName(src) .. "** has paid $"..tax2.."in taxes.")
    
    elseif bankamount > rich then
        Player.Functions.RemoveMoney('bank', tax3, "Taxes paid")
        TriggerClientEvent('CTRPFW:Notify', source, "You have paid your taxes", "success")
        TriggerEvent("ctrp-log:server:CreateLog", "banking", "Taxes", "red", "**"..GetPlayerName(src) .. "** has paid $"..tax3.."in taxes.")
    end
end)]]

--givecash
CTRPFW.Commands.Add("givecash", "Give money to a person", {{name="id", help="Player ID"},{name="amount", help="Amount of money"}}, true, function(source, args)
    local Player = CTRPFW.Functions.GetPlayer(source)
    local TargetId = tonumber(args[1])
    local Target = CTRPFW.Functions.GetPlayer(TargetId)
    local amount = tonumber(args[2])
    
    if Target ~= nil then
      if amount ~= nil then
        if amount > 0 then
          if Player.PlayerData.money.cash >= amount and amount > 0 then
            if TargetId ~= source then
              TriggerClientEvent('banking:client:CheckDistance', source, TargetId, amount)
            else
              TriggerClientEvent('chatMessage', source, "SYSTEM", "error", "You can't give money to yourself.")     
            end
          else
            TriggerClientEvent('chatMessage', source, "SYSTEM", "error", "You do not have enough money.")
          end
        else
          TriggerClientEvent('chatMessage', source, "SYSTEM", "error", "Quantity must be greater than 0.")
        end
      else
        TriggerClientEvent('chatMessage', source, "SYSTEM", "error", "Fill an amount.")
      end
    else
      TriggerClientEvent('chatMessage', source, "SYSTEM", "error", "Citizen is not in the city.")
    end    
end)
  
RegisterServerEvent('banking:server:giveCash')
AddEventHandler('banking:server:giveCash', function(trgtId, amount)
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)
    local Target = CTRPFW.Functions.GetPlayer(trgtId)
  
    print(src)
    print(trgtId)
  
    if src ~= trgtId then
      Player.Functions.RemoveMoney('cash', amount, "Cash given to "..Player.PlayerData.citizenid)
      Target.Functions.AddMoney('cash', amount, "Cash received from "..Target.PlayerData.citizenid)
  
      TriggerEvent("ctrp-log:server:CreateLog", "banking", "Give money", "blue", "**"..GetPlayerName(src) .. "** has $"..amount.." given to **" .. GetPlayerName(trgtId) .. "**")
      
      TriggerClientEvent('CTRPFW:Notify', trgtId, "You received $"..amount.." of "..Player.PlayerData.charinfo.firstname.."!", 'success')
      TriggerClientEvent('CTRPFW:Notify', src, "You gave $"..amount.." for "..Target.PlayerData.charinfo.firstname.."!", 'success')
    else
      TriggerEvent("ctrp-anticheat:server:banPlayer", "Cheating")
      TriggerEvent("ctrp-log:server:CreateLog", "anticheat", "Player banished! (Not really natural, this is a test, duuuhhh)", "red", "** @everyone " ..GetPlayerName(player).. "** has tried to **"..amount.."reveal oneself")  
    end
end)