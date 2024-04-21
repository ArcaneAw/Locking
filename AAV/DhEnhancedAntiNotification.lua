--ui
local Notification = Instance.new("ScreenGui")
local Holder = Instance.new("Frame")

Notification.Name = "Notification"
Notification.Parent = game.CoreGui
Notification.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Holder.Name = "Holder"
Holder.Parent = Notification
Holder.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Holder.BackgroundTransparency = 1.000
Holder.BorderColor3 = Color3.fromRGB(27, 42, 53)
Holder.Position = UDim2.new(0.0072954637, 0, 0.0105048735, 0)
Holder.Size = UDim2.new(0, 243, 0, 240)

Instance.new("UIListLayout").Parent = Holder
Instance.new("UIListLayout").SortOrder = Enum.SortOrder.LayoutOrder
Instance.new("UIListLayout").Padding = UDim.new(0, 4)

local rainbowcolor

spawn(function()
    while wait() do
        local r = (math.sin(workspace.DistributedGameTime/2)/2)+0.5
        local g = (math.sin(workspace.DistributedGameTime)/2)+0.5
        local b = (math.sin(workspace.DistributedGameTime*1.5)/2)+0.5
        local color = Color3.new(r, g, b)
        rainbowcolor = color
    end
end)

function notify(text,color,time,rainbowmode)
    local Template = Instance.new("Frame")
    local UIGradient = Instance.new("UIGradient")
    local ColorBar = Instance.new("Frame")
    local TextLabel = Instance.new("TextLabel")

    Template.Name = text
    Template.Parent = Holder
    Template.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    Template.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Template.Size = UDim2.new(0, 0, 0, 0)
    Template.Transparency = 1

    UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(147, 147, 147)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(39, 39, 39))}
    UIGradient.Rotation = 90
    UIGradient.Parent = Template

    ColorBar.Name = "ColorBar"
    ColorBar.Parent = Template
    ColorBar.BackgroundColor3 = color
    ColorBar.BorderSizePixel = 0
    ColorBar.Size = UDim2.new(0, 2, 0, 22)
    ColorBar.Transparency = 1
    if rainbowmode then 
        spawn(function()
            while wait() do
                ColorBar.BackgroundColor3 = rainbowcolor
            end
        end)
    end

    TextLabel.Parent = Template
    TextLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    TextLabel.BackgroundTransparency = 1.000
    TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel.BorderSizePixel = 0
    TextLabel.Position = UDim2.new(0, 8, 0, 0)
    TextLabel.Size = UDim2.new(0, 0, 0, 22)
    TextLabel.Font = Enum.Font.SourceSans
    TextLabel.Text = text
    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.TextSize = 14.000
    TextLabel.TextStrokeTransparency = 0.000
    TextLabel.TextXAlignment = Enum.TextXAlignment.Left
    TextLabel.Transparency = 1

    Template.Size = UDim2.new(0,TextLabel.TextBounds.X+13,0,22)
    local goal2 = {}
    goal2.Transparency = 0
    local tweenInfo2 = TweenInfo.new(0.5)
    local tween12 = game:GetService("TweenService"):Create(Template, tweenInfo2, goal2)
    local tween22 = game:GetService("TweenService"):Create(ColorBar, tweenInfo2, goal2)
    local tween32 = game:GetService("TweenService"):Create(TextLabel, tweenInfo2, goal2)
    tween12:Play()
    tween22:Play()
    tween32:Play()

    delay(time,function()
        local goal = {}
        goal.Transparency = 1
        local tweenInfo = TweenInfo.new(0.5)
        local tween1 = game:GetService("TweenService"):Create(Template, tweenInfo, goal)
        local tween2 = game:GetService("TweenService"):Create(ColorBar, tweenInfo, goal)
        local tween3 = game:GetService("TweenService"):Create(TextLabel, tweenInfo, goal)
        tween1:Play()
        tween2:Play()
        tween3:Play()
        delay(0.51,function()
            Template:Destroy()
        end)
    end)
end
notify(".gg/CONSIST",Color3.fromRGB(147, 80, 186),2,false)

