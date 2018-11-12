wait(.1)
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
	local speed = 500
	if rage == true then
		speed = speed * 2
	end
	local num = 1
	local charge2 = charge
	MouseLook = MouseLook * CFrame.Angles(math.random(-10,10)/500,math.random(-10,10)/500, math.random(-10,10)/500)
	coroutine.resume(coroutine.create(function()
		
		repeat
			wait()
			local hit, pos = rayCast(MainPos, MouseLook.lookVector, speed, char.HumanoidRootPart.Parent)
			local mag = (MainPos - pos).magnitude
			Laser(char.Torso.BrickColor, CFrame.new((MainPos + pos) / 2, pos) * CFrame.Angles(1.57, 0, 0), .5, mag *(-speed / (speed / 2)), .5, -0.1, 0, -0.1, .2)
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
					block(CFrame.new(pos),Vector3.new(1,1,1),Vector3.new(-.1,-.1,-.1),.1,char.Torso.BrickColor,1)
					magn(3,refpart,2)
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

part(1,1,Vector3.new(0.20000001788139,0.25000002980232,0.1000000089407),"Block",0.63921570777893,0.63529413938522,0.64705884456635,1,1,RightArm,CFrame.new(-9.5367431640625e-07,0.0049996376037598,0.0024986267089844)*CFrame.fromOrientation(0,0,0),"Handle")
part(1,1,Vector3.new(0.050000004470348,0.15000000596046,0.15000000596046),"Block",0.066666670143604,0.066666670143604,0.066666670143604,1,3,weapon.Handle,CFrame.new(-0.47500038146973,0.0049996376037598,-2.9724998474121)*CFrame.fromOrientation(0,1.5707963267949,0),"Barrel")
part(1,1,Vector3.new(0.050000004470348,0.15000000596046,0.15000000596046),"Block",0.066666670143604,0.066666670143604,0.066666670143604,1,3,weapon.Handle,CFrame.new(-0.47500038146973,0.0049996376037598,-3.1725006103516)*CFrame.fromOrientation(0,1.5707963267949,0),"ShootPart")
part(1,1,Vector3.new(0.65000003576279,0.25000002980232,0.45000007748604),"Block",0.38823533058167,0.37254902720451,0.38431376218796,0,4,weapon.Handle,CFrame.new(-0.22500038146973,-0.24500036239624,-0.097499847412109)*CFrame.fromOrientation(0,0,0),"Mag")
part(1,1,Vector3.new(0.075000002980232,0.12500001490116,0.20000001788139),"Block",0.066666670143604,0.066666670143604,0.066666670143604,0,3,weapon.Handle,CFrame.new(-0.51250076293945,-0.007500171661377,-0.14749908447266)*CFrame.fromOrientation(0,0,0),"Eject")

part(1,1,Vector3.new(1.700000166893,0.1000000089407,0.1000000089407),"Cylinder",0.38823533058167,0.37254902720451,0.38431376218796,0,3,weapon.Handle,CFrame.new(-0.35000038146973,0.0049996376037598,-1.7724990844727)*CFrame.fromOrientation(0,1.5707963267949,0),"Cylinder")
part(1,1,Vector3.new(0.1000000089407,0.050000004470348,0.050000004470348),"Wedge",1,0,0,0,3,weapon.Handle,CFrame.new(-0.32500076293945,0.0049996376037598,-2.5475006103516)*CFrame.fromOrientation(0,-3.1415926535898,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.050000004470348,0.1000000089407,0.050000004470348),"Block",1,0,0,0,3,weapon.Handle,CFrame.new(-0.32500076293945,0.0049996376037598,-2.5974998474121)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.050000004470348,0.15000000596046,0.15000000596046),"Cylinder",1,0,0,0,3,weapon.Handle,CFrame.new(-0.47500038146973,0.0049996376037598,-1.5474987030029)*CFrame.fromOrientation(0,1.5707963267949,0),"Cylinder")
part(1,1,Vector3.new(0.050000004470348,0.15000000596046,0.15000000596046),"Cylinder",1,0,0,0,3,weapon.Handle,CFrame.new(-0.47500038146973,0.0049996376037598,-1.2474994659424)*CFrame.fromOrientation(0,1.5707963267949,0),"Cylinder")
part(1,1,Vector3.new(2.2500002384186,0.1000000089407,0.1000000089407),"Cylinder",0.38823533058167,0.37254902720451,0.38431376218796,0,3,weapon.Handle,CFrame.new(-0.47500038146973,0.0049996376037598,-1.5725002288818)*CFrame.fromOrientation(0,1.5707963267949,0),"Cylinder")
part(1,1,Vector3.new(1.3500001430511,0.15000000596046,0.15000000596046),"Cylinder",1,0,0,0,3,weapon.Handle,CFrame.new(-0.22500038146973,0.0049996376037598,-1.0974998474121)*CFrame.fromOrientation(0,1.5707963267949,0),"Cylinder")
part(1,1,Vector3.new(0.050000004470348,0.15000000596046,0.15000000596046),"Cylinder",1,0,0,0,3,weapon.Handle,CFrame.new(-0.47500038146973,0.0049996376037598,-1.0474987030029)*CFrame.fromOrientation(0,1.5707963267949,0),"Cylinder")
part(1,1,Vector3.new(0.17500001192093,0.1000000089407,0.050000004470348),"Block",1,0,0,0,3,weapon.Handle,CFrame.new(-0.38750076293945,0.0049996376037598,-2.6474990844727)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.25000002980232,0.15000000596046,1.3500001430511),"Block",1,0,0,0,3,weapon.Handle,CFrame.new(-0.35000038146973,0.0049996376037598,-1.0974998474121)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.050000004470348,0.15000000596046,0.15000000596046),"Cylinder",1,0,0,0,3,weapon.Handle,CFrame.new(-0.47500038146973,0.0049996376037598,-1.1474990844727)*CFrame.fromOrientation(0,1.5707963267949,0),"Cylinder")
part(1,1,Vector3.new(0.050000004470348,0.15000000596046,0.15000000596046),"Cylinder",1,0,0,0,3,weapon.Handle,CFrame.new(-0.47500038146973,0.0049996376037598,-1.6474990844727)*CFrame.fromOrientation(0,1.5707963267949,0),"Cylinder")
part(1,1,Vector3.new(0.050000004470348,0.15000000596046,0.15000000596046),"Cylinder",1,0,0,0,3,weapon.Handle,CFrame.new(-0.47500038146973,0.0049996376037598,-1.3474998474121)*CFrame.fromOrientation(0,1.5707963267949,0),"Cylinder")
part(1,1,Vector3.new(0.050000004470348,0.15000000596046,0.15000000596046),"Cylinder",1,0,0,0,3,weapon.Handle,CFrame.new(-0.47500038146973,0.0049996376037598,-1.4475002288818)*CFrame.fromOrientation(0,1.5707963267949,0),"Cylinder")
part(1,1,Vector3.new(0.050000004470348,0.15000000596046,0.15000000596046),"Cylinder",1,0,0,0,3,weapon.Handle,CFrame.new(-0.47500038146973,0.0049996376037598,-1.7474994659424)*CFrame.fromOrientation(0,1.5707963267949,0),"Cylinder")
part(1,1,Vector3.new(0.25000002980232,0.050000004470348,0.050000004470348),"Block",1,0,0,0,3,weapon.Handle,CFrame.new(-0.62500095367432,0.0049996376037598,-2.5725002288818)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.050000004470348,0.15000000596046,0.15000000596046),"Cylinder",1,0,0,0,3,weapon.Handle,CFrame.new(-0.47500038146973,0.0049996376037598,-0.94750022888184)*CFrame.fromOrientation(0,1.5707963267949,0),"Cylinder")
part(1,1,Vector3.new(0.050000004470348,0.1000000089407,0.15000000596046),"Block",1,0,0,0,3,weapon.Handle,CFrame.new(-0.50000095367432,0.0049996376037598,-0.49749946594238)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.050000004470348,0.15000000596046,0.15000000596046),"Cylinder",1,0,0,0,3,weapon.Handle,CFrame.new(-0.47500038146973,0.0049996376037598,-0.54749870300293)*CFrame.fromOrientation(0,1.5707963267949,0),"Cylinder")
part(1,1,Vector3.new(0.17500001192093,0.15000000596046,0.1000000089407),"Block",0.38823533058167,0.37254902720451,0.38431376218796,0,3,weapon.Handle,CFrame.new(-0.61250019073486,0.0049996376037598,-0.32250022888184)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.27500003576279,0.15000000596046,0.15000000596046),"Cylinder",0.066666670143604,0.066666670143604,0.066666670143604,0,3,weapon.Handle,CFrame.new(-0.47500038146973,0.0049996376037598,-2.8349990844727)*CFrame.fromOrientation(0,1.5707963267949,0),"Cylinder")
part(1,1,Vector3.new(0.050000004470348,0.15000000596046,0.15000000596046),"Cylinder",1,0,0,0,3,weapon.Handle,CFrame.new(-0.47500038146973,0.0049996376037598,-0.74749946594238)*CFrame.fromOrientation(0,1.5707963267949,0),"Cylinder")
part(1,1,Vector3.new(0.20000001788139,0.1000000089407,0.1000000089407),"Cylinder",1,0,0,0,3,weapon.Handle,CFrame.new(-0.52500057220459,0.0049996376037598,-0.47249984741211)*CFrame.fromOrientation(0,1.5707963267949,0),"Cylinder")
part(1,1,Vector3.new(0.050000004470348,0.15000000596046,0.15000000596046),"Cylinder",1,0,0,0,3,weapon.Handle,CFrame.new(-0.47500038146973,0.0049996376037598,-0.64749908447266)*CFrame.fromOrientation(0,1.5707963267949,0),"Cylinder")
part(1,1,Vector3.new(0.050000004470348,0.15000000596046,0.15000000596046),"Cylinder",1,0,0,0,3,weapon.Handle,CFrame.new(-0.47500038146973,0.0049996376037598,-0.84749984741211)*CFrame.fromOrientation(0,1.5707963267949,0),"Cylinder")
part(1,1,Vector3.new(0.050000004470348,0.15000000596046,0.15000000596046),"Cylinder",0.38823533058167,0.37254902720451,0.38431376218796,0,3,weapon.Handle,CFrame.new(-0.70000076293945,0.0049996376037598,-0.32250022888184)*CFrame.fromOrientation(0,1.5707963267949,0),"Cylinder")
part(1,1,Vector3.new(0.15000000596046,0.1000000089407,0.075000002980232),"Block",1,0,0,0,3,weapon.Handle,CFrame.new(-0.45000076293945,0.0049996376037598,-0.38500022888184)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.15000000596046,0.050000004470348,0.1000000089407),"Wedge",0.38823533058167,0.37254902720451,0.38431376218796,0,3,weapon.Handle,CFrame.new(-0.50000095367432,0.0049996376037598,-0.32250022888184)*CFrame.fromOrientation(0,3.1415926535898,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.075000002980232,0.1000000089407,0.1000000089407),"Block",1,0,0,0,3,weapon.Handle,CFrame.new(-0.51250076293945,0.0049996376037598,-0.29749870300293)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.25000002980232,0.050000004470348,0.050000004470348),"Block",1,0,0,0,3,weapon.Handle,CFrame.new(-0.62500095367432,0.0049996376037598,-2.4724998474121)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.075000002980232,0.075000002980232,0.45000007748604),"Block",0.38823533058167,0.37254902720451,0.38431376218796,0,1,weapon.Handle,CFrame.new(-0.51250076293945,-0.082500457763672,-0.097499847412109)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.12500001490116,0.050000004470348,0.47500005364418),"Block",0.41176474094391,0.25098040699959,0.15686275064945,0,5,weapon.Handle,CFrame.new(-0.21250057220459,0.0049996376037598,-0.10999870300293)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.32500001788139,0.050000004470348,0.050000004470348),"Block",0.41176474094391,0.25098040699959,0.15686275064945,0,5,weapon.Handle,CFrame.new(0.012499332427979,0.0049996376037598,0.0025005340576172)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.45000007748604,0.050000004470348,0.075000002980232),"Wedge",0.38823533058167,0.37254902720451,0.38431376218796,0,4,weapon.Handle,CFrame.new(-0.57500076293945,-0.082500457763672,-0.097499847412109)*CFrame.fromOrientation(-1.5707963267949,1.5707963267949,0),"Wedge")
part(1,1,Vector3.new(0.075000002980232,0.1000000089407,0.050000004470348),"Block",1,0,0,0,3,weapon.Handle,CFrame.new(-0.51250076293945,0.0049996376037598,-0.022499084472656)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.15000000596046,0.050000004470348,0.30000001192093),"Wedge",0.38823533058167,0.37254902720451,0.38431376218796,0,3,weapon.Handle,CFrame.new(-0.67500019073486,0.0049996376037598,0.20250129699707)*CFrame.fromOrientation(0,-3.1415926535898,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.050000004470348,0.050000004470348,0.15000000596046),"Block",1,0,0,0,3,weapon.Handle,CFrame.new(-0.77500057220459,0.0049996376037598,-2.5224990844727)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.050000004470348,0.15000000596046,0.32500001788139),"Block",0.38823533058167,0.37254902720451,0.38431376218796,0,3,weapon.Handle,CFrame.new(-0.67500019073486,0.0049996376037598,-0.10999870300293)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.20000001788139,0.1000000089407,0.97500014305115),"Block",1,0,0,0,3,weapon.Handle,CFrame.new(-0.37500047683716,0.0049996376037598,0.14000129699707)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.050000004470348,0.075000002980232,0.050000004470348),"Wedge",0.41176474094391,0.25098040699959,0.15686275064945,0,5,weapon.Handle,CFrame.new(0.21249961853027,0.0049996376037598,0.0025005340576172)*CFrame.fromOrientation(0,0,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.35000002384186,0.050000004470348,0.050000004470348),"Block",0.38823533058167,0.37254902720451,0.38431376218796,0,3,weapon.Handle,CFrame.new(-0.87500095367432,-0.045000553131104,-0.32250022888184)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.050000004470348,0.050000004470348,0.050000004470348),"Block",1,0,0,0,3,weapon.Handle,CFrame.new(-0.87500095367432,0.0049996376037598,-0.32250022888184)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.35000002384186,0.050000004470348,0.050000004470348),"Block",0.38823533058167,0.37254902720451,0.38431376218796,0,3,weapon.Handle,CFrame.new(-0.87500095367432,0.054999351501465,-0.32250022888184)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.17500001192093,0.15000000596046,0.35000002384186),"Block",0.38823533058167,0.37254902720451,0.38431376218796,0,3,weapon.Handle,CFrame.new(-0.56250095367432,0.0049996376037598,0.17749977111816)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.050000004470348,0.1000000089407,0.15000000596046),"Wedge",0.38823533058167,0.37254902720451,0.38431376218796,0,3,weapon.Handle,CFrame.new(-0.85000038146973,0.0049996376037598,-2.5224990844727)*CFrame.fromOrientation(0,0,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.075000002980232,0.1000000089407,0.35000002384186),"Block",1,0,0,0,3,weapon.Handle,CFrame.new(-0.58750057220459,0.0049996376037598,-0.17249870300293)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.050000004470348,0.075000002980232,0.30000001192093),"Wedge",0.41176474094391,0.25098040699959,0.15686275064945,0,5,weapon.Handle,CFrame.new(0.024999618530273,0.0049996376037598,0.065000534057617)*CFrame.fromOrientation(0,1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.050000004470348,0.075000002980232,0.075000002980232),"Wedge",0.41176474094391,0.25098040699959,0.15686275064945,0,5,weapon.Handle,CFrame.new(0.21249961853027,0.0049996376037598,0.065000534057617)*CFrame.fromOrientation(0,3.1415926535898,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.050000004470348,0.1000000089407,0.32500001788139),"Wedge",0.41176474094391,0.25098040699959,0.15686275064945,0,5,weapon.Handle,CFrame.new(0.012499332427979,0.0049996376037598,-0.072500228881836)*CFrame.fromOrientation(0,-1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.050000004470348,0.050000004470348,0.050000004470348),"Block",1,0,0,0,3,weapon.Handle,CFrame.new(-1.0250005722046,0.0049996376037598,-0.32250022888184)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.1000000089407,0.15000000596046,0.27500003576279),"Block",0.38823533058167,0.37254902720451,0.38431376218796,0,3,weapon.Handle,CFrame.new(-0.52500057220459,0.0049996376037598,0.48999977111816)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.050000004470348,0.12500001490116,0.20000001788139),"Wedge",0.41176474094391,0.25098040699959,0.15686275064945,0,5,weapon.Handle,CFrame.new(-0.21250057220459,0.0049996376037598,0.22750091552734)*CFrame.fromOrientation(0,3.1415926535898,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.45000007748604,0.15000000596046,0.15000000596046),"Cylinder",0.38823533058167,0.37254902720451,0.38431376218796,0,3,weapon.Handle,CFrame.new(-0.57500076293945,0.0049996376037598,0.57750129699707)*CFrame.fromOrientation(0,1.5707963267949,0),"Cylinder")
part(1,1,Vector3.new(0.15000000596046,0.30000001192093,0.35000002384186),"Wedge",0.066666670143604,0.066666670143604,0.066666670143604,0,3,weapon.Handle,CFrame.new(-0.10000038146973,0.0049996376037598,0.85250091552734)*CFrame.fromOrientation(0,0,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.32500001788139,0.15000000596046,0.45000007748604),"Block",0.066666670143604,0.066666670143604,0.066666670143604,0,3,weapon.Handle,CFrame.new(-0.41250038146973,0.0049996376037598,0.85250091552734)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.15000000596046,0.1000000089407,0.17500001192093),"Wedge",0.066666670143604,0.066666670143604,0.066666670143604,0,3,weapon.Handle,CFrame.new(-0.72500038146973,0.0049996376037598,0.89000129699707)*CFrame.fromOrientation(0,0,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.1000000089407,0.15000000596046,0.1000000089407),"Block",0.066666670143604,0.066666670143604,0.066666670143604,0,3,weapon.Handle,CFrame.new(-0.72500038146973,0.0049996376037598,1.0275001525879)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.1000000089407,0.15000000596046,0.27500003576279),"Block",0.066666670143604,0.066666670143604,0.066666670143604,0,3,weapon.Handle,CFrame.new(-0.62500095367432,0.0049996376037598,0.94000053405762)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.30000001192093,0.15000000596046,0.050000004470348),"Block",0.066666670143604,0.066666670143604,0.066666670143604,0,3,weapon.Handle,CFrame.new(-0.10000038146973,0.0049996376037598,1.0525016784668)*CFrame.fromOrientation(0,0,0),"Block")

