-- ===== YJW HUB | Steal an Egg | Delta Edition =====
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local RS = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer
local pg = player:WaitForChild("PlayerGui")

local old = pg:FindFirstChild("YJW_Hub")
if old then old:Destroy() end

local gui = Instance.new("ScreenGui", pg)
gui.Name = "YJW_Hub"
gui.ResetOnSpawn = false

-- ===== الواجهة =====
local Main = Instance.new("Frame", gui)
Main.Size = UDim2.new(0, 520, 0, 340)
Main.Position = UDim2.new(0.5, -260, 0.5, -170)
Main.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 10)

local H = Instance.new("Frame", Main)
H.Size = UDim2.new(1, 0, 0, 40)
H.BackgroundColor3 = Color3.fromRGB(200, 30, 30)
H.BorderSizePixel = 0
Instance.new("UICorner", H).CornerRadius = UDim.new(0, 10)

local T = Instance.new("TextLabel", H)
T.Size = UDim2.new(1, -50, 1, 0)
T.Position = UDim2.new(0, 15, 0, 0)
T.BackgroundTransparency = 1
T.Text = "YJW HUB | Steal an Egg"
T.TextColor3 = Color3.fromRGB(255, 255, 255)
T.Font = Enum.Font.GothamBold
T.TextSize = 16
T.TextXAlignment = Enum.TextXAlignment.Left

local X = Instance.new("TextButton", H)
X.Size = UDim2.new(0, 30, 0, 30)
X.Position = UDim2.new(1, -38, 0, 5)
X.BackgroundColor3 = Color3.fromRGB(150, 20, 20)
X.Text = "X"
X.TextColor3 = Color3.fromRGB(255, 255, 255)
X.Font = Enum.Font.GothamBold
Instance.new("UICorner", X).CornerRadius = UDim.new(0, 6)
X.MouseButton1Click:Connect(function() gui:Destroy() end)

local LT = Instance.new("Frame", Main)
LT.Size = UDim2.new(0, 105, 1, -50)
LT.Position = UDim2.new(0, 5, 0, 45)
LT.BackgroundTransparency = 1
local LL = Instance.new("UIListLayout", LT)
LL.Padding = UDim.new(0, 5)

local C = Instance.new("Frame", Main)
C.Size = UDim2.new(1, -125, 1, -50)
C.Position = UDim2.new(0, 115, 0, 45)
C.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
C.BorderSizePixel = 0
Instance.new("UICorner", C).CornerRadius = UDim.new(0, 6)

local Sc = Instance.new("ScrollingFrame", C)
Sc.Size = UDim2.new(1, -10, 1, -10)
Sc.Position = UDim2.new(0, 5, 0, 5)
Sc.BackgroundTransparency = 1
Sc.BorderSizePixel = 0
Sc.ScrollBarThickness = 3
Sc.CanvasSize = UDim2.new(0, 0, 0, 0)
Sc.AutomaticCanvasSize = Enum.AutomaticSize.Y
local CL = Instance.new("UIListLayout", Sc)
CL.Padding = UDim.new(0, 7)

-- ===== دوال =====
local function mkTab(txt, cb)
    local b = Instance.new("TextButton", LT)
    b.Size = UDim2.new(1, 0, 0, 38)
    b.BackgroundColor3 = Color3.fromRGB(180, 30, 30)
    b.Text = txt
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    b.Font = Enum.Font.GothamBold
    b.TextSize = 13
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 6)
    b.MouseButton1Click:Connect(cb)
end

