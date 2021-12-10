local ClosestVehicle = 1
local inMenu = false
local modelLoaded = true
local com = 0
local fakecar = {model = '', car = nil}

local sellX = -1254.8665  --R1
local sellY = -360.3537
local sellZ = 36.9075
local data = {}

RegisterNetEvent('setcom')
AddEventHandler('setcom', function(comm)
    com = comm
end)
vehshop = {
	opened = false,
	title = "Vehicle Shop",
	currentmenu = "main",
	lastmenu = nil,
	currentpos = nil,
	selectedbutton = 0,
	marker = { r = 0, g = 155, b = 255, a = 250, type = 1 },
	menu = {
		x = 0.80,
		y = 0.20,
		width = 0.0,
		height = 0.13,
		buttons = 10,
		from = 1,
		to = 10,
		scale = 0.95,
		font = 0,
		["main"] = {
			title = "CATEGORIES",
			name = "main",
			buttons = {
				{name = "Vehicles", description = ""},
			}
		},
		["vehicles"] = {
			title = "VEHICLES",
			name = "vehicles",
			buttons = {}
		},
	}
}

Citizen.CreateThread(function()
    Citizen.Wait(1500)

    for k, v in pairs(vehicleCategorys) do
        table.insert(vehshop.menu["vehicles"].buttons, {
            menu = k,
            name = v.label,
            description = {}
        })

        vehshop.menu[k] = {
            title = k,
            name = v.label,
            buttons = v.vehicles
        }
    end
end)

function isValidMenu(menu)
    local retval = false
    for k, v in pairs(vehshop.menu["vehicles"].buttons) do
        if menu == v.menu then
            retval = true
        end
    end
    return retval
end

function drawMenuButton(button,x,y,selected)
	local menu = vehshop.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(0.95, 0.95)
	if selected then
		SetTextColour(0, 0, 0, 255)
	else
		SetTextColour(255, 255, 255, 255)
	end
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(button.name)
	if selected then
		DrawRect(x,y,menu.width,menu.height,255,255,255,255)
	else
		DrawRect(x,y,menu.width,menu.height,0, 0, 0,220)
	end
	DrawText(x - menu.width/2 + 0.105, y - menu.height/2 + 0.0028)
end

function drawMenuInfo(text)
	local menu = vehshop.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(0.95, 0.95)
	SetTextColour(255, 255, 255, 255)
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawRect(0.675, 0.95,0.65,0.050,0,0,0,250)
	DrawText(0.255, 0.254)
end

function drawMenuRight(txt,x,y,selected)
	local menu = vehshop.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(0.95, 0.95)
	--SetTextRightJustify(1)
	if selected then
		SetTextColour(0,0,0, 255)
	else
		SetTextColour(255, 255, 255, 255)

	end
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(txt)
	DrawText(x + menu.width/2 + 0.025, y - menu.height/3 + 0.0002)

	if selected then
		DrawRect(x + menu.width/2 + 0.025, y,menu.width / 3,menu.height,255, 255, 255,250)
	else
		DrawRect(x + menu.width/2 + 0.025, y,menu.width / 3,menu.height,0, 0, 0,250)
	end
end

function drawMenuTitle(txt,x,y)
	local menu = vehshop.menu
	SetTextFont(2)
	SetTextProportional(0)
	SetTextScale(0.95, 0.95)

	SetTextColour(255, 255, 255, 255)
	SetTextEntry("STRING")
	AddTextComponentString(txt)
	DrawRect(x,y,menu.width,menu.height,0,0,0,250)
	DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)
end

function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

function ButtonSelected(button)
	local ped = PlayerPedId()
	local this = vehshop.currentmenu
    local btn = button.name

	if this == "main" then
		if btn == "Vehicles" then
			OpenMenu('vehicles')
		end
	elseif this == "vehicles" then
		if btn == "Sports" then
			OpenMenu('sports')
		elseif btn == "Sedans" then
			OpenMenu('sedans')
		elseif btn == "Compacts" then
			OpenMenu('compacts')
		elseif btn == "Coupes" then
			OpenMenu('coupes')
		elseif btn == "Sports Classics" then
			OpenMenu("sportsclassics")
		elseif btn == "Super" then
			OpenMenu('super')
		elseif btn == "Muscle" then
			OpenMenu('muscle')
		elseif btn == "Offroad" then
			OpenMenu('offroad')
		elseif btn == "SUVs" then
			OpenMenu('suvs')
		elseif btn == "Bikes" then
            OpenMenu('motorcycles')
		elseif btn == "Vans" then
			OpenMenu('vans')
		end
	end
end

