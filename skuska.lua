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

-- Otvorenie animácie na celú obrazovku s prasknutím
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
    eggImage.Image = "rbxassetid://7041512717" -- Náhrada za animované vajce
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

    -- Animácia prasknutia
    wait(1.5)
    eggImage.Image = "rbxassetid://7041512717" -- Placeholder pre rozbité vajce (môžeme nahradiť lepším)
    wait(1.5)
    eggFrame:Destroy()
end

SpawnButton.MouseButton1Click:Connect(function()
    if PetNameInput.Text ~= "" then
        openEgg(PetNameInput.Text)
    else
        warn("Musíš zadať meno peta!")
    end
end)
