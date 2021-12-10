CTRPFW = nil
TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)

CTRPFW.Commands.Add("setlawyer", "Set someone as a lawyer", {{name="id", help="Player ID"}}, true, function(source, args)
    local Player = CTRPFW.Functions.GetPlayer(source)
    local playerId = tonumber(args[1])
    local OtherPlayer = CTRPFW.Functions.GetPlayer(playerId)
    if Player.PlayerData.job.name == "government" and Player.PlayerData.job.gradelabel == "Governor" or Player.PlayerData.job.name == "Mayor" or  Player.PlayerData.job.name == "doj" and Player.PlayerData.job.gradelabel == "Chief Justice" then
        if OtherPlayer ~= nil then
            local lawyerInfo = {
                id = math.random(100000, 999999),
                firstname = OtherPlayer.PlayerData.charinfo.firstname,
                lastname = OtherPlayer.PlayerData.charinfo.lastname,
                citizenid = OtherPlayer.PlayerData.citizenid,
            }
            OtherPlayer.Functions.SetJob("lawyer")
            OtherPlayer.Functions.AddItem("lawyerpass", 1, false, lawyerInfo)
            TriggerClientEvent("CTRPFW:Notify", source, "- " .. OtherPlayer.PlayerData.charinfo.firstname .. " " .. OtherPlayer.PlayerData.charinfo.lastname ..  " ,You have Hired as a lawyer")
            TriggerClientEvent("CTRPFW:Notify", OtherPlayer.PlayerData.source, "You are now a lawyer")
            TriggerClientEvent('inventory:client:ItemBox', OtherPlayer.PlayerData.source, CTRPFW.Shared.Items["lawyerpass"], "add")
        else
            TriggerClientEvent("CTRPFW:Notify", source, "This person is not present..", "error")
        end
    else
        TriggerClientEvent("CTRPFW:Notify", source, "You have no rights..", "error")
    end
end)

CTRPFW.Commands.Add("removelawyer", "Delete someone from lawyer", {{name="id", help="Player ID"}}, true, function(source, args)
    local Player = CTRPFW.Functions.GetPlayer(source)
    local playerId = tonumber(args[1])
    local OtherPlayer = CTRPFW.Functions.GetPlayer(playerId)
    if Player.PlayerData.job.name == "government" and Player.PlayerData.job.gradelabel == "Governor" or Player.PlayerData.job.gradelabel == "Mayor" or  Player.PlayerData.job.name == "doj" and Player.PlayerData.job.gradelabel == "Chief Justice" then
        if OtherPlayer ~= nil then
            --OtherPlayer.Functions.SetJob("unemployed")
            TriggerClientEvent("CTRPFW:Notify", OtherPlayer.PlayerData.source, "You are now unemployed")
            TriggerClientEvent("CTRPFW:Notify", source, "-".. OtherPlayer.PlayerData.charinfo.firstname .. " " .. OtherPlayer.PlayerData.charinfo.lastname ..  " , You are Fired as a lawyer")
        else
            TriggerClientEvent("CTRPFW:Notify", source, "This person is not present..", "error")
        end
    else
        TriggerClientEvent("CTRPFW:Notify", source, "You have no rights..", "error")
    end
end)

CTRPFW.Functions.CreateUseableItem("lawyerpass", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("ctrp-justice:client:showLawyerLicense", -1, source, item.info)
    end
end)

CTRPFW.Commands.Add("mayorpass", "Give Mayor Pass", {{name="id", help="Player ID"}}, true, function(source, args)
    local Player = CTRPFW.Functions.GetPlayer(source)
    local playerId = tonumber(args[1])
    local OtherPlayer = CTRPFW.Functions.GetPlayer(playerId)
    if Player.PlayerData.job.name == "government" and Player.PlayerData.job.gradelabel == "Governor" or  Player.PlayerData.job.name == "doj" and Player.PlayerData.job.gradelabel == "Chief Justice" then
        if OtherPlayer ~= nil then
            local playerInfo = {
                id = math.random(100000, 999999),
                firstname = OtherPlayer.PlayerData.charinfo.firstname,
                lastname = OtherPlayer.PlayerData.charinfo.lastname,
                citizenid = OtherPlayer.PlayerData.citizenid,
            }
           
            OtherPlayer.Functions.AddItem("mayorpass", 1, false, playerInfo)
            TriggerClientEvent("CTRPFW:Notify", source, "- " .. OtherPlayer.PlayerData.charinfo.firstname .. " " .. OtherPlayer.PlayerData.charinfo.lastname ..  " ,You have received mayor pass.")
            TriggerClientEvent("CTRPFW:Notify", OtherPlayer.PlayerData.source, "Now you can meet mayor! ")
            TriggerClientEvent('inventory:client:ItemBox', OtherPlayer.PlayerData.source, CTRPFW.Shared.Items["mayorpass"], "add")
        else
            TriggerClientEvent("CTRPFW:Notify", source, "This person is not present..", "error")
        end
    else
        TriggerClientEvent("CTRPFW:Notify", source, "You have no rights..", "error")
    end
end)

CTRPFW.Commands.Add("mechanicid", "Give Mechanic ID", {{name="id", help="Player ID"}}, true, function(source, args)
    local Player = CTRPFW.Functions.GetPlayer(source)
    local playerId = tonumber(args[1])
    local OtherPlayer = CTRPFW.Functions.GetPlayer(playerId)
    if Player.PlayerData.job.name == "government" and Player.PlayerData.job.gradelabel == "Governor" or Player.PlayerData.job.gradelabel == "Mayor" or Player.PlayerData.job.gradelabel == "Secretery" or Player.PlayerData.job.gradelabel == "Employee" then
        if OtherPlayer ~= nil then
            local playerInfo = {
                id = math.random(100000, 999999),
                firstname = OtherPlayer.PlayerData.charinfo.firstname,
                lastname = OtherPlayer.PlayerData.charinfo.lastname,
                citizenid = OtherPlayer.PlayerData.citizenid,
            }
           
            OtherPlayer.Functions.AddItem("mecard", 1, false, playerInfo)
            TriggerClientEvent("CTRPFW:Notify", source, "- " .. OtherPlayer.PlayerData.charinfo.firstname .. " " .. OtherPlayer.PlayerData.charinfo.lastname ..  " ,You have received JOB ID CARD.")
            TriggerClientEvent("CTRPFW:Notify", OtherPlayer.PlayerData.source, "Now Your Job is Legal! ")
            TriggerClientEvent('inventory:client:ItemBox', OtherPlayer.PlayerData.source, CTRPFW.Shared.Items["mecard"], "add")
        else
            TriggerClientEvent("CTRPFW:Notify", source, "This person is not present..", "error")
        end
    else
        TriggerClientEvent("CTRPFW:Notify", source, "You have no rights..", "error")
    end
end)

