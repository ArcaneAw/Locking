        getgenv().DesynxRX = true

function checkifalive(player) --checks if the player is alive 
    if player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health ~= 1 and player.Character:FindFirstChild("Head") then
        return true
    end
end

function cframefix() --old version
    if checkifalive(game.Players.LocalPlayer) then
    for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if v:IsA("Script") and v.Name ~= "Health" and v.Name ~= "Sound" and v:FindFirstChild("LocalScript") then
            v:Destroy()
        end
    end
    game.Players.LocalPlayer.CharacterAdded:Connect(function(char)
        repeat
            task.wait()
        until game.Players.LocalPlayer.Character
        char.ChildAdded:Connect(function(child)
            if child:IsA("Script") then 
                if child:FindFirstChild("LocalScript") and checkifalive(game.Players.LocalPlayer) then
                    child.LocalScript:FireServer()
                end
            end
        end)
    end)
end
end

game:GetService("RunService").Heartbeat:Connect(function()--the actual script running
    if getgenv().DesynxRX == true and checkifalive(game.Players.LocalPlayer) then
        local olspo =  game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity cframefix() 
          game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame *  CFrame.Angles(0,360, 0)
     game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(olspo.X + math.random(1000,10000) ,olspo.Y + math.random(1000,1000),olspo.Z + math.random(1000,10000))
     game:GetService("RunService").RenderStepped:wait()
        game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity =  olspo
        game:GetService("RunService").RenderStepped:wait()
    end
end)
