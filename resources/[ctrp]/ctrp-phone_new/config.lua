Config = Config or {}

Config.RepeatTimeout = 2000
Config.CallRepeats = 10
Config.OpenPhone = 244
Config.PhoneApplications = {
    ["phone"] = {
        app = "phone",
        color = "#04b543",
        icon = "fa fa-phone-alt",
        tooltipText = "Phone",
        tooltipPos = "top",
        job = false,
        blockedjobs = {},
        slot = 1,
        Alerts = 0,
    },
    ["whatsapp"] = {
        app = "whatsapp",
        color = "#25d366",
        icon = "fab fa-whatsapp",
        tooltipText = "Whatsapp",
        tooltipPos = "top",
        style = "font-size: 2.8vh";
        job = false,
        blockedjobs = {},
        slot = 2,
        Alerts = 0,
    },
    ["settings"] = {
        app = "settings",
        color = "#636e72",
        icon = "fa fa-cog",
        tooltipText = "Settings",
        tooltipPos = "top",
        style = "padding-right: .08vh; font-size: 2.3vh";
        job = false,
        blockedjobs = {},
        slot = 3,
        Alerts = 0,
    },
    ["twitter"] = {
        app = "twitter",
        color = "#1da1f2",
        icon = "fab fa-twitter",
        tooltipText = "Twitter",
        tooltipPos = "top",
        job = false,
        blockedjobs = {},
        slot = 6,
        Alerts = 0,
    },
    ["garage"] = {
        app = "garage",
        color = "#E74C3C",
        icon = "fas fa-car-alt",
        tooltipText = "VEHICLES",
        job = false,
        blockedjobs = {},
        slot = 7,
        Alerts = 0,
    },
    ["mail"] = {
        app = "mail",
        color = "#F7F7F7",
        icon = "fas fa-envelope-open-text",
        tooltipText = "MAIL",
        job = false,
        blockedjobs = {},
        slot = 5,
        Alerts = 0,
    },
    ["advertentie"] = {
        app = "advertentie",
        color = "#017ff7",
        icon = "fas fa-ad",
        tooltipText = "Adverts",
        job = false,
        blockedjobs = {},
        slot = 8,
        Alerts = 0,
    },
    ["bank"] = {
        app = "bank",
        color = "#9c88ff",
        icon = "fas fa-university",
        tooltipText = "Bank",
        job = false,
        blockedjobs = {},
        slot = 4,
        Alerts = 0,
    },
    --[[["crypto"] = {
        app = "crypto",
        color = "#004682",
        icon = "fas fa-chart-pie",
        tooltipText = "Crypto",
        job = false,
        blockedjobs = {},
        slot = 9,
        Alerts = 0,
    },
    ["racing"] = {
        app = "racing",
        color = "#353b48",
        icon = "fas fa-tachometer-alt",
        tooltipText = "Racing",
        job = false,
        blockedjobs = {},
        slot = 11,
        Alerts = 0,
    },]]
    ["houses"] = {
        app = "houses",
        color = "#27ae60",
        icon = "fas fa-house-user",
        tooltipText = "Houses",
        job = false,
        blockedjobs = {},
        slot = 10,
        Alerts = 0,
    },
    ["meos"] = {
        app = "meos",
        color = "#004682",
        icon = "fas fa-ad",
        tooltipText = "MEOS",
        job = "police",
        blockedjobs = {},
        slot = 12,
        Alerts = 0,
    },

    ["lawyers"] = {
        app = "lawyers",
        color = "#f5bf42",
        icon = "fas fa-car-crash",
        tooltipText = "Mechanic",
        tooltipPos = "right",
        job = false,
        blockedjobs = {},
        slot = 9,
        Alerts = 0,
    },

    ["taxi"] = {
        app = "taxi",
        color = "#f5bf42",
        icon = "fas fa-taxi",
        tooltipText = "Taxi",
        tooltipPos = "right",
        style = "font-size: 2.8vh";
        job = false,
        blockedjobs = {},
        slot = 11,
        Alerts = 0,
    },

    

    -- ["lawyers"] = {
    --     app = "lawyers",
    --     color = "#353b48",
    --     icon = "fas fa-user-tie",
    --     tooltipText = "Mechanic",
    --     tooltipPos = "right",
    --     job = false,
    --     blockedjobs = {},
    --     slot = 13,
    --     Alerts = 0,
    -- },
    -- ["store"] = {
    --     app = "store",
    --     color = "#27ae60",
    --     icon = "fas fa-cart-arrow-down",
    --     tooltipText = "App Store",
    --     tooltipPos = "right",
    --     style = "padding-right: .3vh; font-size: 2.2vh";
    --     job = false,
    --     blockedjobs = {},
    --     slot = 14,
    --     Alerts = 0,
    -- },
    -- ["trucker"] = {
    --     app = "trucker",
    --     color = "#cccc33",
    --     icon = "fas fa-truck-moving",
    --     tooltipText = "Dumbo",
    --     tooltipPos = "right",
    --     job = false,
    --     blockedjobs = {},
    --     slot = 17,
    --     Alerts = 0,
    -- },
}
Config.MaxSlots = 20

Config.StoreApps = {
    ["territory"] = {
        app = "territory",
        color = "#353b48",
        icon = "fas fa-globe-europe",
        tooltipText = "Territorium",
        tooltipPos = "right",
        style = "";
        job = false,
        blockedjobs = {},
        slot = 15,
        Alerts = 0,
        password = false,
        creator = "Randstad",
        title = "Territory",
    },
}