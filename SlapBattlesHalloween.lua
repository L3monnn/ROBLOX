--// init venyx
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/L3monnn/UI-Libraries/main/Venyx.lua"))()
local Venyx = Library.new({
    title = "[Halloween🎃] Slap Battles"
})

--// tab
local MainTab = Venyx:addPage({
    title = "Main",
    icon = 16146187568
})

--// section
local CreditsSection = MainTab:addSection({
    title = "Credits"
})
local FarmSection = MainTab:addSection({
    title = "Farm"
})
local ExtraSection = MainTab:addSection({
    title = "Extra"
})

--// labels
CreditsSection:addButton({
    title = "made by @.lemonnn",
    callback = function()
        Venyx:Notify({
            title = "Creator",
            text = "@.lemonnn"
        })
    end
})

CreditsSection:addKeybind({
    title = "Toggle UI Keybind",
    key = Enum.KeyCode.V,
    callback = function()
        Venyx:toggle()
    end
})

--// init functions
local teleportService = game:GetService("TeleportService")
local player = game.Players.LocalPlayer

local CandyFarmEnabled = false

local playerHead = game.Players.LocalPlayer.Character.Head

local function CandyCornFarm()
    CandyFarmEnabled = true

    for i, v in pairs(game:GetService("Workspace").CandyCorns:GetDescendants()) do
        if v.Name == "TouchInterest" and v.Parent then
            
            firetouchinterest(playerHead, v.Parent, 0)
            firetouchinterest(playerHead, v.Parent, 1)
        end
    end

    game:GetService("Workspace").CandyCorns.DescendantAdded:Connect(function(Object)
        if not CandyCornFarm then
            return
        end

        if Object.name == "TouchInterest" and Object.Parent then

            firetouchinterest(playerHead, Object.Parent, 0)
            firetouchinterest(playerHead, Object.Parent, 1)
        end

        task.wait()
    end)
end

FarmSection:addToggle({
    title = "Candy Farm (firetouchinterest)",
    callback = function(value)
        if value then
            CandyCornFarm()
        else
            CandyFarmEnabled = value
        end
    end
})

ExtraSection:addButton({
    title = "Rejoin Server",
    callback = function()
        Venyx:Notify({
            title = "Notification",
            text = "Rejoining Server"
        })

        teleportService:Teleport(game.PlaceId, player)
    end
})