CTRPFW.Commands.Add("newsid", "Give Reporter ID", {{name="id", help="Player ID"}}, true, function(source, args)
    local Player = CTRPFW.Functions.GetPlayer(source)
    local playerId = tonumber(args[1])
    local OtherPlayer = CTRPFW.Functions.GetPlayer(playerId)
    if Player.PlayerData.job.name == "government" and Player.PlayerData.job.gradelabel == "Governor" or Player.PlayerData.job.gradelabel == "Mayor" or Player.PlayerData.job.gradelabel == "Secretery" or Player.PlayerData.job.gradelabel == "Employee" then
        if OtherPlayer ~= nil then
            local playerInfo = {
                id = math.random(100000, 999999),
                firstname = OtherPlayer.PlayerData.charinfo.firstname,
                lastname = OtherPlayer.PlayerData.charinfo.lastname,
                citizenid = OtherPlayer.PlayerData.citizenid,
            }
           
            OtherPlayer.Functions.AddItem("wcard", 1, false, playerInfo)
            TriggerClientEvent("CTRPFW:Notify", source, "- " .. OtherPlayer.PlayerData.charinfo.firstname .. " " .. OtherPlayer.PlayerData.charinfo.lastname ..  " ,You have received JOB ID CARD.")
            TriggerClientEvent("CTRPFW:Notify", OtherPlayer.PlayerData.source, "Now Your Job is Legal! ")
            TriggerClientEvent('inventory:client:ItemBox', OtherPlayer.PlayerData.source, CTRPFW.Shared.Items["wcard"], "add")
        else
            TriggerClientEvent("CTRPFW:Notify", source, "This person is not present..", "error")
        end
    else
        TriggerClientEvent("CTRPFW:Notify", source, "You have no rights..", "error")
    end
end)

CTRPFW.Commands.Add("taxiid", "Give Taxi ID", {{name="id", help="Player ID"}}, true, function(source, args)
    local Player = CTRPFW.Functions.GetPlayer(source)
    local playerId = tonumber(args[1])
    local OtherPlayer = CTRPFW.Functions.GetPlayer(playerId)
    if Player.PlayerData.job.name == "government" and Player.PlayerData.job.gradelabel == "Governor" or Player.PlayerData.job.gradelabel == "Mayor" or Player.PlayerData.job.gradelabel == "Secretery" or Player.PlayerData.job.gradelabel == "Employee" then
        if OtherPlayer ~= nil then
            local playerInfo = {
                id = math.random(100000, 999999),
                firstname = OtherPlayer.PlayerData.charinfo.firstname,
                lastname = OtherPlayer.PlayerData.charinfo.lastname,
                citizenid = OtherPlayer.PlayerData.citizenid,
            }
           
            OtherPlayer.Functions.AddItem("taxicard", 1, false, playerInfo)
            TriggerClientEvent("CTRPFW:Notify", source, "- " .. OtherPlayer.PlayerData.charinfo.firstname .. " " .. OtherPlayer.PlayerData.charinfo.lastname ..  " ,You have received JOB ID CARD.")
            TriggerClientEvent("CTRPFW:Notify", OtherPlayer.PlayerData.source, "Now Your Job is Legal! ")
            TriggerClientEvent('inventory:client:ItemBox', OtherPlayer.PlayerData.source, CTRPFW.Shared.Items["taxicard"], "add")
        else
            TriggerClientEvent("CTRPFW:Notify", source, "This person is not present..", "error")
        end
    else
        TriggerClientEvent("CTRPFW:Notify", source, "You have no rights..", "error")
    end
end)

CTRPFW.Commands.Add("towid", "Give Tow ID", {{name="id", help="Player ID"}}, true, function(source, args)
    local Player = CTRPFW.Functions.GetPlayer(source)
    local playerId = tonumber(args[1])
    local OtherPlayer = CTRPFW.Functions.GetPlayer(playerId)
    if Player.PlayerData.job.name == "government" and Player.PlayerData.job.gradelabel == "Governor" or Player.PlayerData.job.gradelabel == "Mayor" or Player.PlayerData.job.gradelabel == "Secretery" or Player.PlayerData.job.gradelabel == "Employee" then
        if OtherPlayer ~= nil then
            local playerInfo = {
                id = math.random(100000, 999999),
                firstname = OtherPlayer.PlayerData.charinfo.firstname,
                lastname = OtherPlayer.PlayerData.charinfo.lastname,
                citizenid = OtherPlayer.PlayerData.citizenid,
            }
           
            OtherPlayer.Functions.AddItem("towcard", 1, false, playerInfo)
            TriggerClientEvent("CTRPFW:Notify", source, "- " .. OtherPlayer.PlayerData.charinfo.firstname .. " " .. OtherPlayer.PlayerData.charinfo.lastname ..  " ,You have received JOB ID CARD.")
            TriggerClientEvent("CTRPFW:Notify", OtherPlayer.PlayerData.source, "Now Your Job is Legal! ")
            TriggerClientEvent('inventory:client:ItemBox', OtherPlayer.PlayerData.source, CTRPFW.Shared.Items["towcard"], "add")
        else
            TriggerClientEvent("CTRPFW:Notify", source, "This person is not present..", "error")
        end
    else
        TriggerClientEvent("CTRPFW:Notify", source, "You have no rights..", "error")
    end
end)

CTRPFW.Commands.Add("poid", "Give Postal ID", {{name="id", help="Player ID"}}, true, function(source, args)
    local Player = CTRPFW.Functions.GetPlayer(source)
    local playerId = tonumber(args[1])
    local OtherPlayer = CTRPFW.Functions.GetPlayer(playerId)
    if Player.PlayerData.job.name == "government" and Player.PlayerData.job.gradelabel == "Governor" or Player.PlayerData.job.gradelabel == "Mayor" or Player.PlayerData.job.gradelabel == "Secretery" or Player.PlayerData.job.gradelabel == "Employee" then
        if OtherPlayer ~= nil then
            local playerInfo = {
                id = math.random(100000, 999999),
                firstname = OtherPlayer.PlayerData.charinfo.firstname,
                lastname = OtherPlayer.PlayerData.charinfo.lastname,
                citizenid = OtherPlayer.PlayerData.citizenid,
            }
           
            OtherPlayer.Functions.AddItem("pocard", 1, false, playerInfo)
            TriggerClientEvent("CTRPFW:Notify", source, "- " .. OtherPlayer.PlayerData.charinfo.firstname .. " " .. OtherPlayer.PlayerData.charinfo.lastname ..  " ,You have received JOB ID CARD.")
            TriggerClientEvent("CTRPFW:Notify", OtherPlayer.PlayerData.source, "Now Your Job is Legal! ")
            TriggerClientEvent('inventory:client:ItemBox', OtherPlayer.PlayerData.source, CTRPFW.Shared.Items["pocard"], "add")
        else
            TriggerClientEvent("CTRPFW:Notify", source, "This person is not present..", "error")
        end
    else
        TriggerClientEvent("CTRPFW:Notify", source, "You have no rights..", "error")
    end
end)

