-- CTRPFW = nil

-- TriggerEvent("CTRPFW:GetObject", function(obj) CTRPFW = obj end)

CTRPFW.Commands.Add("createbill", "Create a bill to send to another player", {{name="id", help="Player ID"},{name="amount", help="Value of the bill"},{name="reason", help="Reason for the bill"}}, false, function(source, args)
    Player = CTRPFW.Functions.GetPlayer(source)
    OtherPlayer = CTRPFW.Functions.GetPlayer(tonumber(args[1]))
    if Player ~= nil then
        if Player.PlayerData.job.name == "police" or Player.PlayerData.job.name == 'mechanic' or Player.PlayerData.job.name == "doctor" or  Player.PlayerData.job.name == "pdm" or Player.PlayerData.job.name == "bahamas" or Player.PlayerData.job.name == "comclub" or Player.PlayerData.job.name == "cinema" or Player.PlayerData.job.name == "mcd" or Player.PlayerData.job.name == "coffee" or Player.PlayerData.job.name == "dhaba" or Player.PlayerData.job.name == "infinitymechanic4" then
            if OtherPlayer ~= nil then
                name = Player.PlayerData.charinfo.firstname.." "..Player.PlayerData.charinfo.lastname
                playerId = tonumber(args[1])
                price = tonumber(args[2])
                citizenid = Player.PlayerData.citizenid
                
                table.remove(args, 1)
                table.remove(args, 1)
                local reason = table.concat(args, " ")


                TriggerClientEvent("billing:client:sendBillingMail", playerId, name, price, reason,citizenid)
            else
                TriggerClientEvent('chatMessage', source, "SYSTEM", "error", "Player is not online")
            end
        else
            TriggerClientEvent('chatMessage', source, "SYSTEM", "error", "You are not authorised to this command!")
        end
    end
end)

RegisterNetEvent('billing:server:PayBill')
AddEventHandler('billing:server:PayBill',function(data)
    Player = CTRPFW.Functions.GetPlayer(source)
    OtherPlayer = CTRPFW.Functions.GetPlayerByCitizenId(data[2])
    if Player ~= nil then
       Balance = Player.PlayerData.money["bank"]
       
       if Balance - data[1] >= 0 then
            Player.Functions.RemoveMoney("bank",data[1],"paid-bill")
            if OtherPlayer ~= nil then
                OtherPlayer.Functions.AddMoney("bank",data[1],"recieved-bill")
                TriggerClientEvent("CTRPFW:Notify",OtherPlayer.PlayerData.source, "You received $"..data[1].." from "..Player.PlayerData.charinfo.firstname.. " ".. Player.PlayerData.charinfo.lastname , "success")
            end
       end
    end
end)

--mail
CTRPFW.Commands.Add("sendmail", "Create a Mail to send to another player", {{name="id", help="Player ID"},{name="reason", help="Reason for the mail"}}, false, function(source, args)
    Player = CTRPFW.Functions.GetPlayer(source)
    OtherPlayer = CTRPFW.Functions.GetPlayer(tonumber(args[1]))
    if Player ~= nil then
        if OtherPlayer ~= nil then
                name = Player.PlayerData.charinfo.firstname..""..Player.PlayerData.charinfo.lastname
                playerId = tonumber(args[1])
                citizenid = Player.PlayerData.citizenid
                
                table.remove(args, 1)
                local reason = table.concat(args, " ")


                TriggerClientEvent("billing:client:sendBillingMail1", playerId, name, reason, citizenid)
        else
            TriggerClientEvent('chatMessage', source, "SYSTEM", "error", "Player is not online")
        end
    end
end)
