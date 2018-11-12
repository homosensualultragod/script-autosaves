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

local snow = function()
	local p = Instance.new("Part", char)
	local hit = false
	p.Transparency = 1
	p.Size = Vector3.new(.5,3,.5)
	p.CanCollide = false
	p.CFrame = CFrame.new(math.random(-50,50),500,math.random(-50,50))
	p.BrickColor = BrickColor.random()
	p.Material = "Neon"
	while p.CFrame.Y >= 1 and p.Transparency > 0.01 do
	p.Transparency = p.Transparency - 0.1
	wait()
	end
			p.Anchored = true
			p.Shape = "Cylinder"
			p.Size = Vector3.new(1,5,5)
			p.CFrame = CFrame.new(p.CFrame.X,2.1,p.CFrame.Z) * CFrame.fromEulerAnglesXYZ(0,0,math.rad(90))
			coroutine.resume(coroutine.create(function()
				while p.Transparency < 1 do
				p.Transparency = p.Transparency + 0.03
				p.Size = p.Size + Vector3.new(0,.3,.3)
				wait()
			end
		p:Destroy()
		end))
	
end

play:GetMouse().KeyDown:connect(function(k)
	
	k = k:lower()
	if k == "z" then
	
	end
end)

game:service'RunService'.RenderStepped:connect(function() 
snow()
end)