CTRPFW.Commands.Add("idcard", "Give ID Card", {{name="id", help="Player ID"}}, true, function(source, args)
    local Player = CTRPFW.Functions.GetPlayer(source)
    local playerId = tonumber(args[1])
    local OtherPlayer = CTRPFW.Functions.GetPlayer(playerId)
    if Player.PlayerData.job.name == "government" and Player.PlayerData.job.gradelabel == "Governor" or Player.PlayerData.job.gradelabel == "Mayor" or Player.PlayerData.job.gradelabel == "Secretery" or Player.PlayerData.job.gradelabel == "Employee" then
        if OtherPlayer ~= nil then
            local playerInfo = {
                citizenid = OtherPlayer.PlayerData.citizenid,
                firstname = OtherPlayer.PlayerData.charinfo.firstname,
                lastname = OtherPlayer.PlayerData.charinfo.lastname,
                birthdate = OtherPlayer.PlayerData.charinfo.birthdate,
                gender = OtherPlayer.PlayerData.charinfo.gender,
                nationality = OtherPlayer.PlayerData.charinfo.nationality,
            }
           
            OtherPlayer.Functions.AddItem("id_card", 1, false, playerInfo)
            TriggerClientEvent("CTRPFW:Notify", source, "- " .. OtherPlayer.PlayerData.charinfo.firstname .. " " .. OtherPlayer.PlayerData.charinfo.lastname ..  " ,You have received ID CARD.")
            TriggerClientEvent('inventory:client:ItemBox', OtherPlayer.PlayerData.source, CTRPFW.Shared.Items["id_card"], "add")
        else
            TriggerClientEvent("CTRPFW:Notify", source, "This person is not present..", "error")
        end
    else
        TriggerClientEvent("CTRPFW:Notify", source, "You have no rights..", "error")
    end
end)

CTRPFW.Commands.Add("policeid", "Give Police ID", {{name="id", help="Player ID"}}, true, function(source, args)
    local Player = CTRPFW.Functions.GetPlayer(source)
    local playerId = tonumber(args[1])
    local OtherPlayer = CTRPFW.Functions.GetPlayer(playerId)
    if Player.PlayerData.job.name == "government" and Player.PlayerData.job.gradelabel == "Governor" or Player.PlayerData.job.gradelabel == "Mayor" or Player.PlayerData.job.gradelabel == "Secretery" or Player.PlayerData.job.gradelabel == "Employee" then
        if OtherPlayer ~= nil then
            local playerInfo = {
                id = math.random(100000, 999999),
                firstname = OtherPlayer.PlayerData.charinfo.firstname,
                lastname = OtherPlayer.PlayerData.charinfo.lastname,
                citizenid = OtherPlayer.PlayerData.citizenid,
            }
           
            OtherPlayer.Functions.AddItem("pcard", 1, false, playerInfo)
            TriggerClientEvent("CTRPFW:Notify", source, "- " .. OtherPlayer.PlayerData.charinfo.firstname .. " " .. OtherPlayer.PlayerData.charinfo.lastname ..  " ,You have received JOB ID CARD.")
            TriggerClientEvent("CTRPFW:Notify", OtherPlayer.PlayerData.source, "Now Your Job is Legal! ")
            TriggerClientEvent('inventory:client:ItemBox', OtherPlayer.PlayerData.source, CTRPFW.Shared.Items["pcard"], "add")
        else
            TriggerClientEvent("CTRPFW:Notify", source, "This person is not present..", "error")
        end
    else
        TriggerClientEvent("CTRPFW:Notify", source, "You have no rights..", "error")
    end
end)

-- CTRPFW.Commands.Add("idcard", "Give ID card", {{name="id", help="Player ID"}}, true, function(source, args)
--     local Player = CTRPFW.Functions.GetPlayer(source)
--     local playerId = tonumber(args[1])
--     local OtherPlayer = CTRPFW.Functions.GetPlayer(playerId)
--     if Player.PlayerData.job.name == "government" and Player.PlayerData.job.gradelabel == "Governor" or Player.PlayerData.job.gradelabel == "Mayor" or Player.PlayerData.job.gradelabel == "Secretery" or Player.PlayerData.job.gradelabel == "Employee" then
--         if OtherPlayer ~= nil then
--             local playerInfo = {
--                 id = math.random(100000, 999999),
--                 firstname = OtherPlayer.PlayerData.charinfo.firstname,
--                 lastname = OtherPlayer.PlayerData.charinfo.lastname,
--                 citizenid = OtherPlayer.PlayerData.citizenid,
--             }
           
--             OtherPlayer.Functions.AddItem("id_card", 1, false, playerInfo)
--             TriggerClientEvent("CTRPFW:Notify", source, "- " .. OtherPlayer.PlayerData.charinfo.firstname .. " " .. OtherPlayer.PlayerData.charinfo.lastname ..  " ,You have received JOB ID CARD.")
--             TriggerClientEvent('inventory:client:ItemBox', OtherPlayer.PlayerData.source, CTRPFW.Shared.Items["id_card"], "add")
--         else
--             TriggerClientEvent("CTRPFW:Notify", source, "This person is not present..", "error")
--         end
--     else
--         TriggerClientEvent("CTRPFW:Notify", source, "You have no rights..", "error")
--     end
-- end)

CTRPFW.Commands.Add("emsid", "Give EMS ID", {{name="id", help="Player ID"}}, true, function(source, args)
    local Player = CTRPFW.Functions.GetPlayer(source)
    local playerId = tonumber(args[1])
    local OtherPlayer = CTRPFW.Functions.GetPlayer(playerId)
    if Player.PlayerData.job.name == "government" and Player.PlayerData.job.gradelabel == "Governor" or Player.PlayerData.job.gradelabel == "Mayor" or Player.PlayerData.job.gradelabel == "Secretery" or Player.PlayerData.job.gradelabel == "Employee" then
        if OtherPlayer ~= nil then
            local playerInfo = {
                id = math.random(100000, 999999),
                firstname = OtherPlayer.PlayerData.charinfo.firstname,
                lastname = OtherPlayer.PlayerData.charinfo.lastname,
                citizenid = OtherPlayer.PlayerData.citizenid,
            }
           
            OtherPlayer.Functions.AddItem("mcard", 1, false, playerInfo)
            TriggerClientEvent("CTRPFW:Notify", source, "- " .. OtherPlayer.PlayerData.charinfo.firstname .. " " .. OtherPlayer.PlayerData.charinfo.lastname ..  " ,You have received JOB ID CARD.")
            TriggerClientEvent("CTRPFW:Notify", OtherPlayer.PlayerData.source, "Now Your Job is Legal! ")
            TriggerClientEvent('inventory:client:ItemBox', OtherPlayer.PlayerData.source, CTRPFW.Shared.Items["mcard"], "add")
        else
            TriggerClientEvent("CTRPFW:Notify", source, "This person is not present..", "error")
        end
    else
        TriggerClientEvent("CTRPFW:Notify", source, "You have no rights..", "error")
    end
end)

