-- ===== مطور يوسف | Steal an Egg =====
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local RS = game:GetService("ReplicatedStorage")
local P = Players.LocalPlayer
local PG = P:WaitForChild("PlayerGui")
local Cam = workspace.CurrentCamera

local old = PG:FindFirstChild("YousefHub")
if old then old:Destroy() end

local GUI = Instance.new("ScreenGui")
GUI.Name = "YousefHub"
GUI.ResetOnSpawn = false
GUI.Parent = PG

-- الألوان
local RED = Color3.fromRGB(220, 38, 38)
local BG = Color3.fromRGB(15, 15, 20)
local ITEM = Color3.fromRGB(35, 35, 45)
local GREEN = Color3.fromRGB(60, 220, 100)
local GRAY = Color3.fromRGB(80, 80, 95)

-- الإطار الرئيسي
local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 580, 0, 380)
Main.Position = UDim2.new(0.5, -290, 0.5, -190)
Main.BackgroundColor3 = BG
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Main.Parent = GUI
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 12)

local stroke = Instance.new("UIStroke", Main)
stroke.Color = RED
stroke.Thickness = 2

-- الهيدر
local H = Instance.new("Frame", Main)
H.Size = UDim2.new(1, 0, 0, 42)
H.BackgroundColor3 = RED
H.BorderSizePixel = 0
Instance.new("UICorner", H).CornerRadius = UDim.new(0, 12)

local T = Instance.new("TextLabel", H)
T.Size = UDim2.new(1, -60, 1, 0)
T.Position = UDim2.new(0, 15, 0, 0)
T.BackgroundTransparency = 1
T.RichText = true
T.Text = '<font color="rgb(255,255,255)">⚡ مطور يوسف ⚡</font>'
T.TextColor3 = Color3.fromRGB(255, 255, 255)
T.Font = Enum.Font.GothamBlack
T.TextSize = 18
T.TextXAlignment = Enum.TextXAlignment.Left

local X = Instance.new("TextButton", H)
X.Size = UDim2.new(0, 30, 0, 30)
X.Position = UDim2.new(1, -38, 0, 6)
X.BackgroundColor3 = Color3.fromRGB(150, 20, 20)
X.Text = "✕"
X.TextColor3 = Color3.fromRGB(255, 255, 255)
X.Font = Enum.Font.GothamBold
Instance.new("UICorner", X).CornerRadius = UDim.new(0, 6)
X.MouseButton1Click:Connect(function() GUI:Destroy() end)

-- الأعمدة
local LT = Instance.new("Frame", Main)
LT.Size = UDim2.new(0, 115, 1, -55)
LT.Position = UDim2.new(0, 8, 0, 50)
LT.BackgroundTransparency = 1
local LL = Instance.new("UIListLayout", LT)
LL.Padding = UDim.new(0, 5)

local C = Instance.new("Frame", Main)
C.Size = UDim2.new(1, -135, 1, -55)
C.Position = UDim2.new(0, 128, 0, 50)
C.BackgroundColor3 = Color3.fromRGB(25, 25, 32)
C.BorderSizePixel = 0
Instance.new("UICorner", C).CornerRadius = UDim.new(0, 8)

local Sc = Instance.new("ScrollingFrame", C)
Sc.Size = UDim2.new(1, -10, 1, -10)
Sc.Position = UDim2.new(0, 5, 0, 5)
Sc.BackgroundTransparency = 1
Sc.BorderSizePixel = 0
Sc.ScrollBarThickness = 3
Sc.CanvasSize = UDim2.new(0, 0, 0, 0)
Sc.AutomaticCanvasSize = Enum.AutomaticSize.Y
local CL = Instance.new("UIListLayout", Sc)
CL.Padding = UDim.new(0, 7)

