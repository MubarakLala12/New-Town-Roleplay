CTRPFW = nil
TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)

local permissions = {
    ["kick"] = "god",
    ["ban"] = "god",
    ["noclip"] = "god",
    ["kickall"] = "god",
}

RegisterServerEvent('virus-god:server:togglePlayerNoclip')
AddEventHandler('virus-god:server:togglePlayerNoclip', function(playerId, reason)
    local src = source
    if CTRPFW.Functions.HasPermission(src, permissions["noclip"]) then
        TriggerClientEvent("virus-god:client:toggleNoclip", playerId)
    end
end)

RegisterServerEvent('virus-god:server:killPlayer')
AddEventHandler('virus-god:server:killPlayer', function(playerId)
    TriggerClientEvent('hospital:client:KillPlayer', playerId)
    TriggerEvent('ctrp-logs:server:createLog', 'god', 'virus-god:server:killPlayer', "Killed " .. GetPlayerName(playerId), source)
end)

RegisterServerEvent('virus-god:server:kickPlayer')
AddEventHandler('virus-god:server:kickPlayer', function(playerId, reason)
    local src = source
    if CTRPFW.Functions.HasPermission(src, permissions["kick"]) then
        DropPlayer(playerId, "You have been kicked out of the server:\n"..reason.."\n\n🔸 Check our website for more information: realisticlife.co.il")
        TriggerEvent('ctrp-logs:server:createLog', 'god', 'virus-god:server:kickPlayer', "Player "  .. GetPlayerName(playerId) .." Kicked successfully.", src)
    else
        TriggerEvent('ctrp-logs:server:createLog', 'god', 'virus-god:server:kickPlayer', "Tried to kick "  .. GetPlayerName(playerId) .." with no perms.", src)
    end
end)

RegisterServerEvent('virus-god:server:Freeze')
AddEventHandler('virus-god:server:Freeze', function(playerId, toggle)
    local src = source
    TriggerClientEvent('virus-god:client:Freeze', playerId, toggle)
    TriggerEvent('ctrp-logs:server:createLog', 'god', 'virus-god:server:Freeze', "Freezed "  .. GetPlayerName(playerId) .." [" .. tostring(toggle) .."].", src)
end)

RegisterServerEvent('virus-god:server:banPlayer')
AddEventHandler('virus-god:server:banPlayer', function(playerId, time, reason)
    local src = source
    if CTRPFW.Functions.HasPermission(src, permissions["ban"]) then
        local time = tonumber(time)
        local banTime = tonumber(os.time() + time)
        if banTime > 2147483647 then
            banTime = 2147483647
        end
        local timeTable = os.date("*t", banTime)
        CTRPFW.Functions.ExecuteSql(false, "INSERT INTO `bans` (`name`, `steam`, `license`, `discord`,`ip`, `reason`, `expire`, `bannedby`) VALUES ('"..GetPlayerName(playerId).."', '"..GetPlayerIdentifiers(playerId)[1].."', '"..GetPlayerIdentifiers(playerId)[2].."', '"..GetPlayerIdentifiers(playerId)[3].."', '"..GetPlayerIdentifiers(playerId)[4].."', '"..reason.."', "..banTime..", '"..GetPlayerName(src).."')")
        DropPlayer(playerId, "You have been banned from the server:\n"..reason.."\nYour ban expires in "..timeTable["day"].. "/" .. timeTable["month"] .. "/" .. timeTable["year"] .. " " .. timeTable["hour"].. ":" .. timeTable["min"] .. "\nCheck our website for more information:  www.realistic-life.co.il")
        TriggerEvent('ctrp-logs:server:createLog', 'god', 'virus-god:server:banPlayer', "Banned "  .. GetPlayerName(playerId) .." for " .. tostring(banTime) .." with reason " .. reason, src)
    end
end)

RegisterServerEvent('virus-god:server:revivePlayer')
AddEventHandler('virus-god:server:revivePlayer', function(target)
    TriggerClientEvent('hospital:client:Revive', target)
    TriggerEvent('ctrp-logs:server:createLog', 'god', 'virus-god:server:revivePlayer', "Used god revive on "  .. GetPlayerName(target) ..".", src)
end)

