        local a=setmetatable({},{__index=function(b,c)local d=game.GetService(game,c)if d then b[c]=d end;return d end})local e=a.Players.LocalPlayer;local function f(g)local h=false;local i;local j;local function k(l)i=l;repeat wait()j=l:FindFirstChild("HumanoidRootPart")until j;h=false end;k(g.Character or g.CharacterAdded:Wait())g.CharacterAdded:Connect(k)a.RunService.Heartbeat:Connect(function()if i and i:IsDescendantOf(workspace)and(j and j:IsDescendantOf(i))then if j.AssemblyAngularVelocity.Magnitude>50 or j.AssemblyLinearVelocity.Magnitude>100 then if h==false then game.StarterGui:SetCore("ChatMakeSystemMessage",{Text="Fling Exploit detected, Player: "..tostring(g),Color=Color3.fromRGB(255,200,0)})end;h=true;for m,n in ipairs(i:GetDescendants())do if n:IsA("BasePart")then n.CanCollide=false;n.AssemblyAngularVelocity=Vector3.new(0,0,0)n.AssemblyLinearVelocity=Vector3.new(0,0,0)n.CustomPhysicalProperties=PhysicalProperties.new(0,0,0)end end;j.CanCollide=false;j.AssemblyAngularVelocity=Vector3.new(0,0,0)j.AssemblyLinearVelocity=Vector3.new(0,0,0)j.CustomPhysicalProperties=PhysicalProperties.new(0,0,0)end end end)end;for m,n in ipairs(a.Players:GetPlayers())do if n~=e then f(n)end end;a.Players.PlayerAdded:Connect(f)local o=nil;a.RunService.Heartbeat:Connect(function()pcall(function()local j=e.Character.PrimaryPart;if j.AssemblyLinearVelocity.Magnitude>250 or j.AssemblyAngularVelocity.Magnitude>250 then j.AssemblyAngularVelocity=Vector3.new(0,0,0)j.AssemblyLinearVelocity=Vector3.new(0,0,0)j.CFrame=o;game.StarterGui:SetCore("ChatMakeSystemMessage",{Text="You were flung. Neutralizing velocity.",Color=Color3.fromRGB(255,0,0)})elseif j.AssemblyLinearVelocity.Magnitude<50 or j.AssemblyAngularVelocity.Magnitude>50 then o=j.CFrame end end)end)