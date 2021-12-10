CTRPFW.Functions.CreateUseableItem("joint", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:UseJoint", source)
    end
end)

CTRPFW.Functions.CreateUseableItem("cigarette", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Usecigarette", source)
    end
end)

CTRPFW.Functions.CreateUseableItem("armor", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
    TriggerClientEvent("consumables:client:UseArmor", source)
end)

CTRPFW.Functions.CreateUseableItem("heavyarmor", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
    TriggerClientEvent("consumables:client:UseHeavyArmor", source)
end)

-- CTRPFW.Functions.CreateUseableItem("smoketrailred", function(source, item)
--     local Player = CTRPFW.Functions.GetPlayer(source)
-- 	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
--         TriggerClientEvent("consumables:client:UseRedSmoke", source)
--     end
-- end)

CTRPFW.Functions.CreateUseableItem("parachute", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:UseParachute", source)
    end
end)

CTRPFW.Commands.Add("parachuteoff", "Take off your parachute", {}, false, function(source, args)
    local Player = CTRPFW.Functions.GetPlayer(source)
        TriggerClientEvent("consumables:client:ResetParachute", source)
end)

RegisterServerEvent("ctrp-smallpenis:server:AddParachute")
AddEventHandler("ctrp-smallpenis:server:AddParachute", function()
    local src = source
    local Ply = CTRPFW.Functions.GetPlayer(src)

    Ply.Functions.AddItem("parachute", 1)
end)

CTRPFW.Functions.CreateUseableItem("water_bottle", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", source, item.name)
    end
end)

CTRPFW.Functions.CreateUseableItem("vodka", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
    TriggerClientEvent("consumables:client:DrinkAlcohol", source, item.name)
end)

CTRPFW.Functions.CreateUseableItem("beer", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
    TriggerClientEvent("consumables:client:DrinkAlcohol", source, item.name)
end)

CTRPFW.Functions.CreateUseableItem("whiskey", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
    TriggerClientEvent("consumables:client:DrinkAlcohol", source, item.name)
end)

CTRPFW.Functions.CreateUseableItem("coffee", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:CDrink", source, item.name)
    end
end)

CTRPFW.Functions.CreateUseableItem("kurkakola", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:SDrink", source, item.name)
    end
end)

CTRPFW.Functions.CreateUseableItem("sandwich", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:SaEat", source, item.name)
    end
end)

