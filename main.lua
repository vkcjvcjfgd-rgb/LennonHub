-- ===== YJW HUB | Steal an Egg =====
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local RS = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local old = playerGui:FindFirstChild("YJW_Hub")
if old then old:Destroy() end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "YJW_Hub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = playerGui

-- ===== ألوان =====
local COLOR_BG = Color3.fromRGB(15, 15, 20)
local COLOR_HEADER = Color3.fromRGB(124, 58, 237)   -- بنفسجي
local COLOR_TAB = Color3.fromRGB(45, 35, 70)
local COLOR_TAB_HOVER = Color3.fromRGB(90, 60, 160)
local COLOR_CONTENT = Color3.fromRGB(22, 22, 30)
local COLOR_ITEM = Color3.fromRGB(35, 35, 48)
local COLOR_GREEN = Color3.fromRGB(80, 220, 120)
local COLOR_GRAY = Color3.fromRGB(90, 90, 105)
local COLOR_TEXT = Color3.fromRGB(255, 255, 255)

-- ===== الإطار الرئيسي =====
local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 580, 0, 380)
Main.Position = UDim2.new(0.5, -290, 0.5, -190)
Main.BackgroundColor3 = COLOR_BG
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Main.Parent = ScreenGui
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 14)

-- ظل خارجي
local shadow = Instance.new("ImageLabel")
shadow.Size = UDim2.new(1, 40, 1, 40)
shadow.Position = UDim2.new(0, -20, 0, -20)
shadow.BackgroundTransparency = 1
shadow.Image = "rbxassetid://6014261993"
shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
shadow.ImageTransparency = 0.5
shadow.ScaleType = Enum.ScaleType.Slice
shadow.SliceCenter = Rect.new(49, 49, 450, 450)
shadow.ZIndex = -1
shadow.Parent = Main

-- ===== الهيدر =====
local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 45)
Header.BackgroundColor3 = COLOR_HEADER
Header.BorderSizePixel = 0
Header.Parent = Main
Instance.new("UICorner", Header).CornerRadius = UDim.new(0, 14)

-- شعار دائري
local Logo = Instance.new("Frame")
Logo.Size = UDim2.new(0, 30, 0, 30)
Logo.Position = UDim2.new(0, 12, 0.5, -15)
Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Logo.Parent = Header
Instance.new("UICorner", Logo).CornerRadius = UDim.new(1, 0)

local LogoText = Instance.new("TextLabel")
LogoText.Size = UDim2.new(1, 0, 1, 0)
LogoText.BackgroundTransparency = 1
LogoText.Text = "Y"
LogoText.TextColor3 = COLOR_HEADER
LogoText.Font = Enum.Font.GothamBlack
LogoText.TextSize = 18
LogoText.Parent = Logo

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -100, 1, 0)
Title.Position = UDim2.new(0, 52, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "YJW HUB"
Title.TextColor3 = COLOR_TEXT
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Header

local SubTitle = Instance.new("TextLabel")
SubTitle.Size = UDim2.new(1, -100, 0, 12)
SubTitle.Position = UDim2.new(0, 52, 1, -16)
SubTitle.BackgroundTransparency = 1
SubTitle.Text = "by yousef | t.me/YJW_m"
SubTitle.TextColor3 = Color3.fromRGB(220, 200, 255)
SubTitle.Font = Enum.Font.Gotham
SubTitle.TextSize = 10
SubTitle.TextXAlignment = Enum.TextXAlignment.Left
SubTitle.Parent = Header

-- زر الإغلاق
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 32, 0, 32)
CloseBtn.Position = UDim2.new(1, -40, 0.5, -16)
CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.BackgroundTransparency = 0.85
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = COLOR_TEXT
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 16
CloseBtn.Parent = Header
Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(1, 0)
CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

-- ===== الأعمدة =====
local LeftTabs = Instance.new("Frame")
LeftTabs.Size = UDim2.new(0, 110, 1, -55)
LeftTabs.Position = UDim2.new(0, 10, 0, 50)
LeftTabs.BackgroundTransparency = 1
LeftTabs.Parent = Main
local LL = Instance.new("UIListLayout", LeftTabs)
LL.Padding = UDim.new(0, 6)

