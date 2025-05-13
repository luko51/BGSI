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

-- Funkcia na spawnovanie peta
local function spawnPet()
    local petName = PetName.Text
    if petName ~= "" then
        print("Spúšťam animáciu pre peta: " .. petName)

        -- Skúšame rôzne cesty a eventy
        local success = false
        local paths = {
            "ReplicatedStorage.SpawnPet",
            "Workspace.SpawnPet",
            "ReplicatedStorage.HatchEgg",
            "Workspace.HatchEgg",
            "Players.LocalPlayer.SpawnPet"
        }

        for _, path in ipairs(paths) do
            local event = game:FindFirstChild(path, true)
            if event and event:IsA("RemoteEvent") then
                event:FireServer(petName)
                print("Event odoslaný: " .. path)
                success = true
                break
            end
        end

        if not success then
            warn("Nepodarilo sa nájsť event na spawnovanie peta.")
        end
    else
        warn("Zadaj platné meno peta!")
    end
end

-- Pripojenie funkcie k tlačidlu
SpawnButton.MouseButton1Click:Connect(spawnPet)

print("GUI pre spawnovanie petov bolo úspešne načítané.")
