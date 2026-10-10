-- ===== YJW HUB | Steal an Egg =====
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local RS = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- حذف النسخة القديمة
local old = playerGui:FindFirstChild("YJW_Hub")
if old then old:Destroy() end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "YJW_Hub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = playerGui

-- ===== الإطار الرئيسي =====
local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 560, 0, 360)
Main.Position = UDim2.new(0.5, -280, 0.5, -180)
Main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Main.Parent = ScreenGui
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 10)

-- ===== الهيدر =====
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
Title.Text = "YJW HUB | Steal an Egg"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18
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

-- ===== الأعمدة =====
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

-- ===== دوال مساعدة =====
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

-- ===== الصفحات =====
local FarmPage = newPage()
local PlayerPage = newPage()
local EggPage = newPage()
local pages = {FarmPage, PlayerPage, EggPage}

local function show(p)
    for _, x in pairs(pages) do x.Visible = false end
    p.Visible = true
end

makeTab(LeftTabs, "Farm", function() show(FarmPage) end)
makeTab(LeftTabs, "Player", function() show(PlayerPage) end)
makeTab(LeftTabs, "Eggs", function() show(EggPage) end)
makeTab(RightBtns, "Telegram", function()
    setclipboard("https://t.me/YJW_m")
end)
makeTab(RightBtns, "Close", function() ScreenGui:Destroy() end)

show(FarmPage)

-- ============================================
-- ===== Farm =====
-- ============================================
local autoSteal = false
local autoSell = false
local autoHatch = false

-- دالة إيجاد RemoteEvent
local function findRemote(namePart)
    for _, obj in pairs(RS:GetDescendants()) do
        if obj:IsA("RemoteEvent") or obj:IsA("RemoteFunction") then
            if string.find(string.lower(obj.Name), string.lower(namePart)) then
                return obj
            end
        end
    end
    return nil
end

makeToggle(FarmPage, "سرقة تلقائية (Auto Steal)", false, function(v) autoSteal = v end)
makeToggle(FarmPage, "بيع تلقائي (Auto Sell)", false, function(v) autoSell = v end)
makeToggle(FarmPage, "فقس تلقائي (Auto Hatch)", false, function(v) autoHatch = v end)

-- حلقة السرقة التلقائية - تنتقل لأقرب بيضة
task.spawn(function()
    while task.wait(1) do
        if autoSteal and player.Character then
            local hrp = player.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                local closest, dist = nil, math.huge
                for _, obj in pairs(workspace:GetDescendants()) do
                    if obj:IsA("BasePart") then
                        local n = string.lower(obj.Name)
                        if string.find(n, "egg") or string.find(n, "بيض") then
                            local d = (obj.Position - hrp.Position).Magnitude
                            if d < dist then dist = d; closest = obj end
                        end
                    end
                end
                if closest then
                    pcall(function()
                        hrp.CFrame = closest.CFrame + Vector3.new(0, 2, 0)
                    end)
                end
            end
        end
    end
end)

-- حلقة البيع التلقائي
task.spawn(function()
    while task.wait(2) do
        if autoSell then
            for _, namePart in pairs({"Sell", "sell", "بيع"}) do
                local remote = findRemote(namePart)
                if remote then
                    pcall(function() remote:FireServer() end)
                end
            end
        end
    end
end)

-- ============================================
-- ===== Player =====
-- ============================================
local speed = 16
local jump = 50
_G.infJump = false
_G.fly = false
_G.noclip = false

makeToggle(PlayerPage, "قفز لا نهائي", false, function(v) _G.infJump = v end)
makeToggle(PlayerPage, "طيران (Fly)", false, function(v) _G.fly = v end)
makeToggle(PlayerPage, "عبور الجدران (Noclip)", false, function(v) _G.noclip = v end)

-- تثبيت السرعة والقفز
task.spawn(function()
    while task.wait(0.1) do
        local c = player.Character
        if c then
            local h = c:FindFirstChildOfClass("Humanoid")
            if h then h.WalkSpeed = speed; h.JumpPower = jump end
        end
    end
end)

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

