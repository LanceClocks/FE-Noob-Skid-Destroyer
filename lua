local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService")
local Debris = game:GetService("Debris")
local NotificationLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/lobox920/Notification-Library/Main/Library.lua"))()
local RemoteEvent = Instance.new("RemoteEvent", ReplicatedStorage)
RemoteEvent.Name = "NoobSkidEvent"

-- Function to create the notification GUI
local function createNotificationGui(player)
    local head = player.Character:WaitForChild("Head")
    local notificationGui = Instance.new("BillboardGui", head)
    notificationGui.Size = UDim2.new(0, 200, 0, 50)
    notificationGui.Adornee = head
    notificationGui.AlwaysOnTop = true

    local textLabel = Instance.new("TextLabel", notificationGui)
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = "Noob Skid Destroyer Made By LanceClocks!"
    textLabel.TextColor3 = Color3.fromRGB(0, 255, 0)

    -- Clean up after a while
    Debris:AddItem(notificationGui, 5)
end

-- Abilities
local function noobSmash(player)
    local character = player.Character
    local hrp = character:WaitForChild("HumanoidRootPart")
    
    -- Create ground effect
    local effect = Instance.new("Part")
    effect.Size = Vector3.new(10, 1, 10)
    effect.Position = hrp.Position - Vector3.new(0, 1, 0)
    effect.Anchored = true
    effect.BrickColor = BrickColor.new("Bright red")
    effect.Parent = workspace

    -- Damage nearby players
    for _, otherPlayer in pairs(Players:GetPlayers()) do
        if otherPlayer ~= player and otherPlayer.Character then
            local otherHrp = otherPlayer.Character:FindFirstChild("HumanoidRootPart")
            if otherHrp and (otherHrp.Position - hrp.Position).Magnitude < 10 then
                otherPlayer.Character:BreakJoints() -- Kill them (or ragdoll)
            end
        end
    end

    Debris:AddItem(effect, 3) -- Clean up the effect
end

local function hugeNoob(player)
    local character = player.Character
    local hrp = character:WaitForChild("HumanoidRootPart")

    -- Create huge noob
    local hugeNoob = Instance.new("Part")
    hugeNoob.Size = Vector3.new(15, 15, 15)
    hugeNoob.Position = hrp.Position + Vector3.new(0, 5, 0)
    hugeNoob.BrickColor = BrickColor.new("Bright blue")
    hugeNoob.Anchored = true
    hugeNoob.Parent = workspace

    -- Swing and damage nearby players
    for _, otherPlayer in pairs(Players:GetPlayers()) do
        if otherPlayer ~= player and otherPlayer.Character then
            local otherHrp = otherPlayer.Character:FindFirstChild("HumanoidRootPart")
            if otherHrp and (otherHrp.Position - hugeNoob.Position).Magnitude < 15 then
                otherPlayer.Character:BreakJoints() -- Kill them (or ragdoll)
            end
        end
    end

    Debris:AddItem(hugeNoob, 5) -- Clean up the huge noob
end

local function finaleOfTheNoobs(player)
    local character = player.Character
    local hrp = character:WaitForChild("HumanoidRootPart")

    -- Create a giant noob
    local giantNoob = Instance.new("Part")
    giantNoob.Size = Vector3.new(30, 30, 30)
    giantNoob.Position = hrp.Position + Vector3.new(0, 10, 0)
    giantNoob.BrickColor = BrickColor.new("Bright yellow")
    giantNoob.Anchored = true
    giantNoob.Parent = workspace

    -- Say final message
    local message = Instance.new("Message")
    message.Text = "Okay I'm Tired Of This You're All Dead You Noobs"
    message.Parent = workspace
    Debris:AddItem(message, 3) -- Clean up message

    -- Damage players
    for _, otherPlayer in pairs(Players:GetPlayers()) do
        if otherPlayer ~= player and otherPlayer.Character then
            otherPlayer.Character:BreakJoints() -- Kill them (or ragdoll)
        end
    end

    Debris:AddItem(giantNoob, 5) -- Clean up the giant noob
