AutoFarm = true

while AutoFarm and wait() do
    for i,v in pairs(game.Workspace.CandyHolder:GetChildren()) do
        if v.Name == "Egg" then
            local Time = 2 -- Time in seconds
            local tween =  game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(Time), {CFrame = v.CFrame})
            tween:Play()
            tween.Completed:Wait()
        end;
    end;
end;
