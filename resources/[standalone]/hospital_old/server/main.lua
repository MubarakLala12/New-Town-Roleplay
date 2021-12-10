CTRPFW = nil
TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)

local PlayerInjuries = {}
local PlayerWeaponWounds = {}
local bedsTaken = {}

CTRPFW.Functions.CreateCallback('professor:server:checkDoctor', function(source, cb)
    local AmbulanceCount = 0
    
    for k, v in pairs(CTRPFW.Functions.GetPlayers()) do
        local Player = CTRPFW.Functions.GetPlayer(v)
        if Player ~= nil then
            if ((Player.PlayerData.job.name == "doctor") and Player.PlayerData.job.onduty) then
                AmbulanceCount = AmbulanceCount + 1
            end
        end
    end

    cb(AmbulanceCount)
end)

RegisterServerEvent('hospital:server:SendToBed')
AddEventHandler('hospital:server:SendToBed', function(bedId, isRevive)
	local src = source
	TriggerClientEvent('hospital:client:SendToBed', src, bedId, Config.Locations["beds"][bedId], isRevive)
	TriggerClientEvent('hospital:client:SetBed', -1, bedId, true)
end)

RegisterServerEvent('hospital:server:SendToBed2')
AddEventHandler('hospital:server:SendToBed2', function(bedId)
	local src = source
	TriggerClientEvent('hospital:client:SendToBed2', src, bedId, Config.Locations["beds"][bedId])
	TriggerClientEvent('hospital:client:SetBed', -1, bedId, true)
end)


RegisterServerEvent('hospital:server:SendToBedcheckin')
AddEventHandler('hospital:server:SendToBedcheckin', function(bedId, isRevive)
	local src = source
	TriggerClientEvent('hospital:client:SendToBedcheckin', src, bedId, Config.Locations["beds"][bedId], isRevive)
	TriggerClientEvent('hospital:client:SetBed', -1, bedId, true)
end)
RegisterServerEvent('hospital:pay')
AddEventHandler('hospital:pay', function()

    local src = source
    local ply = CTRPFW.Functions.GetPlayer(src)
	local cashamount = ply.PlayerData.money["bank"]
	if cashamount >= 200  then
	ply.Functions.RemoveMoney("bank", 200, "respawned-at-hospital")
	TriggerClientEvent('hospital:client:Sendcheckemail',src)

	end
	
end)

RegisterServerEvent('hospital:server:RespawnAtHospital')
AddEventHandler('hospital:server:RespawnAtHospital', function()
	local src = source
	local Player = CTRPFW.Functions.GetPlayer(src)

	if Player.PlayerData.job.name == "doctor" and Player.PlayerData.job.onduty then
			
		for k, v in pairs(Config.Locations["beds"]) do
			TriggerClientEvent('hospital:client:SendToBed', src, k, v, true)
			TriggerClientEvent('hospital:client:SetBed', -1, k, true)
			Player.Functions.ClearInventory()
			CTRPFW.Functions.ExecuteSql(true, "UPDATE `players` SET `inventory` = '"..CTRPFW.EscapeSqli(json.encode({})).."' WHERE `citizenid` = '"..Player.PlayerData.citizenid.."'")
			Player.Functions.RemoveMoney("bank", Config.BillCost, "respawned-at-hospital")
			TriggerClientEvent('CTRPFW:Notify', src, 'All your belongings have been taken..', 'error')
			TriggerClientEvent('hospital:client:SendBillEmail', src, Config.BillCost)
			return
		end
	else
		for k, v in pairs(Config.Locations["beds"]) do
			TriggerClientEvent('hospital:client:SendToBed', src, k, v, true)
			TriggerClientEvent('hospital:client:SetBed', -1, k, true)
			CTRPFW.Functions.ExecuteSql(true, "UPDATE `players` SET `inventory` = '"..CTRPFW.EscapeSqli(json.encode({})).."' WHERE `citizenid` = '"..Player.PlayerData.citizenid.."'")
			Player.Functions.RemoveMoney("bank", Config.BillCost, "respawned-at-hospital")
			TriggerClientEvent('hospital:client:SendBillEmail', src, Config.BillCost)
			return
		end
	end
end)

RegisterServerEvent('hospital:server:LeaveBed')
AddEventHandler('hospital:server:LeaveBed', function(id)
    TriggerClientEvent('hospital:client:SetBed', -1, id, false)
end)

RegisterServerEvent('hospital:server:SyncInjuries')
AddEventHandler('hospital:server:SyncInjuries', function(data)
    local src = source
    PlayerInjuries[src] = data
end)


RegisterServerEvent('hospital:server:SetWeaponDamage')
AddEventHandler('hospital:server:SetWeaponDamage', function(data)
	local src = source
	local Player = CTRPFW.Functions.GetPlayer(src)
	if Player ~= nil then
		PlayerWeaponWounds[Player.PlayerData.source] = data
	end
end)

