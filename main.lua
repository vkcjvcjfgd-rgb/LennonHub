-- ===== YJW HUB | Steal an Egg | POWERED =====
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local RS = game:GetService("ReplicatedStorage")
local TPS = game:GetService("TeleportService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local cam = workspace.CurrentCamera

local old = playerGui:FindFirstChild("YJW_Hub")
if old then old:Destroy() end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "YJW_Hub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = playerGui

-- ===== الإطار الرئيسي =====
local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 600, 0, 400)
Main.Position = UDim2.new(0.5, -300, 0.5, -200)
Main.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Main.Parent = ScreenGui
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 12)

-- الهيدر
local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 42)
Header.BackgroundColor3 = Color3.fromRGB(200, 30, 30)
Header.BorderSizePixel = 0
Header.Parent = Main
Instance.new("UICorner", Header).CornerRadius = UDim.new(0, 12)

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -60, 1, 0)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "⚡ YJW HUB | POWERED ⚡"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Header

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 32, 0, 32)
CloseBtn.Position = UDim2.new(1, -40, 0.5, -16)
CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.BackgroundTransparency = 0.85
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 16
CloseBtn.Parent = Header
Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(1, 0)
CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

-- ===== الأعمدة =====
local LeftTabs = Instance.new("Frame")
LeftTabs.Size = UDim2.new(0, 115, 1, -55)
LeftTabs.Position = UDim2.new(0, 8, 0, 48)
LeftTabs.BackgroundTransparency = 1
LeftTabs.Parent = Main
local LL = Instance.new("UIListLayout", LeftTabs)
LL.Padding = UDim.new(0, 5)

local RightBtns = Instance.new("Frame")
RightBtns.Size = UDim2.new(0, 115, 1, -55)
RightBtns.Position = UDim2.new(1, -123, 0, 48)
RightBtns.BackgroundTransparency = 1
RightBtns.Parent = Main
local RL = Instance.new("UIListLayout", RightBtns)
RL.Padding = UDim.new(0, 5)

local Content = Instance.new("Frame")
Content.Size = UDim2.new(1, -255, 1, -55)
Content.Position = UDim2.new(0, 128, 0, 48)
Content.BackgroundColor3 = Color3.fromRGB(28, 28, 33)
Content.BorderSizePixel = 0
Content.Parent = Main
Instance.new("UICorner", Content).CornerRadius = UDim.new(0, 8)

local Scroll = Instance.new("ScrollingFrame")
Scroll.Size = UDim2.new(1, -10, 1, -10)
Scroll.Position = UDim2.new(0, 5, 0, 5)
Scroll.BackgroundTransparency = 1
Scroll.BorderSizePixel = 0
Scroll.ScrollBarThickness = 3
Scroll.ScrollBarImageColor3 = Color3.fromRGB(200, 30, 30)
Scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
Scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
Scroll.Parent = Content
local CL = Instance.new("UIListLayout", Scroll)
CL.Padding = UDim.new(0, 7)

-- ===== دوال مساعدة =====
local function makeTab(parent, text, cb)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(1, 0, 0, 40)
    b.BackgroundColor3 = Color3.fromRGB(180, 30, 30)
    b.Text = text
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    b.Font = Enum.Font.GothamBold
    b.TextSize = 13
    b.AutoButtonColor = true
    b.Parent = parent
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 6)
    b.MouseButton1Click:Connect(cb)
end

local function makeToggle(parent, text, default, cb)
    local f = Instance.new("Frame")
    f.Size = UDim2.new(1, -8, 0, 42)
    f.BackgroundColor3 = Color3.fromRGB(42, 42, 48)
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
    l.TextSize = 12
    l.TextXAlignment = Enum.TextXAlignment.Left
    l.Parent = f

    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0, 45, 0, 22)
    b.Position = UDim2.new(1, -53, 0.5, -11)
    b.BackgroundColor3 = default and Color3.fromRGB(60, 200, 60) or Color3.fromRGB(90, 90, 90)
    b.Text = ""
    b.AutoButtonColor = false
    b.Parent = f
    Instance.new("UICorner", b).CornerRadius = UDim.new(1, 0)

    local d = Instance.new("Frame")
    d.Size = UDim2.new(0, 16, 0, 16)
    d.Position = default and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)
    d.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    d.Parent = b
    Instance.new("UICorner", d).CornerRadius = UDim.new(1, 0)

    local state = default
    b.MouseButton1Click:Connect(function()
        state = not state
        b.BackgroundColor3 = state and Color3.fromRGB(60, 200, 60) or Color3.fromRGB(90, 90, 90)
        d.Position = state and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)
        cb(state)
    end)
