local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/TestingMode/Rayfield/main/source.lua"))()

local Window = Rayfield:CreateWindow({
	Name = "BGS Infinity | Webhook",
	LoadingTitle = "Webhook Loader",
	LoadingSubtitle = "Legendary Logger",
	ConfigurationSaving = { Enabled = false }
})

local MiscTab = Window:CreateTab("Misc")

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")
local Pets = require(ReplicatedStorage.Shared.Data.Pets)
local LocalDataService = require(ReplicatedStorage.Client.Framework.Services.LocalData)

local LegendaryPets = {}

_G.WebhookURL = "" -- Set in toggle

-- UI Toggle
MiscTab:CreateToggle({
	Name = "Enable Legendary Webhook",
	CurrentValue = false,
	Callback = function(state)
		if state then
			_G.WebhookURL = "YOUR_WEBHOOK_URL_HERE" -- << SET IT HERE
			WebhookHandler.new()
		end
	end,
})

local function convertToShorter(number, type)
	if type == "seconds" then
		local hours = math.floor(number / 3600)
		local minutes = math.floor((number % 3600) / 60)
		local seconds = number % 60
		return hours .. "h " .. minutes .. "m " .. seconds .. "s"
	end
	if type == "hatches" then
		return string.format("%.2fk", number / 1000)
	end
	if type == "bubbles" then
		if number < 1e6 then return number end
		if number < 1e9 then return string.format("%.2fm", number / 1e6) end
		return string.format("%.2fb", number / 1e9)
	end
end

local function getStats()
	local playerData = LocalDataService:Get()
	local gems = playerData.Gems
	local Pets = playerData.Pets
	local Stats = playerData.Stats

	local totalPets = 0
	for _, v in pairs(Pets) do
		totalPets += (v.Amount or 0)
	end

	local playTime = convertToShorter(Stats.Playtime or 0, "seconds")
	local hatches = convertToShorter(Stats.Hatches or 0, "hatches")
	local bubbles = convertToShorter(Stats.Bubbles or 0, "bubbles")

	return {
		playTime = playTime,
		hatches = hatches,
		bubbles = bubbles,
		gems = gems,
		totalPets = totalPets
	}
end

local function getImageThumbnail(assetId)
	local assetIdNumber = assetId:match("rbxassetid://(%d+)")
	if not assetIdNumber then return nil end

	local url = "https://thumbnails.roblox.com/v1/assets?assetIds=" .. assetIdNumber .. "&size=420x420&format=png&isCircular=false"
	local request = http_request or request or HttpPost or syn.request
	local success, result = pcall(function()
		return request({Url = url, Method = "GET", Headers = {["Content-Type"] = "application/json"}}).Body
	end)

	if success then
		local data = HttpService:JSONDecode(result)
		return data and data.data and data.data[1] and data.data[1].imageUrl or nil
	end
	return nil
end

for name, pet in pairs(Pets) do
	if pet.Rarity == "Legendary" then
		table.insert(LegendaryPets, name)
	end
end

local WebhookHandler = {}
WebhookHandler.__index = WebhookHandler

function WebhookHandler.new()
	local self = setmetatable({}, WebhookHandler)
	self.remoteEvent = ReplicatedStorage.Shared.Framework.Network.Remote.Event
	self.webhookUrl = _G.WebhookURL
	self:initialize()
	return self
end

function WebhookHandler:initialize()
	self.remoteEvent.OnClientEvent:Connect(function(...)
		self:handleEvent(...)
	end)
end

function WebhookHandler:handleEvent(...)
	local args = {...}
	if args[1] == "HatchEgg" and typeof(args[2]) == "table" then
		self:processHatchEggEvent(args[2])
	end
end

function WebhookHandler:processHatchEggEvent(hatchData)
	if typeof(hatchData.Pets) == "table" then
		for _, pet in ipairs(hatchData.Pets) do
			if pet.Pet and typeof(pet.Pet) == "table" then
				self:checkLegendaryPet(pet.Pet)
			end
		end
	end
end

function WebhookHandler:checkLegendaryPet(petData)
	if petData.Name and table.find(LegendaryPets, petData.Name) then
		self:sendWebhook(petData)
	end
end

function WebhookHandler:sendWebhook(petData)
	local petInfo = Pets[petData.Name]
	if not petInfo then return end

	local imageUrl
	if petInfo.Images and petInfo.Images.Normal then
		imageUrl = getImageThumbnail(petInfo.Images.Normal)
	end

	local player = game.Players.LocalPlayer
	local stats = getStats()

	local embed = {
		title = "Legendary Pet Hatched!",
		description = player.Name .. " just hatched a **" .. petData.Name .. "**!",
		color = 0xFF9900,
		fields = {
			{ name = "Pet Name", value = petData.Name, inline = true },
			{ name = "Rarity", value = petInfo.Rarity or "Unknown", inline = true },
			{ name = "Shiny", value = petData.Shiny and "Yes" or "No", inline = true },
			{ name = "Gems", value = convertToShorter(stats.gems or 0, "bubbles"), inline = true },
			{ name = "Total Pets", value = convertToShorter(stats.totalPets or 0, "hatches"), inline = true },
			{ name = "Playtime", value = stats.playTime, inline = true },
			{ name = "Hatches", value = stats.hatches, inline = true },
			{ name = "Bubbles", value = stats.bubbles, inline = true }
		},
		footer = {
			text = "BGS Infinity | " .. os.date("%Y-%m-%d %H:%M:%S")
		}
	}

	if petInfo.Stats then
		local statsText = ""
		for stat, value in pairs(petInfo.Stats) do
			statsText = statsText .. stat .. ": " .. tostring(value) .. "\n"
		end
		table.insert(embed.fields, { name = "Pet Stats", value = statsText, inline = false })
	end

	if imageUrl then
		embed.thumbnail = { url = imageUrl }
	end

	local data = {
		username = "Legendary Pet Logger",
		avatar_url = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. player.UserId .. "&width=420&height=420&format=png",
		embeds = {embed}
	}

	local json = HttpService:JSONEncode(data)
	local request = http_request or request or HttpPost or syn.request
	pcall(function()
		request({
			Url = self.webhookUrl,
			Method = "POST",
			Headers = {["Content-Type"] = "application/json"},
			Body = json
		})
	end)
end
