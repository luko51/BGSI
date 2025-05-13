-- Základné GUI s pohyblivým oknom a funkciami v pravom hornom rohu

-- Vytvorenie GUI
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TopBar = Instance.new("Frame")
local MinimizeButton = Instance.new("TextButton")
local MaximizeButton = Instance.new("TextButton")
local CloseButton = Instance.new("TextButton")

-- Nastavenie GUI
ScreenGui.Parent = game.CoreGui

MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.new(0.12, 0.12, 0.12)
MainFrame.Size = UDim2.new(0, 600, 0, 400)
MainFrame.Position = UDim2.new(0.5, -300, 0.5, -200)
MainFrame.Active = true
MainFrame.Draggable = true

-- Horná lišta
TopBar.Parent = MainFrame
TopBar.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
TopBar.Size = UDim2.new(1, 0, 0, 30)
TopBar.Position = UDim2.new(0, 0, 0, 0)

-- Minimalizácia
MinimizeButton.Parent = TopBar
MinimizeButton.Text = "-"
MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
MinimizeButton.Position = UDim2.new(0.85, 0, 0, 0)
MinimizeButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)

-- Maximalizácia
MaximizeButton.Parent = TopBar
MaximizeButton.Text = "[]"
MaximizeButton.Size = UDim2.new(0, 30, 0, 30)
MaximizeButton.Position = UDim2.new(0.90, 0, 0, 0)
MaximizeButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)

-- Zatvorenie
CloseButton.Parent = TopBar
CloseButton.Text = "X"
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(0.95, 0, 0, 0)
CloseButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)

-- Funkcie tlačidiel
MinimizeButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
end)

MaximizeButton.MouseButton1Click:Connect(function()
    MainFrame.Size = UDim2.new(0, 800, 0, 500)
    MainFrame.Position = UDim2.new(0.5, -400, 0.5, -250)
end)

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)