function OpenMenu(menu)
    vehshop.lastmenu = vehshop.currentmenu
    fakecar = {model = '', car = nil}
	if menu == "vehicles" then
		vehshop.lastmenu = "main"
	end
	vehshop.menu.from = 1
	vehshop.menu.to = 10
	vehshop.selectedbutton = 0
	vehshop.currentmenu = menu
end

function Back()
	if backlock then
		return
	end
	backlock = true
	if vehshop.currentmenu == "main" then
		CloseCreator()
	elseif isValidMenu(vehshop.currentmenu) then
		if DoesEntityExist(fakecar.car) then
			Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(fakecar.car))
		end
		fakecar = {model = '', car = nil}
		OpenMenu(vehshop.lastmenu)
	else
		OpenMenu(vehshop.lastmenu)
	end
end

function CloseCreator(name, veh, price, financed)
	Citizen.CreateThread(function()
		local ped = PlayerPedId()
		vehshop.opened = false
		vehshop.menu.from = 1
        vehshop.menu.to = 10
        CTRP.ShowroomVehicles[ClosestVehicle].inUse = false
        TriggerServerEvent('ctrp-vehicleshop:server:setShowroomCarInUse', ClosestVehicle, false)
        SendNUIMessage({
            command = "open"

        })
	end)
end

function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

function MenuVehicleList()
    ped = PlayerPedId();
    MenuTitle = "Dealer"
    ClearMenu()
    Menu.addButton("View range", "VehicleCategories", nil)
    Menu.addButton("Close Menu", "close", nil)
end

function VehicleCategories()
    ped = PlayerPedId();
    MenuTitle = "Veh Cats"
    ClearMenu()
    for k, v in pairs(CTRP.VehicleMenuCategories) do
        Menu.addButton(CTRP.VehicleMenuCategories[k].label, "GetCatVehicles", k)
    end

    Menu.addButton("Close Menu", "close", nil)
end

function GetCatVehicles(catergory)
    ped = PlayerPedId()
    MenuTitle = "Cat Vehs"
    ClearMenu()
    Menu.addButton("Close Menu", "close", nil)
    for k, v in pairs(shopVehicles[catergory]) do
        Menu.addButton(shopVehicles[catergory][k].name, "SelectVehicle", v, catergory, "$"..shopVehicles[catergory][k]["price"])
    end
end

function SelectVehicle(vehicleData)
    TriggerServerEvent('ctrp-vehicleshop:server:setShowroomVehicle', vehicleData, ClosestVehicle)
    close()
end

Citizen.CreateThread(function()
    Citizen.Wait(1000)
    for i = 1, #CTRP.ShowroomVehicles, 1 do
        local oldVehicle = GetClosestVehicle(CTRP.ShowroomVehicles[i].coords.x, CTRP.ShowroomVehicles[i].coords.y, CTRP.ShowroomVehicles[i].coords.z, 3.0, 0, 70)
        if oldVehicle ~= 0 then
            CTRPFW.Functions.DeleteVehicle(oldVehicle)
        end

		local model = GetHashKey(CTRP.ShowroomVehicles[i].chosenVehicle)
		RequestModel(model)
		while not HasModelLoaded(model) do
			Citizen.Wait(0)
		end

		local veh = CreateVehicle(model, CTRP.ShowroomVehicles[i].coords.x, CTRP.ShowroomVehicles[i].coords.y, CTRP.ShowroomVehicles[i].coords.z, false, false)
		SetModelAsNoLongerNeeded(model)
		SetVehicleOnGroundProperly(veh)
		SetEntityInvincible(veh,true)
        SetEntityHeading(veh, CTRP.ShowroomVehicles[i].coords.h)
        SetVehicleDoorsLocked(veh, 3)
        SetVehicleDirtLevel(veh)
        SetVehicleUndriveable(veh, false)
        WashDecalsFromVehicle(veh, 1.0)

		FreezeEntityPosition(veh,true)
		SetVehicleNumberPlateText(veh, i .. "CARSALE")
    end
end)

function OpenCreator()
	vehshop.currentmenu = "main"
	vehshop.opened = true
    vehshop.selectedbutton = 0
    TriggerServerEvent('ctrp-vehicleshop:server:setShowroomCarInUse', ClosestVehicle, false)
end

