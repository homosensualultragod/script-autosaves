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
	local changed = false
	if mouse == play:GetMouse() then
	MainPos2 = mouse.Hit.p + SpreadVectors
	else
		MainPos2 = mouse.Position
	end
	local MouseLook = CFrame.new((MainPos + MainPos2) / 2, MainPos2)
	local speed = 1
	if rage == true then
		speed = speed * 2
	end
	local num = 100*(1+(charge/5))
	local charge2 = charge
	charge = 1
	coroutine.resume(coroutine.create(function()
		
		repeat
			local hit, pos = rayCast(MainPos, MouseLook.lookVector, speed, char.HumanoidRootPart.Parent)
			local mag = (MainPos - pos).magnitude
			Laser(char.Torso.BrickColor, CFrame.new((MainPos + pos) / 2, pos) * CFrame.Angles(1.57, 0, 0), .1, mag *(-speed / (speed / 2)), .1, -.05, 0, -.05, .1)
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
				block(CFrame.new((MainPos + pos) / 2, pos),Vector3.new(1*charge2,1*charge2,1*charge2),Vector3.new(.1,.1,.1),.05,char.Torso.BrickColor,1)
				print(hit.Name)
				if hit.Name == "Handle" then
					hit.Parent = workspace
				end
				if hit.Name == "Right Leg" then
					hit.Parent.Humanoid.Health = hit.Parent.Humanoid.Health - 10
					changed = true
				elseif hit.Name == "Left Leg" then
					hit.Parent.Humanoid.Health = hit.Parent.Humanoid.Health - 10
					changed = true
				elseif hit.Name == "Left Arm" then
					hit.Parent.Humanoid.Health = hit.Parent.Humanoid.Health - 10
					changed = true
				elseif hit.Name == "Right Arm" then
					hit.Parent.Humanoid.Health = hit.Parent.Humanoid.Health - 10
					changed = true
				elseif hit.Name == "Torso" then
					hit.Parent.Humanoid.Health = hit.Parent.Humanoid.Health - 30
					changed = true
				elseif hit.Name == "Head" then
					hit.Parent.Humanoid.Health = hit.Parent.Humanoid.Health - 60
					changed = true
				elseif hit.Name ~= "Base" and changed == false then
					hit.Anchored = false
					hit.Position = hit.Position + Vector3.new(0,0.01,0)
					hit.CFrame = hit.CFrame * CFrame.fromEulerAnglesXYZ(math.rad(math.random(0,180)),math.rad(math.random(0,180)),math.rad(math.random(0,180)))
					hit.CanCollide = true
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

part(1,1,Vector3.new(0.10000000149012,0.15000000596046,0.10000000149012),"Block",char.Torso.BrickColor,1,"Neon",RightArm,CFrame.new(0.0022170406300575,0.0043891649693251,-0.0023460388183594)*CFrame.fromOrientation(0,0,0),"Handle")
part(1,1,Vector3.new(0.050000000745058,0.050000000745058,0.050000000745058),"Block",char.Torso.BrickColor,1,"Neon",weapon.Handle,CFrame.new(-0.34774854779243,0.004332659766078,-2.7023277282715)*CFrame.fromOrientation(0,0,0),"Shoot11")
part(1,1,Vector3.new(0.050000000745058,0.050000000745058,0.050000000745058),"Block",char.Torso.BrickColor,1,"Neon",weapon.Handle,CFrame.new(-0.34774187207222,0.0043250303715467,-2.502326965332)*CFrame.fromOrientation(0,0,0),"Shoot1")

part(1,1,Vector3.new(0.15000000596046,0.10000000149012,0.050000000745058),"Wedge",char.Torso.BrickColor,0,"Metal",weapon.Handle,CFrame.new(-0.37274006009102,0.0043667536228895,0.19766235351563)*CFrame.fromOrientation(0,1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.15000000596046,0.10000000149012,0.10000000149012),"Block",char.Torso.BrickColor,0,"Metal",weapon.Handle,CFrame.new(-0.42272737622261,0.0043681841343641,-0.10233688354492)*CFrame.fromOrientation(0,0,0.00017453292129832),"Block")
part(1,1,Vector3.new(0.10000000149012,0.15000000596046,0.60000002384186),"Block",char.Torso.BrickColor,0,"Metal",weapon.Handle,CFrame.new(-0.2477510124445,0.0043877344578505,-0.052349090576172)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.10000000149012,0.050000000745058,0.050000000745058),"Wedge",char.Torso.BrickColor,0,"Metal",weapon.Handle,CFrame.new(-0.17276121675968,0.0043929796665907,-0.12734222412109)*CFrame.fromOrientation(0,-1.5707963267949,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.10000000149012,0.15000000596046,0.90000009536743),"Block",char.Torso.BrickColor,0,"Metal",weapon.Handle,CFrame.new(-0.24782873690128,0.0044277887791395,-1.0523452758789)*CFrame.fromOrientation(0,0,0.00017453292129832),"Block")
part(1,1,Vector3.new(0.050000000745058,0.15000000596046,0.050000000745058),"Block",char.Torso.BrickColor,0,"Metal",weapon.Handle,CFrame.new(-0.27279737591743,0.0044065695255995,-0.57734680175781)*CFrame.fromOrientation(0,0,0.00017453292129832),"Block")
part(1,1,Vector3.new(0.85000002384186,0.15000000596046,0.15000000596046),"Cylinder",char.Torso.BrickColor,0,"Metal",weapon.Handle,CFrame.new(-0.52273291349411,0.0043479185551405,-0.32732772827148)*CFrame.fromOrientation(0,1.5707963267949,0),"Cylinder")
part(1,1,Vector3.new(0.15000000596046,0.15000000596046,0.15000000596046),"Ball",char.Torso.BrickColor,0,"Metal",weapon.Handle,CFrame.new(-0.34776571393013,0.0043870192021132,0.14765548706055)*CFrame.fromOrientation(0,0,0),"Ball")
part(1,1,Vector3.new(1.3000000715256,0.10000000149012,0.10000000149012),"Cylinder",char.Torso.BrickColor,0,"Metal",weapon.Handle,CFrame.new(-0.34773471951485,0.0043283682316542,-1.8523254394531)*CFrame.fromOrientation(0,1.5707963267949,0),"Cylinder")
part(1,1,Vector3.new(136.2000000715256,0.10000000149012,0.10000000149012),"Cylinder",char.Torso.BrickColor,.7,"Neon",weapon.Handle,CFrame.new(-0.34773471951485,0.0043283682316542,-70.602)*CFrame.fromOrientation(0,1.5707963267949,0),"Cylinder")
part(1,1,Vector3.new(0.10000000149012,0.15000000596046,0.20000000298023),"Block",char.Torso.BrickColor,0,"Metal",weapon.Handle,CFrame.new(-0.24778820574284,0.0044046621769667,-0.45234680175781)*CFrame.fromOrientation(0,0,0.00017453292129832),"Block")
part(1,1,Vector3.new(0.075000002980232,0.15000000596046,0.85000002384186),"Block",char.Torso.BrickColor,0,"Metal",weapon.Handle,CFrame.new(-0.48521879315376,0.0043319445103407,-0.32733154296875)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.15000000596046,0.050000000745058,0.050000000745058),"Wedge",char.Torso.BrickColor,0,"Metal",weapon.Handle,CFrame.new(-0.37274006009102,0.0043705683201551,0.12266540527344)*CFrame.fromOrientation(0,0,1.5707963267949),"Wedge")
part(1,1,Vector3.new(1.6499999761581,0.15000000596046,0.20000000298023),"Cylinder",char.Torso.BrickColor,0,"Metal",weapon.Handle,CFrame.new(-0.34773281216621,0.0043517332524061,-0.67733001708984)*CFrame.fromOrientation(0,1.5707963267949,0),"Cylinder")
part(1,1,Vector3.new(0.15000000596046,0.10000000149012,0.10000000149012),"Block",char.Torso.BrickColor,0,"Metal",weapon.Handle,CFrame.new(-0.42276075482368,0.0043894033879042,-0.65233612060547)*CFrame.fromOrientation(0,0,0.00017453292129832),"Block")
part(1,1,Vector3.new(0.10000000149012,0.050000000745058,0.050000000745058),"Wedge",char.Torso.BrickColor,0,"Metal",weapon.Handle,CFrame.new(-0.1727519184351,0.0043932180851698,-0.17735290527344)*CFrame.fromOrientation(0,0,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.15000000596046,0.20000000298023,0.10000000149012),"Wedge",char.Torso.BrickColor,0,"Metal",weapon.Handle,CFrame.new(-0.14781548082829,0.0043722372502089,-0.45235824584961)*CFrame.fromOrientation(0,-1.5706217565854,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.050000000745058,0.15000000596046,1.7500001192093),"Block",char.Torso.BrickColor,0,"Metal",weapon.Handle,CFrame.new(-0.32279947400093,0.0044032316654921,-0.62734222412109)*CFrame.fromOrientation(0,0,0.00017453292129832),"Block")
part(1,1,Vector3.new(0.15000000596046,0.050000000745058,0.050000000745058),"Wedge",char.Torso.BrickColor,0,"Metal",weapon.Handle,CFrame.new(-0.22282983362675,0.0043650846928358,-0.57734680175781)*CFrame.fromOrientation(0,-1.5706217565854,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.90000009536743,0.15000000596046,0.20000000298023),"Cylinder",char.Torso.BrickColor,0,"Metal",weapon.Handle,CFrame.new(-0.19773270189762,0.0043555479496717,-1.0523300170898)*CFrame.fromOrientation(0,1.5707963267949,0),"Cylinder")

