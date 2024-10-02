local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/L3monnn/RobloxScripts/refs/heads/Main/Library.lua"))()
--//window
local Window = Library.Main("Skibidite", "LeftAlt") -- change "LeftAlt" to key that you want will hide gui
--//tab
local HomeTab = Window.NewTab("Home")
local MainTab = Window.NewTab("Main")
local RareTab = Window.NewTab("Rare Items")
--//section
local HomeSection = HomeTab.NewSection("Home")
local MineSection = MainTab.NewSection("Mine Hax")
local SellSection = MainTab.NewSection("Sell Hax")
local SpawnsSection = RareTab.NewSection("Rare Item Settings")
local OresSection = RareTab.NewSection("Ore Spawns")
local ChestsSection = RareTab.NewSection("Chest Spawns")
--//labels
local MineTutorialLabel = HomeSection.NewLabel("made by .lemonnn", true)
local MineTutorialLabel = MineSection.NewLabelWithComment("How to use", "You must mine any block before using automine!", false, nil, nil)
local MineTutorialLabel = SellSection.NewLabelWithComment("How to use", "You must sell any block before using quick sell!", false, nil, nil)

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")
local player = game.Players.LocalPlayer

local MineAuraRadius = 60
local ChestDetecter = true
local RareOreDetecter = true
local RarityThreshold = 35000

local QuickMineKeyEnabled = false
local QuickSellKeyEnabled = false
local QuickMineKeycode = nil
local QuickSellKeycode = nil

local MineRemoteName = nil
local SellRemoteName = nil
local UserStateRemoteName = nil
local SequenceRemoteName = nil

local errorDecalID = "rbxassetid://5107154093"
local infoDecalID = "rbxassetid://12900311641"
local successDecalID = "rbxassetid://12900311435"
local chestDecalID = "rbxassetid://6846330057"
local diamondDecalID = "rbxassetid://16015421629"

-- functions

local function notifyUser(Title , Content, Duration, Image, Button1)
    if Button1 == "NoCallback" then
        Button1 = nil
    else
        Button1 = "Okay!"
    end
    StarterGui:SetCore("SendNotification", {
        Title = Title,
        Text = Content,
        Icon = Image,
        Duration = Duration,
        Button1 = Button1,
        Callback = nil
    })
end

local Main = {}
local RareOres = {
    "Uranium",
    "Onyx",
    "Xenotime",
    "Watcher",
    "404ium",
    "AmberFossil",
    "7ium",
}

local Cubes = workspace.World.Cubes
local ChestsFolder = workspace.World.Chests
local ores = ReplicatedStorage.Content.Ores
local rocks = ReplicatedStorage.Content.Rocks

local CubeAddedConn
local CubeRemovedConn
local ChestAddedConn

local function highlightCube(cube)
    if RareOreDetecter then
        local highlight = Instance.new("Highlight", cube)
        highlight.OutlineColor = Color3.fromRGB(30, 255, 0)
        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        highlight.OutlineTransparency = 0
        highlight.FillTransparency = 1

        local bindableFunction = Instance.new("BindableFunction")

        bindableFunction.OnInvoke = function(buttonPressed)
            if buttonPressed == "Teleport" then
                player.Character.HumanoidRootPart.CFrame = cube:GetPrimaryPartCFrame()
            end
            bindableFunction:Destroy()
            return
        end

        StarterGui:SetCore("SendNotification", {
            Title = "Rare Ore Spawned",
            Text = cube:GetAttribute("CubeName") .. " has spawned and was highlighted",
            Icon = diamondDecalID, -- Optional: Replace with your icon asset ID
            Duration = 6.5, -- Duration in seconds
            Button1 = "Okay!", -- Optional: First button text
            Button2 = "Teleport", -- Optional: Second button text
            Callback = bindableFunction
        })

        task.wait(6.5)
        if bindableFunction then
            bindableFunction:Destroy()
        end
    end
end

