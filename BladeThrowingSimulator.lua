getgenv().autoThrowing = false;
getgenv().autoSelling = false;
getgenv().autoBuyingBlade = false;
getgenv().autoBuyingEnergy = false;
getgenv().autoBuyingRank = false;
getgenv().autoBuyingJump = false;
getgenv().autoEvolving = false;

local remotePath = game:GetService("ReplicatedStorage")

function autoSell()
    spawn(function()
        while autoSelling == true do
            local args = {[1] = "SellPower",[2] = workspace.Ignore.Rings:FindFirstChild("1Sell").Collider}
            remotePath.RF:InvokeServer(unpack(args))
            wait()
        end
    end)
end

function autoThrow()
    spawn(function()
        while autoThrowing == true do
            local args = {[1] = "Throw",[2] = Vector3.new(176.12925720215, -99.31591796875, -622.19128417969),[3] = false}
            remotePath.RE:FireServer(unpack(args))
            wait()
        end
    end)
end

function autoEvolve()
    spawn(function()
        while autoEvolving == true do
            local args = {[1] = "EvolveAll"}
            remotePath.RF:InvokeServer(unpack(args))
            wait(5)
        end
    end)
end

function autoBuyBlade()
    spawn(function()
        while autoBuyingBlade == true do
            local args = {[1] = "BuyBlade",[2] = true}
            remotePath.RF:InvokeServer(unpack(args))
            wait()
        end
    end)
end

function autoBuyEnergy()
    spawn(function()
        while autoBuyingEnergy == true do
            local args = {[1] = "BuyEnergy",[2] = true}
            remotePath.RF:InvokeServer(unpack(args))
            wait()
        end
    end)
end

function autoBuyAura()
    spawn(function()
        while autoBuyingAura == true do
            local args = {[1] = "BuyAura",[2] = true}
            remotePath.RF:InvokeServer(unpack(args))
            wait()
        end
    end)
end

function autoBuyRank()
    spawn(function()
        while autoBuyingRank == true do
            local args = {[1] = "BuyRank"}
            remotePath.RF:InvokeServer(unpack(args))
            wait()
        end
    end)
end

function autoBuyJump()
    spawn(function()
        while autoBuyingJump == true do
            local args = {[1] = "BuyJump"}
            remotePath.RF:InvokeServer(unpack(args))
            wait()
        end
    end)
end


local library = loadstring(game:HttpGet(('https://pastebin.com/raw/FsJak6AT')))() -- It's obfuscated, I won't let you see my ugly coding skills. =)

local w = library:CreateWindow("Blade Throwing Simulator")

local b = w:CreateFolder("Farming")

local c = w:CreateFolder("AutoBuy")

local d = w:CreateFolder("Pets")

local e = w:CreateFolder("Misc")

b:Toggle("AutoThrow",function(bool)
    getgenv().autoThrowing = bool
    print('Autoclick is:', bool);
    if bool then
        autoThrow()
    end
end)

b:Toggle("AutoSell",function(bool)
    getgenv().autoSelling = bool
    print('AutoSell is:', bool);
    if bool then
        autoSell()
    end
end)

c:Toggle("Buy Blade",function(bool)
    getgenv().autoBuyingBlade = bool
    print('AutoBlade is:', bool);
    if bool then
        autoBuyBlade()
    end
end)

c:Toggle("Buy Energy",function(bool)
    getgenv().autoBuyingEnergy = bool
    print('AutoEnergy is:', bool);
    if bool then
        autoBuyEnergy()
    end
end)

c:Toggle("Buy Rank",function(bool)
    getgenv().autoBuyingRank = bool
    print('AutoRank is:', bool);
    if bool then
        autoBuyRank()
    end
end)

c:Toggle("Buy Aura",function(bool)
    getgenv().autoBuyingAura = bool
    print('AutoAura is:', bool);
    if bool then
        autoBuyAura()
    end
end)

c:Toggle("Buy Jump",function(bool)
    getgenv().autoBuyingJump = bool
    print('AutoJump is:', bool);
    if bool then
        autoBuyJump()
    end
end)

d:Toggle("AutoEvolve",function(bool)
    getgenv().autoEvolving = bool
    print('AutoEvolve is:', bool);
    if bool then
        autoEvolve()
    end
end)

e:Button("Spin Wheel",function()
    local args = {[1] = "Wheel",[2] = "Wheel1"}
    remotePath.RF:InvokeServer(unpack(args))
end)

e:DestroyGUI()
