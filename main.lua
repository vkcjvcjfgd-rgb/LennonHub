
-- YOUSEF HUB
-- Egg Prize Simulator
-- Made by Yousef

local Hub = {
    Name = "YOUSEF HUB",
    Version = "1.0"
}

local Eggs = {
    {
        Name = "Common Egg",
        Price = 100,
        Rewards = {
            {Name = "Bunny", Chance = 50, Reward = 50},
            {Name = "Cat", Chance = 30, Reward = 100},
            {Name = "Fox", Chance = 15, Reward = 250},
            {Name = "Dragon", Chance = 5, Reward = 1000}
        }
    },
    {
        Name = "Rare Egg",
        Price = 500,
        Rewards = {
            {Name = "Dog", Chance = 45, Reward = 200},
            {Name = "Tiger", Chance = 30, Reward = 500},
            {Name = "Phoenix", Chance = 20, Reward = 1500},
            {Name = "Golden Dragon", Chance = 5, Reward = 5000}
        }
    }
}

local function ShowEgg(egg)
    print("\n===== " .. Hub.Name .. " =====")
    print("Egg: " .. egg.Name)
    print("Price: $" .. egg.Price)
    print("--- Prize Chances ---")

    for _, prize in ipairs(egg.Rewards) do
        print(
            prize.Name ..
            " | Chance: " .. prize.Chance .. "%" ..
            " | Reward: $" .. prize.Reward
        )
    end
end

local function OpenEgg(egg)
    local roll = math.random(1, 100)
    local total = 0

    for _, prize in ipairs(egg.Rewards) do
        total = total + prize.Chance

        if roll <= total then
            print("\nYou got: " .. prize.Name)
            print("Prize value: $" .. prize.Reward)
            return prize
        end
    end
end

math.randomseed(os.time())

-- Display egg information
for _, egg in ipairs(Eggs) do
    ShowEgg(egg)
end

-- Example: simulate one egg opening
OpenEgg(Eggs[1])