part(1,1,Vector3.new(0.20000000298023,0.10000000149012,0.050000000745058),"Block",BrickColor.new("Dark stone grey"),0,"Metal",weapon.Handle,CFrame.new(0.25758573412895,0.0043855886906385,-0.089298248291016)*CFrame.fromOrientation(0,1.249132140326,0),"Block")
part(1,1,Vector3.new(0.10000000149012,0.30000001192093,0.15000000596046),"Wedge",BrickColor.new("Dark stone grey"),0,"Metal",weapon.Handle,CFrame.new(-0.072777770459652,0.0043903570622206,0.39765167236328)*CFrame.fromOrientation(0,-1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.20000000298023,0.10000000149012,0.050000000745058),"Block",BrickColor.new("Dark stone grey"),0,"Metal",weapon.Handle,CFrame.new(0.13107632100582,0.0043956022709608,-0.3422737121582)*CFrame.fromOrientation(0,1.249132140326,0),"Block")
part(1,1,Vector3.new(0.050000000745058,0.10000000149012,0.20000000298023),"Block",BrickColor.new("Dark stone grey"),0,"Metal",weapon.Handle,CFrame.new(0.16270564496517,0.0043920259922743,-0.19997406005859)*CFrame.fromOrientation(0,1.249132140326,0),"Block")
part(1,1,Vector3.new(0.050000000745058,0.10000000149012,0.45000004768372),"Block",BrickColor.new("Dark stone grey"),0,"Metal",weapon.Handle,CFrame.new(-0.082399629056454,0.0044080000370741,-0.49246215820313)*CFrame.fromOrientation(0,1.249132140326,0),"Block")
part(1,1,Vector3.new(0.75000005960464,0.10000000149012,0.10000000149012),"Cylinder",BrickColor.new("Dark stone grey"),0,"Metal",weapon.Handle,CFrame.new(-0.19773627817631,0.0043450575321913,-1.5773277282715)*CFrame.fromOrientation(0,1.5707963267949,0),"Cylinder")
part(1,1,Vector3.new(0.55000001192093,0.10000000149012,0.050000000745058),"Block",BrickColor.new("Dark stone grey"),0,"Metal",weapon.Handle,CFrame.new(0.139005407691,0.0043872576206923,0.26646041870117)*CFrame.fromOrientation(0,1.249132140326,0),"Block")
part(1,1,Vector3.new(0.10000000149012,0.10000000149012,0.25),"Block",BrickColor.new("Dark stone grey"),0,"Metal",weapon.Handle,CFrame.new(-0.19776393473148,0.0043851118534803,0.37265014648438)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.15000000596046,0.10000000149012,0.20000000298023),"Wedge",BrickColor.new("Dark stone grey"),0,"Metal",weapon.Handle,CFrame.new(-0.19778133928776,0.0043898802250624,0.44765472412109)*CFrame.fromOrientation(0,-1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.10000000149012,0.20000000298023,0.10000000149012),"Wedge",BrickColor.new("Dark stone grey"),0,"Metal",weapon.Handle,CFrame.new(-0.29775932431221,0.0043810587376356,0.34765625)*CFrame.fromOrientation(0,1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.10000000149012,0.10000000149012,0.10000000149012),"Block",BrickColor.new("Dark stone grey"),0,"Metal",weapon.Handle,CFrame.new(-0.39788797497749,0.0044442396610975,-1.9023361206055)*CFrame.fromOrientation(0,0,0.00017453292129832),"Block")
part(1,1,Vector3.new(0.20000000298023,0.15000000596046,0.30000001192093),"Block",BrickColor.new("Dark stone grey"),0,"Metal",weapon.Handle,CFrame.new(-0.19778133928776,0.0043898802250624,0.64765548706055)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.15000000596046,0.050000000745058,0.20000000298023),"Wedge",BrickColor.new("Dark stone grey"),0,"Metal",weapon.Handle,CFrame.new(-0.19778133928776,0.0043898802250624,0.82265472412109)*CFrame.fromOrientation(0,-1.5707963267949,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.050000000745058,0.15000000596046,0.15000000596046),"Block",BrickColor.new("Dark stone grey"),0,"Metal",weapon.Handle,CFrame.new(-0.072781346738338,0.0043898802250624,0.62265777587891)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.15000000596046,0.10000000149012,0.050000000745058),"Wedge",BrickColor.new("Dark stone grey"),0,"Metal",weapon.Handle,CFrame.new(-0.072781346738338,0.0043898802250624,0.74765777587891)*CFrame.fromOrientation(0,-1.5707963267949,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.15000000596046,0.050000000745058,0.050000000745058),"Wedge",BrickColor.new("Dark stone grey"),0,"Metal",weapon.Handle,CFrame.new(-0.072781346738338,0.0043898802250624,0.52265548706055)*CFrame.fromOrientation(0,-1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.15000000596046,0.10000000149012,0.10000000149012),"Block",BrickColor.new("Dark stone grey"),0,"Metal",weapon.Handle,CFrame.new(-0.27288749814034,0.0044578295201063,-1.90234375)*CFrame.fromOrientation(0,0,0.00017453292129832),"Block")
part(1,1,Vector3.new(0.050000000745058,0.10000000149012,0.20000000298023),"Block",BrickColor.new("Dark stone grey"),0,"Metal",weapon.Handle,CFrame.new(-0.17275716364384,0.0043851118534803,0.14765167236328)*CFrame.fromOrientation(0,0,0),"Block")

