-- ===== مطور يوسف HUB | Blox Fruits =====
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local RS = game:GetService("ReplicatedStorage")
local TPS = game:GetService("TeleportService")
local P = Players.LocalPlayer
local PG = P:WaitForChild("PlayerGui")
local Cam = workspace.CurrentCamera

local Window = Rayfield:CreateWindow({
    Name = "مطور يوسف HUB",
    LoadingTitle = "مطور يوسف HUB",
    LoadingSubtitle = "Blox Fruits",
    ConfigurationSaving = { Enabled = false },
    KeySystem = false,
})

-- ==========================================
-- 🏠 الرئيسية
-- ==========================================
local HomeTab = Window:CreateTab("🏠 الرئيسية", nil)

HomeTab:CreateSection("المعلومات")
HomeTab:CreateParagraph({
    Title = "مطور يوسف HUB",
    Content = "سكربت Blox Fruits\nصُنع بواسطة: مطور يوسف\nTelegram: t.me/YJW_m",
})

HomeTab:CreateButton({
    Name = "📱 نسخ رابط التلغرام",
    Callback = function()
        setclipboard("https://t.me/YJW_m")
        Rayfield:Notify({Title = "مطور يوسف", Content = "تم نسخ الرابط ✅", Duration = 2})
    end,
})

HomeTab:CreateButton({
    Name = "🔄 إعادة تشغيل اللعبة",
    Callback = function()
        TPS:Teleport(game.PlaceId, P)
    end,
})

-- ==========================================
-- 🎮 اللاعب
-- ==========================================
local PlayerTab = Window:CreateTab("🎮 اللاعب", nil)
PlayerTab:CreateSection("الحركة")

local speed = 16
PlayerTab:CreateSlider({
    Name = "🏃 السرعة",
    Range = {16, 300},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 16,
    Flag = "Speed",
    Callback = function(v) speed = v end,
})

local jump = 50
PlayerTab:CreateSlider({
    Name = "🦘 القفز",
    Range = {50, 500},
    Increment = 5,
    Suffix = "Power",
    CurrentValue = 50,
    Flag = "Jump",
    Callback = function(v) jump = v end,
})

_G.infJ = false
PlayerTab:CreateToggle({
    Name = "🦅 قفز لا نهائي",
    CurrentValue = false,
    Flag = "InfJump",
    Callback = function(v) _G.infJ = v end,
})

_G.fly = false
PlayerTab:CreateToggle({
    Name = "✈️ طيران",
    CurrentValue = false,
    Flag = "Fly",
    Callback = function(v) _G.fly = v end,
})

_G.flySp = 80
PlayerTab:CreateSlider({
    Name = "⚡ سرعة الطيران",
    Range = {20, 300},
    Increment = 5,
    Suffix = "Speed",
    CurrentValue = 80,
    Flag = "FlySpeed",
    Callback = function(v) _G.flySp = v end,
})

_G.nc = false
PlayerTab:CreateToggle({
    Name = "👻 Noclip",
    CurrentValue = false,
    Flag = "Noclip",
    Callback = function(v) _G.nc = v end,
})

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

-- ==========================================
-- 👁️ ESP
-- ==========================================
local EspTab = Window:CreateTab("👁️ ESP", nil)
EspTab:CreateSection("العرض")

local espObjects = {}

local function createESP(part, txt, color)
    if espObjects[part] then return end
    local bb = Instance.new("BillboardGui", part)
    bb.Size = UDim2.new(0, 150, 0, 35)
    bb.StudsOffset = Vector3.new(0, 3, 0)
    bb.AlwaysOnTop = true
    local l = Instance.new("TextLabel", bb)
    l.Size = UDim2.new(1, 0, 1, 0)
    l.BackgroundTransparency = 0.3
    l.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    l.TextColor3 = color or Color3.fromRGB(255, 220, 50)
    l.TextStrokeTransparency = 0
    l.Font = Enum.Font.GothamBold
    l.TextSize = 12
    l.Text = txt
    l.Parent = bb
    espObjects[part] = bb
end

local function clearESP()
    for _, g in pairs(espObjects) do
        if g and g.Parent then g:Destroy() end
    end
    espObjects = {}
end

local espFruits = false
local espChests = false
local espPlayers = false
local espFlowers = false

EspTab:CreateToggle({
    Name = "🍎 عرض الفواكه",
    CurrentValue = false,
    Flag = "EspFruits",
    Callback = function(v) espFruits = v; if not v then clearESP() end end,
})

EspTab:CreateToggle({
    Name = "📦 عرض الصناديق",
    CurrentValue = false,
    Flag = "EspChests",
    Callback = function(v) espChests = v; if not v then clearESP() end end,
})

EspTab:CreateToggle({
    Name = "🌸 عرض الزهور",
    CurrentValue = false,
    Flag = "EspFlowers",
    Callback = function(v) espFlowers = v; if not v then clearESP() end end,
})

EspTab:CreateToggle({
    Name = "👤 عرض اللاعبين",
    CurrentValue = false,
    Flag = "EspPlayers",
    Callback = function(v) espPlayers = v; if not v then clearESP() end end,
})

