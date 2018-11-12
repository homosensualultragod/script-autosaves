local Player = game.Players.localPlayer
local Character = Player.Character 
local asd = 0
wait(0.5)
local d = Character:GetChildren()
for i=1, #d  do 
	if d[i].className == ("Accessory") then 
		d[i].Handle.Transparency = 1 
	end 
end
local asd2 = function()
for i=1, #d  do 
	if d[i].className == ("Accessory") then 
		d[i].Handle.Transparency = 1 
	end 
end
end
local asd3 = function()
for i=1, #d  do 
	if d[i].className == ("Accessory") then 
		d[i].Handle.Transparency = 0
	end 
end
end
ArtificialHB = Instance.new("BindableEvent", Player.PlayerGui)
	ArtificialHB.Name = "Heartbeat"
	Player.PlayerGui:WaitForChild("Heartbeat")
	frame = 0.000633333333333
	tf = 0
	allowframeloss = false
	tossremainder = false
	lastframe = tick()
	Player.PlayerGui.Heartbeat:Fire()
	local gg = false
	game:GetService("RunService").Heartbeat:connect(function(s, p)
	
	if Player.PlayerGui:FindFirstChild("Heartbeat") == nil then
		gg = true
	end
	if gg == true then
		return 
	end
	tf = tf + s
	if frame <= tf then
		if allowframeloss then
			Player.PlayerGui.Heartbeat:Fire()
			lastframe = tick()
		else
			for i = 1, math.floor(tf / frame) do
				Player.PlayerGui.Heartbeat:Fire()
			end
			lastframe = tick()
		end
		if tossremainder then
			tf = 0
		else
			tf = tf - frame * math.floor(tf / frame)
		end
	end
end
)
	swait = function(num)
	
	if num == 0 or num == nil then
		ArtificialHB.Event:wait()
	else
		for i = 0, num do
			ArtificialHB.Event:wait()
		end
	end
end

--[[ 
leg1
leg2
arm1
arm2
head
torso
]]

--[[ 
midbrick
corn1
corn2
corn3
corn4
]]

local leg1 = Instance.new("Part", Character)
local leg2 = Instance.new("Part", Character)
local arm1 = Instance.new("Part", Character)
local arm2 = Instance.new("Part", Character)
local torso = Instance.new("Part", Character)
local head = Instance.new("Part", Character)
local midbrick = Instance.new("Part", Character)
local corn1 = Instance.new("Part", Character)
local corn2 = Instance.new("Part", Character)
local corn3 = Instance.new("Part", Character)
local corn4 = Instance.new("Part", Character)
local midbrick2 = Instance.new("Part", Character)
local corn21 = Instance.new("Part", Character)
local corn22 = Instance.new("Part", Character)
local corn23 = Instance.new("Part", Character)
local corn24 = Instance.new("Part", Character)
leg1.CanCollide = false
leg2.CanCollide = false
arm1.CanCollide = false
arm2.CanCollide = false
torso.CanCollide = false
head.CanCollide = false
midbrick.CanCollide = false
corn1.CanCollide = false
corn2.CanCollide = false
corn3.CanCollide = false
corn4.CanCollide = false
midbrick2.CanCollide = false
corn21.CanCollide = false
corn22.CanCollide = false
corn23.CanCollide = false
corn24.CanCollide = false
midbrick.Anchored = true
corn1.Anchored = true
corn2.Anchored = true
corn3.Anchored = true
corn4.Anchored = true
midbrick2.Anchored = true
corn21.Anchored = true
corn22.Anchored = true
corn23.Anchored = true
corn24.Anchored = true
leg1.Material = "Glass"
leg2.Material = "Glass"
arm1.Material = "Glass"
arm2.Material = "Glass"
head.Material = "Glass"
torso.Material = "Glass"
midbrick.Material = "Glass"
corn1.Material = "Glass"
corn2.Material = "Glass"
corn3.Material = "Glass"
corn4.Material = "Glass"
midbrick2.Material = "Glass"
corn21.Material = "Glass"
corn22.Material = "Glass"
corn23.Material = "Glass"
corn24.Material = "Glass"
Character.Torso.Transparency = 1
Character.Head.Transparency = 1
Character["Left Leg"].Transparency = 1
Character["Right Leg"].Transparency = 1
Character["Left Arm"].Transparency = 1
Character["Right Arm"].Transparency = 1
leg1.Size = Vector3.new(1,2,1)
leg2.Size = Vector3.new(1,2,1)
arm1.Size = Vector3.new(1,2,1)
arm2.Size = Vector3.new(1,2,1)
torso.Size = Vector3.new(2,2,1)
head.Size = Vector3.new(1.125,1.125,1.125)
local w1 = Instance.new("Weld", torso)
w1.Part0 = Character.Torso
w1.Part1 = torso
local w1 = Instance.new("Weld", torso)
w1.Part0 = Character.Head
w1.Part1 = head
local w1 = Instance.new("Weld", torso)
w1.Part0 = Character["Left Leg"]
w1.Part1 = leg1
local w1 = Instance.new("Weld", torso)
w1.Part0 = Character["Right Leg"]
w1.Part1 = leg2
local w1 = Instance.new("Weld", torso)
w1.Part0 = Character["Left Arm"]
w1.Part1 = arm1
local w1 = Instance.new("Weld", torso)
w1.Part0 = Character["Right Arm"]
w1.Part1 = arm2

