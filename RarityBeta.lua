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
local SpawnsSection = RareTab.NewSection("Rare Item Spawns")
local OresSection = RareTab.NewSection("Ore Spawns")
local ChestsSection = RareTab.NewSection("Chest Spawns")
--//labels
local MineTutorialLabel = MineSection.NewLabel("made by .lemonnn", true)
local MineTutorialLabel = MineSection.NewLabelWithComment("How to use", "You must mine any block before using automine!", true, nil, nil)
local MineTutorialLabel = SellSection.NewLabelWithComment("How to use", "You must sell any block before using quick sell!", true, nil, nil)

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")
local player = game.Players.LocalPlayer

local MineAuraRadius = 60
local ChestEsp = true
local RareOreEsp = true
local RarityThreshold = 35000

local MineRemoteName = nil
local SellRemoteName = nil
local UserStateRemoteName = nil
local SequenceRemoteName = nil

local QuickMineKeycode = nil
local QuickSellKeycode = nil

local SliderNotPrecise = MineSection.NewSlider("Mine Radius (in studs)", 12, 120, false, function(value)
    MineAuraRadius = value
    print(MineAuraRadius, value)
end, 60)

local MineButton = Section.NewToggle("Toggle Mine", function(value)
    Window.Nofitication("AutoMine not working yet")
end, false)

local MineButton = Section.NewButton("Mine Allat", function()
    print("Mined Allat")
end)

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
	["a"] = 0x41,
	["b"] = 0x42,
	["c"] = 0x43,
	["d"] = 0x44,
	["e"] = 0x45,
	["f"] = 0x46,
	["g"] = 0x47,
	["h"] = 0x48,
	["i"] = 0x49,
	["j"] = 0x4A,
	["k"] = 0x4B,
	["l"] = 0x4C,
	["m"] = 0x4D,
	["n"] = 0x4E,
	["o"] = 0x4F,
	["p"] = 0x50,
	["q"] = 0x51,
	["r"] = 0x52,
	["s"] = 0x53,
	["t"] = 0x54,
	["u"] = 0x55,
	["v"] = 0x56,
	["w"] = 0x57,
	["x"] = 0x58,
	["y"] = 0x59,
	["z"] = 0x5A,
	["f1"] = 0x70,
	["f2"] = 0x71,
	["f3"] = 0x72,
	["f4"] = 0x73,
	["f5"] = 0x74,
	["f6"] = 0x75,
	["f7"] = 0x76,
	["f8"] = 0x77,
	["f9"] = 0x78,
	["f10"] = 0x79,
	["f11"] = 0x7A,
	["f12"] = 0x7B,
}

local MineKeycodeDropdown = MineSection.NewDropdown("Quick Mine keybind", KeyDropdownList, function(value)
    QuickMineKeycode = value
    print(QuickMineKeycode, value)
end, false)

local QuickSellButton = SellSection.NewButton("Quick Sell", function()
    print("sold!")
end)

local SellKeycodeDropdown = SellSection.NewDropdown("Quick Sell keybind", KeyDropdownList, function(value)
    QuickSellKeycode = value
    print(QuickSellKeycode, value)
end, false)