end

local function makeBtn(parent, text, cb)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(1, -8, 0, 38)
    b.BackgroundColor3 = Color3.fromRGB(180, 30, 30)
    b.Text = text
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    b.Font = Enum.Font.GothamBold
    b.TextSize = 12
    b.Parent = parent
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 6)
    b.MouseButton1Click:Connect(cb)
end

local function makeSlider(parent, text, min, max, default, cb)
    local f = Instance.new("Frame")
    f.Size = UDim2.new(1, -8, 0, 55)
    f.BackgroundColor3 = Color3.fromRGB(42, 42, 48)
    f.BorderSizePixel = 0
    f.Parent = parent
    Instance.new("UICorner", f).CornerRadius = UDim.new(0, 6)

    local l = Instance.new("TextLabel")
    l.Size = UDim2.new(1, -10, 0, 20)
    l.Position = UDim2.new(0, 10, 0, 5)
    l.BackgroundTransparency = 1
    l.Text = text .. ": " .. default
    l.TextColor3 = Color3.fromRGB(255, 255, 255)
    l.Font = Enum.Font.Gotham
    l.TextSize = 12
    l.TextXAlignment = Enum.TextXAlignment.Left
    l.Parent = f

    local bar = Instance.new("Frame")
    bar.Size = UDim2.new(1, -20, 0, 8)
    bar.Position = UDim2.new(0, 10, 0, 32)
    bar.BackgroundColor3 = Color3.fromRGB(70, 70, 80)
    bar.Parent = f
    Instance.new("UICorner", bar).CornerRadius = UDim.new(1, 0)

    local fill = Instance.new("Frame")
    fill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
    fill.BackgroundColor3 = Color3.fromRGB(200, 30, 30)
    fill.Parent = bar
    Instance.new("UICorner", fill).CornerRadius = UDim.new(1, 0)

    local dragging = false

    local function update(input)
        local x = math.clamp((input.Position.X - bar.AbsolutePosition.X) / bar.AbsoluteSize.X, 0, 1)
        local val = math.floor(min + (max - min) * x)
        fill.Size = UDim2.new(x, 0, 1, 0)
        l.Text = text .. ": " .. val
        cb(val)
    end

    bar.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            update(i)
        end
    end)
    bar.InputEnded:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
    UIS.InputChanged:Connect(function(i)
        if dragging and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then
            update(i)
        end
    end)
end

local function newPage()
    local p = Instance.new("Frame")
    p.Size = UDim2.new(1, 0, 0, 0)
    p.AutomaticSize = Enum.AutomaticSize.Y
    p.BackgroundTransparency = 1
    p.Visible = false
    p.Parent = Scroll
    local l = Instance.new("UIListLayout", p)
    l.Padding = UDim.new(0, 7)
    return p
end

-- ===== الصفحات =====
local FarmPage = newPage()
local StealPage = newPage()
local PlayerPage = newPage()
local EggPage = newPage()
local MiscPage = newPage()
local pages = {FarmPage, StealPage, PlayerPage, EggPage, MiscPage}

local function show(p)
    for _, x in pairs(pages) do x.Visible = false end
    p.Visible = true
end