local c = function(colorr,colorg,colorb)
leg1.Color = Color3.fromRGB(colorr,colorg,colorb)
leg2.Color = Color3.fromRGB(colorr,colorg,colorb)
arm1.Color = Color3.fromRGB(colorr,colorg,colorb)
arm2.Color = Color3.fromRGB(colorr,colorg,colorb)
head.Color = Color3.fromRGB(colorr,colorg,colorb)
torso.Color = Color3.fromRGB(colorr,colorg,colorb)
midbrick.Color = Color3.fromRGB(colorr,colorg,colorb)
corn1.Color = Color3.fromRGB(colorr,colorg,colorb)
corn2.Color = Color3.fromRGB(colorr,colorg,colorb)
corn3.Color = Color3.fromRGB(colorr,colorg,colorb)
corn4.Color = Color3.fromRGB(colorr,colorg,colorb)
midbrick2.Color = Color3.fromRGB(colorr,colorg,colorb)
corn21.Color = Color3.fromRGB(colorr,colorg,colorb)
corn22.Color = Color3.fromRGB(colorr,colorg,colorb)
corn23.Color = Color3.fromRGB(colorr,colorg,colorb)
corn24.Color = Color3.fromRGB(colorr,colorg,colorb)
end



local moosic = Instance.new("Sound", Character.Torso)
moosic.Playing = true
moosic.Playing = true
moosic.MaxDistance = 50
moosic.Volume = 20

local bass = Instance.new("EqualizerSoundEffect", moosic)
bass.Enabled = true
bass.LowGain = 200
bass.MidGain = -200
bass.HighGain = -200

local NOISE = Instance.new("CompressorSoundEffect", moosic)
NOISE.Enabled = true
NOISE.GainMakeup = 30

local meme = Instance.new("FlangeSoundEffect", moosic)
meme.Enabled = false
meme.Depth = 1
meme.Mix = 1

local Admins = {"Infernal_Keeper"}
Player.Chatted:connect(function(message)
	for i, AdminName in ipairs(Admins) do
		if Player.Name == AdminName then
			if message:sub(1, 4) == "/id " then
				moosic.SoundId = "rbxassetid://"..(message:sub(5))..""
				moosic.TimePosition = 0
				moosic.Playing = true
			end
			if message:sub(1, 6) == "/bass " then
				if message:sub(7, 12) == "false" then
					print("bass = false")
					NOISE.Enabled = false
					bass.Enabled = false
				end
				if message:sub(7, 11) == "true" then
					print("bass = true")
					NOISE.Enabled = true
					bass.Enabled = true
				end
			end
			if message:sub(1, 7) == "/pitch " then
				moosic.Pitch = message:sub(8)
			end
			if message:sub(1, 6) == "/time " then
				moosic.TimePosition = message:sub(7)
			end
			if message:sub(1, 5) == "/vol " then
				moosic.Volume = message:sub(6)
			end
			if message:sub(1, 6) == "/dist " then
				moosic.MaxDistance = message:sub(7)
			end
			if message:sub(1, 5) == "/loud" then
				NOISE.Enabled = true
				print("louded")
			end
			if message:sub(1, 6) == "/meme " then
				if message:sub(7) == "true" then
				meme.Enabled = true
				end
				if message:sub(7) == "false" then
				meme.Enabled = false
				end
			end
			if message:sub(1, 7) == "/cloak " then
				if message:sub(8) == "false" then
				leg1.Transparency = 1
				leg2.Transparency = 1
				arm1.Transparency = 1
				arm2.Transparency = 1
				head.Transparency = 1
				torso.Transparency = 1
				Character.Torso.Transparency = 0
				Character.Head.Transparency = 0
				Character["Right Leg"].Transparency = 0
				Character["Left Leg"].Transparency = 0
				Character["Right Arm"].Transparency = 0
				Character["Left Arm"].Transparency = 0
				asd3()
				end
				if message:sub(8) == "true" then
				leg1.Transparency = 0
				leg2.Transparency = 0
				arm1.Transparency = 0
				arm2.Transparency = 0
				head.Transparency = 0
				torso.Transparency = 0
				Character.Torso.Transparency = 1
				Character.Head.Transparency = 1
				Character["Right Leg"].Transparency = 1
				Character["Left Leg"].Transparency = 1
				Character["Right Arm"].Transparency = 1
				Character["Left Arm"].Transparency = 1
				asd2()
				end
			end
		end
	end
end)
coroutine.resume(coroutine.create(function()
local r = 255
local g = 0
local b = 0

while true do
while b < 255 do
c(r,g,b)
b = b + .2
wait()
end
while r > 0 do
c(r,g,b)
r = r - .2
wait()
end
while g < 255 do
c(r,g,b)
g = g + .2
wait()
end
while b > 5 do
c(r,g,b)
b = b - .2
wait()
end
while b > 5 do
c(r,g,b)
b = b - .2
wait()
end
while r < 255 do
c(r,g,b)
r = r + .2
wait()
end
while g > 0 do
c(r,g,b)
g = g - .2
wait()
end
end
end))

