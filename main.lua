-- LENNON HUB
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "LENNON HUB",
    LoadingTitle = "LENNON HUB",
    LoadingSubtitle = "Welcome",
    ConfigurationSaving = { Enabled = false },
    KeySystem = false,
})

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

-- Loop يثبّت السرعة والقفز
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
