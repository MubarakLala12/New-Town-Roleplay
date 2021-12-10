CTRPFW = nil

local data = {}

Citizen.CreateThread(function()
	while CTRPFW == nil do
		TriggerEvent('CTRPFW:GetObject', function(obj) CTRPFW = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('billing:client:sendBillingMail')
AddEventHandler('billing:client:sendBillingMail',function(name,price,reason,citizenid)
    table.insert(data,price)
    table.insert(data,citizenid)
    TriggerServerEvent('ctrp-phone:server:sendNewMail', {
        sender = name,
        subject = "Bill",
        message = "You have been sent a bill for, <br>Amount: <br> $"..price.." for "..reason.."<br><br> Press the button below to accept the bill",
        button = {
            enabled = true,
            buttonEvent = "billing:client:AcceptBill",
            buttonData = data
        }
    })
    data = {}
end)

RegisterNetEvent('billing:client:AcceptBill')
AddEventHandler('billing:client:AcceptBill',function(data)
    CTRPFW.Functions.Notify("You paid the bill for $"..data[1])
    
    TriggerServerEvent('billing:server:PayBill',data)
end)

--MAIL
RegisterNetEvent('billing:client:sendBillingMail1')
AddEventHandler('billing:client:sendBillingMail1',function(name,reason,citizenid)
    table.insert(data,citizenid)
    TriggerServerEvent('ctrp-phone:server:sendNewMail', {
        sender = " "..name.."@ctrp.in",
        subject = "Mail",
        message =  "" ..reason.. " ",
        
    })
    data = {}
end)