makeTab(LeftTabs, "🌾 Farm", function() show(FarmPage) end)
makeTab(LeftTabs, "🥷 Steal", function() show(StealPage) end)
makeTab(LeftTabs, "🎮 Player", function() show(PlayerPage) end)
makeTab(LeftTabs, "🥚 Eggs", function() show(EggPage) end)
makeTab(LeftTabs, "⚙️ Misc", function() show(MiscPage) end)
makeTab(RightBtns, "📱 Telegram", function() setclipboard("https://t.me/YJW_m") end)
makeTab(RightBtns, "🔄 Rejoin", function() TPS:Teleport(game.PlaceId, player) end)
makeTab(RightBtns, "🏠 ServerHop", function()
    local servers = game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")
    local data = game:GetService("HttpService"):JSONDecode(servers)
    for _, s in pairs(data.data) do
        if s.playing < s.maxPlayers and s.id ~= game.JobId then
            TPS:TeleportToPlaceInstance(game.PlaceId, s.id, player)
            return
        end
    end
end)
makeTab(RightBtns, "❌ Close", function() ScreenGui:Destroy() end)

show(FarmPage)

-- ============================================
-- ===== Farm =====
-- ============================================
local autoSell = false
local autoHatch = false
local autoCollect = false
local sellDelay = 3
local hatchDelay = 5

local function findRemote(...)
    local names = {...}
    for _, obj in pairs(RS:GetDescendants()) do
        if obj:IsA("RemoteEvent") or obj:IsA("RemoteFunction") then
            local lower = string.lower(obj.Name)
            for _, n in pairs(names) do
                if string.find(lower, string.lower(n)) then
                    return obj
                end
            end
        end
    end
    return nil
end

makeToggle(FarmPage, "💰 بيع تلقائي (Auto Sell)", false, function(v) autoSell = v end)
makeSlider(FarmPage, "سرعة البيع (ثواني)", 1, 30, 3, function(v) sellDelay = v end)
makeToggle(FarmPage, "🥚 فقس تلقائي (Auto Hatch)", false, function(v) autoHatch = v end)
makeSlider(FarmPage, "سرعة الفقس (ثواني)", 1, 30, 5, function(v) hatchDelay = v end)
makeToggle(FarmPage, "📦 جمع تلقائي (Auto Collect)", false, function(v) autoCollect = v end)

-- البيع
task.spawn(function()
    while task.wait(sellDelay) do
        if autoSell then
            local r = findRemote("Sell", "SellAll", "بيع")
            if r then pcall(function() r:FireServer() end) end
        end
    end
end)

-- الفقس
task.spawn(function()
    while task.wait(hatchDelay) do
        if autoHatch then
            local r = findRemote("Hatch", "HatchEgg", "فقس")
            if r then pcall(function() r:FireServer() end) end
        end
    end
end)

-- الجمع
task.spawn(function()
    while task.wait(1) do
        if autoCollect and player.Character then
            local hrp = player.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                for _, obj in pairs(workspace:GetDescendants()) do
                    if obj:IsA("BasePart") then
                        local n = string.lower(obj.Name)
                        if string.find(n, "coin") or string.find(n, "cash") then
                            if (obj.Position - hrp.Position).Magnitude < 15 then
                                obj.CFrame = hrp.CFrame
                            end
                        end
                    end
                end
            end
        end
    end
end)

-- ============================================
-- ===== Steal =====
-- ============================================
local autoSteal = false
local stealSpeed = 0.5
local stealRange = 500
local stealthMode = false

makeToggle(StealPage, "🥷 سرقة تلقائية (Auto Steal)", false, function(v) autoSteal = v end)
makeSlider(StealPage, "سرعة السرقة (x10 مللي)", 1, 20, 5, function(v) stealSpeed = v / 10 end)
makeSlider(StealPage, "مدى السرقة (studs)", 50, 2000, 500, function(v) stealRange = v end)
makeToggle(StealPage, "🕵️ وضع التخفي (Slow Teleport)", false, function(v) stealthMode = v end)

