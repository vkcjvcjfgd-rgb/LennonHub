-- ===== مطور يوسف | Steal a Brainrot =====
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local RS = game:GetService("ReplicatedStorage")
local P = Players.LocalPlayer
local PG = P:WaitForChild("PlayerGui")
local Cam = workspace.CurrentCamera

local old = PG:FindFirstChild("YousefSAB")
if old then old:Destroy() end

local GUI = Instance.new("ScreenGui")
GUI.Name = "YousefSAB"
GUI.ResetOnSpawn = false
GUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
GUI.Parent = PG

-- الألوان (Dark Theme)
local BG = Color3.fromRGB(18, 18, 22)
local CARD = Color3.fromRGB(28, 28, 34)
local ITEM = Color3.fromRGB(38, 38, 45)
local ACCENT = Color3.fromRGB(88, 101, 242)  -- أزرق بنفسجي
local GREEN = Color3.fromRGB(60, 200, 100)
local GRAY = Color3.fromRGB(80, 80, 90)
local WHITE = Color3.fromRGB(255, 255, 255)
local GRAYTXT = Color3.fromRGB(150, 150, 160)

-- ===== الإطار الرئيسي =====
local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 320, 0, 500)
Main.Position = UDim2.new(0, 20, 0.5, -250)
Main.BackgroundColor3 = BG
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Main.Parent = GUI
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 14)

local stroke = Instance.new("UIStroke", Main)
stroke.Color = Color3.fromRGB(60, 60, 75)
stroke.Thickness = 1
stroke.Transparency = 0.5

-- ===== الهيدر =====
local Header = Instance.new("Frame", Main)
Header.Size = UDim2.new(1, -20, 0, 55)
Header.Position = UDim2.fromOffset(10, 10)
Header.BackgroundColor3 = CARD
Header.BorderSizePixel = 0
Instance.new("UICorner", Header).CornerRadius = UDim.new(0, 10)

-- شعار
local Badge = Instance.new("Frame", Header)
Badge.Size = UDim2.fromOffset(38, 38)
Badge.Position = UDim2.fromOffset(10, 8)
Badge.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
Badge.BorderSizePixel = 0
Instance.new("UICorner", Badge).CornerRadius = UDim.new(1, 0)

local BadgeStroke = Instance.new("UIStroke", Badge)
BadgeStroke.Color = GREEN
BadgeStroke.Thickness = 2

local BadgeText = Instance.new("TextLabel", Badge)
BadgeText.Size = UDim2.new(1, 0, 1, 0)
BadgeText.BackgroundTransparency = 1
BadgeText.Text = "Y"
BadgeText.TextColor3 = GREEN
BadgeText.Font = Enum.Font.GothamBlack
BadgeText.TextSize = 18

-- الاسم
local Title = Instance.new("TextLabel", Header)
Title.Position = UDim2.fromOffset(58, 10)
Title.Size = UDim2.new(1, -100, 0, 18)
Title.BackgroundTransparency = 1
Title.Text = "مطور يوسف"
Title.TextColor3 = WHITE
Title.Font = Enum.Font.GothamBold
Title.TextSize = 14
Title.TextXAlignment = Enum.TextXAlignment.Left

local Sub = Instance.new("TextLabel", Header)
Sub.Position = UDim2.fromOffset(58, 28)
Sub.Size = UDim2.new(1, -100, 0, 14)
Sub.BackgroundTransparency = 1
Sub.Text = "STEAL A BRAINROT"
Sub.TextColor3 = GRAYTXT
Sub.Font = Enum.Font.GothamBold
Sub.TextSize = 9
Sub.TextXAlignment = Enum.TextXAlignment.Left

-- زر تصغير
local Min = Instance.new("TextButton", Header)
Min.AnchorPoint = Vector2.new(1, 0)
Min.Position = UDim2.new(1, -40, 0, 10)
Min.Size = UDim2.fromOffset(26, 26)
Min.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
Min.BorderSizePixel = 0
Min.Text = "—"
Min.TextColor3 = GRAYTXT
Min.Font = Enum.Font.GothamBold
Min.TextSize = 12
Instance.new("UICorner", Min).CornerRadius = UDim.new(0, 6)

-- زر إغلاق
local Close = Instance.new("TextButton", Header)
Close.AnchorPoint = Vector2.new(1, 0)
Close.Position = UDim2.new(1, -10, 0, 10)
Close.Size = UDim2.fromOffset(26, 26)
Close.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
Close.BorderSizePixel = 0
Close.Text = "✕"
Close.TextColor3 = GRAYTXT
Close.Font = Enum.Font.GothamBold
Close.TextSize = 11
Instance.new("UICorner", Close).CornerRadius = UDim.new(0, 6)
Close.MouseButton1Click:Connect(function() GUI:Destroy() end)

