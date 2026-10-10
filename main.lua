-- ===== مطور يوسف HUB | Steal an Egg =====
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local P = Players.LocalPlayer
local PG = P:WaitForChild("PlayerGui")

local old = PG:FindFirstChild("YousefHubUI")
if old then old:Destroy() end

local GUI = Instance.new("ScreenGui")
GUI.Name = "YousefHubUI"
GUI.ResetOnSpawn = false
GUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
GUI.Parent = PG

-- ===== الإطار الرئيسي =====
local Main = Instance.new("CanvasGroup")
Main.AnchorPoint = Vector2.new(.5, .5)
Main.Position = UDim2.fromScale(.5, .5)
Main.Size = UDim2.fromOffset(520, 260)
Main.BackgroundColor3 = Color3.fromRGB(18, 20, 18)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Main.GroupTransparency = 1
Main.Parent = GUI
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 16)

local stroke = Instance.new("UIStroke", Main)
stroke.Color = Color3.fromRGB(60, 90, 60)
stroke.Thickness = 1
stroke.Transparency = 0.5

local scale = Instance.new("UIScale", Main)
scale.Scale = .92

-- ===== الهيدر =====
local Header = Instance.new("Frame", Main)
Header.Size = UDim2.new(1, -20, 0, 50)
Header.Position = UDim2.fromOffset(10, 10)
Header.BackgroundTransparency = 1

-- شعار دائري
local Badge = Instance.new("Frame", Header)
Badge.Size = UDim2.fromOffset(45, 45)
Badge.Position = UDim2.fromOffset(5, 2)
Badge.BackgroundColor3 = Color3.fromRGB(40, 60, 40)
Badge.BorderSizePixel = 0
Instance.new("UICorner", Badge).CornerRadius = UDim.new(1, 0)

local BadgeRing = Instance.new("UIStroke", Badge)
BadgeRing.Color = Color3.fromRGB(100, 200, 100)
BadgeRing.Thickness = 2
BadgeRing.Transparency = 0.3

local BadgeText = Instance.new("TextLabel", Badge)
BadgeText.Size = UDim2.new(1, 0, 1, 0)
BadgeText.BackgroundTransparency = 1
BadgeText.Text = "Y"
BadgeText.TextColor3 = Color3.fromRGB(120, 220, 120)
BadgeText.Font = Enum.Font.GothamBlack
BadgeText.TextSize = 20

-- اسم الهاب
local Title = Instance.new("TextLabel", Header)
Title.Position = UDim2.fromOffset(60, 2)
Title.Size = UDim2.new(1, -180, 0, 26)
Title.BackgroundTransparency = 1
Title.Text = "مطور يوسف"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBlack
Title.TextSize = 22
Title.TextXAlignment = Enum.TextXAlignment.Left

local Subtitle = Instance.new("TextLabel", Header)
Subtitle.Position = UDim2.fromOffset(60, 28)
Subtitle.Size = UDim2.new(1, -180, 0, 16)
Subtitle.BackgroundTransparency = 1
Subtitle.Text = "BEST EGG IN STEAL AN EGG"
Subtitle.TextColor3 = Color3.fromRGB(120, 160, 120)
Subtitle.Font = Enum.Font.GothamBold
Subtitle.TextSize = 10
Subtitle.TextXAlignment = Enum.TextXAlignment.Left

-- أيقونة ديسكورد
local Discord = Instance.new("TextButton", Header)
Discord.AnchorPoint = Vector2.new(1, 0)
Discord.Position = UDim2.new(1, -40, 0, 5)
Discord.Size = UDim2.fromOffset(35, 35)
Discord.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
Discord.BorderSizePixel = 0
Discord.Text = "D"
Discord.TextColor3 = Color3.fromRGB(255, 255, 255)
Discord.Font = Enum.Font.GothamBlack
Discord.TextSize = 18
Instance.new("UICorner", Discord).CornerRadius = UDim.new(1, 0)
Discord.MouseButton1Click:Connect(function()
    setclipboard("https://t.me/YJW_m")
    Discord.Text = "✓"
    task.delay(1, function()
        if Discord.Parent then Discord.Text = "D" end
    end)
end)

-- زر الإغلاق
local Close = Instance.new("TextButton", Header)
Close.AnchorPoint = Vector2.new(1, 0)
Close.Position = UDim2.new(1, 0, 0, 10)
Close.Size = UDim2.fromOffset(28, 28)
Close.BackgroundColor3 = Color3.fromRGB(30, 33, 30)
Close.BorderSizePixel = 0
Close.Text = "✕"
Close.TextColor3 = Color3.fromRGB(200, 200, 200)
Close.Font = Enum.Font.GothamBold
Close.TextSize = 13
Close.AutoButtonColor = false
Instance.new("UICorner", Close).CornerRadius = UDim.new(0, 8)
Close.MouseButton1Click:Connect(function() GUI:Destroy() end)

