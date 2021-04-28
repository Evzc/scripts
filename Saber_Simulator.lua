getgenv().autoTap = false;
getgenv().autoSell = false;

local remotePath = game:GetService("ReplicatedStorage").Events



local library = loadstring(game:HttpGet(('https://pastebin.com/raw/FsJak6AT')))() -- It's obfuscated, I won't let you see my ugly coding skills. =)

local w = library:CreateWindow("SABER SIMULATOR")

local b = w:CreateFolder("Farming")

b:Toggle("Autoclick",function(bool)
    getgenv().autoTap = bool
    print('Autoclick is:', bool);
    if bool then
        doTap()
    end
end)

b:Toggle("AutoSell",function(bool)
    getgenv().autoSell = bool
    print('AutoSell is:', bool);
    if bool then
        doSell()
    end
end)

b:DestroyGUI()


function doTap()
    spawn(function()
        while autoTap == true do
            remotePath.Clicked:FireServer()
            wait()
        end
    end)
end

function doSell()
    spawn(function()
        while autoSell == true do
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(542.9104, 197.927979, 144.900696)
            wait(2)
        end
    end)
end
