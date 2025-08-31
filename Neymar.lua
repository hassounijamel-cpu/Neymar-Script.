-- Services
local TweenService = game:GetService("TweenService")
local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

-- GUI
local loadingGui = Instance.new("ScreenGui")
loadingGui.Name = "Y2HubLoading"
loadingGui.ResetOnSpawn = false
loadingGui.Parent = PlayerGui

-- التغويش في الخلفية
local blur = Instance.new("BlurEffect")
blur.Size = 20
blur.Parent = Lighting

-- الخلفية السوداء
local blurFrame = Instance.new("Frame")
blurFrame.Size = UDim2.new(0, 400, 0, 200)
blurFrame.Position = UDim2.new(0.5, -200, 0.5, -100)
blurFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
blurFrame.BackgroundTransparency = 0.3
blurFrame.BorderSizePixel = 0
blurFrame.Parent = loadingGui
blurFrame.ClipsDescendants = true
Instance.new("UICorner", blurFrame).CornerRadius = UDim.new(0, 15)

-- عنوان مع النجوم
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 50)
title.Position = UDim2.new(0, 0, 0, 10)
title.BackgroundTransparency = 1
title.Text = " Neymar Hub "
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextScaled = true
title.Parent = blurFrame

-- كلمة جاري التحميل
local loadingText = Instance.new("TextLabel")
loadingText.Size = UDim2.new(1, 0, 0, 40)
loadingText.Position = UDim2.new(0, 0, 0.3, 0)
loadingText.BackgroundTransparency = 1
loadingText.Text = "جاري التحميل..."
loadingText.Font = Enum.Font.Gotham
loadingText.TextColor3 = Color3.fromRGB(255, 255, 255)
loadingText.TextScaled = true
loadingText.Parent = blurFrame

-- شريط التحميل
local barBackground = Instance.new("Frame")
barBackground.Size = UDim2.new(0.8, 0, 0, 20)
barBackground.Position = UDim2.new(0.1, 0, 0.7, 0)
barBackground.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
barBackground.BorderSizePixel = 0
barBackground.Parent = blurFrame
Instance.new("UICorner", barBackground).CornerRadius = UDim.new(0, 10)

local barFill = Instance.new("Frame")
barFill.Size = UDim2.new(0, 0, 1, 0)
barFill.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
barFill.BorderSizePixel = 0
barFill.Parent = barBackground
Instance.new("UICorner", barFill).CornerRadius = UDim.new(0, 10)

-- الصوت الجديد
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://4590662766"
sound.Volume = 2
sound.Parent = loadingGui
sound:Play()

-- النجوم المتساقطة
for i = 1, 20 do
	local star = Instance.new("TextLabel")
	star.Text = ". "
	star.Font = Enum.Font.SourceSansBold
	star.TextSize = 18
	star.TextColor3 = Color3.fromRGB(255, 255, 255)
	star.BackgroundTransparency = 1
	star.Size = UDim2.new(0, 20, 0, 20)
	star.Position = UDim2.new(math.random(), 0, -0.1, 0)
	star.Parent = loadingGui

	local speed = math.random(3, 6)
	RunService.Heartbeat:Connect(function(dt)
		star.Position = UDim2.new(star.Position.X.Scale, 0, star.Position.Y.Scale + (dt / speed), 0)
		if star.Position.Y.Scale > 1.2 then
			star.Position = UDim2.new(math.random(), 0, -0.1, 0)
		end
	end)
end

-- حركة تعبئة الشريط
local tween = TweenService:Create(barFill, TweenInfo.new(3, Enum.EasingStyle.Linear), {Size = UDim2.new(1, 0, 1, 0)})
tween:Play()

-- إخفاء الواجهة بعد التحميل + رستارت للشخصية
tween.Completed:Connect(function()
	wait(0.5)
	blur:Destroy()
	loadingGui:Destroy()

	-- إعادة تشغيل الشخصية
	local char = Players.LocalPlayer.Character
	if char then
		char:BreakJoints()
	end
end)
-- 🔔 تنبيه أول ما يشتغل السكربت
game.StarterGui:SetCore("SendNotification", {
    Title = "السكربت";
    Text = " لقد تم التفعيل ";
    Duration = 5;
})

-- ✏️ يغير الاسم
game:GetService("ReplicatedStorage").RE["1RPNam1eTex1t"]:FireServer("RolePlayName", " تم تفعيل سكربت نيمار ")

