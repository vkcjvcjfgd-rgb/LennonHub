
--  مطور يوسف | Mobile UI
-- UI demo inspired by the supplied screenshot

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local old = playerGui:FindFirstChild("YOUSEF_HUB")
if old then old:Destroy() end

local gui = Instance.new("ScreenGui")
gui.Name = "YOUSEF_HUB"
gui.ResetOnSpawn = false
gui.DisplayOrder = 99
gui.Parent = playerGui

local function make(class, props, parent)
    local obj = Instance.new(class)
    for k, v in pairs(props) do
        obj[k] = v
    end
    obj.Parent = parent
    return obj
end

local function round(obj, radius)
    make("UICorner", {
        CornerRadius = UDim.new(0, radius)
    }, obj)
end

local green = Color3.fromRGB(0, 220, 100)
local dark = Color3.fromRGB(9, 18, 12)
local panel = Color3.fromRGB(15, 28, 19)
local muted = Color3.fromRGB(125, 150, 132)

local main = make("Frame", {
    Name = "Main",
    Size = UDim2.new(0.91, 0, 0, 345),
    Position = UDim2.new(0.045, 0, 0.42, 0),
    BackgroundColor3 = dark,
    BackgroundTransparency = 0.04,
    BorderSizePixel = 0,
    Active = true,
    Draggable = true
}, gui)
round(main, 19)

make("UIStroke", {
    Color = Color3.fromRGB(36, 75, 43),
    Thickness = 2
}, main)

make("UISizeConstraint", {
    MinSize = Vector2.new(285, 345),
    MaxSize = Vector2.new(460, 390)
}, main)

local header = make("Frame", {
    Size = UDim2.new(1, 0, 0, 67),
    BackgroundColor3 = Color3.fromRGB(13, 24, 16),
    BorderSizePixel = 0
}, main)
round(header, 18)

make("TextLabel", {
    Position = UDim2.new(0, 16, 0, 10),
    Size = UDim2.new(0.66, 0, 0, 29),
    BackgroundTransparency = 1,
    Text = "YOUSEF HUB",
    Font = Enum.Font.GothamBold,
    TextSize = 20,
    TextXAlignment = Enum.TextXAlignment.Left,
    TextColor3 = Color3.fromRGB(245, 250, 244)
}, header)

make("TextLabel", {
    Position = UDim2.new(0, 17, 0, 38),
    Size = UDim2.new(0.7, 0, 0, 17),
    BackgroundTransparency = 1,
    Text = "EGG SYSTEM  •  MOBILE",
    Font = Enum.Font.GothamBold,
    TextSize = 9,
    TextXAlignment = Enum.TextXAlignment.Left,
    TextColor3 = muted
}, header)

local close = make("TextButton", {
    Position = UDim2.new(1, -43, 0, 16),
    Size = UDim2.new(0, 29, 0, 29),
    BackgroundColor3 = Color3.fromRGB(27, 43, 32),
    Text = "×",
    TextSize = 23,
    Font = Enum.Font.GothamBold,
    TextColor3 = Color3.new(1, 1, 1)
}, header)
round(close, 10)
close.Activated:Connect(function()
    gui:Destroy()
end)

local minimize = make("TextButton", {
    Position = UDim2.new(1, -78, 0, 16),
    Size = UDim2.new(0, 29, 0, 29),
    BackgroundColor3 = Color3.fromRGB(27, 43, 32),
    Text = "−",
    TextSize = 23,
    Font = Enum.Font.GothamBold,
    TextColor3 = Color3.new(1, 1, 1)
}, header)
round(minimize, 10)

local reopen = make("TextButton", {
    Size = UDim2.new(0, 125, 0, 42),
    Position = UDim2.new(0, 12, 0.5, 0),
    BackgroundColor3 = Color3.fromRGB(12, 30, 18),
    Text = "YOUSEF HUB  +",
    TextColor3 = green,
    TextSize = 13,
    Font = Enum.Font.GothamBold,
    Visible = false
}, gui)
round(reopen, 10)

minimize.Activated:Connect(function()
    main.Visible = false
    reopen.Visible = true
end)

reopen.Activated:Connect(function()
    main.Visible = true
    reopen.Visible = false
end)

local tabs = make("Frame", {
    Position = UDim2.new(0, 10, 0, 74),
    Size = UDim2.new(1, -20, 0, 35),
    BackgroundTransparency = 1
}, main)

local tabLayout = make("UIListLayout", {
    FillDirection = Enum.FillDirection.Horizontal,
    Padding = UDim.new(0, 5),
    HorizontalAlignment = Enum.HorizontalAlignment.Center
}, tabs)

local body = make("ScrollingFrame", {
    Position = UDim2.new(0, 10, 0, 117),
    Size = UDim2.new(1, -20, 1, -127),
    BackgroundColor3 = panel,
    BorderSizePixel = 0,
    ScrollBarThickness = 3,
    AutomaticCanvasSize = Enum.AutomaticSize.Y,
    CanvasSize = UDim2.new(0, 0, 0, 0)
}, main)
round(body, 13)

make("UIPadding", {
    PaddingTop = UDim.new(0, 9),
    PaddingLeft = UDim.new(0, 9),
    PaddingRight = UDim.new(0, 9),
    PaddingBottom = UDim.new(0, 9)
}, body)

make("UIListLayout", {
    Padding = UDim.new(0, 7),
    SortOrder = Enum.SortOrder.LayoutOrder
}, body)

local function clearBody()
    for _, child in ipairs(body:GetChildren()) do
        if child:IsA("GuiObject")
            and not child:IsA("UIListLayout")
            and not child:IsA("UIPadding") then
            child:Destroy()
        end
    end