-- ===== بطاقة البيضة =====
local EggCard = Instance.new("Frame", Main)
EggCard.Position = UDim2.fromOffset(15, 75)
EggCard.Size = UDim2.new(1, -30, 0, 70)
EggCard.BackgroundColor3 = Color3.fromRGB(25, 28, 25)
EggCard.BorderSizePixel = 0
Instance.new("UICorner", EggCard).CornerRadius = UDim.new(0, 12)

local EggStroke = Instance.new("UIStroke", EggCard)
EggStroke.Color = Color3.fromRGB(60, 100, 60)
EggStroke.Thickness = 1
EggStroke.Transparency = 0.6

-- أيقونة البيضة
local EggIcon = Instance.new("Frame", EggCard)
EggIcon.Position = UDim2.fromOffset(10, 10)
EggIcon.Size = UDim2.fromOffset(50, 50)
EggIcon.BackgroundColor3 = Color3.fromRGB(15, 18, 15)
EggIcon.BorderSizePixel = 0
Instance.new("UICorner", EggIcon).CornerRadius = UDim.new(0, 10)

local EggEmoji = Instance.new("TextLabel", EggIcon)
EggEmoji.Size = UDim2.new(1, 0, 1, 0)
EggEmoji.BackgroundTransparency = 1
EggEmoji.Text = "🥚"
EggEmoji.TextSize = 26
EggEmoji.Font = Enum.Font.GothamBold

-- نص البيضة
local EggLabel = Instance.new("TextLabel", EggCard)
EggLabel.Position = UDim2.fromOffset(70, 10)
EggLabel.Size = UDim2.new(1, -180, 0, 14)
EggLabel.BackgroundTransparency = 1
EggLabel.Text = "BEST EGG"
EggLabel.TextColor3 = Color3.fromRGB(120, 160, 120)
EggLabel.Font = Enum.Font.GothamBold
EggLabel.TextSize = 10
EggLabel.TextXAlignment = Enum.TextXAlignment.Left

local EggName = Instance.new("TextLabel", EggCard)
EggName.Position = UDim2.fromOffset(70, 24)
EggName.Size = UDim2.new(1, -180, 0, 22)
EggName.BackgroundTransparency = 1
EggName.Text = "Pure Jellyfish"
EggName.TextColor3 = Color3.fromRGB(255, 255, 255)
EggName.Font = Enum.Font.GothamBold
EggName.TextSize = 16
EggName.TextXAlignment = Enum.TextXAlignment.Left

local EggRarity = Instance.new("TextLabel", EggCard)
EggRarity.Position = UDim2.fromOffset(70, 46)
EggRarity.Size = UDim2.new(1, -180, 0, 14)
EggRarity.BackgroundTransparency = 1
EggRarity.Text = "Secret"
EggRarity.TextColor3 = Color3.fromRGB(140, 140, 140)
EggRarity.Font = Enum.Font.Gotham
EggRarity.TextSize = 11
EggRarity.TextXAlignment = Enum.TextXAlignment.Left

-- القيمة
local Value = Instance.new("TextLabel", EggCard)
Value.AnchorPoint = Vector2.new(1, 0)
Value.Position = UDim2.new(1, -40, 0, 24)
Value.Size = UDim2.fromOffset(120, 22)
Value.BackgroundTransparency = 1
Value.Text = "209.36M"
Value.TextColor3 = Color3.fromRGB(80, 220, 120)
Value.Font = Enum.Font.GothamBlack
Value.TextSize = 16
Value.TextXAlignment = Enum.TextXAlignment.Right

-- سهم القائمة
local Arrow = Instance.new("TextLabel", EggCard)
Arrow.AnchorPoint = Vector2.new(1, 0)
Arrow.Position = UDim2.new(1, -10, 0, 25)
Arrow.Size = UDim2.fromOffset(20, 20)
Arrow.BackgroundTransparency = 1
Arrow.Text = "⌄"
Arrow.TextColor3 = Color3.fromRGB(200, 200, 200)
Arrow.Font = Enum.Font.GothamBold
Arrow.TextSize = 20

-- ===== زر Teleport =====
local TeleFrame = Instance.new("Frame", Main)
TeleFrame.Position = UDim2.fromOffset(15, 155)
TeleFrame.Size = UDim2.new(1, -30, 0, 50)
TeleFrame.BackgroundColor3 = Color3.fromRGB(25, 28, 25)
TeleFrame.BorderSizePixel = 0
Instance.new("UICorner", TeleFrame).CornerRadius = UDim.new(0, 12)

local TeleStroke = Instance.new("UIStroke", TeleFrame)
TeleStroke.Color = Color3.fromRGB(60, 100, 60)
TeleStroke.Thickness = 1
TeleStroke.Transparency = 0.6