local RightBtns = Instance.new("Frame")
RightBtns.Size = UDim2.new(0, 110, 1, -55)
RightBtns.Position = UDim2.new(1, -120, 0, 50)
RightBtns.BackgroundTransparency = 1
RightBtns.Parent = Main
local RL = Instance.new("UIListLayout", RightBtns)
RL.Padding = UDim.new(0, 6)

-- ===== المحتوى =====
local Content = Instance.new("Frame")
Content.Size = UDim2.new(1, -260, 1, -55)
Content.Position = UDim2.new(0, 130, 0, 50)
Content.BackgroundColor3 = COLOR_CONTENT
Content.BorderSizePixel = 0
Content.Parent = Main
Instance.new("UICorner", Content).CornerRadius = UDim.new(0, 10)

local Scroll = Instance.new("ScrollingFrame")
Scroll.Size = UDim2.new(1, -10, 1, -10)
Scroll.Position = UDim2.new(0, 5, 0, 5)
Scroll.BackgroundTransparency = 1
Scroll.BorderSizePixel = 0
Scroll.ScrollBarThickness = 3
Scroll.ScrollBarImageColor3 = COLOR_HEADER
Scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
Scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
Scroll.Parent = Content
local CL = Instance.new("UIListLayout", Scroll)
CL.Padding = UDim.new(0, 8)

-- ===== دوال مساعدة =====
local function makeTab(parent, text, cb)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(1, 0, 0, 42)
    b.BackgroundColor3 = COLOR_TAB
    b.Text = ""
    b.AutoButtonColor = false
    b.Parent = parent
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 8)

    local l = Instance.new("TextLabel")
    l.Size = UDim2.new(1, 0, 1, 0)
    l.BackgroundTransparency = 1
    l.Text = text
    l.TextColor3 = COLOR_TEXT
    l.Font = Enum.Font.GothamBold
    l.TextSize = 14
    l.Parent = b

    b.MouseEnter:Connect(function()
        b.BackgroundColor3 = COLOR_TAB_HOVER
    end)
    b.MouseLeave:Connect(function()
        b.BackgroundColor3 = COLOR_TAB
    end)
    b.MouseButton1Click:Connect(cb)
end

local function makeToggle(parent, text, default, cb)
    local f = Instance.new("Frame")
    f.Size = UDim2.new(1, -10, 0, 50)
    f.BackgroundColor3 = COLOR_ITEM
    f.BorderSizePixel = 0
    f.Parent = parent
    Instance.new("UICorner", f).CornerRadius = UDim.new(0, 8)

    local l = Instance.new("TextLabel")
    l.Size = UDim2.new(1, -80, 1, 0)
    l.Position = UDim2.new(0, 12, 0, 0)
    l.BackgroundTransparency = 1
    l.Text = text
    l.TextColor3 = COLOR_TEXT
    l.Font = Enum.Font.Gotham
    l.TextSize = 13
    l.TextXAlignment = Enum.TextXAlignment.Left
    l.Parent = f

    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0, 50, 0, 26)
    b.Position = UDim2.new(1, -62, 0.5, -13)
    b.BackgroundColor3 = default and COLOR_GREEN or COLOR_GRAY
    b.Text = ""
    b.AutoButtonColor = false
    b.Parent = f
    Instance.new("UICorner", b).CornerRadius = UDim.new(1, 0)

    local d = Instance.new("Frame")
    d.Size = UDim2.new(0, 20, 0, 20)
    d.Position = default and UDim2.new(1, -22, 0.5, -10) or UDim2.new(0, 2, 0.5, -10)
    d.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    d.Parent = b
    Instance.new("UICorner", d).CornerRadius = UDim.new(1, 0)

    local state = default
    b.MouseButton1Click:Connect(function()
        state = not state
        b.BackgroundColor3 = state and COLOR_GREEN or COLOR_GRAY
        d.Position = state and UDim2.new(1, -22, 0.5, -10) or UDim2.new(0, 2, 0.5, -10)
        cb(state)
    end)
