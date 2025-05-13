-- Vytvorenie GUI
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")

-- Inicializácia tlačidiel
local TeleportButton = Instance.new("TextButton")
local AutoCollectButton = Instance.new("TextButton")
local SpeedBoostButton = Instance.new("TextButton")
local PetInput = Instance.new("TextBox")
local AddPetButton = Instance.new("TextButton")
local PetList = Instance.new("ScrollingFrame")

-- Nastavenie GUI vlastností
ScreenGui.Parent = game.CoreGui

MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
MainFrame.Size = UDim2.new(0, 300, 0, 200)

Title.Parent = MainFrame
Title.Text = "Game Enhancer"
Title.Size = UDim2.new(1, 0, 0.2, 0)
Title.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)

-- Teleport tlačidlo
TeleportButton.Parent = MainFrame
TeleportButton.Text = "Teleport"
TeleportButton.Size = UDim2.new(0.5, -5, 0.15, 0)
TeleportButton.Position = UDim2.new(0, 0, 0.2, 0)

TeleportButton.MouseButton1Click:Connect(function()
    local player = game.Players.LocalPlayer
    player.Character.HumanoidRootPart.CFrame = CFrame.new(0, 50, 0)
end)

-- Auto Collect tlačidlo
AutoCollectButton.Parent = MainFrame
AutoCollectButton.Text = "Auto Collect"
AutoCollectButton.Size = UDim2.new(0.5, -5, 0.15, 0)
AutoCollectButton.Position = UDim2.new(0.5, 5, 0.2, 0)

-- Speed Boost tlačidlo
SpeedBoostButton.Parent = MainFrame
SpeedBoostButton.Text = "Speed Boost"
SpeedBoostButton.Size = UDim2.new(1, 0, 0.15, 0)
SpeedBoostButton.Position = UDim2.new(0, 0, 0.35, 0)

-- Input pre zadávanie petov
PetInput.Parent = MainFrame
PetInput.PlaceholderText = "Zadaj meno peta"
PetInput.Size = UDim2.new(0.7, 0, 0.15, 0)
PetInput.Position = UDim2.new(0, 0, 0.55, 0)

-- Tlačidlo na pridanie do zoznamu
AddPetButton.Parent = MainFrame
AddPetButton.Text = "Pridať Peta"
AddPetButton.Size = UDim2.new(0.3, 0, 0.15, 0)
AddPetButton.Position = UDim2.new(0.7, 0, 0.55, 0)

-- Scrollovacia tabuľka
PetList.Parent = MainFrame
PetList.Size = UDim2.new(1, 0, 0.25, 0)
PetList.Position = UDim2.new(0, 0, 0.75, 0)
PetList.CanvasSize = UDim2.new(0, 0, 1, 0)

-- Pridávanie do tabuľky
AddPetButton.MouseButton1Click:Connect(function()
    if PetInput.Text ~= "" then
        local PetLabel = Instance.new("TextLabel")
        PetLabel.Parent = PetList
        PetLabel.Text = PetInput.Text
        PetLabel.Size = UDim2.new(1, 0, 0, 20)
        PetLabel.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
        PetLabel.TextColor3 = Color3.new(1, 1, 1)
        PetInput.Text = ""
    end
end)
