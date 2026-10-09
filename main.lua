-- YOUSEF HUB ✨
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "✨ YOUSEF HUB",
    LoadingTitle = "YOUSEF HUB",
    LoadingSubtitle = "جاري التحميل...",
    ConfigurationSaving = { Enabled = false },
    KeySystem = false,
})

local player = game.Players.LocalPlayer

-- ============================================
-- ⚡ تبويب الحركة
-- ============================================
local MoveTab = Window:CreateTab("⚡ الحركة", nil)

local speedValue = 16
MoveTab:CreateSlider({
    Name = "🏃 السرعة",
    Range = {16, 250},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 16,
    Flag = "Speed",
    Callback = function(v) speedValue = v end,
})

local jumpValue = 50
MoveTab:CreateSlider({
    Name = "🦘 القفز",
    Range = {50, 500},
    Increment = 5,
    Suffix = "Power",
    CurrentValue = 50,
    Flag = "Jump",
    Callback = function(v) jumpValue = v end,
})

-- Loop
task.spawn(function()
    while task.wait(0.1) do
        local char = player.Character
        if char then
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum then
                hum.WalkSpeed = speedValue
                hum.JumpPower = jumpValue
                hum.UseJumpPower = true
            end
        end
    end
end)

-- قفز لا نهائي
local infJump = false
MoveTab:CreateToggle({
    Name = "🦅 قفز لا نهائي",
    CurrentValue = false,
    Flag = "InfJump",
    Callback = function(v) infJump = v end,
})

game:GetService("UserInputService").JumpRequest:Connect(function()
    if infJump then
        local char = player.Character
        if char and char:FindFirstChildOfClass("Humanoid") then
            char:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
        end
    end
end)

-- طيران
local flying = false
local flySpeed = 50
local flyGyro, flyVel

MoveTab:CreateSlider({
    Name = "✈️ سرعة الطيران",
    Range = {10, 200},
    Increment = 5,
    Suffix = "Speed",
    CurrentValue = 50,
    Flag = "FlySpeed",
    Callback = function(v) flySpeed = v end,
})

MoveTab:CreateToggle({
    Name = "🛫 تفعيل الطيران",
    CurrentValue = false,
    Flag = "Fly",
    Callback = function(v)
        flying = v
        local char = player.Character
        if not char then return end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end

        if flying then
            flyGyro = Instance.new("BodyGyro", hrp)
            flyGyro.P = 9e4
            flyGyro.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
            flyGyro.CFrame = hrp.CFrame

            flyVel = Instance.new("BodyVelocity", hrp)
            flyVel.Velocity = Vector3.new(0, 0, 0)
            flyVel.MaxForce = Vector3.new(9e9, 9e9, 9e9)

            task.spawn(function()
                while flying do
                    task.wait()
                    local cam = workspace.CurrentCamera
                    local move = Vector3.new(0, 0, 0)
                    local uis = game:GetService("UserInputService")
                    if uis:IsKeyDown(Enum.KeyCode.W) then move = move + cam.CFrame.LookVector end
                    if uis:IsKeyDown(Enum.KeyCode.S) then move = move - cam.CFrame.LookVector end
                    if uis:IsKeyDown(Enum.KeyCode.A) then move = move - cam.CFrame.RightVector end
                    if uis:IsKeyDown(Enum.KeyCode.D) then move = move + cam.CFrame.RightVector end
                    if uis:IsKeyDown(Enum.KeyCode.Space) then move = move + Vector3.new(0, 1, 0) end
                    if uis:IsKeyDown(Enum.KeyCode.LeftControl) then move = move - Vector3.new(0, 1, 0) end
                    flyVel.Velocity = move * flySpeed
                end
                if flyGyro then flyGyro:Destroy() end
                if flyVel then flyVel:Destroy() end
            end)
        else
            if flyGyro then flyGyro:Destroy(); flyGyro = nil end
            if flyVel then flyVel:Destroy(); flyVel = nil end
        end
    end,
})

-- Noclip
local noclip = false
MoveTab:CreateToggle({
    Name = "👻 عبور الجدران (Noclip)",
    CurrentValue = false,
    Flag = "Noclip",
    Callback = function(v) noclip = v end,
})

game:GetService("RunService").Stepped:Connect(function()
    if noclip and player.Character then
        for _, part in pairs(player.Character:GetDescendants()) do
            if part:IsA("BasePart") then part.CanCollide = false end
        end
    end
end)

-- ============================================
-- 🥚 تبويب البيض
-- ============================================
local EggTab = Window:CreateTab("🥚 البيض", nil)

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
    bb.Size = UDim2.new(0, 180, 0, 45)
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

EggTab:CreateToggle({
    Name = "👁️ رؤية البيض (ESP)",
    CurrentValue = false,
    Flag = "Esp",
    Callback = function(v)
        espEnabled = v
        if not v then clearESP() end
    end,
})

task.spawn(function()
    while task.wait(2) do
        if espEnabled then scanEggs() end
    end
end)

-- Teleport
local function getClosestEgg()
    local char = player.Character
    if not char then return nil end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return nil end
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
    return closest
end

EggTab:CreateButton({
    Name = "🚀 اذهب لأقرب بيضة",
    Callback = function()
        local egg = getClosestEgg()
        if egg and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            player.Character.HumanoidRootPart.CFrame = egg.CFrame + Vector3.new(0, 3, 0)
            Rayfield:Notify({ Title = "YOUSEF HUB", Content = "تم الانتقال!", Duration = 2 })
        end
    end,
})

-- ============================================
-- ⚙️ تبويب الإعدادات
-- ============================================
local SetTab = Window:CreateTab("⚙️ الإعدادات", nil)

SetTab:CreateParagraph({
    Title = "✨ YOUSEF HUB",
    Content = "الإصدار: 1.0\nصُنع بواسطة: مطور يوسف",
})

SetTab:CreateButton({
    Name = "📋 نسخ رابط الديسكورد",
    Callback = function()
        setclipboard("https://discord.gg/yousef")
        Rayfield:Notify({ Title = "YOUSEF HUB", Content = "تم النسخ ✅", Duration = 2 })
    end,
})

SetTab:CreateButton({
    Name = "🔴 إغلاق الواجهة",
    Callback = function()
        Rayfield:Destroy()
    end,
})
