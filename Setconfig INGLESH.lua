loadstring(game:HttpGet("https://raw.githubusercontent.com/Lucasggk/BlueLock/refs/heads/main/Fix.name.ui.lua"))()


local Fluent = loadstring(Game:HttpGet("https://raw.githubusercontent.com/discoart/FluentPlus/refs/heads/main/release.lua", true))() 


local Window = Fluent:CreateWindow({
    Title = "create key system",
    SubTitle = "made by Lucas",
    TabWidth = 145,
    Size = UDim2.fromOffset(550, 370),
    Acrylic = false,
    Theme = "Dark",
    Center = true,
    IsDraggable = true
})

local infosys = Window:AddTab({ Title = "info", Icon = "home" })
local cratesys = Window:AddTab({ Title = "Create system", Icon = "list" })
local copysys = Window:AddTab({ Title = "copy syskey", Icon = "list" })

local section = infosys:AddSection("how to use")
infosys:AddParagraph({
    Title = " Create gui ",
    Content = " 1) you will put the name of the UI in the first textbox\n\n 2) You will place the UI replacement in the second textbox\n\n 3) You will choose the size of the UI in the Dropdown "
  })

local section = infosys:AddSection("how to conf")
infosys:AddParagraph({
    Title = " config key sys  ",
    Content = " 1) you will put your vertises or lootlabs link\n\n I recommend using linkvertise.com (much better)\n\n create a link with text if you use linkvertise.com, the message there must be short without spaces\n\n example: ''key1739'' or ''word_word_word''\n\n 2) in the second textbox put the script key"
  })

local name_ui = ""
local subname_ui = ""
local size_ui1 = ""
local size_ui2 = ""
local tabsize_ui = ""
local linkkey_key = ""
local crrkey_key = ""
local script_load = ""


local section = cratesys:AddSection("ui Settings")

cratesys:AddInput("", {
    Title = "ui name",
    Default = "",
    Placeholder = "UI name here ",
    Numeric = false,
    Callback = function(Value)
        name_ui = Value
    end
})

cratesys:AddInput("", {
    Title = "subtitle ui name",
    Default = "",
    Placeholder = "Subname UI here ",
    Numeric = false,
    Callback = function(Value)
        subname_ui = Value
        print(subname_ui)
    end
})

local Dropdown1 = cratesys:AddDropdown("", {
    Title = "select ui size ", 
    Values = {"small: 350, 250", "medium: 500, 350", "large: 650, 450" },
    Multi = false,
    Default = "medium: 500, 350"
})

Dropdown1:OnChanged(function(value)
     if value == "small: 350, 250" then
        size_ui1 = 350; size_ui2 = 250
    elseif value == "medium: 500, 350" then
        size_ui1 = 500; size_ui2 = 350
    elseif value == "large: 650, 450" then
        size_ui1 = 650; size_ui2 = 450
     end
        print("size_ui: ".. size_ui1.. ", ".. size_ui2)
end)

local Dropdown2 = cratesys:AddDropdown("", {
    Title = "select TabWidth size", 
    Values = {"small: 120", "medium: 150", "large: 180" },
    Multi = false,
    Default = "medium: 150"
})

Dropdown2:OnChanged(function(value)
        if value == "small: 120" then
        tabsize_ui = 120
    elseif value == "medium: 150" then
        tabsize_ui = 150
    elseif value == "large: 180" then
        tabsize_ui = 180
        end
print("TabWidth: ".. tabsize_ui)
end)

local section = cratesys:AddSection("key Settings")

cratesys:AddInput("", {
    Title = "your ads key link",
    Default = "",
    Placeholder = "put your ads key link here  ",
    Numeric = false,
    Callback = function(Value)
        linkkey_key = Value
    end
})

cratesys:AddInput("", {
    Title = "correct key for your system ",
    Default = "",
    Placeholder = "put your correct key here  ",
    Numeric = false,
    Callback = function(Value)
        crrkey_key = Value
    end
})

local section = cratesys:AddSection(" ")
local section = cratesys:AddSection("script executed after correct key be\n careful with the break line, there\n is a chance that the ' ' will not close the script\njust script in loadstring()   ")
local section = cratesys:AddSection(" ")
cratesys:AddInput("", {
    Title = "script to be loaded after key: ",
    Default = "",
    Placeholder = "put the script to be loaded ",
    Numeric = false,
    Callback = function(Value)
        script_load = Value
    end
})


local gc = ""

local function gerarGC()
    local G = {
        'local gc = ""',
        "_G.uiname = \"" .. tostring(name_ui) .. "\"",
        "_G.subname = \"" .. tostring(subname_ui) .. "\"",
        "_G.sizeui1 = " .. tonumber(size_ui1),
        "_G.sizeui2 = " .. tonumber(size_ui2),
        "_G.tabsizeui = " .. tonumber(tabsize_ui),
        "_G.keylink = \"" .. tostring(linkkey_key) .. "\"",
        "_G.crrkey = \"" .. tostring(crrkey_key) .. "\"",
        "_G.ldscript = [[  " .. tostring(script_load) .. "  ]]",
        'loadstring(game:HttpGet("https://raw.githubusercontent.com/Lucasggk/Create-you-key-sistem-roblox-/main/Your%20key%20sistemBR.lua"))()',
    }

    gc = table.concat(G, "\n")
    return gc
end

copysys:AddButton({
    Title = "Copy Key System Settings",
    Callback = function()
        local emptyFields = {}

        if name_ui == "" or name_ui == nil then
            table.insert(emptyFields, "UI Name (name_ui)")
        end
        if subname_ui == "" or subname_ui == nil then
            table.insert(emptyFields, "UI Subtitle (subname_ui)")
        end
        if crrkey_key == "" or crrkey_key == nil then
            table.insert(emptyFields, "Current Key (crrkey_key)")
        end
        if linkkey_key == "" or linkkey_key == nil then
            table.insert(emptyFields, "Key Link (linkkey_key)")
        end

        if #emptyFields > 0 then
            Fluent:Notify({
                Title = "Missing Required Fields!",
                Content = "Please fill in the following fields:\n" .. table.concat(emptyFields, "\n"),
                Duration = 5
            })
            return
        end

        gerarGC()
        setclipboard(gc)
    end
})

copysys:AddButton({
    Title = "Run Your Key System for Testing",
    Callback = function()
        local emptyFields = {}

        if name_ui == "" or name_ui == nil then
            table.insert(emptyFields, "UI Name (name_ui)")
        end
        if subname_ui == "" or subname_ui == nil then
            table.insert(emptyFields, "UI Subtitle (subname_ui)")
        end
        if crrkey_key == "" or crrkey_key == nil then
            table.insert(emptyFields, "Current Key (crrkey_key)")
        end
        if linkkey_key == "" or linkkey_key == nil then
            table.insert(emptyFields, "Key Link (linkkey_key)")
        end

        if #emptyFields > 0 then
            Fluent:Notify({
                Title = "Missing Required Fields!",
                Content = "Please fill in the following fields:\n" .. table.concat(emptyFields, "\n"),
                Duration = 5
            })
            return
        end

        local script = gerarGC()
        local success, err = pcall(function()
            loadstring(script)()
        end)
        if not success then
            warn("Error while loading the hub:", err)
        end
    end
})
