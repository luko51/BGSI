-- BGSI Visual Script for Roblox
-- Developed for MuMuPlayer & Codex
-- GitHub Loadstring Compatible

-- Vytvorenie GUI
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local PetNameInput = Instance.new("TextBox")
local EggTypeInput = Instance.new("TextBox")
local ShinyButton = Instance.new("TextButton")
local MythicButton = Instance.new("TextButton")
local HatchButton = Instance.new("TextButton")

-- Nastavenie GUI
ScreenGui.Name = "BGSI_Visual_GUI"
ScreenGui.Parent = game.CoreGui

MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
MainFrame.Size = UDim2.new(0, 250, 0, 300)
MainFrame.Position = UDim2.new(0.5, -125, 0.5, -150)
MainFrame.Active = true

-- TextBox pre meno peta
PetNameInput.Parent = MainFrame
PetNameInput.PlaceholderText = "Enter pet name..."
PetNameInput.Size = UDim2.new(1, -20, 0, 30)
PetNameInput.Position = UDim2.new(0, 10, 0, 30)
PetNameInput.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
PetNameInput.TextColor3 = Color3.new(1, 1, 1)

-- TextBox pre typ vajíčka
EggTypeInput.Parent = MainFrame
EggTypeInput.PlaceholderText = "Select Egg"
EggTypeInput.Size = UDim2.new(1, -20, 0, 30)
EggTypeInput.Position = UDim2.new(0, 10, 0, 70)
EggTypeInput.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
EggTypeInput.TextColor3 = Color3.new(1, 1, 1)

-- Shiny tlačidlo
ShinyButton.Parent = MainFrame
ShinyButton.Text = "Shiny"
ShinyButton.Size = UDim2.new(0.5, -15, 0, 30)
ShinyButton.Position = UDim2.new(0, 10, 0, 110)
ShinyButton.BackgroundColor3 = Color3.new(0.8, 0.1, 0.1)
ShinyButton.TextColor3 = Color3.new(1, 1, 1)

-- Mythic tlačidlo
MythicButton.Parent = MainFrame
MythicButton.Text = "Mythic"
MythicButton.Size = UDim2.new(0.5, -15, 0, 30)
MythicButton.Position = UDim2.new(0.5, 5, 0, 110)
MythicButton.BackgroundColor3 = Color3.new(0.8, 0.1, 0.1)
MythicButton.TextColor3 = Color3.new(1, 1, 1)

-- Hatch tlačidlo
HatchButton.Parent = MainFrame
HatchButton.Text = "Hatch Pet"
HatchButton.Size = UDim2.new(1, -20, 0, 40)
HatchButton.Position = UDim2.new(0, 10, 0, 160)
HatchButton.BackgroundColor3 = Color3.new(0.1, 0.3, 0.5)
HatchButton.TextColor3 = Color3.new(1, 1, 1)

print("[BGSI] Main GUI Loaded Successfully")