end

local function makeBtn(parent, text, cb)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(1, -10, 0, 42)
    b.BackgroundColor3 = COLOR_HEADER
    b.Text = text
    b.TextColor3 = COLOR_TEXT
    b.Font = Enum.Font.GothamBold
    b.TextSize = 13
    b.AutoButtonColor = true
    b.Parent = parent
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 8)
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

makeTab(LeftTabs, "🏠 Farm", function() show(FarmPage) end)
makeTab(LeftTabs, "🎮 Player", function() show(PlayerPage) end)
makeTab(LeftTabs, "🥚 Eggs", function() show(EggPage) end)
makeTab(RightBtns, "📱 Telegram", function()
    setclipboard("https://t.me/YJW_m")
end)
makeTab(RightBtns, "❌ Close", function() ScreenGui:Destroy() end)

show(FarmPage)

-- ============================================
-- ===== Farm =====
-- ============================================
local autoSteal = false
local autoSell = false

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

makeToggle(FarmPage, "🥷 سرقة تلقائية", false, function(v) autoSteal = v end)
makeToggle(FarmPage, "💰 بيع تلقائي", false, function(v) autoSell = v end)
makeToggle(FarmPage, "🥚 فقس تلقائي", false, function(v) end)

task.spawn(function()
    while task.wait(1) do
        if autoSteal and player.Character then
            local hrp = player.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                local closest, dist = nil, math.huge
                for _, obj in pairs(workspace:GetDescendants()) do
                    if obj:IsA("BasePart") then
                        local n = string.lower(obj.Name)
                        if string.find(n, "egg") then
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

task.spawn(function()
    while task.wait(2) do
        if autoSell then
            local remote = findRemote("Sell")
            if remote then pcall(function() remote:FireServer() end) end
        end
    end
end)

-- ============================================
-- ===== Player =====
-- ============================================
_G.infJump = false
_G.fly = false
_G.noclip = false

makeToggle(PlayerPage, "🦅 قفز لا نهائي", false, function(v) _G.infJump = v end)
makeToggle(PlayerPage, "✈️ طيران", false, function(v) _G.fly = v end)
makeToggle(PlayerPage, "👻 Noclip", false, function(v) _G.noclip = v end)

task.spawn(function()
    while task.wait(0.1) do
        local c = player.Character
        if c then
            local h = c:FindFirstChildOfClass("Humanoid")
            if h then h.WalkSpeed = 16; h.JumpPower = 50 end
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
-- ===== Eggs =====
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
    bb.Size = UDim2.new(0, 170, 0, 45)
    bb.StudsOffset = Vector3.new(0, 3, 0)
    bb.AlwaysOnTop = true
    bb.Parent = part

    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1, 0, 1, 0)
    lbl.BackgroundTransparency = 0.3
    lbl.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
    lbl.TextColor3 = Color3.fromRGB(200, 170, 255)
    lbl.TextStrokeTransparency = 0
    lbl.Font = Enum.Font.GothamBold
    lbl.TextSize = 13
    lbl.Text = text
    lbl.Parent = bb
    Instance.new("UICorner", lbl).CornerRadius = UDim.new(0, 6)
    espList[part] = bb
end

local function scanEggs()
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("Model") or obj:IsA("BasePart") then
            local n = string.lower(obj.Name)
            if string.find(n, "egg") then
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

makeToggle(EggPage, "👁️ عرض البيض (ESP)", false, function(v)
    espEnabled = v
    if not v then clearESP() end
end)

task.spawn(function()
    while task.wait(2) do
        if espEnabled then scanEggs() end
    end
end)

makeBtn(EggPage, "🚀 اذهب لأقرب بيضة", function()
    local c = player.Character
    if not c then return end
    local hrp = c:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    local closest, dist = nil, math.huge
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") then
            local n = string.lower(obj.Name)
            if string.find(n, "egg") then
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

print("YJW HUB Loaded ✅")
print("Telegram: https://t.me/YJW_m")