CTRPFW.Commands.Add("god", "Open god menu", {}, false, function(source, args)
    local group = CTRPFW.Functions.GetPermission(source)
    local dealers = exports['ctrp-drugs']:GetDealers()
    TriggerClientEvent('virus-god:client:openMenu', source, 'god', dealers)
end, "god")


--[[CTRPFW.Commands.Add("givenuifocus", "Give nui focus", {{name="id", help="Speler id"}, {name="focus", help="Turn focus on / off"}, {name="mouse", help="Turn mouse on / off"}}, true, function(source, args)
    local playerid = tonumber(args[1])
    local focus = args[2]
    local mouse = args[3]

    TriggerClientEvent('virus-god:client:GiveNuiFocus', playerid, focus, mouse)
end, "god")]]

CTRPFW.Commands.Add("enablekeys", "Enable all keys for player.", {{name="id", help="Player id"}}, true, function(source, args)
    local playerid = tonumber(args[1])

    TriggerClientEvent('virus-god:client:EnableKeys', playerid)
end, "god")

--[[CTRPFW.Commands.Add("warn", "Give a person a warning", {{name="ID", help="Person"}, {name="Reason", help="Enter a reason"}}, true, function(source, args)
    local targetPlayer = CTRPFW.Functions.GetPlayer(tonumber(args[1]))
    local senderPlayer = CTRPFW.Functions.GetPlayer(source)
    table.remove(args, 1)
    local msg = table.concat(args, " ")

    local myName = senderPlayer.PlayerData.name

    local warnId = "WARN-"..math.random(1111, 9999)

    if targetPlayer ~= nil then
        TriggerClientEvent('chatMessage', targetPlayer.PlayerData.source, "SYSTEM", "error", "You have been warned by: "..GetPlayerName(source)..", Reason: "..msg)
        TriggerClientEvent('chatMessage', source, "SYSTEM", "error", "You have "..GetPlayerName(targetPlayer.PlayerData.source).." warned for: "..msg)
        CTRPFW.Functions.ExecuteSql(false, "INSERT INTO `player_warns` (`senderIdentifier`, `targetIdentifier`, `reason`, `warnId`) VALUES ('"..senderPlayer.PlayerData.steam.."', '"..targetPlayer.PlayerData.steam.."', '"..msg.."', '"..warnId.."')")
    else
        TriggerClientEvent('CTRPFW:Notify', source, 'This person is not in the city of #YOLO, hmm I am '..myName..' and I stink loloololo', 'error')
    end 
end, "god")

CTRPFW.Commands.Add("checkwarns", "Give a person a warning", {{name="ID", help="Persoon"}, {name="Warning", help="Number of warning, (1, 2 of 3 etc..)"}}, false, function(source, args)
    if args[2] == nil then
        local targetPlayer = CTRPFW.Functions.GetPlayer(tonumber(args[1]))
        CTRPFW.Functions.ExecuteSql(false, "SELECT * FROM `player_warns` WHERE `targetIdentifier` = '"..targetPlayer.PlayerData.steam.."'", function(result)
            TriggerClientEvent('chatMessage', source, "SYSTEM", "warning", targetPlayer.PlayerData.name.." heeft "..tablelength(result).." warnings!")
        end)
    else
        local targetPlayer = CTRPFW.Functions.GetPlayer(tonumber(args[1]))

        CTRPFW.Functions.ExecuteSql(false, "SELECT * FROM `player_warns` WHERE `targetIdentifier` = '"..targetPlayer.PlayerData.steam.."'", function(warnings)
            local selectedWarning = tonumber(args[2])

            if warnings[selectedWarning] ~= nil then
                local sender = CTRPFW.Functions.GetPlayer(warnings[selectedWarning].senderIdentifier)

                TriggerClientEvent('chatMessage', source, "SYSTEM", "warning", targetPlayer.PlayerData.name.." has been warned by "..sender.PlayerData.name..", Reason: "..warnings[selectedWarning].reason)
            end
        end)
    end
end, "god")]]

