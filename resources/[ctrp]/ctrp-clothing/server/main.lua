-- CTRPFW = nil
-- TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)

-- Code

CTRPFW.Commands.Add("skin", "Give Re-skin", {}, false, function(source, args)
	TriggerClientEvent("ctrp-clothing:client:openMenu", source)
end, "admin")

CTRPFW.Commands.Add("refreshskin", "Refreshskin", {}, false, function(source, args)
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)
	TriggerClientEvent("CTRPFW:Client:Refreshskin", source)
end)

RegisterServerEvent("ctrp-clothing:saveSkin")
AddEventHandler('ctrp-clothing:saveSkin', function(model, skin, cut)
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)
    local aaa = cut
    if aaa ~= nil then
        if Player.PlayerData.money.cash >= aaa then
            Player.Functions.RemoveMoney('cash', aaa)
        elseif Player.PlayerData.money.bank >= aaa then
            Player.Functions.RemoveMoney('bank', aaa)
        end
    end

    if model ~= nil and skin ~= nil then 
        CTRPFW.Functions.ExecuteSql(false, "DELETE FROM `playerskins` WHERE `citizenid` = '"..Player.PlayerData.citizenid.."'", function()
            CTRPFW.Functions.ExecuteSql(false, "INSERT INTO `playerskins` (`citizenid`, `model`, `skin`, `active`) VALUES ('"..Player.PlayerData.citizenid.."', '"..model.."', '"..skin.."', 1)")
        end)
    end
end)

RegisterServerEvent("ctrp-clothes:loadPlayerSkin")
AddEventHandler('ctrp-clothes:loadPlayerSkin', function()
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)
    CTRPFW.Functions.ExecuteSql(false, "SELECT * FROM `playerskins` WHERE `citizenid` = '"..Player.PlayerData.citizenid.."' AND `active` = 1", function(result)
        if result[1] ~= nil then
            TriggerClientEvent("ctrp-clothes:loadSkin", src, false, result[1].model, result[1].skin)
        else
            TriggerClientEvent("ctrp-clothes:loadSkin", src, true)
        end
    end)
end)

RegisterServerEvent("ctrp-clothes:loadPlayerSkins")
AddEventHandler('ctrp-clothes:loadPlayerSkins', function()
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)
    CTRPFW.Functions.ExecuteSql(false, "SELECT * FROM `playerskins` WHERE `citizenid` = '"..Player.PlayerData.citizenid.."' AND `active` = 1", function(result)
        if result[1] ~= nil then
            TriggerClientEvent("ctrp-clothes:loadSkins", src, false, result[1].model, result[1].skin)
        else
            TriggerClientEvent("ctrp-clothes:loadSkins", src, true)
        end
    end)
end)

RegisterServerEvent("ctrp-clothes:saveOutfit")
AddEventHandler("ctrp-clothes:saveOutfit", function(outfitName, model, skinData)
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)
    if model ~= nil and skinData ~= nil then
        local outfitId = "outfit-"..math.random(1, 10).."-"..math.random(1111, 9999)
        CTRPFW.Functions.ExecuteSql(false, "INSERT INTO `player_outfits` (`citizenid`, `outfitname`, `model`, `skin`, `outfitId`) VALUES ('"..Player.PlayerData.citizenid.."', '"..outfitName.."', '"..model.."', '"..json.encode(skinData).."', '"..outfitId.."')", function()
            CTRPFW.Functions.ExecuteSql(false, "SELECT * FROM `player_outfits` WHERE `citizenid` = '"..Player.PlayerData.citizenid.."'", function(result)
                if result[1] ~= nil then
                    TriggerClientEvent('ctrp-clothing:client:reloadOutfits', src, result)
                else
                    TriggerClientEvent('ctrp-clothing:client:reloadOutfits', src, nil)
                end
            end)
        end)
    end
end)

RegisterServerEvent("ctrp-clothing:server:removeOutfit")
AddEventHandler("ctrp-clothing:server:removeOutfit", function(outfitName, outfitId)
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)

    CTRPFW.Functions.ExecuteSql(false, "DELETE FROM `player_outfits` WHERE `citizenid` = '"..Player.PlayerData.citizenid.."' AND `outfitname` = '"..outfitName.."' AND `outfitId` = '"..outfitId.."'", function()
        CTRPFW.Functions.ExecuteSql(false, "SELECT * FROM `player_outfits` WHERE `citizenid` = '"..Player.PlayerData.citizenid.."'", function(result)
            if result[1] ~= nil then
                TriggerClientEvent('ctrp-clothing:client:reloadOutfits', src, result)
            else
                TriggerClientEvent('ctrp-clothing:client:reloadOutfits', src, nil)
            end
        end)
    end)
end)

CTRPFW.Functions.CreateCallback('ctrp-clothing:server:getOutfits', function(source, cb)
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)
    local anusVal = {}

    CTRPFW.Functions.ExecuteSql(false, "SELECT * FROM `player_outfits` WHERE `citizenid` = '"..Player.PlayerData.citizenid.."'", function(result)
        if result[1] ~= nil then
            for k, v in pairs(result) do
                result[k].skin = json.decode(result[k].skin)
                anusVal[k] = v
            end
            cb(anusVal)
        end
        cb(anusVal)
    end)
end)

RegisterServerEvent('ctrp-clothing:print')
AddEventHandler('ctrp-clothing:print', function(data)
    print(data)
end)

CTRPFW.Commands.Add("helmet", "Put your helmet/cap/hat on or off..", {}, false, function(source, args)
    TriggerClientEvent("ctrp-clothing:client:adjustfacewear", source, 1) -- Hat
end)

CTRPFW.Commands.Add("glasses", "Put your glasses on or off..", {}, false, function(source, args)
	TriggerClientEvent("ctrp-clothing:client:adjustfacewear", source, 2)
end)

CTRPFW.Commands.Add("masks", "Put your mask on or off..", {}, false, function(source, args)
	TriggerClientEvent("ctrp-clothing:client:adjustfacewear", source, 4)
end)