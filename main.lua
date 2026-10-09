-- ===== YJW HUB =====
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local HUB_NAME = "YJW HUB"
local TELEGRAM = "https://t.me/YJW_m"

local old = playerGui:FindFirstChild("YJW_Hub")
if old then old:Destroy() end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "YJW_Hub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = playerGui

-- الإطار الرئيسي
local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 560, 0, 340)
Main.Position = UDim2.new(0.5, -280, 0.5, -170)
Main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Main.Parent = ScreenGui
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 10)

-- الهيدر
local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 40)
Header.BackgroundColor3 = Color3.fromRGB(200, 30, 30)
Header.BorderSizePixel = 0
Header.Parent = Main
Instance.new("UICorner", Header).CornerRadius = UDim.new(0, 10)

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -50, 1, 0)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = HUB_NAME
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 20
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Header

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -38, 0, 5)
CloseBtn.BackgroundColor3 = Color3.fromRGB(150, 20, 20)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 16
CloseBtn.Parent = Header
Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 6)
CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

-- الأعمدة
local LeftTabs = Instance.new("Frame")
LeftTabs.Size = UDim2.new(0, 110, 1, -50)
LeftTabs.Position = UDim2.new(0, 5, 0, 45)
LeftTabs.BackgroundTransparency = 1
LeftTabs.Parent = Main
local LL = Instance.new("UIListLayout", LeftTabs)
LL.Padding = UDim.new(0, 5)

local RightBtns = Instance.new("Frame")
RightBtns.Size = UDim2.new(0, 110, 1, -50)
RightBtns.Position = UDim2.new(1, -115, 0, 45)
RightBtns.BackgroundTransparency = 1
RightBtns.Parent = Main
local RL = Instance.new("UIListLayout", RightBtns)
RL.Padding = UDim.new(0, 5)

local Content = Instance.new("Frame")
Content.Size = UDim2.new(1, -235, 1, -50)
Content.Position = UDim2.new(0, 120, 0, 45)
Content.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Content.BorderSizePixel = 0
Content.Parent = Main
Instance.new("UICorner", Content).CornerRadius = UDim.new(0, 6)

local Scroll = Instance.new("ScrollingFrame")
Scroll.Size = UDim2.new(1, -10, 1, -10)
Scroll.Position = UDim2.new(0, 5, 0, 5)
Scroll.BackgroundTransparency = 1
Scroll.BorderSizePixel = 0
Scroll.ScrollBarThickness = 3
Scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
Scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
Scroll.Parent = Content
local CL = Instance.new("UIListLayout", Scroll)
CL.Padding = UDim.new(0, 8)

-- دوال مساعدة
local function makeTab(parent, text, cb)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(1, 0, 0, 40)
    b.BackgroundColor3 = Color3.fromRGB(180, 30, 30)
    b.Text = text
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    b.Font = Enum.Font.GothamBold
    b.TextSize = 14
    b.Parent = parent
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 6)
    b.MouseButton1Click:Connect(cb)
end

local function makeToggle(parent, text, default, cb)
    local f = Instance.new("Frame")
    f.Size = UDim2.new(1, -10, 0, 45)
    f.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    f.BorderSizePixel = 0
    f.Parent = parent
    Instance.new("UICorner", f).CornerRadius = UDim.new(0, 6)

    local l = Instance.new("TextLabel")
    l.Size = UDim2.new(1, -70, 1, 0)
    l.Position = UDim2.new(0, 10, 0, 0)
    l.BackgroundTransparency = 1
    l.Text = text
    l.TextColor3 = Color3.fromRGB(255, 255, 255)
    l.Font = Enum.Font.Gotham
    l.TextSize = 13
    l.TextXAlignment = Enum.TextXAlignment.Left
    l.Parent = f

    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0, 45, 0, 24)
    b.Position = UDim2.new(1, -55, 0.5, -12)
    b.BackgroundColor3 = default and Color3.fromRGB(60, 200, 60) or Color3.fromRGB(100, 100, 100)
    b.Text = ""
    b.Parent = f
    Instance.new("UICorner", b).CornerRadius = UDim.new(1, 0)

    local d = Instance.new("Frame")
    d.Size = UDim2.new(0, 18, 0, 18)
    d.Position = default and UDim2.new(1, -20, 0.5, -9) or UDim2.new(0, 2, 0.5, -9)
    d.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    d.Parent = b
    Instance.new("UICorner", d).CornerRadius = UDim.new(1, 0)

    local state = default
    b.MouseButton1Click:Connect(function()
        state = not state
        b.BackgroundColor3 = state and Color3.fromRGB(60, 200, 60) or Color3.fromRGB(100, 100, 100)
        d.Position = state and UDim2.new(1, -20, 0.5, -9) or UDim2.new(0, 2, 0.5, -9)
        cb(state)
    end)
end

local function makeBtn(parent, text, cb)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(1, -10, 0, 40)
    b.BackgroundColor3 = Color3.fromRGB(180, 30, 30)
    b.Text = text
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    b.Font = Enum.Font.GothamBold
    b.TextSize = 13
    b.Parent = parent
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 6)
    b.MouseButton1Click:Connect(cb)
end

local function newPage()
    local p = Instance.new("Frame")
    p.Size = UDim2.new(1, 0, 0, 0)
    p.AutomaticSize = Enum.AutomaticSize.Y
    p.BackgroundTransparency = 1
    p.Visible = false
    p.Parent = Scroll
    local l = Instance.new("UIListLayout", p)
    l.Padding = UDim.new(0, 8)
    return p
end

-- الصفحات
local FarmPage = newPage()
local PlayerPage = newPage()
local InfoPage = newPage()
local pages = {FarmPage, PlayerPage, InfoPage}

local function show(p)
    for _, x in pairs(pages) do x.Visible = false end
    p.Visible = true
end

makeTab(LeftTabs, "Farm", function() show(FarmPage) end)
makeTab(LeftTabs, "Player", function() show(PlayerPage) end)
makeTab(LeftTabs, "Info", function() show(InfoPage) end)
makeTab(RightBtns, "Telegram", function()
    setclipboard(TELEGRAM)
end)
makeTab(RightBtns, "Close", function() ScreenGui:Destroy() end)

show(FarmPage)

-- ===== Farm =====
makeToggle(FarmPage, "Steal Missing Rift Eggs", false, function(v) end)
makeToggle(FarmPage, "Steal Missing Index Eggs", false, function(v) end)
makeToggle(FarmPage, "Auto Place Egg", false, function(v) end)

-- ===== Player =====
_G.infJump = false
_G.noclip = false

makeToggle(PlayerPage, "Infinite Jump", false, function(v) _G.infJump = v end)
makeToggle(PlayerPage, "Noclip", false, function(v) _G.noclip = v end)

UIS.JumpRequest:Connect(function()
    if _G.infJump then
        local c = player.Character
        if c and c:FindFirstChildOfClass("Humanoid") then
            c:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
        end
    end
end)

RunService.Stepped:Connect(function()
    if _G.noclip and player.Character then
        for _, p in pairs(player.Character:GetDescendants()) do
            if p:IsA("BasePart") then p.CanCollide = false end
        end
    end
end)

-- ===== Info =====
makeBtn(InfoPage, "نسخ رابط قناتي", function()
    setclipboard(TELEGRAM)
end)
makeBtn(InfoPage, "إغلاق", function() ScreenGui:Destroy() end)

print("YJW HUB Loaded ✅")
print("Telegram: " .. TELEGRAM)
