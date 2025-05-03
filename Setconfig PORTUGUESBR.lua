local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/discoart/FluentPlus/refs/heads/main/release.lua", true))()

local Window = Fluent:CreateWindow({
    Title = "Sistema de Chave",
    SubTitle = "feito por Lucas",
    TabWidth = 145,
    Size = UDim2.fromOffset(550, 370),
    Acrylic = false,
    Theme = "Dark",
    Center = true,
    IsDraggable = true
})

local infosys = Window:AddTab({ Title = "Informações", Icon = "home" })
local cratesys = Window:AddTab({ Title = "Criar sistema", Icon = "list" })
local copysys = Window:AddTab({ Title = "Copiar sistema", Icon = "list" })

local section = infosys:AddSection("Como usar")
infosys:AddParagraph({
    Title = "Criar interface",
    Content = "1) Coloque o nome da UI na primeira caixa de texto\n\n2) Coloque o subtítulo da UI na segunda caixa de texto\n\n3) Escolha o tamanho da UI no menu suspenso"
})

local section = infosys:AddSection("Como configurar")
infosys:AddParagraph({
    Title = "Configurar sistema de chave",
    Content = "1) Coloque seu link do Linkvertise ou Lootlabs\n\nRecomendo usar linkvertise.com (melhor)\n\nCrie um link com texto se usar linkvertise.com, a mensagem deve ser curta sem espaços\n\nExemplo: 'key1739' ou 'palavra_palavra'\n\n2) Na segunda caixa de texto coloque a chave do script"
})

local name_ui = ""
local subname_ui = ""
local size_ui1 = ""
local size_ui2 = ""
local tabsize_ui = ""
local linkkey_key = ""
local crrkey_key = ""
local script_load = ""

local section = cratesys:AddSection("Configurações da UI")

cratesys:AddInput("", {
    Title = "Nome da UI",
    Default = "",
    Placeholder = "Nome da UI aqui",
    Numeric = false,
    Callback = function(Value)
        name_ui = Value
    end
})

cratesys:AddInput("", {
    Title = "Subtítulo da UI",
    Default = "",
    Placeholder = "Subtítulo da UI aqui",
    Numeric = false,
    Callback = function(Value)
        subname_ui = Value
    end
})

local Dropdown1 = cratesys:AddDropdown("", {
    Title = "Selecione o tamanho da UI", 
    Values = {"pequeno: 350, 250", "médio: 500, 350", "grande: 650, 450"},
    Multi = false,
    Default = "médio: 500, 350"
})

Dropdown1:OnChanged(function(value)
    if value == "pequeno: 350, 250" then
        size_ui1 = 350; size_ui2 = 250
    elseif value == "médio: 500, 350" then
        size_ui1 = 500; size_ui2 = 350
    elseif value == "grande: 650, 450" then
        size_ui1 = 650; size_ui2 = 450
    end
end)

local Dropdown2 = cratesys:AddDropdown("", {
    Title = "Selecione o tamanho da aba", 
    Values = {"pequeno: 120", "médio: 150", "grande: 180"},
    Multi = false,
    Default = "médio: 150"
})

Dropdown2:OnChanged(function(value)
    if value == "pequeno: 120" then
        tabsize_ui = 120
    elseif value == "médio: 150" then
        tabsize_ui = 150
    elseif value == "grande: 180" then
        tabsize_ui = 180
    end
end)

local section = cratesys:AddSection("Configurações da chave")

cratesys:AddInput("", {
    Title = "Seu link de anúncio",
    Default = "",
    Placeholder = "Coloque seu link de anúncio aqui",
    Numeric = false,
    Callback = function(Value)
        linkkey_key = Value
    end
})

cratesys:AddInput("", {
    Title = "Chave correta para seu sistema",
    Default = "",
    Placeholder = "Coloque sua chave correta aqui",
    Numeric = false,
    Callback = function(Value)
        crrkey_key = Value
    end
})

local section = cratesys:AddSection(" ")
local section = cratesys:AddSection("Script executado após chave correta\nCuidado com quebras de linha, há\nChance das aspas não fecharem corretamente")
local section = cratesys:AddSection(" ")
cratesys:AddInput("", {
    Title = "Script para carregar após chave:",
    Default = "",
    Placeholder = "Coloque o script para carregar",
    Numeric = false,
    Callback = function(Value)
        script_load = Value
    end
})

copysys:AddButton({
    Title = "Copiar Configuração",
    Callback = function()
        local G = {                
            "_G.uiname = \"" .. tostring(name_ui) .. "\"",
            "_G.subname = \"" .. tostring(subname_ui) .. "\"",
            "_G.sizeui1 = " .. tonumber(size_ui1),
            "_G.sizeui2 = " .. tonumber(size_ui2),
            "_G.tabsizeui = " .. tonumber(tabsize_ui),
            "_G.keylink = \"" .. tostring(linkkey_key) .. "\"",
            "_G.crrkey = \"" .. tostring(crrkey_key) .. "\"",
            "_G.ldscript = '" .. tostring(script_load) .. "',",
            'loadstring(game:HttpGet("https://raw.githubusercontent.com/Lucasggk/Create-you-key-sistem-roblox-/main/Your%20key%20sistemBR.lua"))()',
        }
            
        local gc = table.concat(G, "\n")
        setclipboard(gc)
    end
})
