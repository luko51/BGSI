-- Otvorenie vajíčka s realistickou animáciou
local function openEgg(name)
    print("Opening Egg for pet:", name)

    -- Vytvorenie animácie vajíčka
    local egg = Instance.new("Part")
    egg.Size = Vector3.new(3, 3, 3)
    egg.BrickColor = BrickColor.new("Bright yellow")
    egg.Anchored = true
    egg.Shape = "Ball"
    egg.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, 5, 0)
    egg.Parent = workspace

    -- Efekty trblietok
    local particles = Instance.new("ParticleEmitter")
    particles.Parent = egg
    particles.Texture = "rbxassetid://1184032778" -- Textúra trblietok
    particles.Rate = 50
    particles.Lifetime = NumberRange.new(2)

    -- Svetelný efekt
    local light = Instance.new("PointLight")
    light.Parent = egg
    light.Range = 15
    light.Brightness = 2

    -- Animácia rozbitia
    wait(2)
    particles.Enabled = false

    -- Pridanie efektu výbuchu
    local explosion = Instance.new("Explosion")
    explosion.Position = egg.Position
    explosion.BlastRadius = 5
    explosion.BlastPressure = 5000
    explosion.Parent = workspace

    -- Výpis získaného peta
    local message = Instance.new("BillboardGui")
    message.Size = UDim2.new(0, 200, 0, 50)
    message.StudsOffset = Vector3.new(0, 2, 0)
    message.Parent = egg

    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.Text = "You received: " .. name
    textLabel.TextColor3 = Color3.new(1, 1, 1)
    textLabel.BackgroundTransparency = 1
    textLabel.TextScaled = true
    textLabel.Parent = message

    wait(2)
    egg:Destroy()
end

SpawnButton.MouseButton1Click:Connect(function()
    openEgg(PetNameInput.Text)
end)
