-- BGSI Visual Script for Roblox
-- Developed for MuMuPlayer & Codex
-- GitHub Loadstring Compatible

-- Vytvorenie GUI
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local PetNameInput = Instance.new("TextBox")
local PetAmountInput = Instance.new("TextBox")
local ShinyButton = Instance.new("TextButton")
local MythicButton = Instance.new("TextButton")
local SpawnButton = Instance.new("TextButton")
local TopBar = Instance.new("Frame")
local PetDisplay = Instance.new("TextLabel")

-- Nastavenie GUI
ScreenGui.Parent = game.CoreGui

MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
MainFrame.Size = UDim2.new(0, 200, 0, 300)
MainFrame.Position = UDim2.new(0.5, -100, 0.5, -150)
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

-- TextBox pre počet
PetAmountInput.Parent = MainFrame
PetAmountInput.PlaceholderText = "1"
PetAmountInput.Size = UDim2.new(1, -20, 0, 30)
PetAmountInput.Position = UDim2.new(0, 10, 0, 70)
PetAmountInput.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
PetAmountInput.TextColor3 = Color3.new(1, 1, 1)

-- Shiny tlačidlo
ShinyButton.Parent = MainFrame
ShinyButton.Text = "Shiny: Off"
ShinyButton.Size = UDim2.new(0.5, -15, 0, 30)
ShinyButton.Position = UDim2.new(0, 10, 0, 110)
ShinyButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
ShinyButton.TextColor3 = Color3.new(1, 1, 1)

-- Mythic tlačidlo
MythicButton.Parent = MainFrame
MythicButton.Text = "Mythic: Off"
MythicButton.Size = UDim2.new(0.5, -15, 0, 30)
MythicButton.Position = UDim2.new(0.5, 5, 0, 110)
MythicButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
MythicButton.TextColor3 = Color3.new(1, 1, 1)

-- Spawn tlačidlo
SpawnButton.Parent = MainFrame
SpawnButton.Text = "Open Egg"
SpawnButton.Size = UDim2.new(1, -20, 0, 40)
SpawnButton.Position = UDim2.new(0, 10, 0, 150)
SpawnButton.BackgroundColor3 = Color3.new(0.1, 0.3, 0.5)
SpawnButton.TextColor3 = Color3.new(1, 1, 1)

-- Zobrazenie peta po otvorení
PetDisplay.Parent = MainFrame
PetDisplay.Text = ""
PetDisplay.Size = UDim2.new(1, -20, 0, 30)
PetDisplay.Position = UDim2.new(0, 10, 0, 200)
PetDisplay.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
PetDisplay.TextColor3 = Color3.new(1, 1, 1)
PetDisplay.TextScaled = true

-- Otvorenie vajíčka s animáciou
local function openEgg(name)
    print("Opening Egg for pet:", name)
    PetDisplay.Text = "You received: " .. name
end

SpawnButton.MouseButton1Click:Connect(function()
    openEgg(PetNameInput.Text)
end)

print("Script Loaded Successfully")
