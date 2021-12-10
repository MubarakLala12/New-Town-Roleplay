-- Check if player is near another player
function IsNearPlayer(player)
    local ply = GetPlayerPed(-1)
    local plyCoords = GetEntityCoords(ply, 0)
    local ply2 = GetPlayerPed(GetPlayerFromServerId(player))
    local ply2Coords = GetEntityCoords(ply2, 0)
    local distance = GetDistanceBetweenCoords(ply2Coords["x"], ply2Coords["y"], ply2Coords["z"],  plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
    if(distance <= 5) then
      return true
    end
  end
  
  function GetClosestPlayer()
    local closestPlayers = CTRPFW.Functions.GetPlayersFromCoords()
    local closestDistance = -1
    local closestPlayer = -1
    local coords = GetEntityCoords(GetPlayerPed(-1))
  
    for i=1, #closestPlayers, 1 do
        if closestPlayers[i] ~= PlayerId() then
            local pos = GetEntityCoords(GetPlayerPed(closestPlayers[i]))
            local distance = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, coords.x, coords.y, coords.z, true)
  
            if closestDistance == -1 or closestDistance > distance then
                closestPlayer = closestPlayers[i]
                closestDistance = distance
            end
        end
  end
  
  return closestPlayer, closestDistance
  end
  
  RegisterNetEvent('banking:client:CheckDistance')
  AddEventHandler('banking:client:CheckDistance', function(targetId, amount)
    local player, distance = GetClosestPlayer()
    if player ~= -1 and distance < 2.5 then
      local playerId = GetPlayerServerId(player)
      if targetId == playerId then
        TriggerServerEvent('banking:server:giveCash', playerId, amount)
      end
    else
      CTRPFW.Functions.Notify('You are not close to the person.', 'error')
    end
  end)