                --[[version EUA]]--

local name = _G.uiname 
local sname = _G.subname 
local s1 = _G.sizeui1
local s2 = _G.sizeui2 
local ts = _G.tabsizeui 
local kl = _G.keylink 
local ck = _G.crrkey 
local sc = tostring(_G.ldscript)

repeat task.wait() until game:IsLoaded()
repeat task.wait() until game.Players.LocalPlayer:FindFirstChild("PlayerGui")

loadstring(game:HttpGet("https://raw.githubusercontent.com/Lucasggk/Create-you-key-sistem-roblox-/refs/heads/main/Fix%20ui%20name.lua"))()

local correct_key = ck

local function isKeySaved()
    if not isfile("FluentUI_KeySystem.txt") then return false end
    local saved_key = readfile("FluentUI_KeySystem.txt")
    return saved_key == correct_key
end

local function saveKey(key)
    writefile("FluentUI_KeySystem.txt", key)
end

local function deleteKey()
    if isfile("FluentUI_KeySystem.txt") then
        delfile("FluentUI_KeySystem.txt")
    end
end

local autoLoadEnabled = true
if isfile("FluentUI_AutoLoad.txt") then
    autoLoadEnabled = readfile("FluentUI_AutoLoad.txt") == "true"
end

local function saveAutoLoadSetting(value)
    writefile("FluentUI_AutoLoad.txt", tostring(value))
end

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
InterfaceManager:SetLibrary(Fluent)

local Window = Fluent:CreateWindow({
    Title = name,
    SubTitle = sname,
    TabWidth = ts,
    Size = UDim2.fromOffset(s1, s2),
    Acrylic = false,
    Theme = "Dark",
    Center = true,
    IsDraggable = true
})

local keyTab = Window:AddTab({
    Title = "Key System",
    Icon = "rbxassetid://95214531579570"
})

local configTab = Window:AddTab({
    Title = "settings",
    Icon = "settings"
})

configTab:AddToggle("AutoLoadToggle", {
    Title = "Auto Load",
    Description = "Enables autoloading when key is saved",
    Default = autoLoadEnabled,
    Callback = function(value)
        autoLoadEnabled = value
        saveAutoLoadSetting(value)
    end
})

configTab:AddButton({
    Title = "Destroy Key",
    Description = "Remove locally saved key",
    Callback = function()
        deleteKey()
        Fluent:Notify({
            Title = "key removed!",
            Content = "The saved key has been successfully removed!",
            Duration = 3
        })
    end
})

InterfaceManager:BuildInterfaceSection(configTab)

local user_input_key = ""

keyTab:AddInput("KeyInput", {
    Title = "enter your key",
    Default = "",
    Placeholder = "paste your key here...",
    Numeric = false,
    Callback = function(Value)
        user_input_key = Value
    end
})

keyTab:AddButton({
    Title = "check Key",
    Callback = function()
        if user_input_key == correct_key then
            saveKey(user_input_key)
            Fluent:Notify({
                Title = "Key correct",
                Content = "the key was saved, the script opens in 3 seconds",
                Duration = 3
            })
            task.wait(3)
            Fluent:Destroy()
            pcall(loadstring(sc))
        else
            Fluent:Notify({
                Title = "Error",
                Content = "Incorrect key! Please check and try again",
                Duration = 5
            })
        end
    end
})

keyTab:AddButton({
    Title = "Get key",
    Callback = function()
        setclipboard(kl)
        Fluent:Notify({
            Title = "link copied!",
            Content = "The link to get the key has been copied to your clipboard!",
            Duration = 5
        })
    end
})

keyTab:AddParagraph({
    Title = "instructions:",
    Content = "1. Click 'Get Key' to get your key\n2. Paste the key into the field above\n3. Click 'Verify Key'"
})

keyTab:AddParagraph({
    Title = "warn",
    Content = "the key will always be the same for all users!"
})

if isKeySaved() and autoLoadEnabled then
    Fluent:Notify({
        Title = "key saved",
        Content = "Wait 3 seconds for the script\n you can delete the saved key at any time!",
        Duration = 3
    })
    task.wait(3)
    Fluent:Destroy()
    pcall(loadstring(sc))
end
