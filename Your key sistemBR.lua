                  --[[versão br]]--
 
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
    Title = "Sistema de Chave",
    Icon = "rbxassetid://95214531579570"
})

local configTab = Window:AddTab({
    Title = "Configurações",
    Icon = "settings"
})

configTab:AddToggle("AutoLoadToggle", {
    Title = "Carregar Automaticamente",
    Description = "Ativa o carregamento automático quando a chave está salva",
    Default = autoLoadEnabled,
    Callback = function(value)
        autoLoadEnabled = value
        saveAutoLoadSetting(value)
    end
})

configTab:AddButton({
    Title = "Remover Chave",
    Description = "Exclui a chave salva localmente",
    Callback = function()
        deleteKey()
        Fluent:Notify({
            Title = "Chave removida!",
            Content = "A chave salva foi removida com sucesso!",
            Duration = 3
        })
    end
})

InterfaceManager:BuildInterfaceSection(configTab)

local user_input_key = ""

keyTab:AddInput("KeyInput", {
    Title = "Insira sua chave",
    Default = "",
    Placeholder = "cole sua chave aqui...",
    Numeric = false,
    Callback = function(Value)
        user_input_key = Value
    end
})

keyTab:AddButton({
    Title = "Verificar Chave",
    Callback = function()
        if user_input_key == correct_key then
            saveKey(user_input_key)
            Fluent:Notify({
                Title = "Chave correta!",
                Content = "Chave salva, o script abrirá em 3 segundos",
                Duration = 3
            })
            task.wait(3)
            Fluent:Destroy()
            pcall(loadstring(sc))
        else
            Fluent:Notify({
                Title = "Erro",
                Content = "Chave incorreta! Por favor verifique e tente novamente",
                Duration = 5
            })
        end
    end
})

keyTab:AddButton({
    Title = "Obter Chave",
    Callback = function()
        setclipboard(kl)
        Fluent:Notify({
            Title = "Link copiado!",
            Content = "O link para obter a chave foi copiado para sua área de transferência!",
            Duration = 5
        })
    end
})

keyTab:AddParagraph({
    Title = "Instruções:",
    Content = "1. Clique em 'Obter Chave' para pegar sua chave\n2. Cole a chave no campo acima\n3. Clique em 'Verificar Chave'"
})

keyTab:AddParagraph({
    Title = "Aviso",
    Content = "a chave será sempre a mesma para todos os usuários!"
})

if isKeySaved() and autoLoadEnabled then
    Fluent:Notify({
        Title = "Chave salva",
        Content = "Aguarde 3 segundos para o script\nvocê pode deletar a chave salva a qualquer momento!",
        Duration = 3
    })
    task.wait(3)
    Fluent:Destroy()
    pcall(loadstring(sc))
end