end

local function label(text, height, color, textColor)
    local l = make("TextLabel", {
        Size = UDim2.new(1, -2, 0, height or 36),
        BackgroundColor3 = color or Color3.fromRGB(22, 39, 27),
        BorderSizePixel = 0,
        Text = text,
        TextColor3 = textColor or Color3.fromRGB(235, 243, 236),
        Font = Enum.Font.GothamMedium,
        TextSize = 13,
        TextWrapped = true
    }, body)
    round(l, 9)
    return l
end

local function button(text, callback)
    local b = make("TextButton", {
        Size = UDim2.new(1, -2, 0, 39),
        BackgroundColor3 = Color3.fromRGB(26, 48, 32),
        BorderSizePixel = 0,
        Text = text,
        TextColor3 = Color3.fromRGB(245, 250, 245),
        Font = Enum.Font.GothamBold,
        TextSize = 13,
        TextWrapped = true
    }, body)
    round(b, 9)
    b.Activated:Connect(callback)
    return b
end

local function toggle(text, initial)
    local enabled = initial or false
    local b

    local function update()
        b.Text = text .. (enabled and "   [ ON ]" or "   [ OFF ]")
        b.BackgroundColor3 = enabled
            and Color3.fromRGB(25, 100, 52)
            or Color3.fromRGB(26, 48, 32)
    end

    b = button("", function()
        enabled = not enabled
        update()
    end)
    update()
    return function()
        return enabled
    end
end

local currentEgg = 1
local eggs = {
    {
        name = "Pure Jellyfish",
        rarity = "Secret",
        value = "209.36M",
        rewards = {
            "Pure Jellyfish  |  5%",
            "Golden Fish     |  20%",
            "Blue Bunny      |  35%",
            "Green Cat       |  40%"
        }
    },
    {
        name = "Common Egg",
        rarity = "Common",
        value = "100",
        rewards = {
            "Bunny   |  50%",
            "Cat     |  30%",
            "Fox     |  15%",
            "Dragon  |  5%"
        }
    }
}

local pages = {}
local activeTab = "EGGS"
local tabButtons = {}

pages.HOME = function()
    clearBody()
    label("WELCOME TO YOUSEF HUB", 42)
    label("Mobile interface demo", 34, dark, muted)
    button("OPEN EGG INFORMATION", function()
        pages.EGGS()
        activeTab = "EGGS"
    end)
    label("Player: " .. player.Name, 35)
    label("This interface demo does not modify game data.", 45,
        Color3.fromRGB(48, 39, 22))
end

pages.STEAL = function()
    clearBody()
    label("STEAL  •  DEMO ONLY", 40)
    label("This panel does not steal items or interact with other players.", 58)
    toggle("Demo switch", false)
    toggle("Loop demo switch", false)
    label("Connect only to features in your own game.", 42,
        Color3.fromRGB(48, 39, 22))
end

pages.PLAYER = function()
    clearBody()
    label("PLAYER INFORMATION", 40)
    label("Username: " .. player.Name, 35)
    label("Display name: " .. player.DisplayName, 35)
    label("User ID: " .. tostring(player.UserId), 35)
    toggle("Example player option", false)
end

pages.EGGS = function()
    clearBody()
    local egg = eggs[currentEgg]

    label("EGG SYSTEM", 38)

    label("🥚  " .. egg.name, 43)
    label("RARITY: " .. egg.rarity, 31, dark, muted)
    label("VALUE: " .. egg.value, 36,
        Color3.fromRGB(12, 49, 26), green)

    button("‹ PREVIOUS EGG", function()
        currentEgg = currentEgg == 1 and #eggs or currentEgg - 1
        pages.EGGS()
    end)

    button("NEXT EGG  ›", function()
        currentEgg = currentEgg % #eggs + 1
        pages.EGGS()
    end)

    label("PRIZE CHANCES", 34)

    for _, reward in ipairs(egg.rewards) do
        label(reward, 31)
    end

    button("SIMULATE EGG", function()
        local result = egg.rewards[math.random(1, #egg.rewards)]
        label("SIMULATED RESULT: " .. result, 42,
            Color3.fromRGB(12, 65, 32), green)
    end)
end

pages.MISC = function()
    clearBody()
    label("MISCELLANEOUS", 40)
    toggle("Example toggle", false)
    toggle("Example loop toggle", false)

    button("RESET DEMO SETTINGS", function()
        pages.MISC()
    end)

    label("Settings here are temporary for this session.", 40,
        Color3.fromRGB(48, 39, 22))
end

local function showTab(name)
    activeTab = name
    for tabName, b in pairs(tabButtons) do
        b.BackgroundColor3 = tabName == name
            and Color3.fromRGB(28, 100, 49)
            or Color3.fromRGB(24, 40, 29)
    end
    pages[name]()
end

local tabNames = {
    {"HOME", "HOME"},
    {"STEAL", "STEAL"},
    {"PLAYER", "PLAYER"},
    {"EGGS", "EGGS"},
    {"MISC", "MISC"}
}

for _, info in ipairs(tabNames) do
    local name, caption = info[1], info[2]
    local b = make("TextButton", {
        Size = UDim2.new(0, 55, 1, 0),
        BackgroundColor3 = Color3.fromRGB(24, 40, 29),
        Text = caption,
        TextColor3 = Color3.new(1, 1, 1),
        TextSize = 10,
        Font = Enum.Font.GothamBold
    }, tabs)
    round(b, 7)
    tabButtons[name] = b
    b.Activated:Connect(function()
        showTab(name)
    end)
end

showTab("EGGS")