function setClosestShowroomVehicle()
    local pos = GetEntityCoords(PlayerPedId(), true)
    local current = nil
    local dist = nil

    for id, veh in pairs(CTRP.ShowroomVehicles) do
        if current ~= nil then
            if(GetDistanceBetweenCoords(pos, CTRP.ShowroomVehicles[id].coords.x, CTRP.ShowroomVehicles[id].coords.y, CTRP.ShowroomVehicles[id].coords.z, true) < dist)then
                current = id
                dist = GetDistanceBetweenCoords(pos, CTRP.ShowroomVehicles[id].coords.x, CTRP.ShowroomVehicles[id].coords.y, CTRP.ShowroomVehicles[id].coords.z, true)
            end
        else
            dist = GetDistanceBetweenCoords(pos, CTRP.ShowroomVehicles[id].coords.x, CTRP.ShowroomVehicles[id].coords.y, CTRP.ShowroomVehicles[id].coords.z, true)
            current = id
        end
    end
    if current ~= ClosestVehicle then
        ClosestVehicle = current
    end
end

Citizen.CreateThread(function()
    while true do
        local pos = GetEntityCoords(PlayerPedId(), true)
        local shopDist = GetDistanceBetweenCoords(pos, CTRP.VehicleShops[1].x, CTRP.VehicleShops[1].y, CTRP.VehicleShops[1].z, false)
        sleep = 2500
        if isLoggedIn then
            if shopDist <= 50 then
                sleep = 1000
                setClosestShowroomVehicle()
            end
        end
        Citizen.Wait(sleep)
    end
end)

local SellStarted = false



-- Citizen.CreateThread(function()
--     Wait(1000)
--     while true do
--         local ped = PlayerPedId()
--         local pos = GetEntityCoords(ped)
--         local inRange = false
--         local SellDistance = GetDistanceBetweenCoords(pos, CTRP.QuickSell.x, CTRP.QuickSell.y, CTRP.QuickSell.z, true)

--         if SellDistance < 20 then
--             if IsPedInAnyVehicle(ped) then
--                 local VehicleData = CTRPFW.Shared.VehicleModels[GetEntityModel(GetVehiclePedIsIn(ped))]
--                 if VehicleData["shop"] == "pdm" then
--                     DrawMarker(2, CTRP.QuickSell.x, CTRP.QuickSell.y, CTRP.QuickSell.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 255, 55, 155, 255, 0, 0, 0, 1, 0, 0, 0)
--                     inRange = true
--                     if SellDistance < 1 then
--                         if not SellStarted then
--                             DrawText3Ds(CTRP.QuickSell.x, CTRP.QuickSell.y, CTRP.QuickSell.z, '~b~E~w~ - Sell ​​vehicle for ~g~$'..math.ceil(VehicleData["price"] / 100 * 60))
--                             if IsControlJustPressed(0, Keys["E"]) then
--                                 SellStarted = true
--                             end
--                         else
--                             DrawText3Ds(CTRP.QuickSell.x, CTRP.QuickSell.y, CTRP.QuickSell.z, '~b~7~w~ - Confirm / ~b~8~w~ - Cancel')
--                             if IsControlJustPressed(0, Keys["7"]) or IsDisabledControlJustPressed(0, Keys["7"]) then
--                                 SellStarted = false
--                                 CTRPFW.Functions.TriggerCallback('ctrp-vehicleshop:server:SellVehicle', function(SoldVehicle)
--                                     if SoldVehicle then
--                                         TriggerEvent("ctrp-phone-new:client:BankNotify", "$"..math.ceil(VehicleData["price"] / 100 * 60).." credited")
--                                         local veh = GetVehiclePedIsIn(ped)
--                                         CTRPFW.Functions.DeleteVehicle(veh)
--                                     else
--                                         CTRPFW.Functions.Notify('This is not your vehicle..', 'error')
--                                     end
--                                 end, GetEntityModel(GetVehiclePedIsIn(ped)), GetVehicleNumberPlateText(GetVehiclePedIsIn(ped)))
--                             end

--                             if IsControlJustPressed(0, Keys["8"]) or IsDisabledControlJustPressed(0, Keys["8"]) then
--                                 SellStarted = false
--                             end
--                         end
--                     else
--                         if SellStarted then
--                             SellStarted = false
--                         end
--                     end
--                 end
--             end
--         end

--         if not inRange then
--             Citizen.Wait(1000)
--         end

--         Citizen.Wait(3)
--     end
-- end)

RegisterNetEvent('setcom')
AddEventHandler('setcom', function(com2)
    com = com2
end)

RegisterNetEvent('virus-vehicleshop:mail')
AddEventHandler('virus-vehicleshop:mail', function(vehPlate , vehModel , financePayment)


    TriggerServerEvent('ctrp-phone:server:sendNewMail', {
        sender = "Vehicle Finance",
        subject = "Report",
        message = "Hi sir/mam , <br><br> Your Vehicle Plate : <strong>"..vehPlate.. " | Name : " ..vehModel.. "</strong> finance not settled yet! <br>Your Finance amount <strong> $ "..financePayment.. "</strong> is left to be paid . Kindly pay by <strong>/payfinance</strong> else we will seize your vehicle <br><br> PDM FINANCE TEAM",
        button = {}
    })
end)

