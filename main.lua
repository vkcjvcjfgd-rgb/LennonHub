-- الكود مفتوح المصدر، انسخه كما هو
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer
local TOGGLE_KEY = Enum.KeyCode.Quote
local isFrozen = false
local function toggleFreeze()
    local char = player.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Torso")
    local humanoid = char:FindFirstChildOfClass("Humanoid")
    isFrozen = not isFrozen
    if hrp then hrp.Anchored = isFrozen end
    if humanoid then humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, not isFrozen) end
end
UserInputService.InputBegan:Connect(function(input, processed)
    if processed then return end
    if input.KeyCode == TOGGLE_KEY then toggleFreeze() end
end)
player.CharacterAdded:Connect(function() isFrozen = false end)