-- دوال المساعدة
local function mkTab(txt, cb)
    local b = Instance.new("TextButton", LT)
    b.Size = UDim2.new(1, 0, 0, 40)
    b.BackgroundColor3 = RED
    b.Text = txt
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    b.Font = Enum.Font.GothamBold
    b.TextSize = 13
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 6)
    b.MouseButton1Click:Connect(cb)
end

local function mkTog(par, txt, def, cb)
    local f = Instance.new("Frame", par)
    f.Size = UDim2.new(1, -8, 0, 44)
    f.BackgroundColor3 = ITEM
    f.BorderSizePixel = 0
    Instance.new("UICorner", f).CornerRadius = UDim.new(0, 7)
    local l = Instance.new("TextLabel", f)
    l.Size = UDim2.new(1, -70, 1, 0)
    l.Position = UDim2.new(0, 12, 0, 0)
    l.BackgroundTransparency = 1
    l.Text = txt
    l.TextColor3 = Color3.fromRGB(255, 255, 255)
    l.Font = Enum.Font.Gotham
    l.TextSize = 12
    l.TextXAlignment = Enum.TextXAlignment.Left
    local b = Instance.new("TextButton", f)
    b.Size = UDim2.new(0, 46, 0, 22)
    b.Position = UDim2.new(1, -54, 0.5, -11)
    b.BackgroundColor3 = def and GREEN or GRAY
    b.Text = ""
    b.AutoButtonColor = false
    Instance.new("UICorner", b).CornerRadius = UDim.new(1, 0)
    local d = Instance.new("Frame", b)
    d.Size = UDim2.new(0, 16, 0, 16)
    d.Position = def and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)
    d.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", d).CornerRadius = UDim.new(1, 0)
    local s = def
    b.MouseButton1Click:Connect(function()
        s = not s
        b.BackgroundColor3 = s and GREEN or GRAY
        d.Position = s and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)
        cb(s)
    end)
end

local function mkBtn(par, txt, cb)
    local b = Instance.new("TextButton", par)
    b.Size = UDim2.new(1, -8, 0, 38)
    b.BackgroundColor3 = RED
    b.Text = txt
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    b.Font = Enum.Font.GothamBold
    b.TextSize = 12
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 7)
    b.MouseButton1Click:Connect(cb)
end

local function mkSlide(par, txt, min, max, def, cb)
    local f = Instance.new("Frame", par)
    f.Size = UDim2.new(1, -8, 0, 55)
    f.BackgroundColor3 = ITEM
    f.BorderSizePixel = 0
    Instance.new("UICorner", f).CornerRadius = UDim.new(0, 7)
    local l = Instance.new("TextLabel", f)
    l.Size = UDim2.new(1, -20, 0, 20)
    l.Position = UDim2.new(0, 12, 0, 6)
    l.BackgroundTransparency = 1
    l.Text = txt .. ": " .. def
    l.TextColor3 = Color3.fromRGB(255, 255, 255)
    l.Font = Enum.Font.Gotham
    l.TextSize = 12
    l.TextXAlignment = Enum.TextXAlignment.Left
    local bar = Instance.new("Frame", f)
    bar.Size = UDim2.new(1, -24, 0, 8)
    bar.Position = UDim2.new(0, 12, 0, 34)
    bar.BackgroundColor3 = Color3.fromRGB(60, 60, 75)
    Instance.new("UICorner", bar).CornerRadius = UDim.new(1, 0)
    local fill = Instance.new("Frame", bar)
    fill.Size = UDim2.new((def - min) / (max - min), 0, 1, 0)
    fill.BackgroundColor3 = RED
    Instance.new("UICorner", fill).CornerRadius = UDim.new(1, 0)
    local drag = false
    local function upd(i)
        local x = math.clamp((i.Position.X - bar.AbsolutePosition.X) / bar.AbsoluteSize.X, 0, 1)
        local v = math.floor(min + (max - min) * x)
        fill.Size = UDim2.new(x, 0, 1, 0)
        l.Text = txt .. ": " .. v
        cb(v)
    end
    bar.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
            drag = true; upd(i)
        end
    end)
    bar.InputEnded:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
            drag = false
        end
    end)
    UIS.InputChanged:Connect(function(i)
        if drag and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then
            upd(i)
        end
    end)
