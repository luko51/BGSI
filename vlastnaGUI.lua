-- Vytvorenie moderného GUI
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Sidebar = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local CloseButton = Instance.new("TextButton")

-- Sekcie
local sections = {"Core", "Enchants", "Eggs", "Rifts", "Potions", "Webhook"}
local buttons = {}

-- Nastavenie GUI vlastností
ScreenGui.Parent = game.CoreGui

MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
MainFrame.Position = UDim2.new(0.3, 0, 0.2, 0)
MainFrame.Size = UDim2.new(0, 600, 0, 400)
MainFrame.Visible = true
MainFrame.BorderSizePixel = 0

-- Sidebar pre sekcie
Sidebar.Parent = MainFrame
Sidebar.BackgroundColor3 = Color3.new(0.08, 0.08, 0.08)
Sidebar.Size = UDim2.new(0.2, 0, 1, 0)
Sidebar.Position = UDim2.new(0, 0, 0, 0)
Sidebar.BorderSizePixel = 0

-- Hlavný názov
Title.Parent = MainFrame
Title.Text = "Game Enhancer"
Title.Size = UDim2.new(1, 0, 0.1, 0)
Title.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
Title.TextColor3 = Color3.new(1, 1, 1)
Title.TextScaled = true
Title.Position = UDim2.new(0, 0, 0, 0)

-- Close Button
CloseButton.Parent = MainFrame
CloseButton.Text = "X"
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(0.95, 0, 0.02, 0)
CloseButton.BackgroundColor3 = Color3.new(0.5, 0, 0)
CloseButton.TextColor3 = Color3.new(1, 1, 1)

-- Funkcia na zatvorenie
CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Generovanie tlačidiel sekcií
for index, section in ipairs(sections) do
    local button = Instance.new("TextButton")
    button.Parent = Sidebar
    button.Text = section
    button.Size = UDim2.new(1, -10, 0, 40)
    button.Position = UDim2.new(0, 5, 0, (index - 1) * 45 + 5)
    button.BackgroundColor3 = Color3.new(0.12, 0.12, 0.12)
    button.TextColor3 = Color3.new(1, 1, 1)
    button.BorderSizePixel = 0
    buttons[section] = button
end

-- Hlavná obrazovka (Content Frame)
local ContentFrame = Instance.new("Frame")
ContentFrame.Parent = MainFrame
ContentFrame.BackgroundColor3 = Color3.new(0.18, 0.18, 0.18)
ContentFrame.Size = UDim2.new(0.8, 0, 0.9, 0)
ContentFrame.Position = UDim2.new(0.2, 0, 0.1, 0)
ContentFrame.BorderSizePixel = 0

-- Obsah bude dynamicky generovaný podľa sekcií