RegisterServerEvent('hospital:server:RestoreWeaponDamage')
AddEventHandler('hospital:server:RestoreWeaponDamage', function()
	local src = source
	local Player = CTRPFW.Functions.GetPlayer(src)
	PlayerWeaponWounds[Player.PlayerData.source] = nil
end)

RegisterServerEvent('hospital:server:SetDeathStatus')
AddEventHandler('hospital:server:SetDeathStatus', function(isDead)
	local src = source
	local Player = CTRPFW.Functions.GetPlayer(src)
	if Player ~= nil then
		Player.Functions.SetMetaData("isdead", isDead)
	end
end)

RegisterServerEvent('hospital:server:SetLaststandStatus')
AddEventHandler('hospital:server:SetLaststandStatus', function(bool)
	local src = source
	local Player = CTRPFW.Functions.GetPlayer(src)
	if Player ~= nil then
		Player.Functions.SetMetaData("inlaststand", bool)
	end
end)

RegisterServerEvent('hospital:server:SetArmor')
AddEventHandler('hospital:server:SetArmor', function(amount)
	local src = source
	local Player = CTRPFW.Functions.GetPlayer(src)
	if Player ~= nil then
		Player.Functions.SetMetaData("armor", amount)
	end
end)

RegisterServerEvent('hospital:server:TreatWounds')
AddEventHandler('hospital:server:TreatWounds', function(playerId)
	local src = source
	local Player = CTRPFW.Functions.GetPlayer(src)
	local Patient = CTRPFW.Functions.GetPlayer(playerId)
	if Patient ~= nil then
		if Player.PlayerData.job.name == "doctor" then
			--TriggerClientEvent("hospital:client:HealInjuries", Patient.PlayerData.source, "full")
			TriggerClientEvent('hospital:client:HalfRevive', Patient.PlayerData.source)
		end
	end
end)

RegisterServerEvent('hospital:server:SetDoctor')
AddEventHandler('hospital:server:SetDoctor', function()
	local amount = 0
	for k, v in pairs(CTRPFW.Functions.GetPlayers()) do
        local Player = CTRPFW.Functions.GetPlayer(v)
        if Player ~= nil then
            if Player.PlayerData.job.name == "doctor" and Player.PlayerData.job.onduty then
                amount = amount + 1
            end
        end
	end
	TriggerClientEvent("hospital:client:SetDoctorCount", -1, amount)
end)

RegisterServerEvent('hospital:server:SetDoctorSign')
AddEventHandler('hospital:server:SetDoctorSign', function(value)
	signindoo = value

	TriggerClientEvent("hospital:client:SetSignDoc", -1, signindoo)
end)

RegisterServerEvent('hospital:server:RevivePlayer')
AddEventHandler('hospital:server:RevivePlayer', function(playerId, isOldMan)
	local src = source
	local Player = CTRPFW.Functions.GetPlayer(src)
	local Patient = CTRPFW.Functions.GetPlayer(playerId)
	local oldMan = isOldMan ~= nil and isOldMan or false
	if Patient ~= nil then
		if oldMan then
			if Player.Functions.RemoveMoney("cash", 2000, "revived-player") then
				TriggerClientEvent('hospital:client:Revive', Patient.PlayerData.source)
			else
				TriggerClientEvent('CTRPFW:Notify', src, "You don't have enough money in your pocket..", "error")
			end
		else
			TriggerClientEvent('hospital:client:Revive', Patient.PlayerData.source)
		end
	end
end)

RegisterServerEvent('hospital:server:SendDoctorAlert')
AddEventHandler('hospital:server:SendDoctorAlert', function()
	local src = source
	for k, v in pairs(CTRPFW.Functions.GetPlayers()) do
		local Player = CTRPFW.Functions.GetPlayer(v)
		if Player ~= nil then
			if Player.PlayerData.job.name == "doctor"  and Player.PlayerData.job.onduty then
				TriggerClientEvent("hospital:client:SendAlert", v, "We need a doctor at Pillbox Hospital")
			end
		end
	end
end)

