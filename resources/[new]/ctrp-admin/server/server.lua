-- Variables
local frozen = false
local permissions = {
    ["kill"] = "god",
    ["ban"] = "god",
    ["noclip"] = "admin",
    ["kickall"] = "god",
    ["kick"] = "admin"
}

-- Get Dealers
CTRPFW.Functions.CreateCallback('test:getdealers', function(source, cb)
    cb(exports['ctrp-drugs']:GetDealers())
end)

-- Get Players
CTRPFW.Functions.CreateCallback('test:getplayers', function(source, cb) -- WORKS
    local players = {}
    for k, v in pairs(CTRPFW.Functions.GetPlayers()) do
        local targetped = GetPlayerPed(v)
        local ped = CTRPFW.Functions.GetPlayer(v)
        table.insert(players, {
            name = ped.PlayerData.charinfo.firstname .. " " .. ped.PlayerData.charinfo.lastname .. " | (" .. GetPlayerName(v) .. ")",
            id = v,
            coords = GetEntityCoords(targetped),
            cid = ped.PlayerData.charinfo.firstname .. " " .. ped.PlayerData.charinfo.lastname,
            citizenid = ped.PlayerData.citizenid,
            sources = GetPlayerPed(ped.PlayerData.source),
            sourceplayer= ped.PlayerData.source

        })
    end
    cb(players)
end)

CTRPFW.Functions.CreateCallback('ctrp-admin:server:getrank', function(source, cb)
    if CTRPFW.Functions.HasPermission(source, "god") then
        cb(true)
    else
        cb(false)
    end
end)

-- Functions

function tablelength(table)
    local count = 0
    for _ in pairs(table) do
        count = count + 1
    end
    return count
end

-- Events

RegisterServerEvent('ctrp-admin:server:GetPlayersForBlips')       
AddEventHandler('ctrp-admin:server:GetPlayersForBlips', function()
    local src = source					                        
    local players = {}                                          
    for k, v in pairs(CTRPFW.Functions.GetPlayers()) do         
        local targetped = GetPlayerPed(v)                       
        local ped = CTRPFW.Functions.GetPlayer(v)             
        table.insert(players, {                             
            name = ped.PlayerData.charinfo.firstname .. " " .. ped.PlayerData.charinfo.lastname .. " | (" .. GetPlayerName(v) .. ")",
            id = v,                                      
            coords = GetEntityCoords(targetped),             
            cid = ped.PlayerData.charinfo.firstname .. " " .. ped.PlayerData.charinfo.lastname,
            citizenid = ped.PlayerData.citizenid,            
            sources = GetPlayerPed(ped.PlayerData.source),    
            sourceplayer= ped.PlayerData.source              
        })                                                  
    end                                                  
    TriggerClientEvent('ctrp-admin:client:Show', src, players)  
end)

RegisterNetEvent("ctrp-admin:server:kill")
AddEventHandler("ctrp-admin:server:kill", function(player)
    TriggerClientEvent('hospital:client:KillPlayer', player.id)
end)

RegisterNetEvent("ctrp-admin:server:revive")
AddEventHandler("ctrp-admin:server:revive", function(player)
    TriggerClientEvent('hospital:client:Revive', player.id)
end)

RegisterNetEvent("ctrp-admin:server:kick")
AddEventHandler("ctrp-admin:server:kick", function(player, reason)
    local src = source
    if CTRPFW.Functions.HasPermission(src, permissions["kick"]) then
        TriggerEvent("ctrp-log:server:CreateLog", "bans", "Player Kicked", "red", string.format('%s was kicked by %s for %s', GetPlayerName(player.id), GetPlayerName(src), reason), true)
        DropPlayer(player.id, "You have been kicked from the server:\n" .. reason .. "\n\n🔸 Check our Discord for more information: " .. CTRPFW.Config.Server.discord)
    end
end)