Min.MouseButton1Click:Connect(function()
    Main.Visible = false
    -- إظهار زر صغير لرجوع
    local btn = Instance.new("TextButton", GUI)
    btn.Size = UDim2.fromOffset(50, 50)
    btn.Position = UDim2.fromOffset(20, 20)
    btn.BackgroundColor3 = ACCENT
    btn.Text = "Y"
    btn.TextColor3 = WHITE
    btn.Font = Enum.Font.GothamBlack
    btn.TextSize = 20
    Instance.new("UICorner", btn).CornerRadius = UDim.new(1, 0)
    btn.MouseButton1Click:Connect(function()
        Main.Visible = true
        btn:Destroy()
    end)
end)

-- ===== ScrollingFrame =====
local Scroll = Instance.new("ScrollingFrame", Main)
Scroll.Size = UDim2.new(1, -20, 1, -85)
Scroll.Position = UDim2.fromOffset(10, 75)
Scroll.BackgroundTransparency = 1
Scroll.BorderSizePixel = 0
Scroll.ScrollBarThickness = 3
Scroll.ScrollBarImageColor3 = ACCENT
Scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
Scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
local SL = Instance.new("UIListLayout", Scroll)
SL.Padding = UDim.new(0, 8)

-- ===== دوال المساعدة =====
local function mkSection(txt)
    local f = Instance.new("Frame", Scroll)
    f.Size = UDim2.new(1, -5, 0, 22)
    f.BackgroundTransparency = 1
    local l = Instance.new("TextLabel", f)
    l.Size = UDim2.new(1, 0, 1, 0)
    l.BackgroundTransparency = 1
    l.Text = "• " .. txt
    l.TextColor3 = GRAYTXT
    l.Font = Enum.Font.GothamBold
    l.TextSize = 11
    l.TextXAlignment = Enum.TextXAlignment.Left
end

local function mkToggle(par, txt, def, cb)
    local f = Instance.new("Frame", par)
    f.Size = UDim2.new(1, -5, 0, 40)
    f.BackgroundColor3 = ITEM
    f.BorderSizePixel = 0
    Instance.new("UICorner", f).CornerRadius = UDim.new(0, 8)
    
    local l = Instance.new("TextLabel", f)
    l.Size = UDim2.new(1, -70, 1, 0)
    l.Position = UDim2.fromOffset(12, 0)
    l.BackgroundTransparency = 1
    l.Text = txt
    l.TextColor3 = WHITE
    l.Font = Enum.Font.Gotham
    l.TextSize = 12
    l.TextXAlignment = Enum.TextXAlignment.Left
    
    local b = Instance.new("TextButton", f)
    b.AnchorPoint = Vector2.new(1, 0.5)
    b.Position = UDim2.new(1, -10, 0.5, 0)
    b.Size = UDim2.fromOffset(44, 22)
    b.BackgroundColor3 = def and GREEN or GRAY
    b.Text = ""
    b.AutoButtonColor = false
    Instance.new("UICorner", b).CornerRadius = UDim.new(1, 0)
    
    local d = Instance.new("Frame", b)
    d.Size = UDim2.fromOffset(16, 16)
    d.Position = def and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)
    d.BackgroundColor3 = WHITE
    Instance.new("UICorner", d).CornerRadius = UDim.new(1, 0)
    
    local s = def
    b.MouseButton1Click:Connect(function()
        s = not s
        b.BackgroundColor3 = s and GREEN or GRAY
        d.Position = s and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)
        cb(s)
    end)
    return f
end

local function mkSlider(par, txt, min, max, def, cb)
    local f = Instance.new("Frame", par)
    f.Size = UDim2.new(1, -5, 0, 55)
    f.BackgroundColor3 = ITEM
    f.BorderSizePixel = 0
    Instance.new("UICorner", f).CornerRadius = UDim.new(0, 8)
    
    local l = Instance.new("TextLabel", f)
    l.Size = UDim2.new(1, -20, 0, 18)
    l.Position = UDim2.fromOffset(12, 5)
    l.BackgroundTransparency = 1
    l.Text = txt .. ": " .. def
    l.TextColor3 = WHITE
    l.Font = Enum.Font.Gotham
    l.TextSize = 11
    l.TextXAlignment = Enum.TextXAlignment.Left
    
    local bar = Instance.new("Frame", f)
    bar.Size = UDim2.new(1, -24, 0, 6)
    bar.Position = UDim2.new(0, 12, 0, 36)
    bar.BackgroundColor3 = Color3.fromRGB(55, 55, 65)
    bar.BorderSizePixel = 0
    Instance.new("UICorner", bar).CornerRadius = UDim.new(1, 0)
    
    local fill = Instance.new("Frame", bar)
    fill.Size = UDim2.new((def - min) / (max - min), 0, 1, 0)
    fill.BackgroundColor3 = ACCENT
    fill.BorderSizePixel = 0
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

