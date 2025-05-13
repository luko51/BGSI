-- Vytvorenie presne rovnakého GUI ako na obrázku

-- Vytvorenie GUI
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local PetNameInput = Instance.new("TextBox")
local SpawnButton = Instance.new("TextButton")
local TopBar = Instance.new("Frame")

-- Nastavenie GUI
ScreenGui.Parent = game.CoreGui

MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
MainFrame.Size = UDim2.new(0, 200, 0, 150)
MainFrame.Position = UDim2.new(0.5, -100, 0.5, -75)
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
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType.MouseButton1 then
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

-- Spawn tlačidlo
SpawnButton.Parent = MainFrame
SpawnButton.Text = "Open Egg"
SpawnButton.Size = UDim2.new(1, -20, 0, 40)
SpawnButton.Position = UDim2.new(0, 10, 0, 70)
SpawnButton.BackgroundColor3 = Color3.new(0.1, 0.3, 0.5)
SpawnButton.TextColor3 = Color3.new(1, 1, 1)

-- Otvorenie animácie na celú obrazovku
local function openEgg(name)
    print("Opening Egg for pet:", name)

    -- Vytvorenie animácie GUI
    local eggFrame = Instance.new("Frame")
    eggFrame.Parent = ScreenGui
    eggFrame.Size = UDim2.new(1, 0, 1, 0)
    eggFrame.BackgroundColor3 = Color3.new(0, 0, 0)
    eggFrame.BackgroundTransparency = 0.5

    -- Vajce
    local eggImage = Instance.new("ImageLabel")
    eggImage.Parent = eggFrame
    eggImage.Size = UDim2.new(0, 300, 0, 300)
    eggImage.Position = UDim2.new(0.5, -150, 0.5, -150)
    eggImage.Image = "rbxassetid://7054112288" -- Náhrada za animované vajce
    eggImage.BackgroundTransparency = 1

    -- Text
    local petLabel = Instance.new("TextLabel")
    petLabel.Parent = eggFrame
    petLabel.Size = UDim2.new(1, 0, 0, 50)
    petLabel.Position = UDim2.new(0, 0, 0.8, 0)
    petLabel.Text = "You received: " .. name
    petLabel.TextColor3 = Color3.new(1, 1, 1)
    petLabel.BackgroundTransparency = 1
    petLabel.TextScaled = true

    -- Animácia
    wait(3)
    eggFrame:Destroy()
end

SpawnButton.MouseButton1Click:Connect(function()
    openEgg(PetNameInput.Text)
end)
