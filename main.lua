-- ===== مطور يوسف HUB V2 | Multi-Game =====
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local RS = game:GetService("ReplicatedStorage")
local TPS = game:GetService("TeleportService")
local P = Players.LocalPlayer
local PG = P:WaitForChild("PlayerGui")
local Cam = workspace.CurrentCamera

-- كشف اللعبة
local function detectGame()
    local n = string.lower(game.Name)
    if string.find(n, "brainrot") then return "brainrot", "🧠" end
    if string.find(n, "blox") then return "bloxfruits", "🍎" end
    if string.find(n, "egg") then return "egg", "🥚" end
    return "unknown", "🎮"
end

local GAME, EMOJI = detectGame()

local Window = Rayfield:CreateWindow({
    Name = "مطور يوسف HUB",
    LoadingTitle = "⚡ مطور يوسف HUB",
    LoadingSubtitle = "V2 | " .. GAME,
    ConfigurationSaving = { Enabled = false },
    KeySystem = false,
})

-- ============== الرئيسية ==============
local Home = Window:CreateTab("🏠 الرئيسية", nil)

Home:CreateSection("معلومات")

Home:CreateParagraph({
    Title = "مطور يوسف HUB V2",
    Content = EMOJI .. " اللعبة: " .. GAME .. "\n📱 Telegram: t.me/YJW_m",
})

Home:CreateButton({
    Name = "📋 نسخ رابط القناة",
    Callback = function()
        setclipboard("https://t.me/YJW_m")
        Rayfield:Notify({Title = "مطور يوسف", Content = "تم نسخ الرابط ✅", Duration = 2})
    end,
})

-- ============== اللاعب ==============
local PlayerTab = Window:CreateTab("🎮 اللاعب", nil)
PlayerTab:CreateSection("الحركة")

local speed = 16
PlayerTab:CreateSlider({
    Name = "🏃 السرعة",
    Range = {16, 300}, Increment = 1, Suffix = "Speed",
    CurrentValue = 16, Flag = "Speed",
    Callback = function(v) speed = v end,
})

local jump = 50
PlayerTab:CreateSlider({
    Name = "🦘 القفز",
    Range = {50, 500}, Increment = 5, Suffix = "Power",
    CurrentValue = 50, Flag = "Jump",
    Callback = function(v) jump = v end,
})

_G.infJ = false
PlayerTab:CreateToggle({
    Name = "🦅 قفز لا نهائي", CurrentValue = false, Flag = "InfJump",
    Callback = function(v) _G.infJ = v end,
})

_G.fly = false
PlayerTab:CreateToggle({
    Name = "✈️ طيران", CurrentValue = false, Flag = "Fly",
    Callback = function(v) _G.fly = v end,
})

_G.flySpeed = 80
PlayerTab:CreateSlider({
    Name = "⚡ سرعة الطيران",
    Range = {20, 300}, Increment = 5, Suffix = "Speed",
    CurrentValue = 80, Flag = "FlySpeed",
    Callback = function(v) _G.flySpeed = v end,
})

