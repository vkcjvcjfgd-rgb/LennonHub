
--[[
    الاسم: مطور يوسف
    المشروع: Monster Scanner
    المنصة: Delta Executor
]]

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

local player = Players.LocalPlayer

local function scanMonsters()
    print("================================")
    print("🐲 سكربت مطور يوسف")
    print("👤 اللاعب: " .. player.Name)
    print("🔍 جاري البحث عن الوحوش...")
    print("================================")

    local count = 0

    for _, obj in ipairs(Workspace:GetDescendants()) do
        if obj:IsA("Model")
            and obj:FindFirstChildOfClass("Humanoid")
            and obj ~= player.Character then

            count += 1
            print("🐲 وحش " .. count .. ": " .. obj.Name)
        end
    end

    print("✅ انتهى الفحص")
    print("📊 عدد النماذج المكتشفة: " .. count)
    print("⚠️ الفحص لا يعطل الهجوم")
end

scanMonsters()
