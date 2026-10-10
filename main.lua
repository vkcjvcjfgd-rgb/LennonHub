
--// YOUSEF HUB v2.0
--// Made by Yousef
--// For your own Roblox Studio game

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local rng = Random.new()

-- Remove old interface
local oldGui = playerGui:FindFirstChild("YOUSEF_HUB")
if oldGui then
    oldGui:Destroy()
end

-- Egg data for the simulator
local Eggs = {
    {
        Name = "Common Egg",
        Price = 100,
        Rewards = {
            {Name = "Bunny", Chance = 50, Reward = 50},
            {Name = "Cat", Chance = 30, Reward = 100},
            {Name = "Fox", Chance = 15, Reward = 250},
            {Name = "Dragon", Chance = 5, Reward = 1000},
        }
    },
    {
        Name = "Rare Egg",
        Price = 500,
        Rewards = {
            {Name = "Dog", Chance = 45, Reward = 200},
            {Name = "Tiger", Chance = 30, Reward = 500},
            {Name = "Phoenix", Chance = 20, Reward = 1500},
            {Name = "Golden Dragon", Chance = 5, Reward = 5000},
        }
    }
}

-- Main GUI
local gui = Instance.new("ScreenGui")
gui.Name = "YOUSEF_HUB"
gui.ResetOnSpawn = false
gui.DisplayOrder = 20
gui.Parent = playerGui

local main = Instance.new("Frame")
main.Name = "Main"
main.Size = UDim2.new(0.88, 0, 0, 440)
main.Position = UDim2.new(0.06, 0, 0.5, -220)
main.BackgroundColor3 = Color3.fromRGB(20, 22, 32)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
main.Parent = gui

local sizeLimit = Instance.new("UISizeConstraint")
sizeLimit.MinSize = Vector2.new(285, 390)
sizeLimit.MaxSize = Vector2.new(430, 540)
sizeLimit.Parent = main

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 14)
mainCorner.Parent = main

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(120, 90, 255)
stroke.Thickness = 1.5
stroke.Parent = main

-- Header
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 52)
header.BackgroundColor3 = Color3.fromRGB(35, 32, 55)
header.BorderSizePixel = 0
header.Parent = main
Instance.new("UICorner", header).CornerRadius = UDim.new(0, 14)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -90, 1, 0)
title.Position = UDim2.new(0, 14, 0, 0)
title.BackgroundTransparency = 1
title.Text = "🔥 YOUSEF HUB"
title.TextColor3 = Color3.fromRGB(255, 205, 80)
title.TextSize = 20
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = header

local close = Instance.new("TextButton")
close.Size = UDim2.new(0, 34, 0, 34)
close.Position = UDim2.new(1, -42, 0, 9)
close.BackgroundColor3 = Color3.fromRGB(190, 55, 65)
close.Text = "X"
close.TextColor3 = Color3.new(1, 1, 1)
close.Font = Enum.Font.GothamBold
close.TextSize = 16
close.Parent = header
Instance.new("UICorner", close).CornerRadius = UDim.new(0, 8)

close.Activated:Connect(function()
    gui:Destroy()
end)

-- Tab bar
local tabBar = Instance.new("Frame")
tabBar.Size = UDim2.new(1, -16, 0, 42)
tabBar.Position = UDim2.new(0, 8, 0, 60)
tabBar.BackgroundTransparency = 1
tabBar.Parent = main

local tabLayout = Instance.new("UIListLayout")
tabLayout.FillDirection = Enum.FillDirection.Horizontal
tabLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
tabLayout.Padding = UDim.new(0, 5)
tabLayout.SortOrder = Enum.SortOrder.LayoutOrder
tabLayout.Parent = tabBar

-- Content area
local content = Instance.new("ScrollingFrame")
content.Name = "Content"
content.Size = UDim2.new(1, -16, 1, -112)
content.Position = UDim2.new(0, 8, 0, 108)
content.BackgroundColor3 = Color3.fromRGB(29, 32, 45)
content.BorderSizePixel = 0
content.ScrollBarThickness = 4
content.AutomaticCanvasSize = Enum.AutomaticSize.Y
content.CanvasSize = UDim2.new(0, 0, 0, 0)
content.Parent = main
Instance.new("UICorner", content).CornerRadius = UDim.new(0, 10)

local contentLayout = Instance.new("UIListLayout")
contentLayout.Padding = UDim.new(0, 8)
contentLayout.SortOrder = Enum.SortOrder.LayoutOrder
contentLayout.Parent = content

local contentPadding = Instance.new("UIPadding")
contentPadding.PaddingTop = UDim.new(0, 10)
contentPadding.PaddingBottom = UDim.new(0, 10)
contentPadding.PaddingLeft = UDim.new(0, 10)
contentPadding.PaddingRight = UDim.new(0, 10)
contentPadding.Parent = content

local selectedEgg = 1
local lastPrize = "No egg opened yet"
local tabButtons = {}

local function clearContent()
    for _, item in ipairs(content:GetChildren()) do
        if item:IsA("GuiObject") and item ~= contentLayout
            and item ~= contentPadding then
            item:Destroy()
        end
    end
end

local function addLabel(text, height, color)
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -2, 0, height or 38)
    label.BackgroundColor3 = color or Color3.fromRGB(43, 46, 63)
    label.BorderSizePixel = 0
    label.Text = text
    label.TextColor3 = Color3.fromRGB(240, 242, 250)
    label.TextSize = 14
    label.Font = Enum.Font.Gotham
    label.TextWrapped = true
    label.Parent = content
    Instance.new("UICorner", label).CornerRadius = UDim.new(0, 8)
    return label