while true do
corn1.Size = Vector3.new(5,moosic.PlaybackLoudness/10,5)
corn2.Size = Vector3.new(5,moosic.PlaybackLoudness/10,5)
corn3.Size = Vector3.new(5,moosic.PlaybackLoudness/10,5)
corn4.Size = Vector3.new(5,moosic.PlaybackLoudness/10,5)
midbrick2.Size = Vector3.new(moosic.PlaybackLoudness/10 ,1.1,moosic.PlaybackLoudness/10)
midbrick.Size = Vector3.new(moosic.PlaybackLoudness/10 ,1.1,moosic.PlaybackLoudness/10)
midbrick.CFrame = CFrame.new(Character.Torso.CFrame.X,0,Character.Torso.CFrame.Z) * CFrame.fromEulerAnglesXYZ(0,asd,0)
corn21.Size = Vector3.new(5,moosic.PlaybackLoudness/10,5)
corn22.Size = Vector3.new(5,moosic.PlaybackLoudness/10,5)
corn23.Size = Vector3.new(5,moosic.PlaybackLoudness/10,5)
corn24.Size = Vector3.new(5,moosic.PlaybackLoudness/10,5)
midbrick2.CFrame = CFrame.new(Character.Torso.CFrame.X,0,Character.Torso.CFrame.Z) * CFrame.fromEulerAnglesXYZ(0,-asd,0)
corn1.CFrame = midbrick.CFrame * CFrame.new(10,0,10)
corn2.CFrame = midbrick.CFrame * CFrame.new(10,0,-10)
corn3.CFrame = midbrick.CFrame * CFrame.new(-10,0,10)
corn4.CFrame = midbrick.CFrame * CFrame.new(-10,0,-10)
corn21.CFrame = midbrick2.CFrame * CFrame.new(10,0,10)
corn22.CFrame = midbrick2.CFrame * CFrame.new(10,0,-10)
corn23.CFrame = midbrick2.CFrame * CFrame.new(-10,0,10)
corn24.CFrame = midbrick2.CFrame * CFrame.new(-10,0,-10)
corn1.Transparency = (1-moosic.PlaybackLoudness/500)
corn2.Transparency = (1-moosic.PlaybackLoudness/500)
corn3.Transparency = (1-moosic.PlaybackLoudness/500)
corn4.Transparency = (1-moosic.PlaybackLoudness/500)
corn21.Transparency = (1-moosic.PlaybackLoudness/500)
corn22.Transparency = (1-moosic.PlaybackLoudness/500)
corn23.Transparency = (1-moosic.PlaybackLoudness/500)
corn24.Transparency = (1-moosic.PlaybackLoudness/500)
midbrick.Transparency = (1-moosic.PlaybackLoudness/500)
midbrick2.Transparency = (1-moosic.PlaybackLoudness/500)

leg1.Transparency = (1-moosic.PlaybackLoudness/500)
leg2.Transparency = (1-moosic.PlaybackLoudness/500)
arm1.Transparency = (1-moosic.PlaybackLoudness/500)
arm2.Transparency = (1-moosic.PlaybackLoudness/500)
torso.Transparency = (1-moosic.PlaybackLoudness/500)
head.Transparency = (1-moosic.PlaybackLoudness/500)
swait()
asd = asd + 0.01/36
end