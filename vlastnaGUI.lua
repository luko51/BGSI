-- Vytvorenie presne rovnakého GUI ako na obrázku

-- Vytvorenie GUI
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local PetNameInput = Instance.new("TextBox")
local PetAmountInput = Instance.new("TextBox")
local ShinyButton = Instance.new("TextButton")
local MythicButton = Instance.new("TextButton")
local SpawnButton = Instance.new("TextButton")

-- Nastavenie GUI
ScreenGui.Parent = game.CoreGui

MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
MainFrame.Size = UDim2.new(0, 200, 0, 250)
MainFrame.Position = UDim2.new(0.5, -100, 0.5, -125)

-- TextBox pre meno peta
PetNameInput.Parent = MainFrame
PetNameInput.PlaceholderText = "Pet Name"
PetNameInput.Size = UDim2.new(1, -20, 0, 30)
PetNameInput.Position = UDim2.new(0, 10, 0, 10)
PetNameInput.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
PetNameInput.TextColor3 = Color3.new(1, 1, 1)

-- TextBox pre počet
PetAmountInput.Parent = MainFrame
PetAmountInput.PlaceholderText = "1"
PetAmountInput.Size = UDim2.new(1, -20, 0, 30)
PetAmountInput.Position = UDim2.new(0, 10, 0, 50)
PetAmountInput.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
PetAmountInput.TextColor3 = Color3.new(1, 1, 1)

-- Shiny tlačidlo
ShinyButton.Parent = MainFrame
ShinyButton.Text = "Shiny: Off"
ShinyButton.Size = UDim2.new(0.5, -15, 0, 30)
ShinyButton.Position = UDim2.new(0, 10, 0, 90)
ShinyButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
ShinyButton.TextColor3 = Color3.new(1, 1, 1)

-- Mythic tlačidlo
MythicButton.Parent = MainFrame
MythicButton.Text = "Mythic: Off"
MythicButton.Size = UDim2.new(0.5, -15, 0, 30)
MythicButton.Position = UDim2.new(0.5, 5, 0, 90)
MythicButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
MythicButton.TextColor3 = Color3.new(1, 1, 1)

-- Spawn tlačidlo
SpawnButton.Parent = MainFrame
SpawnButton.Text = "Spawn Pet"
SpawnButton.Size = UDim2.new(1, -20, 0, 40)
SpawnButton.Position = UDim2.new(0, 10, 0, 130)
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

SpawnButton.MouseButton1Click:Connect(function()
    print("Spawning Pet:", PetNameInput.Text, "Amount:", PetAmountInput.Text, "Shiny:", shinyEnabled, "Mythic:", mythicEnabled)
end)
