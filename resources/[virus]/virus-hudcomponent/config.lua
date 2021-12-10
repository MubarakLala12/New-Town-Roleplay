CTRPHud = {}

CTRPHud.Show = false

CTRPHud.Money = {}
CTRPHud.Money.ShowConstant = false -- Show money constantly

CTRPHud.Radar = {}
CTRPHud.Radar.NoRadarVehicles = {
    "bmx",
    "cruiser",
    "fixter",
    "scorcher",
    "tribike",
    "tribike2",
    "tribike3",
}

CTRPStress = {}

CTRPStress.Intensity = {
    ["shake"] = {
        [1] = {
            min = 0,
            max = 10,
            intensity = 0.05,
        },
        [2] = {
            min = 10,
            max = 30,
            intensity = 0.10,
        },
        [3] = {
            min = 30,
            max = 50,
            intensity = 0.15,
        },
        [4] = {
            min = 50,
            max = 80,
            intensity = 0.20,
        },
        [5] = {
            min = 80,
            max = 90,
            intensity = 0.25,
        },
        [6] = {
            min = 90,
            max = 100,
            intensity = 0.30,
        },
        -- [1] = {
        --     min = 20,
        --     max = 40,
        --     intensity = 0.20,
        -- },
        -- [2] = {
        --     min = 40,
        --     max = 60,
        --     intensity = 0.30,
        -- },
        -- [3] = {
        --     min = 60,
        --     max = 80,
        --     intensity = 0.40,
        -- },
        -- [4] = {
        --     min = 80,
        --     max = 90,
        --     intensity = 0.50,
        -- },
        -- [5] = {
        --     min = 90,
        --     max = 100,
        --     intensity = 0.60,
        -- },
    }
}

CTRPStress.MinimumStress = 10
CTRPStress.MinimumSpeed = 120

CTRPStress.EffectInterval = {
    [1] = {
        min = 10,
        max = 20,
        timeout = math.random(50000, 60000)
    },
    [2] = {
        min = 20,
        max = 40,
        timeout = math.random(55000, 60000)
    },
    [3] = {
        min = 40,
        max = 60,
        timeout = math.random(40000, 50000)
    },
    [4] = {
        min = 60,
        max = 80,
        timeout = math.random(30000, 40000)
    },
    [5] = {
        min = 80,
        max = 90,
        timeout = math.random(20000, 30000)
    },
    [6] = {
        min = 90,
        max = 100,
        timeout = math.random(15000, 20000)
    }
    -- [1] = {
    --     min = 20,
    --     max = 40,
    --     timeout = math.random(50000, 60000)
    -- },
    -- [2] = {
    --     min = 40,
    --     max = 60,
    --     timeout = math.random(40000, 50000)
    -- },
    -- [3] = {
    --     min = 60,
    --     max = 80,
    --     timeout = math.random(30000, 40000)
    -- },
    -- [4] = {
    --     min = 80,
    --     max = 90,
    --     timeout = math.random(20000, 30000)
    -- },
    -- [5] = {
    --     min = 90,
    --     max = 100,
    --     timeout = math.random(15000, 20000)
    -- }
}