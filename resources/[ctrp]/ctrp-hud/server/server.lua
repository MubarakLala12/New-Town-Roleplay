-- CTRPFW = nil
-- TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)

--NOTHING HERE

--[[local ResetStress = false

RegisterServerEvent("ctrp-hud:Server:UpdateStress")
AddEventHandler('ctrp-hud:Server:UpdateStress', function(StressGain)
	local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)
    local newStress
    if Player ~= nil then
        if not ResetStress then
            if Player.PlayerData.metadata["stress"] == nil then
                Player.PlayerData.metadata["stress"] = 0
            end
            newStress = Player.PlayerData.metadata["stress"] + StressGain
            if newStress <= 0 then newStress = 0 end
        else
            newStress = 0
        end
        if newStress > 100 then
            newStress = 100
        end
        Player.Functions.SetMetaData("stress", newStress)
	end
end)

RegisterServerEvent('ctrp-hud:Server:GainStress')
AddEventHandler('ctrp-hud:Server:GainStress', function(amount)
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)
    local newStress
    if Player ~= nil then
        if not ResetStress then
            if Player.PlayerData.metadata["stress"] == nil then
                Player.PlayerData.metadata["stress"] = 0
            end
            newStress = Player.PlayerData.metadata["stress"] + amount
            if newStress <= 0 then newStress = 0 end
        else
            newStress = 0
        end
        if newStress > 100 then
            newStress = 100
        end
        Player.Functions.SetMetaData("stress", newStress)
        TriggerClientEvent('CTRPFW:Notify', src, 'Getting Stressed', 'error', 1500)
	end
end)

RegisterServerEvent('ctrp-hud:Server:RelieveStress')
AddEventHandler('ctrp-hud:Server:RelieveStress', function(amount)
    local src = source
    local Player = CTRPFW.Functions.GetPlayer(src)
    local newStress
    if Player ~= nil then
        if not ResetStress then
            if Player.PlayerData.metadata["stress"] == nil then
                Player.PlayerData.metadata["stress"] = 0
            end
            newStress = Player.PlayerData.metadata["stress"] - amount
            if newStress <= 0 then newStress = 0 end
        else
            newStress = 0
        end
        if newStress > 100 then
            newStress = 100
        end
        Player.Functions.SetMetaData("stress", newStress)
        TriggerClientEvent('CTRPFW:Notify', src, 'You Are Relaxing')
	end
end)]]
