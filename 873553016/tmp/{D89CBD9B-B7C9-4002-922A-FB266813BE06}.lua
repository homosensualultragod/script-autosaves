local play = game.Players.LocalPlayer
local char = play.Character
local LeftArm = char["Left Arm"]
local RightArm = char["Right Arm"]
local LeftLeg = char["Left Leg"]
local RightLeg = char["Right Leg"]
--[[
coroutine.resume(coroutine.create(function()
.Touched:connect(function(hit)
game:service'RunService'.RenderStepped:connect(function() 

end)
game:GetService("Debris"):AddItem(p, 1)
local d = char:GetChildren()
for i=1, #d  do 
	d[i]
	end 
end
]]
local model = Instance.new("Model", char)
model.Name = "weapon parts go here!"


local nolagplease = Instance.new("Model", char)
nolagplease.Name = "block spam goes here"

block = function(cfram,size,expansize,transp,color,kind)
local p = Instance.new("Part", nolagplease)
p.CFrame = cfram
p.Size = size
p.Anchored = true
p.Material = "Neon"
p.CanCollide = false
p.BrickColor = color
coroutine.resume(coroutine.create(function()
while p.Transparency < 1 do
p.Transparency = p.Transparency + transp
p.Size = p.Size + expansize
if kind == 1 then
p.CFrame = p.CFrame * CFrame.fromEulerAnglesXYZ(math.rad(math.random(0,180)),math.rad(math.random(0,180)),math.rad(math.random(0,180)))
end
wait()
end
p:Destroy()
end))
end

part = function(size,color,transp,mat,weldpart,c0,nam)
local q = Instance.new("Part", model)
q.Size = size
q.Transparency = transp
q.BrickColor = color
q.Material = mat
q.CanCollide = false
q.Name = nam
local qw = Instance.new("Weld", q)
qw.Part0 = weldpart
qw.Part1 = q
qw.C0 = c0
end
magnitude = function(pos,dam)
for _,c in pairs(workspace:children()) do
	local hum = c:findFirstChild("Humanoid")
	if hum ~= nil then
		local head = c:findFirstChild("Torso")
		if head ~= nil then
			local targ = head.Position - pos
			local mag = targ.magnitude
			if mag <= 10 and c.Name ~= play.Name then
				hum.Health = hum.Health - dam
				char.Humanoid.Health = char.Humanoid.Health + dam
			end
		end
	end
end
end

local explos = function(mos,siz,dam,tim,dist)
local k = Instance.new("Part", nolagplease)
local enabled = true
k.Shape = "Cylinder"
k.Orientation = Vector3.new(0,0,-90)
k.Anchored = true
k.Size = Vector3.new(.1,siz,siz)
k.Position = Vector3.new(mos.X,0,mos.Z)+Vector3.new(math.random(-dist,dist),0,math.random(-dist,dist))
k.Transparency = 0.5
k.Material = "Glass"
k.CanCollide = false
k.BrickColor = BrickColor.new("Really red")
local k2 = Instance.new("Part", nolagplease)
k2.Shape = "Cylinder"
k2.Orientation = Vector3.new(0,0,-90)
k2.Anchored = true
k2.Size = Vector3.new(.15,siz,siz)
k2.Position = Vector3.new(mos.X,0,mos.Z)+Vector3.new(math.random(-dist,dist),0,math.random(-dist,dist))
k2.Transparency = 0
k2.Material = "Glass"
k2.CanCollide = false
k2.BrickColor = BrickColor.new("Really red")
coroutine.resume(coroutine.create(function()
while k2.Size.Z >= 0.1 do
k2.Size = k2.Size + Vector3.new(0,0,-tim/100)
k2.CFrame = k.CFrame
wait()
end
local w = Instance.new("Part", nolagplease)
w.Anchored = true
w.CanCollide = false
w.Shape = "Cylinder"
w.Size = Vector3.new(250,siz,siz)
w.CFrame = k.CFrame
k2:Destroy()
k:Destroy()
w.Material = "Neon"
w.BrickColor = BrickColor.new("Really red")
magnitude(w.Position,dam)
wait(0.2)
w:Destroy()
end))
end

local explosions = function(siz,dam,tim,am,dist)
local mos = game.Players.LocalPlayer:GetMouse().Hit.p
for i = 0,am do
coroutine.resume(coroutine.create(function()
explos(game.Players.LocalPlayer:GetMouse().Hit.p,siz,dam,tim,dist)
end))
end
end

play:GetMouse().KeyDown:connect(function(k)
	
	k = k:lower()
	if k == "z" then
		explosions(15,15,15,15,50)
	end
	if k == "x" then
		explosions(4,.5,5,30,15)
	end
	if k == "c" then
		explosions(10,10,10,1,0)
	end
	if k == "v" then
		explosions(math.random(1,100),math.random(1,100),math.random(1,100),math.random(1,100),math.random(1,100))
	end
end)