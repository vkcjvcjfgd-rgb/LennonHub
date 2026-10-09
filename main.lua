-- مطور يوسف HUB
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "مطور يوسف",
    LoadingTitle = "مطور يوسف HUB",
    LoadingSubtitle = "Welcome",
    ConfigurationSaving = { Enabled = false },
    KeySystem = false,
})

-- ===== تبويب الرئيسية =====
local MainTab = Window:CreateTab("الرئيسية", nil)

local speedValue = 16
MainTab:CreateSlider({
    Name = "السرعة",
    Range = {16, 200},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 16,
    Flag = "SpeedSlider",
    Callback = function(value)
        speedValue = value
    end,
})

local jumpValue = 50
MainTab:CreateSlider({
    Name = "القفز",
    Range = {50, 300},
    Increment = 5,
    Suffix = "Power",
    CurrentValue = 50,
    Flag = "JumpSlider",
    Callback = function(value)
        jumpValue = value
    end,
})

task.spawn(function()
    while task.wait(0.1) do
        local char = game.Players.LocalPlayer.Character
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

-- ===== تبويب ESP (يشوف البيض) =====
local EspTab = Window:CreateTab("ESP البيض", nil)

local espEnabled = false
local espList = {}

local function createEsp(part, infoText)
    if espList[part] then return end
    
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "YousefESP"
    billboard.Size = UDim2.new(0, 200, 0, 60)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.AlwaysOnTop = true
    billboard.Parent = part
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 0.3
    label.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    label.TextColor3 = Color3.fromRGB(255, 255, 0)
    label.TextStrokeTransparency = 0
    label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    label.Font = Enum.Font.GothamBold
    label.TextSize = 14
    label.Text = infoText
    label.Parent = billboard
    
    espList[part] = billboard
end

local function removeAllEsp()
    for part, gui in pairs(espList) do
        if gui and gui.Parent then
            gui:Destroy()
        end
    end
    espList = {}
end

local function scanEggs()
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") or obj:IsA("Model") then
            local name = string.lower(obj.Name)
            -- يدور على أي شي اسمه بيضة أو egg
            if string.find(name, "egg") or string.find(name, "بيض") then
                local part = obj:IsA("BasePart") and obj or obj:FindFirstChildWhichIsA("BasePart")
                if part and not espList[part] then
                    -- يحاول يقرأ محتوى البيضة من الـ Attributes أو StringValue
                    local eggName = obj.Name
                    local valueText = "؟"
                    
                    -- يدور على Value داخل البيضة
                    for _, child in pairs(obj:GetChildren()) do
                        if child:IsA("StringValue") or child:IsA("NumberValue") then
                            valueText = tostring(child.Value)
                            break
                        end
                        if child:IsA("Model") or child:IsA("BasePart") then
                            valueText = child.Name
                        end
                    end
                    
                    createEsp(part, "🥚 " .. eggName .. "\n💰 " .. valueText)
                end
            end
        end
    end
end

EspTab:CreateToggle({
    Name = "تشغيل ESP البيض",
    CurrentValue = false,
    Flag = "EspToggle",
    Callback = function(value)
        espEnabled = value
        if not value then
            removeAllEsp()
        end
    end,
})

EspTab:CreateButton({
    Name = "تحديث البيض",
    Callback = function()
        removeAllEsp()
        scanEggs()
    end,
})

-- Loop يحدّث ESP
task.spawn(function()
    while task.wait(2) do
        if espEnabled then
            scanEggs()
        end
    end
end)

-- ===== تبويب الطيران =====
local FlyTab = Window:CreateTab("الطيران", nil)

local flying = false
local flySpeed = 50

FlyTab:CreateSlider({
    Name = "سرعة الطيران",
    Range = {10, 200},
    Increment = 5,
    Suffix = "Speed",
    CurrentValue = 50,
    Flag = "FlySpeed",
    Callback = function(value)
        flySpeed = value
    end,
})

FlyTab:CreateToggle({
    Name = "تفعيل الطيران",
    CurrentValue = false,
    Flag = "FlyToggle",
    Callback = function(value)
        flying = value
        local char = game.Players.LocalPlayer.Character
        if not char then return end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end

        if flying then
            local bodyGyro = Instance.new("BodyGyro")
            bodyGyro.P = 9e4
            bodyGyro.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
            bodyGyro.CFrame = hrp.CFrame
            bodyGyro.Parent = hrp

            local bodyVel = Instance.new("BodyVelocity")
            bodyVel.Velocity = Vector3.new(0, 0, 0)
            bodyVel.MaxForce = Vector3.new(9e9, 9e9, 9e9)
            bodyVel.Parent = hrp

            task.spawn(function()
                while flying do
                    task.wait()
                    local cam = workspace.CurrentCamera
                    local move = Vector3.new(0, 0, 0)
                    local UIS = game:GetService("UserInputService")
                    if UIS:IsKeyDown(Enum.KeyCode.W) then move = move + cam.CFrame.LookVector end
                    if UIS:IsKeyDown(Enum.KeyCode.S) then move = move - cam.CFrame.LookVector end
                    if UIS:IsKeyDown(Enum.KeyCode.A) then move = move - cam.CFrame.RightVector end
                    if UIS:IsKeyDown(Enum.KeyCode.D) then move = move + cam.CFrame.RightVector end
                    if UIS:IsKeyDown(Enum.KeyCode.Space) then move = move + Vector3.new(0, 1, 0) end
                    if UIS:IsKeyDown(Enum.KeyCode.LeftControl) then move = move - Vector3.new(0, 1, 0) end
                    bodyVel.Velocity = move * flySpeed
                end
                if bodyGyro then bodyGyro:Destroy() end
                if bodyVel then bodyVel:Destroy() end
            end)
        end
    end,
})

-- ===== تبويب معلومات =====
local InfoTab = Window:CreateTab("معلومات", nil)

InfoTab:CreateParagraph({
    Title = "مطور يوسف HUB",
    Content = "مشروع واجهة بلغة Lua\nصُنع بواسطة: مطور يوسف",
})

InfoTab:CreateButton({
    Name = "نسخ رابط الديسكورد",
    Callback = function()
        setclipboard("https://discord.gg/")
        Rayfield:Notify({
            Title = "مطور يوسف",
            Content = "تم نسخ رابط الديسكورد",
            Duration = 3,
        })
    end,
})