local function mkTog(par, txt, def, cb)
    local f = Instance.new("Frame", par)
    f.Size = UDim2.new(1, -8, 0, 42)
    f.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
    f.BorderSizePixel = 0
    Instance.new("UICorner", f).CornerRadius = UDim.new(0, 6)
    local l = Instance.new("TextLabel", f)
    l.Size = UDim2.new(1, -70, 1, 0)
    l.Position = UDim2.new(0, 10, 0, 0)
    l.BackgroundTransparency = 1
    l.Text = txt
    l.TextColor3 = Color3.fromRGB(255, 255, 255)
    l.Font = Enum.Font.Gotham
    l.TextSize = 12
    l.TextXAlignment = Enum.TextXAlignment.Left
    local b = Instance.new("TextButton", f)
    b.Size = UDim2.new(0, 44, 0, 22)
    b.Position = UDim2.new(1, -52, 0.5, -11)
    b.BackgroundColor3 = def and Color3.fromRGB(60, 200, 60) or Color3.fromRGB(90, 90, 90)
    b.Text = ""
    Instance.new("UICorner", b).CornerRadius = UDim.new(1, 0)
    local d = Instance.new("Frame", b)
    d.Size = UDim2.new(0, 16, 0, 16)
    d.Position = def and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)
    d.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", d).CornerRadius = UDim.new(1, 0)
    local s = def
    b.MouseButton1Click:Connect(function()
        s = not s
        b.BackgroundColor3 = s and Color3.fromRGB(60, 200, 60) or Color3.fromRGB(90, 90, 90)
        d.Position = s and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)
        cb(s)
    end)
end

local function mkBtn(par, txt, cb)
    local b = Instance.new("TextButton", par)
    b.Size = UDim2.new(1, -8, 0, 38)
    b.BackgroundColor3 = Color3.fromRGB(180, 30, 30)
    b.Text = txt
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    b.Font = Enum.Font.GothamBold
    b.TextSize = 12
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 6)
    b.MouseButton1Click:Connect(cb)
end

local function mkPage()
    local p = Instance.new("Frame", Sc)
    p.Size = UDim2.new(1, 0, 0, 0)
    p.AutomaticSize = Enum.AutomaticSize.Y
    p.BackgroundTransparency = 1
    p.Visible = false
    local l = Instance.new("UIListLayout", p)
    l.Padding = UDim.new(0, 7)
    return p
end

local P1 = mkPage()
local P2 = mkPage()
local P3 = mkPage()

local function show(p)
    for _, x in pairs({P1, P2, P3}) do x.Visible = false end
    p.Visible = true
end

mkTab("Steal", function() show(P1) end)
mkTab("Player", function() show(P2) end)
mkTab("Eggs", function() show(P3) end)
show(P1)

-- ===== Steal =====
local autoSteal = false
mkTog(P1, "🥷 سرقة تلقائية", false, function(v) autoSteal = v end)

task.spawn(function()
    while task.wait(0.5) do
        if autoSteal and player.Character then
            local hrp = player.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                local closest, dist = nil, math.huge
                for _, o in pairs(workspace:GetDescendants()) do
                    if o:IsA("BasePart") then
                        local n = string.lower(o.Name)
                        if string.find(n, "egg") then
                            local d = (o.Position - hrp.Position).Magnitude
                            if d < dist then dist = d; closest = o end
                        end
                    end
                end
                if closest then
                    pcall(function() hrp.CFrame = closest.CFrame + Vector3.new(0, 2, 0) end)
                end
            end
        end
    end
end)

mkBtn(P1, "💰 بيع البيض", function()
    for _, o in pairs(RS:GetDescendants()) do
        if o:IsA("RemoteEvent") or o:IsA("RemoteFunction") then
            if string.find(string.lower(o.Name), "sell") then
                pcall(function() o:FireServer() end)
            end
        end
    end
end)

mkBtn(P1, "🥚 فقس البيض", function()
    for _, o in pairs(RS:GetDescendants()) do
        if o:IsA("RemoteEvent") or o:IsA("RemoteFunction") then
            if string.find(string.lower(o.Name), "hatch") then
                pcall(function() o:FireServer() end)
            end
        end
    end
end)

-- ===== Player =====
_G.inf = false
_G.fly = false
_G.nc = false

mkTog(P2, "🦅 قفز لا نهائي", false, function(v) _G.inf = v end)
mkTog(P2, "✈️ طيران", false, function(v) _G.fly = v end)
mkTog(P2, "👻 Noclip", false, function(v) _G.nc = v end)

task.spawn(function()
    while task.wait(0.1) do
        local c = player.Character
        if c then
            local h = c:FindFirstChildOfClass("Humanoid")
            if h then h.WalkSpeed = 16; h.JumpPower = 50 end
        end
    end
end)