local TeleBtn = Instance.new("TextButton", TeleFrame)
TeleBtn.Position = UDim2.fromOffset(10, 10)
TeleBtn.Size = UDim2.new(0, 130, 0, 30)
TeleBtn.BackgroundColor3 = Color3.fromRGB(35, 45, 35)
TeleBtn.BorderSizePixel = 0
TeleBtn.Text = "TELEGUIADO"
TeleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
TeleBtn.Font = Enum.Font.GothamBold
TeleBtn.TextSize = 12
Instance.new("UICorner", TeleBtn).CornerRadius = UDim.new(0, 8)

local TeleSub = Instance.new("TextLabel", TeleFrame)
TeleSub.Position = UDim2.fromOffset(12, 42)
TeleSub.Size = UDim2.fromOffset(130, 12)
TeleSub.BackgroundTransparency = 1
TeleSub.Text = "ONE SHOT"
TeleSub.TextColor3 = Color3.fromRGB(100, 140, 100)
TeleSub.Font = Enum.Font.GothamBold
TeleSub.TextSize = 9
TeleSub.TextXAlignment = Enum.TextXAlignment.Left

-- Toggle Loop
local LoopLabel = Instance.new("TextLabel", TeleFrame)
LoopLabel.AnchorPoint = Vector2.new(1, 0)
LoopLabel.Position = UDim2.new(1, -70, 0, 15)
LoopLabel.Size = UDim2.fromOffset(60, 20)
LoopLabel.BackgroundTransparency = 1
LoopLabel.Text = "LOOP"
LoopLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
LoopLabel.Font = Enum.Font.GothamBold
LoopLabel.TextSize = 12
LoopLabel.TextXAlignment = Enum.TextXAlignment.Right

local LoopBtn = Instance.new("TextButton", TeleFrame)
LoopBtn.AnchorPoint = Vector2.new(1, 0.5)
LoopBtn.Position = UDim2.new(1, -10, 0.5, 0)
LoopBtn.Size = UDim2.fromOffset(48, 24)
LoopBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
LoopBtn.Text = ""
LoopBtn.AutoButtonColor = false
LoopBtn.BorderSizePixel = 0
Instance.new("UICorner", LoopBtn).CornerRadius = UDim.new(1, 0)

local LoopKnob = Instance.new("Frame", LoopBtn)
LoopKnob.Size = UDim2.fromOffset(18, 18)
LoopKnob.Position = UDim2.new(0, 3, 0.5, -9)
LoopKnob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", LoopKnob).CornerRadius = UDim.new(1, 0)

-- ===== الوظائف =====
local loopEnabled = false

local function getClosestEgg()
    local c = P.Character
    if not c then return nil end
    local hrp = c:FindFirstChild("HumanoidRootPart")
    if not hrp then return nil end
    local cl, d = nil, math.huge
    for _, o in pairs(workspace:GetDescendants()) do
        if o:IsA("BasePart") and string.find(string.lower(o.Name), "egg") then
            local dd = (o.Position - hrp.Position).Magnitude
            if dd < d then d = dd; cl = o end
        end
    end
    return cl
end

local function doTeleport()
    local c = P.Character
    if not c then return end
    local hrp = c:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    local egg = getClosestEgg()
    if egg then
        pcall(function()
            hrp.CFrame = egg.CFrame + Vector3.new(0, 3, 0)
        end)
    end
end

TeleBtn.MouseButton1Click:Connect(function()
    doTeleport()
    TeleBtn.Text = "TELEPORTED!"
    task.delay(0.8, function()
        if TeleBtn.Parent then TeleBtn.Text = "TELEGUIADO" end
    end)
end)

LoopBtn.MouseButton1Click:Connect(function()
    loopEnabled = not loopEnabled
    if loopEnabled then
        TweenService:Create(LoopBtn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(80, 220, 120)}):Play()
        TweenService:Create(LoopKnob, TweenInfo.new(0.15), {Position = UDim2.new(1, -21, 0.5, -9)}):Play()
    else
        TweenService:Create(LoopBtn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(80, 80, 80)}):Play()
        TweenService:Create(LoopKnob, TweenInfo.new(0.15), {Position = UDim2.new(0, 3, 0.5, -9)}):Play()
    end
end)

task.spawn(function()
    while task.wait(0.5) do
        if loopEnabled then doTeleport() end
    end
end)

-- ===== حركة الظهور =====
TweenService:Create(Main, TweenInfo.new(.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    GroupTransparency = 0
}):Play()
TweenService:Create(scale, TweenInfo.new(.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Scale = 1
}):Play()

print("⚡ مطور يوسف HUB Loaded ✅")
print("Telegram: https://t.me/YJW_m")
