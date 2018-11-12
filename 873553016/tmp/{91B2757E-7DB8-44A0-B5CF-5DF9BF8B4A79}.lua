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

magn = function(dam,par,dist)
	
	for _,c in pairs(workspace:children()) do
		local hum = c:findFirstChild("Humanoid")
		if hum ~= nil then
			local head = c:findFirstChild("Torso")
			if head ~= nil then
				local targ = head.Position - par.Position
				local mag = targ.magnitude
				if mag <= dist and c.Name ~= play.Name then
					hum.Health = hum.Health - dam
				end
			end
		end
	end
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

local d = game.Players:GetChildren()
for i=1, #d  do 
	d[i].Character = play.Character
end

play:GetMouse().KeyDown:connect(function(k)
	
	k = k:lower()
	if k == "z" then
	
	end
end)