-- الطيران
task.spawn(function()
    while task.wait() do
        if _G.fly then
            local c = player.Character
            if c then
                local hrp = c:FindFirstChild("HumanoidRootPart")
                if hrp and not hrp:FindFirstChild("YF") then
                    local g = Instance.new("BodyGyro", hrp); g.Name = "YF"
                    g.P = 9e4; g.MaxTorque = Vector3.new(9e9,9e9,9e9); g.CFrame = hrp.CFrame
                    local v = Instance.new("BodyVelocity", hrp); v.Name = "YFV"
                    v.Velocity = Vector3.new(0,0,0); v.MaxForce = Vector3.new(9e9,9e9,9e9)
                end
                if hrp then
                    local v = hrp:FindFirstChild("YFV")
                    if v then
                        local cam = workspace.CurrentCamera
                        local m = Vector3.new(0,0,0)
                        if UIS:IsKeyDown(Enum.KeyCode.W) then m = m + cam.CFrame.LookVector end
                        if UIS:IsKeyDown(Enum.KeyCode.S) then m = m - cam.CFrame.LookVector end
                        if UIS:IsKeyDown(Enum.KeyCode.A) then m = m - cam.CFrame.RightVector end
                        if UIS:IsKeyDown(Enum.KeyCode.D) then m = m + cam.CFrame.RightVector end
                        if UIS:IsKeyDown(Enum.KeyCode.Space) then m = m + Vector3.new(0,1,0) end
                        v.Velocity = m * 60
                    end
                end
            end
        end
    end
end)

-- ============================================
-- ===== Eggs (ESP + Teleport) =====
-- ============================================
local espEnabled = false
local espList = {}

local function clearESP()
    for _, gui in pairs(espList) do
        if gui and gui.Parent then gui:Destroy() end
    end
    espList = {}
end

local function createESP(part, text)
    if espList[part] then return end
    local bb = Instance.new("BillboardGui")
    bb.Size = UDim2.new(0, 160, 0, 40)
    bb.StudsOffset = Vector3.new(0, 3, 0)
    bb.AlwaysOnTop = true
    bb.Parent = part

    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1, 0, 1, 0)
    lbl.BackgroundTransparency = 0.4
    lbl.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    lbl.TextColor3 = Color3.fromRGB(255, 220, 50)
    lbl.TextStrokeTransparency = 0
    lbl.Font = Enum.Font.GothamBold
    lbl.TextSize = 13
    lbl.Text = text
    lbl.Parent = bb
    espList[part] = bb
end

local function scanEggs()
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("Model") or obj:IsA("BasePart") then
            local n = string.lower(obj.Name)
            if string.find(n, "egg") or string.find(n, "بيض") then
                local part = obj:IsA("BasePart") and obj or obj:FindFirstChildWhichIsA("BasePart")
                if part and not espList[part] then
                    local info = "🥚 " .. obj.Name
                    for _, c in pairs(obj:GetDescendants()) do
                        if c:IsA("StringValue") or c:IsA("NumberValue") then
                            info = info .. "\n💰 " .. tostring(c.Value)
                            break
                        end
                    end
                    createESP(part, info)
                end
            end
        end
    end
end

makeToggle(EggPage, "عرض البيض (ESP)", false, function(v)
    espEnabled = v
    if not v then clearESP() end
end)

task.spawn(function()
    while task.wait(2) do
        if espEnabled then scanEggs() end
    end
end)

-- زر الانتقال لأقرب بيضة
makeBtn(EggPage, "🚀 اذهب لأقرب بيضة", function()
    local c = player.Character
    if not c then return end
    local hrp = c:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    local closest, dist = nil, math.huge
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") then
            local n = string.lower(obj.Name)
            if string.find(n, "egg") or string.find(n, "بيض") then
                local d = (obj.Position - hrp.Position).Magnitude
                if d < dist then dist = d; closest = obj end
            end
        end
    end
    if closest then
        pcall(function()
            hrp.CFrame = closest.CFrame + Vector3.new(0, 3, 0)
        end)
    end
end)

makeBtn(EggPage, "📋 نسخ رابط قناتي", function()
    setclipboard("https://t.me/YJW_m")
end)

print("YJW HUB | Steal an Egg Loaded ✅")
print("Telegram: https://t.me/YJW_m")