RegisterNetEvent("ctrp-admin:server:ban")
AddEventHandler("ctrp-admin:server:ban", function(player, time, reason)
    local src = source
    if CTRPFW.Functions.HasPermission(src, permissions["ban"]) then
        local time = tonumber(time)
        local banTime = tonumber(os.time() + time)
        if banTime > 2147483647 then
            banTime = 2147483647
        end
        local timeTable = os.date("*t", banTime)
        CTRPFW.Functions.ExecuteSql(false, "INSERT INTO `bans` (`name`, `steam`, `license`, `discord`,`ip`, `reason`, `expire`, `bannedby`) VALUES ('"..GetPlayerName(playerId).."', '"..GetPlayerIdentifiers(playerId)[1].."', '"..GetPlayerIdentifiers(playerId)[2].."', '"..GetPlayerIdentifiers(playerId)[3].."', '"..GetPlayerIdentifiers(playerId)[4].."', '"..reason.."', "..banTime..", '"..GetPlayerName(src).."')")
        TriggerClientEvent('chat:addMessage', -1, {
            template = '<div class="chat-message server"><strong>ANNOUNCEMENT | {0} has been banned:</strong> {1}</div>',
            args = {GetPlayerName(player.id), reason}
        })
        TriggerEvent("ctrp-log:server:CreateLog", "bans", "Player Banned", "red", string.format('%s was banned by %s for %s', GetPlayerName(player.id), GetPlayerName(src), reason), true)
        if banTime >= 2147483647 then
            DropPlayer(player.id, "You have been banned:\n" .. reason .. "\n\nYour ban is permanent.\n🔸 Check our Discord for more information: " .. CTRPFW.Config.Server.discord)
        else
            DropPlayer(player.id, "You have been banned:\n" .. reason .. "\n\nBan expires: " .. timeTable["day"] .. "/" .. timeTable["month"] .. "/" .. timeTable["year"] .. " " .. timeTable["hour"] .. ":" .. timeTable["min"] .. "\n🔸 Check our Discord for more information: " .. CTRPFW.Config.Server.discord)
        end
    end
end)

RegisterNetEvent("ctrp-admin:server:spectate")
AddEventHandler("ctrp-admin:server:spectate", function(player)
    local src = source
    local targetped = GetPlayerPed(player.id)
    local coords = GetEntityCoords(targetped)
    TriggerClientEvent('ctrp-admin:client:spectate', src, player.id, coords)
end)

RegisterNetEvent("ctrp-admin:server:chatko")
AddEventHandler("ctrp-admin:server:chatko", function(player)
    TriggerClientEvent('ctrp-admin:client:chatko', player.id)
end)

RegisterNetEvent("ctrp-admin:server:freeze")
AddEventHandler("ctrp-admin:server:freeze", function(player)
    local target = GetPlayerPed(player.id)
    if not frozen then
        frozen = true
        FreezeEntityPosition(target, true)
    else
        frozen = false
        FreezeEntityPosition(target, false)
    end
end)

RegisterNetEvent('ctrp-admin:server:goto')
AddEventHandler('ctrp-admin:server:goto', function(player)
    local src = source
    local admin = GetPlayerPed(src)
    local coords = GetEntityCoords(GetPlayerPed(player.id))
    SetEntityCoords(admin, coords)
end)

RegisterNetEvent('ctrp-admin:server:intovehicle')
AddEventHandler('ctrp-admin:server:intovehicle', function(player)
    local src = source
    local admin = GetPlayerPed(src)
    -- local coords = GetEntityCoords(GetPlayerPed(player.id))
    local targetPed = GetPlayerPed(player.id)
    local vehicle = GetVehiclePedIsIn(targetPed,false)
    local seat = -1
    if CTRPFW.Functions.HasPermission(src, "god") then
        if vehicle ~= 0 then
            for i=0,8,1 do
                if GetPedInVehicleSeat(vehicle,i) == 0 then
                    seat = i
                    break
                end
            end
            if seat ~= -1 then
                SetPedIntoVehicle(admin,vehicle,seat)
                TriggerClientEvent('CTRPFW:Notify', src, 'Entered vehicle', 'success', 5000)
            else
                TriggerClientEvent('CTRPFW:Notify', src, 'The vehicle has no free seats!', 'error', 5000)
            end
        end
    else
        TriggerClientEvent('CTRPFW:Notify', src, 'Test!', 'error', 5000) 
    end
end)

