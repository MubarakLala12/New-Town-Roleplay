CTRPFW = nil

Citizen.CreateThread(function()
    while CTRPFW == nil do
        TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)
        Citizen.Wait(200)
    end
end)

PlayerJob = {}

RegisterNetEvent('CTRPFW:Client:OnPlayerLoaded')
AddEventHandler('CTRPFW:Client:OnPlayerLoaded', function()
    CTRPFW.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
    end)
    isLoggedIn = true
end)

RegisterNetEvent('CTRPFW:Client:OnJobUpdate')
AddEventHandler('CTRPFW:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
end)


key_to_teleport = 38

positions = {
    --[[
    {{Teleport1 X, Teleport1 Y, Teleport1 Z, Teleport1 Heading}, {Teleport2 X, Teleport 2Y, Teleport 2Z, Teleport2 Heading}, {Red, Green, Blue}, "Text for Teleport"}
    ]]
    {{-389.53, 4345.74, 56.83, 10.92}, {886.87, -3245.27, -98.76, 86.87},{36,237,157}},
}


local player = GetPlayerPed(-1)

Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(5)
        local player = GetPlayerPed(-1)
        local playerLoc = GetEntityCoords(player)

        for _,location in ipairs(positions) do
            teleport_text = location[4]
            loc1 = {
                x=location[1][1],
                y=location[1][2],
                z=location[1][3],
                heading=location[1][4]
            }
            loc2 = {
                x=location[2][1],
                y=location[2][2],
                z=location[2][3],
                heading=location[2][4]
            }
            Red = location[3][1]
            Green = location[3][2]
            Blue = location[3][3]

            if PlayerJob.name == "bigboss" then
                DrawMarker(31, loc1.x, loc1.y, loc1.z + 0.3, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.45, 0.45, 0.45, 255, 0, 0, 155, 0, 0, 0, 1, 0, 0, 0)
                DrawMarker(31, loc2.x, loc2.y, loc2.z + 0.3, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.45, 0.45, 0.45, 255, 0, 0, 155, 0, 0, 0, 1, 0, 0, 0)
                if CheckPos(playerLoc.x, playerLoc.y, playerLoc.z, loc1.x, loc1.y, loc1.z, 2) then 
                    
                    if IsControlJustReleased(1, key_to_teleport) then
                        if IsPedInAnyVehicle(player, true) then
                            SetEntityCoords(GetVehiclePedIsUsing(player), loc2.x, loc2.y, loc2.z)
                            SetEntityHeading(GetVehiclePedIsUsing(player), loc2.heading)
                        else
                            SetEntityCoords(player, loc2.x, loc2.y, loc2.z)
                            SetEntityHeading(player, loc2.heading)
                        end
                    end

                elseif CheckPos(playerLoc.x, playerLoc.y, playerLoc.z, loc2.x, loc2.y, loc2.z, 2) then

                    if IsControlJustReleased(1, key_to_teleport) then
                        if IsPedInAnyVehicle(player, true) then
                            SetEntityCoords(GetVehiclePedIsUsing(player), loc1.x, loc1.y, loc1.z)
                            SetEntityHeading(GetVehiclePedIsUsing(player), loc1.heading)
                        else
                            SetEntityCoords(player, loc1.x, loc1.y, loc1.z)
                            SetEntityHeading(player, loc1.heading)
                        end
                    end
                end
            end            
        end
    end
end)

function CheckPos(x, y, z, cx, cy, cz, radius)
    local t1 = x - cx
    local t12 = t1^2

    local t2 = y-cy
    local t21 = t2^2

    local t3 = z - cz
    local t31 = t3^2

    return (t12 + t21 + t31) <= radius^2
end
