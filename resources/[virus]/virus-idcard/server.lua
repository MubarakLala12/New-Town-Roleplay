CTRPFW = nil
TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)

local photo = nil


CTRPFW.Commands.Add("addphoto", "Add Photo To ID", {{name="playerid", help="Player ID"},{name="url", help="URL"}}, true, function(source, args)
	local Player = CTRPFW.Functions.GetPlayer(source)
	local playerid = tonumber(args[1])
	local url = tostring(args[2])

	local target = CTRPFW.Functions.GetPlayer(playerid)
	local fetchcitizen = target.PlayerData.citizenid

    if Player.PlayerData.job.name == "government" and Player.PlayerData.job.gradelabel == "Governor" or Player.PlayerData.job.gradelabel == "Mayor" or Player.PlayerData.job.gradelabel == "Secretery" or Player.PlayerData.job.gradelabel == "Employee" then


		CTRPFW.Functions.ExecuteSql(false, "UPDATE `players` SET `photo` = '"..url.."' WHERE `citizenid` = '"..fetchcitizen.."'")

	else
		TriggerClientEvent('CTRPFW:Notify', source, "You don't have Permission!", "error")
	end
end)


RegisterServerEvent('virus-idcard:server:fetchPhoto')
AddEventHandler('virus-idcard:server:fetchPhoto', function()
	local src     		= source
	local Virus 		= CTRPFW.Functions.GetPlayer(src)

	CTRPFW.Functions.ExecuteSql(false, "SELECT * FROM `players` WHERE `citizenid` = '"..Virus.PlayerData.citizenid.."'", function(results)
		-- Looping through results:
		for k,v in pairs(results) do

				photo = v.photo


			--TriggerClientEvent('virus-idcard:client:fetchPhoto', src, photo)
			print(photo)

		end
	end)	

	
end)