part(1,1,Vector3.new(0.10000000149012,0.050000000745058,0.050000000745058),"Wedge",BrickColor.new("Reddish brown"),0,"Wood",weapon.Handle,CFrame.new(-0.1727609783411,0.0043929796665907,-0.12734222412109)*CFrame.fromOrientation(0,1.5707963267949,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.10000000149012,0.10000000149012,0.050000000745058),"Wedge",BrickColor.new("Reddish brown"),0,"Wood",weapon.Handle,CFrame.new(0.0022449356038123,0.0043927412480116,0.072662353515625)*CFrame.fromOrientation(0,-3.1415926535898,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.10000000149012,0.10000000149012,0.050000000745058),"Wedge",BrickColor.new("Reddish brown"),0,"Wood",weapon.Handle,CFrame.new(-0.097762130200863,0.0043922644108534,-0.12734222412109)*CFrame.fromOrientation(0,0,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.050000000745058,0.15000000596046,0.10000000149012),"Block",BrickColor.new("Reddish brown"),0,"Wood",weapon.Handle,CFrame.new(-0.072775386273861,0.0043903570622206,0.84765243530273)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.050000000745058,0.10000000149012,0.15000000596046),"Block",BrickColor.new("Reddish brown"),0,"Wood",weapon.Handle,CFrame.new(-0.17275716364384,0.0043922644108534,-0.027339935302734)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.10000000149012,0.10000000149012,0.050000000745058),"Wedge",BrickColor.new("Reddish brown"),0,"Wood",weapon.Handle,CFrame.new(0.10225532203913,0.0043958406895399,0.12265014648438)*CFrame.fromOrientation(0,-3.1414179502223,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.050000000745058,0.15000000596046,0.15000000596046),"Cylinder",BrickColor.new("Reddish brown"),0,"Wood",weapon.Handle,CFrame.new(-0.52273291349411,0.0043569784611464,0.12267303466797)*CFrame.fromOrientation(0,1.5707963267949,0),"Cylinder")
part(1,1,Vector3.new(0.10000000149012,0.15000000596046,0.050000000745058),"Wedge",BrickColor.new("Reddish brown"),0,"Wood",weapon.Handle,CFrame.new(0.17724846303463,0.0043817739933729,0.072666168212891)*CFrame.fromOrientation(0,-1.5707963267949,-1.5709707638463),"Wedge")
part(1,1,Vector3.new(0.10000000149012,0.10000000149012,0.15000000596046),"Block",BrickColor.new("Reddish brown"),0,"Wood",weapon.Handle,CFrame.new(-0.097757361829281,0.0043922644108534,-0.02734375)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.10000000149012,0.10000000149012,0.10000000149012),"Block",BrickColor.new("Reddish brown"),0,"Wood",weapon.Handle,CFrame.new(0.10224292427301,0.0043901186436415,0.04766845703125)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.15000000596046,0.050000000745058,0.45000004768372),"Wedge",BrickColor.new("Reddish brown"),0,"Wood",weapon.Handle,CFrame.new(0.12721751630306,0.0043841581791639,0.72265625)*CFrame.fromOrientation(0,0,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.20000000298023,0.15000000596046,0.050000000745058),"Block",BrickColor.new("Reddish brown"),0,"Wood",weapon.Handle,CFrame.new(-0.19777871668339,0.004388926550746,0.87265777587891)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.15000000596046,0.15000000596046,0.40000000596046),"Block",BrickColor.new("Reddish brown"),0,"Wood",weapon.Handle,CFrame.new(0.027218567207456,0.0043898802250624,0.69765472412109)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.10000000149012,0.10000000149012,0.050000000745058),"Wedge",BrickColor.new("Reddish brown"),0,"Wood",weapon.Handle,CFrame.new(0.0022399288136512,0.0043925028294325,-0.077346801757813)*CFrame.fromOrientation(0,0,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.15000000596046,0.050000000745058,0.10000000149012),"Wedge",BrickColor.new("Reddish brown"),0,"Wood",weapon.Handle,CFrame.new(-0.072780631482601,0.0043903570622206,0.74765777587891)*CFrame.fromOrientation(0,0,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.10000000149012,0.10000000149012,0.10000000149012),"Block",BrickColor.new("Reddish brown"),0,"Wood",weapon.Handle,CFrame.new(0.0022427898366004,0.0043917875736952,-0.0023422241210938)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.15000000596046,0.050000000745058,0.050000000745058),"Wedge",BrickColor.new("Reddish brown"),0,"Wood",weapon.Handle,CFrame.new(-0.072772525250912,0.0043829660862684,0.52265548706055)*CFrame.fromOrientation(0,1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.15000000596046,0.050000000745058,0.20000000298023),"Wedge",BrickColor.new("Reddish brown"),0,"Wood",weapon.Handle,CFrame.new(0.0022148948628455,0.0043863039463758,0.92265319824219)*CFrame.fromOrientation(0,1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.15000000596046,0.050000000745058,0.20000000298023),"Wedge",BrickColor.new("Reddish brown"),0,"Wood",weapon.Handle,CFrame.new(-0.19778133928776,0.0043898802250624,0.82265472412109)*CFrame.fromOrientation(0,1.5707963267949,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.15000000596046,0.050000000745058,0.20000000298023),"Wedge",BrickColor.new("Reddish brown"),0,"Wood",weapon.Handle,CFrame.new(-0.19778181612492,0.0043891649693251,0.92265319824219)*CFrame.fromOrientation(0,-1.5707963267949,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.10000000149012,0.15000000596046,0.050000000745058),"Wedge",BrickColor.new("Reddish brown"),0,"Wood",weapon.Handle,CFrame.new(0.12723968923092,0.0043910723179579,-0.027351379394531)*CFrame.fromOrientation(0,0,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.15000000596046,0.050000000745058,0.10000000149012),"Wedge",BrickColor.new("Reddish brown"),0,"Wood",weapon.Handle,CFrame.new(-0.32278183102608,0.0043898802250624,0.89765548706055)*CFrame.fromOrientation(0,0,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.050000000745058,0.15000000596046,0.15000000596046),"Cylinder",BrickColor.new("Reddish brown"),0,"Wood",weapon.Handle,CFrame.new(-0.52273291349411,0.0043388586491346,-0.77732849121094)*CFrame.fromOrientation(0,1.5707963267949,0),"Cylinder")

