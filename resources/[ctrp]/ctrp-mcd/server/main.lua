CTRPFW = nil
TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)

CTRPFW.Functions.CreateCallback('ctrp-mcd:server:IsmcdAvailable', function(source, cb)
	local amount = 0
	for k, v in pairs(CTRPFW.Functions.GetPlayers()) do
        local Player = CTRPFW.Functions.GetPlayer(v)
        if Player ~= nil then 
            if (Player.PlayerData.job.name == "mcd" and Player.PlayerData.job.onduty) then
                amount = amount + 1
            end
        end
    end
    cb(amount)
end)



-- CTRPFW.Commands.Add("setmcd", "Give someone a mcd job", {{name="id", help="ID of a player"}}, false, function(source, args)
--     local Player = CTRPFW.Functions.GetPlayer(source)

--     if IsAuthorized(Player.PlayerData.citizenid) then
--         local TargetId = tonumber(args[1])
--         if TargetId ~= nil then
--             local TargetData = CTRPFW.Functions.GetPlayer(TargetId)
--             if TargetData ~= nil then
--                 TargetData.Functions.SetJob("mcd")
--                 TriggerClientEvent('CTRPFW:Notify', TargetData.PlayerData.source, "You are hired as MCD Employee")
--                 TriggerClientEvent('CTRPFW:Notify', source, "You Have ("..TargetData.PlayerData.charinfo.firstname..") hired as MCD employee!")
--             end
--         else
--             TriggerClientEvent('CTRPFW:Notify', source, "You must provide a Player ID!")
--         end
--     else
--         TriggerClientEvent('CTRPFW:Notify', source, "You can't do this!", "error") 
--     end
-- end)

-- CTRPFW.Commands.Add("takemcd", "Take someone's MCD job", {{name="id", help="ID of a player"}}, false, function(source, args)
--     local Player = CTRPFW.Functions.GetPlayer(source)

--     if IsAuthorized(Player.PlayerData.citizenid) then
--         local TargetId = tonumber(args[1])
--         if TargetId ~= nil then
--             local TargetData = CTRPFW.Functions.GetPlayer(TargetId)
--             if TargetData ~= nil then
--                 if TargetData.PlayerData.job.name == "mcdemployee" then
--                     TargetData.Functions.SetJob("unemployed")
--                     TriggerClientEvent('CTRPFW:Notify', TargetData.PlayerData.source, "You have been fired from the job")
--                     TriggerClientEvent('CTRPFW:Notify', source, "("..TargetData.PlayerData.charinfo.firstname..") You have been fired from the job")
--                 else
--                     TriggerClientEvent('CTRPFW:Notify', source, "He/she is not a MCD Employee", "error")
--                 end
--             end
--         else
--             TriggerClientEvent('CTRPFW:Notify', source, "You must provide a Player ID!", "error")
--         end
--     else
--         TriggerClientEvent('CTRPFW:Notify', source, "You can't do this!", "error")
--     end
-- end)