RegisterNetEvent('virus-vehicleshop:paidmail')
AddEventHandler('virus-vehicleshop:paidmail', function(vehPlate , vehModel , financePayment)


    TriggerServerEvent('ctrp-phone:server:sendNewMail', {
        sender = "Vehicle Finance",
        subject = "Receipt",
        message = "Hi sir/mam , <br><br> Your Vehicle Plate : <strong>"..vehPlate.. " | Name : " ..vehModel.. "</strong> whose Finance amount was <strong> $ "..financePayment.. "</strong> is paid! . To check next Finance details , check on Vehicle app. To Pay full do <strong>/payfullfinance</strong>. <br><br> PDM FINANCE TEAM",
        button = {}
    })
end)


Citizen.CreateThread(function()
    Citizen.Wait(1000)
    while true do

        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        local dist = GetDistanceBetweenCoords(pos, CTRP.ShowroomVehicles[ClosestVehicle].coords.x, CTRP.ShowroomVehicles[ClosestVehicle].coords.y, CTRP.ShowroomVehicles[ClosestVehicle].coords.z)
        sleep = 1000
        if ClosestVehicle ~= nil then
            if dist < 2.2 then
                sleep = 7
                if not CTRP.ShowroomVehicles[ClosestVehicle].inUse then
                    local vehicleHash = GetHashKey(CTRP.ShowroomVehicles[ClosestVehicle].chosenVehicle)
                    local displayName = CTRPFW.Shared.Vehicles[CTRP.ShowroomVehicles[ClosestVehicle].chosenVehicle]["name"]
                    local vehPrice = CTRPFW.Shared.Vehicles[CTRP.ShowroomVehicles[ClosestVehicle].chosenVehicle]["price"]
                    local financePrice = CTRPFW.Shared.Vehicles[CTRP.ShowroomVehicles[ClosestVehicle].chosenVehicle]["price"] / 5
                    local vehcommission = string.format(
                     vehPrice * com /100 )
             

                    if not CTRP.ShowroomVehicles[ClosestVehicle].inUse then
                        if not vehshop.opened then
                            if PlayerJob.name == "pdm" then
                               -- DrawText3Ds(CTRP.ShowroomVehicles[ClosestVehicle].coords.x, CTRP.ShowroomVehicles[ClosestVehicle].coords.y, CTRP.ShowroomVehicles[ClosestVehicle].coords.z + 1.8, '~g~G~w~ - Change vehicle (~g~'..displayName..'~w~)')
                                --DrawText3Ds(CTRP.ShowroomVehicles[ClosestVehicle].coords.x, CTRP.ShowroomVehicles[ClosestVehicle].coords.y, CTRP.ShowroomVehicles[ClosestVehicle].coords.z + 1.49, '~w~ Commission - ~g~'..com..'% (~g~$'..vehcommission..'~w~)')

                                SendNUIMessage({
                                    command = "openpdm",
                                    textbutton = displayName,
                                    com = com,
                                    vehcommission = vehcommission,
                                    vehPrice = vehPrice,
                                    financePrice = financePrice,

                                })

                            else
                                --DrawText3Ds(CTRP.ShowroomVehicles[ClosestVehicle].coords.x, CTRP.ShowroomVehicles[ClosestVehicle].coords.y, CTRP.ShowroomVehicles[ClosestVehicle].coords.z + 1.8, 'Vehicle Name - ~g~'..displayName..'~w~')

                                SendNUIMessage({
                                    command = "open",
                                    textbutton = displayName,
                                    com = com,
                                    vehcommission = vehcommission,
                                    vehPrice = vehPrice,
                                    financePrice = financePrice

                                })

                               -- DrawText3Ds(CTRP.ShowroomVehicles[ClosestVehicle].coords.x, CTRP.ShowroomVehicles[ClosestVehicle].coords.y, CTRP.ShowroomVehicles[ClosestVehicle].coords.z + 1.49, '~w~ Commission - ~g~'..com..'% (~g~$'..vehcommission..'~w~)')
                            end
                            if not buySure then
                                --DrawText3Ds(CTRP.ShowroomVehicles[ClosestVehicle].coords.x, CTRP.ShowroomVehicles[ClosestVehicle].coords.y, CTRP.ShowroomVehicles[ClosestVehicle].coords.z + 1.70, '~g~E~w~ - Buy vehicle (~g~$'..vehPrice..'~w~)')
                            elseif buySure then
                                SendNUIMessage({
                                    command = "openbuy",
                                })
                               -- DrawText3Ds(CTRP.ShowroomVehicles[ClosestVehicle].coords.x, CTRP.ShowroomVehicles[ClosestVehicle].coords.y, CTRP.ShowroomVehicles[ClosestVehicle].coords.z + 1.65, 'Are you sure? | ~g~[7]~w~ Yes -/- ~r~[8]~w~ No')
                            end

                            if not financeSure then
                                --DrawText3Ds(CTRP.ShowroomVehicles[ClosestVehicle].coords.x, CTRP.ShowroomVehicles[ClosestVehicle].coords.y, CTRP.ShowroomVehicles[ClosestVehicle].coords.z + 1.59, '~g~H~w~ - Finance vehicle (~g~$'..financePrice..'~w~)')
                            elseif financeSure then
                                SendNUIMessage({
                                    command = "openfinance",
                                })

                               -- DrawText3Ds(CTRP.ShowroomVehicles[ClosestVehicle].coords.x, CTRP.ShowroomVehicles[ClosestVehicle].coords.y, CTRP.ShowroomVehicles[ClosestVehicle].coords.z + 1.59, 'Are you sure? | ~g~[5]~w~ Yes -/- ~r~[6]~w~ No')
                            end

                        elseif vehshop.opened then
                            sleep = 7
                            if modelLoaded then
                                DrawText3Ds(CTRP.ShowroomVehicles[ClosestVehicle].coords.x, CTRP.ShowroomVehicles[ClosestVehicle].coords.y, CTRP.ShowroomVehicles[ClosestVehicle].coords.z + 1.65, 'Choosing vehicle')
                            else
                                DrawText3Ds(CTRP.ShowroomVehicles[ClosestVehicle].coords.x, CTRP.ShowroomVehicles[ClosestVehicle].coords.y, CTRP.ShowroomVehicles[ClosestVehicle].coords.z + 1.65, 'Vehicle is being picked up..')
                            end
                            
                        end
                        
                    else
                        sleep = 7
                        DrawText3Ds(CTRP.ShowroomVehicles[ClosestVehicle].coords.x, CTRP.ShowroomVehicles[ClosestVehicle].coords.y, CTRP.ShowroomVehicles[ClosestVehicle].coords.z + 1.65, 'Vehicle is in use by a customer...')
                    end
                    if not vehshop.opened then
                        if PlayerJob.name == "pdm" then
                            --DrawText3Ds(CTRP.ShowroomVehicles[ClosestVehicle].coords.x, CTRP.ShowroomVehicles[ClosestVehicle].coords.y, CTRP.ShowroomVehicles[ClosestVehicle].coords.z + 1.9, '~b~/givetest~w~ - Give Test Drive')
                        end
                    end    
                  
                    if not vehshop.opened then
                        if PlayerJob ~= nil then
                            if PlayerJob.name == "pdm" then
                                sleep = 7
                                if IsControlJustPressed(0, Keys["G"]) then
                                    if vehshop.opened then
                                        CloseCreator()
                                    else
                                        SendNUIMessage({
                                            command = "openoption"

                                        })
                                        OpenCreator()
                                    end
                                end
                            end
                        end
                    end

                    if vehshop.opened then  
                        local ped = PlayerPedId()
                        local menu = vehshop.menu[vehshop.currentmenu]
                        local y = vehshop.menu.y + 0.12
                        buttoncount = tablelength(menu.buttons)
                        local selected = false

                        for i,button in pairs(menu.buttons) do
                            if i >= vehshop.menu.from and i <= vehshop.menu.to then

                                if i == vehshop.selectedbutton then
                                    selected = true
                                else
                                    selected = false
                                end
                                 drawMenuButton(button,vehshop.menu.x,y,selected)
                                if button.price ~= nil then

                                    drawMenuRight("$"..button.price,vehshop.menu.x,y,selected)

                                end
                                y = y + 0.04
                                if isValidMenu(vehshop.currentmenu) then
                                    if selected then
                                        sleep = 7
                                        if IsControlJustPressed(1, 18) then
                                            if modelLoaded then
                                                TriggerServerEvent('ctrp-vehicleshop:server:setShowroomVehicle', button.model, ClosestVehicle)
                                            end
                                        end
                                    end
                                end
                                if selected and ( IsControlJustPressed(1,38) or IsControlJustPressed(1, 18) ) then
                                    ButtonSelected(button)
                                end
                            end
                        end
                    end

                    if vehshop.opened then
                        sleep = 7
                        if IsControlJustPressed(1,202) then
                            Back()
                        end
                        if IsControlJustReleased(1,202) then
                            backlock = false
                        end
                        if IsControlJustPressed(1,188) then
                            if modelLoaded then
                                if vehshop.selectedbutton > 1 then
                                    vehshop.selectedbutton = vehshop.selectedbutton -1
                                    if buttoncount > 10 and vehshop.selectedbutton < vehshop.menu.from then
                                        vehshop.menu.from = vehshop.menu.from -1
                                        vehshop.menu.to = vehshop.menu.to - 1
                                    end
                                end
                            end
                        end
                        if IsControlJustPressed(1,187)then
                            if modelLoaded then
                                if vehshop.selectedbutton < buttoncount then
                                    vehshop.selectedbutton = vehshop.selectedbutton +1
                                    if buttoncount > 10 and vehshop.selectedbutton > vehshop.menu.to then
                                        vehshop.menu.to = vehshop.menu.to + 1
                                        vehshop.menu.from = vehshop.menu.from + 1
                                    end
                                end
                            end
                        end
                    end
           
            

                    if GetVehiclePedIsTryingToEnter(PlayerPedId()) ~= nil and GetVehiclePedIsTryingToEnter(PlayerPedId()) ~= 0 then
                        ClearPedTasksImmediately(PlayerPedId())
                    end

                    if IsControlJustPressed(0, Keys["E"]) then
                        CTRPFW.Functions.TriggerCallback('CTRPFW:HasItem', function(result)
                            if result then
                                if not vehshop.opened then
                                    if not buySure then
                                        buySure = true
                                    end
                                end
                            else
                                CTRPFW.Functions.Notify("You don't have Vehicle purchase card..", "error")
                            end
                        end, "buycard")
                    end

                    if IsControlJustPressed(0, Keys["H"]) then
                        CTRPFW.Functions.TriggerCallback('CTRPFW:HasItem', function(result)
                            if result then
                                if not vehshop.opened then
                                    if not financeSure then
                                        TriggerServerEvent("ctrp-vehicleshop:checkalready")
                                    end
                                end
                            else
                                CTRPFW.Functions.Notify("You don't have finance papers..", "error")
                            end
                        end, "financepaper")
                    end

                    if IsDisabledControlJustPressed(0, Keys["7"]) then
                        if buySure then
                            local class = CTRPFW.Shared.Vehicles[CTRP.ShowroomVehicles[ClosestVehicle].chosenVehicle]["category"]
                            TriggerServerEvent('ctrp-vehicleshop:server:buyShowroomVehicle', CTRP.ShowroomVehicles[ClosestVehicle].chosenVehicle, class)
                            buySure = false

                            SendNUIMessage({
                                command = "closesub",
                            })
                        end
                    end
                    if IsDisabledControlJustPressed(0, Keys["8"]) then
                        CTRPFW.Functions.Notify('You did not buy the vehicle', 'error', 3500)
                        buySure = false

                        SendNUIMessage({
                            command = "closesub",
                        })
                    end

                    if IsDisabledControlJustPressed(0, Keys["5"]) then
                        if financeSure then
                            local class = CTRPFW.Shared.Vehicles[CTRP.ShowroomVehicles[ClosestVehicle].chosenVehicle]["category"]
                            TriggerServerEvent('ctrp-vehicleshop:server:financeShowroomVehicle', CTRP.ShowroomVehicles[ClosestVehicle].chosenVehicle, class)
                            financeSure = false
                            SendNUIMessage({
                                command = "closesub",
                            })
                        end
                    end
                    if IsDisabledControlJustPressed(0, Keys["6"]) then
                        CTRPFW.Functions.Notify('You did not buy the vehicle on Finance', 'error', 3500)
                        financeSure = false
                        SendNUIMessage({
                            command = "closesub",
                        })
                    end

                    DisableControlAction(0, Keys["5"], true)
                    DisableControlAction(0, Keys["6"], true)
                    DisableControlAction(0, Keys["7"], true)
                    DisableControlAction(0, Keys["8"], true)
                elseif CTRP.ShowroomVehicles[ClosestVehicle].inUse then
                    sleep = 7
                    DrawText3Ds(CTRP.ShowroomVehicles[ClosestVehicle].coords.x, CTRP.ShowroomVehicles[ClosestVehicle].coords.y, CTRP.ShowroomVehicles[ClosestVehicle].coords.z + 0.5, 'Vehicle is in use')
                end
            elseif dist > 1.5 then
                if vehshop.opened then
                    CloseCreator()
                    SendNUIMessage({
                        command = "close",
                    })
                end
                SendNUIMessage({
                    command = "close",
                })
            end
        
        end
        

        Citizen.Wait(sleep)
    end
end)

