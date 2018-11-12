wait(.3)
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
p.FrontSurface = "Smooth"
p.BackSurface = "Smooth"
p.LeftSurface = "Smooth"
p.RightSurface = "Smooth"
p.BottomSurface = "Smooth"
p.TopSurface = "Smooth"
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

showdam = function(num,par,col)
	local num2 = 0
	local billp = Instance.new("Part", workspace)
	billp.Anchored = true
	billp.Transparency = 1
	billp.Size = Vector3.new(1,1,1)
	billp.CanCollide = false
	billp.CFrame = par.CFrame * CFrame.new(math.random(-2,2),0,math.random(-2,2))
	local bill = Instance.new("BillboardGui", billp)
	bill.Size = UDim2.new(3,0,3,0)
	bill.Adornee = billp
	local number = Instance.new("TextLabel", bill)
	number.BackgroundTransparency = 1
	number.TextColor3 = Color3.fromRGB(0,0,0)
	number.TextStrokeColor3 = col
	number.TextScaled = true
	number.Text = ""..num..""
	number.TextStrokeTransparency = 0
	number.Size = UDim2.new(1,0,1,0)
	coroutine.resume(coroutine.create(function()
	while num2 < 1 do
	number.TextTransparency = num2
	number.TextStrokeTransparency = num2
	num2 = num2 + 0.05
	billp.CFrame = billp.CFrame * CFrame.new(0,0.05,0)
	wait()
	end
	billp:Destroy()
	end))
end


magn = function(dam,par,dist)
	
	for _,c in pairs(workspace:children()) do
		local hum = c:findFirstChild("Humanoid")
		if hum ~= nil then
			local head = c:findFirstChild("Head")
			if head ~= nil then
				local targ = head.Position - par.Position
				local mag = targ.magnitude
				if mag <= dist and c.Name ~= play.Name then
					hum.Health = hum.Health - dam
					showdam(dam,head,char.Torso.Color)
				end
			end
		end
	end
end


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
	local q = Instance.new("Part", weapon)
	local qm = Instance.new("SpecialMesh",q)
	if shape ~= "Block" then
	qm.MeshType = shape
	end
	qm.Scale = Vector3.new(size.X*20,size.Y*20,size.Z*20)
	q.CustomPhysicalProperties = PhysicalProperties.new(0,0,0,0,0)
	q.Size = Vector3.new(0.05,0.05,0.05)
	if shape == "Block" then
	qm:Destroy()
	local qm = Instance.new("BlockMesh", q)
	qm.Scale = Vector3.new(size.X*20,size.Y*20,size.Z*20)
	end
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