CTRPFW.Commands.Add("delwarn", "Remove warning from person", {{name="ID", help="Persoon"}, {name="Warning", help="Number of warning, (1, 2 of 3 etc..)"}}, true, function(source, args)
    local targetPlayer = CTRPFW.Functions.GetPlayer(tonumber(args[1]))

    CTRPFW.Functions.ExecuteSql(false, "SELECT * FROM `player_warns` WHERE `targetIdentifier` = '"..targetPlayer.PlayerData.steam.."'", function(warnings)
        local selectedWarning = tonumber(args[2])

        if warnings[selectedWarning] ~= nil then
            local sender = CTRPFW.Functions.GetPlayer(warnings[selectedWarning].senderIdentifier)

            TriggerClientEvent('chatMessage', source, "SYSTEM", "warning", "You have warning ("..selectedWarning..") removed, Reason: "..warnings[selectedWarning].reason)
            CTRPFW.Functions.ExecuteSql(false, "DELETE FROM `player_warns` WHERE `warnId` = '"..warnings[selectedWarning].warnId.."'")
        end
    end)
end, "god")

function tablelength(table)
    local count = 0
    for _ in pairs(table) do 
        count = count + 1 
    end
    return count
end

CTRPFW.Commands.Add("setmodel", "Change into a model of your choice..", {{name="model", help="Name of the model"}, {name="id", help="Player ID (leave blank for yourself)"}}, false, function(source, args)
    local model = args[1]
    local target = tonumber(args[2])

    if model ~= nil or model ~= "" then
        if target == nil then
            TriggerClientEvent('virus-god:client:SetModel', source, tostring(model))
        else
            local Trgt = CTRPFW.Functions.GetPlayer(target)
            if Trgt ~= nil then
                TriggerClientEvent('virus-god:client:SetModel', target, tostring(model))
            else
                TriggerClientEvent('CTRPFW:Notify', source, "This person is not in town yeet..", "error")
            end
        end
    else
        TriggerClientEvent('CTRPFW:Notify', source, "You have not provided a Model ..", "error")
    end
end, "god")

CTRPFW.Commands.Add("setspeed", "Change into a model of your choice ..", {}, false, function(source, args)
    local speed = args[1]

    if speed ~= nil then
        TriggerClientEvent('virus-god:client:SetSpeed', source, tostring(speed))
    else
        TriggerClientEvent('CTRPFW:Notify', source, "You did not specify Speed ​​.. (`fast` for super-run,` normal` for normal)", "error")
    end
end, "god")

CTRPFW.Commands.Add("godcar", "Save vehicle in your garage", {}, false, function(source, args)
    local ply = CTRPFW.Functions.GetPlayer(source)
    TriggerClientEvent('virus-god:client:SaveCar', source)
end, "god")

RegisterServerEvent('virus-god:server:SaveCar')
AddEventHandler('virus-god:server:SaveCar', function(mods, vehicle, hash, plate)
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)
    CTRPFW.Functions.ExecuteSql(false, "SELECT * FROM `player_vehicles` WHERE `plate` = '"..plate.."'", function(result)
        if result[1] == nil then
            CTRPFW.Functions.ExecuteSql(false, "INSERT INTO `player_vehicles` (`steam`, `citizenid`, `vehicle`, `hash`, `mods`, `plate`, `state`) VALUES ('"..Player.PlayerData.steam.."', '"..Player.PlayerData.citizenid.."', '"..vehicle.model.."', '"..vehicle.hash.."', '"..json.encode(mods).."', '"..plate.."', 0)")
            TriggerClientEvent('CTRPFW:Notify', src, 'The vehicle is now in your name!', 'success', 5000)
        else
            TriggerClientEvent('CTRPFW:Notify', src, 'This vehicle is already in your garage..', 'error', 3000)
        end
    end)
end)

RegisterServerEvent('virus-god:server:bringTp')
AddEventHandler('virus-god:server:bringTp', function(targetId, coords)
    TriggerClientEvent('virus-god:client:bringTp', targetId, coords)
end)

