-- Vytvorenie GUI
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Sidebar = Instance.new("Frame")
local Title = Instance.new("TextLabel")

-- Sekcie
local CoreButton = Instance.new("TextButton")
local EnchantsButton = Instance.new("TextButton")
local EggsButton = Instance.new("TextButton")
local RiftsButton = Instance.new("TextButton")
local PotionsButton = Instance.new("TextButton")
local WebhookButton = Instance.new("TextButton")

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
local buttons = {
    {button = CoreButton, text = "Core", position = 0.05},
    {button = EnchantsButton, text = "Enchants", position = 0.15},
    {button = EggsButton, text = "Eggs", position = 0.25},
    {button = RiftsButton, text = "Rifts", position = 0.35},
    {button = PotionsButton, text = "Potions", position = 0.45},
    {button = WebhookButton, text = "Webhook", position = 0.55}
}

for _, info in pairs(buttons) do
    local btn = info.button
    btn.Parent = Sidebar
    btn.Text = info.text
    btn.Size = UDim2.new(1, -10, 0.1, 0)
    btn.Position = UDim2.new(0, 5, info.position, 0)
    btn.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    btn.TextColor3 = Color3.new(1, 1, 1)
end

-- Hlavný obsah sekcie (placeholder na ďalšie možnosti)
local ContentFrame = Instance.new("Frame")
ContentFrame.Parent = MainFrame
ContentFrame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
ContentFrame.Size = UDim2.new(0.8, 0, 1, 0)
ContentFrame.Position = UDim2.new(0.2, 0, 0, 0)

-- Nadpis
Title.Parent = ContentFrame
Title.Text = "Core Settings"
Title.Size = UDim2.new(1, 0, 0.1, 0)
Title.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)

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