UIS.JumpRequest:Connect(function()
    if _G.inf then
        local c = player.Character
        if c and c:FindFirstChildOfClass("Humanoid") then
            c:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
        end
    end
end)

RunService.Stepped:Connect(function()
    if _G.nc and player.Character then
        for _, p in pairs(player.Character:GetDescendants()) do
            if p:IsA("BasePart") then p.CanCollide = false end
        end
    end
end)

task.spawn(function()
    while task.wait() do
        if _G.fly then
            local c = player.Character
            if c then
                local hrp = c:FindFirstChild("HumanoidRootPart")
                if hrp and not hrp:FindFirstChild("YF") then
                    local g = Instance.new("BodyGyro", hrp); g.Name = "YF"
                    g.P = 9e4; g.MaxTorque = Vector3.new(9e9,9e9,9e9); g.CFrame = hrp.CFrame
                    local v = Instance.new("BodyVelocity", hrp); v.Name = "YFV"
                    v.Velocity = Vector3.new(0,0,0); v.MaxForce = Vector3.new(9e9,9e9,9e9)
                end
                if hrp then
                    local v = hrp:FindFirstChild("YFV")
                    if v then
                        local cam = workspace.CurrentCamera
                        local m = Vector3.new(0,0,0)
                        if UIS:IsKeyDown(Enum.KeyCode.W) then m = m + cam.CFrame.LookVector end
                        if UIS:IsKeyDown(Enum.KeyCode.S) then m = m - cam.CFrame.LookVector end
                        if UIS:IsKeyDown(Enum.KeyCode.A) then m = m - cam.CFrame.RightVector end
                        if UIS:IsKeyDown(Enum.KeyCode.D) then m = m + cam.CFrame.RightVector end
                        if UIS:IsKeyDown(Enum.KeyCode.Space) then m = m + Vector3.new(0,1,0) end
                        v.Velocity = m * 60
                    end
                end
            end
        end
    end
end)

-- ===== Eggs ESP =====
local esp = false
local list = {}

local function clearE()
    for _, g in pairs(list) do if g and g.Parent then g:Destroy() end end
    list = {}
end

local function addE(part, txt)
    if list[part] then return end
    local bb = Instance.new("BillboardGui", part)
    bb.Size = UDim2.new(0, 150, 0, 35)
    bb.StudsOffset = Vector3.new(0, 3, 0)
    bb.AlwaysOnTop = true
    local l = Instance.new("TextLabel", bb)
    l.Size = UDim2.new(1, 0, 1, 0)
    l.BackgroundTransparency = 0.4
    l.BackgroundColor3 = Color3.fromRGB(0,0,0)
    l.TextColor3 = Color3.fromRGB(255, 220, 50)
    l.Font = Enum.Font.GothamBold
    l.TextSize = 12
    l.Text = txt
    list[part] = bb
end

local function scan()
    for _, o in pairs(workspace:GetDescendants()) do
        if o:IsA("Model") or o:IsA("BasePart") then
            if string.find(string.lower(o.Name), "egg") then
                local p = o:IsA("BasePart") and o or o:FindFirstChildWhichIsA("BasePart")
                if p and not list[p] then addE(p, "🥚 " .. o.Name) end
            end
        end
    end
end

mkTog(P3, "👁️ ESP البيض", false, function(v)
    esp = v
    if not v then clearE() end
end)

task.spawn(function()
    while task.wait(2) do if esp then scan() end end
end)

mkBtn(P3, "🚀 روح لأقرب بيضة", function()
    local c = player.Character
    if not c then return end
    local hrp = c:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    local cl, d = nil, math.huge
    for _, o in pairs(workspace:GetDescendants()) do
        if o:IsA("BasePart") and string.find(string.lower(o.Name), "egg") then
            local dd = (o.Position - hrp.Position).Magnitude
            if dd < d then d = dd; cl = o end
        end
    end
    if cl then pcall(function() hrp.CFrame = cl.CFrame + Vector3.new(0, 3, 0) end) end
end)

print("✅ YJW HUB Loaded | Delta Edition")