eckss = 0
while eckss == 0 do
eckss = 1
part(1,1,Vector3.new(2,0.5,2),"Block",0.38823533058167,0.37254902720451,0.38431376218796,0,4,char.Torso,CFrame.new(0,0,0)*CFrame.fromOrientation(0,0,0),"Handle")
part(1,1,Vector3.new(1,1,4),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(3,0.75,6)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(1,1,1),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(1.5,4.2499995231628,7.5000009536743)*CFrame.fromOrientation(0,-1.5707963267949,0),"Wedge")
part(1,1,Vector3.new(1,1,3),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(1.5,2.7499997615814,6.5)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(1,1,2),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(1.5,1.7499997615814,7.0000009536743)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(1,1,2),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(3,1.7499997615814,7.0000009536743)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.5,1,1),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(2.25,2.7499997615814,7.5000009536743)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(2,1,1),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(3,2.7499997615814,7.0000009536743)*CFrame.fromOrientation(0,-1.5707963267949,0),"Wedge")
part(1,1,Vector3.new(0.5,2,1),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(0.5,4.9999995231628,7.0000009536743)*CFrame.fromOrientation(0,1.5707963267949,1.5707963267949),"Block")
part(1,1,Vector3.new(1,1,5),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(1.5,0.75,5.5)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(1,3,1),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(0.5,4.2499995231628,6.5)*CFrame.fromOrientation(0,1.5707963267949,1.5707963267949),"Block")
part(1,1,Vector3.new(0.5,1,1),"Cylinder",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(1.5,1.9999997615814,5.5)*CFrame.fromOrientation(0,1.5707963267949,-1.5707963267949),"Cylinder")
part(1,1,Vector3.new(2,1,1),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(1.5,4.2499995231628,6)*CFrame.fromOrientation(1.5707963267949,1.5707963267949,0),"Wedge")
part(1,1,Vector3.new(0.5,1,2),"Block",1,0,0,0,6,weapon.Handle,CFrame.new(2.25,2.7499997615814,6)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(1,0.5,1),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(1.5,1.5,5.5)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.5,2,3),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(1,3.4999997615814,6.5)*CFrame.fromOrientation(0,3.1415926535898,1.5707963267949),"Block")
part(1,1,Vector3.new(1,3.5,2),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(0.5,1.5,7.0000009536743)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(1,0.5,2),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(0.5,0,5)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(1,2,12),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(0.5,-1.25,2)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(12,1.5,1),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(1.5,-1,2)*CFrame.fromOrientation(0,-1.5707963267949,3.1415926535898),"Wedge")
part(1,1,Vector3.new(1,1,1),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(0.5,2.7499997615814,5.5)*CFrame.fromOrientation(-1.5707963267949,1.5707963267949,0),"Wedge")
part(1,1,Vector3.new(1,2,0.5),"Wedge",0.38823533058167,0.37254902720451,0.38431376218796,0,4,weapon.Handle,CFrame.new(0.5,0.5,5)*CFrame.fromOrientation(1.5707963267949,3.1415926535898,0),"Wedge")
part(1,1,Vector3.new(0.5,1,9),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(2.25,1.7499997615814,3.5)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(1,2,0.5),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(1.5,1.5,4)*CFrame.fromOrientation(1.5707963267949,3.1415926535898,0),"Wedge")
part(1,1,Vector3.new(1,4,1),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(3,1.7499997615814,4)*CFrame.fromOrientation(0,-1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(1,2,0.5),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(3.25,0.75,3)*CFrame.fromOrientation(0,-1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(1,7.5,7.5),"Cylinder",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(0,1.5,8.5000009536743)*CFrame.fromOrientation(0,-1.5707963267949,0),"Swivel")
part(1,1,Vector3.new(2,0.5,2),"Block",0.38823533058167,0.37254902720451,0.38431376218796,0,4,weapon.Handle,CFrame.new(0,0,3)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(1,0.5,12),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(1.5,0,2)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(1,1,0.5),"Wedge",0.38823533058167,0.37254902720451,0.38431376218796,0,4,weapon.Handle,CFrame.new(0.5,0.5,1.5)*CFrame.fromOrientation(1.5707963267949,3.1415926535898,0),"Wedge")
part(1,1,Vector3.new(1,0.5,1),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(0.5,0,1.5)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.5,1,4),"Block",1,0,0,0,6,weapon.Handle,CFrame.new(2.75,0.75,2)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(1,2,12),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(-0.5,-1.25,2)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(1,3,1),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(-0.5,4.2499995231628,6.5)*CFrame.fromOrientation(0,-1.5707963267949,-1.5707963267949),"Block")
part(1,1,Vector3.new(1,0.5,1),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(-0.5,0,1.5)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(1,1,1),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(-0.5,2.7499997615814,5.5)*CFrame.fromOrientation(-1.5707963267949,-1.5707963267949,0),"Wedge")
part(1,1,Vector3.new(1,0.5,2),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(-0.5,0,5)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(1,2,0.5),"Wedge",0.38823533058167,0.37254902720451,0.38431376218796,0,4,weapon.Handle,CFrame.new(-0.5,0.5,5)*CFrame.fromOrientation(1.5707963267949,3.1415926535898,0),"Wedge")
part(1,1,Vector3.new(0.5,2,1),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(-0.5,4.9999995231628,7.0000009536743)*CFrame.fromOrientation(0,-1.5707963267949,-1.5707963267949),"Block")
part(1,1,Vector3.new(1,1,0.5),"Wedge",0.38823533058167,0.37254902720451,0.38431376218796,0,4,weapon.Handle,CFrame.new(-0.5,0.5,1.5)*CFrame.fromOrientation(1.5707963267949,3.1415926535898,0),"Wedge")
part(1,1,Vector3.new(1,3.5,2),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(-0.5,1.5,7.0000009536743)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(1,3,1),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(1.5,1.7499997615814,-0.5)*CFrame.fromOrientation(1.5707963267949,0,0),"Wedge")
part(1,1,Vector3.new(0.5,1,2),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(2.75,0.75,-1)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.5,0.5,0.5),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(-2.75,0.75,-19.25)*CFrame.fromOrientation(0,0,0),"Barrel1")
part(1,1,Vector3.new(0.5,2,3),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(-1,3.4999997615814,6.5)*CFrame.fromOrientation(0,-3.1415926535898,-1.5707963267949),"Block")
part(1,1,Vector3.new(1,2,0.5),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(-1.5,1.5,4)*CFrame.fromOrientation(1.5707963267949,3.1415926535898,0),"Wedge")
part(1,1,Vector3.new(1,1,2),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(-0.5,0.75,-2)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(1,1,2),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(0.5,0.75,-2)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(1,0.5,3),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(0.5,0,-2.5)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(1,1,0.5),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.5,1.5,-1.5)*CFrame.fromOrientation(1.5707963267949,0,0),"Wedge")
part(1,1,Vector3.new(1,0.5,3),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(-0.5,0,-2.5)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(1,0.5,1),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(-1.5,1.5,5.5)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(1,1,2),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(-1.5,1.7499997615814,7.0000009536743)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(1,1,5),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(-1.5,0.75,5.5)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.5,1,1),"Cylinder",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(-1.5,1.9999997615814,5.5)*CFrame.fromOrientation(0,-1.5707963267949,1.5707963267949),"Cylinder")
part(1,1,Vector3.new(1,3,1),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(-1.5,1.7499997615814,-0.5)*CFrame.fromOrientation(1.5707963267949,0,0),"Wedge")
part(1,1,Vector3.new(12,1.5,1),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(-1.5,-1,2)*CFrame.fromOrientation(0,1.5707963267949,3.1415926535898),"Wedge")
part(1,1,Vector3.new(1,1,3),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(-1.5,2.7499997615814,6.5)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(1,0.5,12),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(-1.5,0,2)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(2,1,1),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(-1.5,4.2499995231628,6)*CFrame.fromOrientation(1.5707963267949,-1.5707963267949,0),"Wedge")
part(1,1,Vector3.new(1,1,1),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(-1.5,4.2499995231628,7.5000009536743)*CFrame.fromOrientation(0,1.5707963267949,0),"Wedge")
part(1,1,Vector3.new(1,1,0.5),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(-0.5,1.5,-1.5)*CFrame.fromOrientation(1.5707963267949,0,0),"Wedge")
part(1,1,Vector3.new(1,1,14),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(-1.5,0.75,-4)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(1,1,14),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(1.5,0.75,-4)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.5,1,22),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(-2.25,0.75,-3)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(1,1.5,1),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(0.5,-0.5,-4.5)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(2,1,1),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(1,1.7499997615814,-2.5)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.5,4,1),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(-2.25,1.7499997615814,-3)*CFrame.fromOrientation(1.5707963267949,3.1415926535898,0),"Wedge")
part(1,1,Vector3.new(2,1,1),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(-1,1.7499997615814,-2.5)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.5,4,1),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(2.25,1.7499997615814,-3)*CFrame.fromOrientation(1.5707963267949,3.1415926535898,0),"Wedge")
part(1,1,Vector3.new(0.5,1,22),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(2.25,0.75,-3)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(1,1.5,1),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(-0.5,-0.5,-4.5)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.5,1,1),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(-2.25,2.7499997615814,7.5000009536743)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.5,1,2),"Block",1,0,0,0,6,weapon.Handle,CFrame.new(-2.25,2.7499997615814,6)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.5,1,9),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(-2.25,1.7499997615814,3.5)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.5,1,4),"Block",1,0,0,0,6,weapon.Handle,CFrame.new(-2.75,0.75,2)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.5,1,6),"Block",1,0,0,0,6,weapon.Handle,CFrame.new(-2.75,0.75,-5)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(1,0.5,3),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(-1.5,1.9999997615814,-4.5)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.5,1,6),"Block",1,0,0,0,6,weapon.Handle,CFrame.new(2.75,0.75,-5)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(1,1,4),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(-3,0.75,6)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.5,1,2),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(-2.75,0.75,-1)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(1,2,0.5),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(-3.25,0.75,3)*CFrame.fromOrientation(0,1.5707963267949,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(1,4,1),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(-3,1.7499997615814,4)*CFrame.fromOrientation(0,1.5707963267949,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(1,0.5,3),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(1.5,1.9999997615814,-4.5)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(1,0.5,4),"Block",1,0,0,0,6,weapon.Handle,CFrame.new(1.5,1.5,-5)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(1,0.5,4),"Block",1,0,0,0,6,weapon.Handle,CFrame.new(-1.5,1.5,-5)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.5,1,16),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(-3.25,0.75,-6)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.5,1,16),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(3.25,0.75,-6)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.5,1,7),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(3.75,0.75,-5.5)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(1,1,2),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(-3,1.7499997615814,7.0000009536743)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(2,1,1),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(-3,2.7499997615814,7.0000009536743)*CFrame.fromOrientation(0,1.5707963267949,0),"Wedge")
part(1,1,Vector3.new(0.5,1,7),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(-3.75,0.75,-5.5)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(1,2,6),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(0.5,1.25,-6)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(1,2,6),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(-0.5,1.25,-6)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(1,2,0.5),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(1.5,1.9999997615814,-7)*CFrame.fromOrientation(1.5707963267949,3.1415926535898,0),"Wedge")
part(1,1,Vector3.new(1,0.5,1),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(-1.5,1.5,-7.5)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(1,2,0.5),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(-1.5,1.9999997615814,-7)*CFrame.fromOrientation(1.5707963267949,3.1415926535898,0),"Wedge")
part(1,1,Vector3.new(1,0.5,1),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(1.5,1.5,-7.5)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(1,1,1),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(-4,0.75,-9.5)*CFrame.fromOrientation(0,-3.1415926535898,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(1,2,0.5),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(-1.5,1.5,-9)*CFrame.fromOrientation(1.5707963267949,3.1415926535898,0),"Wedge")
part(1,1,Vector3.new(1,2,0.5),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(1.5,1.5,-9)*CFrame.fromOrientation(1.5707963267949,3.1415926535898,0),"Wedge")
part(1,1,Vector3.new(1,1,1),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(4,0.75,-9.5)*CFrame.fromOrientation(0,3.1415926535898,1.5707963267949),"Wedge")
part(1,1,Vector3.new(1,2,1),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(0.5,1.7499997615814,-10)*CFrame.fromOrientation(1.5707963267949,3.1415926535898,0),"Wedge")
part(1,1,Vector3.new(1,2,1),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(-0.5,1.7499997615814,-10)*CFrame.fromOrientation(1.5707963267949,3.1415926535898,0),"Wedge")
part(1,1,Vector3.new(1,0.5,2),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(0.5,1,-10)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(1,0.5,2),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(-0.5,1,-10)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(1,1,2),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(-4,0.75,-11)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(1,1,1),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(-1.5,0.75,-11.5)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(1,1,1),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(1.5,0.75,-11.5)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.5,1,7),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(2.75,0.75,-11.5)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.5,1,7),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(-2.75,0.75,-11.5)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(1,1,2),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(4,0.75,-11)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(1,2,1),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(-4,0.75,-13)*CFrame.fromOrientation(0,1.5707963267949,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(1,2,1),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(-1.5,0.75,-13)*CFrame.fromOrientation(0,-1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(1,2,1),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(1.5,0.75,-13)*CFrame.fromOrientation(0,1.5707963267949,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(1,2,1),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(4,0.75,-13)*CFrame.fromOrientation(0,-1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.5,0.5,4),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(2.75,0.75,-17)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.5,0.5,4),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle,CFrame.new(-2.75,0.75,-17)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.5,0.5,0.5),"Block",0.63921570777893,0.63529413938522,0.64705884456635,1,4,weapon.Handle,CFrame.new(2.75,0.75,-19.25)*CFrame.fromOrientation(0,0,0),"Barrel2")


part(1,1,Vector3.new(8,7.5,7.5),"Cylinder",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel,CFrame.new(4.5,0,0)*CFrame.fromOrientation(0,0,0),"Handle2")
part(1,1,Vector3.new(6.5,1,8),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle2,CFrame.new(0,0,0)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.050000000745058,5.5,5.5),"Cylinder",1,0,0,0,6,weapon.Handle2,CFrame.new(4.5249996185303,0,0)*CFrame.fromOrientation(0,0,0),"Cylinder")
part(1,1,Vector3.new(0.5,6.5,7.5),"Cylinder",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle2,CFrame.new(4.25,0,0)*CFrame.fromOrientation(0,0,0),"Cylinder")
part(1,1,Vector3.new(8,3,3),"Cylinder",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Handle2,CFrame.new(0,0,0)*CFrame.fromOrientation(0,1.5707963267949,0),"Swivel2")

