local objects = {
    {x = 266.09, y = -349.35, z = 44.74, model = "prop_sec_barier_02b"}, 
    {x = 285.28, y = -355.78, z = 45.13, model = "prop_sec_barier_02a"}, 
    {x = 230.92, y = -816.15, z = 30.16, model = "prop_sec_barrier_ld_01a"},
    {x = 206.52, y = -803.47, z = 30.95, model = "prop_sec_barrier_ld_01a"},
    {x = 301.0199, y = -576.8063, z = 42.3272, model = "prop_bench_01a"},
    {x = 297.2935, y = -588.815, z = 42.3272, model = "prop_bench_01a"},
    {x = 295.3752, y = -594.092, z = 42.3272, model = "prop_bench_01a"},
    {x = 299.9927, y = -581.3138, z = 42.27367, model = "prop_bin_05a"},
    {x = -596.0465, y = 2088.56, z = 130.587, model = "prop_mineshaft_door"},

}

Citizen.CreateThread(function()
    while true do
        for k, v in pairs(objects) do
            local ent = GetClosestObjectOfType(objects[k].x, objects[k].y, objects[k].z, 2.0, GetHashKey(objects[k].model), false, false, false)

            SetEntityAsMissionEntity(ent, 1, 1)
            DeleteObject(ent)
            SetEntityAsNoLongerNeeded(ent)
        end

        Citizen.Wait(5000)
    end
end)