_G.nc = false
PlayerTab:CreateToggle({
    Name = "👻 Noclip", CurrentValue = false, Flag = "Noclip",
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
                        v.Velocity = m * _G.flySpeed
                    end
                end
            end
        end
    end
end)

-- ============== ESP ==============
local EspTab = Window:CreateTab("👁️ ESP", nil)
EspTab:CreateSection("عناصر")

local espList = {}
local function addEsp(part, txt, color)
    if espList[part] then return end
    local bb = Instance.new("BillboardGui", part)
    bb.Size = UDim2.new(0, 170, 0, 40)
    bb.StudsOffset = Vector3.new(0, 3, 0)
    bb.AlwaysOnTop = true
    local l = Instance.new("TextLabel", bb)
    l.Size = UDim2.new(1, 0, 1, 0)
    l.BackgroundTransparency = 0.3
    l.BackgroundColor3 = Color3.fromRGB(0,0,0)
    l.TextColor3 = color or Color3.fromRGB(255, 220, 50)
    l.Font = Enum.Font.GothamBold
    l.TextSize = 12
    l.Text = txt
    l.Parent = bb
    espList[part] = bb
end

local function clearEsp()
    for _, g in pairs(espList) do if g and g.Parent then g:Destroy() end end
    espList = {}
end

local espEgg = false
local espFruit = false
local espChest = false
local espPlayer = false

EspTab:CreateToggle({
    Name = "🥚 ESP البيض", CurrentValue = false, Flag = "EspEgg",
    Callback = function(v) espEgg = v; if not v then clearEsp() end end,
})

EspTab:CreateToggle({
    Name = "🍎 ESP الفواكه", CurrentValue = false, Flag = "EspFruit",
    Callback = function(v) espFruit = v; if not v then clearEsp() end end,
})

EspTab:CreateToggle({
    Name = "📦 ESP الصناديق", CurrentValue = false, Flag = "EspChest",
    Callback = function(v) espChest = v; if not v then clearEsp() end end,
})

EspTab:CreateToggle({
    Name = "👤 ESP اللاعبين", CurrentValue = false, Flag = "EspPlayer",
    Callback = function(v) espPlayer = v; if not v then clearEsp() end end,
})

task.spawn(function()
    while task.wait(1.5) do
        if espEgg or espFruit or espChest or espPlayer then
            for _, o in pairs(workspace:GetDescendants()) do
                if o:IsA("BasePart") or o:IsA("Model") then
                    local n = string.lower(o.Name)
                    local part = o:IsA("BasePart") and o or o:FindFirstChildWhichIsA("BasePart")
                    if part then
                        if espEgg and string.find(n, "egg") then
                            addEsp(part, "🥚 " .. o.Name, Color3.fromRGB(255, 220, 50))
                        end
                        if espFruit and string.find(n, "fruit") then
                            addEsp(part, "🍎 " .. o.Name, Color3.fromRGB(255, 150, 50))
                        end
                        if espChest and string.find(n, "chest") then
                            addEsp(part, "📦 " .. o.Name, Color3.fromRGB(200, 180, 100))
                        end
                    end
                end
            end
            if espPlayer then
                for _, plr in pairs(Players:GetPlayers()) do
                    if plr ~= P and plr.Character then
                        local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
                        if hrp then addEsp(hrp, "👤 " .. plr.Name, Color3.fromRGB(80, 220, 120)) end
                    end
                end
            end
        end
    end
end)

-- ============== السرقة ==============
local StealTab = Window:CreateTab("⚡ السرقة", nil)
StealTab:CreateSection("Auto Steal")

local autoSteal = false
StealTab:CreateToggle({
    Name = "🥷 سرقة تلقائية", CurrentValue = false, Flag = "AutoSteal",
    Callback = function(v) autoSteal = v end,
})

local stealSpeed = 0.5
StealTab:CreateSlider({
    Name = "⚡ سرعة السرقة",
    Range = {1, 10}, Increment = 1, Suffix = "x10ms",
    CurrentValue = 5, Flag = "StealSpeed",
    Callback = function(v) stealSpeed = v / 10 end,
})

task.spawn(function()
    while task.wait(stealSpeed) do
        if autoSteal and P.Character then
            local hrp = P.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                local closest, dist = nil, math.huge
                for _, o in pairs(workspace:GetDescendants()) do
                    if o:IsA("BasePart") and string.find(string.lower(o.Name), "egg") then
                        local d = (o.Position - hrp.Position).Magnitude
                        if d < dist then dist = d; closest = o end
                    end
                end
                if closest then
                    pcall(function() hrp.CFrame = closest.CFrame + Vector3.new(0, 2, 0) end)
                end
            end
        end
    end
end)

StealTab:CreateButton({
    Name = "🚀 روح لأقرب بيضة",
    Callback = function()
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
    end,
})

StealTab:CreateButton({
    Name = "💰 بيع كل البيض",
    Callback = function()
        for _, o in pairs(RS:GetDescendants()) do
            if o:IsA("RemoteEvent") and string.find(string.lower(o.Name), "sell") then
                pcall(function() o:FireServer() end)
            end
        end
    end,
})

StealTab:CreateButton({
    Name = "🥚 فقس البيض",
    Callback = function()
        for _, o in pairs(RS:GetDescendants()) do
            if o:IsA("RemoteEvent") and string.find(string.lower(o.Name), "hatch") then
                pcall(function() o:FireServer() end)
            end
        end
    end,
})

-- ============== القتال ==============
local CombatTab = Window:CreateTab("⚔️ القتال", nil)
CombatTab:CreateSection("Aimbot")

local aimbot = false
CombatTab:CreateToggle({
    Name = "🎯 Aimbot", CurrentValue = false, Flag = "Aimbot",
    Callback = function(v) aimbot = v end,
})

task.spawn(function()
    while task.wait(0.1) do
        if aimbot and P.Character then
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
                if closest then Cam.CFrame = CFrame.new(Cam.CFrame.Position, closest.Position) end
            end
        end
    end
end)

local autoAtk = false
CombatTab:CreateToggle({
    Name = "⚔️ Auto Attack", CurrentValue = false, Flag = "AutoAtk",
    Callback = function(v) autoAtk = v end,
})

task.spawn(function()
    while task.wait(0.3) do
        if autoAtk and P.Character then
            local tool = P.Character:FindFirstChildOfClass("Tool")
            if tool then pcall(function() tool:Activate() end) end
        end
    end
end)

-- ============== الإعدادات ==============
local SetTab = Window:CreateTab("⚙️ الإعدادات", nil)
SetTab:CreateSection("معلومات")

SetTab:CreateParagraph({
    Title = "مطور يوسف HUB V2",
    Content = "الإصدار: 2.0\nيدعم: Brainrot / Blox Fruits / Steal an Egg\nTelegram: t.me/YJW_m",
})

SetTab:CreateButton({
    Name = "📋 نسخ رابط القناة",
    Callback = function()
        setclipboard("https://t.me/YJW_m")
        Rayfield:Notify({Title = "مطور يوسف", Content = "تم النسخ ✅", Duration = 2})
    end,
})

SetTab:CreateButton({
    Name = "🔄 إعادة تشغيل",
    Callback = function() TPS:Teleport(game.PlaceId, P) end,
})

SetTab:CreateButton({
    Name = "❌ إغلاق الواجهة",
    Callback = function() Rayfield:Destroy() end,
})

print("⚡ مطور يوسف HUB V2 Loaded ✅")
print("Game: " .. GAME)
print("Telegram: https://t.me/YJW_m")