local function mkBtn(par, txt, cb)
    local b = Instance.new("TextButton", par)
    b.Size = UDim2.new(1, -5, 0, 36)
    b.BackgroundColor3 = ACCENT
    b.Text = txt
    b.TextColor3 = WHITE
    b.Font = Enum.Font.GothamBold
    b.TextSize = 12
    b.BorderSizePixel = 0
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 8)
    b.MouseButton1Click:Connect(cb)
end

-- ============================================
-- ===== الحركة =====
-- ============================================
mkSection("MOVEMENT")

local speed = 16
local jump = 50
local infJump = false
local fly = false
local noclip = false
local flySpeed = 80

mkToggle(Scroll, "Float", false, function(v) fly = v end)
mkToggle(Scroll, "Auto Right", false, function(v) 
    if v then
        _G.autoRight = true
        task.spawn(function()
            while _G.autoRight do
                task.wait(0.1)
                local c = P.Character
                if c and c:FindFirstChild("HumanoidRootPart") then
                    c.HumanoidRootPart.CFrame = c.HumanoidRootPart.CFrame + c.HumanoidRootPart.CFrame.RightVector * 1
                end
            end
        end)
    else
        _G.autoRight = false
    end
end)
mkSlider(Scroll, "Right Speed", 10, 200, 60, function(v) _G.rightSp = v end)

mkToggle(Scroll, "Auto Left", false, function(v)
    if v then
        _G.autoLeft = true
        task.spawn(function()
            while _G.autoLeft do
                task.wait(0.1)
                local c = P.Character
                if c and c:FindFirstChild("HumanoidRootPart") then
                    c.HumanoidRootPart.CFrame = c.HumanoidRootPart.CFrame - c.HumanoidRootPart.CFrame.RightVector * 1
                end
            end
        end)
    else
        _G.autoLeft = false
    end
end)
mkSlider(Scroll, "Left Speed", 10, 200, 60, function(v) _G.leftSp = v end)

mkToggle(Scroll, "قفز لا نهائي", false, function(v) infJump = v end)
mkToggle(Scroll, "Noclip", false, function(v) noclip = v end)
mkSlider(Scroll, "سرعة الطيران", 20, 300, 80, function(v) flySpeed = v end)

-- حلقة السرعة
task.spawn(function()
    while task.wait(0.1) do
        local c = P.Character
        if c then
            local h = c:FindFirstChildOfClass("Humanoid")
            if h then h.WalkSpeed = speed; h.JumpPower = jump end
        end
    end
end)

-- قفز لا نهائي
UIS.JumpRequest:Connect(function()
    if infJump then
        local c = P.Character
        if c and c:FindFirstChildOfClass("Humanoid") then
            c:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
        end
    end
end)

-- Noclip
RunService.Stepped:Connect(function()
    if noclip and P.Character then
        for _, p in pairs(P.Character:GetDescendants()) do
            if p:IsA("BasePart") then p.CanCollide = false end
        end
    end
end)

-- Fly
task.spawn(function()
    while task.wait() do
        if fly then
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
                        v.Velocity = m * flySpeed
                    end
                end
            end
        end
    end
end)

-- ============================================
-- ===== القتال =====
-- ============================================
mkSection("COMBAT")

mkToggle(Scroll, "Bat Aimbot", false, function(v)
    if v then
        _G.batAim = true
        task.spawn(function()
            while _G.batAim do
                task.wait(0.1)
                local c = P.Character
                if c then
                    local hrp = c:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        local closest, dist = nil, math.huge
                        for _, plr in pairs(Players:GetPlayers()) do
                            if plr ~= P and plr.Character then
                                local t = plr.Character:FindFirstChild("HumanoidRootPart")
                                if t then
                                    local d = (t.Position - hrp.Position).Magnitude
                                    if d < dist and d < 50 then dist = d; closest = t end
                                end
                            end
                        end
                        if closest then
                            hrp.CFrame = CFrame.new(hrp.Position, closest.Position)
                        end
                    end
                end
            end
        end)
    else
        _G.batAim = false
    end
end)