-- ✏️ يغير البايو
local args = {
    [1] = "RolePlayBio",
    [2] = "نيمار"
}
game:GetService("ReplicatedStorage").RE["1RPNam1eTex1t"]:FireServer(unpack(args))


-- ScreenGui
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = CoreGui -- ما يروح عند الموت

-- زر المربع الصغير
local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.new(0, 50, 0, 50)
ToggleButton.Position = UDim2.new(0, 20, 0.5, -25)
ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
ToggleButton.Text = ""
ToggleButton.Active = true
ToggleButton.Draggable = true -- قابل للسحب
ToggleButton.Parent = ScreenGui

-- المربع الكبير (القائمة)
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 600, 0, 0) -- يبدأ مغلق
MainFrame.Position = UDim2.new(0.5, -300, 0.5, -175)
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 200)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui

-- العنوان
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundColor3 = Color3.fromRGB(0, 0, 150)
Title.Text = "SCRIPT NEYMAR"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 22
Title.Parent = MainFrame

-- الحاوية الأساسية
local ContentFrame = Instance.new("Frame")
ContentFrame.Size = UDim2.new(1, -10, 1, -50)
ContentFrame.Position = UDim2.new(0, 5, 0, 45)
ContentFrame.BackgroundTransparency = 1
ContentFrame.Parent = MainFrame

-- قسم القائمة (يسار)
local SectionsFrame = Instance.new("ScrollingFrame")
SectionsFrame.Size = UDim2.new(0.3, 0, 1, 0)
SectionsFrame.Position = UDim2.new(0, 0, 0, 0)
SectionsFrame.BackgroundTransparency = 1
SectionsFrame.ScrollBarThickness = 6
SectionsFrame.CanvasSize = UDim2.new(0,0,0,0)
SectionsFrame.Parent = ContentFrame

-- ترتيب الأزرار
local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = SectionsFrame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 5)

-- قسم الصفحات
local PagesFrame = Instance.new("Frame")
PagesFrame.Size = UDim2.new(0.7, -5, 1, 0)
PagesFrame.Position = UDim2.new(0.3, 5, 0, 0)
PagesFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 150)
PagesFrame.Parent = ContentFrame

-- الصفحات (10)
local Pages = {}
for i = 1, 10 do
    local Page = Instance.new("ScrollingFrame")
    Page.Size = UDim2.new(1, 0, 1, 0)
    Page.BackgroundColor3 = Color3.fromRGB(0, 0, 120 + i*10)
    Page.Visible = false
    Page.ScrollBarThickness = 8
    Page.CanvasSize = UDim2.new(0, 0, 2, 0)
    Page.Parent = PagesFrame
    Pages[i] = Page
end
Pages[1].Visible = true

-- 🟦 محتوى صفحة 1 (معلومات)
local Info1 = Instance.new("TextLabel")
Info1.Size = UDim2.new(1, -10, 0, 40)
Info1.Position = UDim2.new(0, 5, 0, 5)
Info1.BackgroundTransparency = 1
Info1.Text = "تيگ: ney_marr2"
Info1.TextColor3 = Color3.fromRGB(255,255,255)
Info1.TextSize = 22
Info1.Font = Enum.Font.SourceSansBold
Info1.Parent = Pages[1]

local Info2 = Info1:Clone()
Info2.Position = UDim2.new(0, 5, 0, 50)
Info2.Text = "روب: Kdkjdnde"
Info2.Parent = Pages[1]

-- 🟦 محتوى صفحة 2 (سكربتات من صنعي)
local SpeedButton = Instance.new("TextButton")
SpeedButton.Size = UDim2.new(1, -10, 0, 40)
SpeedButton.Position = UDim2.new(0, 5, 0, 5)
SpeedButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
SpeedButton.Text = "سكربت سرعة نيمار"
SpeedButton.TextColor3 = Color3.fromRGB(255,255,255)
SpeedButton.Parent = Pages[2]

local JumpButton = Instance.new("TextButton")
JumpButton.Size = UDim2.new(1, -10, 0, 40)
JumpButton.Position = UDim2.new(0, 5, 0, 50)
JumpButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
JumpButton.Text = "قفز لا نهائي"
JumpButton.TextColor3 = Color3.fromRGB(255,255,255)
JumpButton.Parent = Pages[2]