RegisterNetEvent('ctrp-admin:server:bring')
AddEventHandler('ctrp-admin:server:bring', function(player)
    local src = source
    local admin = GetPlayerPed(src)
    local coords = GetEntityCoords(admin)
    local target = GetPlayerPed(player.id)
    SetEntityCoords(target, coords)
end)

RegisterNetEvent("ctrp-admin:server:inventory")
AddEventHandler("ctrp-admin:server:inventory", function(player)
    local src = source
    TriggerClientEvent('ctrp-admin:client:inventory', src, player.id)
end)

RegisterNetEvent("ctrp-admin:server:cloth")
AddEventHandler("ctrp-admin:server:cloth", function(player)
	TriggerClientEvent("ctrp-clothing:client:openMenu", player.id)
end)

RegisterServerEvent('ctrp-admin:server:setPermissions')
AddEventHandler('ctrp-admin:server:setPermissions', function(targetId, group)
    local src = source
    if CTRPFW.Functions.HasPermission(src, "god") then
        CTRPFW.Functions.AddPermission(targetId, group[1].rank)
        TriggerClientEvent('CTRPFW:Notify', targetId, 'Your Permission Level Is Now '..group[1].label)
    end
end)

RegisterServerEvent('ctrp-admin:server:SendReport')
AddEventHandler('ctrp-admin:server:SendReport', function(name, targetSrc, msg)
    local src = source
    local Players = CTRPFW.Functions.GetPlayers()

    if CTRPFW.Functions.HasPermission(src, "admin") then
        if CTRPFW.Functions.IsOptin(src) then
            TriggerClientEvent('chatMessage', src, "REPORT - "..name.." ("..targetSrc..")", "report", msg)
        end
    end
end)

RegisterServerEvent('ctrp-admin:server:StaffChatMessage')
AddEventHandler('ctrp-admin:server:StaffChatMessage', function(name, msg)
    local src = source
    local Players = CTRPFW.Functions.GetPlayers()

    if CTRPFW.Functions.HasPermission(src, "admin") then
        if CTRPFW.Functions.IsOptin(src) then
            TriggerClientEvent('chatMessage', src, "STAFFCHAT - "..name, "error", msg)
        end
    end
end)

