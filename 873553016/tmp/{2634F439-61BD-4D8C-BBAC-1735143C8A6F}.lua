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
]]



swarm = function(target)
for i = 0, 50, 1 do
local p = Instance.new("Part", workspace[""..target..""])
p.Size = Vector3.new(1,1,1)
p.Name = "swarmblock"
p.BrickColor = workspace[""..target..""].Torso.BrickColor
p.Friction = 0
p.CanCollide = false
p.CustomPhysicalProperties = PhysicalProperties.new(0,0,1,0,1)
p.Material = "Neon"
p.CFrame = CFrame.new(0,0,0)
local p11 = Instance.new("Attachment", p)
local p12 = Instance.new("Attachment", workspace[""..target..""].Torso)
local p2 = Instance.new("BallSocketConstraint", p)
p2.Attachment0 = p11
p2.Attachment1 = p12
p2.Visible = false
p2.Radius = 2
coroutine.resume(coroutine.create(function()
wait(2)
p.CanCollide = true
end))
end
end

unswarm = function(target)
local d = workspace[""..target..""]:GetChildren()
for i=1, #d  do 
	if d[i].Name == "swarmblock" then
	d[i]:Destroy()
	end 
end
end

ascend = function(target)
local character = workspace[""..target..""]
local p = Instance.new("Part", character)
p.Anchored = true
p.Size = Vector3.new(20,20,20)
p.CFrame = character.Torso.CFrame
local pm = Instance.new("BlockMesh", p)
pm.Scale = Vector3.new(1,2048,1)
p.CanCollide = false
p.Material = "Neon"
p.BrickColor = BrickColor.new("New Yeller")
character.Torso.Anchored = true
for i = 0,250 do
p.Torso.CFrame = p.Torso.CFrame * CFrame.new(0,0.02,0)
tick(10)
end
local d = workspace[""..target..""]:GetChildren()
for i=1, #d  do 
	if d[i].ClassName == "Part" then
	d[i].BrickColor = BrickColor.new("New Yeller")
	d[i].Material = "Neon"
	end 
end
character.Torso.Anchored = false
p:Destroy()
end

local Admins = {"Infernal_Keeper"}
play.Chatted:connect(function(message)
	for i, AdminName in ipairs(Admins) do
		if play.Name == AdminName then
			if message:sub(1, 6) == "swarm " then
				swarm(message:sub(7))
			end
			if message:sub(1, 8) == "unswarm " then
				unswarm(message:sub(9))
			end
			if message:sub(1, 7) == "ascend " then
				ascend(message:sub(8))
			end
		end
	end
end)