RegisterServerEvent('virus-god:server:gotoTp')
AddEventHandler('virus-god:server:gotoTp', function(targetid, playerid)
    TriggerClientEvent('virus-god:client:gotoTp', targetid, playerid)
end)

RegisterServerEvent('virus-god:server:gotoTpstage2')
AddEventHandler('virus-god:server:gotoTpstage2', function(targetid, coords)
    TriggerClientEvent('virus-god:client:gotoTp2', targetid, coords)
end)

CTRPFW.Functions.CreateCallback('virus-god:server:hasPermissions', function(source, cb, group)
    local src = source
    local retval = false

    if CTRPFW.Functions.HasPermission(src, group) then
        retval = true
    end
    cb(retval)
end)



RegisterServerEvent('virus-god:server:setPermissions')
AddEventHandler('virus-god:server:setPermissions', function(targetId, group)
    CTRPFW.Functions.AddPermission(targetId, group.rank)
    TriggerClientEvent('CTRPFW:Notify', targetId, 'Your permission group is set to '..group.label)
end)

RegisterServerEvent('virus-god:server:OpenSkinMenu')
AddEventHandler('virus-god:server:OpenSkinMenu', function(targetId)
    TriggerClientEvent("ctrp-clothing:client:openMenu", targetId)
end)

RegisterServerEvent('virus-god:server:OpenBarberMenu')
AddEventHandler('virus-god:server:OpenBarberMenu', function(targetId)
    TriggerClientEvent("ctrp-clothing:client:openBarberMenu", targetId)
end)

RegisterServerEvent('virus-god:server:OpenTattooMenu')
AddEventHandler('virus-god:server:OpenTattooMenu', function(targetId)
    TriggerClientEvent("virus-tattoo:client:tattooppen", targetId)
end)


RegisterServerEvent('virus-god:server:spawnWeapon')
AddEventHandler('virus-god:server:spawnWeapon', function(weapon)
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)
    Player.Functions.AddItem(weapon, 1)
end)

RegisterServerEvent('virus-god:server:crash')
AddEventHandler('virus-god:server:crash', function(id)
    TriggerClientEvent("virus-god:client:crash", id)
end)

RegisterServerEvent('virus-god:server:SendReport')
AddEventHandler('virus-god:server:SendReport', function(name, targetSrc, msg)
    local src = source
    local Players = CTRPFW.Functions.GetPlayers()

    if CTRPFW.Functions.HasPermission(src, "god") then
        if CTRPFW.Functions.IsOptin(src) then
            TriggerClientEvent('chatMessage', src, "REPORT - "..name.." ("..targetSrc..")", "report", msg)
        end
    end
end)

RegisterServerEvent('virus-god:server:GodChatMessage')
AddEventHandler('virus-god:server:GodChatMessage', function(name, msg)
    local src = source
    local Players = CTRPFW.Functions.GetPlayers()

    if CTRPFW.Functions.HasPermission(src, "god") then
        if CTRPFW.Functions.IsOptin(src) then

            TriggerClientEvent('chatMessage', src, "GODCHAT - "..name, "error", msg)
        end
    end
end)

CTRPFW.Commands.Add("gmsg", "Send a message to all god members", {{name="message", help="Message"}}, true, function(source, args)
    local msg = table.concat(args, " ")

    TriggerClientEvent('virus-god:client:SendGodChat', -1, GetPlayerName(source), msg)
end, "god")

CTRPFW.Commands.Add("setammo", "Staff: Set manual ammo for a weapon.", {{name="amount", help="The amount of bullets, e.g .: 20"}, {name="weapon", help="Name of weapon, eg: WEAPON_RAILGUN"}}, false, function(source, args)
    local src = source
    local weapon = args[2] ~= nil and args[2] or "current"
    local amount = tonumber(args[1]) ~= nil and tonumber(args[1]) or 250

    TriggerClientEvent('ctrp-weapons:client:SetWeaponAmmoManual', src, weapon, amount)
end, 'god')