RegisterServerEvent('hospital:server:MakeDeadCall')
AddEventHandler('hospital:server:MakeDeadCall', function(blipSettings, gender, street1, street2)
	local src = source
	local genderstr = "Man"

	if gender == 1 then genderstr = "Woman" end

	if street2 ~= nil then
		TriggerClientEvent("112:client:SendAlert", -1, "A ".. genderstr .." injured at " ..street1 .. " "..street2, blipSettings)
		TriggerClientEvent('ctrp-policealerts:client:AddPoliceAlert', -1, {
            timeOut = 5000,
            alertTitle = "Person injured",
            details = {
                [1] = {
                    icon = '<i class="fas fa-venus-mars"></i>',
                    detail = genderstr,
                },
                [2] = {
                    icon = '<i class="fas fa-globe-europe"></i>',
                    detail = street1.. ' '..street2,
                },
            },
            callSign = nil,
        }, true)
	else
		TriggerClientEvent("112:client:SendAlert", -1, "A ".. genderstr .." injured at "..street1, blipSettings)
		TriggerClientEvent('ctrp-policealerts:client:AddPoliceAlert', -1, {
            timeOut = 5000,
            alertTitle = "Person injured",
            details = {
                [1] = {
                    icon = '<i class="fas fa-venus-mars"></i>',
                    detail = genderstr,
                },
                [2] = {
                    icon = '<i class="fas fa-globe-europe"></i>',
                    detail = street1,
                },
            },
            callSign = nil,
        }, true)
	end
end)

CTRPFW.Functions.CreateCallback('hospital:GetDoctors', function(source, cb)
	local amount = 0
	for k, v in pairs(CTRPFW.Functions.GetPlayers()) do
		local Player = CTRPFW.Functions.GetPlayer(v)
		if Player ~= nil then
			if Player.PlayerData.job.name == "doctor" and Player.PlayerData.job.onduty then
				amount = amount + 1
			end
		end
	end
	cb(amount)
end)


function GetCharsInjuries(source)
    return PlayerInjuries[source]
end

function GetActiveInjuries(source)
	local injuries = {}
	if (PlayerInjuries[source].isBleeding > 0) then
		injuries["BLEED"] = PlayerInjuries[source].isBleeding
	end
	for k, v in pairs(PlayerInjuries[source].limbs) do
		if PlayerInjuries[source].limbs[k].isDamaged then
			injuries[k] = PlayerInjuries[source].limbs[k]
		end
	end
    return injuries
end


CTRPFW.Functions.CreateCallback('hospital:GetPlayerStatus', function(source, cb, playerId)
	local Player = CTRPFW.Functions.GetPlayer(playerId)
	local injuries = {}
	injuries["WEAPONWOUNDS"] = {}
	if Player ~= nil then
		if PlayerInjuries[Player.PlayerData.source] ~= nil then
			if (PlayerInjuries[Player.PlayerData.source].isBleeding > 0) then
				injuries["BLEED"] = PlayerInjuries[Player.PlayerData.source].isBleeding
			end
			for k, v in pairs(PlayerInjuries[Player.PlayerData.source].limbs) do
				if PlayerInjuries[Player.PlayerData.source].limbs[k].isDamaged then
					injuries[k] = PlayerInjuries[Player.PlayerData.source].limbs[k]
				end
			end
		end
		if PlayerWeaponWounds[Player.PlayerData.source] ~= nil then
			for k, v in pairs(PlayerWeaponWounds[Player.PlayerData.source]) do
				injuries["WEAPONWOUNDS"][k] = v
			end
		end
	end
    cb(injuries)
end)

CTRPFW.Functions.CreateCallback('hospital:GetPlayerBleeding', function(source, cb)
	local src = source
	if PlayerInjuries[src] ~= nil and PlayerInjuries[src].isBleeding ~= nil then
		cb(PlayerInjuries[src].isBleeding)
	else
		cb(nil)
	end
end)

CTRPFW.Commands.Add("setdoctor", "Give the doctor's job to somebody ", {{name="id", help="Player ID"}, {name="grade", help="rank"}}, true, function(source, args)
    local Player = CTRPFW.Functions.GetPlayer(tonumber(args[1]))
    local Myself = CTRPFW.Functions.GetPlayer(source)
    if Player ~= nil then 
        if Myself.PlayerData.job.name == "doctor" and Myself.PlayerData.job.gradelabel == "EMS Chief" or Myself.PlayerData.job.gradelabel == "Deputy EMS Chief" then
            Player.Functions.SetJob("doctor", tonumber(args[2]))
        else
			TriggerClientEvent('chatMessage', source, "Console", "error", "You are not allowed to give job")
		end
	else
		TriggerClientEvent('chatMessage', source, "Console", "error", "Player is not online!")
	end
end)

CTRPFW.Commands.Add("firedoctor", "Remove the doctor!", {{name="id", help="Player ID"}}, true, function(source, args)
    local Player = CTRPFW.Functions.GetPlayer(tonumber(args[1]))
    local Myself = CTRPFW.Functions.GetPlayer(source)
    if Player ~= nil then 
        if Myself.PlayerData.job.name == "doctor" and Myself.PlayerData.job.gradelabel == "EMS Chief" or Myself.PlayerData.job.gradelabel == "Deputy EMS Chief" then
            Player.Functions.SetJob("unemployed", 1)
		else
			TriggerClientEvent('chatMessage', source, "Console", "error", "Your not allowed")
		end
	else
		TriggerClientEvent('chatMessage', source, "Console", "error", "Player is not online!")
	end
end)