local function initCubes()
    if CubeAddedConn or CubeRemovedConn then
        CubeAddedConn:Disconnect()
        CubeRemovedConn:Disconnect()
    end
    
    Main = {}

    for _, cube in pairs(Cubes:GetDescendants()) do
        if cube:IsA("Model") and cube.Parent:IsA("Folder") then
            Main[cube.Name] = cube
            if RareOreDetecter then
                task.spawn(function()
                    if RareOres[cube:GetAttribute("CubeName")] then
                        highlightCube(cube)
                        print("Found Thru cube name")
                    elseif cube:GetAttribute("TrueRarity") then
                        if cube:GetAttribute("TrueRarity") >= RarityThreshold then
                            highlightCube(cube)
                            print("found thru Cube Rarity")
                        end
                    end
                end)
            end
        end
    end
    
    CubeAddedConn = Cubes.DescendantAdded:Connect(function(Object)
        if Object:IsA("Model") then
            Main[Object.Name] = Object
            if RareOreDetecter then
                task.spawn(function()
                    repeat
                        task.wait(0.2)
                    until 
                    Object:GetAttribute("TrueRarity") or Object:GetAttribute("CubeName")
                    if RareOres[Object:GetAttribute("CubeName")] then
                        highlightCube(Object)
                        print("Found Thru cube name added")
                    elseif Object:GetAttribute("TrueRarity") then
                        if Object:GetAttribute("TrueRarity") >= RarityThreshold then
                            highlightCube(Object)
                            print("found thru Cube Rarity added")
                        end
                    end
                end)
            end
        end
    end)
    
    CubeRemovedConn = Cubes.DescendantRemoving:Connect(function(Object)
        if Object:IsA("Model") then
            Main[Object.Name] = nil
        end
    end)
end

local function highlightChest(Chest)
    if ChestDetecter then
        repeat
            task.wait(0.2)
        until Chest:GetAttribute("HighlightColor")
        local highlight = Instance.new("Highlight", Chest)
        highlight.FillColor = Chest:GetAttribute("HighlightColor")
        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        highlight.OutlineTransparency = 1
        highlight.FillTransparency = 0

        local bindableFunction = Instance.new("BindableFunction")

        bindableFunction.OnInvoke = function(buttonPressed)
            if buttonPressed == "Teleport" then
                player.Character.HumanoidRootPart.CFrame = Chest:GetPrimaryPartCFrame()
            end
            bindableFunction:Destroy()
            return
        end

        StarterGui:SetCore("SendNotification", {
            Title = "Chest Spawned",
            Text = "A " .. Chest:GetAttribute("Type") .. " chest has spawned and was highlighted",
            Icon = chestDecalID, -- Optional: Replace with your icon asset ID
            Duration = 6.5, -- Duration in seconds
            Button1 = "Okay!", -- Optional: First button text
            Button2 = "Teleport", -- Optional: Second button text
            Callback = bindableFunction
        })

        task.wait(6.5)
        if bindableFunction then
            bindableFunction:Destroy()
        end
    end
end

local function initChestEsp()
    if ChestAddedConn then
        ChestAddedConn:Disconnect()
    end

    for _, Chest in pairs(ChestsFolder:GetChildren()) do
        if Chest:IsA("Model") and Chest.Parent:IsA("Folder") then
            highlightChest(Chest)
        end
    end
    
    ChestAddedConn = ChestsFolder.ChildAdded:Connect(function(Object)
        if Object:IsA("Model") and Object.Parent:IsA("Folder") then
            highlightChest(Object)
        end
    end)
end

--[[
Cube attributes: CubeHealth num, CubeMax num, CubeName string, TrueCubeName string, TrueRarity num
Chest attributes: ChestImage assetID, Type string, HighlightColor color3, IsADecoration boolean
Coin attributes: Type string, IsADecoration Boolean
]]--

