getgenv().autoTap = false;

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

b:DestroyGUI()


function doTap()
    spawn(function()
        while autoTap == true do
            remotePath.Clicked:FireServer()
            wait()
        end
    end)
end