CTRPFW.Commands.Add("garbageid", "Give Garbage ID", {{name="id", help="Player ID"}}, true, function(source, args)
    local Player = CTRPFW.Functions.GetPlayer(source)
    local playerId = tonumber(args[1])
    local OtherPlayer = CTRPFW.Functions.GetPlayer(playerId)
    if Player.PlayerData.job.name == "government" and Player.PlayerData.job.gradelabel == "Governor" or Player.PlayerData.job.gradelabel == "Mayor" or Player.PlayerData.job.gradelabel == "Secretery" or Player.PlayerData.job.gradelabel == "Employee" then
        if OtherPlayer ~= nil then
            local playerInfo = {
                id = math.random(100000, 999999),
                firstname = OtherPlayer.PlayerData.charinfo.firstname,
                lastname = OtherPlayer.PlayerData.charinfo.lastname,
                citizenid = OtherPlayer.PlayerData.citizenid,
            }
           
            OtherPlayer.Functions.AddItem("garbagecard", 1, false, playerInfo)
            TriggerClientEvent("CTRPFW:Notify", source, "- " .. OtherPlayer.PlayerData.charinfo.firstname .. " " .. OtherPlayer.PlayerData.charinfo.lastname ..  " ,You have received JOB ID CARD.")
            TriggerClientEvent("CTRPFW:Notify", OtherPlayer.PlayerData.source, "Now Your Job is Legal! ")
            TriggerClientEvent('inventory:client:ItemBox', OtherPlayer.PlayerData.source, CTRPFW.Shared.Items["garbagecard"], "add")
        else
            TriggerClientEvent("CTRPFW:Notify", source, "This person is not present..", "error")
        end
    else
        TriggerClientEvent("CTRPFW:Notify", source, "You have no rights..", "error")
    end
end)


CTRPFW.Functions.CreateUseableItem("mayorpass", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("ctrp-justice:client:showMayorPass", -1, source, item.info)
    end
end)


--Business

CTRPFW.Commands.Add("setbe", "Set Someone Bahamas Employee", {{name="id", help="Player ID"}}, true, function(source, args)
    local Player = CTRPFW.Functions.GetPlayer(source)
    local playerId = tonumber(args[1])
    local OtherPlayer = CTRPFW.Functions.GetPlayer(playerId)
    if Player.PlayerData.job.name == "bahamas" and Player.PlayerData.job.gradelabel == "Owner" then
        if OtherPlayer ~= nil then
            local bahamasInfo = {
                id = math.random(100000, 999999),
                firstname = OtherPlayer.PlayerData.charinfo.firstname,
                lastname = OtherPlayer.PlayerData.charinfo.lastname,
                citizenid = OtherPlayer.PlayerData.citizenid,
            }
            OtherPlayer.Functions.SetJob("bahamasemployee")

            TriggerClientEvent("CTRPFW:Notify", source, "- " .. OtherPlayer.PlayerData.charinfo.firstname .. " " .. OtherPlayer.PlayerData.charinfo.lastname ..  " ,You have Hired as a bahamas employee")
            TriggerClientEvent("CTRPFW:Notify", OtherPlayer.PlayerData.source, "You are now a bahamas employee")
        else
            TriggerClientEvent("CTRPFW:Notify", source, "This person is not present..", "error")
        end
    else
        TriggerClientEvent("CTRPFW:Notify", source, "You have no rights..", "error")
    end
end)

CTRPFW.Commands.Add("setce", "Set Someone Cinema Employee", {{name="id", help="Player ID"}}, true, function(source, args)
    local Player = CTRPFW.Functions.GetPlayer(source)
    local playerId = tonumber(args[1])
    local OtherPlayer = CTRPFW.Functions.GetPlayer(playerId)
    if Player.PlayerData.job.name == "cinema" and Player.PlayerData.job.gradelabel == "Owner" then
        if OtherPlayer ~= nil then
            local cinemaInfo = {
                id = math.random(100000, 999999),
                firstname = OtherPlayer.PlayerData.charinfo.firstname,
                lastname = OtherPlayer.PlayerData.charinfo.lastname,
                citizenid = OtherPlayer.PlayerData.citizenid,
            }
            OtherPlayer.Functions.SetJob("cinemaemployee")

            TriggerClientEvent("CTRPFW:Notify", source, "- " .. OtherPlayer.PlayerData.charinfo.firstname .. " " .. OtherPlayer.PlayerData.charinfo.lastname ..  " ,You have Hired as a cinema employee")
            TriggerClientEvent("CTRPFW:Notify", OtherPlayer.PlayerData.source, "You are now a cinema employee")
        else
            TriggerClientEvent("CTRPFW:Notify", source, "This person is not present..", "error")
        end
    else
        TriggerClientEvent("CTRPFW:Notify", source, "You have no rights..", "error")
    end
end)

CTRPFW.Commands.Add("setcce", "Set Someone Comedy Club Employee", {{name="id", help="Player ID"}}, true, function(source, args)
    local Player = CTRPFW.Functions.GetPlayer(source)
    local playerId = tonumber(args[1])
    local OtherPlayer = CTRPFW.Functions.GetPlayer(playerId)
    if Player.PlayerData.job.name == "comclub" and Player.PlayerData.job.gradelabel == "Owner" then
        if OtherPlayer ~= nil then
            local cinemaInfo = {
                id = math.random(100000, 999999),
                firstname = OtherPlayer.PlayerData.charinfo.firstname,
                lastname = OtherPlayer.PlayerData.charinfo.lastname,
                citizenid = OtherPlayer.PlayerData.citizenid,
            }
            OtherPlayer.Functions.SetJob("ccemployee")

            TriggerClientEvent("CTRPFW:Notify", source, "- " .. OtherPlayer.PlayerData.charinfo.firstname .. " " .. OtherPlayer.PlayerData.charinfo.lastname ..  " ,You have Hired as a Comedy Club employee")
            TriggerClientEvent("CTRPFW:Notify", OtherPlayer.PlayerData.source, "You are now a Comedy Club Employee")
        else
            TriggerClientEvent("CTRPFW:Notify", source, "This person is not present..", "error")
        end
    else
        TriggerClientEvent("CTRPFW:Notify", source, "You have no rights..", "error")
    end
end)

