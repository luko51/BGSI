-- Vytvorenie GUI
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Button = Instance.new("TextButton")

-- Nastavenie vlastností
ScreenGui.Parent = game.CoreGui
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
Frame.Position = UDim2.new(0.5, -50, 0.5, -50)
Frame.Size = UDim2.new(0, 100, 0, 100)

Button.Parent = Frame
Button.Text = "Teleport"
Button.Size = UDim2.new(1, 0, 0.3, 0)
Button.Position = UDim2.new(0, 0, 0.7, 0)

-- Funkcia teleportu
Button.MouseButton1Click:Connect(function()
    local player = game.Players.LocalPlayer
    player.Character.HumanoidRootPart.CFrame = CFrame.new(0, 50, 0)
end)
