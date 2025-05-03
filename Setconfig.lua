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

local section = info:AddSection("how to use")
info:AddParagraph({
    Title = " Create gui ",
    content = "1) you will put the name of the UI in the first textbox\n2) You will place the UI replacement in the second textbox\n3) You will choose the size of the UI in the Dropdown "
  })

local section = info:AddSection("how to conf")
info:AddParagraph({
    Title = " config key sys  ",
    content = "1) you will put your vertises or lootlabs link\nI recommend using linkvertise.com (much better)\ncreate a link with text if you use linkvertise.com, the message there must be short without spaces\nexample: ''key1739'' or ''word_word_word''\n\n2) in the second textbox put the script key"
  })

local nome_ui = ""
local subname_ui = ""

infosys:AddInput("", {
    Title = "ui name",
    Default = "",
    Placeholder = "UI name here ",
    Numeric = false,
    Callback = function(Value)
        nome_ui = Value
    end
})

infosys:AddInput("", {
    Title = "subtitle ui name",
    Default = "",
    Placeholder = "Subname UI here ",
    Numeric = false,
    Callback = function(Value)
        subnome_ui = Value
    end
})

