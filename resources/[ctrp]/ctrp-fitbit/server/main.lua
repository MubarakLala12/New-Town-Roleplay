-- CTRPFW = nil
-- TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)

-- Code

CTRPFW.Functions.CreateUseableItem("fitbit", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
    TriggerClientEvent('ctrp-fitbit:use', source)
  end)

RegisterServerEvent('ctrp-fitbit:server:setValue')
AddEventHandler('ctrp-fitbit:server:setValue', function(type, value)
    local src = source
    local ply = CTRPFW.Functions.GetPlayer(src)
    local fitbitData = {}

    if type == "thirst" then
        local currentMeta = ply.PlayerData.metadata["fitbit"]
        fitbitData = {
            thirst = value,
            food = currentMeta.food
        }
    elseif type == "food" then
        local currentMeta = ply.PlayerData.metadata["fitbit"]
        fitbitData = {
            thirst = currentMeta.thirst,
            food = value
        }
    end

    ply.Functions.SetMetaData('fitbit', fitbitData)
end)

CTRPFW.Functions.CreateCallback('ctrp-fitbit:server:HasFitbit', function(source, cb)
    local Ply = CTRPFW.Functions.GetPlayer(source)
    local Fitbit = Ply.Functions.GetItemByName("fitbit")

    if Fitbit ~= nil then
        cb(true)
    else
        cb(false)
    end
end)