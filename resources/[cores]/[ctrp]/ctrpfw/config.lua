CTRPConfig = {}

CTRPConfig.MaxPlayers = GetConvarInt('sv_maxclients', 64) -- Gets max players from config file, default 32
CTRPConfig.IdentifierType = "steam" -- Set the identifier type (can be: steam, license)
CTRPConfig.DefaultSpawn = {x=-1035.71,y=-2731.87,z=12.86,a=0.0}

CTRPConfig.Money = {}
CTRPConfig.Money.MoneyTypes = {['cash'] = 1000, ['bank'] = 5000, ['crypto'] = 0 } -- ['type']=startamount - Add or remove money types for your server (for ex. ['blackmoney']=0), remember once added it will not be removed from the database!
CTRPConfig.Money.DontAllowMinus = {'cash', 'crypto'} -- Money that is not allowed going in minus

CTRPConfig.Player = {}
CTRPConfig.Player.MaxWeight = 300000 -- Max weight a player can carry (currently 120kg, written in grams)
CTRPConfig.Player.MaxInvSlots = 40 -- Max inventory slots for a player
CTRPConfig.Player.Bloodtypes = {
    "A+",
    "A-",
    "B+",
    "B-",
    "AB+",
    "AB-",
    "O+",
    "O-",
}

CTRPConfig.Server = {} -- General server config
CTRPConfig.Server.closed = false -- Set server closed (no one can join except people with ace permission 'CTRPadmin.join')
CTRPConfig.Server.closedReason = "We\'re still testing." -- Reason message to display when people can't join the server
CTRPConfig.Server.uptime = 0 -- Time the server has been up.
CTRPConfig.Server.whitelist = true -- Enable or disable whitelist on the server
CTRPConfig.Server.discord = "https://discord.gg/j4FDFYdBFp" -- Discord invite link
CTRPConfig.Server.PermissionList = {} -- permission list