local Stats = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Frame2 = Instance.new("Frame")
local TopLine = Instance.new("Frame")
local TopLine2 = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")
local ClientStatsLabel = Instance.new("Frame")
local Index = Instance.new("TextLabel")
local Stats_Velocity = Instance.new("Frame")
local Index_2 = Instance.new("TextLabel")
local Value = Instance.new("TextLabel")
local Stats_RotVelocity = Instance.new("Frame")
local Index_3 = Instance.new("TextLabel")
local Value_2 = Instance.new("TextLabel")
local Stats_Rotation = Instance.new("Frame")
local Index_4 = Instance.new("TextLabel")
local Value_3 = Instance.new("TextLabel")
local Stats_Position = Instance.new("Frame")
local Index_5 = Instance.new("TextLabel")
local Value_4 = Instance.new("TextLabel")

Stats.Name = "Stats"
Stats.Parent = game.CoreGui
Stats.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame2.Parent = Stats
Frame2.AnchorPoint = Vector2.new(1, 0.5)
Frame2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame2.BackgroundTransparency = 0
Frame2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame2.BorderSizePixel = 2
Frame2.Position = UDim2.new(1, -15, 0.43109877, 0)
Frame2.Size = UDim2.new(0, 200, 0, 110)

Frame.Parent = Stats
Frame.AnchorPoint = Vector2.new(1, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Frame.BackgroundTransparency = 0
Frame.BorderColor3 = Color3.fromRGB(60, 60, 60)
Frame.BorderSizePixel = 1
Frame.Position = UDim2.new(1, -15, 0.43109877, 0)
Frame.Size = UDim2.new(0, 200, 0, 110)

TopLine.Parent = Stats
TopLine.AnchorPoint = Vector2.new(1, 0.5)
TopLine.BackgroundColor3 = Color3.fromRGB(147, 80, 186)
TopLine.BackgroundTransparency = 0
TopLine.BorderColor3 = Color3.fromRGB(60, 60, 60)
TopLine.BorderSizePixel = 0
TopLine.Position = UDim2.new(1, -15, 0.4, 0)
TopLine.Size = UDim2.new(0, 200, 0, 1)

TopLine2.Parent = Stats
TopLine2.AnchorPoint = Vector2.new(1, 0.5)
TopLine2.BackgroundColor3 = Color3.fromRGB(147, 80, 186)
TopLine2.BackgroundTransparency = 0
TopLine2.BorderColor3 = Color3.fromRGB(60, 60, 60)
TopLine2.BorderSizePixel = 0
TopLine2.Position = UDim2.new(1, -15, 0.378, 0)
TopLine2.Size = UDim2.new(0, 200, 0, 1)

UIListLayout.Parent = Frame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

ClientStatsLabel.Name = "ClientStatsLabel"
ClientStatsLabel.Parent = Frame
ClientStatsLabel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ClientStatsLabel.BackgroundTransparency = 0
ClientStatsLabel.BorderColor3 = Color3.fromRGB(60, 60, 60)
ClientStatsLabel.BorderSizePixel = 0
ClientStatsLabel.Size = UDim2.new(1, 0, 0, 22)

Index.Name = "Index"
Index.Parent = ClientStatsLabel
Index.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Index.BackgroundTransparency = 0
Index.BorderColor3 = Color3.fromRGB(60, 60, 60)
Index.BorderSizePixel = 0
Index.Position = UDim2.new(0, 5, 0, 0)
Index.Size = UDim2.new(1, -10, 1, 0)
Index.Font = Enum.Font.SourceSansBold
Index.Text = "Velocity Stats"
Index.TextColor3 = Color3.fromRGB(255, 255, 255)
Index.TextSize = 17
Index.TextStrokeTransparency = 0.000

Stats_Velocity.Name = "Stats_Velocity"
Stats_Velocity.Parent = Frame
Stats_Velocity.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Stats_Velocity.BackgroundTransparency = 0
Stats_Velocity.BorderColor3 = Color3.fromRGB(60, 60, 60)
Stats_Velocity.BorderSizePixel = 0
Stats_Velocity.Size = UDim2.new(1, 0, 0, 22)

Index_2.Name = "Index"
Index_2.Parent = Stats_Velocity
Index_2.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Index_2.BackgroundTransparency = 0
Index_2.BorderColor3 = Color3.fromRGB(60, 60, 60)
Index_2.BorderSizePixel = 0
Index_2.Position = UDim2.new(0, 5, 0, 0)
Index_2.Size = UDim2.new(0.5, -5, 1, 0)
Index_2.Font = Enum.Font.SourceSans
Index_2.Text = "Velocity"
Index_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Index_2.TextSize = 13.000
Index_2.TextStrokeTransparency = 0.000
Index_2.TextXAlignment = Enum.TextXAlignment.Left

Value.Name = "Value"
Value.Parent = Stats_Velocity
Value.AnchorPoint = Vector2.new(1, 0)
Value.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Value.BackgroundTransparency = 0
Value.BorderColor3 = Color3.fromRGB(60, 60, 60)
Value.BorderSizePixel = 0
Value.Position = UDim2.new(1, -5, 0, 0)
Value.Size = UDim2.new(0.5, -5, 1, 0)
Value.Font = Enum.Font.SourceSans
game:GetService("RunService").heartbeat:Connect(
    function()
        Value.Text =
            tostring(math.round(game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity.X)) ..
            ", " ..
                tostring(math.round(game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity.Y)) ..
                    ", " .. tostring(math.round(game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity.Z))
    end
)
Value.TextColor3 = Color3.fromRGB(255, 255, 255)
Value.TextSize = 13.000
Value.TextStrokeTransparency = 0.000
Value.TextXAlignment = Enum.TextXAlignment.Right

Stats_RotVelocity.Name = "Stats_RotVelocity"
Stats_RotVelocity.Parent = Frame
Stats_RotVelocity.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Stats_RotVelocity.BackgroundTransparency = 0
Stats_RotVelocity.BorderColor3 = Color3.fromRGB(60, 60, 60)
Stats_RotVelocity.BorderSizePixel = 0
Stats_RotVelocity.Size = UDim2.new(1, 0, 0, 22)

Index_3.Name = "Index"
Index_3.Parent = Stats_RotVelocity
Index_3.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Index_3.BackgroundTransparency = 0
Index_3.BorderColor3 = Color3.fromRGB(60, 60, 60)
Index_3.BorderSizePixel = 0
Index_3.Position = UDim2.new(0, 5, 0, 0)
Index_3.Size = UDim2.new(0.5, 10, 1, 0)
Index_3.Font = Enum.Font.SourceSans
Index_3.Text = "RotVelocity"
Index_3.TextColor3 = Color3.fromRGB(255, 255, 255)
Index_3.TextSize = 13.000
Index_3.TextStrokeTransparency = 0.000
Index_3.TextXAlignment = Enum.TextXAlignment.Left

Value_2.Name = "Value"
Value_2.Parent = Stats_RotVelocity
Value_2.AnchorPoint = Vector2.new(1, 0)
Value_2.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Value_2.BackgroundTransparency = 0
Value_2.BorderColor3 = Color3.fromRGB(60, 60, 60)
Value_2.BorderSizePixel = 0
Value_2.Position = UDim2.new(1, -5, 0, 0)
Value_2.Size = UDim2.new(0.5, -5, 1, 0)
Value_2.Font = Enum.Font.SourceSans
game:GetService("RunService").heartbeat:Connect(
    function()
        Value_2.Text =
            tostring(math.round(game.Players.LocalPlayer.Character.HumanoidRootPart.RotVelocity.X)) ..
            ", " ..
                tostring(math.round(game.Players.LocalPlayer.Character.HumanoidRootPart.RotVelocity.Y)) ..
                    ", " .. tostring(math.round(game.Players.LocalPlayer.Character.HumanoidRootPart.RotVelocity.Z))
    end
)
Value_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Value_2.TextSize = 13.000
Value_2.TextStrokeTransparency = 0.000
Value_2.TextXAlignment = Enum.TextXAlignment.Right

Stats_Rotation.Name = "Stats_Rotation"
Stats_Rotation.Parent = Frame
Stats_Rotation.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Stats_Rotation.BackgroundTransparency = 0
Stats_Rotation.BorderColor3 = Color3.fromRGB(60, 60, 60)
Stats_Rotation.BorderSizePixel = 0
Stats_Rotation.Size = UDim2.new(1, 0, 0, 22)

Index_4.Name = "Index"
Index_4.Parent = Stats_Rotation
Index_4.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Index_4.BackgroundTransparency = 0
Index_4.BorderColor3 = Color3.fromRGB(60, 60, 60)
Index_4.BorderSizePixel = 0
Index_4.Position = UDim2.new(0, 5, 0, 0)
Index_4.Size = UDim2.new(0.5, -5, 1, 0)
Index_4.Font = Enum.Font.SourceSans
Index_4.Text = "Rotation"
Index_4.TextColor3 = Color3.fromRGB(255, 255, 255)
Index_4.TextSize = 13.000
Index_4.TextStrokeTransparency = 0.000
Index_4.TextXAlignment = Enum.TextXAlignment.Left

Value_3.Name = "Value"
Value_3.Parent = Stats_Rotation
Value_3.AnchorPoint = Vector2.new(1, 0)
Value_3.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Value_3.BackgroundTransparency = 0
Value_3.BorderColor3 = Color3.fromRGB(60, 60, 60)
Value_3.BorderSizePixel = 0
Value_3.Position = UDim2.new(1, -5, 0, 0)
Value_3.Size = UDim2.new(0.5, -5, 1, 0)
Value_3.Font = Enum.Font.SourceSans
game:GetService("RunService").heartbeat:Connect(
    function()
        Value_3.Text =
            tostring(math.round(game.Players.LocalPlayer.Character.HumanoidRootPart.Rotation.X)) ..
            ", " ..
                tostring(math.round(game.Players.LocalPlayer.Character.HumanoidRootPart.Rotation.Y)) ..
                    ", " .. tostring(math.round(game.Players.LocalPlayer.Character.HumanoidRootPart.Rotation.Z))
    end
)
Value_3.TextColor3 = Color3.fromRGB(255, 255, 255)
Value_3.TextSize = 13.000
Value_3.TextStrokeTransparency = 0.000
Value_3.TextXAlignment = Enum.TextXAlignment.Right

Stats_Position.Name = "Stats_Position"
Stats_Position.Parent = Frame
Stats_Position.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Stats_Position.BackgroundTransparency = 0
Stats_Position.BorderColor3 = Color3.fromRGB(60, 60, 60)
Stats_Position.BorderSizePixel = 0
Stats_Position.Size = UDim2.new(1, 0, 0, 22)

Index_5.Name = "Index"
Index_5.Parent = Stats_Position
Index_5.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Index_5.BackgroundTransparency = 0
Index_5.BorderColor3 = Color3.fromRGB(60, 60, 60)
Index_5.BorderSizePixel = 0
Index_5.Position = UDim2.new(0, 5, 0, 0)
Index_5.Size = UDim2.new(0.5, -5, 1, 0)
Index_5.Font = Enum.Font.SourceSans
Index_5.Text = "Position"
Index_5.TextColor3 = Color3.fromRGB(255, 255, 255)
Index_5.TextSize = 13.000
Index_5.TextStrokeTransparency = 0.000
Index_5.TextXAlignment = Enum.TextXAlignment.Left

Value_4.Name = "Value"
Value_4.Parent = Stats_Position
Value_4.AnchorPoint = Vector2.new(1, 0)
Value_4.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Value_4.BackgroundTransparency = 0
Value_4.BorderColor3 = Color3.fromRGB(60, 60, 60)
Value_4.BorderSizePixel = 0
Value_4.Position = UDim2.new(1, -5, 0, 0)
Value_4.Size = UDim2.new(0.5, -5, 1, 0)
Value_4.Font = Enum.Font.SourceSans
game:GetService("RunService").heartbeat:Connect(
    function()
        Value_4.Text =
            tostring(math.round(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.X)) ..
            ", " ..
                tostring(math.round(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y)) ..
                    ", " .. tostring(math.round(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Z))
    end
)
Value_4.TextColor3 = Color3.fromRGB(255, 255, 255)
Value_4.TextSize = 13.000
Value_4.TextStrokeTransparency = 0.000
Value_4.TextXAlignment = Enum.TextXAlignment.Right

game:GetService("RunService").Heartbeat:Connect(
    function()
        TopLine2.Visible = getgenv().velostats
        TopLine.Visible = getgenv().velostats
        Frame.Visible = getgenv().velostats
        Frame2.Visible = getgenv().velostats
    end
)
