-- Roblox Bubble Gum Simulator GUI Script
-- Spúšťané cez MuMuPlayer a Codex

-- Inicializácia GUI prvkov
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local PetName = Instance.new("TextBox")
local SpawnButton = Instance.new("TextButton")

-- Vlastnosti GUI
ScreenGui.Name = "PetSpawner"
ScreenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
Frame.BorderSizePixel = 2
Frame.Position = UDim2.new(0.4, 0, 0.3, 0)
Frame.Size = UDim2.new(0, 300, 0, 150)

PetName.Parent = Frame
PetName.PlaceholderText = "Zadaj meno peta"
PetName.Position = UDim2.new(0.1, 0, 0.2, 0)
PetName.Size = UDim2.new(0.8, 0, 0.2, 0)

SpawnButton.Parent = Frame
SpawnButton.Text = "Spawn Pet"
SpawnButton.Position = UDim2.new(0.1, 0, 0.6, 0)
SpawnButton.Size = UDim2.new(0.8, 0, 0.2, 0)

-- DEBUG: Výpis všetkých eventov
print("--- Výpis všetkých dostupných eventov ---")

local function scanForEvents(parent, prefix)
    prefix = prefix or ""
    for _, obj in pairs(parent:GetChildren()) do
        if obj:IsA("RemoteEvent") or obj:IsA("RemoteFunction") then
            print(prefix .. obj.Name)
        end
        scanForEvents(obj, prefix .. obj.Name .. "/")
    end
end

-- Prehľadanie Workspace a Player
scanForEvents(game.Workspace, "Workspace/")
scanForEvents(game.Players.LocalPlayer, "Player/")

print("----------------------------------------")

-- Funkcia na spawnovanie peta
local function spawnPet()
    local petName = PetName.Text
    if petName ~= "" then
        print("Spúšťam animáciu pre peta: " .. petName)
        local args = {
            [1] = petName
        }
        -- Potrebujeme zistiť správny event
    else
        warn("Zadaj platné meno peta!")
    end
end

-- Pripojenie funkcie k tlačidlu
SpawnButton.MouseButton1Click:Connect(spawnPet)

print("GUI pre spawnovanie petov bolo úspešne načítané.")