end

local function mkPage()
    local p = Instance.new("Frame", Sc)
    p.Size = UDim2.new(1, 0, 0, 0)
    p.AutomaticSize = Enum.AutomaticSize.Y
    p.BackgroundTransparency = 1
    p.Visible = false
    local l = Instance.new("UIListLayout", p)
    l.Padding = UDim.new(0, 7)
    return p
end

local P1 = mkPage()
local P2 = mkPage()
local P3 = mkPage()
local P4 = mkPage()
local pages = {P1, P2, P3, P4}

local function show(p)
    for _, x in pairs(pages) do x.Visible = false end
    p.Visible = true
end

mkTab("⚡ سرقة", function() show(P1) end)
mkTab("🎮 لاعب", function() show(P2) end)
mkTab("🥚 البيض", function() show(P3) end)
mkTab("⚙️ إعدادات", function() show(P4) end)
show(P1)

-- ===== تبويب السرقة =====
local autoSteal = false
local stealSpeed = 0.1
local stealRange = 1000

mkTog(P1, "⚡ سرقة فورية", false, function(v) autoSteal = v end)
mkSlide(P1, "سرعة السرقة (ثانية/10)", 1, 10, 1, function(v) stealSpeed = v / 10 end)
mkSlide(P1, "مدى السرقة", 100, 3000, 1000, function(v) stealRange = v end)