RegisterNetEvent('ctrp-vehicleshop:client:cf')
AddEventHandler('ctrp-vehicleshop:client:cf', function()
    financeSure = true
end)



RegisterNetEvent('ctrp-vehicleshop:client:DoTestrit2')
AddEventHandler('ctrp-vehicleshop:client:DoTestrit2', function(plate)
    local pos = GetEntityCoords(PlayerPedId())
    local distance = Vdist(pos.x, pos.y, pos.z, sellX , sellY , sellZ)
    if distance < 50 then
        if ClosestVehicle ~= 0 then
        
            CTRPFW.Functions.SpawnVehicle(CTRP.ShowroomVehicles[ClosestVehicle].chosenVehicle, function(veh)
                TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
                exports['LegacyFuel']:SetFuel(veh, 100)
                SetVehicleNumberPlateText(veh, plate)
                SetEntityAsMissionEntity(veh, true, true)
                SetEntityHeading(veh, CTRP.VehicleBuyLocations.h)
                SetVehicleDirtLevel(veh)
                SetVehicleUndriveable(veh, false)
                WashDecalsFromVehicle(veh, 1.0)
                TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                TriggerServerEvent("vehicletuning:server:SaveVehicleProps", CTRPFW.Functions.GetVehicleProperties(veh))
                testritveh = veh

                if CTRP.ShowroomVehicles[ClosestVehicle].chosenVehicle == "urus" then
                    SetVehicleExtra(veh, 1, false)
                    SetVehicleExtra(veh, 2, true)
                end
            end, CTRP.VehicleBuyLocations, false)
        
        end
    else
        CTRPFW.Functions.Notify("You're not in PDM / Near PDM Vehicle" , "error")
    end
end)