local ammo = 100
local backup = false
local reloading = false
local recoil = 0

local screengu = Instance.new("ScreenGui", play.PlayerGui)
screengu.Enabled = true

local makegui = function(pos1,pos2,tex)
local a = Instance.new("TextLabel",screengu)
a.Size = UDim2.new(1, 0,.05, 0)
a.Text = tex
a.Position = UDim2.new(pos1,0,pos2,0)
a.TextScaled = true
a.TextColor3 = char.Torso.Color
a.TextXAlignment = "Left"
a.BackgroundTransparency = 1
coroutine.resume(coroutine.create(function()
while true do
a.Text = ""..ammo.." R //"
wait()
end
end))
end

makegui(0.8,.9,"[h]")

local reload = function()
	attack = true
	reloading = true
	for i = 0,1,0.05 do
	char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.15)
	char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
	RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(0)), 0.15)
	wait()
	end
	for i = 0,1,0.1 do
	char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.15)
	char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
	RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(0)), 0.15)
	LW.C0 = clerp(LW.C0, CFrame.new(-.25, 0.5 - 0.1 * math.cos((sine) / 15), -.5) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(45)), 0.15)
	wait()
	end
	weapon.Mag.Transparency = 1
	CreateSound("rbxassetid://456179899", weapon.Mag, .5, 1)
	local fakemag = Instance.new("Part", nolagplease)
	fakemag.Size = weapon.Mag.Size
	fakemag.CFrame = weapon.Mag.CFrame
	fakemag.BrickColor = weapon.Mag.BrickColor
	fakemag.Material = weapon.Mag.Material
	game:GetService("Debris"):AddItem(fakemag, 1)
	for i = 0,1,0.1 do
	char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.15)
	char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
	RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(90), math.rad(0)), 0.15)
	LW.C0 = clerp(LW.C0, CFrame.new(-.25, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(45)), 0.15)
	wait()
	end
	for i = 0,1,0.05 do
	char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.15)
	char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
	RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(0)), 0.15)
	LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), -.5) * CFrame.Angles(math.rad(-20), math.rad(0), math.rad(10)), 0.15)
	wait()
	end
	local fakemag2 = Instance.new("Part", nolagplease)
	fakemag2.Size = weapon.Mag.Size
	fakemag2.CFrame = weapon.Mag.CFrame
	fakemag2.BrickColor = weapon.Mag.BrickColor
	fakemag2.Material = weapon.Mag.Material
	local fakeweld = Instance.new("Weld", fakemag2)
	fakeweld.Part0 = LeftArm
	fakeweld.Part1 = fakemag2
	fakeweld.C0 = CFrame.new(0,-1,0)
	for i = 0,1,0.1 do
	char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.15)
	char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
	RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(0)), 0.15)
	LW.C0 = clerp(LW.C0, CFrame.new(0.2, 0.3 - 0.1 * math.cos((sine) / 15), -.5) * CFrame.Angles(math.rad(90), math.rad(20), math.rad(45)), 0.15)
	wait()
	end
	fakemag2:Destroy()
	weapon.Mag.Transparency = 0
	CreateSound("rbxassetid://456179899", weapon.Mag, .5, 1.5)
	for i = 0,1,0.1 do
	char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.15)
	char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
	RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(0)), 0.15)
	LW.C0 = clerp(LW.C0, CFrame.new(0.2, 0.3 - 0.1 * math.cos((sine) / 15), -.5) * CFrame.Angles(math.rad(90), math.rad(20), math.rad(45)), 0.15)
	wait()
	end
	
	reloading = false
	ammo = 100
	attack = false
