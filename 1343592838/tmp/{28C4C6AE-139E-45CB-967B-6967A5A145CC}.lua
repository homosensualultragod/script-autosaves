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
local NeckCF = CFrame.new(0, 1, 0, -1, 0, 0, 0, 0, 1, 0, 1, 0)
	char.Humanoid.Animator:Destroy()
	char.Animate:Destroy()
	local RootCF = CFrame.fromEulerAnglesXYZ(-1.57, 0, 3.14)
	local RHCF = CFrame.fromEulerAnglesXYZ(0, 1.6, 0)
	local LHCF = (CFrame.fromEulerAnglesXYZ(0, -1.6, 0))
	RSH = nil
	RW = Instance.new("Weld")
	LW = Instance.new("Weld")
	RH = char.Torso["Right Hip"]
	LH = char.Torso["Left Hip"]
	RSH = char.Torso["Right Shoulder"]
	LSH = char.Torso["Left Shoulder"]
	RSH.Parent = nil
	LSH.Parent = nil
	RW.Name = "RW"
	RW.Part0 = char.Torso
	RW.C0 = CFrame.new(1.5, 0.5, 0)
	RW.C1 = CFrame.new(0, 0.5, 0)
	RW.Part1 = RightArm
	RW.Parent = char.Torso
	LW.Name = "LW"
	LW.Part0 = char.Torso
	LW.C0 = CFrame.new(-1.5, 0.5, 0)
	LW.C1 = CFrame.new(0, 0.5, 0)
	LW.Part1 = LeftArm
	LW.Parent = char.Torso
	
clerp = function(a, b, t)
	return a:lerp(b, t)
end

local fakechar = Instance.new("Model",char.Torso)
local dontusethis = Instance.new("Humanoid", fakechar)
local partt = Instance.new("Part", fakechar)
partt.Name = "Head"
partt.Size = Vector3.new(2,1,1)
local partt = Instance.new("Part", fakechar)
partt.Name = "Torso"
partt.Size = Vector3.new(2,2,1)
local partt = Instance.new("Part", fakechar)
partt.Name = "Left Arm"
partt.Size = Vector3.new(1,2,1)
local partt = Instance.new("Part", fakechar)
partt.Name = "Right Arm"
partt.Size = Vector3.new(1,2,1)
local partt = Instance.new("Part", fakechar)
partt.Name = "Left Leg"
partt.Size = Vector3.new(1,2,1)
local partt = Instance.new("Part", fakechar)
partt.Name = "Right Leg"
partt.Size = Vector3.new(1,2,1)


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

rayCast = function(Position, Direction, Range, Ignore)
	
	return game:service("Workspace"):FindPartOnRay(Ray.new(Position, Direction.unit * (Range or 999.999)), Ignore)
end

Laser = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
	
	local laza = Instance.new("Part", nolagplease)	
	laza.CanCollide = false
	if golden == false then
	laza.BrickColor = brickcolor
	end
	if golden == true then
	laza.BrickColor = BrickColor.new("New Yeller")
	end
	laza.Size = Vector3.new(0.5,0.5,0.5)
	laza.Anchored = true
	laza.CFrame = cframe
	laza.Material = "Neon"
	local msh = Instance.new("CylinderMesh",laza)
	msh.Scale = Vector3.new(x1,y1,z1)
	game:GetService("Debris"):AddItem(laza, 10)
	coroutine.resume(coroutine.create(function(Part, Mesh)
		
		for i = 0, 1, delay do
			wait()
			Part.Transparency = i
			Mesh.Scale = Mesh.Scale + Vector3.new(x3, y3, z3)
		end
		Part.Parent = nil
	end
	), laza, msh)
end


