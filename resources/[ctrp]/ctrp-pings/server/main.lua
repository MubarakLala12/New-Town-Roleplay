CTRPFW = nil
TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)

-- Code

local Pings = {}

CTRPFW.Commands.Add("ping", "", {{name = "action", help="id | accept | deny"}}, true, function(source, args)
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)
    local task = args[1]
    local PhoneItem = Player.Functions.GetItemByName("phone")

    if PhoneItem ~= nil then
        if task == "accept" then
            if Pings[src] ~= nil then
                TriggerClientEvent('ctrp-pings:client:AcceptPing', src, Pings[src], CTRPFW.Functions.GetPlayer(Pings[src].sender))
                TriggerClientEvent('CTRPFW:Notify', Pings[src].sender, Player.PlayerData.charinfo.firstname.." "..Player.PlayerData.charinfo.lastname.." accepted your ping!")
                Pings[src] = nil
            else
                TriggerClientEvent('CTRPFW:Notify', src, "You don't have a ping open..", "error")
            end
        elseif task == "deny" then
            if Pings[src] ~= nil then
                TriggerClientEvent('CTRPFW:Notify', Pings[src].sender, "Your ping has been rejected..", "error")
                TriggerClientEvent('CTRPFW:Notify', src, "Tiy rejected the ping..", "success")
                Pings[src] = nil
            else
                TriggerClientEvent('CTRPFW:Notify', src, "You don't have a ping open..", "error")
            end
        else
            TriggerClientEvent('ctrp-pings:client:DoPing', src, tonumber(args[1]))
        end
    else
        TriggerClientEvent('CTRPFW:Notify', src, "You don't have a phone..", "error")
    end
end)

RegisterServerEvent('ctrp-pings:server:SendPing')
AddEventHandler('ctrp-pings:server:SendPing', function(id, coords)
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)
    local Target = CTRPFW.Functions.GetPlayer(id)
    local PhoneItem = Player.Functions.GetItemByName("phone")

    if PhoneItem ~= nil then
        if Target ~= nil then
            local OtherItem = Target.Functions.GetItemByName("phone")
            if OtherItem ~= nil then
                TriggerClientEvent('CTRPFW:Notify', src, "You sent a ping to "..Target.PlayerData.charinfo.firstname.." "..Target.PlayerData.charinfo.lastname)
                Pings[id] = {
                    coords = coords,
                    sender = src,
                }
                TriggerClientEvent('CTRPFW:Notify', id, "You received a ping from "..Player.PlayerData.charinfo.firstname.." "..Player.PlayerData.charinfo.lastname..". /ping 'accept | deny'")
            else
                TriggerClientEvent('CTRPFW:Notify', src, "Could not send the ping, person may dont have a phone.", "error")
            end
        else
            TriggerClientEvent('CTRPFW:Notify', src, "This person is not online..", "error")
        end
    else
        TriggerClientEvent('CTRPFW:Notify', src, "You dont have a phone", "error")
    end
end)

RegisterServerEvent('ctrp-pings:server:SendLocation')
AddEventHandler('ctrp-pings:server:SendLocation', function(PingData, SenderData)
    TriggerClientEvent('ctrp-pings:client:SendLocation', PingData.sender, PingData, SenderData)
end)
