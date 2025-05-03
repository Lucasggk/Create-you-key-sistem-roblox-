local Fluent = loadstring(Game:HttpGet("https://raw.githubusercontent.com/discoart/FluentPlus/refs/heads/main/release.lua", true))() 


local Window = Fluent:CreateWindow({
    Title = "create key system",
    SubTitle = "made by Lucas",
    TabWidth = 160,
    Size = UDim2.fromOffset(500, 350),
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

local nome_ui = ""
local subname_ui = ""
local size_ui = ""
local tabsize_ui ""

local section = cratesys:AddSection("ui Settings")

cratesys:AddInput("", {
    Title = "ui name",
    Default = "",
    Placeholder = "UI name here ",
    Numeric = false,
    Callback = function(Value)
        nome_ui = Value
    end
})

cratesys:AddInput("", {
    Title = "subtitle ui name",
    Default = "",
    Placeholder = "Subname UI here ",
    Numeric = false,
    Callback = function(Value)
        subnome_ui = Value
    end
})

local Dropdown = cratesys:AddDropdown("", {
    Title = "select ui size ", 
    Values = {"small" "medium" "large" },
    Multi = false,
    Default = "medium"
})

Dropdown:OnChanged(function(value)
    size_ui = value
end)

local Dropdown = cratesys:AddDropdown("", {
    Title = "select TabWidth size", 
    Values = {"small" "medium" "large" },
    Multi = false,
    Default = "medium"
})

Dropdown:OnChanged(function(value)
    tabsize_ui = value
end)

local section = cratesys:AddSection("key Settings")

