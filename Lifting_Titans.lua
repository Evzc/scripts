getgenv().autoLifting = false;
getgenv().autoSelling = false;
getgenv().bugEgg = false;

local remotePath = game:GetService("ReplicatedStorage").Remotes

local library = loadstring(game:HttpGet(('https://pastebin.com/raw/FsJak6AT')))() -- It's obfuscated, I won't let you see my ugly coding skills. =)

local w = library:CreateWindow("LIFTING TITANS")

local b = w:CreateFolder("Farming")

local c = w:CreateFolder("Pets")

local d = w:CreateFolder("Teleport")

local e = w:CreateFolder("Misc")

b:Toggle("Autolift",function(bool)
    getgenv().autoLifting = bool
    print('autolift is:', bool);
    if bool then
        autoLift()
    end
end)

b:Toggle("Autosell",function(bool)
    getgenv().autoSelling = bool
    print('autosell is:', bool);
    if bool then
        autoSell()
    end
end)

local selectedEgg;
c:Dropdown("Select Egg",{"Farm Egg","Youtube Egg","Jungle Egg","Heaven Egg","Space Egg","Future Egg"},true,function(value)
    selectedEgg = value;
    print(value)
end)
c:Toggle("Buy Egg",function(bool)
    getgenv().bugEgg = bool
    print('buy pet is:', bool);
    if bool and selectedEgg then
        buyEgg(selectedEgg)
    end
end)

d:Button("Shop",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(280.488068, 231.287445, -435.549896)
end)

d:Button("Sell",function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(239.366623, 231.287445, -408.20047)
end)

e:DestroyGUI()

function autoLift()
    spawn(function()
        while autoLifting == true do
            remotePath.OnLift:FireServer()
            wait()
        end
    end)
end

function autoSell()
    spawn(function()
        while autoSelling == true do
            remotePath.Sell:FireServer()
            wait()
        end
    end)
end

function buyEgg(eggType)
    spawn(function()
        while wait() do
            if not getgenv().bugEgg then break end
            remotePath.HatchEgg:InvokeServer(eggType)
            wait()
        end
    end)
end
