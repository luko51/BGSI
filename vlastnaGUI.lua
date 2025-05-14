-- BGSI Visual Script for Roblox
-- Developed for MuMuPlayer & Codex
-- GitHub Loadstring Compatible

-- Vytvorenie GUI
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local PetNameLabel = Instance.new("TextLabel")
local PetNameInput = Instance.new("TextBox")
local EggTypeLabel = Instance.new("TextLabel")
local EggTypeInput = Instance.new("TextBox")
local ShinyLabel = Instance.new("TextLabel")
local MythicLabel = Instance.new("TextLabel")
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

-- Pet Name Label
PetNameLabel.Parent = MainFrame
PetNameLabel.Text = "Pet Name:"
PetNameLabel.Size = UDim2.new(1, -20, 0, 20)
PetNameLabel.Position = UDim2.new(0, 10, 0, 10)
PetNameLabel.BackgroundTransparency = 1
PetNameLabel.TextColor3 = Color3.new(1, 1, 1)
PetNameLabel.Font = Enum.Font.GothamBold
PetNameLabel.TextSize = 14

-- Pet Name Input
PetNameInput.Parent = MainFrame
PetNameInput.PlaceholderText = "Enter pet name..."
PetNameInput.Size = UDim2.new(1, -20, 0, 30)
PetNameInput.Position = UDim2.new(0, 10, 0, 30)
PetNameInput.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
PetNameInput.TextColor3 = Color3.new(1, 1, 1)

-- Egg Type Label
EggTypeLabel.Parent = MainFrame
EggTypeLabel.Text = "Egg Type:"
EggTypeLabel.Size = UDim2.new(1, -20, 0, 20)
EggTypeLabel.Position = UDim2.new(0, 10, 0, 70)
EggTypeLabel.BackgroundTransparency = 1
EggTypeLabel.TextColor3 = Color3.new(1, 1, 1)
EggTypeLabel.Font = Enum.Font.GothamBold
EggTypeLabel.TextSize = 14

-- Egg Type Input
EggTypeInput.Parent = MainFrame
EggTypeInput.PlaceholderText = "Select Egg"
EggTypeInput.Size = UDim2.new(1, -20, 0, 30)
EggTypeInput.Position = UDim2.new(0, 10, 0, 90)
EggTypeInput.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
EggTypeInput.TextColor3 = Color3.new(1, 1, 1)

-- Shiny Label
ShinyLabel.Parent = MainFrame
ShinyLabel.Text = "Shiny:"
ShinyLabel.Size = UDim2.new(0.5, -15, 0, 20)
ShinyLabel.Position = UDim2.new(0, 10, 0, 130)
ShinyLabel.BackgroundTransparency = 1
ShinyLabel.TextColor3 = Color3.new(1, 1, 1)
ShinyLabel.Font = Enum.Font.GothamBold
ShinyLabel.TextSize = 14

-- Mythic Label
MythicLabel.Parent = MainFrame
MythicLabel.Text = "Mythic:"
MythicLabel.Size = UDim2.new(0.5, -15, 0, 20)
MythicLabel.Position = UDim2.new(0.5, 5, 0, 130)
MythicLabel.BackgroundTransparency = 1
MythicLabel.TextColor3 = Color3.new(1, 1, 1)
MythicLabel.Font = Enum.Font.GothamBold
MythicLabel.TextSize = 14

-- Shiny Button
ShinyButton.Parent = MainFrame
ShinyButton.Size = UDim2.new(0.5, -15, 0, 30)
ShinyButton.Position = UDim2.new(0, 10, 0, 150)
ShinyButton.BackgroundColor3 = Color3.new(0.8, 0.1, 0.1)
ShinyButton.TextColor3 = Color3.new(1, 1, 1)
ShinyButton.Text = ""

-- Mythic Button
MythicButton.Parent = MainFrame
MythicButton.Size = UDim2.new(0.5, -15, 0, 30)
MythicButton.Position = UDim2.new(0.5, 5, 0, 150)
MythicButton.BackgroundColor3 = Color3.new(0.8, 0.1, 0.1)
MythicButton.TextColor3 = Color3.new(1, 1, 1)
MythicButton.Text = ""

-- Hatch tlačidlo
HatchButton.Parent = MainFrame
HatchButton.Text = "Hatch Pet"
HatchButton.Size = UDim2.new(1, -20, 0, 40)
HatchButton.Position = UDim2.new(0, 10, 0, 200)
HatchButton.BackgroundColor3 = Color3.new(0.1, 0.3, 0.5)
HatchButton.TextColor3 = Color3.new(1, 1, 1)

-- Kliknutie pre Shiny a Mythic
local shinyActive = false
local mythicActive = false

ShinyButton.MouseButton1Click:Connect(function()
    shinyActive = not shinyActive
    ShinyButton.BackgroundColor3 = shinyActive and Color3.new(0, 0.8, 0.1) or Color3.new(0.8, 0.1, 0.1)
end)

MythicButton.MouseButton1Click:Connect(function()
    mythicActive = not mythicActive
    MythicButton.BackgroundColor3 = mythicActive and Color3.new(0, 0.8, 0.1) or Color3.new(0.8, 0.1, 0.1)
end)

print("[BGSI] Main GUI Loaded Successfully")
