CTRPFW.Players = {}
CTRPFW.Player = {}

CTRPFW.Player.Login = function(source, citizenid, newData)
	if source ~= nil then
		if citizenid then
			CTRPFW.Functions.ExecuteSql(true, "SELECT * FROM `players` WHERE `citizenid` = '"..citizenid.."'", function(result)
				local PlayerData = result[1]
				if PlayerData ~= nil then
					PlayerData.money = json.decode(PlayerData.money)
					PlayerData.job = json.decode(PlayerData.job)
					PlayerData.position = json.decode(PlayerData.position)
					PlayerData.metadata = json.decode(PlayerData.metadata)
					PlayerData.charinfo = json.decode(PlayerData.charinfo)
					if PlayerData.gang ~= nil then
						PlayerData.gang = json.decode(PlayerData.gang)
					else
						PlayerData.gang = {}
					end
				end
				CTRPFW.Player.CheckPlayerData(source, PlayerData)
			end)
		else
			CTRPFW.Player.CheckPlayerData(source, newData)
		end
		return true
	else
		CTRPFW.ShowError(GetCurrentResourceName(), "ERROR CTRPFW.PLAYER.LOGIN - NO SOURCE GIVEN!")
		return false
	end
end

CTRPFW.Player.CheckPlayerData = function(source, PlayerData)
	PlayerData = PlayerData ~= nil and PlayerData or {}

	PlayerData.source = source
	PlayerData.citizenid = PlayerData.citizenid ~= nil and PlayerData.citizenid or CTRPFW.Player.CreateCitizenId()
	PlayerData.steam = PlayerData.steam ~= nil and PlayerData.steam or CTRPFW.Functions.GetIdentifier(source, "steam")
	PlayerData.license = PlayerData.license ~= nil and PlayerData.license or CTRPFW.Functions.GetIdentifier(source, "license")
	PlayerData.name = GetPlayerName(source)
	PlayerData.cid = PlayerData.cid ~= nil and PlayerData.cid or 1

	PlayerData.money = PlayerData.money ~= nil and PlayerData.money or {}
	for moneytype, startamount in pairs(CTRPFW.Config.Money.MoneyTypes) do
		PlayerData.money[moneytype] = PlayerData.money[moneytype] ~= nil and PlayerData.money[moneytype] or startamount
	end

	PlayerData.charinfo = PlayerData.charinfo ~= nil and PlayerData.charinfo or {}
	PlayerData.charinfo.firstname = PlayerData.charinfo.firstname ~= nil and PlayerData.charinfo.firstname or "Firstname"
	PlayerData.charinfo.lastname = PlayerData.charinfo.lastname ~= nil and PlayerData.charinfo.lastname or "Lastname"
	PlayerData.charinfo.birthdate = PlayerData.charinfo.birthdate ~= nil and PlayerData.charinfo.birthdate or "00-00-0000"
	PlayerData.charinfo.gender = PlayerData.charinfo.gender ~= nil and PlayerData.charinfo.gender or 0
	PlayerData.charinfo.backstory = PlayerData.charinfo.backstory ~= nil and PlayerData.charinfo.backstory or "placeholder backstory"
	PlayerData.charinfo.nationality = PlayerData.charinfo.nationality ~= nil and PlayerData.charinfo.nationality or "English"
	PlayerData.charinfo.phone = PlayerData.charinfo.phone ~= nil and PlayerData.charinfo.phone or "06"..math.random(11111111, 99999999)
	PlayerData.charinfo.account = PlayerData.charinfo.account ~= nil and PlayerData.charinfo.account or "NL0"..math.random(1,9).."CTRP"..math.random(1111,9999)..math.random(1111,9999)..math.random(11,99)
	PlayerData.charinfo.card = PlayerData.charinfo.card ~= nil and PlayerData.charinfo.card or 0

	PlayerData.metadata = PlayerData.metadata ~= nil and PlayerData.metadata or {}
	PlayerData.metadata["hunger"] = PlayerData.metadata["hunger"] ~= nil and PlayerData.metadata["hunger"] or 100
	PlayerData.metadata["thirst"] = PlayerData.metadata["thirst"] ~= nil and PlayerData.metadata["thirst"] or 100
	PlayerData.metadata["stress"] = PlayerData.metadata["stress"] ~= nil and PlayerData.metadata["stress"] or 0
	PlayerData.metadata["isdead"] = PlayerData.metadata["isdead"] ~= nil and PlayerData.metadata["isdead"] or false
	PlayerData.metadata["inlaststand"] = PlayerData.metadata["inlaststand"] ~= nil and PlayerData.metadata["inlaststand"] or false
	PlayerData.metadata["armor"]  = PlayerData.metadata["armor"]  ~= nil and PlayerData.metadata["armor"] or 0
	PlayerData.metadata["ishandcuffed"] = PlayerData.metadata["ishandcuffed"] ~= nil and PlayerData.metadata["ishandcuffed"] or false
	PlayerData.metadata["tracker"] = PlayerData.metadata["tracker"] ~= nil and PlayerData.metadata["tracker"] or false
	PlayerData.metadata["injail"] = PlayerData.metadata["injail"] ~= nil and PlayerData.metadata["injail"] or 0
	PlayerData.metadata["jailitems"] = PlayerData.metadata["jailitems"] ~= nil and PlayerData.metadata["jailitems"] or {}
	PlayerData.metadata["status"] = PlayerData.metadata["status"] ~= nil and PlayerData.metadata["status"] or {}
	PlayerData.metadata["phone"] = PlayerData.metadata["phone"] ~= nil and PlayerData.metadata["phone"] or {}
	PlayerData.metadata["fitbit"] = PlayerData.metadata["fitbit"] ~= nil and PlayerData.metadata["fitbit"] or {}
	PlayerData.metadata["commandbinds"] = PlayerData.metadata["commandbinds"] ~= nil and PlayerData.metadata["commandbinds"] or {}
	PlayerData.metadata["bloodtype"] = PlayerData.metadata["bloodtype"] ~= nil and PlayerData.metadata["bloodtype"] or CTRPFW.Config.Player.Bloodtypes[math.random(1, #CTRPFW.Config.Player.Bloodtypes)]
	PlayerData.metadata["dealerrep"] = PlayerData.metadata["dealerrep"] ~= nil and PlayerData.metadata["dealerrep"] or 0
	PlayerData.metadata["craftingrep"] = PlayerData.metadata["craftingrep"] ~= nil and PlayerData.metadata["craftingrep"] or 0
	PlayerData.metadata["attachmentcraftingrep"] = PlayerData.metadata["attachmentcraftingrep"] ~= nil and PlayerData.metadata["attachmentcraftingrep"] or 0
	PlayerData.metadata["attachmentscraftingrep"] = PlayerData.metadata["attachmentscraftingrep"] ~= nil and PlayerData.metadata["attachmentscraftingrep"] or 0
	PlayerData.metadata["attachmentsscraftingrep"] = PlayerData.metadata["attachmentsscraftingrep"] ~= nil and PlayerData.metadata["attachmentsscraftingrep"] or 0
	PlayerData.metadata["attachmentssscraftingrep"] = PlayerData.metadata["attachmentssscraftingrep"] ~= nil and PlayerData.metadata["attachmentssscraftingrep"] or 0
	PlayerData.metadata["currentapartment"] = PlayerData.metadata["currentapartment"] ~= nil and PlayerData.metadata["currentapartment"] or nil
	PlayerData.metadata["jobrep"] = PlayerData.metadata["jobrep"] ~= nil and PlayerData.metadata["jobrep"] or {
		["tow"] = 0,
		["trucker"] = 0,
		["taxi"] = 0,
		["hotdog"] = 0,
	}
	PlayerData.metadata["callsign"] = PlayerData.metadata["callsign"] ~= nil and PlayerData.metadata["callsign"] or "NO CALLSIGN"
	PlayerData.metadata["fingerprint"] = PlayerData.metadata["fingerprint"] ~= nil and PlayerData.metadata["fingerprint"] or CTRPFW.Player.CreateFingerId()
	PlayerData.metadata["walletid"] = PlayerData.metadata["walletid"] ~= nil and PlayerData.metadata["walletid"] or CTRPFW.Player.CreateWalletId()
	PlayerData.metadata["criminalrecord"] = PlayerData.metadata["criminalrecord"] ~= nil and PlayerData.metadata["criminalrecord"] or {
		["hasRecord"] = false,
		["date"] = nil
	}
	PlayerData.metadata["licences"] = PlayerData.metadata["licences"] ~= nil and PlayerData.metadata["licences"] or {
		["driver"] = true,
		["business"] = false
	}
	PlayerData.metadata["inside"] = PlayerData.metadata["inside"] ~= nil and PlayerData.metadata["inside"] or {
		house = nil,
		apartment = {
			apartmentType = nil,
			apartmentId = nil,
		}
	}
	PlayerData.metadata["phonedata"] = PlayerData.metadata["phonedata"] ~= nil and PlayerData.metadata["phonedata"] or {
        SerialNumber = CTRPFW.Player.CreateSerialNumber(),
        InstalledApps = {},
    }

	PlayerData.job = PlayerData.job ~= nil and PlayerData.job or {}
	PlayerData.job.name = PlayerData.job.name ~= nil and PlayerData.job.name or "unemployed"
	PlayerData.job.label = PlayerData.job.label ~= nil and PlayerData.job.label or "Unemployed"
	PlayerData.job.payment = PlayerData.job.payment ~= nil and PlayerData.job.payment or 50
	if PlayerData.job.onduty == nil then PlayerData.job.onduty = true end
	PlayerData.job.gradelabel = PlayerData.job.gradelabel ~= nil and PlayerData.job.gradelabel or ""
	PlayerData.job.grade = PlayerData.job.grade ~= nil and PlayerData.job.grade or 1


	PlayerData.gang = PlayerData.gang ~= nil and PlayerData.gang or {}
	PlayerData.gang.name = PlayerData.gang.name ~= nil and PlayerData.gang.name or "No"
	PlayerData.gang.label = PlayerData.gang.label ~= nil and PlayerData.gang.label or "No Gang"

	PlayerData.position = PlayerData.position ~= nil and PlayerData.position or CTRPConfig.DefaultSpawn
	PlayerData.LoggedIn = true

	PlayerData = CTRPFW.Player.LoadInventory(PlayerData)
	CTRPFW.Player.CreatePlayer(PlayerData)
end

CTRPFW.Player.CreatePlayer = function(PlayerData)
	local self = {}
	self.Functions = {}
	self.PlayerData = PlayerData

	self.Functions.UpdatePlayerData = function()
		TriggerClientEvent("CTRPFW:Player:SetPlayerData", self.PlayerData.source, self.PlayerData)
		CTRPFW.Commands.Refresh(self.PlayerData.source)
	end

	self.Functions.SetJob = function(job, grade)
		local job = job:lower()
		local grade = tonumber(grade)
		if CTRPFW.Shared.Jobs[job] ~= nil then
			self.PlayerData.job.name = job
			self.PlayerData.job.label = CTRPFW.Shared.Jobs[job].label
			self.PlayerData.job.onduty = CTRPFW.Shared.Jobs[job].defaultDuty
			self.PlayerData.job.grade = grade
			self.PlayerData.job.gradelabel = CTRPFW.Shared.Jobs[job].grades[grade].label
			self.PlayerData.job.payment = CTRPFW.Shared.Jobs[job].grades[grade].payment
			self.Functions.UpdatePlayerData()
			TriggerClientEvent("CTRPFW:Client:OnJobUpdate", self.PlayerData.source, self.PlayerData.job)
		end
	end

	self.Functions.SetGang = function(gang)
		local gang = gang:lower()
		if CTRPFW.Shared.Gangs[gang] ~= nil then
			self.PlayerData.gang.name = gang
			self.PlayerData.gang.label = CTRPFW.Shared.Gangs[gang].label
			self.Functions.UpdatePlayerData()
			TriggerClientEvent("CTRPFW:Client:OnGangUpdate", self.PlayerData.source, self.PlayerData.gang)
		end
	end

	self.Functions.SetJobDuty = function(onDuty)
		self.PlayerData.job.onduty = onDuty
		self.Functions.UpdatePlayerData()
	end

	self.Functions.SetMetaData = function(meta, val)
		local meta = meta:lower()
		if val ~= nil then
			self.PlayerData.metadata[meta] = val
			self.Functions.UpdatePlayerData()
		end
	end

	self.Functions.AddJobReputation = function(amount)
		local amount = tonumber(amount)
		self.PlayerData.metadata["jobrep"][self.PlayerData.job.name] = self.PlayerData.metadata["jobrep"][self.PlayerData.job.name] + amount
		self.Functions.UpdatePlayerData()
	end

	self.Functions.AddMoney = function(moneytype, amount, reason)
		reason = reason ~= nil and reason or "unknown"
		local moneytype = moneytype:lower()
		local amount = tonumber(amount)
		if amount < 0 then return end
		if self.PlayerData.money[moneytype] ~= nil then
			self.PlayerData.money[moneytype] = self.PlayerData.money[moneytype]+amount
			self.Functions.UpdatePlayerData()
			TriggerEvent("ctrp-log:server:sendLog", self.PlayerData.citizenid, "moneyadded", {amount=amount, moneytype=moneytype, newbalance=self.PlayerData.money[moneytype], reason=reason})
			if amount > 100000 then
				TriggerEvent("ctrp-log:server:CreateLog", "playermoney", "AddMoney", "lightgreen", "**"..GetPlayerName(self.PlayerData.source) .. " (citizenid: "..self.PlayerData.citizenid.." | id: "..self.PlayerData.source..")** $"..amount .. " ("..moneytype..") added, new "..moneytype.." balance: "..self.PlayerData.money[moneytype], true)
			else
				TriggerEvent("ctrp-log:server:CreateLog", "playermoney", "AddMoney", "lightgreen", "**"..GetPlayerName(self.PlayerData.source) .. " (citizenid: "..self.PlayerData.citizenid.." | id: "..self.PlayerData.source..")** $"..amount .. " ("..moneytype..") added, new "..moneytype.." balance: "..self.PlayerData.money[moneytype])
			end
			TriggerClientEvent("hud:client:OnMoneyChange", self.PlayerData.source, moneytype, amount, false)
			return true
		end
		return false
	end

	self.Functions.RemoveMoney = function(moneytype, amount, reason)
		reason = reason ~= nil and reason or "unknown"
		local moneytype = moneytype:lower()
		local amount = tonumber(amount)
		if amount < 0 then return end
		if self.PlayerData.money[moneytype] ~= nil then
			for _, mtype in pairs(CTRPFW.Config.Money.DontAllowMinus) do
				if mtype == moneytype then
					if self.PlayerData.money[moneytype] - amount < 0 then return false end
				end
			end
			self.PlayerData.money[moneytype] = self.PlayerData.money[moneytype] - amount
			self.Functions.UpdatePlayerData()
			TriggerEvent("ctrp-log:server:sendLog", self.PlayerData.citizenid, "moneyremoved", {amount=amount, moneytype=moneytype, newbalance=self.PlayerData.money[moneytype], reason=reason})
			if amount > 100000 then
				TriggerEvent("ctrp-log:server:CreateLog", "playermoney", "RemoveMoney", "red", "**"..GetPlayerName(self.PlayerData.source) .. " (citizenid: "..self.PlayerData.citizenid.." | id: "..self.PlayerData.source..")** $"..amount .. " ("..moneytype..") removed, new "..moneytype.." balance: "..self.PlayerData.money[moneytype], true)
			else
				TriggerEvent("ctrp-log:server:CreateLog", "playermoney", "RemoveMoney", "red", "**"..GetPlayerName(self.PlayerData.source) .. " (citizenid: "..self.PlayerData.citizenid.." | id: "..self.PlayerData.source..")** $"..amount .. " ("..moneytype..") removed, new "..moneytype.." balance: "..self.PlayerData.money[moneytype])
			end
			TriggerClientEvent("hud:client:OnMoneyChange", self.PlayerData.source, moneytype, amount, true)
			TriggerClientEvent('ctrp-phone_new:client:RemoveBankMoney', self.PlayerData.source, amount)
			return true
		end
		return false
	end

	self.Functions.SetMoney = function(moneytype, amount, reason)
		reason = reason ~= nil and reason or "unknown"
		local moneytype = moneytype:lower()
		local amount = tonumber(amount)
		if amount < 0 then return end
		if self.PlayerData.money[moneytype] ~= nil then
			self.PlayerData.money[moneytype] = amount
			self.Functions.UpdatePlayerData()
			TriggerEvent("ctrp-log:server:sendLog", self.PlayerData.citizenid, "moneyset", {amount=amount, moneytype=moneytype, newbalance=self.PlayerData.money[moneytype], reason=reason})
			TriggerEvent("ctrp-log:server:CreateLog", "playermoney", "SetMoney", "green", "**"..GetPlayerName(self.PlayerData.source) .. " (citizenid: "..self.PlayerData.citizenid.." | id: "..self.PlayerData.source..")** $"..amount .. " ("..moneytype..") put, new "..moneytype.." balance: "..self.PlayerData.money[moneytype])
			return true
		end
		return false
	end

	self.Functions.AddItem = function(item, amount, slot, info)
		local totalWeight = CTRPFW.Player.GetTotalWeight(self.PlayerData.items)
		local itemInfo = CTRPFW.Shared.Items[item:lower()]
		if itemInfo == nil then TriggerClientEvent('chatMessage', -1, "SYSTEM",  "warning", "No item found??") return end
		local amount = tonumber(amount)
		local slot = tonumber(slot) ~= nil and tonumber(slot) or CTRPFW.Player.GetFirstSlotByItem(self.PlayerData.items, item)
		if itemInfo["type"] == "weapon" and info == nil then
			info = {
				serie = tostring(CTRPFW.Shared.RandomInt(2) .. CTRPFW.Shared.RandomStr(3) .. CTRPFW.Shared.RandomInt(1) .. CTRPFW.Shared.RandomStr(2) .. CTRPFW.Shared.RandomInt(3) .. CTRPFW.Shared.RandomStr(4)),
			}
		end
		if (totalWeight + (itemInfo["weight"] * amount)) <= CTRPFW.Config.Player.MaxWeight then
			if (slot ~= nil and self.PlayerData.items[slot] ~= nil) and (self.PlayerData.items[slot].name:lower() == item:lower()) and (itemInfo["type"] == "item" and not itemInfo["unique"]) then
				self.PlayerData.items[slot].amount = self.PlayerData.items[slot].amount + amount
				self.Functions.UpdatePlayerData()
				TriggerEvent("ctrp-log:server:sendLog", self.PlayerData.citizenid, "itemadded", {name=self.PlayerData.items[slot].name, amount=amount, slot=slot, newamount=self.PlayerData.items[slot].amount, reason="unkown"})
				TriggerEvent("ctrp-log:server:CreateLog", "playerinventory", "AddItem", "green", "**"..GetPlayerName(self.PlayerData.source) .. " (citizenid: "..self.PlayerData.citizenid.." | id: "..self.PlayerData.source..")** got item: [slot:" ..slot.."], itemname: " .. self.PlayerData.items[slot].name .. ", added amount: " .. amount ..", new total amount: ".. self.PlayerData.items[slot].amount)
				--TriggerClientEvent('CTRPFW:Notify', self.PlayerData.source, itemInfo["label"].. " added!", "success")
				return true
			elseif (not itemInfo["unique"] and slot or slot ~= nil and self.PlayerData.items[slot] == nil) then
				self.PlayerData.items[slot] = {name = itemInfo["name"], amount = amount, info = info ~= nil and info or "", label = itemInfo["label"], description = itemInfo["description"] ~= nil and itemInfo["description"] or "", weight = itemInfo["weight"], type = itemInfo["type"], unique = itemInfo["unique"], useable = itemInfo["useable"], image = itemInfo["image"], shouldClose = itemInfo["shouldClose"], slot = slot, combinable = itemInfo["combinable"]}
				self.Functions.UpdatePlayerData()
				TriggerEvent("ctrp-log:server:sendLog", self.PlayerData.citizenid, "itemadded", {name=self.PlayerData.items[slot].name, amount=amount, slot=slot, newamount=self.PlayerData.items[slot].amount, reason="unkown"})
				TriggerEvent("ctrp-log:server:CreateLog", "playerinventory", "AddItem", "green", "**"..GetPlayerName(self.PlayerData.source) .. " (citizenid: "..self.PlayerData.citizenid.." | id: "..self.PlayerData.source..")** got item: [slot:" ..slot.."], itemname: " .. self.PlayerData.items[slot].name .. ", added amount: " .. amount ..", new total amount: ".. self.PlayerData.items[slot].amount)
				--TriggerClientEvent('CTRPFW:Notify', self.PlayerData.source, itemInfo["label"].. " added!", "success")
				return true
			elseif (itemInfo["unique"]) or (not slot or slot == nil) or (itemInfo["type"] == "weapon") then
				for i = 1, CTRPConfig.Player.MaxInvSlots, 1 do
					if self.PlayerData.items[i] == nil then
						self.PlayerData.items[i] = {name = itemInfo["name"], amount = amount, info = info ~= nil and info or "", label = itemInfo["label"], description = itemInfo["description"] ~= nil and itemInfo["description"] or "", weight = itemInfo["weight"], type = itemInfo["type"], unique = itemInfo["unique"], useable = itemInfo["useable"], image = itemInfo["image"], shouldClose = itemInfo["shouldClose"], slot = i, combinable = itemInfo["combinable"]}
						self.Functions.UpdatePlayerData()
						TriggerEvent("ctrp-log:server:sendLog", self.PlayerData.citizenid, "itemadded", {name=self.PlayerData.items[i].name, amount=amount, slot=i, newamount=self.PlayerData.items[i].amount, reason="unkown"})
						TriggerEvent("ctrp-log:server:CreateLog", "playerinventory", "AddItem", "green", "**"..GetPlayerName(self.PlayerData.source) .. " (citizenid: "..self.PlayerData.citizenid.." | id: "..self.PlayerData.source..")** got item: [slot:" ..i.."], itemname: " .. self.PlayerData.items[i].name .. ", added amount: " .. amount ..", new total amount: ".. self.PlayerData.items[i].amount)
						--TriggerClientEvent('CTRPFW:Notify', self.PlayerData.source, itemInfo["label"].. " added!", "success")
						return true
					end
				end
			end
		end
		return false
	end

	self.Functions.RemoveItem = function(item, amount, slot)
		local itemInfo = CTRPFW.Shared.Items[item:lower()]
		local amount = tonumber(amount)
		local slot = tonumber(slot)
		if slot ~= nil then
			if self.PlayerData.items[slot].amount > amount then
				self.PlayerData.items[slot].amount = self.PlayerData.items[slot].amount - amount
				self.Functions.UpdatePlayerData()
				TriggerEvent("ctrp-log:server:sendLog", self.PlayerData.citizenid, "itemremoved", {name=self.PlayerData.items[slot].name, amount=amount, slot=slot, newamount=self.PlayerData.items[slot].amount, reason="unkown"})
				TriggerEvent("ctrp-log:server:CreateLog", "playerinventory", "RemoveItem", "red", "**"..GetPlayerName(self.PlayerData.source) .. " (citizenid: "..self.PlayerData.citizenid.." | id: "..self.PlayerData.source..")** lost item: [slot:" ..slot.."], itemname: " .. self.PlayerData.items[slot].name .. ", removed amount: " .. amount ..", new total amount: ".. self.PlayerData.items[slot].amount)
				--TriggerClientEvent('CTRPFW:Notify', self.PlayerData.source, itemInfo["label"].. " deleted!", "error")
				return true
			else
				self.PlayerData.items[slot] = nil
				self.Functions.UpdatePlayerData()
				TriggerEvent("ctrp-log:server:sendLog", self.PlayerData.citizenid, "itemremoved", {name=item, amount=amount, slot=slot, newamount=0, reason="unkown"})
				TriggerEvent("ctrp-log:server:CreateLog", "playerinventory", "RemoveItem", "red", "**"..GetPlayerName(self.PlayerData.source) .. " (citizenid: "..self.PlayerData.citizenid.." | id: "..self.PlayerData.source..")** lost item: [slot:" ..slot.."], itemname: " .. item .. ", removed amount: " .. amount ..", item removed")
				--TriggerClientEvent('CTRPFW:Notify', self.PlayerData.source, itemInfo["label"].. " deleted!", "error")
				return true
			end
		else
			local slots = CTRPFW.Player.GetSlotsByItem(self.PlayerData.items, item)
			local amountToRemove = amount
			if slots ~= nil then
				for _, slot in pairs(slots) do
					if self.PlayerData.items[slot].amount > amountToRemove then
						self.PlayerData.items[slot].amount = self.PlayerData.items[slot].amount - amountToRemove
						self.Functions.UpdatePlayerData()
						TriggerEvent("ctrp-log:server:sendLog", self.PlayerData.citizenid, "itemremoved", {name=self.PlayerData.items[slot].name, amount=amount, slot=slot, newamount=self.PlayerData.items[slot].amount, reason="unkown"})
						TriggerEvent("ctrp-log:server:CreateLog", "playerinventory", "RemoveItem", "red", "**"..GetPlayerName(self.PlayerData.source) .. " (citizenid: "..self.PlayerData.citizenid.." | id: "..self.PlayerData.source..")** lost item: [slot:" ..slot.."], itemname: " .. self.PlayerData.items[slot].name .. ", removed amount: " .. amount ..", new total amount: ".. self.PlayerData.items[slot].amount)
						--TriggerClientEvent('CTRPFW:Notify', self.PlayerData.source, itemInfo["label"].. " deleted!", "error")
						return true
					elseif self.PlayerData.items[slot].amount == amountToRemove then
						self.PlayerData.items[slot] = nil
						self.Functions.UpdatePlayerData()
						TriggerEvent("ctrp-log:server:sendLog", self.PlayerData.citizenid, "itemremoved", {name=item, amount=amount, slot=slot, newamount=0, reason="unkown"})
						TriggerEvent("ctrp-log:server:CreateLog", "playerinventory", "RemoveItem", "red", "**"..GetPlayerName(self.PlayerData.source) .. " (citizenid: "..self.PlayerData.citizenid.." | id: "..self.PlayerData.source..")** lost item: [slot:" ..slot.."], itemname: " .. item .. ", removed amount: " .. amount ..", item removed")
						--TriggerClientEvent('CTRPFW:Notify', self.PlayerData.source, itemInfo["label"].. " deleted!", "error")
						return true
					end
				end
			end
		end
		return false
	end

	self.Functions.SetInventory = function(items)
		self.PlayerData.items = items
		self.Functions.UpdatePlayerData()
		TriggerEvent("ctrp-log:server:sendLog", self.PlayerData.citizenid, "setinventory", {items=json.encode(items)})
		TriggerEvent("ctrp-log:server:CreateLog", "playerinventory", "SetInventory", "blue", "**"..GetPlayerName(self.PlayerData.source) .. " (citizenid: "..self.PlayerData.citizenid.." | id: "..self.PlayerData.source..")** items set: " .. json.encode(items))
	end

	self.Functions.ClearInventory = function()
		self.PlayerData.items = {}
		self.Functions.UpdatePlayerData()
		TriggerEvent("ctrp-log:server:sendLog", self.PlayerData.citizenid, "clearinventory", {})
		TriggerEvent("ctrp-log:server:CreateLog", "playerinventory", "ClearInventory", "red", "**"..GetPlayerName(self.PlayerData.source) .. " (citizenid: "..self.PlayerData.citizenid.." | id: "..self.PlayerData.source..")** inventory cleared")
	end

	self.Functions.GetItemByName = function(item)
		local item = tostring(item):lower()
		local slot = CTRPFW.Player.GetFirstSlotByItem(self.PlayerData.items, item)
		if slot ~= nil then
			return self.PlayerData.items[slot]
		end
		return nil
	end

	self.Functions.GetItemBySlot = function(slot)
		local slot = tonumber(slot)
		if self.PlayerData.items[slot] ~= nil then
			return self.PlayerData.items[slot]
		end
		return nil
	end

	self.Functions.GetMoney = function(moneytype)
        if moneytype ~= nil then
            local moneytype = moneytype:lower()
            return self.PlayerData.money[moneytype]
        end
        return false
    end	
	self.Functions.GetItemsByName = function(item)
		local item = tostring(item):lower()
		local items = {}
		local slots = CTRPFW.Player.GetSlotsByItem(self.PlayerData.items, item)
		for _, slot in pairs(slots) do
			if slot ~= nil then
				table.insert(items, self.PlayerData.items[slot])
			end
		end
		return items
	end
	self.Functions.GetCardSlot = function(cardNumber, cardType)
        local item = tostring(cardType):lower()
        local slots = CTRPFW.Player.GetSlotsByItem(self.PlayerData.items, item)
        for _, slot in pairs(slots) do
            if slot ~= nil then
                if self.PlayerData.items[slot].info.cardNumber == cardNumber then 
                    return slot
                end
            end
        end
        return nil
    end

	self.Functions.SetCreditCard = function(cardNumber)
        self.PlayerData.charinfo.card = cardNumber
        self.Functions.UpdatePlayerData()
    end

	self.Functions.Save = function()
		CTRPFW.Player.Save(self.PlayerData.source)
	end

	CTRPFW.Players[self.PlayerData.source] = self
	CTRPFW.Player.Save(self.PlayerData.source)
	self.Functions.UpdatePlayerData()
end

CTRPFW.Player.Save = function(source)
	local PlayerData = CTRPFW.Players[source].PlayerData
	if PlayerData ~= nil then
		CTRPFW.Functions.ExecuteSql(true, "SELECT * FROM `players` WHERE `citizenid` = '"..PlayerData.citizenid.."'", function(result)
			if result[1] == nil then
				CTRPFW.Functions.ExecuteSql(true, "INSERT INTO `players` (`citizenid`, `cid`, `steam`, `license`, `name`, `money`, `charinfo`, `job`, `gang`, `position`, `metadata`) VALUES ('"..PlayerData.citizenid.."', '"..tonumber(PlayerData.cid).."', '"..PlayerData.steam.."', '"..PlayerData.license.."', '"..PlayerData.name.."', '"..json.encode(PlayerData.money).."', '"..CTRPFW.EscapeSqli(json.encode(PlayerData.charinfo)).."', '"..json.encode(PlayerData.job).."', '"..json.encode(PlayerData.gang).."', '"..json.encode(PlayerData.position).."', '"..json.encode(PlayerData.metadata).."')")
			else
				CTRPFW.Functions.ExecuteSql(true, "UPDATE `players` SET steam='"..PlayerData.steam.."',license='"..PlayerData.license.."',name='"..PlayerData.name.."',money='"..json.encode(PlayerData.money).."',charinfo='"..CTRPFW.EscapeSqli(json.encode(PlayerData.charinfo)).."',job='"..json.encode(PlayerData.job).."',gang='"..json.encode(PlayerData.gang).."', position='"..json.encode(PlayerData.position).."',metadata='"..json.encode(PlayerData.metadata).."' WHERE `citizenid` = '"..PlayerData.citizenid.."'")
			end
			CTRPFW.Player.SaveInventory(source)
		end)
		CTRPFW.ShowSuccess(GetCurrentResourceName(), PlayerData.name .." PLAYER SAVED!")
	else
		CTRPFW.ShowError(GetCurrentResourceName(), "ERROR CTRPFW.PLAYER.SAVE - PLAYERDATA IS EMPTY!")
	end
end

--[[CTRPFW.Player.Logout = function(source)
	TriggerClientEvent('CTRPFW:Client:OnPlayerUnload', source)
	TriggerClientEvent("CTRPFW:Player:UpdatePlayerData", source)
	Citizen.Wait(200)
	-- TriggerEvent('CTRPFW:Server:OnPlayerUnload')
	-- CTRPFW.Players[source].Functions.Save()
	CTRPFW.Players[source] = nil
end]]

CTRPFW.Player.Logout = function(source)
	TriggerClientEvent('CTRPFW:Client:OnPlayerUnload', source)
	CTRPFW.Players[source].Functions.Save()
	--TriggerClientEvent("CTRPFW:Player:UpdatePlayerData", source)
	Citizen.Wait(200)
	-- TriggerEvent('CTRPFW:Server:OnPlayerUnload')
	-- CTRPFW.Players[source].Functions.Save()
	CTRPFW.Players[source] = nil
end

CTRPFW.Player.DeleteCharacter = function(source, citizenid)
	CTRPFW.Functions.ExecuteSql(true, "DELETE FROM `players` WHERE `citizenid` = '"..citizenid.."'")
	TriggerEvent("ctrp-log:server:sendLog", citizenid, "characterdeleted", {})
	TriggerEvent("ctrp-log:server:CreateLog", "joinleave", "Character Deleted", "red", "**".. GetPlayerName(source) .. "** ("..GetPlayerIdentifiers(source)[1]..") deleted **"..citizenid.."**..")
end

CTRPFW.Player.LoadInventory = function(PlayerData)
	PlayerData.items = {}
	CTRPFW.Functions.ExecuteSql(true, "SELECT * FROM `playeritems` WHERE `citizenid` = '"..PlayerData.citizenid.."'", function(oldInventory)
		if oldInventory[1] ~= nil then
			for _, item in pairs(oldInventory) do
				if item ~= nil then
					local itemInfo = CTRPFW.Shared.Items[item.name:lower()]
					PlayerData.items[item.slot] = {name = itemInfo["name"], amount = item.amount, info = json.decode(item.info) ~= nil and json.decode(item.info) or "", label = itemInfo["label"], description = itemInfo["description"] ~= nil and itemInfo["description"] or "", weight = itemInfo["weight"], type = itemInfo["type"], unique = itemInfo["unique"], useable = itemInfo["useable"], image = itemInfo["image"], shouldClose = itemInfo["shouldClose"], slot = item.slot, combinable = itemInfo["combinable"]}
				end
				Citizen.Wait(1)
			end
			CTRPFW.Functions.ExecuteSql(true, "DELETE FROM `playeritems` WHERE `citizenid` = '"..PlayerData.citizenid.."'")
		else
			CTRPFW.Functions.ExecuteSql(true, "SELECT * FROM `players` WHERE `citizenid` = '"..PlayerData.citizenid.."'", function(result)
				if result[1] ~= nil then
					if result[1].inventory ~= nil then
						plyInventory = json.decode(result[1].inventory)
						if next(plyInventory) ~= nil then
							for _, item in pairs(plyInventory) do
								if item ~= nil then
									local itemInfo = CTRPFW.Shared.Items[item.name:lower()]
									PlayerData.items[item.slot] = {
										name = itemInfo["name"],
										amount = item.amount,
										info = item.info ~= nil and item.info or "",
										label = itemInfo["label"],
										description = itemInfo["description"] ~= nil and itemInfo["description"] or "",
										weight = itemInfo["weight"],
										type = itemInfo["type"],
										unique = itemInfo["unique"],
										useable = itemInfo["useable"],
										image = itemInfo["image"],
										shouldClose = itemInfo["shouldClose"],
										slot = item.slot,
										combinable = itemInfo["combinable"]
									}
								end
							end
						end
					end
				end
			end)
		end
	end)
	return PlayerData
end

CTRPFW.Player.SaveInventory = function(source)
	if CTRPFW.Players[source] ~= nil then
		local PlayerData = CTRPFW.Players[source].PlayerData
		local items = PlayerData.items
		local ItemsJson = {}
		if items ~= nil and next(items) ~= nil then
			for slot, item in pairs(items) do
				if items[slot] ~= nil then
					table.insert(ItemsJson, {
						name = item.name,
						amount = item.amount,
						info = item.info,
						type = item.type,
						slot = slot,
					})
				end
			end

			CTRPFW.Functions.ExecuteSql(true, "UPDATE `players` SET `inventory` = '"..CTRPFW.EscapeSqli(json.encode(ItemsJson)).."' WHERE `citizenid` = '"..PlayerData.citizenid.."'")
		end
	end
end

CTRPFW.Player.GetTotalWeight = function(items)
	local weight = 0
	if items ~= nil then
		for slot, item in pairs(items) do
			weight = weight + (item.weight * item.amount)
		end
	end
	return tonumber(weight)
end

CTRPFW.Player.GetSlotsByItem = function(items, itemName)
	local slotsFound = {}
	if items ~= nil then
		for slot, item in pairs(items) do
			if item.name:lower() == itemName:lower() then
				table.insert(slotsFound, slot)
			end
		end
	end
	return slotsFound
end

CTRPFW.Player.GetFirstSlotByItem = function(items, itemName)
	if items ~= nil then
		for slot, item in pairs(items) do
			if item.name:lower() == itemName:lower() then
				return tonumber(slot)
			end
		end
	end
	return nil
end

CTRPFW.Player.CreateCitizenId = function()
	local UniqueFound = false
	local CitizenId = nil

	while not UniqueFound do
		CitizenId = tostring(CTRPFW.Shared.RandomStr(3) .. CTRPFW.Shared.RandomInt(5)):upper()
		CTRPFW.Functions.ExecuteSql(true, "SELECT COUNT(*) as count FROM `players` WHERE `citizenid` = '"..CitizenId.."'", function(result)
			if result[1].count == 0 then
				UniqueFound = true
			end
		end)
	end
	return CitizenId
end

CTRPFW.Player.CreateFingerId = function()
	local UniqueFound = false
	local FingerId = nil
	while not UniqueFound do
		FingerId = tostring(CTRPFW.Shared.RandomStr(2) .. CTRPFW.Shared.RandomInt(3) .. CTRPFW.Shared.RandomStr(1) .. CTRPFW.Shared.RandomInt(2) .. CTRPFW.Shared.RandomStr(3) .. CTRPFW.Shared.RandomInt(4))
		CTRPFW.Functions.ExecuteSql(true, "SELECT COUNT(*) as count FROM `players` WHERE `metadata` LIKE '%"..FingerId.."%'", function(result)
			if result[1].count == 0 then
				UniqueFound = true
			end
		end)
	end
	return FingerId
end

CTRPFW.Player.CreateWalletId = function()
	local UniqueFound = false
	local WalletId = nil
	while not UniqueFound do
		WalletId = "ctrp-"..math.random(11111111, 99999999)
		CTRPFW.Functions.ExecuteSql(true, "SELECT COUNT(*) as count FROM `players` WHERE `metadata` LIKE '%"..WalletId.."%'", function(result)
			if result[1].count == 0 then
				UniqueFound = true
			end
		end)
	end
	return WalletId
end

CTRPFW.Player.CreateSerialNumber = function()
    local UniqueFound = false
    local SerialNumber = nil

    while not UniqueFound do
        SerialNumber = math.random(11111111, 99999999)
        CTRPFW.Functions.ExecuteSql(true, "SELECT COUNT(*) as count FROM players WHERE metadata LIKE '%"..SerialNumber.."%'", function(result)
            if result[1].count == 0 then
                UniqueFound = true
            end
        end)
    end
    return SerialNumber
end

CTRPFW.EscapeSqli = function(str)
    local replacements = { ['"'] = '\\"', ["'"] = "\\'" }
    return str:gsub( "['\"]", replacements ) -- or string.gsub( source, "['\"]", replacements )
end