local function MineCubesNearPlayer()
    local character = player.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then
        return
    end

    local radius = MineAuraRadius

    local pickaxeStrength = 10
    local pickaxe = game.Players.LocalPlayer:FindFirstChild("StarterGear"):FindFirstChild("Pickaxe")
    if pickaxe then
        pickaxeStrength = pickaxe:GetAttribute("HitPower")
    end

    local playerPosition = character.HumanoidRootPart.Position
    for cubeName, cube in pairs(Main) do
        task.spawn(function()
            if cube:FindFirstChild("Main") then
                local distance = (cube.Main.Position - playerPosition).Magnitude
                if distance <= radius then -- Each Cube is 8x8
                    local cubeHealth = cube:GetAttribute("CubeHealth")
                    local HitsNeeded = cubeHealth / pickaxeStrength
                    local TrueHitsNeeded = math.ceil(HitsNeeded)
                    if TrueHitsNeeded < 1 or TrueHitsNeeded > 100 or typeof(TrueHitsNeeded) ~= "number" then
                        TrueHitsNeeded = 1
                    end
                    
                    for i = TrueHitsNeeded, 1, -1 do          
                        if not Main[cubeName] then break end

                        local args = {[1] = {["Position"] = cubeName}}
                        game:GetService("ReplicatedStorage").REM:FindFirstChild(MineRemoteName):InvokeServer(unpack(args))
                        task.wait()
                    end
                end
            end
        end)
    end
end

local function SellMaterials()
	local Materials = player.Inventory.Materials
    local args = {
        [1] = {
            ["ToSell"] = {}
        }
    }
    for _, v in pairs(Materials:GetChildren()) do
        if not v:GetAttribute("Locked") then
            args[1]["ToSell"][v.Name] = {
                ["Locked"] = false,
                ["Amount"] = v.Value
            }
        end
    end

    if SellRemoteName then
        local JimmyPenny = workspace.World.Lobby.NPCs:FindFirstChild("Jimmy Penny")
        local JimmyPos = JimmyPenny.Button:GetPrimaryPartCFrame()
        local CurrentPos = player.Character.HumanoidRootPart.CFrame

		player.Character.HumanoidRootPart.Anchored = true
        player.Character.HumanoidRootPart.CFrame = JimmyPos
        task.wait(0.2)
        ReplicatedStorage.REM:FindFirstChild(SellRemoteName):InvokeServer(unpack(args))
        task.wait(0.2)
        player.Character.HumanoidRootPart.CFrame = CurrentPos
		player.Character.HumanoidRootPart.Anchored = false
    end
end

-- Interactable UI

local AutoMineToggle = MineSection.NewToggle("Toggle Auto Mine", function(value)
    Window.Nofitication("AutoMine not working yet")
end, false)

local QuickMineButton = MineSection.NewButton("Quick Mine", function()
    print("Mined Allat")
end)

local MineRadiusSlider = MineSection.NewSlider("Mine Radius (in studs)", 12, 120, false, function(value)
    MineAuraRadius = value
end, 60)

local KeyDropdownList = {
	["0"] = 0x30,
	["1"] = 0x31,
	["2"] = 0x32,
	["3"] = 0x33,
	["4"] = 0x34,
	["5"] = 0x35,
	["6"] = 0x36,
	["7"] = 0x37,
	["8"] = 0x38,
	["9"] = 0x39,
	["A"] = 0x41,
	["B"] = 0x42,
	["C"] = 0x43,
	["D"] = 0x44,
	["E"] = 0x45,
	["F"] = 0x46,
	["G"] = 0x47,
	["H"] = 0x48,
	["I"] = 0x49,
	["J"] = 0x4A,
	["K"] = 0x4B,
	["L"] = 0x4C,
	["M"] = 0x4D,
	["N"] = 0x4E,
	["O"] = 0x4F,
	["P"] = 0x50,
	["Q"] = 0x51,
	["R"] = 0x52,
	["S"] = 0x53,
	["T"] = 0x54,
	["U"] = 0x55,
	["V"] = 0x56,
	["W"] = 0x57,
	["X"] = 0x58,
	["Y"] = 0x59,
	["Z"] = 0x5A,
	["F1"] = 0x70,
	["F2"] = 0x71,
	["F3"] = 0x72,
	["F4"] = 0x73,
	["F5"] = 0x74,
	["F6"] = 0x75,
	["F7"] = 0x76,
	["F8"] = 0x77,
	["F9"] = 0x78,
	["F10"] = 0x79,
	["F11"] = 0x7A,
	["F12"] = 0x7B,
}