local recoil = 0
local ammo = 6

attack1 = function()
	combo = 2
	shoottrail(weapon.Shoot11, weapon.Shoot1, 0, 1)
	block(weapon.Shoot1.CFrame,Vector3.new(.5,.5,.5),Vector3.new(.05,.05,.05),.05,char.Torso.BrickColor,1)
	CreateSound("rbxassetid://136523485",weapon.Shoot1,.5,1)
	recoil = recoil + 15
	ammo = ammo - 1
	wait(0.18018018)
	combo = 1
end

reload = function()
	combo = 2
	while recoil >= 0.1 do
		wait()
	end
	wait(.5)
	ammo = 6
	combo = 1
end


play:GetMouse().Button1Down:connect(function()
	if attack == false then
		if combo == 1 and attack == false and ammo > 0 then
			attack1()
		elseif ammo < 1 and combo == 1 then
			reload()
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
	if recoil >= 360 then
		recoil = recoil - 360
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
							if recoil >= 0.5 then
								recoil = recoil - 0.5
							end
							if attack == false and sit == false then
							char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-30)), 0.3)
							char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(30)), 0.3)
							RW.C0 = clerp(RW.C0, CFrame.new(1, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(-30)), 0.3)
							LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), -.5) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(60)), 0.3)
							weapon.Handle.Weld.C0 = clerp(weapon.Handle.Weld.C0, CFrame.new(0, -1, -.2) * CFrame.Angles(math.rad(-90+(headingB)+recoil), math.rad(0), math.rad(-90)), 0.3)
							end
							RH.C0 = clerp(RH.C0, CFrame.new(1, -1 + 0.1 * math.cos((sine) / 20), 0) * RHCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
							LH.C0 = clerp(LH.C0, CFrame.new(-1, -1 + 0.1 * math.cos((sine) / 20), 0.1) * LHCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)	
					elseif 2 < torsovel then
							Anim = "Walk"
								if attack == false and sit == false then
								char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-30)), 0.3)
								char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(30)), 0.3)
								RW.C0 = clerp(RW.C0, CFrame.new(1, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(-30)), 0.3)
								LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), -.5) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(60)), 0.3)
								weapon.Handle.Weld.C0 = clerp(weapon.Handle.Weld.C0, CFrame.new(0, -1, -.2) * CFrame.Angles(math.rad(-90+(headingB)+recoil), math.rad(0), math.rad(-90)), 0.3)
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