local play = game.Players.LocalPlayer
local char = play.Character
local LeftArm = char["Left Arm"]
local RightArm = char["Right Arm"]
local LeftLeg = char["Left Leg"]
local RightLeg = char["Right Leg"]
local spawned = false
local debounce = false
local asdrot = 0
local bouncing = false
local mode = "Combo"
local mana = 200
local change = 0
local rage = false
local explosion = false
local golden = false
local equipped = true
local equipcheck = true
local charge = 1
local sped = 1
local riding = false
local sine = 0
local torsovel = 0
local sit = false
local charging = false
local combo = 1
local Anim = "wot"
local attack = false

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

CreateSound = function(id, par, vol, pit)
	
	coroutine.resume(coroutine.create(function()
		
		local sou = Instance.new("Sound", par)
		sou.Volume = vol
		sou.Pitch = pit
		sou.SoundId = id
		wait()
		sou:play()
		game:GetService("Debris"):AddItem(sou, 6)
	end
))
end

local model = Instance.new("Model", char)
model.Name = "weapon parts go here!"
local weapon = Instance.new("Model", model)
weapon.Name = "weapon"

local nolagplease = Instance.new("Model", char)
nolagplease.Name = "block spam goes here"

block = function(cfram,size,expansize,transp,color,kind)
local p = Instance.new("Part", nolagplease)
p.CFrame = cfram
p.Size = Vector3.new(1,1,1)
local pm = Instance.new("BlockMesh", p)
pm.Scale = size
p.Anchored = true
p.Material = "Neon"
p.CanCollide = false
p.BrickColor = color
coroutine.resume(coroutine.create(function()
while p.Transparency < 1 do
p.Transparency = p.Transparency + transp
pm.Scale = pm.Scale + expansize
if kind == 1 then
p.CFrame = p.CFrame * CFrame.fromEulerAnglesXYZ(math.rad(math.random(0,180)),math.rad(math.random(0,180)),math.rad(math.random(0,180)))
end
if kind == 3 then
p.CFrame = p.CFrame * CFrame.fromEulerAnglesXYZ(math.rad(math.random(0,180)),math.rad(math.random(0,180)),math.rad(math.random(0,180)))
end
wait()
end
p:Destroy()
if kind == 3 then
char.Torso.Anchored = false
char.Head.Anchored = false
attack = false
end
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


part = function(wel,cancollid,size,shape,color,transp,mat,weldpart,c0,nam)
if shape ~= "Wedge" then
local q = Instance.new("Part", weapon)
q.CustomPhysicalProperties = PhysicalProperties.new(0,0,0,0,0)
q.Shape = shape
q.Size = size
q.Transparency = transp
q.BrickColor = color
q.Material = mat
q.FrontSurface = "Smooth"
q.BackSurface = "Smooth"
q.LeftSurface = "Smooth"
q.RightSurface = "Smooth"
q.BottomSurface = "Smooth"
q.TopSurface = "Smooth"
if cancollid == 1 then
q.CanCollide = false
end
q.Name = nam
if wel == 1 then
local qw = Instance.new("Weld", q)
qw.Part0 = weldpart
qw.Part1 = q
qw.C0 = c0
end
end
if shape == "Wedge" then
local q = Instance.new("WedgePart", weapon)
q.Size = size
q.Transparency = transp
q.BrickColor = color
q.Material = mat
if cancollid == 1 then
q.CanCollide = false
end
q.Name = nam
local qw = Instance.new("Weld", q)
qw.Part0 = weldpart
qw.Part1 = q
qw.C0 = c0
end
end

char.Torso.Transparency = 1
RightArm.Transparency = 1
LeftArm.Transparency = 1
RightLeg.Transparency = 1
LeftLeg.Transparency = 1

part(1,1,Vector3.new(1.8,1.8,1),"Block",char.Torso.BrickColor,0,"SmoothPlastic",char.Torso,CFrame.new(0,0,0)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(1.8,2,.8),"Block",char.Torso.BrickColor,0,"SmoothPlastic",char.Torso,CFrame.new(0,0,0)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(2,1.8,.8),"Block",char.Torso.BrickColor,0,"SmoothPlastic",char.Torso,CFrame.new(0,0,0)*CFrame.fromOrientation(0,0,0),"Block")


wait(.01)
part(1,1,Vector3.new(.8,1.8,1),"Block",RightArm.BrickColor,0,"SmoothPlastic",RightArm,CFrame.new(0,0,0)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(.8,2,.8),"Block",RightArm.BrickColor,0,"SmoothPlastic",RightArm,CFrame.new(0,0,0)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(1,1.8,.8),"Block",RightArm.BrickColor,0,"SmoothPlastic",RightArm,CFrame.new(0,0,0)*CFrame.fromOrientation(0,0,0),"Block")

part(1,1,Vector3.new(.8,1.8,1),"Block",RightLeg.BrickColor,0,"SmoothPlastic",RightLeg,CFrame.new(0,0,0)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(.8,2,.8),"Block",RightLeg.BrickColor,0,"SmoothPlastic",RightLeg,CFrame.new(0,0,0)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(1,1.8,.8),"Block",RightLeg.BrickColor,0,"SmoothPlastic",RightLeg,CFrame.new(0,0,0)*CFrame.fromOrientation(0,0,0),"Block")

part(1,1,Vector3.new(.8,1.8,1),"Block",LeftLeg.BrickColor,0,"SmoothPlastic",LeftLeg,CFrame.new(0,0,0)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(.8,2,.8),"Block",LeftLeg.BrickColor,0,"SmoothPlastic",LeftLeg,CFrame.new(0,0,0)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(1,1.8,.8),"Block",LeftLeg.BrickColor,0,"SmoothPlastic",LeftLeg,CFrame.new(0,0,0)*CFrame.fromOrientation(0,0,0),"Block")

wait(0.1)
part(1,1,Vector3.new(.8,1.8,1),"Block",LeftArm.BrickColor,0,"SmoothPlastic",LeftArm,CFrame.new(0,0,0)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(.8,2,.8),"Block",LeftArm.BrickColor,0,"SmoothPlastic",LeftArm,CFrame.new(0,0,0)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(1,1.8,.8),"Block",LeftArm.BrickColor,0,"SmoothPlastic",LeftArm,CFrame.new(0,0,0)*CFrame.fromOrientation(0,0,0),"Block")


local keke = 0
--[[
coroutine.resume(coroutine.create(function()
while true do
keke = keke + 1
if keke > 10 then
	keke = 0
	char.Humanoid.Health = char.Humanoid.Health + 1
end
	if asdrot <= 360 then
		asdrot = asdrot + 2
		else
		asdrot = 0
	end
	if sit == true then
	mana = mana + .33
	end
	if riding == true and attack == false and debounce2 == false then
		coroutine.resume(coroutine.create(function()
		debounce2 = true
		magn(3,6,model.spinneblock,5)
		wait(0.2)
		debounce2 = false
		end))
	end
	sine = sine + change
	torsovel = (char.HumanoidRootPart.Velocity * Vector3.new(1, 0, 1)).magnitude
					if sit == false then
					if torsovel < 1 then
						Anim = "Idle"
							change = 1
							if attack == false and sit == false then
							char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
							char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
							RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(10)), 0.3)
							LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-10)), 0.3)
							end
							RH.C0 = clerp(RH.C0, CFrame.new(1, -1 + 0.1 * math.cos((sine) / 20), 0) * RHCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
							LH.C0 = clerp(LH.C0, CFrame.new(-1, -1 + 0.1 * math.cos((sine) / 20), 0.1) * LHCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)	
					elseif 2 < torsovel then
							Anim = "Walk"
								if attack == false and sit == false then
								char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
								char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
								RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(-10), math.rad(0), math.rad(10)), 0.3)
								LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(-10), math.rad(0), math.rad(-10)), 0.3)
								end
								RH.C0 = clerp(RH.C0, CFrame.new(1, -1 + 0.1 * math.cos((sine) / 20), 0) * RHCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0 - 50 * math.cos((sine) / 3))), 0.3)
								LH.C0 = clerp(LH.C0, CFrame.new(-1, -1 + 0.1 * math.cos((sine) / 20), 0.1) * LHCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0 - 50 * math.cos((sine) / 3))), 0.3)
					end
					end
wait()
end
end))

while true do
wait()
end]]