-- FE Noob Skid Destroyer Script
-- Made By LanceClocks!

-- Load Notification Library
local NotificationLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/lobox920/Notification-Library/Main/Library.lua"))()

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local hrp = character:WaitForChild("HumanoidRootPart")

-- Function to create and equip the noob baseball bat
local function equipNoobBat()
    local success, err = xpcall(function()
        local bat = Instance.new("Tool")
        bat.Name = "Noob Baseball Bat"
        bat.RequiresHandle = true

        local handle = Instance.new("Part")
        handle.Name = "Handle"
        handle.Size = Vector3.new(1, 5, 1)
        handle.BrickColor = BrickColor.new("Bright blue")
        handle.Anchored = false
        handle.CanCollide = false
        handle.Parent = bat

        bat.Parent = player.Backpack

        -- Notify player
        NotificationLibrary:Notify("Noob Skid Destroyer", "Time To Destroy Skids With THE ALMIGHTY NOOB BASEBALL BAT!", 5)
    end, debug.traceback)

    if not success then
        warn("Failed to equip Noob Bat: " .. err)
    end
end

-- Function for Spawn Animation using BodyGyro and Motor6D
local function spawnAnimation()
    local success, err = xpcall(function()
        local bodyGyro = Instance.new("BodyGyro")
        bodyGyro.MaxTorque = Vector3.new(4000, 4000, 4000)
        bodyGyro.CFrame = hrp.CFrame
        bodyGyro.Parent = hrp

        -- Create Motor6D for custom animation
        local motor = Instance.new("Motor6D")
        motor.Name = "NoobAnimation"
        motor.Part0 = hrp
        motor.Part1 = character:WaitForChild("Head") -- Connect to the head
        motor.C0 = CFrame.new(0, 5, 0) -- Adjust as needed
        motor.Parent = hrp

        -- Animation sequence
        task.wait(2) -- Wait for 2 seconds
        NotificationLibrary:Notify("Noob Skid Destroyer", "The Noob Skid Destroyer Has Arrived!", 5)
        task.wait(1)

        -- Play swing animation with Motor6D
        for i = 1, 10 do
            motor.C0 = motor.C0 * CFrame.Angles(0, math.rad(4.5), 0) -- Swing the bat gradually
            task.wait(0.05) -- Smooth transition
        end

        bodyGyro:Destroy()
        motor:Destroy()
    end, debug.traceback)

    if not success then
        warn("Failed to perform spawn animation: " .. err)
    end
end

-- Logic for Noob Smash ability
local function noobSmash()
    local success, err = xpcall(function()
        -- Logic for Noob Smash
        local smashSound = Instance.new("Sound")
        smashSound.SoundId = "rbxassetid://2236842292" -- Go Away, Stupid Noob audio
        smashSound.Parent = hrp
        smashSound:Play()

        -- Create ground smash effect
        local hitPart = Instance.new("Part")
        hitPart.Size = Vector3.new(10, 1, 10) -- Adjust size for effect
        hitPart.Position = hrp.Position - Vector3.new(0, 3, 0)
        hitPart.BrickColor = BrickColor.new("Dark red")
        hitPart.Anchored = true
        hitPart.CanCollide = false
        hitPart.Parent = workspace

        -- Ragdoll nearby players
        for _, otherPlayer in ipairs(Players:GetPlayers()) do
            if otherPlayer.Character and otherPlayer ~= player then
                local otherHRP = otherPlayer.Character:FindFirstChild("HumanoidRootPart")
                if otherHRP and (otherHRP.Position - hrp.Position).magnitude < 10 then -- Adjust radius as needed
                    local otherHumanoid = otherPlayer.Character:FindFirstChildOfClass("Humanoid")
                    if otherHumanoid then
                        otherHumanoid:ChangeState(Enum.HumanoidStateType.Physics)
                        otherHRP.Velocity = Vector3.new(math.random(-50, 50), 100, math.random(-50, 50))
                    end
                end
            end
        end

        task.wait(0.5)
        hitPart:Destroy()
    end, debug.traceback)

    if not success then
        warn("Failed to perform Noob Smash: " .. err)
    end
