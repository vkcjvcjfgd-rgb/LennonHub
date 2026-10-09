-- LENNON HUB
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "LENNON HUB",
    LoadingTitle = "LENNON HUB",
    LoadingSubtitle = "Welcome",
    ConfigurationSaving = {
        Enabled = false,
    },
    KeySystem = false,
})

-- تبويب رئيسي
local MainTab = Window:CreateTab("الرئيسية", nil)

MainTab:CreateButton({
    Name = "زر تجريبي",
    Callback = function()
        Rayfield:Notify({
            Title = "LENNON HUB",
            Content = "تم الضغط على الزر!",
            Duration = 3,
        })
    end,
})

MainTab:CreateToggle({
    Name = "تفعيل تجريبي",
    CurrentValue = false,
    Flag = "TestToggle",
    Callback = function(value)
        print("الحالة:", value)
    end,
})

MainTab:CreateSlider({
    Name = "السرعة",
    Range = {16, 200},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 16,
    Flag = "SpeedSlider",
    Callback = function(value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
    end,
})