RegisterNetEvent('ctrp-vehicleshop:client:setShowroomCarInUse')
AddEventHandler('ctrp-vehicleshop:client:setShowroomCarInUse', function(showroomVehicle, inUse)
    CTRP.ShowroomVehicles[showroomVehicle].inUse = inUse
end)

RegisterNetEvent('ctrp-vehicleshop:client:setShowroomVehicle')
AddEventHandler('ctrp-vehicleshop:client:setShowroomVehicle', function(showroomVehicle, k)
    if CTRP.ShowroomVehicles[k].chosenVehicle ~= showroomVehicle then
        CTRPFW.Functions.DeleteVehicle(GetClosestVehicle(CTRP.ShowroomVehicles[k].coords.x, CTRP.ShowroomVehicles[k].coords.y, CTRP.ShowroomVehicles[k].coords.z, 3.0, 0, 70))
        modelLoaded = false
        Wait(250)
        local model = GetHashKey(showroomVehicle)
        RequestModel(model)
        while not HasModelLoaded(model) do
            Citizen.Wait(250)
        end
        local veh = CreateVehicle(model, CTRP.ShowroomVehicles[k].coords.x, CTRP.ShowroomVehicles[k].coords.y, CTRP.ShowroomVehicles[k].coords.z, false, false)
        SetModelAsNoLongerNeeded(model)
        SetVehicleOnGroundProperly(veh)
        SetEntityInvincible(veh,true)
        SetEntityHeading(veh, CTRP.ShowroomVehicles[k].coords.h)
        SetVehicleDoorsLocked(veh, 3)
        FreezeEntityPosition(veh, true)
        SetVehicleDirtLevel(veh)
        SetVehicleUndriveable(veh, false)
        WashDecalsFromVehicle(veh, 1.0)
        SetVehicleNumberPlateText(veh, k .. "CARSALE")
        modelLoaded = true
        CTRP.ShowroomVehicles[k].chosenVehicle = showroomVehicle
    end
end)