task.spawn(function()
    while task.wait(stealSpeed) do
        if autoSteal and player.Character then
            local hrp = player.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                local closest, dist = nil, math.huge
                for _, obj in pairs(workspace:GetDescendants()) do
                    if obj:IsA("BasePart") then
                        local n = string.lower(obj.Name)
                        if string.find(n, "egg") then
                            local d = (obj.Position - hrp.Position).Magnitude
                            if d < dist and d < stealRange then dist = d; closest = obj end
                        end
                    end
                end
                if closest then
                    pcall(function()
                        if stealthMode then
                            hrp.CFrame = hrp.CFrame:Lerp(closest.CFrame + Vector3.new(0, 2, 0), 0.3)
                        else
                            hrp.CFrame = closest.CFrame + Vector3.new(0, 2, 0)
                        end
                    end)
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
_G.flySpeed = 60

makeSlider(PlayerPage, "🏃 السرعة", 16, 300, 16, function(v) speed = v end)
makeSlider(PlayerPage, "🦘 القفز", 50, 500, 50, function(v) jump = v end)
makeToggle(PlayerPage, "🦅 قفز لا نهائي", false, function(v) _G.infJump = v end)
makeToggle(PlayerPage, "✈️ طيران (Fly)", false, function(v) _G.fly = v end)
makeSlider(PlayerPage, "⚡ سرعة الطيران", 20, 300, 60, function(v) _G.flySpeed = v end)
makeToggle(PlayerPage, "👻 Noclip (عبور الجدران)", false, function(v) _G.noclip = v end)

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
                        local m = Vector3.new(0,0,0)
                        if UIS:IsKeyDown(Enum.KeyCode.W) then m = m + cam.CFrame.LookVector end
                        if UIS:IsKeyDown(Enum.KeyCode.S) then m = m - cam.CFrame.LookVector end
                        if UIS:IsKeyDown(Enum.KeyCode.A) then m = m - cam.CFrame.RightVector end
                        if UIS:IsKeyDown(Enum.KeyCode.D) then m = m + cam.CFrame.RightVector end
                        if UIS:IsKeyDown(Enum.KeyCode.Space) then m = m + Vector3.new(0,1,0) end
                        if UIS:IsKeyDown(Enum.KeyCode.LeftControl) then m = m - Vector3.new(0,1,0) end
                        v.Velocity = m * _G.flySpeed
                    end
                end
            end
        end
    end
end)

-- ============================================
-- ===== Eggs (ESP) =====
-- ============================================
local espEnabled = false
local espList = {}

local function clearESP()
    for _, gui in pairs(espList) do
        if gui and gui.Parent then gui:Destroy() end
    end
    espList = {}
end

local function createESP(part, text, color)
    if espList[part] then return end
    local bb = Instance.new("BillboardGui")
    bb.Size = UDim2.new(0, 180, 0, 40)
    bb.StudsOffset = Vector3.new(0, 3, 0)
    bb.AlwaysOnTop = true
    bb.Parent = part

    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1, 0, 1, 0)
    lbl.BackgroundTransparency = 0.3
    lbl.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
    lbl.TextColor3 = color or Color3.fromRGB(255, 220, 50)
    lbl.Font = Enum.Font.GothamBold
    lbl.TextSize = 12
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
                    createESP(part, info, Color3.fromRGB(255, 220, 50))
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
        pcall(function() hrp.CFrame = closest.CFrame + Vector3.new(0, 3, 0) end)
    end
end)

-- ============================================
-- ===== Misc =====
-- ============================================
makeBtn(MiscPage, "📋 نسخ رابط قناتي", function()
    setclipboard("https://t.me/YJW_m")
    print("Telegram: https://t.me/YJW_m")
end)

makeToggle(MiscPage, "🐌 خفض الجرافيك (FPS Boost)", false, function(v)
    if v then
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Smoke") or obj:IsA("Fire") or obj:IsA("Sparkles") then
                obj.Enabled = false
            end
        end
        game.Lighting.GlobalShadows = false
        game.Lighting.FogEnd = 100000
    else
        game.Lighting.GlobalShadows = true
        game.Lighting.FogEnd = 100000
    end
end)

makeBtn(MiscPage, "🔄 إعادة تشغيل اللعبة", function()
    TPS:Teleport(game.PlaceId, player)
end)

makeBtn(MiscPage, "❌ إغلاق الواجهة", function()
    ScreenGui:Destroy()
end)

print("YJW HUB | POWERED Loaded ✅")
print("Telegram: https://t.me/YJW_m")