task.spawn(function()
    while task.wait(stealSpeed) do
        if autoSteal and P.Character then
            local hrp = P.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                local closest, dist = nil, math.huge
                for _, o in pairs(workspace:GetDescendants()) do
                    if o:IsA("BasePart") then
                        local n = string.lower(o.Name)
                        if string.find(n, "egg") and not string.find(n, "ui") then
                            local d = (o.Position - hrp.Position).Magnitude
                            if d < dist and d < stealRange then
                                dist = d; closest = o
                            end
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

mkBtn(P1, "💰 بيع كل البيض", function()
    for _, o in pairs(RS:GetDescendants()) do
        if o:IsA("RemoteEvent") or o:IsA("RemoteFunction") then
            if string.find(string.lower(o.Name), "sell") then
                pcall(function() o:FireServer() end)
            end
        end
    end
end)

mkBtn(P1, "🥚 فقس البيض", function()
    for _, o in pairs(RS:GetDescendants()) do
        if o:IsA("RemoteEvent") or o:IsA("RemoteFunction") then
            if string.find(string.lower(o.Name), "hatch") then
                pcall(function() o:FireServer() end)
            end
        end
    end
end)

-- ===== تبويب اللاعب =====
local speed = 16
local jump = 50
_G.infJ = false
_G.fly = false
_G.nc = false
_G.flySp = 80

mkSlide(P2, "🏃 السرعة", 16, 300, 16, function(v) speed = v end)
mkSlide(P2, "🦘 القفز", 50, 500, 50, function(v) jump = v end)
mkTog(P2, "🦅 قفز لا نهائي", false, function(v) _G.infJ = v end)
mkTog(P2, "✈️ طيران", false, function(v) _G.fly = v end)
mkSlide(P2, "⚡ سرعة الطيران", 20, 300, 80, function(v) _G.flySp = v end)
mkTog(P2, "👻 Noclip", false, function(v) _G.nc = v end)

task.spawn(function()
    while task.wait(0.1) do
        local c = P.Character
        if c then
            local h = c:FindFirstChildOfClass("Humanoid")
            if h then h.WalkSpeed = speed; h.JumpPower = jump end
        end
    end
end)

UIS.JumpRequest:Connect(function()
    if _G.infJ then
        local c = P.Character
        if c and c:FindFirstChildOfClass("Humanoid") then
            c:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
        end
    end
end)

RunService.Stepped:Connect(function()
    if _G.nc and P.Character then
        for _, p in pairs(P.Character:GetDescendants()) do
            if p:IsA("BasePart") then p.CanCollide = false end
        end
    end
end)

task.spawn(function()
    while task.wait() do
        if _G.fly then
            local c = P.Character
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
                        if UIS:IsKeyDown(Enum.KeyCode.W) then m = m + Cam.CFrame.LookVector end
                        if UIS:IsKeyDown(Enum.KeyCode.S) then m = m - Cam.CFrame.LookVector end
                        if UIS:IsKeyDown(Enum.KeyCode.A) then m = m - Cam.CFrame.RightVector end
                        if UIS:IsKeyDown(Enum.KeyCode.D) then m = m + Cam.CFrame.RightVector end
                        if UIS:IsKeyDown(Enum.KeyCode.Space) then m = m + Vector3.new(0,1,0) end
                        v.Velocity = m * _G.flySp
                    end
                end
            end
        end
    end
end)

-- ===== تبويب البيض =====
local esp = false
local list = {}

local function clearE()
    for _, g in pairs(list) do if g and g.Parent then g:Destroy() end end
    list = {}
end

local function addE(part, txt)
    if list[part] then return end
    local bb = Instance.new("BillboardGui", part)
    bb.Size = UDim2.new(0, 170, 0, 40)
    bb.StudsOffset = Vector3.new(0, 3, 0)
    bb.AlwaysOnTop = true
    local l = Instance.new("TextLabel", bb)
    l.Size = UDim2.new(1, 0, 1, 0)
    l.BackgroundTransparency = 0.3
    l.BackgroundColor3 = Color3.fromRGB(0,0,0)
    l.TextColor3 = Color3.fromRGB(255, 220, 50)
    l.Font = Enum.Font.GothamBold
    l.TextSize = 12
    l.Text = txt
    l.Parent = bb
    Instance.new("UICorner", l).CornerRadius = UDim.new(0, 6)
    list[part] = bb
end

local function scan()
    for _, o in pairs(workspace:GetDescendants()) do
        if o:IsA("Model") or o:IsA("BasePart") then
            local n = string.lower(o.Name)
            if string.find(n, "egg") and not string.find(n, "ui") then
                local p = o:IsA("BasePart") and o or o:FindFirstChildWhichIsA("BasePart")
                if p and not list[p] then
                    addE(p, "🥚 " .. o.Name)
                end
            end
        end
    end
end

mkTog(P3, "👁️ عرض البيض (ESP)", false, function(v)
    esp = v
    if not v then clearE() end
end)

task.spawn(function()
    while task.wait(1.5) do if esp then scan() end end
end)

mkBtn(P3, "🚀 روح لأقرب بيضة", function()
    local c = P.Character
    if not c then return end
    local hrp = c:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    local cl, d = nil, math.huge
    for _, o in pairs(workspace:GetDescendants()) do
        if o:IsA("BasePart") and string.find(string.lower(o.Name), "egg") then
            local dd = (o.Position - hrp.Position).Magnitude
            if dd < d then d = dd; cl = o end
        end
    end
    if cl then pcall(function() hrp.CFrame = cl.CFrame + Vector3.new(0, 3, 0) end) end
end)

-- ===== تبويب الإعدادات =====
mkBtn(P4, "📋 نسخ رابط قناتي", function()
    setclipboard("https://t.me/YJW_m")
end)

mkBtn(P4, "🔄 إعادة تشغيل", function()
    game:GetService("TeleportService"):Teleport(game.PlaceId, P)
end)

mkBtn(P4, "❌ إغلاق", function() GUI:Destroy() end)

print("⚡ مطور يوسف Loaded | Steal an Egg")
print("Telegram: https://t.me/YJW_m")
