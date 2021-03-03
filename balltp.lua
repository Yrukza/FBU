plr = game.Players.LocalPlayer
hentaiplr = plr.Character
mouse = plr:GetMouse()

mouse.KeyDown:connect(function(key)
    if key == "c" then
        if not game.Workspace:FindFirstChild('Football') then
            game.StarterGui:SetCore("ChatMakeSystemMessage",{
                Text = '[SERVER]: You were teleported to the player that has the ball.';
                Color = Color3.new(247/0,0/0,255/0);
                Font = Enum.Font.SourceSansLight;
                FontSize = Enum.FontSize.Size18;
            })
            for i,v in pairs(game.Players:GetChildren())do
                if v.Character:FindFirstChild("Football") then
                    local BallPosition = v.Character.Football.Handle.Position
                    local player = game.Players.LocalPlayer.Character
                    player.HumanoidRootPart.CFrame = CFrame.new(BallPosition)
                end
            end
        end
        if game.Workspace:FindFirstChild('Football') then
            getobject()
            game.Players.LocalPlayer.Character:MoveTo(pos)
            game.StarterGui:SetCore("ChatMakeSystemMessage",{
                Text = '[SERVER]: You were teleported to the ball';
                Color = Color3.new(247/0,0/0,255/0);
                Font = Enum.Font.SourceSansLight;
                FontSize = Enum.FontSize.Size18;
            })
        end
    end
end)

down = false
velocity = Instance.new("BodyVelocity")
velocity.maxForce = Vector3.new(100000, 0, 100000)

local speed = 75
gyro = Instance.new("BodyGyro")
gyro.maxTorque = Vector3.new(100000, 0, 100000)

local hum = game.Players.LocalPlayer.Character.Humanoid

function onButton1Down(mouse)
    down = true
    velocity.Parent = game.Players.LocalPlayer.Character.UpperTorso
    velocity.velocity = (hum.MoveDirection) * speed
    gyro.Parent = game.Players.LocalPlayer.Character.UpperTorso
    while down do
        if not down then break end
        velocity.velocity = (hum.MoveDirection) * speed
        local refpos = gyro.Parent.Position + (gyro.Parent.Position - workspace.CurrentCamera.CoordinateFrame.p).unit * 5
        gyro.cframe = CFrame.new(gyro.Parent.Position, Vector3.new(refpos.x, gyro.Parent.Position.y, refpos.z))
        wait(0.1)
    end
end

function onButton1Up(mouse)
    velocity.Parent = nil
    gyro.Parent = nil
    down = false
end

function onSelected(mouse)
    mouse.KeyDown:connect(function(k) if k:lower()=="q"then onButton1Down(mouse)end end)
    mouse.KeyUp:connect(function(k) if k:lower()=="q"then onButton1Up(mouse)end end)
end

onSelected(game.Players.LocalPlayer:GetMouse())

game.StarterGui:SetCore("ChatMakeSystemMessage",{
    Text = '[SERVER]: You loaded the Football Universe script made by colin#0420';
    Color = Color3.new(247/0,0/0,255/0);
    Font = Enum.Font.SourceSansLight;
    FontSize = Enum.FontSize.Size18;
})
game.StarterGui:SetCore("ChatMakeSystemMessage",{
    Text = '[SERVER]: Q is your speed keybind.';
    Color = Color3.new(247/0,0/0,255/0);
    Font = Enum.Font.SourceSansLight;
    FontSize = Enum.FontSize.Size18;
})
game.StarterGui:SetCore("ChatMakeSystemMessage",{
    Text = '[SERVER]: C is your ball tp keybind.';
    Color = Color3.new(247/0,0/0,255/0);
    Font = Enum.Font.SourceSansLight;
    FontSize = Enum.FontSize.Size18;
})

function getobject()
    object = game.Workspace.Football
    pos = object.Position
end

--             Admin Commands               --


local notifsEnabled = true
local player = game:GetService("Players").LocalPlayer
_G.prefix = ";"--change this to whatever.
local gsub = string.gsub
local find = string.find

