--[[local Settings = {
	AimLock = {
		Enabled = true,
		Aimlockkey = "e",
		Prediction = 0.121
		,
		Aimpart = 'HumanoidRootPart',
		Notifications = false
	},
	Settings = {
		Thickness = 3.5,
		Transparency = 100,
		Color = Color3.fromRGB(0,0,205),
		FOV = false
	}
}]]

local Inset = game:GetService("GuiService"):GetGuiInset().Y
local Line = Drawing.new("Line")
local Circle = Drawing.new("Circle")
local Plr

game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(KeyPressed)
	if KeyPressed == (Settings.AimLock.Aimlockkey) then
		if Settings.AimLock.Enabled == true then
			Settings.AimLock.Enabled = false
			if Settings.AimLock.Notifications == true then
				Plr = FindClosestPlayer()
				game.StarterGui:SetCore("SendNotification", {
					Title = "Private",
					Text = "Unlocked"
				})
			end
		else
			Plr = FindClosestPlayer()
			Settings.AimLock.Enabled = true
			if Settings.AimLock.Notifications == true then
				game.StarterGui:SetCore("SendNotification", {
					Title = "Private",
					Text = "Locked On :  " .. tostring(Plr.Character.Humanoid.DisplayName)
				})
			end
		end
	end
end)

function FindClosestPlayer()
	local ClosestDistance, ClosestPlayer = math.huge, nil;
	for _, Player in next, game:GetService("Players"):GetPlayers() do
		local ISNTKNOCKED = Player.Character:WaitForChild("BodyEffects")["K.O"].Value ~= true
		local ISNTGRABBED = Player.Character:FindFirstChild("GRABBING_COINSTRAINT") == nil

		if Player ~= game.Players.LocalPlayer then
			local Character = Player.Character
			if Character and Character.Humanoid.Health > 1 and ISNTKNOCKED and ISNTGRABBED then
				local Position, IsVisibleOnViewPort = game:GetService("Workspace").CurrentCamera:WorldToViewportPoint(Character.HumanoidRootPart
																							 .Position)
				if IsVisibleOnViewPort then
					local Distance = (Vector2.new(game.Players.LocalPlayer:GetMouse().X, game.Players.LocalPlayer:GetMouse().Y) - Vector2.new(Position.X, Position.Y)).Magnitude
					if Distance < ClosestDistance then
						ClosestPlayer = Player
						ClosestDistance = Distance
					end
				end
			end
		end
	end
	return ClosestPlayer, ClosestDistance
end

game:GetService("RunService").Heartbeat:connect(function()
	if Settings.AimLock.Enabled == true then
		local Vector = game:GetService("Workspace").CurrentCamera:WorldToViewportPoint(Plr.Character[Settings.AimLock.Aimpart].Position +
															  (Plr.Character[Settings.AimLock.Aimpart].Velocity *
															  Settings.AimLock.Prediction))
		Line.Color = Settings.Settings.Color
		Line.Transparency = Settings.Settings .Transparency
		Line.Thickness = Settings.Settings .Thickness
		Line.From = Vector2.new(game.Players.LocalPlayer:GetMouse().X, game.Players.LocalPlayer:GetMouse().Y + Inset)
		Line.To = Vector2.new(Vector.X, Vector.Y)
		Line.Visible = true
		Circle.Position = Vector2.new(game.Players.LocalPlayer:GetMouse().X, game.Players.LocalPlayer:GetMouse().Y + Inset)
		Circle.Visible = Settings.Settings.FOV
		Circle.Thickness = 1.5
		Circle.Thickness = 2
		Circle.Radius = 60
		Circle.Color = Settings.Settings.Color

	else
		Line.Visible = false
		Circle.Visible = false
	end
end)

local mt = getrawmetatable(game)
local old = mt.__namecall
setreadonly(mt, false)
mt.__namecall = newcclosure(function(...)
	local args = {...}
	if Settings.AimLock.Enabled and getnamecallmethod() == "FireServer" and args[2] == "UpdateMousePosI" then
		args[3] = Plr.Character[Settings.AimLock.Aimpart].Position +
					  (Plr.Character[Settings.AimLock.Aimpart].Velocity * Settings.AimLock.Prediction)

		return old(unpack(args))
	end
	return old(...)
end)  