CTRPFW.Commands.Add("setmcde", "Set Someone MCD Employee", {{name="id", help="Player ID"}}, true, function(source, args)
    local Player = CTRPFW.Functions.GetPlayer(source)
    local playerId = tonumber(args[1])
    local OtherPlayer = CTRPFW.Functions.GetPlayer(playerId)
    if Player.PlayerData.job.name == "mcd" and Player.PlayerData.job.gradelabel == "Owner" then
        if OtherPlayer ~= nil then
            local cinemaInfo = {
                id = math.random(100000, 999999),
                firstname = OtherPlayer.PlayerData.charinfo.firstname,
                lastname = OtherPlayer.PlayerData.charinfo.lastname,
                citizenid = OtherPlayer.PlayerData.citizenid,
            }
            OtherPlayer.Functions.SetJob("mcdemployee")

            TriggerClientEvent("CTRPFW:Notify", source, "- " .. OtherPlayer.PlayerData.charinfo.firstname .. " " .. OtherPlayer.PlayerData.charinfo.lastname ..  " ,You have Hired as a MCD Employee")
            TriggerClientEvent("CTRPFW:Notify", OtherPlayer.PlayerData.source, "You are now a MCD Employee")
        else
            TriggerClientEvent("CTRPFW:Notify", source, "This person is not present..", "error")
        end
    else
        TriggerClientEvent("CTRPFW:Notify", source, "You have no rights..", "error")
    end
end)

CTRPFW.Commands.Add("setcse", "Set Someone Coffee Employee", {{name="id", help="Player ID"}}, true, function(source, args)
    local Player = CTRPFW.Functions.GetPlayer(source)
    local playerId = tonumber(args[1])
    local OtherPlayer = CTRPFW.Functions.GetPlayer(playerId)
    if Player.PlayerData.job.name == "coffee" and Player.PlayerData.job.gradelabel == "Owner" then
        if OtherPlayer ~= nil then
            local cinemaInfo = {
                id = math.random(100000, 999999),
                firstname = OtherPlayer.PlayerData.charinfo.firstname,
                lastname = OtherPlayer.PlayerData.charinfo.lastname,
                citizenid = OtherPlayer.PlayerData.citizenid,
            }
            OtherPlayer.Functions.SetJob("csemployee")

            TriggerClientEvent("CTRPFW:Notify", source, "- " .. OtherPlayer.PlayerData.charinfo.firstname .. " " .. OtherPlayer.PlayerData.charinfo.lastname ..  " ,You have Hired as a Coffee Employee")
            TriggerClientEvent("CTRPFW:Notify", OtherPlayer.PlayerData.source, "You are now a Coffee Employee")
        else
            TriggerClientEvent("CTRPFW:Notify", source, "This person is not present..", "error")
        end
    else
        TriggerClientEvent("CTRPFW:Notify", source, "You have no rights..", "error")
    end
end)


--cards

CTRPFW.Commands.Add("agentid", "Give Real Estate Agent ID", {{name="id", help="Player ID"}}, true, function(source, args)
    local Player = CTRPFW.Functions.GetPlayer(source)
    local playerId = tonumber(args[1])
    local OtherPlayer = CTRPFW.Functions.GetPlayer(playerId)
    if Player.PlayerData.job.name == "government" and Player.PlayerData.job.gradelabel == "Governor" or Player.PlayerData.job.gradelabel == "Mayor" or Player.PlayerData.job.gradelabel == "Secretery" then
        if OtherPlayer ~= nil then
            local playerInfo = {
                id = math.random(100000, 999999),
                firstname = OtherPlayer.PlayerData.charinfo.firstname,
                lastname = OtherPlayer.PlayerData.charinfo.lastname,
                citizenid = OtherPlayer.PlayerData.citizenid,
            }
           
            OtherPlayer.Functions.AddItem("realestatecard", 1, false, playerInfo)
            TriggerClientEvent("CTRPFW:Notify", source, "- " .. OtherPlayer.PlayerData.charinfo.firstname .. " " .. OtherPlayer.PlayerData.charinfo.lastname ..  " ,You have received JOB ID CARD.")
            TriggerClientEvent("CTRPFW:Notify", OtherPlayer.PlayerData.source, "Now Your Job is Legal! ")
            TriggerClientEvent('inventory:client:ItemBox', OtherPlayer.PlayerData.source, CTRPFW.Shared.Items["realestatecard"], "add")
        else
            TriggerClientEvent("CTRPFW:Notify", source, "This person is not present..", "error")
        end
    else
        TriggerClientEvent("CTRPFW:Notify", source, "You have no rights..", "error")
    end
end)

CTRPFW.Commands.Add("govid", "Give Government Employee ID", {{name="id", help="Player ID"}}, true, function(source, args)
    local Player = CTRPFW.Functions.GetPlayer(source)
    local playerId = tonumber(args[1])
    local OtherPlayer = CTRPFW.Functions.GetPlayer(playerId)
    if Player.PlayerData.job.name == "government" and Player.PlayerData.job.gradelabel == "Governor" or Player.PlayerData.job.gradelabel == "Mayor" or Player.PlayerData.job.gradelabel == "Secretery" then
        if OtherPlayer ~= nil then
            local playerInfo = {
                id = math.random(100000, 999999),
                firstname = OtherPlayer.PlayerData.charinfo.firstname,
                lastname = OtherPlayer.PlayerData.charinfo.lastname,
                citizenid = OtherPlayer.PlayerData.citizenid,
            }
           
            OtherPlayer.Functions.AddItem("governmentcard", 1, false, playerInfo)
            TriggerClientEvent("CTRPFW:Notify", source, "- " .. OtherPlayer.PlayerData.charinfo.firstname .. " " .. OtherPlayer.PlayerData.charinfo.lastname ..  " ,You have received JOB ID CARD.")
            TriggerClientEvent("CTRPFW:Notify", OtherPlayer.PlayerData.source, "Now Your Job is Legal! ")
            TriggerClientEvent('inventory:client:ItemBox', OtherPlayer.PlayerData.source, CTRPFW.Shared.Items["governmentcard"], "add")
        else
            TriggerClientEvent("CTRPFW:Notify", source, "This person is not present..", "error")
        end
    else
        TriggerClientEvent("CTRPFW:Notify", source, "You have no rights..", "error")
    end
end)

