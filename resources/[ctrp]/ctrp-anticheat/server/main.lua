-- Load CTRPFW --

-- CTRPFW = nil

-- TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)

-- Get permissions --

CTRPFW.Functions.CreateCallback('ctrp-anticheat:server:GetPermissions', function(source, cb)
    local group = CTRPFW.Functions.GetPermission(source)
    cb(group)
end)

-- Execute ban --

RegisterServerEvent('ctrp-anticheat:server:banPlayer')
AddEventHandler('ctrp-anticheat:server:banPlayer', function(reason)
    local src = source
    TriggerClientEvent('chatMessage', -1, "CTRP Anti-Cheat", "error", GetPlayerName(src).." is banned: " ..reason )
    CTRPFW.Functions.ExecuteSql(false, "INSERT INTO `bans` (`name`, `steam`, `license`, `discord`,`ip`, `reason`, `expire`, `bannedby`) VALUES ('"..GetPlayerName(src).."', '"..GetPlayerIdentifiers(src)[1].."', '"..GetPlayerIdentifiers(src)[2].."', '"..GetPlayerIdentifiers(src)[3].."', '"..GetPlayerIdentifiers(src)[4].."', '"..reason.."', 2145913200, '"..GetPlayerName(src).."')")
    DropPlayer(src, "You have been flagged to much, for more information join our discord: https://discord.gg/Em4YZcr :)")
end)

-- Fake events --
function NonRegisteredEventCalled(CalledEvent, source)
    TriggerClientEvent("ctrp-anticheat:client:NonRegisteredEventCalled", source, "Cheating", CalledEvent)
end

for x, v in pairs(Config.BlacklistedEvents) do
    RegisterServerEvent(v)
    AddEventHandler(v, function(source)
        NonRegisteredEventCalled(v, source)
    end)
end

CTRPFW.Functions.CreateCallback('ctrp-anticheat:server:HasWeaponInInventory', function(source, cb, WeaponInfo)
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)
    local PlayerInventory = Player.PlayerData.items
    local retval = false

    for k, v in pairs(PlayerInventory) do
        if v.name == WeaponInfo["name"] then
            retval = true
        end
    end
    cb(retval)
end)