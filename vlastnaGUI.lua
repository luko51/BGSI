-- Vytvorenie moderného GUI s otváracími kategóriami
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Sidebar = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local MinimizeButton = Instance.new("TextButton")
local CloseButton = Instance.new("TextButton")

-- Sekcie s podkategóriami
local sections = {
    {name = "Duplication", subcategories = {"Textové okno"}},
    {name = "Eggs", subcategories = {"Common", "Rare", "Epic", "Legendary"}},
    {name = "Rifts", subcategories = {"Small Rift", "Large Rift", "Boss Rift"}}
}

local buttons = {}
local subcategoryFrames = {}

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

-- Lišta s minimalizáciou a zatvorením
MinimizeButton.Parent = MainFrame
MinimizeButton.Text = "-"
MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
MinimizeButton.Position = UDim2.new(0.92, 0, 0.02, 0)
MinimizeButton.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
MinimizeButton.TextColor3 = Color3.new(1, 1, 1)

CloseButton.Parent = MainFrame
CloseButton.Text = "X"
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(0.95, 0, 0.02, 0)
CloseButton.BackgroundColor3 = Color3.new(0.5, 0, 0)
CloseButton.TextColor3 = Color3.new(1, 1, 1)

-- Funkcie minimalizácie a zatvorenia
MinimizeButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Generovanie tlačidiel sekcií s podkategóriami
local offset = 5
for _, section in ipairs(sections) do
    local button = Instance.new("TextButton")
    button.Parent = Sidebar
    button.Text = section.name
    button.Size = UDim2.new(1, -10, 0, 30)
    button.Position = UDim2.new(0, 5, 0, offset)
    button.BackgroundColor3 = Color3.new(0.12, 0.12, 0.12)
    button.TextColor3 = Color3.new(1, 1, 1)
    button.BorderSizePixel = 0
    offset = offset + 35

    -- Vytváranie podkategórií
    local subFrame = Instance.new("Frame")
    subFrame.Parent = Sidebar
    subFrame.Size = UDim2.new(1, -10, 0, #section.subcategories * 25)
    subFrame.Position = UDim2.new(0, 5, 0, offset)
    subFrame.BackgroundTransparency = 1
    subFrame.Visible = false

    local subOffset = 0
    for _, sub in ipairs(section.subcategories) do
        local subButton = Instance.new("TextButton")
        subButton.Parent = subFrame
        subButton.Text = sub
        subButton.Size = UDim2.new(1, 0, 0, 25)
        subButton.Position = UDim2.new(0, 0, 0, subOffset)
        subButton.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
        subButton.TextColor3 = Color3.new(1, 1, 1)
        subOffset = subOffset + 25
    end

    button.MouseButton1Click:Connect(function()
        subFrame.Visible = not subFrame.Visible
    end)

    subcategoryFrames[section.name] = subFrame
end
