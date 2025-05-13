-- Vytvorenie presne rovnakého GUI ako na obrázku

-- Vytvorenie GUI
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local PetNameInput = Instance.new("TextBox")
local PetAmountInput = Instance.new("TextBox")
local ShinyButton = Instance.new("TextButton")
local MythicButton = Instance.new("TextButton")
local SpawnButton = Instance.new("TextButton")
local TopBar = Instance.new("Frame")

-- Nastavenie GUI
ScreenGui.Parent = game.CoreGui

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

-- Funkcia na pohyb okna
local dragging
local dragInput
local dragStart
local startPos

local function updateInput(input)
    local delta = input.Position - dragStart
    MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

TopBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

TopBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        updateInput(input)
    end
end)

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
SpawnButton.Text = "Spawn Pet"
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

-- Funkcia na spawnovanie peta
local function spawnPet(name, amount, shiny, mythic)
    for i = 1, tonumber(amount) do
        local pet = Instance.new("Model")
        pet.Name = name .. (shiny and "_Shiny" or "") .. (mythic and "_Mythic" or "")

        local petPart = Instance.new("Part")
        petPart.Name = "PetBody"
        petPart.Size = Vector3.new(2, 2, 2)
        petPart.BrickColor = BrickColor.new("Bright blue")
        petPart.Anchored = false
        petPart.Parent = pet
        pet.PrimaryPart = petPart

        pet:SetPrimaryPartCFrame(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0, 5, 0))
        pet.Parent = workspace

        print("Spawned Pet:", pet.Name)
    end
end

SpawnButton.MouseButton1Click:Connect(function()
    spawnPet(PetNameInput.Text, PetAmountInput.Text, shinyEnabled, mythicEnabled)
end)