end

-- Function for taunts
local function taunt(player)
    local taunts = {
        "Get Ready You Noobs!",
        "Time To Destroy Skids With THE ALMIGHTY NOOB BASEBALL BAT!",
        "Go Away Stupid Noob!",
    }
    local randomTaunt = taunts[math.random(#taunts)]
    local message = Instance.new("Message")
    message.Text = randomTaunt
    message.Parent = workspace
    Debris:AddItem(message, 3) -- Clean up taunt message
end

-- Remote event listener
RemoteEvent.OnServerEvent:Connect(function(player, action)
    if action == "NoobSmash" then
        noobSmash(player)
    elseif action == "HugeNoob" then
        hugeNoob(player)
    elseif action == "FinaleOfTheNoobs" then
        finaleOfTheNoobs(player)
    elseif action == "Taunt" then
        taunt(player)
    end
end)

-- Initialize player notifications
local function onPlayerAdded(player)
    player.CharacterAdded:Connect(function()
        createNotificationGui(player)
    end)
end

Players.PlayerAdded:Connect(onPlayerAdded)

-- Spawn animation and setup
local function spawnAnimation(player)
    local character = player.Character or player.CharacterAdded:Wait()
    character:WaitForChild("Humanoid").Sit = true
    local hrp = character:WaitForChild("HumanoidRootPart")
    
    -- Create throne
    local throne = Instance.new("Part")
    throne.Size = Vector3.new(4, 1, 2)
    throne.Position = hrp.Position
    throne.Anchored = true
    throne.BrickColor = BrickColor.new("Dark green")
    throne.Parent = workspace

    -- Move player to throne
    character:SetPrimaryPartCFrame(throne.CFrame + Vector3.new(0, 1, 0))
    task.wait(1)

    -- Position player sitting
    character.Humanoid.Sit = true
    task.wait(1)

    -- Say arrival message
    local message = Instance.new("Message")
    message.Text = "The Noob Skid Destroyer Has Arrived!"
    message.Parent = workspace
    Debris:AddItem(message, 3) -- Clean up message

    -- Grab the noob bat
    local bat = Instance.new("Part")
    bat.Size = Vector3.new(1, 4, 1)
    bat.Position = hrp.Position + Vector3.new(0, 2, 0)
    bat.BrickColor = BrickColor.new("Bright red")
    bat.Anchored = true
    bat.Parent = workspace

    -- Notify player that the bat is ready
    local noobHead = Instance.new("Part")
    noobHead.Size = Vector3.new(1, 1, 1)
    noobHead.Position = hrp.Position + Vector3.new(0, 5, 0)
    noobHead.BrickColor = BrickColor.new("Bright yellow")
    noobHead.Anchored = true
    noobHead.Parent = workspace

    local headMessage = Instance.new("Message")
    headMessage.Text = "You're Noob Baseball Bat Is Ready King Noob!"
    headMessage.Parent = noobHead
    Debris:AddItem(headMessage, 3) -- Clean up message

    -- Player response
    local thankYouMessage = Instance.new("Message")
    thankYouMessage.Text = "Thank You I'm Ready To Destroy These Noobs!"
    thankYouMessage.Parent = workspace
    Debris:AddItem(thankYouMessage, 3) -- Clean up message

    -- Finalize the throne
    Debris:AddItem(throne, 10) -- Clean up throne
    Debris:AddItem(bat, 10) -- Clean up bat
end

-- Call the spawn animation on player join
Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        spawnAnimation(player)
    end)
end)

    -- Parent the new script to ServerScriptService
    newScript.Parent = ServerScriptService

    -- Destroy the original script
    script:Destroy()
end

-- Execute the creation of the server script
createAndExecuteServerScript()