CTRPFW.Commands.Add("status", "Check a person's health", {}, false, function(source, args)
	local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.PlayerData.job.name == "doctor" then
		TriggerClientEvent("hospital:client:CheckStatus", source)
	else
		TriggerClientEvent('chatMessage', source, "SYSTEM", "error", "This command is for emergency services!")
	end
end)

CTRPFW.Commands.Add("heal", "help a person's injuries", {}, false, function(source, args)
	local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.PlayerData.job.name == "doctor" then
		TriggerClientEvent("hospital:client:TreatWounds", source)
	else
		TriggerClientEvent('chatMessage', source, "SYSTEM", "error", "This command is for emergency services!")
	end
end)

CTRPFW.Commands.Add("revivep", "Help a person up", {}, false, function(source, args)
	local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.PlayerData.job.name == "doctor" and Player.PlayerData.job.onduty then
		TriggerClientEvent("hospital:client:RevivePlayer", source)
	else
		TriggerClientEvent('chatMessage', source, "SYSTEM", "error", "This command is for emergency services!")
	end
end)

CTRPFW.Commands.Add("revive", "Revive a player or yourself", {{name="id", help="Player ID (may be blank)"}}, false, function(source, args)
	if args[1] ~= nil then
		local Player = CTRPFW.Functions.GetPlayer(tonumber(args[1]))
		if Player ~= nil then
			TriggerClientEvent('hospital:client:Revive', Player.PlayerData.source)
		else
			TriggerClientEvent('chatMessage', source, "SYSTEM", "error", "Player is not online!")
		end
	else
		TriggerClientEvent('hospital:client:Revive', source)
	end
end, "admin")

CTRPFW.Commands.Add("setpain", "Put a pain to yourself or someone else", {{name="id", help="Player ID (may be blank)"}}, false, function(source, args)
	if args[1] ~= nil then
		local Player = CTRPFW.Functions.GetPlayer(tonumber(args[1]))
		if Player ~= nil then
			TriggerClientEvent('hospital:client:SetPain', Player.PlayerData.source)
		else
			TriggerClientEvent('chatMessage', source, "SYSTEM", "error", "Player is not online!")
		end
	else
		TriggerClientEvent('hospital:client:SetPain', source)
	end
end, "god")

CTRPFW.Commands.Add("kill", "Kill a player or yourself", {{name="id", help="Player ID (may be blank)"}}, false, function(source, args)
	if args[1] ~= nil then
		local Player = CTRPFW.Functions.GetPlayer(tonumber(args[1]))
		if Player ~= nil then
			TriggerClientEvent('hospital:client:KillPlayer', Player.PlayerData.source)
		else
			TriggerClientEvent('chatMessage', source, "SYSTEM", "error", "Player is not online!")
		end
	else
		TriggerClientEvent('hospital:client:KillPlayer', source)
	end
end, "god")



CTRPFW.Functions.CreateUseableItem("bandage", function(source, item)
	local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.GetItemByName(item.name) ~= nil then
		TriggerClientEvent("hospital:client:UseBandage", source)
	end
end)

CTRPFW.Functions.CreateUseableItem("painkillers", function(source, item)
	local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.GetItemByName(item.name) ~= nil then
		TriggerClientEvent("hospital:client:UsePainkillers", source)
	end
end)

CTRPFW.Functions.CreateUseableItem("firstaid", function(source, item)
	local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.GetItemByName(item.name) ~= nil then
		TriggerClientEvent("hospital:client:UseFirstAiditem", source)
	end
end)

CTRPFW.Functions.CreateUseableItem("ifak", function(source, item)
	local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.GetItemByName(item.name) ~= nil then
		TriggerClientEvent("hospital:client:UseIfak", source)
	end
end)

function IsHighCommand(citizenid)
    local retval = false
    for k, v in pairs(Config.Whitelist) do
        if v == citizenid then
            retval = true
        end
    end
    return retval
end

RegisterServerEvent('hospital:server:UseFirstAid')
AddEventHandler('hospital:server:UseFirstAid', function(targetId)
	local src = source
	local Target = CTRPFW.Functions.GetPlayer(targetId)
	if Target ~= nil then
		TriggerClientEvent('hospital:client:CanHelp', targetId, src)
	end
end)

RegisterServerEvent('hospital:server:CanHelp')
AddEventHandler('hospital:server:CanHelp', function(helperId, canHelp)
	local src = source
	if canHelp then
		TriggerClientEvent('hospital:client:HelpPerson', helperId, src)
	else
		TriggerClientEvent('CTRPFW:Notify', helperId, "You can't fix this person yet..", "error")
	end
end)