CTRPFW.Commands.Add("judgeid", "Give Judge ID", {{name="id", help="Player ID"}}, true, function(source, args)
    local Player = CTRPFW.Functions.GetPlayer(source)
    local playerId = tonumber(args[1])
    local OtherPlayer = CTRPFW.Functions.GetPlayer(playerId)
    if Player.PlayerData.job.name == "government" and Player.PlayerData.job.gradelabel == "Governor" or Player.PlayerData.job.gradelabel == "Mayor" or Player.PlayerData.job.gradelabel == "Secretery" then
        if OtherPlayer ~= nil then
            local playerInfo = {
                id = math.random(100000, 999999),
                firstname = OtherPlayer.PlayerData.charinfo.firstname,
                lastname = OtherPlayer.PlayerData.charinfo.lastname,
                citizenid = OtherPlayer.PlayerData.citizenid,
            }
           
            OtherPlayer.Functions.AddItem("judgecard", 1, false, playerInfo)
            TriggerClientEvent("CTRPFW:Notify", source, "- " .. OtherPlayer.PlayerData.charinfo.firstname .. " " .. OtherPlayer.PlayerData.charinfo.lastname ..  " ,You have received JOB ID CARD.")
            TriggerClientEvent("CTRPFW:Notify", OtherPlayer.PlayerData.source, "Now Your Job is Legal! ")
            TriggerClientEvent('inventory:client:ItemBox', OtherPlayer.PlayerData.source, CTRPFW.Shared.Items["judgecard"], "add")
        else
            TriggerClientEvent("CTRPFW:Notify", source, "This person is not present..", "error")
        end
    else
        TriggerClientEvent("CTRPFW:Notify", source, "You have no rights..", "error")
    end
end)

CTRPFW.Commands.Add("mayorid", "Give Mayor ID", {{name="id", help="Player ID"}}, true, function(source, args)
    local Player = CTRPFW.Functions.GetPlayer(source)
    local playerId = tonumber(args[1])
    local OtherPlayer = CTRPFW.Functions.GetPlayer(playerId)
    if Player.PlayerData.job.name == "government" and Player.PlayerData.job.gradelabel == "Governor" then
        if OtherPlayer ~= nil then
            local playerInfo = {
                id = math.random(100000, 999999),
                firstname = OtherPlayer.PlayerData.charinfo.firstname,
                lastname = OtherPlayer.PlayerData.charinfo.lastname,
                citizenid = OtherPlayer.PlayerData.citizenid,
            }
           
            OtherPlayer.Functions.AddItem("mayorcard", 1, false, playerInfo)
            TriggerClientEvent("CTRPFW:Notify", source, "- " .. OtherPlayer.PlayerData.charinfo.firstname .. " " .. OtherPlayer.PlayerData.charinfo.lastname ..  " ,You have received JOB ID CARD.")
            TriggerClientEvent("CTRPFW:Notify", OtherPlayer.PlayerData.source, "Now Your Job is Legal! ")
            TriggerClientEvent('inventory:client:ItemBox', OtherPlayer.PlayerData.source, CTRPFW.Shared.Items["mayorcard"], "add")
        else
            TriggerClientEvent("CTRPFW:Notify", source, "This person is not present..", "error")
        end
    else
        TriggerClientEvent("CTRPFW:Notify", source, "You have no rights..", "error")
    end
end)

CTRPFW.Commands.Add("businesslic", "Give Business License", {{name="id", help="Player ID"}}, true, function(source, args)
    local Player = CTRPFW.Functions.GetPlayer(source)
    local playerId = tonumber(args[1])
    local OtherPlayer = CTRPFW.Functions.GetPlayer(playerId)
    if Player.PlayerData.job.name == "government" and Player.PlayerData.job.gradelabel == "Governor" or Player.PlayerData.job.gradelabel == "Mayor" or Player.PlayerData.job.gradelabel == "Secretery" then
        if OtherPlayer ~= nil then
            local playerInfo = {
                id = math.random(100000, 999999),
                firstname = OtherPlayer.PlayerData.charinfo.firstname,
                lastname = OtherPlayer.PlayerData.charinfo.lastname,
                citizenid = OtherPlayer.PlayerData.citizenid,
            }
           
            OtherPlayer.Functions.AddItem("businesscard", 1, false, playerInfo)
            TriggerClientEvent("CTRPFW:Notify", source, "- " .. OtherPlayer.PlayerData.charinfo.firstname .. " " .. OtherPlayer.PlayerData.charinfo.lastname ..  " ,You have received JOB ID CARD.")
            TriggerClientEvent("CTRPFW:Notify", OtherPlayer.PlayerData.source, "Now Your Job is Legal! ")
            TriggerClientEvent('inventory:client:ItemBox', OtherPlayer.PlayerData.source, CTRPFW.Shared.Items["businesscard"], "add")
        else
            TriggerClientEvent("CTRPFW:Notify", source, "This person is not present..", "error")
        end
    else
        TriggerClientEvent("CTRPFW:Notify", source, "You have no rights..", "error")
    end
end)

CTRPFW.Commands.Add("empid", "Give Employee ID", {{name="id", help="Player ID"}}, true, function(source, args)
    local Player = CTRPFW.Functions.GetPlayer(source)
    local playerId = tonumber(args[1])
    local OtherPlayer = CTRPFW.Functions.GetPlayer(playerId)
    if Player.PlayerData.job.name == "government" and Player.PlayerData.job.gradelabel == "Governor" or Player.PlayerData.job.gradelabel == "Mayor" or Player.PlayerData.job.gradelabel == "Secretery" then
        if OtherPlayer ~= nil then
            local playerInfo = {
                id = math.random(100000, 999999),
                firstname = OtherPlayer.PlayerData.charinfo.firstname,
                lastname = OtherPlayer.PlayerData.charinfo.lastname,
                citizenid = OtherPlayer.PlayerData.citizenid,
            }
           
            OtherPlayer.Functions.AddItem("employeecard", 1, false, playerInfo)
            TriggerClientEvent("CTRPFW:Notify", source, "- " .. OtherPlayer.PlayerData.charinfo.firstname .. " " .. OtherPlayer.PlayerData.charinfo.lastname ..  " ,You have received JOB ID CARD.")
            TriggerClientEvent("CTRPFW:Notify", OtherPlayer.PlayerData.source, "Now Your Job is Legal! ")
            TriggerClientEvent('inventory:client:ItemBox', OtherPlayer.PlayerData.source, CTRPFW.Shared.Items["employeecard"], "add")
        else
            TriggerClientEvent("CTRPFW:Notify", source, "This person is not present..", "error")
        end
    else
        TriggerClientEvent("CTRPFW:Notify", source, "You have no rights..", "error")
    end
end)