RegisterServerEvent('ctrp-admin:server:SaveCar')
AddEventHandler('ctrp-admin:server:SaveCar', function(mods, vehicle, hash, plate)
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

-- Commands

CTRPFW.Commands.Add("blips", "Show blips for players (Admin Only)", {}, false, function(source, args) 
    TriggerClientEvent('ctrp-admin:client:toggleBlips', source)   
end, "admin")                                                   

CTRPFW.Commands.Add("names", "Show player name overhead (Admin Only)", {}, false, function(source, args)   
    TriggerClientEvent('ctrp-admin:client:toggleNames', source)                                               
end, "admin")

CTRPFW.Commands.Add("coords", "Enable coord display for development stuff (Admin Only)", {}, false, function(source, args)
    TriggerClientEvent('ctrp-admin:client:ToggleCoords', source)
end, "god")

CTRPFW.Commands.Add("admincar", "Save Vehicle To Your Garage (Admin Only)", {}, false, function(source, args)
    local ply = CTRPFW.Functions.GetPlayer(source)
    TriggerClientEvent('ctrp-admin:client:SaveCar', source)
end, "god")

CTRPFW.Commands.Add("announce", "Make An Announcement (Admin Only)", {}, false, function(source, args)
    local msg = table.concat(args, " ")
    for i = 1, 3, 1 do
        TriggerClientEvent('chatMessage', -1, "SYSTEM", "error", msg)
    end
end, "admin")

CTRPFW.Commands.Add("admin", "Open Admin Menu (Admin Only)", {}, false, function(source, args)
    TriggerClientEvent('ctrp-admin:client:openMenu', source)
end, "admin")

CTRPFW.Commands.Add("report", "Admin Report", {{name="message", help="Message"}}, true, function(source, args)
    local msg = table.concat(args, " ")
    local Player = CTRPFW.Functions.GetPlayer(source)
    TriggerClientEvent('ctrp-admin:client:SendReport', -1, GetPlayerName(source), source, msg)
    TriggerClientEvent('chatMessage', source, "REPORT Send", "normal", msg)
    TriggerEvent("ctrp-log:server:CreateLog", "report", "Report", "green", "**"..GetPlayerName(source).."** (CitizenID: "..Player.PlayerData.citizenid.." | ID: "..source..") **Report:** " ..msg, false)
end)

CTRPFW.Commands.Add("smsg", "Send A Message To All Staff (Admin Only)", {{name="message", help="Message"}}, true, function(source, args)
    local msg = table.concat(args, " ")
    TriggerClientEvent('ctrp-admin:client:SendStaffChat', -1, GetPlayerName(source), msg)
end, "admin")

CTRPFW.Commands.Add("givenuifocus", "Give A Player NUI Focus (Admin Only)", {{name="id", help="Player id"}, {name="focus", help="Set focus on/off"}, {name="mouse", help="Set mouse on/off"}}, true, function(source, args)
    local playerid = tonumber(args[1])
    local focus = args[2]
    local mouse = args[3]
    TriggerClientEvent('ctrp-admin:client:GiveNuiFocus', playerid, focus, mouse)
end, "admin")

CTRPFW.Commands.Add("warn", "Warn A Player (Admin Only)", {{name="ID", help="Player"}, {name="Reason", help="Mention a reason"}}, true, function(source, args)
    local targetPlayer = CTRPFW.Functions.GetPlayer(tonumber(args[1]))
    local senderPlayer = CTRPFW.Functions.GetPlayer(source)
    table.remove(args, 1)
    local msg = table.concat(args, " ")

    local myName = senderPlayer.PlayerData.name

    local warnId = "WARN-"..math.random(1111, 9999)

    if targetPlayer ~= nil then
        TriggerClientEvent('chatMessage', targetPlayer.PlayerData.source, "SYSTEM", "error", "You have been warned by Admin:-Reason: "..msg)
        TriggerClientEvent('chatMessage', source, "SYSTEM", "error", "You have warned "..GetPlayerName(targetPlayer.PlayerData.source).." for: "..msg)
        CTRPFW.Functions.ExecuteSql(false, "INSERT INTO `player_warns` (`senderIdentifier`, `targetIdentifier`, `reason`, `warnId`) VALUES ('"..senderPlayer.PlayerData.steam.."', '"..targetPlayer.PlayerData.steam.."', '"..msg.."', '"..warnId.."')")
    else
        TriggerClientEvent('CTRPFW:Notify', source, 'This player is not online', 'error')
    end
end, "admin")

CTRPFW.Commands.Add("checkwarns", "Check Player Warnings (Admin Only)", {{name="ID", help="Player"}, {name="Warning", help="Number of warning, (1, 2 or 3 etc..)"}}, false, function(source, args)
    if args[2] == nil then
        local targetPlayer = CTRPFW.Functions.GetPlayer(tonumber(args[1]))
        local result = exports.ghmattimysql:executeSync('SELECT * FROM player_warns WHERE targetIdentifier=@targetIdentifier', {['@targetIdentifier'] = targetPlayer.PlayerData.license})
        TriggerClientEvent('chatMessage', source, "SYSTEM", "warning", targetPlayer.PlayerData.name.." has "..tablelength(result).." warnings!")
    else
        local targetPlayer = CTRPFW.Functions.GetPlayer(tonumber(args[1]))
        local warnings = exports.ghmattimysql:executeSync('SELECT * FROM player_warns WHERE targetIdentifier=@targetIdentifier', {['@targetIdentifier'] = targetPlayer.PlayerData.license})
        local selectedWarning = tonumber(args[2])
        if warnings[selectedWarning] ~= nil then
            local sender = CTRPFW.Functions.GetPlayer(warnings[selectedWarning].senderIdentifier)
            TriggerClientEvent('chatMessage', source, "SYSTEM", "warning", targetPlayer.PlayerData.name.." has been warned by "..sender.PlayerData.name..", Reason: "..warnings[selectedWarning].reason)
        end
    end
end, "admin")

CTRPFW.Commands.Add("delwarn", "Delete Players Warnings (Admin Only)", {{name="ID", help="Player"}, {name="Warning", help="Number of warning, (1, 2 or 3 etc..)"}}, true, function(source, args)
    local targetPlayer = CTRPFW.Functions.GetPlayer(tonumber(args[1]))
    local warnings = exports.ghmattimysql:executeSync('SELECT * FROM player_warns WHERE targetIdentifier=@targetIdentifier', {['@targetIdentifier'] = targetPlayer.PlayerData.license})
    local selectedWarning = tonumber(args[2])
    if warnings[selectedWarning] ~= nil then
        local sender = CTRPFW.Functions.GetPlayer(warnings[selectedWarning].senderIdentifier)
        TriggerClientEvent('chatMessage', source, "SYSTEM", "warning", "You have deleted warning ("..selectedWarning..") , Reason: "..warnings[selectedWarning].reason)
        exports.ghmattimysql:execute('DELETE FROM player_warns WHERE warnId=@warnId', {['@warnId'] = warnings[selectedWarning].warnId})
    end
end, "god")

CTRPFW.Commands.Add("reportr", "Reply To A Report (Admin Only)", {}, false, function(source, args)
    local playerId = tonumber(args[1])
    table.remove(args, 1)
    local msg = table.concat(args, " ")
    local OtherPlayer = CTRPFW.Functions.GetPlayer(playerId)
    local Player = CTRPFW.Functions.GetPlayer(source)
    if OtherPlayer ~= nil then
        TriggerClientEvent('chatMessage', playerId, "ADMIN", "warning", msg)
        TriggerClientEvent('CTRPFW:Notify', source, "Sent reply")
        for k, v in pairs(CTRPFW.Functions.GetPlayers()) do
            if CTRPFW.Functions.HasPermission(v, "admin") then
                if CTRPFW.Functions.IsOptin(v) then
                    TriggerClientEvent('chatMessage', v, "REPORT REPLY("..source..") - "..GetPlayerName(source), "warning", msg)
                    TriggerEvent("ctrp-log:server:CreateLog", "report", "Report Reply", "red", "**"..GetPlayerName(source).."** replied on: **"..OtherPlayer.PlayerData.name.. " **(ID: "..OtherPlayer.PlayerData.source..") **Message:** " ..msg, false)
                end
            end
        end
    else
        TriggerClientEvent('CTRPFW:Notify', source, "Player is not online", "error")
    end
end, "admin")

CTRPFW.Commands.Add("setmodel", "Change Ped Model (Admin Only)", {{name="model", help="Name of the model"}, {name="id", help="Id of the Player (empty for yourself)"}}, false, function(source, args)
    local model = args[1]
    local target = tonumber(args[2])
    if model ~= nil or model ~= "" then
        if target == nil then
            TriggerClientEvent('ctrp-admin:client:SetModel', source, tostring(model))
        else
            local Trgt = CTRPFW.Functions.GetPlayer(target)
            if Trgt ~= nil then
                TriggerClientEvent('ctrp-admin:client:SetModel', target, tostring(model))
            else
                TriggerClientEvent('CTRPFW:Notify', source, "This person is not online..", "error")
            end
        end
    else
        TriggerClientEvent('CTRPFW:Notify', source, "You did not set a model..", "error")
    end
end, "god")

CTRPFW.Commands.Add("setspeed", "Set Player Foot Speed (Admin Only)", {}, false, function(source, args)
    local speed = args[1]
    if speed ~= nil then
        TriggerClientEvent('ctrp-admin:client:SetSpeed', source, tostring(speed))
    else
        TriggerClientEvent('CTRPFW:Notify', source, "You did not set a speed.. (`fast` for super-run, `normal` for normal)", "error")
    end
end, "god")

CTRPFW.Commands.Add("reporttoggle", "Toggle Incoming Reports (Admin Only)", {}, false, function(source, args)
    CTRPFW.Functions.ToggleOptin(source)
    if CTRPFW.Functions.IsOptin(source) then
        TriggerClientEvent('CTRPFW:Notify', source, "You are receiving reports", "success")
    else
        TriggerClientEvent('CTRPFW:Notify', source, "You are not receiving reports", "error")
    end
end, "admin")

RegisterCommand("kickall", function(source, args, rawCommand)
    local src = source
    if src > 0 then
        local reason = table.concat(args, ' ')
        local Player = CTRPFW.Functions.GetPlayer(src)

        if CTRPFW.Functions.HasPermission(src, "god") then
            if args[1] ~= nil then
                for k, v in pairs(CTRPFW.Functions.GetPlayers()) do
                    local Player = CTRPFW.Functions.GetPlayer(v)
                    if Player ~= nil then
                        DropPlayer(Player.PlayerData.source, reason)
                    end
                end
            else
                TriggerClientEvent('chatMessage', src, 'SYSTEM', 'error', 'Mention a reason..')
            end
        else
            TriggerClientEvent('chatMessage', src, 'SYSTEM', 'error', 'You can\'t do this..')
        end
    else
        for k, v in pairs(CTRPFW.Functions.GetPlayers()) do
            local Player = CTRPFW.Functions.GetPlayer(v)
            if Player ~= nil then
                DropPlayer(Player.PlayerData.source, "Server restart, check our Discord for more information: " .. CTRPFW.Config.Server.discord)
            end
        end
    end
end, false)

CTRPFW.Commands.Add("setammo", "Set Your Ammo Amount (Admin Only)", {{name="amount", help="Amount of bullets, for example: 20"}, {name="weapon", help="Name of the weapen, for example: WEAPON_VINTAGEPISTOL"}}, false, function(source, args)
    local src = source
    local weapon = args[2]
    local amount = tonumber(args[1])

    if weapon ~= nil then
        TriggerClientEvent('ctrp-weapons:client:SetWeaponAmmoManual', src, weapon, amount)
    else
        TriggerClientEvent('ctrp-weapons:client:SetWeaponAmmoManual', src, "current", amount)
    end
end, 'god')

CTRPFW.Commands.Add("noclip", "Enable/Disable Noclip", {}, false, function(source, args)
	local src = source
    local Players = CTRPFW.Functions.GetPlayers()
	if CTRPFW.Functions.HasPermission(source, "admin") then
	TriggerClientEvent('ctrp-admin:client:toggleNoclip', source)
	else
		TriggerClientEvent('chatMessage', src, 'SYSTEM', 'error', 'You can\'t do this weirdo..')
  end
end)


CTRPFW.Commands.Add("cls", "Clear all chat", {} , false, function(source, args)
	local src = source
    local Players = CTRPFW.Functions.GetPlayers()
	if CTRPFW.Functions.HasPermission(source, "god") then
		TriggerClientEvent('chat:clear', -1)
		TriggerClientEvent('CTRPFW:Notify', src, 'Chat Cleared Sucessfully', 'success', 3000)
		else
		TriggerClientEvent('chatMessage', source, "SYSTEM", "error", "Only Staff can use this command!")
	end
end)


RegisterServerEvent('ctrp-admin:server:GodChatMessage')
AddEventHandler('ctrp-admin:server:GodChatMessage', function(name, msg)
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

    TriggerClientEvent('ctrp-admin:client:SendGodChat', -1, GetPlayerName(source), msg)
end, "god")

function restart()
	local xPlayers = CTRPFW.Functions.GetPlayers()
	for i=1, #xPlayers, 1 do
		DropPlayer(xPlayers[i], "All Roleplay situations have ended. Your progress has been saved. City is restarting and will be back in 1 minute!")
	end
	Citizen.Wait(10000)
	os.exit()
end

CTRPFW.Commands.Add("restartcity", "5 Minute City Restart", {}, false, function(source, args, user)
    Citizen.CreateThread(function()
		TriggerClientEvent('chat:addMessage', -1, {
			template = '<div class="restart"><i class="fa fa-bullhorn"></i> {0}<br>^0{1}</div>',
			args = { "Emergency Announcement!", "Attention citizens! 🌊 Tsunami is going to hit the city in 5 minutes!" }
		})
		Citizen.Wait(180000)
		TriggerClientEvent('chat:addMessage', -1, {
			template = '<div class="restart"><i class="fa fa-bullhorn"></i> {0}<br>^0{1}</div>',
			args = { "Emergency Announcement!", "Attention citizens! 🌊 Tsunami is going to hit the city in 2 minutes!" }
		})
		Citizen.Wait(60000)
		TriggerClientEvent('chat:addMessage', -1, {
			template = '<div class="restart"><i class="fa fa-bullhorn"></i> {0}<br>^0{1}</div>',
			args = { "Emergency Announcement!", "Attention citizens! 🌊 Tsunami is going to hit the city in 1 minute!" }
		})
		Citizen.Wait(30000)
		TriggerClientEvent('chat:addMessage', -1, {
			template = '<div class="restart"><i class="fa fa-bullhorn"></i> {0}<br>^0{1}</div>',
			args = { "Emergency Announcement!", "Attention citizens! 🌊 Tsunami is going to hit the city in 30 seconds!" }
		})
		Citizen.Wait(30000)
		restart()
	end)
end, "god")

CTRPFW.Commands.Add("restartcitynow", "Restart the city instantly.", {}, false, function(source, args, user)
    Citizen.CreateThread(function()
		restart()
	end)
end, "god")

AddEventHandler('txAdmin:events:scheduledRestart', function(eventData) -- Gets called every [30, 15, 10, 5, 4, 3, 2, 1] minutes by default according to config
    if eventData.secondsRemaining == 1800 then -- 30mins
        TriggerEvent('ctrp-weathersync:server:setWeather', "thunder")
        TriggerClientEvent('chat:addMessage', -1, {
            template = '<div class="restart"><i class="fa fa-bullhorn"></i> {0}<br>^0{1}</div>',
            args = { "Emergency Announcement!", "Attention citizens! 🌊 Tsunami is going to hit the city in 30 minutes!" }
        })
    elseif eventData.secondsRemaining == 900 then -- 15mins
        TriggerEvent('ctrp-weathersync:server:setWeather', "thunder")
        TriggerClientEvent('chat:addMessage', -1, {
            template = '<div class="restart"><i class="fa fa-bullhorn"></i> {0}<br>^0{1}</div>',
            args = { "Emergency Announcement!", "Attention citizens! 🌊 Tsunami is going to hit the city in 15 minutes!" }
        })
    elseif eventData.secondsRemaining == 300 then -- 5mins
        TriggerEvent('ctrp-weathersync:server:setWeather', "thunder")
        TriggerEvent('ctrp-weathersync:server:tsunami:blackout')
        TriggerClientEvent('chat:addMessage', -1, {
            template = '<div class="restart"><i class="fa fa-bullhorn"></i> {0}<br>^0{1}</div>',
            args = { "Emergency Announcement!", "Attention citizens! 🌊 Tsunami is going to hit the city in 5 minutes!" }
        })
    elseif eventData.secondsRemaining == 120 then -- 2mins
        TriggerEvent('ctrp-weathersync:server:setWeather', "halloween")
        TriggerClientEvent('chat:addMessage', -1, {
            template = '<div class="restart"><i class="fa fa-bullhorn"></i> {0}<br>^0{1}</div>',
            args = { "Emergency Announcement!", "Attention citizens! 🌊 Tsunami is going to hit the city in 2 minutes!" }
        })
    elseif eventData.secondsRemaining == 60 then -- 1min
        TriggerClientEvent('chat:addMessage', -1, {
            template = '<div class="restart"><i class="fa fa-bullhorn"></i> {0}<br>^0{1}</div>',
            args = { "Emergency Announcement!", "Attention citizens! 🌊 Tsunami is going to hit the city in 1 minutes!" }
        })
        Citizen.Wait(30000) -- Because this event does not get called at the 30second mark
        TriggerClientEvent('chat:addMessage', -1, {
            template = '<div class="restart"><i class="fa fa-bullhorn"></i> {0}<br>^0{1}</div>',
            args = { "Emergency Announcement!", "Attention citizens! 🌊 Tsunami is going to hit the city in 30 Seconds!" }
        })
    end
end)