CTRPFW.Functions.CreateUseableItem("twerks_candy", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

CTRPFW.Functions.CreateUseableItem("snikkel_candy", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

CTRPFW.Functions.CreateUseableItem("tosti", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

CTRPFW.Functions.CreateUseableItem("binoculars", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
    TriggerClientEvent("binoculars:Toggle", source)
end)

CTRPFW.Functions.CreateUseableItem("cokebaggy", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
    TriggerClientEvent("consumables:client:Cokebaggy", source)
end)

CTRPFW.Functions.CreateUseableItem("crack_baggy", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
    TriggerClientEvent("consumables:client:Crackbaggy", source)
end)

CTRPFW.Functions.CreateUseableItem("xtcbaggy", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
    TriggerClientEvent("consumables:client:EcstasyBaggy", source)
end)

CTRPFW.Functions.CreateUseableItem("firework1", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
    TriggerClientEvent("fireworks:client:UseFirework", source, item.name, "proj_indep_firework")
end)

CTRPFW.Functions.CreateUseableItem("firework2", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
    TriggerClientEvent("fireworks:client:UseFirework", source, item.name, "proj_indep_firework_v2")
end)

CTRPFW.Functions.CreateUseableItem("firework3", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
    TriggerClientEvent("fireworks:client:UseFirework", source, item.name, "proj_xmas_firework")
end)

CTRPFW.Functions.CreateUseableItem("firework4", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
    TriggerClientEvent("fireworks:client:UseFirework", source, item.name, "scr_indep_fireworks")
end)

CTRPFW.Commands.Add("removevest", "Take your vest off 4head", {}, false, function(source, args)
    local Player = CTRPFW.Functions.GetPlayer(source)
    if Player.PlayerData.job.name == "police" then
        TriggerClientEvent("consumables:client:ResetArmor", source)
    else
        TriggerClientEvent('chatMessage', source, "SYSTEM", "error", "This command is for emergency services!")
    end
end)

CTRPFW.Functions.CreateUseableItem("pillbox-coffee", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", source, item.name)
    end
end)
CTRPFW.Functions.CreateUseableItem("pillbox-sandwich", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)
CTRPFW.Functions.CreateUseableItem("mcd-wrap", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)
CTRPFW.Functions.CreateUseableItem("mcd-burger", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:EatBurger", source, item.name)
    end
end)
CTRPFW.Functions.CreateUseableItem("mcd-fries", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)
CTRPFW.Functions.CreateUseableItem("mcd-desert", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)
CTRPFW.Functions.CreateUseableItem("mcd-meal", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)
CTRPFW.Functions.CreateUseableItem("chicken-burger", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:EatBurger", source, item.name)
    end
end)
CTRPFW.Functions.CreateUseableItem("chicken-meal", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)
CTRPFW.Functions.CreateUseableItem("chicken-fries", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)
CTRPFW.Functions.CreateUseableItem("hotdog", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

CTRPFW.Functions.CreateUseableItem("bahamsspecial", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
    TriggerClientEvent("consumables:client:DrinkAlcohol", source, item.name)
end)

CTRPFW.Functions.CreateUseableItem("champagne", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
    TriggerClientEvent("consumables:client:DrinkAlcohol", source, item.name)
end)

CTRPFW.Functions.CreateUseableItem("tequila", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
    TriggerClientEvent("consumables:client:DrinkAlcohol", source, item.name)
end)


CTRPFW.Functions.CreateUseableItem("vine", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", source, item.name)
    end
end)

CTRPFW.Functions.CreateUseableItem("monster", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:SDrink", source, item.name)
    end
end)

CTRPFW.Functions.CreateUseableItem("redbull", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:SDrink", source, item.name)
    end
end)

CTRPFW.Functions.CreateUseableItem("mcd-wrap-c", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)
CTRPFW.Functions.CreateUseableItem("mcd-burger-c", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:EatBurger", source, item.name)
    end
end)

CTRPFW.Functions.CreateUseableItem("cookies", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)
CTRPFW.Functions.CreateUseableItem("brownies", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

CTRPFW.Functions.CreateUseableItem("tea", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", source, item.name)
    end
end)

CTRPFW.Functions.CreateUseableItem("hi-tea", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:TeaDrink", source, item.name)
    end
end)

CTRPFW.Functions.CreateUseableItem("tompasta", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)
CTRPFW.Functions.CreateUseableItem("cheesepasta", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)
--oxy and weed
CTRPFW.Functions.CreateUseableItem("oxy", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:UseOxy", source, item.name)
    end
end)

CTRPFW.Functions.CreateUseableItem("weed_2og", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
    TriggerClientEvent("consumables:client:MakeJoint", source)
end)

CTRPFW.Functions.CreateUseableItem("meth_pooch", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:MethPooch", source, item.name)
    end
end)

CTRPFW.Functions.CreateUseableItem("acid", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Acideffect", source, item.name)
    end
end)


CTRPFW.Functions.CreateUseableItem("paracetamol", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:paracetamol", source, item.name)
    end
end)

CTRPFW.Functions.CreateUseableItem("aspirine", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:aspirine", source, item.name)
    end
end)

CTRPFW.Functions.CreateUseableItem("disprin", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:disprin", source, item.name)
    end
end)

CTRPFW.Functions.CreateUseableItem("heparin", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:heparin", source, item.name)
    end
end)

CTRPFW.Functions.CreateUseableItem("ibuprofen", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:ibuprofen", source, item.name)
    end
end)

--BABAKADHABA
--STARTER

CTRPFW.Functions.CreateUseableItem("tsoup", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:tsoup", source, item.name)
    end
end)

CTRPFW.Functions.CreateUseableItem("msoup", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:msoup", source, item.name)
    end
end)

CTRPFW.Functions.CreateUseableItem("rggol", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:rggol", source, item.name)
    end
end)

--DESERTS

CTRPFW.Functions.CreateUseableItem("belachi", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:belachi", source, item.name)
    end
end)

CTRPFW.Functions.CreateUseableItem("gulabjamun", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:gulabjamun", source, item.name)
    end
end)

CTRPFW.Functions.CreateUseableItem("paan", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:paan", source, item.name)
    end
end)

CTRPFW.Functions.CreateUseableItem("rosogulla", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:rosogulla", source, item.name)
    end
end)


--main

CTRPFW.Functions.CreateUseableItem("cookedchicken", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:cookedchicken", source, item.name)
    end
end)

CTRPFW.Functions.CreateUseableItem("pannermasala", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:pannermasala", source, item.name)
    end
end)

CTRPFW.Functions.CreateUseableItem("chickenmasala", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:chickenmasala", source, item.name)
    end
end)

CTRPFW.Functions.CreateUseableItem("chickenroll", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:chickenroll", source, item.name)
    end
end)

CTRPFW.Functions.CreateUseableItem("brownbread", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:brownbread", source, item.name)
    end
end)

CTRPFW.Functions.CreateUseableItem("naan", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:naan", source, item.name)
    end
end)

CTRPFW.Functions.CreateUseableItem("invbag", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
    TriggerClientEvent("virus-bag:client:UseBag", source)
end)

CTRPFW.Functions.CreateUseableItem("mushroom", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:mushroomkhao", source, item.name)
    end
end)

CTRPFW.Functions.CreateUseableItem("pmushroom", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:pmushroomkhao", source, item.name)
    end
end)

CTRPFW.Functions.CreateUseableItem("weed_skunk", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
    TriggerClientEvent("consumables:client:MakesJoint", source)
end)

CTRPFW.Functions.CreateUseableItem("sjoint", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:UsesJoint", source)
    end
end)


--latest

CTRPFW.Functions.CreateUseableItem("mcd-nuggets", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

CTRPFW.Functions.CreateUseableItem("mcd-maharaja", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:EatBurger", source, item.name)
    end
end)

CTRPFW.Functions.CreateUseableItem("mcd-chickenpop", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

CTRPFW.Functions.CreateUseableItem("mcd-icetea", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", source, item.name)
    end
end)

CTRPFW.Functions.CreateUseableItem("mcd-strawberry", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", source, item.name)
    end
end)

CTRPFW.Functions.CreateUseableItem("mcd-spicypaneer", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:EatBurger", source, item.name)
    end
end)

CTRPFW.Functions.CreateUseableItem("mcd-egg", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:EatBurger", source, item.name)
    end
end)

CTRPFW.Functions.CreateUseableItem("mcd-mango", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", source, item.name)
    end
end)

CTRPFW.Functions.CreateUseableItem("mcd-caramel", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", source, item.name)
    end
end)

CTRPFW.Functions.CreateUseableItem("mcd-cappuccino", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", source, item.name)
    end
end)

CTRPFW.Functions.CreateUseableItem("mcd-iced", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", source, item.name)
    end
end)

CTRPFW.Functions.CreateUseableItem("mcd-hchocolate", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", source, item.name)
    end
end)

CTRPFW.Functions.CreateUseableItem("combomeal", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:OpenMeal", source, item.name)
    end
end)