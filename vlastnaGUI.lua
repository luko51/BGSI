-- Vytvorenie GUI
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Sidebar = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local CloseButton = Instance.new("TextButton")
local MinimizeButton = Instance.new("TextButton")

-- Funkcia na pohyb oknom
local dragging = false
local dragInput, dragStart, startPos

local function update(input)
    local delta = input.Position - dragStart
    MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

MainFrame.InputBegan:Connect(function(input)
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

MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

MainFrame.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

-- Nastavenie pre minimalizovanie a zatvorenie okna
CloseButton.Parent = MainFrame
CloseButton.Text = "X"
CloseButton.Size = UDim2.new(0, 25, 0, 25)
CloseButton.Position = UDim2.new(0.97, -30, 0, 5)
CloseButton.BackgroundColor3 = Color3.new(0.8, 0, 0)

MinimizeButton.Parent = MainFrame
MinimizeButton.Text = "-"
MinimizeButton.Size = UDim2.new(0, 25, 0, 25)
MinimizeButton.Position = UDim2.new(0.92, -60, 0, 5)
MinimizeButton.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)

-- Sekcie
local sections = {"Core", "Enchants", "Eggs", "Rifts", "Potions", "Webhook", "Duplicate"}

-- Nastavenie GUI vlastností
ScreenGui.Parent = game.CoreGui

MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -150)
MainFrame.Size = UDim2.new(0, 500, 0, 300)
MainFrame.Visible = true

-- Sidebar pre sekcie
Sidebar.Parent = MainFrame
Sidebar.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
Sidebar.Size = UDim2.new(0.2, 0, 1, 0)
Sidebar.Position = UDim2.new(0, 0, 0, 0)

-- Tlačidlá sekcií
for index, section in ipairs(sections) do
    local btn = Instance.new("TextButton")
    btn.Parent = Sidebar
    btn.Text = section
    btn.Size = UDim2.new(1, -10, 0.1, 0)
    btn.Position = UDim2.new(0, 5, (index - 1) * 0.1 + 0.05, 0)
    btn.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    btn.TextColor3 = Color3.new(1, 1, 1)
end

-- Hlavný obsah sekcie (placeholder na ďalšie možnosti)
local ContentFrame = Instance.new("Frame")
ContentFrame.Parent = MainFrame
ContentFrame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
ContentFrame.Size = UDim2.new(0.8, 0, 1, 0)
ContentFrame.Position = UDim2.new(0.2, 0, 0, 0)

-- Okno pre Duplicate sekciu
local DuplicateInput = Instance.new("TextBox")
DuplicateInput.Parent = ContentFrame
DuplicateInput.Size = UDim2.new(0.5, 0, 0.1, 0)
DuplicateInput.Position = UDim2.new(0.25, 0, 0.4, 0)
DuplicateInput.PlaceholderText = "Zadaj názov objektu na duplikovanie"
DuplicateInput.Text = ""