shoottrail = function(mouse, partt, SpreadAmount, multiply)
	
	local SpreadVectors = Vector3.new(math.random(-SpreadAmount, SpreadAmount), math.random(-SpreadAmount, SpreadAmount), math.random(-SpreadAmount, SpreadAmount))
	local MainPos = partt.Position
	local MainPos2 = Vector3.new()
	if mouse == play:GetMouse() then
	MainPos2 = mouse.Hit.p + SpreadVectors
	else
		MainPos2 = mouse.Position
	end
	local MouseLook = CFrame.new((MainPos + MainPos2) / 2, MainPos2)
	local speed = 5
	if rage == true then
		speed = speed * 2
	end
	local num = 10
	local charge2 = charge
	charge = 1
	coroutine.resume(coroutine.create(function()
		
		repeat
			wait()
			local hit, pos = rayCast(MainPos, MouseLook.lookVector, speed, char.HumanoidRootPart.Parent)
			local mag = (MainPos - pos).magnitude
			Laser(char.Torso.BrickColor, CFrame.new((MainPos + pos) / 2, pos) * CFrame.Angles(1.57, 0, 0), 3, mag *(-speed / (speed / 2)), 3, 0, 0, 0, 1)
			MainPos = MainPos + MouseLook.lookVector * speed
			num = num - 1
			--MouseLook = MouseLook * CFrame.Angles(-.01,0, 0)
			if hit ~= nil then
				num = 0
				
				local refpart = Instance.new("Part", nolagplease)
				refpart.Transparency = 1
				refpart.CanCollide = false
				refpart.Anchored = true
				refpart.CFrame = CFrame.new(pos)
				game:GetService("Debris"):AddItem(refpart, 2)
			end
			do
				if num <= 0 then
					local refpart = Instance.new("Part", nolagplease)
					refpart.Transparency = 1
					refpart.CanCollide = false
					refpart.Anchored = true
					refpart.CFrame = CFrame.new(pos)
					block(CFrame.new((MainPos + pos) / 2, pos),Vector3.new(1*charge2,1*charge2,1*charge2),Vector3.new(.5*charge2,.5*charge2,.5*charge2),.05,char.Torso.BrickColor,1)
					magn(10,refpart,2)
					--CreateSound("http://www.roblox.com/asset/?id=10209590",refpart,1,1)
					game:GetService("Debris"):AddItem(refpart, 0.1)
				end
			end
		until num <= 0
	end
))
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

--part(1,1,Vector3.new(1,1,1),"Block",0,0,0,0,1,LeftArm)

part = function(wel,cancollid,size,shape,r,g,b,transp,mat,weldpart,c0,nam)
local mat2 = "wow"
if mat == 1 then
		mat2 = "Marble"
	end
	if mat == 2 then
		mat2 = "Granite"
	end
	if mat == 3 then
		mat2 = "Metal"
	end
	if mat == 4 then
		mat2 = "SmoothPlastic"
	end
	if mat == 5 then
		mat2 = "Wood"
	end
	if mat == 6 then
		mat2 = "Neon"
	end
if shape ~= "Wedge" then
local q = Instance.new("Part", weapon)
q.CustomPhysicalProperties = PhysicalProperties.new(0,0,0,0,0)
q.Shape = shape
q.Size = size
q.Transparency = transp
q.Color = Color3.new(r,g,b)
q.Material = mat2
if r == 1 and g == 0 and b == 0 then
	q.BrickColor = char.Torso.BrickColor
end
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
q.Color = Color3.new(r,g,b)
if r == 1 and g == 0 and b == 0 then
	q.BrickColor = char.Torso.BrickColor
end
q.Material = mat2
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


attack1 = function()
	attack = true
	for i = 0, 1, 0.1 do
		wait()
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, .4 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(0)), 0.5)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-10)), 0.3)
	end
	while charging == true do
		wait()
		charge = charge + 0.05
		block(weapon.righthit.CFrame,Vector3.new(charge/5,charge/5,charge/5),Vector3.new(charge/20,charge/20,charge/20),0.15,char.Torso.BrickColor,1)
		if charge >= 2.5 then
			charge = 2.5
			charging = false
		end
	end
	shoottrail(play:GetMouse(), weapon.righthit, 0, 1)
	attack = false
end


play:GetMouse().Button1Down:connect(function()
	if attack == false then
		if combo == 1 and attack == false then
		
		end
	end
end)

play:GetMouse().Button1Up:connect(function()
	if charging == true then
		charging = false
	end
end)

play:GetMouse().KeyDown:connect(function(k)
	
	k = k:lower()
	if k == "z" then
		
	elseif k == "q" and attack == false then
		
	end
end)

local keke = 0

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
							--weapon.Handle.Weld.C0 = clerp(weapon.Handle.Weld.C0, CFrame.new(.15, -1, 0) * CFrame.Angles(math.rad(-90), math.rad(0), math.rad(0)), 0.3)
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
								--weapon.Handle.Weld.C0 = clerp(weapon.Handle.Weld.C0, CFrame.new(.15, -1, 0) * CFrame.Angles(math.rad(-90), math.rad(0), math.rad(0)), 0.3)
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
end