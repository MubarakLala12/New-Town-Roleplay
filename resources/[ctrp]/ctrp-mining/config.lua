Config = {


    ChanceToGetItem = 17, -- if math.random(0, 100) <= ChanceToGetItem then give item
    Items = {
    'stone'},
    Sell = vector3(287.24, 2843.74, 44.4),
    Objects = {
        ['pickaxe'] = 'prop_tool_pickaxe',
    },
    MiningPositions = {
        {coords = vector3(-485.85, 1894.19, 119.00), heading = 187.24},
        {coords = vector3(-482.33, 1895.41, 119.0), heading = 4.31},
        {coords = vector3(-489.47, 1893.94, 119.0), heading = 185.08},
        {coords = vector3(-493.33, 1894.59, 119.50), heading = 0.8},
        {coords = vector3(-500.27, 1892.93, 120.00), heading = 175.03},
        {coords = vector3(-505.92, 1894.11, 120.00), heading = 342.01},
        {coords = vector3(-512.27, 1894.35, 120.50), heading = 340.61},
        {coords = vector3(-516.62, 1894.02, 121.50), heading = 178.33},

        {coords = vector3(-564.4, 1885.86, 122.00), heading = 202.92},
        {coords = vector3(-561.32, 1888.55, 122.00), heading = 3.75},
        {coords = vector3(-557.85, 1890.67, 122.00), heading = 40.33},
        {coords = vector3(-555.02, 1891.35, 121.80), heading = 213.86},

        {coords = vector3(-443.58, 2015.39, 122.80), heading = 27.01},
        {coords = vector3(-445.9, 2012.62, 122.80), heading = 216.45},

        {coords = vector3(-423.52, 2064.26, 119.00), heading = 190.42},
        {coords = vector3(-427.75, 2064.28, 119.50), heading = 11.96},

        {coords = vector3(-473.02, 2089.41, 119.00), heading = 102.13},
        {coords = vector3(-471.3, 2085.72, 119.00), heading = 279.35},

        {coords = vector3(-471.61, 2081.88, 119.00), heading = 99.91},
        {coords = vector3(-469.81, 2077.36, 119.50), heading = 292.7},
        {coords = vector3(-468.01, 2071.91, 119.50), heading = 279.09},

    },

}

Strings = {
    ['press_mine'] = 'Press ~INPUT_CONTEXT~ to mine.',
    ['mining_info'] = 'Press ~INPUT_FRONTEND_RDOWN~ to chop, ~INPUT_FRONTEND_RRIGHT~ to stop.',
    ['you_sold'] = 'You sold %sx %s for %s',
    ['e_sell'] = 'Press ~INPUT_CONTEXT~ to sell all your mined items.',
    ['someone_close'] = 'There is a player too close to you!',
    ['mining'] = 'Mine',
    ['warning'] = 'Must check weight of inventory else if weight is full and you wash then you will not get item',
    ['warning1'] = 'Must check weight of inventory else if weight is full and you melt then you will not get item',
    ['sell_mine'] = 'Ore Selling'
}

Config.SellLocations = {
    [1] = {
        ["coords"] = {
            ["x"] = 486.48, 
            ["y"] = -591.53, 
            ["z"] = 26.21
        }
    }
}


Config.MiningItems = {
    ["ironore"] = {
        ["price"] = 20 
    },

    ["silverore"] = {
        ["price"] = 30 
    },

    ["goldore"] = {
        ["price"] = 40 
    },

    ["diamond"] = {
        ["price"] = 50 
    },

}

Config.PizzaItems = {
    ["greychip"] = {
        ["price"] = 50 
    },  
    ["labkey"] = {
        ["price"] = 50 
    },  

}

Config.CsItem = {
    ["empty_bag"] = {
        ["price"] = 50 
    },  
     

}