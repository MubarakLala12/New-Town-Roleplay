CTRPFW = nil
TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)

CTRPFW.Commands.Add("am", "Toggle animation menu", {}, false, function(source, args)
	TriggerClientEvent('animations:client:ToggleMenu', source)
end)

CTRPFW.Commands.Add("a", "Do an animation, for the animation list do /em", {{name = "name", help = "Emote name"}}, true, function(source, args)
	TriggerClientEvent('animations:client:EmoteCommandStart', source, args)
end)

CTRPFW.Functions.CreateUseableItem("walkstick", function(source, item)
    local Player = CTRPFW.Functions.GetPlayer(source)
    TriggerClientEvent("animations:UseWandelStok", source)
end)