CTRPFW.Commands.Add("surgerypass", "Give Surgery Pass", {{name="id", help="Player ID"}}, true, function(source, args)
    local Player = CTRPFW.Functions.GetPlayer(source)
    local playerId = tonumber(args[1])
    local OtherPlayer = CTRPFW.Functions.GetPlayer(playerId)
    if Player.PlayerData.job.name == "doctor" and Player.PlayerData.job.gradelabel == "EMS Chief" or Player.PlayerData.job.gradelabel == "Deputy EMS Chief" or Player.PlayerData.job.gradelabel == "Captain" or Player.PlayerData.job.gradelabel == "Lieutenant" then
        if OtherPlayer ~= nil then
            local playerInfo = {
                id = math.random(100000, 999999),
                firstname = OtherPlayer.PlayerData.charinfo.firstname,
                lastname = OtherPlayer.PlayerData.charinfo.lastname,
                citizenid = OtherPlayer.PlayerData.citizenid,
            }
           
            OtherPlayer.Functions.AddItem("surgerypass", 1, false, playerInfo)
            TriggerClientEvent("CTRPFW:Notify", source, "- " .. OtherPlayer.PlayerData.charinfo.firstname .. " " .. OtherPlayer.PlayerData.charinfo.lastname ..  " ,You have received Surgery Pass")
            TriggerClientEvent("CTRPFW:Notify", OtherPlayer.PlayerData.source, "Now You can go for Plastic Surgery ")
            TriggerClientEvent('inventory:client:ItemBox', OtherPlayer.PlayerData.source, CTRPFW.Shared.Items["surgerypass"], "add")
        else
            TriggerClientEvent("CTRPFW:Notify", source, "This person is not present..", "error")
        end
    else
        TriggerClientEvent("CTRPFW:Notify", source, "You have no rights..", "error")
    end
end)

CTRPFW.Commands.Add("weaponpass", "Give Weapon Pass", {{name="id", help="Player ID"}}, true, function(source, args)
    local Player = CTRPFW.Functions.GetPlayer(source)
    local playerId = tonumber(args[1])
    local OtherPlayer = CTRPFW.Functions.GetPlayer(playerId)
    if Player.PlayerData.job.name == "police" and Player.PlayerData.job.gradelabel == "Commissioner" or Player.PlayerData.job.gradelabel == "Chief" or Player.PlayerData.job.gradelabel == "Deputy Commissioner" or Player.PlayerData.job.gradelabel == "Assistant Commissioner" or Player.PlayerData.job.gradelabel == "Captain" or Player.PlayerData.job.gradelabel == "Lieutenant" or Player.PlayerData.job.gradelabel == "Sergeant" or Player.PlayerData.job.gradelabel == "Corporal" then
        if OtherPlayer ~= nil then
            local playerInfo = {
                id = math.random(100000, 999999),
                firstname = OtherPlayer.PlayerData.charinfo.firstname,
                lastname = OtherPlayer.PlayerData.charinfo.lastname,
                citizenid = OtherPlayer.PlayerData.citizenid,
            }
           
            OtherPlayer.Functions.AddItem("weaponlicense", 1, false, playerInfo)
            TriggerClientEvent("CTRPFW:Notify", source, "- " .. OtherPlayer.PlayerData.charinfo.firstname .. " " .. OtherPlayer.PlayerData.charinfo.lastname ..  " ,You have received Weapon Pass")
            TriggerClientEvent("CTRPFW:Notify", OtherPlayer.PlayerData.source, "Now You can go for Weapon Pass")
            TriggerClientEvent('inventory:client:ItemBox', OtherPlayer.PlayerData.source, CTRPFW.Shared.Items["weaponlicense"], "add")
        else
            TriggerClientEvent("CTRPFW:Notify", source, "This person is not present..", "error")
        end
    else
        TriggerClientEvent("CTRPFW:Notify", source, "You have no rights..", "error")
    end
end)

CTRPFW.Commands.Add("dojcard", "Give DOJ CARD", {{name="id", help="Player ID"}}, true, function(source, args)
    local Player = CTRPFW.Functions.GetPlayer(source)
    local playerId = tonumber(args[1])
    local OtherPlayer = CTRPFW.Functions.GetPlayer(playerId)
    if Player.PlayerData.job.name == "government" and Player.PlayerData.job.gradelabel == "Governor" or Player.PlayerData.job.name == "Mayor" or  Player.PlayerData.job.name == "doj" and Player.PlayerData.job.gradelabel == "Chief Justice" then
        if OtherPlayer ~= nil then
            local playerInfo = {
                id = math.random(100000, 999999),
                firstname = OtherPlayer.PlayerData.charinfo.firstname,
                lastname = OtherPlayer.PlayerData.charinfo.lastname,
                citizenid = OtherPlayer.PlayerData.citizenid,
            }
           
            OtherPlayer.Functions.AddItem("dojcard", 1, false, playerInfo)
            TriggerClientEvent("CTRPFW:Notify", source, "- " .. OtherPlayer.PlayerData.charinfo.firstname .. " " .. OtherPlayer.PlayerData.charinfo.lastname ..  " ,You have received DOJ CARD")
            TriggerClientEvent('inventory:client:ItemBox', OtherPlayer.PlayerData.source, CTRPFW.Shared.Items["dojcard"], "add")
        else
            TriggerClientEvent("CTRPFW:Notify", source, "This person is not present..", "error")
        end
    else
        TriggerClientEvent("CTRPFW:Notify", source, "You have no rights..", "error")
    end
end)


CTRPFW.Commands.Add("givepaper", "Give finance paper", {{name="id", help="Player ID"}}, true, function(source, args)
    local Player = CTRPFW.Functions.GetPlayer(source)
    local playerId = tonumber(args[1])
    local OtherPlayer = CTRPFW.Functions.GetPlayer(playerId)
    if Player.PlayerData.job.name == "pdm" and Player.PlayerData.job.gradelabel == "Owner" or Player.PlayerData.job.gradelabel == "CEO" or Player.PlayerData.job.gradelabel == "Salesman" or Player.PlayerData.job.gradelabel == "Senior Salesman" or Player.PlayerData.job.gradelabel == "Executive" or Player.PlayerData.job.gradelabel == "Manager" then
        if OtherPlayer ~= nil then
            local playerInfo = {
                id = math.random(100000, 999999),
                firstname = OtherPlayer.PlayerData.charinfo.firstname,
                lastname = OtherPlayer.PlayerData.charinfo.lastname,
                citizenid = OtherPlayer.PlayerData.citizenid,
            }
           
            OtherPlayer.Functions.AddItem("financepaper", 1, false, playerInfo)
            TriggerClientEvent("CTRPFW:Notify", source, "- " .. OtherPlayer.PlayerData.charinfo.firstname .. " " .. OtherPlayer.PlayerData.charinfo.lastname ..  " ,You have received Finance Paper")
            TriggerClientEvent("CTRPFW:Notify", OtherPlayer.PlayerData.source, "Now You can go for Finance Paper")
            TriggerClientEvent('inventory:client:ItemBox', OtherPlayer.PlayerData.source, CTRPFW.Shared.Items["financepaper"], "add")
        else
            TriggerClientEvent("CTRPFW:Notify", source, "This person is not present..", "error")
        end
    else
        TriggerClientEvent("CTRPFW:Notify", source, "You have no rights..", "error")
    end
end)