end

-- Logic for Huge Noob ability
local function hugeNoob()
    local success, err = xpcall(function()
        -- Logic for Huge Noob
        local hugeBat = Instance.new("Part")
        hugeBat.Size = Vector3.new(2, 10, 2) -- Adjust size for effect
        hugeBat.Position = hrp.Position + Vector3.new(0, 5, 0)
        hugeBat.BrickColor = BrickColor.new("Bright yellow")
        hugeBat.Anchored = true
        hugeBat.Parent = workspace

        -- Swing the huge noob bat
        local swingAnimation = Instance.new("Motor6D")
        swingAnimation.Name = "HugeNoobAnimation"
        swingAnimation.Part0 = hrp
        swingAnimation.Part1 = character:WaitForChild("Head") -- Connect to the head
        swingAnimation.C0 = CFrame.new(0, 5, 0) -- Adjust as needed
        swingAnimation.Parent = hrp

        -- Perform the swing
        for i = 1, 20 do
            swingAnimation.C0 = swingAnimation.C0 * CFrame.Angles(0, math.rad(4.5), 0) -- Swing the bat gradually
            task.wait(0.05) -- Smooth transition
        end

        -- Ragdoll nearby players
        for _, otherPlayer in ipairs(Players:GetPlayers()) do
            if otherPlayer.Character and otherPlayer ~= player then
                local otherHRP = otherPlayer.Character:FindFirstChild("HumanoidRootPart")
                if otherHRP and (otherHRP.Position - hrp.Position).magnitude < 10 then -- Adjust radius as needed
                    local otherHumanoid = otherPlayer.Character:FindFirstChildOfClass("Humanoid")
                    if otherHumanoid then
                        otherHumanoid:ChangeState(Enum.HumanoidStateType.Physics)
                        otherHRP.Velocity = Vector3.new(math.random(-100, 100), 150, math.random(-100, 100))
                    end
                end
            end
        end

        hugeBat:Destroy()
    end, debug.traceback)

    if not success then
        warn("Failed to perform Huge Noob: " .. err)
    end
end

-- Logic for Finale Of The Noobs ability
local function finaleOfTheNoobs()
    local success, err = xpcall(function()
        -- Logic for Finale Of The Noobs
        NotificationLibrary:Notify("Finale Of The Noobs", "Okay I'm Tired Of This You're All Dead You Noobs!", 5)

        local giantNoob = Instance.new("Part")
        giantNoob.Size = Vector3.new(10, 10, 10) -- Adjust size for effect
        giantNoob.Position = hrp.Position + Vector3.new(0, 10, 0)
        giantNoob.BrickColor = BrickColor.new("Bright orange")
        giantNoob.Anchored = true
        giantNoob.Parent = workspace

        -- Spawn animation and attack logic
        task.wait(1)
        for _, otherPlayer in ipairs(Players:GetPlayers()) do
            if otherPlayer.Character and otherPlayer ~= player then
                local otherHRP = otherPlayer.Character:FindFirstChild("HumanoidRootPart")
                if otherHRP and (otherHRP.Position - giantNoob.Position).magnitude < 20 then -- Adjust radius as needed
                    otherHRP:Destroy() -- Eliminate the player
                end
            end
        end

        giantNoob:Destroy()
    end, debug.traceback)

    if not success then
        warn("Failed to perform Finale Of The Noobs: " .. err)
    end
end

-- Keybinds for abilities
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end

    if input.KeyCode == Enum.KeyCode.Q then
        -- Noob Smash Ability
        task.spawn(noobSmash)
    elseif input.KeyCode == Enum.KeyCode.E then
        -- Huge Noob Ability
        task.spawn(hugeNoob)
    elseif input.KeyCode == Enum.KeyCode.C then
        -- Finale Of The Noobs Ability
        task.spawn(finaleOfTheNoobs)
    end
end)

-- Equip the Noob Bat and perform spawn animation
equipNoobBat()
spawnAnimation()
