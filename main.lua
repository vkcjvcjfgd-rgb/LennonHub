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

-- سرعة
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

-- قفز
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

-- Loop يثبت السرعة والقفز
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
