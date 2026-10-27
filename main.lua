local Library = loadstring(game:HttpGet("https://cdn.jsdelivr.net/gh/RayKits/RayLib@main/RayLib.lua"))()

-- إنشاء النافذة الرئيسية
local Window = Library:CreateWindow({
    Name = "Daxh hub ⚡", -- العنوان بالنيون الأخضر
    LoadingTitle = "Daxh Hub Loading...",
    LoadingText = "Preparing your advantages...",
    Theme = "NeonGreen" 
})

-- إضافة تبويب رئيسي
local MainTab = Window:CreateTab({
    Name = "Main Cheats",
    Icon = "rbxassetid://10751332155"
})

-- قسم السرعة والقفز
MainTab:CreateSection("Player Enhancements")

MainTab:CreateSlider({
    Name = "Speed Hack ⚡",
    Min = 16,
    Max = 500,
    Default = 16,
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
    end
})

MainTab:CreateSlider({
    Name = "Jump Power 🚀",
    Min = 50,
    Max = 1000,
    Default = 50,
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
    end
})

-- قسم الأزرار الملونة (تفعيل/تعطيل)
MainTab:CreateSection("Auto-Farm System")

local AutoFarmEnabled = false

MainTab:CreateButton({
    Name = "✨ ATIVAR AUTO-STEAL ✨", -- زر تفعيل بلون نيون أخضر وتصميم عصري
    Callback = function()
        AutoFarmEnabled = true
        -- تأثير بصري عند الضغط
        print("Auto-Steal Activated!")
        
        spawn(function()
            while AutoFarmEnabled do
                task.wait(0.1)
                -- البحث عن البيضة في الماب وسرقتها تلقائياً
                for _, v in pairs(game.Workspace:GetDescendants()) do
                    if v.Name == "Egg" or v.Name == "TargetEgg" then 
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                        -- محاكاة الضغط على زر السرقة
                        fireclickdetector(v:FindFirstChildOfClass("ClickDetector"))
                    end
                end
            end
        end)
    end
})

MainTab:CreateButton({
    Name = "🛑 DESATIVAR AUTO-STEAL 🛑", -- زر تعطيل بلون نيون أخضر وتصميم عصري
    Callback = function()
        AutoFarmEnabled = false
        print("Auto-Steal Deactivated!")
    end
})

-- قسم إضافي للميزات
MainTab:CreateSection("Special Mods")

MainTab:CreateToggle({
    Name = "Infinite Jump",
    Default = false,
    Callback = function(State)
        _G.InfiniteJump = State
        game:GetService("UserInputService").JumpRequest:Connect(function()
            if _G.InfiniteJump then
                game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
            end
        end)
    end
})

-- إشعار عند التشغيل
game.StarterGui:SetCore("SendNotification", {
    Title = "Daxh Hub",
    Text = "Script Loaded Successfully! Enjoy!",
    Duration = 5
})
