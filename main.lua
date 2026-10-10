
-- YOUSEF HUB | Mobile UI
-- Made by Yousef
-- For your own Roblox Studio game

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local old = playerGui:FindFirstChild("YousefHub")
if old then old:Destroy() end

local gui = Instance.new("ScreenGui")
gui.Name = "YousefHub"
gui.ResetOnSpawn = false
gui.Parent = playerGui

local main = Instance.new("Frame")
main.Size = UDim2.new(0, 320, 0, 390)
main.Position = UDim2.new(0.5, -160, 0.5, -195)
main.BackgroundColor3 = Color3.fromRGB(23, 25, 35)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
main.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = main

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -45, 0, 42)
title.Position = UDim2.new(0, 10, 0, 0)
title.BackgroundTransparency = 1
title.Text = "🔥 YOUSEF HUB"
title.TextColor3 = Color3.fromRGB(255, 190, 60)
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.Parent = main

local close = Instance.new("TextButton")
close.Size = UDim2.new(0, 32, 0, 32)
close.Position = UDim2.new(1, -38, 0, 5)
close.Text = "X"
close.TextColor3 = Color3.new(1, 1, 1)
close.BackgroundColor3 = Color3.fromRGB(190, 55, 65)
close.Font = Enum.Font.GothamBold
close.TextSize = 16
close.Parent = main
Instance.new("UICorner", close).CornerRadius = UDim.new(0, 8)
close.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

local tabs = Instance.new("Frame")
tabs.Size = UDim2.new(1, -16, 0, 38)
tabs.Position = UDim2.new(0, 8, 0, 48)
tabs.BackgroundTransparency = 1
tabs.Parent = main

local tabLayout = Instance.new("UIListLayout")
tabLayout.FillDirection = Enum.FillDirection.Horizontal
tabLayout.Padding = UDim.new(0, 5)
tabLayout.Parent = tabs

local content = Instance.new("ScrollingFrame")
content.Size = UDim2.new(1, -16, 1, -100)
content.Position = UDim2.new(0, 8, 0, 92)
content.BackgroundColor3 = Color3.fromRGB(32, 35, 48)
content.BorderSizePixel = 0
content.ScrollBarThickness = 4
content.CanvasSize = UDim2.new(0, 0, 0, 0)
content.AutomaticCanvasSize = Enum.AutomaticSize.Y
content.Parent = main
Instance.new("UICorner", content).CornerRadius = UDim.new(0, 8)

local layout = Instance.new("UIListLayout")
layout.Padding = UDim.new(0, 7)
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.Parent = content

local padding = Instance.new("UIPadding")
padding.PaddingTop = UDim.new(0, 10)
padding.PaddingLeft = UDim.new(0, 10)
padding.PaddingRight = UDim.new(0, 10)
padding.PaddingBottom = UDim.new(0, 10)
padding.Parent = content

local function clearContent()
    for _, item in ipairs(content:GetChildren()) do
        if item:IsA("TextButton") or item:IsA("TextLabel") then
            item:Destroy()
        end
    end
end

local function addLabel(text)
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -4, 0, 35)
    label.BackgroundColor3 = Color3.fromRGB(43, 47, 63)
    label.TextColor3 = Color3.fromRGB(240, 240, 245)
    label.Font = Enum.Font.Gotham
    label.TextSize = 14
    label.TextWrapped = true
    label.Text = text
    label.Parent = content
    Instance.new("UICorner", label).CornerRadius = UDim.new(0, 7)
    return label
end

local function addButton(text, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -4, 0, 40)
    button.BackgroundColor3 = Color3.fromRGB(92, 75, 190)
    button.TextColor3 = Color3.new(1, 1, 1)
    button.Font = Enum.Font.GothamBold
    button.TextSize = 14
    button.Text = text
    button.Parent = content
    Instance.new("UICorner", button).CornerRadius = UDim.new(0, 7)
    button.MouseButton1Click:Connect(callback)
    return button
end

local function showHome()
    clearContent()
    addLabel("Welcome, " .. player.DisplayName .. "!")
    addLabel("YOUSEF HUB - Mobile Edition")
    addButton("🎲 Egg Prize Simulator", function()
        showEggs()
    end)
    addButton("👤 Player Info", function()
        clearContent()
        addLabel("Player: " .. player.Name)
        addLabel("Display name: " .. player.DisplayName)
        addLabel("User ID: " .. player.UserId)
        addButton("⬅ Back to Home", showHome)
    end)
    addButton("ℹ️ About", function()
        clearContent()
        addLabel("YOUSEF HUB v1.0")
        addLabel("A sample interface for your own Roblox game.")
        addButton("⬅ Back to Home", showHome)
    end)
end

function showEggs()
    clearContent()
    addLabel("🥚 EGG PRIZE SIMULATOR")
    addLabel("Common Egg | Price: $100")
    addLabel("Bunny - 50% - Reward $50")
    addLabel("Cat - 30% - Reward $100")
    addLabel("Fox - 15% - Reward $250")
    addLabel("Dragon - 5% - Reward $1000")

    addLabel("💎 Rare Egg | Price: $500")
    addLabel("Dog - 45% - Reward $200")
    addLabel("Tiger - 30% - Reward $500")
    addLabel("Phoenix - 20% - Reward $1500")
    addLabel("Golden Dragon - 5% - Reward $5000")

    addButton("🎲 Open Sample Egg", function()
        local roll = math.random(1, 100)
        local prize
        if roll <= 50 then
            prize = "Bunny - $50"
        elseif roll <= 80 then
            prize = "Cat - $100"
        elseif roll <= 95 then
            prize = "Fox - $250"
        else
            prize = "Dragon - $1000"
        end
        addLabel("🎉 Your simulated prize: " .. prize)
    end)

    addButton("⬅ Back to Home", showHome)
end

local function makeTab(name, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 95, 1, 0)
    button.BackgroundColor3 = Color3.fromRGB(65, 68, 90)
    button.TextColor3 = Color3.new(1, 1, 1)
    button.Font = Enum.Font.GothamBold
    button.TextSize = 12
    button.Text = name
    button.Parent = tabs
    Instance.new("UICorner", button).CornerRadius = UDim.new(0, 7)
    button.MouseButton1Click:Connect(callback)
end

makeTab("🏠 Home", showHome)
makeTab("🥚 Eggs", showEggs)
makeTab("👤 Player", function()
    clearContent()
    addLabel("Player: " .. player.Name)
    addLabel("Display name: " .. player.DisplayName)
    addLabel("User ID: " .. player.UserId)
    addButton("⬅ Back to Home", showHome)
end)

showHome()
