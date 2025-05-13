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

-- Pohyb tabuľky
local dragging = false
local dragInput, dragStart, startPos

TopBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
    end
end)

TopBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

TopBar.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

-- Udalosť na sledovanie pohybu
game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

print("Script Loaded Successfully")
