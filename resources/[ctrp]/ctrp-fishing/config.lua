Config = {}

Config.Debug = false
Config.JobBusy = false

Config.MarkerData = {
    ["type"] = 6,
    ["size"] = vector3(2.0, 2.0, 2.0),
    ["color"] = vector3(0, 255, 150)
}

Config.FishingRestaurant = {
    ["name"] = "Fish Restaurant",
    ["blip"] = {
        ["sprite"] = 628,
        ["color"] = 3
    },
    ["ped"] = {
        ["model"] = 0xED0CE4C6,
        ["position"] = vector3(-1038.4545898438, -1397.0551757813, 5.553192615509),
        ["heading"] = 75.0
    }
}

Config.FishingItems = {
    ["rod"] = {
        ["name"] = "fishingrod",
        ["label"] = "Fishing Rod"
    },
    ["bait"] = {
        ["name"] = "fishingbait",
        ["label"] = "Fishing Bait"
    },
    ["fish"] = {
        ["price"] = 80 
    },
    ["stripedbass"] = {
        ["price"] = 110
    },
    ["bluefish"] = {
        ["price"] = 130
    },
    ["redfish"] = {
        ["price"] = 160 
    },
    ["pacifichalibut"] = {
        ["price"] = 200
    },
    ["goldfish"] = {
        ["price"] = 250
    },
    ["largemouthbass"] = {
        ["price"] = 280
    },
    ["salmon"] = {
        ["price"] = 320
    },
    ["catfish"] = {
        ["price"] = 350
    },
    ["tigersharkmeat"] = {
        ["price"] = 390
    },
    ["stingraymeat"] = {
        ["price"] = 420
    },
    ["killerwhalemeat"] = {
        ["price"] = 500
    },
}

Config.FishingZones = {
    {
        ["name"] = "Catfish View",
        ["coords"] = vector3(3870.14, 4463.57, -0.47),
        ["radius"] = 100.0,
    },
    {
        ["name"] = "Chumash Fishing",
        ["coords"] = vector3(-3428.34, 968.53, 8.35),
        ["radius"] = 50.0,
    },
    {
        ["name"] = "Chiliad Fishing",
        ["coords"] = vector3(-1612.23, 5262.75, 3.97),
        ["radius"] = 50.0,
    },
    {
        ["name"] = "Beach Fishing",
        ["coords"] = vector3(-1851.72, -1249.2, 8.62),
        ["radius"] = 50.0,
    },
    
}