-- زر جديد: طيران نيمار
local FlyButton = Instance.new("TextButton")
FlyButton.Size = UDim2.new(1, -10, 0, 40)
FlyButton.Position = UDim2.new(0, 5, 0, 95)
FlyButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
FlyButton.Text = "طيران نيمار"
FlyButton.TextColor3 = Color3.fromRGB(255,255,255)
FlyButton.Parent = Pages[2]

FlyButton.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/hassounijamel-cpu/Neymarrflayyyy/refs/heads/main/Neymarfly.lua"))()
end)

-- نافذة السرعة
local SpeedFrame = Instance.new("Frame")
SpeedFrame.Size = UDim2.new(0, 250, 0, 150)
SpeedFrame.Position = UDim2.new(0.5, -125, 0.5, -75)
SpeedFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
SpeedFrame.Visible = false
SpeedFrame.Active = true
SpeedFrame.Draggable = true
SpeedFrame.Parent = ScreenGui

local SpeedBox = Instance.new("TextBox")
SpeedBox.Size = UDim2.new(1, -20, 0, 40)
SpeedBox.Position = UDim2.new(0, 10, 0, 10)
SpeedBox.PlaceholderText = "اكتب رقم السرعة"
SpeedBox.Parent = SpeedFrame

local SpeedOn = Instance.new("TextButton")
SpeedOn.Size = UDim2.new(0.5, -15, 0, 40)
SpeedOn.Position = UDim2.new(0, 10, 0, 60)
SpeedOn.Text = "تشغيل السرعة"
SpeedOn.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
SpeedOn.Parent = SpeedFrame

local SpeedOff = Instance.new("TextButton")
SpeedOff.Size = UDim2.new(0.5, -15, 0, 40)
SpeedOff.Position = UDim2.new(0.5, 5, 0, 60)
SpeedOff.Text = "إطفاء السرعة"
SpeedOff.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
SpeedOff.Parent = SpeedFrame

-- وظائف السرعة
SpeedButton.MouseButton1Click:Connect(function()
    SpeedFrame.Visible = not SpeedFrame.Visible
end)

SpeedOn.MouseButton1Click:Connect(function()
    local val = tonumber(SpeedBox.Text)
    if val then
        LocalPlayer.Character.Humanoid.WalkSpeed = val
    end
end)

SpeedOff.MouseButton1Click:Connect(function()
    LocalPlayer.Character.Humanoid.WalkSpeed = 16
end)

-- قفز لا نهائي
local infiniteJump = false
JumpButton.MouseButton1Click:Connect(function()
    infiniteJump = not infiniteJump
end)

game:GetService("UserInputService").JumpRequest:Connect(function()
    if infiniteJump and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
        LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
    end
end)

-- 🟦 محتوى صفحة 3 (سكربتات عامه )
local vr7Button = Instance.new("TextButton")
vr7Button.Size = UDim2.new(1, -10, 0, 40)
vr7Button.Position = UDim2.new(0, 5, 0, 95)
vr7Button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
vr7Button.Text = "طيران نيمار"
vr7Button.TextColor3 = Color3.fromRGB(255,255,255)
vr7Button.Parent = Pages[3]
vr7Button.MouseButton1Click:Connect(function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-VR7-45290"))()
end)	

-- الأزرار (10 أقسام)
for i = 1, 10 do
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(1, -10, 0, 40)
    Button.BackgroundColor3 = Color3.fromRGB(0, 0, 180)
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.LayoutOrder = i

    if i == 1 then
        Button.Text = "معلومات"
    elseif i == 2 then
        Button.Text = "سكربتات من صنعي"
    else
        Button.Text = "قسم " .. i
    end

    Button.Parent = SectionsFrame

    Button.MouseButton1Click:Connect(function()
        for _, p in ipairs(Pages) do
            p.Visible = false
        end
        Pages[i].Visible = true
    end)
end

-- تحديث CanvasSize
UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    SectionsFrame.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 10)
end)

-- ⚡ فتح/غلق بانيميشن
local TweenService = game:GetService("TweenService")
local open = false

ToggleButton.MouseButton1Click:Connect(function()
	open = not open
	local goal = {}
	if open then
		goal.Size = UDim2.new(0, 600, 0, 350)
	else
		goal.Size = UDim2.new(0, 600, 0, 0)
	end
	local tween = TweenService:Create(MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), goal)
	tween:Play()
end)
