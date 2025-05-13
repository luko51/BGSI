-- Roblox Bubble Gum Simulator GUI Script
-- Spúšťané cez MuMuPlayer a Codex

-- Vytvorenie GUI
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local PetNameInput = Instance.new("TextBox")
local ShinyButton = Instance.new("TextButton")
local MythicButton = Instance.new("TextButton")
local SpawnButton = Instance.new("TextButton")
local TopBar = Instance.new("Frame")

-- Nastavenie GUI
ScreenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
MainFrame.Size = UDim2.new(0, 200, 0, 250)
MainFrame.Position = UDim2.new(0.5, -100, 0.5, -125)
MainFrame.Active = true

-- Horná lišta pre pohyb
TopBar.Parent = MainFrame
TopBar.Size = UDim2.new(1, 0, 0, 20)
TopBar.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
TopBar.Position = UDim2.new(0, 0, 0, 0)
TopBar.Active = true

-- TextBox pre meno peta
PetNameInput.Parent = MainFrame
PetNameInput.PlaceholderText = "Pet Name"
PetNameInput.Size = UDim2.new(1, -20, 0, 30)
PetNameInput.Position = UDim2.new(0, 10, 0, 30)
PetNameInput.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
PetNameInput.TextColor3 = Color3.new(1, 1, 1)

-- Spawn tlačidlo
SpawnButton.Parent = MainFrame
SpawnButton.Text = "Open Egg"
SpawnButton.Size = UDim2.new(1, -20, 0, 40)
SpawnButton.Position = UDim2.new(0, 10, 0, 150)
SpawnButton.BackgroundColor3 = Color3.new(0.1, 0.3, 0.5)
SpawnButton.TextColor3 = Color3.new(1, 1, 1)

-- Funkčnosť tlačidiel
local shinyEnabled = false
local mythicEnabled = false

ShinyButton.MouseButton1Click:Connect(function()
    shinyEnabled = not shinyEnabled
    ShinyButton.Text = shinyEnabled and "Shiny: On" or "Shiny: Off"
end)

MythicButton.MouseButton1Click:Connect(function()
    mythicEnabled = not mythicEnabled
    MythicButton.Text = mythicEnabled and "Mythic: On" or "Mythic: Off"
end)

-- Otvorenie vajíčka s animáciou a eventom
local function openEgg(name)
    print("Opening Egg for pet:", name)

    -- Pridáme Shiny alebo Mythic ak sú zapnuté
    if shinyEnabled then
        name = "Shiny " .. name
    end
    if mythicEnabled then
        name = "Mythic " .. name
    end

    -- Spustenie animácie cez HatchEgg event
    local args = {
        [1] = "Easter Egg",
        [2] = 1,
        [3] = {name}
    }

    local event = game:GetService("ReplicatedStorage"):FindFirstChild("HatchEgg")
    if event then
        event:FireServer(unpack(args))
        print("Animácia otvorenia vajíčka bola spustená pre: " .. name)
    else
        warn("Nepodarilo sa nájsť event 'HatchEgg'.")
    end
end

SpawnButton.MouseButton1Click:Connect(function()
    openEgg(PetNameInput.Text)
end)