RegisterNetEvent('ctrp-vehicleshop:client:buyShowroomVehicle')
AddEventHandler('ctrp-vehicleshop:client:buyShowroomVehicle', function(vehicle, plate)
    CTRPFW.Functions.SpawnVehicle(vehicle, function(veh)
        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
        exports['LegacyFuel']:SetFuel(veh, 100)
        SetVehicleNumberPlateText(veh, plate)
        SetEntityHeading(veh, CTRP.DefaultBuySpawn.h)
        SetEntityAsMissionEntity(veh, true, true)
        SetVehicleDirtLevel(veh)
        SetVehicleUndriveable(veh, false)
        WashDecalsFromVehicle(veh, 1.0)
        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
        TriggerServerEvent("vehicletuning:server:SaveVehicleProps", CTRPFW.Functions.GetVehicleProperties(veh))
        SetEntityAsMissionEntity(veh, true, true)
    end, CTRP.DefaultBuySpawn, false)
end)

RegisterNetEvent('ctrp-vehicleshop:client:GiveTest')
AddEventHandler('ctrp-vehicleshop:client:GiveTest', function(plate)
    CTRPFW.Functions.SpawnVehicle(vehicle, function(veh)
        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
        exports['LegacyFuel']:SetFuel(veh, 100)
        SetVehicleNumberPlateText(veh, "TESTCAR ")
        SetEntityHeading(veh, CTRP.DefaultBuySpawn.h)
        SetEntityAsMissionEntity(veh, true, true)
        SetVehicleDirtLevel(veh)
        SetVehicleUndriveable(veh, false)
        WashDecalsFromVehicle(veh, 1.0)
        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
        TriggerServerEvent("vehicletuning:server:SaveVehicleProps", CTRPFW.Functions.GetVehicleProperties(veh))
        SetEntityAsMissionEntity(veh, true, true)
    end, CTRP.DefaultBuySpawn, false)
end)