local function cmdlist()
    wait(0.5)
    game.StarterGui:SetCore("ChatMakeSystemMessage",{
        Text = ';test : Makes you say exploit information.';
        Color = Color3.new(247/0,0/0,255/0);
        Font = Enum.Font.SourceSansLight;
        FontSize = Enum.FontSize.Size18;
    })
    game.StarterGui:SetCore("ChatMakeSystemMessage",{
        Text = ';removebarrier : Removes barrier to allow you to cross line pre-hike.';
        Color = Color3.new(247/0,0/0,255/0);
        Font = Enum.Font.SourceSansLight;
        FontSize = Enum.FontSize.Size18;
    })
    game.StarterGui:SetCore("ChatMakeSystemMessage",{
        Text = ';showwalls : Puts transparency of walls to 0.9 to show them.';
        Color = Color3.new(247/0,0/0,255/0);
        Font = Enum.Font.SourceSansLight;
        FontSize = Enum.FontSize.Size18;
    })
    game.StarterGui:SetCore("ChatMakeSystemMessage",{
        Text = ';hidewalls : Puts transparency of walls to 1 to hide them.';
        Color = Color3.new(247/0,0/0,255/0);
        Font = Enum.Font.SourceSansLight;
        FontSize = Enum.FontSize.Size18;
    })
    game.StarterGui:SetCore("ChatMakeSystemMessage",{
        Text = ';antitackle : Makes it so you cannot be tackled.';
        Color = Color3.new(247/0,0/0,255/0);
        Font = Enum.Font.SourceSansLight;
        FontSize = Enum.FontSize.Size18;
    })
end
    
local function notify(title,text,duritation)
game:GetService("StarterGui"):SetCore("SendNotification",{
    Title=title;
    Text=text;
    Duritation=duritation;
})
end
    
game:GetService("Players").LocalPlayer.Chatted:connect(function(msg)
    if (string.lower(msg) == _G.prefix.."test") then
        wait(0.5)
        game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer('Success.', 'All');
        game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer('Loaded custom admin commands for, Football Universe.', 'All');
        _G.player = game:GetService("Players").LocalPlayer.Name
        if _G.player == "McDonaldOG" then
            rank = "Creator"
        else
            rank = "User"
        end
        game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer('Access Level: ', 'All');
        game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(rank, 'All');
        
    end
    if (string.lower(msg) == _G.prefix.."removebarrier") then
        notify("Success", "You have removed the barrier.", 5)
        while notifsEnabled do
            if game.Workspace.Scrimmage.ScrimmageWall.CanCollide == true then
                game.Workspace.Scrimmage.ScrimmageWall.CanCollide = false
                print('wall collision off')
            else
                print('wall collision on')
            end
            wait(1)
        end    
    end
    if (string.lower(msg) == _G.prefix.."showwalls") then
        notify("Success", "All walls are now shown.", 5)
        game.Workspace.Walls.Wall1.Transparency = 0.9
        game.Workspace.Walls.Wall2.Transparency = 0.9
        game.Workspace.Walls.Wall3.Transparency = 0.9
        game.Workspace.Walls.Wall4.Transparency = 0.9
    end
    if (string.lower(msg) == _G.prefix.."hidewalls") then
        notify("Success", "All walls are now hidden.", 5)
        game.Workspace.Walls.Wall1.Transparency = 1
        game.Workspace.Walls.Wall2.Transparency = 1
        game.Workspace.Walls.Wall3.Transparency = 1
        game.Workspace.Walls.Wall4.Transparency = 1
    end
    if (string.lower(msg) == _G.prefix.."antitackle") then
        if game.Workspace[game.Players.LocalPlayer.Name]:FindFirstChild('TackleBox') then
            notify("Success", "You can't be tackled anymore.", 5)
            workspace[game.Players.LocalPlayer.Name].TackleBox:Remove()
        else
            notify("Failed...", "You don't have a tackle box!", 5)
        end
    end
    if (string.lower(msg) == _G.prefix.."cmds") then
        cmdlist()
    end
end)
    
if notifsEnabled then
    notify("Welcome", player.Name, 5)
    notify("Help:", _G.prefix.."cmds", 5)
    notify("Author:", "colin#0420", 5)
end