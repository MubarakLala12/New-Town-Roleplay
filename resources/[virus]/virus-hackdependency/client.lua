RegisterNetEvent("virus-hack:playSound")
AddEventHandler("virus-hack:playSound", function(name)
    local t = {transactionType = name}

    SendNuiMessage(json.encode(t))
end)