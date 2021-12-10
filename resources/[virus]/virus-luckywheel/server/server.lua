CTRPFW = nil
isRoll = false
amount = 50000

TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)

RegisterServerEvent('virus-luckywheel:getLucky')
AddEventHandler('virus-luckywheel:getLucky', function()
    local _source = source
    local xPlayer = CTRPFW.Functions.GetPlayer(_source)
    if not isRoll then
        if xPlayer ~= nil then
            isRoll = true
            
            local _randomPrice = math.random(1, 100)
            if _randomPrice == 1 then
               
                local _subRan = math.random(1,1000)
                if _subRan <= 1 then
                    _priceIndex = 19
                else
                    _priceIndex = 3
                end
            elseif _randomPrice > 1 and _randomPrice <= 6 then
                
                _priceIndex = 12
                local _subRan = math.random(1,20)
                if _subRan <= 2 then
                    _priceIndex = 12
                else
                    _priceIndex = 7
                end
            elseif _randomPrice > 6 and _randomPrice <= 15 then
                
                local _sRan = math.random(1, 4)
                if _sRan == 1 then
                    _priceIndex = 4
                elseif _sRan == 2 then
                    _priceIndex = 8
                elseif _sRan == 3 then
                    _priceIndex = 11
                else
                    _priceIndex = 16
                end
            elseif _randomPrice > 15 and _randomPrice <= 25 then
                
                local _subRan = math.random(1,20)
                if _subRan <= 2 then
                    _priceIndex = 5
                else
                    _priceIndex = 20
                end
            elseif _randomPrice > 25 and _randomPrice <= 60 then
                
                local _sRan = math.random(1, 4)
                if _sRan == 1 then
                    _priceIndex = 1
                elseif _sRan == 2 then
                    _priceIndex = 9
                elseif _sRan == 3 then
                    _priceIndex = 13
                else
                    _priceIndex = 17
                end
            elseif _randomPrice > 60 and _randomPrice <= 70 then
                local _itemList = {}
                _itemList[1] = 2
                _itemList[2] = 6
                _itemList[3] = 10
                _itemList[4] = 14
                _itemList[5] = 18
                _priceIndex = _itemList[math.random(1, 5)]
            elseif _randomPrice > 70 and _randomPrice <= 100 then
                local _itemList = {}
                _itemList[1] = 3
                _itemList[2] = 7
                _itemList[3] = 15
                _itemList[4] = 20
                _priceIndex = _itemList[math.random(1, 4)]
            end
           
            SetTimeout(5000, function()
                isRoll = false
                
                if _priceIndex == 1 or _priceIndex == 9 or _priceIndex == 13 or _priceIndex == 17 then
                    
                    TriggerClientEvent('CTRPFW:Notify', _source, "No win!")
                    
                elseif _priceIndex == 2 or _priceIndex == 6 or _priceIndex == 10 or _priceIndex == 14 or _priceIndex == 18 then
                    local info = {}
                    info = {
                        label = "Gaand marao"
                    }
                    xPlayer.Functions.AddItem("stickynote", 1, false, info)
                    TriggerClientEvent('inventory:client:ItemBox', _source, CTRPFW.Shared.Items["stickynote"], "add")

                    TriggerClientEvent('CTRPFW:Notify', _source, "You won StickyNote")
                    
                elseif _priceIndex == 3 or _priceIndex == 7 or _priceIndex == 15 or _priceIndex == 20 then
                    -- print("Win money")
                    local _money = 0
                    if _priceIndex == 3 then
                        _money = 1000
                    elseif _priceIndex == 7 then
                        _money = 2000
                    elseif _priceIndex == 15 then
                        _money = 3000
                    elseif _priceIndex == 20 then
                        _money = 4000
                    end
                    xPlayer.Functions.AddMoney("cash", _money)
                    TriggerClientEvent('CTRPFW:Notify', _source, "You won Cash")
                elseif _priceIndex == 4 or _priceIndex == 8 or _priceIndex == 11 or _priceIndex == 16 then
                   
                    xPlayer.Functions.AddItem("casinochips", math.random(400 , 1200))
                    TriggerClientEvent('inventory:client:ItemBox', _source, CTRPFW.Shared.Items["casinochips"], "add")
                    TriggerClientEvent('CTRPFW:Notify', _source, "You won casinochips")
                    
                elseif _priceIndex == 5 then
                   
                    xPlayer.Functions.AddItem("diamond_ring", 1)
                    TriggerClientEvent('inventory:client:ItemBox', _source, CTRPFW.Shared.Items["diamond_ring"], "add")
                    TriggerClientEvent('CTRPFW:Notify', _source, "You won diamond_ring")
                elseif _priceIndex == 12 then
                   
                    xPlayer.Functions.AddItem("goldbar", 1)
                    TriggerClientEvent('inventory:client:ItemBox', _source, CTRPFW.Shared.Items["goldbar"], "add")
                    TriggerClientEvent('CTRPFW:Notify', _source, "You won goldbar")
                   
                end
                TriggerClientEvent("virus-luckywheel:rollFinished", -1)
            end)
            TriggerClientEvent("virus-luckywheel:doRoll", -1, _priceIndex)  
                
            
        end
    end
end)

CTRPFW.Functions.CreateCallback('ctrp-casino:server:virusVerify', function(source, cb)
    local src = source
    local Ply = CTRPFW.Functions.GetPlayer(src)
    local casinomembership = Ply.Functions.GetItemByName("casinomembership")
	local wheelcoin = Ply.Functions.GetItemByName("wheelcoin")

    if casinomembership ~= nil and wheelcoin ~= nil then
        cb(true)
    else
        cb(false)
    end
end)
