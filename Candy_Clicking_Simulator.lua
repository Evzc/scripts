getgenv().autoClick = false;
getgenv().autoRebirth = false;
getgenv().autoOpenEgg = false;
getgenv().autoSuperReb = false;

local remotePath = game:GetService("ReplicatedStorage").Events

function doClick()
    spawn(function()
        while autoClick == true do
            remotePath.ClickEvent:FireServer()
            wait()
        end
    end)
end

function doRebirth(rebirthAmount)
    spawn(function()
        while autoRebirth == true do
            remotePath.Rebirth:InvokeServer(rebirthAmount)
            wait()
        end
    end)
end

function doSuperReb(superRebirthAmount)
    spawn(function()
        while autoSuperReb == true do
            remotePath.SuperRebirth:InvokeServer(superRebirthAmount)
            wait()
        end
    end)
end

local library = loadstring(game:HttpGet(('https://pastebin.com/raw/FsJak6AT')))() -- It's obfuscated, I won't let you see my ugly coding skills. =)

local w = library:CreateWindow("Candy Clicking Simulator")

local b = w:CreateFolder("Main")

local c = w:CreateFolder("Rebirths")

local d = w:CreateFolder("Misc")

b:Toggle("Autoclick",function(bool)
    getgenv().autoClick = bool
    print('Autoclick is:', bool);
    if bool then
        doClick()
    end
end)

local selectedRebirth;
c:Dropdown("Select Amount",{"1","5","15","25","50","100","500","1000","2500","5000","10000","25000","50000","100000"},true,function(value) --Replace the Dropdown name with the selected one(A,B,C)
    selectedRebirth = value;
    print(value)
end)
c:Toggle("AutoRebirth",function(bool)
    getgenv().autoRebirth = bool
    print('AutoRebirth is:', bool);
    if bool and selectedRebirth then
        doRebirth(selectedRebirth)
    end
end)


local selectedSuperRebirth;
c:Dropdown("Select Amount",{"1","3","5"},true,function(value) --Replace the Dropdown name with the selected one(A,B,C)
    selectedSuperRebirth = value;
    print(value)
end)
c:Toggle("AutoSuperRebirth",function(bool)
    getgenv().autoSuperReb = bool
    print('AutoSuperRebirth is:', bool);
    if bool and selectedSuperRebirth then
        doSuperReb(selectedSuperRebirth)
    end
end)

d:DestroyGUI()