mkToggle(Scroll, "Drop Fling", false, function(v)
    if v then
        local c = P.Character
        if c then
            local hrp = c:FindFirstChild("HumanoidRootPart")
            if hrp then
                for _, obj in pairs(c:GetChildren()) do
                    if obj:IsA("Tool") then obj.Parent = workspace end
                end
            end
        end
    end
end)

-- ============================================
-- ===== الأدوات =====
-- ============================================
mkSection("UTILITIES")

mkBtn(Scroll, "📋 نسخ رابط قناتي", function()
    setclipboard("https://t.me/YJW_m")
end)

mkBtn(Scroll, "🔄 إعادة تشغيل", function()
    game:GetService("TeleportService"):Teleport(game.PlaceId, P)
end)

mkBtn(Scroll, "⚡ إعادة تحميل السكربت", function()
    GUI:Destroy()
end)

-- ===== الأزرار السفلية =====
local BottomBar = Instance.new("Frame", Main)
BottomBar.Size = UDim2.new(1, -20, 0, 35)
BottomBar.Position = UDim2.new(0, 10, 1, -45)
BottomBar.BackgroundColor3 = CARD
BottomBar.BorderSizePixel = 0
Instance.new("UICorner", BottomBar).CornerRadius = UDim.new(0, 10)

local StatusDot = Instance.new("Frame", BottomBar)
StatusDot.Size = UDim2.fromOffset(8, 8)
StatusDot.Position = UDim2.fromOffset(12, 13)
StatusDot.BackgroundColor3 = GREEN
StatusDot.BorderSizePixel = 0
Instance.new("UICorner", StatusDot).CornerRadius = UDim.new(1, 0)

local StatusTxt = Instance.new("TextLabel", BottomBar)
StatusTxt.Position = UDim2.fromOffset(26, 0)
StatusTxt.Size = UDim2.new(1, -100, 1, 0)
StatusTxt.BackgroundTransparency = 1
StatusTxt.Text = "IDLE"
StatusTxt.TextColor3 = GRAYTXT
StatusTxt.Font = Enum.Font.GothamBold
StatusTxt.TextSize = 10
StatusTxt.TextXAlignment = Enum.TextXAlignment.Left

local SaveBtn = Instance.new("TextButton", BottomBar)
SaveBtn.AnchorPoint = Vector2.new(1, 0.5)
SaveBtn.Position = UDim2.new(1, -10, 0.5, 0)
SaveBtn.Size = UDim2.fromOffset(70, 24)
SaveBtn.BackgroundColor3 = ITEM
SaveBtn.Text = "Save Pos"
SaveBtn.TextColor3 = WHITE
SaveBtn.Font = Enum.Font.GothamBold
SaveBtn.TextSize = 10
SaveBtn.BorderSizePixel = 0
Instance.new("UICorner", SaveBtn).CornerRadius = UDim.new(0, 6)

local savedPos = nil
SaveBtn.MouseButton1Click:Connect(function()
    local c = P.Character
    if c and c:FindFirstChild("HumanoidRootPart") then
        savedPos = c.HumanoidRootPart.CFrame
        SaveBtn.Text = "Saved ✓"
        task.delay(1, function()
            if SaveBtn.Parent then SaveBtn.Text = "Save Pos" end
        end)
    end
end)

-- زر الرجوع للموقع المحفوظ
local BackBtn = Instance.new("TextButton", BottomBar)
BackBtn.AnchorPoint = Vector2.new(1, 0.5)
BackBtn.Position = UDim2.new(1, -85, 0.5, 0)
BackBtn.Size = UDim2.fromOffset(60, 24)
BackBtn.BackgroundColor3 = ACCENT
BackBtn.Text = "Teleport"
BackBtn.TextColor3 = WHITE
BackBtn.Font = Enum.Font.GothamBold
BackBtn.TextSize = 10
BackBtn.BorderSizePixel = 0
Instance.new("UICorner", BackBtn).CornerRadius = UDim.new(0, 6)
BackBtn.MouseButton1Click:Connect(function()
    if savedPos then
        local c = P.Character
        if c and c:FindFirstChild("HumanoidRootPart") then
            c.HumanoidRootPart.CFrame = savedPos
        end
    end
end)

-- تحديث الحالة
task.spawn(function()
    while task.wait(0.5) do
        if StatusTxt and StatusTxt.Parent then
            if fly or noclip or infJump then
                StatusTxt.Text = "ACTIVE"
                StatusDot.BackgroundColor3 = GREEN
            else
                StatusTxt.Text = "IDLE"
                StatusDot.BackgroundColor3 = GRAYTXT
            end
        end
    end
end)

print("⚡ مطور يوسف | Steal a Brainrot Loaded ✅")
print("Telegram: https://t.me/YJW_m")