end

local function addButton(text, callback, color)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -2, 0, 42)
    button.BackgroundColor3 = color or Color3.fromRGB(93, 72, 190)
    button.BorderSizePixel = 0
    button.Text = text
    button.TextColor3 = Color3.new(1, 1, 1)
    button.TextSize = 14
    button.Font = Enum.Font.GothamBold
    button.TextWrapped = true
    button.Parent = content
    Instance.new("UICorner", button).CornerRadius = UDim.new(0, 8)
    button.Activated:Connect(callback)
    return button
end

local function choosePrize(egg)
    local roll = rng:NextInteger(1, 100)
    local total = 0

    for _, prize in ipairs(egg.Rewards) do
        total += prize.Chance
        if roll <= total then
            return prize
        end
    end

    return egg.Rewards[#egg.Rewards]
end

local showHome
local showEggs
local showPlayer
local showSettings

local function updateTabs(activeName)
    for name, button in pairs(tabButtons) do
        button.BackgroundColor3 =
            name == activeName
            and Color3.fromRGB(110, 82, 220)
            or Color3.fromRGB(48, 50, 68)
    end
end

local function makeTab(name, text, callback)
    local button = Instance.new("TextButton")
    button.Name = name
    button.Size = UDim2.new(0, 70, 1, 0)
    button.BackgroundColor3 = Color3.fromRGB(48, 50, 68)
    button.Text = text
    button.TextColor3 = Color3.new(1, 1, 1)
    button.TextSize = 11
    button.Font = Enum.Font.GothamBold
    button.Parent = tabBar
    Instance.new("UICorner", button).CornerRadius = UDim.new(0, 7)

    tabButtons[name] = button
    button.Activated:Connect(callback)
end

showHome = function()
    clearContent()
    updateTabs("HOME")

    addLabel("Welcome, " .. player.DisplayName .. "!", 44,
        Color3.fromRGB(48, 40, 76))
    addLabel("YOUSEF HUB  |  VERSION 2.0", 32)
    addLabel("Choose a section below to get started.", 42)

    addButton("🥚  Egg Simulator", showEggs)
    addButton("👤  Player Information", showPlayer)
    addButton("⚙️  Settings", showSettings)
    addLabel("Note: egg rewards are simulated locally.", 42,
        Color3.fromRGB(65, 48, 48))
end

showEggs = function()
    clearContent()
    updateTabs("EGGS")

    addLabel("🥚 EGG PRIZE SIMULATOR", 42,
        Color3.fromRGB(48, 40, 76))

    for index, egg in ipairs(Eggs) do
        addButton(egg.Name .. "  |  Price: $" .. egg.Price,
            function()
                selectedEgg = index
                showEggs()
            end,
            selectedEgg == index
                and Color3.fromRGB(110, 82, 220)
                or Color3.fromRGB(55, 58, 78))
    end

    local egg = Eggs[selectedEgg]
    addLabel("Selected: " .. egg.Name, 35)
    addLabel("Price: $" .. egg.Price, 32)

    for _, prize in ipairs(egg.Rewards) do
        addLabel(
            prize.Name .. "  |  " ..
            prize.Chance .. "% chance  |  $" ..
            prize.Reward,
            36
        )
    end

    addButton("🎲  Open Sample Egg", function()
        local prize = choosePrize(egg)
        lastPrize = prize.Name .. " - $" .. prize.Reward
        addLabel("🎉 You got: " .. lastPrize, 48,
            Color3.fromRGB(42, 100, 70))
    end, Color3.fromRGB(40, 145, 95))

    addLabel("This is a demo; it does not change game currency.", 44,
        Color3.fromRGB(65, 48, 48))
end

showPlayer = function()
    clearContent()
    updateTabs("PLAYER")

    addLabel("👤 PLAYER INFORMATION", 42,
        Color3.fromRGB(48, 40, 76))
    addLabel("Username: " .. player.Name, 38)
    addLabel("Display name: " .. player.DisplayName, 38)
    addLabel("User ID: " .. player.UserId, 38)
    addLabel("Last simulated prize: " .. lastPrize, 48)
    addButton("⬅  Home", showHome)
end

showSettings = function()
    clearContent()
    updateTabs("SETTINGS")

    addLabel("⚙️ SETTINGS", 42,
        Color3.fromRGB(48, 40, 76))

    addButton("🔄  Reset simulator result", function()
        lastPrize = "No egg opened yet"
        showSettings()
    end)

    addButton("🪟  Hide / Show Hub", function()
        main.Visible = false

        local reopen = Instance.new("TextButton")
        reopen.Name = "ReopenHub"
        reopen.Size = UDim2.new(0, 125, 0, 42)
        reopen.Position = UDim2.new(0, 12, 0.5, -21)
        reopen.BackgroundColor3 = Color3.fromRGB(93, 72, 190)
        reopen.Text = "🔥 Open YOUSEF"
        reopen.TextColor3 = Color3.new(1, 1, 1)
        reopen.TextSize = 13
        reopen.Font = Enum.Font.GothamBold
        reopen.Parent = gui
        Instance.new("UICorner", reopen).CornerRadius = UDim.new(0, 9)

        reopen.Activated:Connect(function()
            main.Visible = true
            reopen:Destroy()
        end)
    end)

    addLabel("Made by Yousef | Version 2.0", 38)
    addButton("⬅  Home", showHome)
end

makeTab("HOME", "🏠 HOME", showHome)
makeTab("EGGS", "🥚 EGGS", showEggs)
makeTab("PLAYER", "👤 PLAYER", showPlayer)
makeTab("SETTINGS", "⚙️ SET", showSettings)

showHome()