end

local fire = function()
	backup = true
	while charging == true do
		if ammo > 0 and reloading == false then
			local bull = Instance.new("Part", nolagplease)
			bull.Shape = "Cylinder"
			bull.Size = Vector3.new(.2,.1,.1)
			bull.BrickColor = char.Torso.BrickColor
			bull.CFrame = weapon.Eject.CFrame * CFrame.fromEulerAnglesXYZ(0,math.rad(90),0)
			local bull2 = Instance.new("Part", bull)
			bull2.Shape = "Ball"
			bull2.Size = Vector3.new(.1,.1,.1)
			bull2.Material = "Neon"
			bull2.BrickColor = BrickColor.new("New Yeller")
			local weld = Instance.new("Weld", bull)
			weld.Part0 = bull
			weld.Part1 = bull2
			weld.C0 = CFrame.new(.1,0,0)
			local body = Instance.new("BodyThrust", bull)
			body.Force = Vector3.new(0,math.random(1,60)/120,-.1)
			game:GetService("Debris"):AddItem(body, .1)
			game:GetService("Debris"):AddItem(bull, 5)
			ammo = ammo - 1
			CreateSound("rbxassetid://1112854510", weapon.Barrel, .1, 1)
			if recoil < 6 then
			recoil = recoil + 2.25
			end
			shoottrail(weapon.ShootPart, weapon.Barrel, 0, 1)
			block(weapon.Barrel.CFrame,Vector3.new(0.5,0.5,0.5),Vector3.new(.05,.05,.05),0.1,char.Torso.BrickColor,1)
		end
		wait(.05)
		if ammo < 1 then
			charging = false
		end
	end
	if ammo < 1 then
		reload()
	end
	wait(.1)
	backup = false