CTRPFW.Commands.Add("vehiclecard", "Give Vehicle Card", {{name="id", help="Player ID"}}, true, function(source, args)
    local Player = CTRPFW.Functions.GetPlayer(source)
    local playerId = tonumber(args[1])
    local OtherPlayer = CTRPFW.Functions.GetPlayer(playerId)
    if Player.PlayerData.job.name == "pdm" and Player.PlayerData.job.gradelabel == "Owner" or Player.PlayerData.job.gradelabel == "CEO" or Player.PlayerData.job.gradelabel == "Salesman" or Player.PlayerData.job.gradelabel == "Senior Salesman" or Player.PlayerData.job.gradelabel == "Executive" or Player.PlayerData.job.gradelabel == "Manager" then
        if OtherPlayer ~= nil then
            local playerInfo = {
                id = math.random(100000, 999999),
                firstname = OtherPlayer.PlayerData.charinfo.firstname,
                lastname = OtherPlayer.PlayerData.charinfo.lastname,
                citizenid = OtherPlayer.PlayerData.citizenid,
            }
           
            OtherPlayer.Functions.AddItem("buycard", 1, false, playerInfo)
            TriggerClientEvent("CTRPFW:Notify", source, "- " .. OtherPlayer.PlayerData.charinfo.firstname .. " " .. OtherPlayer.PlayerData.charinfo.lastname ..  " ,You have received Vehicle card")
            TriggerClientEvent("CTRPFW:Notify", OtherPlayer.PlayerData.source, "Now You can go for Purchasing Vehicle")
            TriggerClientEvent('inventory:client:ItemBox', OtherPlayer.PlayerData.source, CTRPFW.Shared.Items["buycard"], "add")
        else
            TriggerClientEvent("CTRPFW:Notify", source, "This person is not present..", "error")
        end
    else
        TriggerClientEvent("CTRPFW:Notify", source, "You have no rights..", "error")
    end
end)


CTRPFW.Commands.Add("givedocument", "Give housing paper", {{name="id", help="Player ID"}}, true, function(source, args)
    local Player = CTRPFW.Functions.GetPlayer(source)
    local playerId = tonumber(args[1])
    local OtherPlayer = CTRPFW.Functions.GetPlayer(playerId)
    if Player.PlayerData.job.name == "realestate" and Player.PlayerData.job.gradelabel == "Company Owner" then
        if OtherPlayer ~= nil then
            local playerInfo = {
                id = math.random(100000, 999999),
                firstname = OtherPlayer.PlayerData.charinfo.firstname,
                lastname = OtherPlayer.PlayerData.charinfo.lastname,
                citizenid = OtherPlayer.PlayerData.citizenid,
            }
           
            OtherPlayer.Functions.AddItem("housingpaper", 1, false, playerInfo)
            TriggerClientEvent("CTRPFW:Notify", source, "- " .. OtherPlayer.PlayerData.charinfo.firstname .. " " .. OtherPlayer.PlayerData.charinfo.lastname ..  " ,You have received Housing Paper")
            TriggerClientEvent("CTRPFW:Notify", OtherPlayer.PlayerData.source, "Now You can go and buy your house")
            TriggerClientEvent('inventory:client:ItemBox', OtherPlayer.PlayerData.source, CTRPFW.Shared.Items["housingpaper"], "add")
        else
            TriggerClientEvent("CTRPFW:Notify", source, "This person is not present..", "error")
        end
    else
        TriggerClientEvent("CTRPFW:Notify", source, "You have no rights..", "error")
    end
end)

CTRPFW.Commands.Add("petlicense", "Give Pet Lic", {{name="id", help="Player ID"}}, true, function(source, args)
    local Player = CTRPFW.Functions.GetPlayer(source)
    local playerId = tonumber(args[1])
    local OtherPlayer = CTRPFW.Functions.GetPlayer(playerId)
    if Player.PlayerData.job.name == "police" then
        if OtherPlayer ~= nil then
            local playerInfo = {
                id = math.random(100000, 999999),
                firstname = OtherPlayer.PlayerData.charinfo.firstname,
                lastname = OtherPlayer.PlayerData.charinfo.lastname,
                citizenid = OtherPlayer.PlayerData.citizenid,
            }
           
            OtherPlayer.Functions.AddItem("petlicense", 1, false, playerInfo)
            TriggerClientEvent("CTRPFW:Notify", source, "- " .. OtherPlayer.PlayerData.charinfo.firstname .. " " .. OtherPlayer.PlayerData.charinfo.lastname ..  " ,You have received Pet License")
            TriggerClientEvent("CTRPFW:Notify", OtherPlayer.PlayerData.source, "Now You can go for Pet License")
            TriggerClientEvent('inventory:client:ItemBox', OtherPlayer.PlayerData.source, CTRPFW.Shared.Items["petlicense"], "add")
        else
            TriggerClientEvent("CTRPFW:Notify", source, "This person is not present..", "error")
        end
    else
        TriggerClientEvent("CTRPFW:Notify", source, "You have no rights..", "error")
    end
end)

-----------------Vaccination
CTRPFW.Commands.Add("covidvac", "Give covid vaccine", {{name="id", help="Player ID"}}, true, function(source, args)
    local Player = CTRPFW.Functions.GetPlayer(source)
    local playerId = tonumber(args[1])
    local OtherPlayer = CTRPFW.Functions.GetPlayer(playerId)
    if Player.Functions.GetItemByName("covidvac") ~= nil and Player.PlayerData.job.name == "doctor" then
        if OtherPlayer ~= nil then
            local playerInfo = {
                id = math.random(100000, 999999),
                firstname = OtherPlayer.PlayerData.charinfo.firstname,
                lastname = OtherPlayer.PlayerData.charinfo.lastname,
                citizenid = OtherPlayer.PlayerData.citizenid,
            }
            TriggerClientEvent('covidvac:client:vaccination', source)
            OtherPlayer.Functions.AddItem("covidcert", 1, false, playerInfo)
            TriggerClientEvent("CTRPFW:Notify", source, "- " .. OtherPlayer.PlayerData.charinfo.firstname .. " " .. OtherPlayer.PlayerData.charinfo.lastname ..  " ,Have received Covid Vaccine.")
            TriggerClientEvent("CTRPFW:Notify", OtherPlayer.PlayerData.source, "Now You are vaccinated.But wear mask for safety.")
            TriggerClientEvent('inventory:client:ItemBox', OtherPlayer.PlayerData.source, CTRPFW.Shared.Items["covidcert"], "add")
        else
            TriggerClientEvent("CTRPFW:Notify", source, "This person is not present..", "error")
        end
    else
        TriggerClientEvent("CTRPFW:Notify", source, "You dont have item required or you dont have permission..", "error")
    end
end)