task.spawn(function()
    while task.wait(2) do
        if espFruits or espChests or espFlowers then
            for _, obj in pairs(workspace:GetDescendants()) do
                if obj:IsA("BasePart") or obj:IsA("Model") then
                    local n = string.lower(obj.Name)
                    local part = obj:IsA("BasePart") and obj or obj:FindFirstChildWhichIsA("BasePart")
                    if part then
                        if espFruits and string.find(n, "fruit") then
                            createESP(part, "🍎 " .. obj.Name, Color3.fromRGB(255, 180, 50))
                        end
                        if espChests and string.find(n, "chest") then
                            createESP(part, "📦 " .. obj.Name, Color3.fromRGB(255, 220, 50))
                        end
                        if espFlowers and string.find(n, "flower") then
                            createESP(part, "🌸 " .. obj.Name, Color3.fromRGB(200, 150, 255))
                        end
                    end
                end
            end
        end
        if espPlayers then
            for _, plr in pairs(Players:GetPlayers()) do
                if plr ~= P and plr.Character then
                    local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        createESP(hrp, "👤 " .. plr.Name, Color3.fromRGB(80, 220, 120))
                    end
                end
            end
        end
    end
end)

-- ==========================================
-- ⚔️ القتال
-- ==========================================
local CombatTab = Window:CreateTab("⚔️ القتال", nil)
CombatTab:CreateSection("Combat")

_G.aimbot = false
CombatTab:CreateToggle({
    Name = "🎯 Aimbot",
    CurrentValue = false,
    Flag = "Aimbot",
    Callback = function(v) _G.aimbot = v end,
})

_G.autoAttack = false
CombatTab:CreateToggle({
    Name = "⚔️ هجوم تلقائي",
    CurrentValue = false,
    Flag = "AutoAttack",
    Callback = function(v) _G.autoAttack = v end,
})

task.spawn(function()
    while task.wait(0.1) do
        if _G.aimbot and P.Character then
            local hrp = P.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                local closest, dist = nil, math.huge
                for _, plr in pairs(Players:GetPlayers()) do
                    if plr ~= P and plr.Character then
                        local t = plr.Character:FindFirstChild("HumanoidRootPart")
                        if t then
                            local d = (t.Position - hrp.Position).Magnitude
                            if d < dist and d < 100 then dist = d; closest = t end
                        end
                    end
                end
                if closest then
                    Cam.CFrame = CFrame.new(Cam.CFrame.Position, closest.Position)
                end
            end
        end
    end
end)

task.spawn(function()
    while task.wait(0.3) do
        if _G.autoAttack and P.Character then
            local tool = P.Character:FindFirstChildOfClass("Tool")
            if tool then pcall(function() tool:Activate() end) end
        end
    end
end)

-- ==========================================
-- 🚀 Teleport
-- ==========================================
local TeleTab = Window:CreateTab("🚀 Teleport", nil)
TeleTab:CreateSection("أماكن")

TeleTab:CreateButton({
    Name = "🏝️ الجزيرة الأولى",
    Callback = function()
        local c = P.Character
        if c and c:FindFirstChild("HumanoidRootPart") then
            c.HumanoidRootPart.CFrame = CFrame.new(0, 100, 0)
        end
    end,
})

local savedPos = nil
TeleTab:CreateButton({
    Name = "💾 حفظ موقعي الحالي",
    Callback = function()
        local c = P.Character
        if c and c:FindFirstChild("HumanoidRootPart") then
            savedPos = c.HumanoidRootPart.CFrame
            Rayfield:Notify({Title = "مطور يوسف", Content = "تم حفظ الموقع ✅", Duration = 2})
        end
    end,
})

TeleTab:CreateButton({
    Name = "↩️ العودة للموقع المحفوظ",
    Callback = function()
        local c = P.Character
        if c and c:FindFirstChild("HumanoidRootPart") and savedPos then
            c.HumanoidRootPart.CFrame = savedPos
        end
    end,
})

-- ==========================================
-- ⚙️ الإعدادات
-- ==========================================
local SettingsTab = Window:CreateTab("⚙️ الإعدادات", nil)
SettingsTab:CreateSection("المعلومات")

SettingsTab:CreateParagraph({
    Title = "مطور يوسف HUB",
    Content = "الإصدار: 1.0\nاللعبة: Blox Fruits\nTelegram: t.me/YJW_m",
})

SettingsTab:CreateButton({
    Name = "📱 نسخ التلغرام",
    Callback = function()
        setclipboard("https://t.me/YJW_m")
        Rayfield:Notify({Title = "مطور يوسف", Content = "تم النسخ ✅", Duration = 2})
    end,
})

SettingsTab:CreateButton({
    Name = "❌ إغلاق الواجهة",
    Callback = function() Rayfield:Destroy() end,
})

print("⚡ مطور يوسف HUB | Blox Fruits Loaded ✅")
print("Telegram: https://t.me/YJW_m")