end


play:GetMouse().Button1Down:connect(function()
	if attack == false and charging == false then
		charging = true
		fire()
	end
end)

play:GetMouse().Button1Up:connect(function()
	if charging == true then
		charging = false
	end
end)

play:GetMouse().KeyDown:connect(function(k)
	
	k = k:lower()
	if k == "r" and reloading == false and attack == false then
		reload()
	elseif k == "q" and attack == false then
		
	end
end)

local keke = 0
local aim = CFrame.new(char.HumanoidRootPart.Position, play:GetMouse().Hit.p)
local direction = aim.lookVector
local headingA = math.atan2(direction.x, direction.z)
local headingB = math.atan(direction.y)
char.Humanoid.AutoRotate = false


coroutine.resume(coroutine.create(function()
while true do
aim = CFrame.new(char.HumanoidRootPart.Position, play:GetMouse().Hit.p)
direction = aim.lookVector
headingA = math.atan2(direction.x, direction.z)
headingA = math.deg(headingA)
headingB = math.atan(direction.y)
headingB = math.deg(headingB)
char.Humanoid.AutoRotate = false
char.HumanoidRootPart.CFrame = CFrame.new(char.HumanoidRootPart.Position) * CFrame.Angles(math.rad(0), math.rad(headingA - 180), math.rad(0))
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
							char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-70)), 0.3)
							char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(70)), 0.3)
							RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), -.5) * CFrame.Angles(math.rad(90), math.rad((-headingB*1.5)), math.rad(-70)), 0.3)
							LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90+(headingB*1.5)), math.rad(0), math.rad(45)), 0.3)
							weapon.Handle.Weld.C0 = clerp(weapon.Handle.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles(math.rad(-90), math.rad(0), math.rad(-90)), 0.3)
							end
							RH.C0 = clerp(RH.C0, CFrame.new(1, -1 + 0.1 * math.cos((sine) / 20), 0) * RHCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
							LH.C0 = clerp(LH.C0, CFrame.new(-1, -1 + 0.1 * math.cos((sine) / 20), 0.1) * LHCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)	
					elseif 2 < torsovel then
							Anim = "Walk"
								if attack == false and sit == false then
								char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-70)), 0.3)
								char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(70)), 0.3)
								RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), -.5) * CFrame.Angles(math.rad(90), math.rad((-headingB*1.5)), math.rad(-70)), 0.3)
								LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90+(headingB*1.5)), math.rad(0), math.rad(45)), 0.3)
								weapon.Handle.Weld.C0 = clerp(weapon.Handle.Weld.C0, CFrame.new(0, -1, 0) * CFrame.Angles(math.rad(-90), math.rad(0), math.rad(-90)), 0.3)
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