RegisterNetEvent('ctrp-vehicleshop:client:payfinance')
AddEventHandler('ctrp-vehicleshop:client:payfinance', function()
    TriggerServerEvent('ctrp-vehicleshop:PayFinance')
end)

RegisterNetEvent('ctrp-vehicleshop:client:cfinance')
AddEventHandler('ctrp-vehicleshop:client:cfinance', function()
    TriggerServerEvent('ctrp-vehicleshop:CheckcmdFinanceStatus')
end)

RegisterNetEvent('ctrp-vehicleshop:client:payfullfinance')
AddEventHandler('ctrp-vehicleshop:client:payfullfinance', function()
    TriggerServerEvent('ctrp-vehicleshop:PayFullFinance')
end)



RegisterNetEvent('ctrp-vehicleshop:client:sendFullFinance')
AddEventHandler('ctrp-vehicleshop:client:sendFullFinance',function(vehPlate , vehModel , financeAmount)
    table.insert(data,financeAmount)
    --table.insert(data,citizenid)
    TriggerServerEvent('ctrp-phone:server:sendNewMail', {
        sender = "Vehicle Finance",
        subject = "Bill",
        message = "Hi sir/mam , <br><br> Your Vehicle Plate : <strong>"..vehPlate.. " | Name : " ..vehModel.. "</strong> full finance payment request received! <br>Your Full Finance amount <strong> $ "..financeAmount.. "</strong> . If you want to pay then click on tick button below . <br><strong>Note:</strong> This function is irreversible! <br><br> PDM FINANCE TEAM",
        button = {
            enabled = true,
            buttonEvent = "ctrp-vehicleshop:client:payFullFinance",
            buttonData = data
        }
    })
    data = {}
end)

RegisterNetEvent('ctrp-vehicleshop:client:payFullFinance')
AddEventHandler('ctrp-vehicleshop:client:payFullFinance',function(data)
    --CTRPFW.Functions.Notify("You paid the Finance of $"..data[1])
    
    TriggerServerEvent('ctrp-vehicleshop:PayFullFinances')
end)


RegisterNetEvent('ctrp-vehicleshop:client:billFullFinance')
AddEventHandler('ctrp-vehicleshop:client:billFullFinance',function(vehPlate , vehModel , financeAmount)

    TriggerServerEvent('ctrp-phone:server:sendNewMail', {
        sender = "Vehicle Finance",
        subject = "Bill",
        message = "Hi sir/mam , <br><br> Your Vehicle Plate : <strong>"..vehPlate.. " | Name : " ..vehModel.. "</strong> full finance payment request succeeded! <br>Your Full Finance was amount <strong> $ "..financeAmount.. "</strong> . Now you can buy another vehicle on Finance. <br><br> PDM FINANCE TEAM",
        button = {}
    })

end)

Citizen.CreateThread(function()
    while true do
        sleep = 2500
        if isLoggedIn and CTRPFW ~= nil then
            sleep = 1000
            local pos = GetEntityCoords(PlayerPedId())
            if PlayerJob.name == "pdm" then
                for k, v in pairs(CTRP.Locations["pstash"]) do
                    if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 4.5) then
                        sleep = 7
                        if (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 1.5) then
                            DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Personal Stash")
                            if IsControlJustReleased(0, Keys["E"]) then
                                TriggerServerEvent("inventory:server:OpenInventory", "stash", "pdmstash"..CTRPFW.Functions.GetPlayerData().citizenid)
                                TriggerEvent("inventory:client:SetCurrentStash", "pdmstash"..CTRPFW.Functions.GetPlayerData().citizenid)

                            end
                        elseif (GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 2.5) then
                            DrawText3D(v.x, v.y, v.z, "Stash")
                        end  
                    end
                end
            end
        end
        Citizen.Wait(sleep)
    end
end)

function DrawText3D(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end
