
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "YOUSEF_HUB"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local blue = Color3.fromRGB(20, 100, 255)

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 280, 0, 260)
frame.Position = UDim2.new(0.5, -140, 0.5, -130)
frame.BackgroundColor3 = Color3.fromRGB(12, 12, 22)
frame.Parent = gui

local corner = Instance.new("UICorner", frame)
corner.CornerRadius = UDim.new(0, 14)

local stroke = Instance.new("UIStroke", frame)
stroke.Color = blue
stroke.Thickness = 2

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 50)
title.BackgroundTransparency = 1
title.Text = "YOUSEF HUB | مطور يوسف"
title.TextColor3 = blue
title.TextSize = 19
title.Font = Enum.Font.GothamBold
title.Parent = frame

local function button(text, y, callback)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0.85, 0, 0, 43)
    b.Position = UDim2.new(0.075, 0, 0, y)
    b.BackgroundColor3 = Color3.fromRGB(25, 35, 65)
    b.TextColor3 = Color3.new(1, 1, 1)
    b.TextSize = 17
    b.Font = Enum.Font.GothamBold
    b.Text = text
    b.Parent = frame
    Instance.new("UICorner", b).CornerRadius =
        UDim.new(0, 9)
    b.Activated:Connect(callback)
    return b
end

local speed = false
button("Speed ON / OFF", 60, function()
    speed = not speed
    local char = player.Character
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    if hum then
        hum.WalkSpeed = speed and 32 or 16
    end
end)

local jump = false
button("Jump ON / OFF", 112, function()
    jump = not jump
    local char = player.Character
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    if hum then
        hum.UseJumpPower = true
        hum.JumpPower = jump and 85 or 50
    end
end)

button("Close / Open", 164, function()
    frame.Visible = false
end)

local open = Instance.new("TextButton")
open.Size = UDim2.new(0, 105, 0, 40)
open.Position = UDim2.new(0, 15, 0.35, 0)
open.Text = "YOUSEF HUB"
open.TextColor3 = Color3.new(1, 1, 1)
open.BackgroundColor3 = blue
open.Parent = gui
Instance.new("UICorner", open).CornerRadius =
    UDim.new(0, 10)

open.Activated:Connect(function()
    frame.Visible = not frame.Visible
end)

player.CharacterAdded:Connect(function(char)
    local hum = char:WaitForChild("Humanoid")
    hum.WalkSpeed = speed and 32 or 16
    hum.UseJumpPower = true
    hum.JumpPower = jump and 85 or 50
end)