local QuickMineKeyEnabledToggle = MineSection.NewToggle("Toggle Quick Mine Keybind", function(value)
    QuickMineKeyEnabled = value
end, false)

local MineKeycodeDropdown = MineSection.NewDropdown("Quick Mine keybind", KeyDropdownList, function(value)
    QuickMineKeycode = value
end, false)

local QuickSellButton = SellSection.NewButton("Quick Sell", function()
    SellMaterials()
end)

local QuickSellKeyEnabledToggle = SellSection.NewToggle("Toggle Quick Sell Keybind", function(value)
    QuickSellKeyEnabled = value
end, false)

local SellKeycodeDropdown = SellSection.NewDropdown("Quick Sell keybind", KeyDropdownList, function(value)
    QuickSellKeycode = value
end, false)

local ChestDetecterToggle = SpawnsSection.NewToggle("Toggle Chest Detecter", function(value)
    ChestDetecter = value
end, false)

local RareOreDetecterToggle = SpawnsSection.NewToggle("Toggle Rare Ore Detecter", function(value)
    RareOreDetecter = value
end, false)

local RarityThresholdSlider = SpawnsSection.NewSlider("Ore Rarity Thresold (1:1000)", 1, 100, false, function(value)
    MineAuraRadius = value * 1000
end, 35)

local namecall
local stopExecution = false

namecall = hookmetamethod(game, "__namecall", function(self, ...)
    if stopExecution then
        return namecall(self, ...)
    end

    local method = getnamecallmethod():lower()
    local args = {...}

    if not checkcaller() and self.ClassName == "RemoteFunction" and method == "invokeserver" then
        if args[1] and typeof(args[1]) == "table" then
            for i, v in pairs(args[1]) do
                if i == "Position" and typeof(v) == "string" and not MineRemoteName then
                    MineRemoteName = self.Name
                elseif i == "ToSell" and typeof(v) == "table" and not SellRemoteName then
                    SellRemoteName = self.Name
                end
            end
        end
    elseif not checkcaller() and self.ClassName == "RemoteEvent" and method == "fireserver" then
        if args[1] and typeof(args[1]) == "table" then
            for i, v in pairs(args[1]) do
                if i == "UserState" and typeof(v) == "string" and not UserStateRemoteName then
                    UserStateRemoteName = self.Name
                elseif i == "Name" and v == "Jimmy Penny" and not SequenceRemoteName then
                    SequenceRemoteName = self.Name
                end
            end
        end
    end

    if MineRemoteName and SellRemoteName and UserStateRemoteName and SequenceRemoteName then
        stopExecution = true
        print("Skibidi")
    end

    return namecall(self, ...)
end)

UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
    if not gameProcessedEvent then
		if QuickMineKeyEnabled and QuickMineKeycode then
			if input.KeyCode == Enum.KeyCode[QuickMineKeycode] then
				if MineRemoteName then
					task.spawn(MineCubesNearPlayer)
				else
					notifyUser("Error Mining", "Please mine a block before quick mine!", 3, errorDecalID)
				end
			end
        elseif QuickSellKeyEnabled and QuickSellKeycode then
			if input.KeyCode == Enum.KeyCode[QuickSellKeycode] then
				if SellRemoteName then
					task.spawn(SellMaterials)
				else
					notifyUser("Error Selling", "Please sell a block before using quick sell!", 3, errorDecalID)
				end
			end
        end
    end
end)

task.spawn(function()
    local cubesuccess, cuberesult = pcall(initCubes)
    if not cubesuccess then
        notifyUser("Error Initalizing Cubes", "Result: " .. cuberesult, 5, errorDecalID)
    end

    local chestsuccess, chestresult = pcall(initChestEsp)
    if not chestsuccess then
        notifyUser("Error Initalizing Chest ESP", "Result: " .. chestresult, 5, errorDecalID)
    end

    notifyUser("SkibidiWare v1.20.4", "Successfully loaded! by @.lemonnn", 10, successDecalID, "NoCallback")
end)