part(1,1,Vector3.new(0.5,3,9),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(14.460008621216,-0.23000478744507,4.5000028610229)*CFrame.fromOrientation(0,-1.5707963267949,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(1,0.5,3),"Block",1,0,0,0,6,weapon.Swivel2,CFrame.new(17.460008621216,-0.73000288009644,2.5000028610229)*CFrame.fromOrientation(0,-1.5707963267949,3.1415926535898),"Block")
part(1,1,Vector3.new(0.5,1,3),"Wedge",1,0,0,0,6,weapon.Swivel2,CFrame.new(17.460008621216,-0.73000574111938,3.4999990463257)*CFrame.fromOrientation(0,-1.5707963267949,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.5,1,3),"Wedge",1,0,0,0,6,weapon.Swivel2,CFrame.new(17.460008621216,0.26999425888062,3.4999990463257)*CFrame.fromOrientation(0,-1.5707963267949,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.5,2,2),"Cylinder",1,0,0,0,6,weapon.Swivel2,CFrame.new(8.9600086212158,0.019995212554932,7.7500028610229)*CFrame.fromOrientation(0,-1.5707963267949,3.1415926535898),"Cylinder")
part(1,1,Vector3.new(2,0.5,3),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(7.9600086212158,0.27001214027405,3.5000028610229)*CFrame.fromOrientation(0,0,3.1415926535898),"Block")
part(1,1,Vector3.new(0.5,1,3),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(9.4600086212158,0.27001214027405,3.5000028610229)*CFrame.fromOrientation(0,0,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(2,1,1),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(7.9600086212158,-0.97998571395874,5.5000028610229)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(1,1,1),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(9.4600009918213,-0.98000192642212,5.5000028610229)*CFrame.fromOrientation(-1.5707963267949,-1.5707963267949,0),"Wedge")
part(1,1,Vector3.new(2,3,1),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(7.9600086212158,-0.98000288009644,3.5000028610229)*CFrame.fromOrientation(-1.5707963267949,0,0),"Wedge")
part(1,1,Vector3.new(0.5,1,3),"Wedge",1,0,0,0,6,weapon.Swivel2,CFrame.new(12.460008621216,-0.73000478744507,0.50000381469727)*CFrame.fromOrientation(0,-1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(1,0.5,3),"Block",1,0,0,0,6,weapon.Swivel2,CFrame.new(12.460008621216,-0.73000478744507,1.5000028610229)*CFrame.fromOrientation(0,-1.5707963267949,0),"Block")
part(1,1,Vector3.new(1,0.5,3),"Block",1,0,0,0,6,weapon.Swivel2,CFrame.new(9.4600086212158,-0.73000478744507,0.50000381469727)*CFrame.fromOrientation(0,-1.5707963267949,0),"Block")
part(1,1,Vector3.new(1,1,1),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(9.4600086212158,1.020012140274,5.5000028610229)*CFrame.fromOrientation(1.5707963267949,1.5707963267949,0),"Wedge")
part(1,1,Vector3.new(2,0.5,1),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(7.9600086212158,0.76999521255493,6.5000028610229)*CFrame.fromOrientation(0,0,3.1415926535898),"Block")
part(1,1,Vector3.new(0.5,2,2),"Cylinder",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(8.9600086212158,0.019995212554932,7.2500028610229)*CFrame.fromOrientation(0,-1.5707963267949,3.1415926535898),"Cylinder")
part(1,1,Vector3.new(4,0.5,2),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(7.9600086212158,0.27001214027405,6.0000028610229)*CFrame.fromOrientation(0,0,3.1415926535898),"Block")
part(1,1,Vector3.new(2,1,1),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(7.9600086212158,1.0199952125549,5.5000028610229)*CFrame.fromOrientation(0,0,3.1415926535898),"Block")
part(1,1,Vector3.new(1,1,1),"Cylinder",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(8.9600086212158,0.019995212554932,6.5000028610229)*CFrame.fromOrientation(0,-1.5707963267949,3.1415926535898),"Cylinder")
part(1,1,Vector3.new(2,3,1),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(7.9600086212158,1.020012140274,3.5000028610229)*CFrame.fromOrientation(1.5707963267949,3.1415926535898,0),"Wedge")
part(1,1,Vector3.new(1,0.5,3),"Block",1,0,0,0,6,weapon.Swivel2,CFrame.new(17.460008621216,0.26999723911285,2.5000028610229)*CFrame.fromOrientation(0,-1.5707963267949,3.1415926535898),"Block")
part(1,1,Vector3.new(3,0.5,9),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(14.460008621216,-0.23000478744507,1.5000028610229)*CFrame.fromOrientation(0,-1.5707963267949,0),"Block")
part(1,1,Vector3.new(1,1,1),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(9.4600086212158,1.020012140274,6.5000028610229)*CFrame.fromOrientation(1.5707963267949,1.5707963267949,0),"Wedge")
part(1,1,Vector3.new(6,0.5,3),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(8.4600086212158,-0.23000478744507,3.0000028610229)*CFrame.fromOrientation(0,-1.5707963267949,0),"Block")
part(1,1,Vector3.new(1,0.5,3),"Block",1,0,0,0,6,weapon.Swivel2,CFrame.new(12.460008621216,0.26999521255493,1.5000028610229)*CFrame.fromOrientation(0,-1.5707963267949,0),"Block")
part(1,1,Vector3.new(2,0.5,1),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(4.4600086212158,0.26999521255493,2.0000028610229)*CFrame.fromOrientation(0,-1.5707963267949,0),"Block")
part(1,1,Vector3.new(0.5,2,3),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(6.4600086212158,0.26999521255493,2.0000028610229)*CFrame.fromOrientation(0,-1.5707963267949,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.5,2,2),"Cylinder",1,0,0,0,6,weapon.Swivel2,CFrame.new(6.9600086212158,0.019995212554932,7.7500028610229)*CFrame.fromOrientation(0,-1.5707963267949,3.1415926535898),"Cylinder")
part(1,1,Vector3.new(1,0.5,3),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(4.4600086212158,0.76999521255493,3.5000028610229)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(1,1,1),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(6.4600086212158,1.020012140274,6.5000028610229)*CFrame.fromOrientation(1.5707963267949,-1.5707963267949,0),"Wedge")
part(1,1,Vector3.new(0.5,7,7),"Wedge",0.38823533058167,0.37254902720451,0.38431376218796,0,4,weapon.Swivel2,CFrame.new(15.460008621216,-0.23000478744507,-4.4999961853027)*CFrame.fromOrientation(0,0,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.5,1,3),"Wedge",1,0,0,0,6,weapon.Swivel2,CFrame.new(9.4600086212158,0.26999521255493,-0.49999618530273)*CFrame.fromOrientation(0,-1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(4,0.5,6),"Block",0.38823533058167,0.37254902720451,0.38431376218796,0,4,weapon.Swivel2,CFrame.new(9.9600086212158,-0.73000478744507,-3.9999961853027)*CFrame.fromOrientation(0,1.5707963267949,0),"Block")
part(1,1,Vector3.new(1,0.5,3),"Block",0.38823533058167,0.37254902720451,0.38431376218796,0,4,weapon.Swivel2,CFrame.new(11.460008621216,-0.73000478744507,-1.4999961853027)*CFrame.fromOrientation(0,1.5707963267949,0),"Block")
part(1,1,Vector3.new(0.5,1,3),"Wedge",0.38823533058167,0.37254902720451,0.38431376218796,0,4,weapon.Swivel2,CFrame.new(8.4600086212158,-0.73000478744507,-1.4999961853027)*CFrame.fromOrientation(0,1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.5,1,3),"Wedge",0.38823533058167,0.37254902720451,0.38431376218796,0,4,weapon.Swivel2,CFrame.new(11.460008621216,-0.72999477386475,-0.49999618530273)*CFrame.fromOrientation(0,1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(16,0.5,1),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(5.4600086212158,-0.73000478744507,-8.9999961853027)*CFrame.fromOrientation(0,-1.5707963267949,0),"Block")
part(1,1,Vector3.new(4,0.5,6),"Block",0.38823533058167,0.37254902720451,0.38431376218796,0,4,weapon.Swivel2,CFrame.new(9.9600086212158,0.26999521255493,-3.9999961853027)*CFrame.fromOrientation(0,1.5707963267949,0),"Block")
part(1,1,Vector3.new(1,0.5,3),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(4.4600086212158,-0.73000478744507,4.5000028610229)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.5,1,3),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(3.4600086212158,-0.73000478744507,4.5000028610229)*CFrame.fromOrientation(0,3.1415926535898,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(1,1,1),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(6.4600086212158,-0.98000192642212,5.5000028610229)*CFrame.fromOrientation(-1.5707963267949,1.5707963267949,0),"Wedge")
part(1,1,Vector3.new(0.5,1,3),"Wedge",1,0,0,0,6,weapon.Swivel2,CFrame.new(9.4600086212158,-0.73000478744507,-0.49999618530273)*CFrame.fromOrientation(0,-1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.5,2,8),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(3.9600086212158,-1.2300047874451,-6.9999961853027)*CFrame.fromOrientation(0,0,1.5707963267949),"Wedge")
part(1,1,Vector3.new(9,0.5,1),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(5.4600086212158,-1.2300047874451,-6.4999961853027)*CFrame.fromOrientation(0,-1.5707963267949,0),"Block")
part(1,1,Vector3.new(2,0.5,1),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(4.4600086212158,-0.23000478744507,-0.99999618530273)*CFrame.fromOrientation(0,-1.5707963267949,0),"Block")
part(1,1,Vector3.new(1,0.5,2),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(3.9600086212158,-1.2300047874451,-2.4999961853027)*CFrame.fromOrientation(0,-1.5707963267949,0),"Block")
part(1,1,Vector3.new(0.5,2,3),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(6.4600086212158,0.26999521255493,-1.9999961853027)*CFrame.fromOrientation(0,-1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.5,1,3),"Wedge",1,0,0,0,6,weapon.Swivel2,CFrame.new(12.460008621216,0.26999521255493,0.50000381469727)*CFrame.fromOrientation(0,-1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(1,1,1),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(4.4600086212158,1.0199952125549,1.5000028610229)*CFrame.fromOrientation(1.5707963267949,0,0),"Wedge")
part(1,1,Vector3.new(1,0.5,3),"Block",1,0,0,0,6,weapon.Swivel2,CFrame.new(9.4600086212158,0.26999521255493,0.50000381469727)*CFrame.fromOrientation(0,-1.5707963267949,0),"Block")
part(1,1,Vector3.new(1,1,1),"Cylinder",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(6.9600086212158,0.019995212554932,6.5000028610229)*CFrame.fromOrientation(0,-1.5707963267949,3.1415926535898),"Cylinder")
part(1,1,Vector3.new(8,0.5,6),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(7.9600086212158,-0.23000478744507,-3.9999961853027)*CFrame.fromOrientation(0,-1.5707963267949,0),"Block")
part(1,1,Vector3.new(10,0.5,1),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(5.4600086212158,0.76999521255493,-5.9999961853027)*CFrame.fromOrientation(0,-1.5707963267949,0),"Block")
part(1,1,Vector3.new(0.5,1,3),"Wedge",0.38823533058167,0.37254902720451,0.38431376218796,0,4,weapon.Swivel2,CFrame.new(11.460008621216,0.27000522613525,-0.49999618530273)*CFrame.fromOrientation(0,1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(6,0.5,3),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(5.4600086212158,-0.23000478744507,3.0000028610229)*CFrame.fromOrientation(0,-1.5707963267949,0),"Block")
part(1,1,Vector3.new(1,0.5,3),"Block",0.38823533058167,0.37254902720451,0.38431376218796,0,4,weapon.Swivel2,CFrame.new(11.460008621216,0.26999521255493,-1.4999961853027)*CFrame.fromOrientation(0,1.5707963267949,0),"Block")
part(1,1,Vector3.new(0.5,1,3),"Wedge",0.38823533058167,0.37254902720451,0.38431376218796,0,4,weapon.Swivel2,CFrame.new(8.4600086212158,0.26999521255493,-1.4999961853027)*CFrame.fromOrientation(0,1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.5,2,2),"Cylinder",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(6.9600086212158,0.019995212554932,7.2500028610229)*CFrame.fromOrientation(0,-1.5707963267949,3.1415926535898),"Cylinder")
part(1,1,Vector3.new(1,1,1),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(6.4600086212158,1.020012140274,5.5000028610229)*CFrame.fromOrientation(1.5707963267949,-1.5707963267949,0),"Wedge")
part(1,1,Vector3.new(1,0.5,2),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(3.9600086212158,0.76999521255493,-2.4999961853027)*CFrame.fromOrientation(0,-1.5707963267949,0),"Block")
part(1,1,Vector3.new(1,0.5,1),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(4.4600086212158,0.26999521255493,-1.4999961853027)*CFrame.fromOrientation(0,-1.5707963267949,0),"Block")
part(1,1,Vector3.new(0.5,2,8),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(3.9600086212158,0.76999521255493,-6.9999961853027)*CFrame.fromOrientation(0,0,1.5707963267949),"Wedge")
part(1,1,Vector3.new(1,0.5,3),"Block",1,0,0,0,6,weapon.Swivel2,CFrame.new(9.4600086212158,0.77000904083252,-4.4999961853027)*CFrame.fromOrientation(0,1.5707963267949,0),"Block")
part(1,1,Vector3.new(1,0.5,2),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(6.4600086212158,0.26999521255493,-3.9999961853027)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.5,1,3),"Wedge",1,0,0,0,6,weapon.Swivel2,CFrame.new(9.4600086212158,0.77000904083252,-3.4999961853027)*CFrame.fromOrientation(0,1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(1,1,1),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(4.4600086212158,1.0199952125549,-1.4999961853027)*CFrame.fromOrientation(0,0,0),"Wedge")
part(1,1,Vector3.new(0.5,2,8),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(-4.0399990081787,-1.2300047874451,-6.9999961853027)*CFrame.fromOrientation(0,0,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(2,0.5,1),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(-4.5399990081787,-0.23000478744507,-0.99999618530273)*CFrame.fromOrientation(0,1.5707963267949,0),"Block")
part(1,1,Vector3.new(1,1,1),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(-4.5399990081787,1.0199952125549,1.5000028610229)*CFrame.fromOrientation(1.5707963267949,0,0),"Wedge")
part(1,1,Vector3.new(1,0.5,2),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(-4.0399990081787,-1.2300047874451,-2.4999961853027)*CFrame.fromOrientation(0,1.5707963267949,0),"Block")
part(1,1,Vector3.new(2,1,1),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(-4.5399990081787,-0.98000478744507,3.814697265625e-06)*CFrame.fromOrientation(0,1.5707963267949,3.1415926535898),"Block")
part(1,1,Vector3.new(1,0.5,2),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(-4.0399990081787,0.76999521255493,-2.4999961853027)*CFrame.fromOrientation(0,1.5707963267949,0),"Block")
part(1,1,Vector3.new(0.5,2,8),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(-4.0399990081787,0.76999521255493,-6.9999961853027)*CFrame.fromOrientation(0,0,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(1,1,1),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(-4.5399990081787,1.0199952125549,-1.4999961853027)*CFrame.fromOrientation(0,0,0),"Wedge")
part(1,1,Vector3.new(1,0.5,1),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(-4.5399990081787,0.26999521255493,-1.4999961853027)*CFrame.fromOrientation(0,1.5707963267949,0),"Block")
part(1,1,Vector3.new(1,1,1),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(-4.5399990081787,-0.98000288009644,-1.4999952316284)*CFrame.fromOrientation(-1.5707963267949,0,0),"Wedge")
part(1,1,Vector3.new(0.5,1,3),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(-3.5399990081787,0.76999521255493,3.5000028610229)*CFrame.fromOrientation(0,-3.1415926535898,1.5707963267949),"Wedge")
part(1,1,Vector3.new(1,0.5,3),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(-4.5399990081787,0.26999521255493,4.5000028610229)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.5,1,3),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(-3.5399990081787,0.26999521255493,4.5000028610229)*CFrame.fromOrientation(0,-3.1415926535898,1.5707963267949),"Wedge")
part(1,1,Vector3.new(1,1,1),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(-4.5399990081787,-0.98000478744507,1.5000028610229)*CFrame.fromOrientation(0,3.1415926535898,3.1415926535898),"Wedge")
part(1,1,Vector3.new(2,1,1),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(-4.5399990081787,1.0199952125549,3.814697265625e-06)*CFrame.fromOrientation(0,1.5707963267949,0),"Block")
part(1,1,Vector3.new(1,1,1),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(4.4600086212158,-0.98000288009644,-1.4999952316284)*CFrame.fromOrientation(-1.5707963267949,0,0),"Wedge")
part(1,1,Vector3.new(2,1,1),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(4.4600086212158,-0.98000478744507,3.814697265625e-06)*CFrame.fromOrientation(0,-1.5707963267949,3.1415926535898),"Block")
part(1,1,Vector3.new(1,1,1),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(4.4600086212158,-0.98000478744507,1.5000028610229)*CFrame.fromOrientation(0,3.1415926535898,3.1415926535898),"Wedge")
part(1,1,Vector3.new(2,1,3),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(6.4600086212158,-0.98000478744507,3.814697265625e-06)*CFrame.fromOrientation(0,-1.5707963267949,3.1415926535898),"Wedge")
part(1,1,Vector3.new(0.5,1,3),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(3.4600086212158,0.26999521255493,4.5000028610229)*CFrame.fromOrientation(0,3.1415926535898,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(1,0.5,3),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(4.4600086212158,0.26999521255493,4.5000028610229)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(1,0.5,3),"Block",1,0,0,0,6,weapon.Swivel2,CFrame.new(9.4600086212158,-1.2299909591675,-4.4999961853027)*CFrame.fromOrientation(0,1.5707963267949,0),"Block")
part(1,1,Vector3.new(1,0.5,3),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(9.4600086212158,-1.2300047874451,-5.4999961853027)*CFrame.fromOrientation(0,-1.5707963267949,0),"Block")
part(1,1,Vector3.new(1,0.5,3),"Block",1,0,0,0,6,weapon.Swivel2,CFrame.new(9.4600086212158,-1.2299988269806,-6.4999961853027)*CFrame.fromOrientation(0,-1.5707963267949,0),"Block")
part(1,1,Vector3.new(0.5,1,3),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(3.4600086212158,0.76999521255493,3.5000028610229)*CFrame.fromOrientation(0,3.1415926535898,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.5,1,3),"Wedge",1,0,0,0,6,weapon.Swivel2,CFrame.new(9.4600086212158,-1.2299909591675,-3.4999961853027)*CFrame.fromOrientation(0,1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(1,0.5,8),"Block",0.38823533058167,0.37254902720451,0.38431376218796,0,4,weapon.Swivel2,CFrame.new(14.960008621216,-0.23000478744507,-0.49999618530273)*CFrame.fromOrientation(0,-1.5707963267949,0),"Block")
part(1,1,Vector3.new(1,0.5,7),"Block",0.38823533058167,0.37254902720451,0.38431376218796,0,4,weapon.Swivel2,CFrame.new(11.460008621216,-0.23000478744507,-4.4999961853027)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(1,0.5,3),"Block",1,0,0,0,6,weapon.Swivel2,CFrame.new(9.4600086212158,0.77000117301941,-6.4999961853027)*CFrame.fromOrientation(0,-1.5707963267949,0),"Block")
part(1,1,Vector3.new(1,0.5,3),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(9.4600086212158,0.76999521255493,-5.4999961853027)*CFrame.fromOrientation(0,-1.5707963267949,0),"Block")
part(1,1,Vector3.new(0.5,2,2),"Cylinder",1,0,0,0,6,weapon.Swivel2,CFrame.new(-7.0399990081787,0.019995212554932,7.7500028610229)*CFrame.fromOrientation(0,1.5707963267949,3.1415926535898),"Cylinder")
part(1,1,Vector3.new(0.5,2,3),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(-6.5399990081787,0.26999521255493,-1.9999961853027)*CFrame.fromOrientation(0,1.5707963267949,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.5,2,2),"Cylinder",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(-7.0399990081787,0.019995212554932,7.2500028610229)*CFrame.fromOrientation(0,1.5707963267949,3.1415926535898),"Cylinder")
part(1,1,Vector3.new(1,1,1),"Cylinder",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(-7.0399990081787,0.019995212554932,6.5000028610229)*CFrame.fromOrientation(0,1.5707963267949,3.1415926535898),"Cylinder")
part(1,1,Vector3.new(1,0.5,2),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(-6.5399990081787,0.26999521255493,-3.9999961853027)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.5,2,3),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(-6.5399990081787,0.26999521255493,2.0000028610229)*CFrame.fromOrientation(0,1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(1,1,1),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(-6.5399990081787,1.020012140274,6.5000028610229)*CFrame.fromOrientation(1.5707963267949,1.5707963267949,0),"Wedge")
part(1,1,Vector3.new(2,1,3),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(-6.5399990081787,1.0199952125549,3.814697265625e-06)*CFrame.fromOrientation(0,1.5707963267949,0),"Wedge")
part(1,1,Vector3.new(1,1,1),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(-6.5399913787842,-0.98000192642212,5.5000028610229)*CFrame.fromOrientation(-1.5707963267949,-1.5707963267949,0),"Wedge")
part(1,1,Vector3.new(2,1,1),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(4.4600086212158,1.0199952125549,3.814697265625e-06)*CFrame.fromOrientation(0,-1.5707963267949,0),"Block")
part(1,1,Vector3.new(16,0.5,1),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(-5.5399990081787,-0.73000478744507,-8.9999961853027)*CFrame.fromOrientation(0,1.5707963267949,0),"Block")
part(1,1,Vector3.new(9,0.5,1),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(-5.5399990081787,-1.2300047874451,-6.4999961853027)*CFrame.fromOrientation(0,1.5707963267949,0),"Block")
part(1,1,Vector3.new(10,0.5,1),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(-5.5399990081787,0.76999521255493,-5.9999961853027)*CFrame.fromOrientation(0,1.5707963267949,0),"Block")
part(1,1,Vector3.new(6,0.5,3),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(-5.5399990081787,-0.23000478744507,3.0000028610229)*CFrame.fromOrientation(0,1.5707963267949,0),"Block")
part(1,1,Vector3.new(2,1,3),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(6.4600086212158,1.0199952125549,3.814697265625e-06)*CFrame.fromOrientation(0,-1.5707963267949,0),"Wedge")
part(1,1,Vector3.new(1,1,1),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(-6.5399990081787,1.020012140274,5.5000028610229)*CFrame.fromOrientation(1.5707963267949,1.5707963267949,0),"Wedge")
part(1,1,Vector3.new(2,1,3),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(-6.5399990081787,-0.98000478744507,3.814697265625e-06)*CFrame.fromOrientation(0,1.5707963267949,3.1415926535898),"Wedge")
part(1,1,Vector3.new(0.5,1,3),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(-6.5399990081787,0.27001214027405,3.5000028610229)*CFrame.fromOrientation(0,0,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(2,0.5,4),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(-6.0399990081787,0.26999521255493,3.814697265625e-06)*CFrame.fromOrientation(0,1.5707963267949,0),"Block")
part(1,1,Vector3.new(2,0.5,1),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(-4.5399990081787,0.26999521255493,2.0000028610229)*CFrame.fromOrientation(0,1.5707963267949,0),"Block")
part(1,1,Vector3.new(1,0.5,3),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(-4.5399990081787,0.76999521255493,3.5000028610229)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.5,1,3),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(6.4600086212158,0.27001214027405,3.5000028610229)*CFrame.fromOrientation(0,0,1.5707963267949),"Wedge")
part(1,1,Vector3.new(2,0.5,4),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(5.9600086212158,0.26999521255493,3.814697265625e-06)*CFrame.fromOrientation(0,-1.5707963267949,0),"Block")
part(1,1,Vector3.new(1,0.5,3),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(-4.5399990081787,-0.73000478744507,4.5000028610229)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.5,1,3),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(-3.5399990081787,-0.73000478744507,4.5000028610229)*CFrame.fromOrientation(0,-3.1415926535898,1.5707963267949),"Wedge")
part(1,1,Vector3.new(10,0.5,3),"Block",0.38823533058167,0.37254902720451,0.38431376218796,0,4,weapon.Swivel2,CFrame.new(8.4600086212158,0.26999521255493,-10.999996185303)*CFrame.fromOrientation(0,1.5707963267949,0),"Block")
part(1,1,Vector3.new(10,0.5,3),"Block",0.38823533058167,0.37254902720451,0.38431376218796,0,4,weapon.Swivel2,CFrame.new(8.4600086212158,-0.73000478744507,-10.999996185303)*CFrame.fromOrientation(0,1.5707963267949,0),"Block")
part(1,1,Vector3.new(0.5,3,9),"Wedge",0.38823533058167,0.37254902720451,0.38431376218796,0,4,weapon.Swivel2,CFrame.new(11.460008621216,-0.73000478744507,-10.499996185303)*CFrame.fromOrientation(0,0,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.5,3,9),"Wedge",0.38823533058167,0.37254902720451,0.38431376218796,0,4,weapon.Swivel2,CFrame.new(11.460008621216,0.26999521255493,-10.499996185303)*CFrame.fromOrientation(0,0,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(1,0.5,6),"Block",1,0,0,0,6,weapon.Swivel2,CFrame.new(8.4600086212158,0.76999521255493,-9.9999961853027)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(1,0.5,6),"Block",1,0,0,0,6,weapon.Swivel2,CFrame.new(8.4600086212158,-1.2300047874451,-9.9999961853027)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.5,6,2),"Wedge",1,0,0,0,6,weapon.Swivel2,CFrame.new(9.9600086212158,-1.2300047874451,-9.9999961853027)*CFrame.fromOrientation(0,-1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(14,0.5,1),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(5.4600086212158,0.26999521255493,-9.9999961853027)*CFrame.fromOrientation(0,-1.5707963267949,0),"Block")
part(1,1,Vector3.new(0.5,6,2),"Wedge",1,0,0,0,6,weapon.Swivel2,CFrame.new(9.9600086212158,0.76999521255493,-9.9999961853027)*CFrame.fromOrientation(0,-1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(1,0.5,3),"Block",0.38823533058167,0.37254902720451,0.38431376218796,0,4,weapon.Swivel2,CFrame.new(-11.539999008179,-0.73000478744507,-1.4999961853027)*CFrame.fromOrientation(0,-1.5707963267949,0),"Block")
part(1,1,Vector3.new(0.5,1,3),"Wedge",0.38823533058167,0.37254902720451,0.38431376218796,0,4,weapon.Swivel2,CFrame.new(-11.539999008179,-0.72999477386475,-0.49999618530273)*CFrame.fromOrientation(0,-1.5707963267949,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.5,1,3),"Wedge",1,0,0,0,6,weapon.Swivel2,CFrame.new(-12.539999008179,-0.73000478744507,0.50000381469727)*CFrame.fromOrientation(0,1.5707963267949,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.5,1,3),"Wedge",0.38823533058167,0.37254902720451,0.38431376218796,0,4,weapon.Swivel2,CFrame.new(-11.539999008179,0.27000522613525,-0.49999618530273)*CFrame.fromOrientation(0,-1.5707963267949,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(1,0.5,3),"Block",1,0,0,0,6,weapon.Swivel2,CFrame.new(-12.539999008179,-0.73000478744507,1.5000028610229)*CFrame.fromOrientation(0,1.5707963267949,0),"Block")
part(1,1,Vector3.new(1,0.5,3),"Block",0.38823533058167,0.37254902720451,0.38431376218796,0,4,weapon.Swivel2,CFrame.new(-11.539999008179,0.26999521255493,-1.4999961853027)*CFrame.fromOrientation(0,-1.5707963267949,0),"Block")
part(1,1,Vector3.new(0.5,1,3),"Wedge",1,0,0,0,6,weapon.Swivel2,CFrame.new(-12.539999008179,0.26999521255493,0.50000381469727)*CFrame.fromOrientation(0,1.5707963267949,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(1,0.5,3),"Block",1,0,0,0,6,weapon.Swivel2,CFrame.new(-12.539999008179,0.26999521255493,1.5000028610229)*CFrame.fromOrientation(0,1.5707963267949,0),"Block")
part(1,1,Vector3.new(0.5,2,2),"Cylinder",1,0,0,0,6,weapon.Swivel2,CFrame.new(-9.0399990081787,0.019995212554932,7.7500028610229)*CFrame.fromOrientation(0,1.5707963267949,3.1415926535898),"Cylinder")
part(1,1,Vector3.new(2,0.5,3),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(-8.0399990081787,0.27001214027405,3.5000028610229)*CFrame.fromOrientation(0,0,3.1415926535898),"Block")
part(1,1,Vector3.new(0.5,1,3),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(-9.5399990081787,0.27001214027405,3.5000028610229)*CFrame.fromOrientation(0,0,1.5707963267949),"Wedge")
part(1,1,Vector3.new(2,1,1),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(-8.0399913787842,-0.97998571395874,5.5000028610229)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(4,0.5,6),"Block",0.38823533058167,0.37254902720451,0.38431376218796,0,4,weapon.Swivel2,CFrame.new(-10.039999008179,0.26999521255493,-3.9999961853027)*CFrame.fromOrientation(0,-1.5707963267949,0),"Block")
part(1,1,Vector3.new(0.5,1,3),"Wedge",0.38823533058167,0.37254902720451,0.38431376218796,0,4,weapon.Swivel2,CFrame.new(-8.5399990081787,-0.73000478744507,-1.4999961853027)*CFrame.fromOrientation(0,-1.5707963267949,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(1,1,1),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(-9.5399913787842,-0.98000192642212,5.5000028610229)*CFrame.fromOrientation(-1.5707963267949,1.5707963267949,0),"Wedge")
part(1,1,Vector3.new(0.5,1,3),"Wedge",1,0,0,0,6,weapon.Swivel2,CFrame.new(-9.5399990081787,0.26999521255493,-0.49999618530273)*CFrame.fromOrientation(0,1.5707963267949,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(4,0.5,6),"Block",0.38823533058167,0.37254902720451,0.38431376218796,0,4,weapon.Swivel2,CFrame.new(-10.039999008179,-0.73000478744507,-3.9999961853027)*CFrame.fromOrientation(0,-1.5707963267949,0),"Block")
part(1,1,Vector3.new(2,3,1),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(-8.0399913787842,-0.98000288009644,3.5000028610229)*CFrame.fromOrientation(-1.5707963267949,0,0),"Wedge")
part(1,1,Vector3.new(0.5,1,3),"Wedge",1,0,0,0,6,weapon.Swivel2,CFrame.new(-9.5399990081787,-0.73000478744507,-0.49999618530273)*CFrame.fromOrientation(0,1.5707963267949,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(1,1,1),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(-9.5399990081787,1.020012140274,5.5000028610229)*CFrame.fromOrientation(1.5707963267949,-1.5707963267949,0),"Wedge")
part(1,1,Vector3.new(1,0.5,3),"Block",1,0,0,0,6,weapon.Swivel2,CFrame.new(-9.5399990081787,0.26999521255493,0.50000381469727)*CFrame.fromOrientation(0,1.5707963267949,0),"Block")
part(1,1,Vector3.new(1,0.5,3),"Block",1,0,0,0,6,weapon.Swivel2,CFrame.new(-9.5399990081787,-0.73000478744507,0.50000381469727)*CFrame.fromOrientation(0,1.5707963267949,0),"Block")
part(1,1,Vector3.new(8,0.5,6),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(-8.0399990081787,-0.23000478744507,-3.9999961853027)*CFrame.fromOrientation(0,1.5707963267949,0),"Block")
part(1,1,Vector3.new(2,0.5,1),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(-8.0399990081787,0.76999521255493,6.5000028610229)*CFrame.fromOrientation(0,0,3.1415926535898),"Block")
part(1,1,Vector3.new(4,0.5,2),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(-8.0399990081787,0.27001214027405,6.0000028610229)*CFrame.fromOrientation(0,0,3.1415926535898),"Block")
part(1,1,Vector3.new(0.5,2,2),"Cylinder",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(-9.0399990081787,0.019995212554932,7.2500028610229)*CFrame.fromOrientation(0,1.5707963267949,3.1415926535898),"Cylinder")
part(1,1,Vector3.new(0.5,1,3),"Wedge",0.38823533058167,0.37254902720451,0.38431376218796,0,4,weapon.Swivel2,CFrame.new(-8.5399990081787,0.26999521255493,-1.4999961853027)*CFrame.fromOrientation(0,-1.5707963267949,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(2,1,1),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(-8.0399990081787,1.0199952125549,5.5000028610229)*CFrame.fromOrientation(0,0,3.1415926535898),"Block")
part(1,1,Vector3.new(1,0.5,3),"Block",1,0,0,0,6,weapon.Swivel2,CFrame.new(-9.5399990081787,0.77000904083252,-4.4999961853027)*CFrame.fromOrientation(0,-1.5707963267949,0),"Block")
part(1,1,Vector3.new(1,1,1),"Cylinder",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(-9.0399990081787,0.019995212554932,6.5000028610229)*CFrame.fromOrientation(0,1.5707963267949,3.1415926535898),"Cylinder")
part(1,1,Vector3.new(2,3,1),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(-8.0399990081787,1.020012140274,3.5000028610229)*CFrame.fromOrientation(1.5707963267949,3.1415926535898,0),"Wedge")
part(1,1,Vector3.new(0.5,1,3),"Wedge",1,0,0,0,6,weapon.Swivel2,CFrame.new(-9.5399990081787,0.77000904083252,-3.4999961853027)*CFrame.fromOrientation(0,-1.5707963267949,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(1,0.5,3),"Block",1,0,0,0,6,weapon.Swivel2,CFrame.new(-9.5399990081787,-1.2299988269806,-6.4999961853027)*CFrame.fromOrientation(0,1.5707963267949,0),"Block")
part(1,1,Vector3.new(1,0.5,3),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(-9.5399990081787,-1.2300047874451,-5.4999961853027)*CFrame.fromOrientation(0,1.5707963267949,0),"Block")
part(1,1,Vector3.new(0.5,1,3),"Wedge",1,0,0,0,6,weapon.Swivel2,CFrame.new(-9.5399990081787,-1.2299909591675,-3.4999961853027)*CFrame.fromOrientation(0,-1.5707963267949,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(1,1,1),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(-9.5399990081787,1.020012140274,6.5000028610229)*CFrame.fromOrientation(1.5707963267949,-1.5707963267949,0),"Wedge")
part(1,1,Vector3.new(6,0.5,3),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(-8.5399990081787,-0.23000478744507,3.0000028610229)*CFrame.fromOrientation(0,1.5707963267949,0),"Block")
part(1,1,Vector3.new(1,0.5,3),"Block",1,0,0,0,6,weapon.Swivel2,CFrame.new(-9.5399990081787,-1.2299909591675,-4.4999961853027)*CFrame.fromOrientation(0,-1.5707963267949,0),"Block")
part(1,1,Vector3.new(10,0.5,3),"Block",0.38823533058167,0.37254902720451,0.38431376218796,0,4,weapon.Swivel2,CFrame.new(-8.5399990081787,0.26999521255493,-10.999996185303)*CFrame.fromOrientation(0,-1.5707963267949,0),"Block")
part(1,1,Vector3.new(1,0.5,3),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(-9.5399990081787,0.76999521255493,-5.4999961853027)*CFrame.fromOrientation(0,1.5707963267949,0),"Block")
part(1,1,Vector3.new(1,0.5,7),"Block",0.38823533058167,0.37254902720451,0.38431376218796,0,4,weapon.Swivel2,CFrame.new(-11.539999008179,-0.23000478744507,-4.4999961853027)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(1,0.5,3),"Block",1,0,0,0,6,weapon.Swivel2,CFrame.new(-9.5399990081787,0.77000117301941,-6.4999961853027)*CFrame.fromOrientation(0,1.5707963267949,0),"Block")
part(1,1,Vector3.new(0.5,3,9),"Wedge",0.38823533058167,0.37254902720451,0.38431376218796,0,4,weapon.Swivel2,CFrame.new(-11.539999008179,0.26999521255493,-10.499996185303)*CFrame.fromOrientation(0,0,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.5,3,9),"Wedge",0.38823533058167,0.37254902720451,0.38431376218796,0,4,weapon.Swivel2,CFrame.new(-11.539999008179,-0.73000478744507,-10.499996185303)*CFrame.fromOrientation(0,0,1.5707963267949),"Wedge")
part(1,1,Vector3.new(10,0.5,3),"Block",0.38823533058167,0.37254902720451,0.38431376218796,0,4,weapon.Swivel2,CFrame.new(-8.5399990081787,-0.73000478744507,-10.999996185303)*CFrame.fromOrientation(0,-1.5707963267949,0),"Block")
part(1,1,Vector3.new(1,0.5,6),"Block",1,0,0,0,6,weapon.Swivel2,CFrame.new(-8.5399990081787,0.76999521255493,-9.9999961853027)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.5,6,2),"Wedge",1,0,0,0,6,weapon.Swivel2,CFrame.new(-10.039999008179,-1.2300047874451,-9.9999961853027)*CFrame.fromOrientation(0,1.5707963267949,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(1,0.5,6),"Block",1,0,0,0,6,weapon.Swivel2,CFrame.new(-8.5399990081787,-1.2300047874451,-9.9999961853027)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(14,0.5,1),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(-5.5399990081787,0.26999521255493,-9.9999961853027)*CFrame.fromOrientation(0,1.5707963267949,0),"Block")
part(1,1,Vector3.new(0.5,6,2),"Wedge",1,0,0,0,6,weapon.Swivel2,CFrame.new(-10.039999008179,0.76999521255493,-9.9999961853027)*CFrame.fromOrientation(0,1.5707963267949,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.5,2,2),"Wedge",0.38823533058167,0.37254902720451,0.38431376218796,0,4,weapon.Swivel2,CFrame.new(8.9600086212158,0.27000427246094,-16.999996185303)*CFrame.fromOrientation(0,0,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.5,1,3),"Wedge",1,0,0,0,6,weapon.Swivel2,CFrame.new(6.4600086212158,-0.72999978065491,-18.499996185303)*CFrame.fromOrientation(0,3.1415926535898,1.5707963267949),"Wedge")
part(1,1,Vector3.new(1,0.5,3),"Block",1,0,0,0,6,weapon.Swivel2,CFrame.new(5.4600086212158,-0.72999978065491,-18.499996185303)*CFrame.fromOrientation(0,3.1415926535898,0),"Block")
part(1,1,Vector3.new(0.5,2,2),"Wedge",0.38823533058167,0.37254902720451,0.38431376218796,0,4,weapon.Swivel2,CFrame.new(8.9600086212158,-0.72999572753906,-16.999996185303)*CFrame.fromOrientation(0,0,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(2,0.5,1),"Block",0.38823533058167,0.37254902720451,0.38431376218796,0,4,weapon.Swivel2,CFrame.new(7.4600086212158,-0.73000478744507,-16.999996185303)*CFrame.fromOrientation(0,1.5707963267949,0),"Block")
part(1,1,Vector3.new(2,0.5,1),"Block",0.38823533058167,0.37254902720451,0.38431376218796,0,4,weapon.Swivel2,CFrame.new(7.4600086212158,0.26999521255493,-16.999996185303)*CFrame.fromOrientation(0,1.5707963267949,0),"Block")
part(1,1,Vector3.new(15,0.5,4),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(6.9600086212158,-0.23000478744507,-15.499996185303)*CFrame.fromOrientation(0,-1.5707963267949,0),"Block")
part(1,1,Vector3.new(15,0.5,4),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(-7.0399990081787,-0.23000478744507,-15.499996185303)*CFrame.fromOrientation(0,1.5707963267949,0),"Block")
part(1,1,Vector3.new(1,0.5,3),"Block",1,0,0,0,6,weapon.Swivel2,CFrame.new(-5.5399990081787,0.27000021934509,-18.499996185303)*CFrame.fromOrientation(0,3.1415926535898,0),"Block")
part(1,1,Vector3.new(0.5,1,3),"Wedge",1,0,0,0,6,weapon.Swivel2,CFrame.new(-6.5399990081787,0.27000021934509,-18.499996185303)*CFrame.fromOrientation(0,-3.1415926535898,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.5,1,3),"Wedge",1,0,0,0,6,weapon.Swivel2,CFrame.new(6.4600086212158,0.27000021934509,-18.499996185303)*CFrame.fromOrientation(0,3.1415926535898,1.5707963267949),"Wedge")
part(1,1,Vector3.new(1,0.5,3),"Block",1,0,0,0,6,weapon.Swivel2,CFrame.new(5.4600086212158,0.27000021934509,-18.499996185303)*CFrame.fromOrientation(0,3.1415926535898,0),"Block")
part(1,1,Vector3.new(1,0.5,3),"Block",1,0,0,0,6,weapon.Swivel2,CFrame.new(-17.539999008179,-0.73000288009644,2.5000028610229)*CFrame.fromOrientation(0,1.5707963267949,3.1415926535898),"Block")
part(1,1,Vector3.new(0.5,1,3),"Wedge",1,0,0,0,6,weapon.Swivel2,CFrame.new(-17.539999008179,-0.73000574111938,3.4999990463257)*CFrame.fromOrientation(0,1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.5,1,3),"Wedge",1,0,0,0,6,weapon.Swivel2,CFrame.new(-17.539999008179,0.26999425888062,3.4999990463257)*CFrame.fromOrientation(0,1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.5,3,9),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(-14.539999008179,-0.23000478744507,4.5000028610229)*CFrame.fromOrientation(0,1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(1,0.5,8),"Block",0.38823533058167,0.37254902720451,0.38431376218796,0,4,weapon.Swivel2,CFrame.new(-15.039999008179,-0.23000478744507,-0.49999618530273)*CFrame.fromOrientation(0,1.5707963267949,0),"Block")
part(1,1,Vector3.new(1,0.5,3),"Block",1,0,0,0,6,weapon.Swivel2,CFrame.new(-17.539999008179,0.26999723911285,2.5000028610229)*CFrame.fromOrientation(0,1.5707963267949,3.1415926535898),"Block")
part(1,1,Vector3.new(3,0.5,9),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(-14.539999008179,-0.23000478744507,1.5000028610229)*CFrame.fromOrientation(0,1.5707963267949,0),"Block")
part(1,1,Vector3.new(0.5,7,7),"Wedge",0.38823533058167,0.37254902720451,0.38431376218796,0,4,weapon.Swivel2,CFrame.new(-15.539999008179,-0.23000478744507,-4.4999961853027)*CFrame.fromOrientation(0,0,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.5,2,2),"Wedge",0.38823533058167,0.37254902720451,0.38431376218796,0,4,weapon.Swivel2,CFrame.new(-9.0399990081787,0.27000427246094,-16.999996185303)*CFrame.fromOrientation(0,0,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.5,1,3),"Wedge",1,0,0,0,6,weapon.Swivel2,CFrame.new(-6.5399990081787,-0.72999978065491,-18.499996185303)*CFrame.fromOrientation(0,-3.1415926535898,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.5,2,2),"Wedge",0.38823533058167,0.37254902720451,0.38431376218796,0,4,weapon.Swivel2,CFrame.new(-9.0399990081787,-0.72999572753906,-16.999996185303)*CFrame.fromOrientation(0,0,1.5707963267949),"Wedge")
part(1,1,Vector3.new(1,0.5,3),"Block",1,0,0,0,6,weapon.Swivel2,CFrame.new(-5.5399990081787,-0.72999978065491,-18.499996185303)*CFrame.fromOrientation(0,3.1415926535898,0),"Block")
part(1,1,Vector3.new(2,0.5,1),"Block",0.38823533058167,0.37254902720451,0.38431376218796,0,4,weapon.Swivel2,CFrame.new(-7.5399990081787,0.26999521255493,-16.999996185303)*CFrame.fromOrientation(0,-1.5707963267949,0),"Block")
part(1,1,Vector3.new(2,0.5,1),"Block",0.38823533058167,0.37254902720451,0.38431376218796,0,4,weapon.Swivel2,CFrame.new(-7.5399990081787,-0.73000478744507,-16.999996185303)*CFrame.fromOrientation(0,-1.5707963267949,0),"Block")
part(1,1,Vector3.new(1,0.5,3),"Block",1,0,0,0,6,weapon.Swivel2,CFrame.new(5.4600086212158,-0.72998785972595,-27.499996185303)*CFrame.fromOrientation(0,0,3.1415926535898),"Block")
part(1,1,Vector3.new(0.5,1,3),"Wedge",1,0,0,0,6,weapon.Swivel2,CFrame.new(6.4600086212158,-0.72998785972595,-27.499996185303)*CFrame.fromOrientation(0,0,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(2,0.5,6),"Block",1,0,0,0,6,weapon.Swivel2,CFrame.new(5.9600086212158,-0.73000478744507,-22.999996185303)*CFrame.fromOrientation(0,3.1415926535898,0),"Block")
part(1,1,Vector3.new(2,0.5,6),"Block",1,0,0,0,6,weapon.Swivel2,CFrame.new(-6.0399990081787,-0.73000478744507,-22.999996185303)*CFrame.fromOrientation(0,3.1415926535898,0),"Block")
part(1,1,Vector3.new(2,0.5,6),"Block",1,0,0,0,6,weapon.Swivel2,CFrame.new(-6.0399990081787,0.26999521255493,-22.999996185303)*CFrame.fromOrientation(0,3.1415926535898,0),"Block")
part(1,1,Vector3.new(0.5,1,3),"Wedge",1,0,0,0,6,weapon.Swivel2,CFrame.new(-6.5399990081787,-0.72998785972595,-27.499996185303)*CFrame.fromOrientation(0,0,1.5707963267949),"Wedge")
part(1,1,Vector3.new(1,0.5,3),"Block",1,0,0,0,6,weapon.Swivel2,CFrame.new(-5.5399990081787,-0.72998785972595,-27.499996185303)*CFrame.fromOrientation(0,0,3.1415926535898),"Block")
part(1,1,Vector3.new(2,0.5,6),"Block",1,0,0,0,6,weapon.Swivel2,CFrame.new(5.9600086212158,0.26999521255493,-22.999996185303)*CFrame.fromOrientation(0,3.1415926535898,0),"Block")
part(1,1,Vector3.new(1,0.5,3),"Block",1,0,0,0,6,weapon.Swivel2,CFrame.new(5.4600086212158,0.27001214027405,-27.499996185303)*CFrame.fromOrientation(0,0,3.1415926535898),"Block")
part(1,1,Vector3.new(0.5,1,3),"Wedge",1,0,0,0,6,weapon.Swivel2,CFrame.new(6.4600086212158,0.27001214027405,-27.499996185303)*CFrame.fromOrientation(0,0,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(11,0.5,2),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(5.9600086212158,-0.23000478744507,-28.499996185303)*CFrame.fromOrientation(0,-1.5707963267949,0),"Block")
part(1,1,Vector3.new(0.5,2,11),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(7.9600086212158,-0.23000478744507,-28.499996185303)*CFrame.fromOrientation(0,0,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.5,1,3),"Wedge",1,0,0,0,6,weapon.Swivel2,CFrame.new(-6.5399990081787,0.27001214027405,-27.499996185303)*CFrame.fromOrientation(0,0,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.5,2,11),"Wedge",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(-8.0399990081787,-0.23000478744507,-28.499996185303)*CFrame.fromOrientation(0,0,1.5707963267949),"Wedge")
part(1,1,Vector3.new(1,0.5,3),"Block",1,0,0,0,6,weapon.Swivel2,CFrame.new(-5.5399990081787,0.27001214027405,-27.499996185303)*CFrame.fromOrientation(0,0,3.1415926535898),"Block")
part(1,1,Vector3.new(11,0.5,2),"Block",0.63921570777893,0.63529413938522,0.64705884456635,0,4,weapon.Swivel2,CFrame.new(-6.0399990081787,-0.23000478744507,-28.499996185303)*CFrame.fromOrientation(0,1.5707963267949,0),"Block")
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
		weapon.Swivel.Weld.C0 = weapon.Swivel.Weld.C0 * CFrame.fromEulerAnglesXYZ(90,0,0)
	elseif k == "q" and attack == false then
		weapon.Swivel.Weld.C0 = weapon.Swivel.Weld.C0 * CFrame.fromEulerAnglesXYZ(0,0,0)
	end
end)

play:GetMouse().KeyUp:connect(function(k)
	
	k = k:lower()
	if k == "z" then
		weapon.Swivel.Weld.C0 = weapon.Swivel.Weld.C0 * CFrame.fromEulerAnglesXYZ(90,0,0)
	elseif k == "q" and attack == false then
		weapon.Swivel.Weld.C0 = weapon.Swivel.Weld.C0 * CFrame.fromEulerAnglesXYZ(0,0,0)
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
							char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 4 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
							char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
							RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(10)), 0.3)
							LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-10)), 0.3)
							weapon.Handle.Weld.C0 = clerp(weapon.Handle.Weld.C0, CFrame.new(0, -2, -1) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
							end
							RH.C0 = clerp(RH.C0, CFrame.new(1, -1 + 0.1 * math.cos((sine) / 20), 0) * RHCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(90)), 0.3)
							LH.C0 = clerp(LH.C0, CFrame.new(-1, -1 + 0.1 * math.cos((sine) / 20), 0.1) * LHCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-90)), 0.3)	
					end
					end
wait()
end
end))

while true do
wait()
end