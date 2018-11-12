wait(.3)
local play = game.Players.LocalPlayer
local char = play.Character
char["Body Colors"].HeadColor = BrickColor.new("Seashell")
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
local charge = 1
local canmove = true
local sped = 1
local riding = false
local sine = 0
local torsovel = 0
local sheathed = true
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

ball = function(cfram,size,expansize,transp,color,kind)
local p = Instance.new("Part", nolagplease)
p.CFrame = cfram
p.Size = Vector3.new(1,1,1)
local pm = Instance.new("SpecialMesh", p)
pm.MeshType = "Sphere"
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
					showdam(dam,head,Color3.new(1,1,0))
				end
			end
		end
	end
end

magnslic = function(dam,par,dist)
	
	for _,c in pairs(workspace:children()) do
		local hum = c:findFirstChild("Humanoid")
		if hum ~= nil then
			local head = c:findFirstChild("Head")
			local deb = c:findFirstChild("debounce")
			if head ~= nil and deb == nil then
				local targ = head.Position - par.Position
				local mag = targ.magnitude
				if mag <= dist and c.Name ~= play.Name then
					coroutine.resume(coroutine.create(function()
					local deb = Instance.new("NumberValue", head.Parent)
					deb.Name = "debounce"
					while attack == true do
					wait()
					end
					for i = 0,14 do
					hum.Health = hum.Health - dam
					ball(head.CFrame * CFrame.new(0,-1.5,0),weapon.Hitbox.Size,Vector3.new(1,0,0),.1,BrickColor.new("New Yeller"),1)
					showdam(dam,head,Color3.new(1,1,0))
					CreateSound("rbxassetid://935843979",char.Torso,.5,1.25)
					wait(.1)
					end
					deb:Destroy()
					end))
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
	q.Color = Color3.new(1,1,0)
elseif r == 0.5 and g == 0.5 and b == 0.5 then
	q.Reflectance = 0.5
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
	q.Color = Color3.new(1,1,0)
elseif r == 0.5 and g == 0.5 and b == 0.5 then
	q.Reflectance = 0.5
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

part(1,1,Vector3.new(0.20000000298023,0.20000000298023,0.20000000298023),"Block",0,0,0,1,4,char.Torso,CFrame.new(0,0,0)*CFrame.fromOrientation(0,-1.5707963267949,0),"Handle2")
part(1,1,Vector3.new(0.18181818723679,0.18181818723679,0.18181818723679),"Ball",0,0,0,0,4,weapon.Handle2,CFrame.new(0.13636365532875,0.030909106135368,-1.7690916061401)*CFrame.fromOrientation(0,-1.5707963267949,0),"Ball")
part(1,1,Vector3.new(0.090909093618393,0.18181818723679,0.18181818723679),"Cylinder",0,0,0,0,4,weapon.Handle2,CFrame.new(0.090909086167812,0.030909106135368,-1.7690916061401)*CFrame.fromOrientation(-1.5707963267949,-3.1415926535898,0),"Cylinder")
part(1,1,Vector3.new(0.27272728085518,0.18181818723679,0.090909093618393),"Block",0,0,0,0,4,weapon.Handle2,CFrame.new(0.090908817946911,0.030909106135368,-1.6327273845673)*CFrame.fromOrientation(0,1.5707963267949,0),"Block")
part(1,1,Vector3.new(0.090909093618393,0.18181818723679,0.27272728085518),"Block",1,0,0,0,6,weapon.Handle2,CFrame.new(0,0.030910298228264,-1.6327283382416)*CFrame.fromOrientation(0,3.1415926535898,0),"Block")
part(1,1,Vector3.new(0.090909093618393,0.18181818723679,0.18181818723679),"Cylinder",1,0,0,0,6,weapon.Handle2,CFrame.new(0,0.030909106135368,-1.7690916061401)*CFrame.fromOrientation(-1.5707963267949,-3.1415926535898,0),"Cylinder")
part(1,1,Vector3.new(0.090909093618393,0.18181818723679,0.18181818723679),"Cylinder",0,0,0,0,4,weapon.Handle2,CFrame.new(-0.090909093618393,0.030909106135368,-1.7690916061401)*CFrame.fromOrientation(-1.5707963267949,-3.1415926535898,0),"Cylinder")
part(1,1,Vector3.new(0.090909093618393,0.18181818723679,0.27272728085518),"Block",1,0,0,0,6,weapon.Handle2,CFrame.new(0,0.030909106135368,-1.4509097337723)*CFrame.fromOrientation(0,1.5707963267949,0),"Block")
part(1,1,Vector3.new(0.27272728085518,0.18181818723679,0.090909093618393),"Block",0,0,0,0,4,weapon.Handle2,CFrame.new(-0.09090918302536,0.030909106135368,-1.6327273845673)*CFrame.fromOrientation(0,1.5707963267949,0),"Block")
part(1,1,Vector3.new(0.27272728085518,0.18181818723679,0.090909093618393),"Block",0,0,0,0,4,weapon.Handle2,CFrame.new(0.090908549726009,0.030909106135368,-1.2690907716751)*CFrame.fromOrientation(0,1.5707963267949,0),"Block")
part(1,1,Vector3.new(0.27272728085518,0.18181818723679,0.090909093618393),"Block",0,0,0,0,4,weapon.Handle2,CFrame.new(-0.090909548103809,0.030909106135368,-1.2690917253494)*CFrame.fromOrientation(0,1.5707963267949,0),"Block")
part(1,1,Vector3.new(0.090909093618393,0.18181818723679,0.27272728085518),"Block",1,0,0,0,6,weapon.Handle2,CFrame.new(0,0.030910298228264,-1.2690907716751)*CFrame.fromOrientation(0,3.1415926535898,0),"Block")
part(1,1,Vector3.new(0.18181818723679,0.18181818723679,0.18181818723679),"Ball",0,0,0,0,4,weapon.Handle2,CFrame.new(-0.13636364042759,0.030909106135368,-1.7690916061401)*CFrame.fromOrientation(0,-1.5707963267949,0),"Ball")
part(1,1,Vector3.new(0.090909093618393,0.18181818723679,0.27272728085518),"Block",1,0,0,0,6,weapon.Handle2,CFrame.new(0,0.030909106135368,-1.0872737169266)*CFrame.fromOrientation(0,1.5707963267949,0),"Block")
part(1,1,Vector3.new(0.090909093618393,0.18181818723679,0.27272728085518),"Block",1,0,0,0,6,weapon.Handle2,CFrame.new(0,0.030910298228264,-0.90545576810837)*CFrame.fromOrientation(0,3.1415926535898,0),"Block")
part(1,1,Vector3.new(0.27272728085518,0.18181818723679,0.090909093618393),"Block",0,0,0,0,4,weapon.Handle2,CFrame.new(-0.090909004211426,0.030909106135368,-0.90545672178268)*CFrame.fromOrientation(0,1.5707963267949,0),"Block")
part(1,1,Vector3.new(0.27272728085518,0.18181818723679,0.090909093618393),"Block",0,0,0,0,4,weapon.Handle2,CFrame.new(0.09090917557478,0.030909106135368,-0.90545576810837)*CFrame.fromOrientation(0,1.5707963267949,0),"Block")
part(1,1,Vector3.new(0.090909093618393,0.18181818723679,0.27272728085518),"Block",1,0,0,0,6,weapon.Handle2,CFrame.new(0,0.030909106135368,-0.72363775968552)*CFrame.fromOrientation(0,1.5707963267949,0),"Block")
part(1,1,Vector3.new(0.090909093618393,0.18181818723679,0.27272728085518),"Block",1,0,0,0,6,weapon.Handle2,CFrame.new(0,0.030910298228264,-0.54181975126266)*CFrame.fromOrientation(0,3.1415926535898,0),"Block")
part(1,1,Vector3.new(0.27272728085518,0.18181818723679,0.090909093618393),"Block",0,0,0,0,4,weapon.Handle2,CFrame.new(0.09090917557478,0.030909106135368,-0.54181975126266)*CFrame.fromOrientation(0,1.5707963267949,0),"Block")
part(1,1,Vector3.new(0.27272728085518,0.18181818723679,0.090909093618393),"Block",0,0,0,0,4,weapon.Handle2,CFrame.new(-0.090909361839294,0.030909106135368,-0.54181975126266)*CFrame.fromOrientation(0,1.5707963267949,0),"Block")
part(1,1,Vector3.new(0.090909093618393,0.18181818723679,0.27272728085518),"Block",1,0,0,0,6,weapon.Handle2,CFrame.new(0,0.030909106135368,-0.36000156402588)*CFrame.fromOrientation(0,1.5707963267949,0),"Block")
part(1,1,Vector3.new(0.27272728085518,0.18181818723679,0.090909093618393),"Block",0,0,0,0,4,weapon.Handle2,CFrame.new(0.090908907353878,0.030909106135368,-0.17818337678909)*CFrame.fromOrientation(0,1.5707963267949,0),"Block")
part(1,1,Vector3.new(0.090909093618393,0.18181818723679,0.27272728085518),"Block",1,0,0,0,6,weapon.Handle2,CFrame.new(0,0.030910298228264,-0.17818242311478)*CFrame.fromOrientation(0,3.1415926535898,0),"Block")
part(1,1,Vector3.new(0.27272728085518,0.18181818723679,0.090909093618393),"Block",0,0,0,0,4,weapon.Handle2,CFrame.new(-0.090909361839294,0.030909106135368,-0.17818242311478)*CFrame.fromOrientation(0,1.5707963267949,0),"Block")
part(1,1,Vector3.new(0.090909093618393,0.18181818723679,0.27272728085518),"Block",1,0,0,0,6,weapon.Handle2,CFrame.new(0,0.030909106135368,0.0036357790231705)*CFrame.fromOrientation(0,1.5707963267949,0),"Block")
part(1,1,Vector3.new(3.5454547405243,0.18181818723679,0.18181818723679),"Cylinder",0,0,0,0,4,weapon.Handle2,CFrame.new(-0.13636364042759,0.030909106135368,0.0036357790231705)*CFrame.fromOrientation(-1.5707963267949,1.5707963267949,0),"Cylinder")
part(1,1,Vector3.new(3.5454547405243,0.18181818723679,0.18181818723679),"Cylinder",0,0,0,0,4,weapon.Handle2,CFrame.new(0.13636365532875,0.030909106135368,0.0036357790231705)*CFrame.fromOrientation(-1.5707963267949,1.5707963267949,0),"Cylinder")
part(1,1,Vector3.new(0.090909093618393,0.18181818723679,0.27272728085518),"Block",1,0,0,0,6,weapon.Handle2,CFrame.new(0,0.030910298228264,0.18545413017273)*CFrame.fromOrientation(0,3.1415926535898,0),"Block")
part(1,1,Vector3.new(0.27272728085518,0.18181818723679,0.090909093618393),"Block",0,0,0,0,4,weapon.Handle2,CFrame.new(-0.090908728539944,0.030909106135368,0.18545317649841)*CFrame.fromOrientation(0,1.5707963267949,0),"Block")
part(1,1,Vector3.new(0.27272728085518,0.18181818723679,0.090909093618393),"Block",0,0,0,0,4,weapon.Handle2,CFrame.new(0.090908549726009,0.030909106135368,0.18545413017273)*CFrame.fromOrientation(0,1.5707963267949,0),"Block")
part(1,1,Vector3.new(0.090909093618393,0.18181818723679,0.27272728085518),"Block",1,0,0,0,6,weapon.Handle2,CFrame.new(0,0.030909106135368,0.36727184057236)*CFrame.fromOrientation(0,1.5707963267949,0),"Block")
part(1,1,Vector3.new(0.27272728085518,0.18181818723679,0.090909093618393),"Block",0,0,0,0,4,weapon.Handle2,CFrame.new(-0.090909004211426,0.030909106135368,0.54909074306488)*CFrame.fromOrientation(0,1.5707963267949,0),"Block")
part(1,1,Vector3.new(0.090909093618393,0.18181818723679,0.27272728085518),"Block",1,0,0,0,6,weapon.Handle2,CFrame.new(0,0.030910298228264,0.54908978939056)*CFrame.fromOrientation(0,3.1415926535898,0),"Block")
part(1,1,Vector3.new(0.27272728085518,0.18181818723679,0.090909093618393),"Block",0,0,0,0,4,weapon.Handle2,CFrame.new(0.090909458696842,0.030909106135368,0.54908978939056)*CFrame.fromOrientation(0,1.5707963267949,0),"Block")
part(1,1,Vector3.new(0.090909093618393,0.18181818723679,0.27272728085518),"Block",1,0,0,0,6,weapon.Handle2,CFrame.new(0,0.030909106135368,0.73090922832489)*CFrame.fromOrientation(0,1.5707963267949,0),"Block")
part(1,1,Vector3.new(0.27272728085518,0.18181818723679,0.090909093618393),"Block",0,0,0,0,4,weapon.Handle2,CFrame.new(0.09090917557478,0.030909106135368,0.91272675991058)*CFrame.fromOrientation(0,1.5707963267949,0),"Block")
part(1,1,Vector3.new(0.090909093618393,0.18181818723679,0.27272728085518),"Block",1,0,0,0,6,weapon.Handle2,CFrame.new(0,0.030910298228264,0.91272866725922)*CFrame.fromOrientation(0,3.1415926535898,0),"Block")
part(1,1,Vector3.new(0.27272728085518,0.18181818723679,0.090909093618393),"Block",0,0,0,0,4,weapon.Handle2,CFrame.new(-0.090908460319042,0.030909106135368,0.9127277135849)*CFrame.fromOrientation(0,1.5707963267949,0),"Block")
part(1,1,Vector3.new(0.090909093618393,0.18181818723679,0.27272728085518),"Block",1,0,0,0,6,weapon.Handle2,CFrame.new(0,0.030909106135368,1.094545841217)*CFrame.fromOrientation(0,1.5707963267949,0),"Block")
part(1,1,Vector3.new(0.27272728085518,0.18181818723679,0.090909093618393),"Block",0,0,0,0,4,weapon.Handle2,CFrame.new(-0.090908907353878,0.030909106135368,1.2763638496399)*CFrame.fromOrientation(0,1.5707963267949,0),"Block")
part(1,1,Vector3.new(0.090909093618393,0.18181818723679,0.27272728085518),"Block",1,0,0,0,6,weapon.Handle2,CFrame.new(0,0.030910298228264,1.2763638496399)*CFrame.fromOrientation(0,3.1415926535898,0),"Block")
part(1,1,Vector3.new(0.27272728085518,0.18181818723679,0.090909093618393),"Block",0,0,0,0,4,weapon.Handle2,CFrame.new(-0.090908907353878,0.030909106135368,1.2763638496399)*CFrame.fromOrientation(0,1.5707963267949,0),"Block")
part(1,1,Vector3.new(0.27272728085518,0.18181818723679,0.090909093618393),"Block",0,0,0,0,4,weapon.Handle2,CFrame.new(0.090908728539944,0.030909106135368,1.2763648033142)*CFrame.fromOrientation(0,1.5707963267949,0),"Block")
part(1,1,Vector3.new(0.090909093618393,0.18181818723679,0.27272728085518),"Block",1,0,0,0,6,weapon.Handle2,CFrame.new(0,0.030909106135368,1.4581832885742)*CFrame.fromOrientation(0,1.5707963267949,0),"Block")
part(1,1,Vector3.new(0.27272728085518,0.18181818723679,0.090909093618393),"Block",0,0,0,0,4,weapon.Handle2,CFrame.new(0.090909548103809,0.030909106135368,1.6400017738342)*CFrame.fromOrientation(0,1.5707963267949,0),"Block")
part(1,1,Vector3.new(0.090909093618393,0.18181818723679,0.27272728085518),"Block",1,0,0,0,6,weapon.Handle2,CFrame.new(0,0.030910298228264,1.6400017738342)*CFrame.fromOrientation(0,3.1415926535898,0),"Block")
part(1,1,Vector3.new(0.27272728085518,0.18181818723679,0.090909093618393),"Block",0,0,0,0,4,weapon.Handle2,CFrame.new(-0.090909093618393,0.030909106135368,1.6400017738342)*CFrame.fromOrientation(0,1.5707963267949,0),"Block")
part(1,1,Vector3.new(0.090909093618393,0.18181818723679,0.18181818723679),"Cylinder",1,0,0,0,6,weapon.Handle2,CFrame.new(-0.13636364042759,0.030909106135368,1.8218204975128)*CFrame.fromOrientation(-1.5707963267949,1.5707963267949,0),"Cylinder")
part(1,1,Vector3.new(0.090909093618393,0.18181818723679,0.27272728085518),"Block",1,0,0,0,6,weapon.Handle2,CFrame.new(0,0.030909106135368,1.8218204975128)*CFrame.fromOrientation(0,1.5707963267949,0),"Block")
part(1,1,Vector3.new(0.090909093618393,0.18181818723679,0.18181818723679),"Cylinder",1,0,0,0,6,weapon.Handle2,CFrame.new(0.13636365532875,0.030909106135368,1.8218204975128)*CFrame.fromOrientation(-1.5707963267949,1.5707963267949,0),"Cylinder")


part(1,1,Vector3.new(0.20000000298023,0.20000000298023,0.20000000298023),"Block",0,0,0,1,4,weapon.Handle2,CFrame.new(0,0,0)*CFrame.fromOrientation(0,-1.5707963267949,0),"Handle")
part(1,1,Vector3.new(3.7,.2,.4),"Block",0,0,0,1,4,weapon.Handle,CFrame.new(0,0,-2.45)*CFrame.fromOrientation(0,-1.5707963267949,0),"Hitbox")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(-0.045454546809196,-0.00036382675170898,-4.0458183288574)*CFrame.fromOrientation(0,1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-4.0458183288574)*CFrame.fromOrientation(0,0,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",.5,.5,.5,0,4,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-3.6821823120117)*CFrame.fromOrientation(0,-1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-3.7730913162231)*CFrame.fromOrientation(0,1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-3.8640003204346)*CFrame.fromOrientation(0,1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.13636364042759,-0.00036382675170898,-3.6821823120117)*CFrame.fromOrientation(0,0,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-3.6821823120117)*CFrame.fromOrientation(0,1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.13636364042759,-0.00036382675170898,-3.8640003204346)*CFrame.fromOrientation(0,0,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-3.954909324646)*CFrame.fromOrientation(0,1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",.5,.5,.5,0,4,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-3.7730913162231)*CFrame.fromOrientation(0,-1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.13636364042759,-0.00036382675170898,-3.7730913162231)*CFrame.fromOrientation(0,0,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",.5,.5,.5,0,4,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-3.8640003204346)*CFrame.fromOrientation(0,-1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",.5,.5,.5,0,4,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-3.954909324646)*CFrame.fromOrientation(0,-1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.13636364042759,-0.00036382675170898,-3.954909324646)*CFrame.fromOrientation(0,0,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.18181818723679,0.18181818723679),"Wedge",.5,.5,.5,0,4,weapon.Handle,CFrame.new(-0.090909093618393,-0.00036382675170898,-4.0912733078003)*CFrame.fromOrientation(0,-1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(-0.13636364042759,-0.00036382675170898,-4.2276363372803)*CFrame.fromOrientation(0,0,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(-0.045454546809196,-0.00036382675170898,-4.1367273330688)*CFrame.fromOrientation(0,0,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(-0.13636364042759,-0.00036382675170898,-4.1367273330688)*CFrame.fromOrientation(0,1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",.5,.5,.5,0,4,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-2.2276363372803)*CFrame.fromOrientation(0,-1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(3.3636364936829,0.090909093618393,0.18181818723679),"Block",.5,.5,.5,0,4,weapon.Handle,CFrame.new(-0.090909093618393,-0.00036382675170898,-2.3185453414917)*CFrame.fromOrientation(0,-1.5707963267949,0),"Block")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",.5,.5,.5,0,4,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-2.5003643035889)*CFrame.fromOrientation(0,-1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",.5,.5,.5,0,4,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-2.3185453414917)*CFrame.fromOrientation(0,-1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",.5,.5,.5,0,4,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-3.318546295166)*CFrame.fromOrientation(0,-1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",.5,.5,.5,0,4,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-2.6821823120117)*CFrame.fromOrientation(0,-1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",.5,.5,.5,0,4,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-3.4094552993774)*CFrame.fromOrientation(0,-1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",.5,.5,.5,0,4,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-2.5912733078003)*CFrame.fromOrientation(0,-1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",.5,.5,.5,0,4,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-3.1367273330688)*CFrame.fromOrientation(0,-1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",.5,.5,.5,0,4,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-1.8640003204346)*CFrame.fromOrientation(0,-1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",.5,.5,.5,0,4,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-2.4094552993774)*CFrame.fromOrientation(0,-1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",.5,.5,.5,0,4,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-2.0458183288574)*CFrame.fromOrientation(0,-1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",.5,.5,.5,0,4,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-2.8640003204346)*CFrame.fromOrientation(0,-1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",.5,.5,.5,0,4,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-2.954909324646)*CFrame.fromOrientation(0,-1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",.5,.5,.5,0,4,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-2.7730913162231)*CFrame.fromOrientation(0,-1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",.5,.5,.5,0,4,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-1.954909324646)*CFrame.fromOrientation(0,-1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",.5,.5,.5,0,4,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-2.1367273330688)*CFrame.fromOrientation(0,-1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",.5,.5,.5,0,4,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-3.2276363372803)*CFrame.fromOrientation(0,-1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.13636364042759,-0.00036382675170898,-2.1367273330688)*CFrame.fromOrientation(0,0,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",.5,.5,.5,0,4,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-3.0458183288574)*CFrame.fromOrientation(0,-1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-3.5003643035889)*CFrame.fromOrientation(0,1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.13636364042759,-0.00036382675170898,-3.5912733078003)*CFrame.fromOrientation(0,0,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-3.4094552993774)*CFrame.fromOrientation(0,1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.13636364042759,-0.00036382675170898,-3.5003643035889)*CFrame.fromOrientation(0,0,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.13636364042759,-0.00036382675170898,-2.954909324646)*CFrame.fromOrientation(0,0,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.13636364042759,-0.00036382675170898,-3.2276363372803)*CFrame.fromOrientation(0,0,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-3.2276363372803)*CFrame.fromOrientation(0,1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.13636364042759,-0.00036382675170898,-3.1367273330688)*CFrame.fromOrientation(0,0,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.13636364042759,-0.00036382675170898,-3.4094552993774)*CFrame.fromOrientation(0,0,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-3.1367273330688)*CFrame.fromOrientation(0,1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.13636364042759,-0.00036382675170898,-3.318546295166)*CFrame.fromOrientation(0,0,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",.5,.5,.5,0,4,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-3.5003643035889)*CFrame.fromOrientation(0,-1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",.5,.5,.5,0,4,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-3.5912733078003)*CFrame.fromOrientation(0,-1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-3.5912733078003)*CFrame.fromOrientation(0,1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-3.318546295166)*CFrame.fromOrientation(0,1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-1.954909324646)*CFrame.fromOrientation(0,1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.13636364042759,-0.00036382675170898,-1.8640003204346)*CFrame.fromOrientation(0,0,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.13636364042759,-0.00036382675170898,-1.954909324646)*CFrame.fromOrientation(0,0,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.13636364042759,-0.00036382675170898,-2.0458183288574)*CFrame.fromOrientation(0,0,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-2.2276363372803)*CFrame.fromOrientation(0,1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-2.1367273330688)*CFrame.fromOrientation(0,1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.13636364042759,-0.00036382675170898,-2.8640003204346)*CFrame.fromOrientation(0,0,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-2.8640003204346)*CFrame.fromOrientation(0,1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-2.954909324646)*CFrame.fromOrientation(0,1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-2.0458183288574)*CFrame.fromOrientation(0,1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-1.8640003204346)*CFrame.fromOrientation(0,1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.13636364042759,-0.00036382675170898,-2.7730913162231)*CFrame.fromOrientation(0,0,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.13636364042759,-0.00036382675170898,-2.2276363372803)*CFrame.fromOrientation(0,0,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.13636364042759,-0.00036382675170898,-2.6821823120117)*CFrame.fromOrientation(0,0,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-3.0458183288574)*CFrame.fromOrientation(0,1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-2.4094552993774)*CFrame.fromOrientation(0,1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-2.6821823120117)*CFrame.fromOrientation(0,1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.13636364042759,-0.00036382675170898,-2.5912733078003)*CFrame.fromOrientation(0,0,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-2.5912733078003)*CFrame.fromOrientation(0,1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.13636364042759,-0.00036382675170898,-2.4094552993774)*CFrame.fromOrientation(0,0,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.13636364042759,-0.00036382675170898,-2.5003643035889)*CFrame.fromOrientation(0,0,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.13636364042759,-0.00036382675170898,-2.3185453414917)*CFrame.fromOrientation(0,0,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.13636364042759,-0.00036382675170898,-3.0458183288574)*CFrame.fromOrientation(0,0,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-2.5003643035889)*CFrame.fromOrientation(0,1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-2.7730913162231)*CFrame.fromOrientation(0,1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-2.3185453414917)*CFrame.fromOrientation(0,1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",.5,.5,.5,0,4,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-1.6821823120117)*CFrame.fromOrientation(0,-1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",.5,.5,.5,0,4,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-1.7730913162231)*CFrame.fromOrientation(0,-1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",.5,.5,.5,0,4,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-1.5912733078003)*CFrame.fromOrientation(0,-1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.13636364042759,-0.00036382675170898,-1.6821823120117)*CFrame.fromOrientation(0,0,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-1.7730913162231)*CFrame.fromOrientation(0,1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.13636364042759,-0.00036382675170898,-1.5912733078003)*CFrame.fromOrientation(0,0,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-1.6821823120117)*CFrame.fromOrientation(0,1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-1.5912733078003)*CFrame.fromOrientation(0,1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.13636364042759,-0.00036382675170898,-1.7730913162231)*CFrame.fromOrientation(0,0,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",.5,.5,.5,0,4,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-1.5003643035889)*CFrame.fromOrientation(0,-1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",.5,.5,.5,0,4,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-1.1367273330688)*CFrame.fromOrientation(0,-1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",.5,.5,.5,0,4,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-0.86400032043457)*CFrame.fromOrientation(0,-1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",.5,.5,.5,0,4,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-0.954909324646)*CFrame.fromOrientation(0,-1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",.5,.5,.5,0,4,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-1.2276363372803)*CFrame.fromOrientation(0,-1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",.5,.5,.5,0,4,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-1.3185453414917)*CFrame.fromOrientation(0,-1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",.5,.5,.5,0,4,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-1.4094552993774)*CFrame.fromOrientation(0,-1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",.5,.5,.5,0,4,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-0.77309131622314)*CFrame.fromOrientation(0,-1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",.5,.5,.5,0,4,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-1.0458183288574)*CFrame.fromOrientation(0,-1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-0.77309131622314)*CFrame.fromOrientation(0,1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.13636364042759,-0.00036382675170898,-0.77309131622314)*CFrame.fromOrientation(0,0,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-0.954909324646)*CFrame.fromOrientation(0,1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.13636364042759,-0.00036382675170898,-1.0458183288574)*CFrame.fromOrientation(0,0,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.13636364042759,-0.00036382675170898,-1.4094552993774)*CFrame.fromOrientation(0,0,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.13636364042759,-0.00036382675170898,-1.2276363372803)*CFrame.fromOrientation(0,0,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-0.86400032043457)*CFrame.fromOrientation(0,1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.13636364042759,-0.00036382675170898,-1.5003643035889)*CFrame.fromOrientation(0,0,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-1.3185453414917)*CFrame.fromOrientation(0,1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.13636364042759,-0.00036382675170898,-1.1367273330688)*CFrame.fromOrientation(0,0,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-1.0458183288574)*CFrame.fromOrientation(0,1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.13636364042759,-0.00036382675170898,-0.954909324646)*CFrame.fromOrientation(0,0,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-1.1367273330688)*CFrame.fromOrientation(0,1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-1.5003643035889)*CFrame.fromOrientation(0,1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-1.2276363372803)*CFrame.fromOrientation(0,1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-1.4094552993774)*CFrame.fromOrientation(0,1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.13636364042759,-0.00036382675170898,-1.3185453414917)*CFrame.fromOrientation(0,0,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.13636364042759,-0.00036382675170898,-0.86400032043457)*CFrame.fromOrientation(0,0,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(1.0909091234207,0.18181818723679,0.18181818723679),"Block",0,0,0,0,4,weapon.Handle,CFrame.new(0,-0.00036382675170898,-0.00036430358886719)*CFrame.fromOrientation(0,-1.5707963267949,0),"Block")
part(1,1,Vector3.new(0.090909093618393,0.27272728085518,0.27272728085518),"Cylinder",0,0,0,0,4,weapon.Handle,CFrame.new(0.13636364042759,-0.00036382675170898,-0.59127330780029)*CFrame.fromOrientation(-1.5707963267949,1.5707963267949,0),"Cylinder")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",.5,.5,.5,0,4,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-0.68218231201172)*CFrame.fromOrientation(0,-1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.27272728085518,0.27272728085518),"Block",0,0,0,0,4,weapon.Handle,CFrame.new(0,-0.00036382675170898,-0.59127330780029)*CFrame.fromOrientation(0,-1.5707963267949,0),"Block")
part(1,1,Vector3.new(0.090909093618393,0.27272728085518,0.27272728085518),"Cylinder",0,0,0,0,4,weapon.Handle,CFrame.new(-0.13636364042759,-0.00036382675170898,-0.59127330780029)*CFrame.fromOrientation(-1.5707963267949,1.5707963267949,0),"Cylinder")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.045454546809196,-0.00036382675170898,-0.68218231201172)*CFrame.fromOrientation(0,1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.090909093618393,0.090909093618393,0.090909093618393),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.13636364042759,-0.00036382675170898,-0.68218231201172)*CFrame.fromOrientation(0,0,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.18181818723679,0.18181818723679,0.18181818723679),"Cylinder",0,0,0,0,4,weapon.Handle,CFrame.new(0,-0.00036382675170898,0.545090675354)*CFrame.fromOrientation(0,3.1415926535898,1.5707963267949),"Cylinder")

-- outfit

part(1,1,Vector3.new(0.75130718946457,0.50087147951126,0.50087147951126),"Wedge",0.97254908084869,0.97254908084869,0.97254908084869,0,4,char.Torso,CFrame.new(-0.37216734886169,-1.2521786689758,-0.12521786972866)*CFrame.fromOrientation(0,1.5707963267949,3.1415926535898),"Wedge")
part(1,1,Vector3.new(0.12521786987782,2.2539215087891,0.12521786987782),"Block",0,0,0,0,4,char.Torso,CFrame.new(-0.68521213531494,0.12521839141846,-0.56348039194927)*CFrame.fromOrientation(0,-1.5707963267949,0),"Block")
part(1,1,Vector3.new(0.50087147951126,1.6278322935104,0.87652504444122),"Block",0.97254908084869,0.97254908084869,0.97254908084869,0,4,char.Torso,CFrame.new(-0.37216734886169,-0.18782663345337,-0.06260893478975)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.12521786987782,1.6278322935104,0.87652504444122),"Block",0.38823533058167,0.37254902720451,0.38431376218796,0,4,char.Torso,CFrame.new(-0.059122562408447,-0.18782663345337,-0.06260893478975)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.12521786987782,0.12521786987782,0.12521786987782),"Block",1,1,0,0,6,char.Torso,CFrame.new(-0.059122562408447,-0.06260871887207,-0.46330614373073)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.75130718946457,0.50087147951126,0.12521786987782),"Wedge",0.97254908084869,0.97254908084869,0.97254908084869,0,4,char.Torso,CFrame.new(0.066095352172852,-1.2521786689758,-0.12521786972866)*CFrame.fromOrientation(0,1.5707963267949,3.1415926535898),"Wedge")
part(1,1,Vector3.new(1.3773964643478,2.003485918045,0.12521786987782),"Block",0,0,0,0,4,char.Torso,CFrame.new(0.066095113754272,0,0.43826253727093)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.12521786987782,0.12521786987782,0.12521786987782),"Block",1,1,0,0,6,char.Torso,CFrame.new(-0.059122562408447,0.18782711029053,-0.46330614373073)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.37565359473228,2.003485918045,1.0017429590225),"Block",0,0,0,0,4,char.Torso,CFrame.new(-0.81042981147766,0,0)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.12521786987782,0.12521786987782,0.12521786987782),"Block",1,1,0,0,6,char.Torso,CFrame.new(-0.059122562408447,-0.81391620635986,-0.46330614373073)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.12521786987782,0.12521786987782,0.12521786987782),"Block",1,1,0,0,6,char.Torso,CFrame.new(-0.059122562408447,-0.56348037719727,-0.46330614373073)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.12521786987782,0.12521786987782,0.12521786987782),"Block",1,1,0,0,6,char.Torso,CFrame.new(-0.059122562408447,-0.31304454803467,-0.46330614373073)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.12521786987782,0.12521786987782,0.12521786987782),"Block",1,1,0,0,6,char.Torso,CFrame.new(-0.059122562408447,0.43826246261597,-0.46330614373073)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.75130718946457,0.50087147951126,0.12521786987782),"Wedge",0.97254908084869,0.97254908084869,0.97254908084869,0,4,char.Torso,CFrame.new(-0.059122562408447,-1.2521786689758,-0.12521786972866)*CFrame.fromOrientation(0,-1.5707963267949,3.1415926535898),"Wedge")
part(1,1,Vector3.new(0.75130718946457,0.37565359473228,0.25043573975563),"Wedge",0.97254908084869,0.97254908084869,0.97254908084869,0,4,char.Torso,CFrame.new(-0.12173175811768,0.81391644477844,-0.12521786972866)*CFrame.fromOrientation(0,-1.5707963267949,0),"Wedge")
part(1,1,Vector3.new(0.75130718946457,0.37565359473228,0.25043573975563),"Wedge",0.97254908084869,0.97254908084869,0.97254908084869,0,4,char.Torso,CFrame.new(0.12870407104492,0.81391644477844,-0.12521786972866)*CFrame.fromOrientation(0,1.5707963267949,0),"Wedge")
part(1,1,Vector3.new(0.37565359473228,0.37565359473228,0.87652504444122),"Block",0.97254908084869,0.97254908084869,0.97254908084869,0,4,char.Torso,CFrame.new(-0.43477630615234,0.81391644477844,-0.06260893478975)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.87652504444122,0.37565359473228,0.25043573975563),"Wedge",0.91372555494308,0.85490202903748,0.85490202903748,0,4,char.Torso,CFrame.new(0.12870407104492,0.81391644477844,-0.06260893478975)*CFrame.fromOrientation(0,-1.5707963267949,3.1415926535898),"Wedge")
part(1,1,Vector3.new(0.62608933448792,1.6278322935104,0.87652504444122),"Block",0.97254908084869,0.97254908084869,0.97254908084869,0,4,char.Torso,CFrame.new(0.31653070449829,-0.18782663345337,-0.06260893478975)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.87652504444122,0.37565359473228,0.25043573975563),"Wedge",0.91372555494308,0.85490202903748,0.85490202903748,0,4,char.Torso,CFrame.new(-0.12173175811768,0.81391644477844,-0.06260893478975)*CFrame.fromOrientation(0,1.5707963267949,3.1415926535898),"Wedge")
part(1,1,Vector3.new(0.75130718946457,0.50087147951126,0.50087147951126),"Wedge",0.97254908084869,0.97254908084869,0.97254908084869,0,4,char.Torso,CFrame.new(0.37913942337036,-1.2521786689758,-0.12521837636814)*CFrame.fromOrientation(0,-1.5707963267949,3.1415926535898),"Wedge")
part(1,1,Vector3.new(1.0017429590225,0.12521786987782,0.12521786987782),"Block",0,0,0,0,4,char.Torso,CFrame.new(-0.68521213531494,1.0643520355225,0)*CFrame.fromOrientation(0,-1.5707963267949,0),"Block")
part(1,1,Vector3.new(0.37565359473228,0.37565359473228,0.87652504444122),"Block",0.97254908084869,0.97254908084869,0.97254908084869,0,4,char.Torso,CFrame.new(0.44174885749817,0.81391644477844,-0.06260893478975)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.12521786987782,0.12521786987782,0.12521786987782),"Wedge",0,0,0,0,4,char.Torso,CFrame.new(-0.68520760536194,1.3147916793823,-0.56349737927303)*CFrame.fromOrientation(0,0,0),"Wedge")
part(1,1,Vector3.new(1.0017429590225,0.12521786987782,0.12521786987782),"Block",0,0,0,0,4,char.Torso,CFrame.new(-0.68521213531494,1.3147876262665,0)*CFrame.fromOrientation(0,-1.5707963267949,0),"Block")
part(1,1,Vector3.new(1.2521786689758,0.12521786987782,0.12521786987782),"Wedge",0,0,0,0,4,char.Torso,CFrame.new(0.0034863948822021,0.93913412094116,0.56348042204991)*CFrame.fromOrientation(0,3.1415926535898,3.1415926535898),"Wedge")
part(1,1,Vector3.new(1.0017429590225,0.12521786987782,0.12521786987782),"Block",1,1,0,0,6,char.Torso,CFrame.new(-0.68521213531494,1.1895699501038,0)*CFrame.fromOrientation(0,-1.5707963267949,0),"Block")
part(1,1,Vector3.new(0.37565359473228,2.003485918045,1.0017429590225),"Block",0,0,0,0,4,char.Torso,CFrame.new(0.81740236282349,0,0)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.12521786987782,0.12521786987782,0.12521786987782),"Wedge",1,1,0,0,6,char.Torso,CFrame.new(-0.68521165847778,1.1895704269409,0.56348012402668)*CFrame.fromOrientation(0,3.1415926535898,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.12521786987782,0.12521786987782,1.2521786689758),"Block",1,1,0,0,6,char.Torso,CFrame.new(0.0034863948822021,1.1895699501038,0.56348042204991)*CFrame.fromOrientation(0,-1.5707963267949,0),"Block")
part(1,1,Vector3.new(1.0017429590225,0.12521786987782,0.12521786987782),"Block",1,1,0,0,6,char.Torso,CFrame.new(0.69218444824219,1.1895699501038,0)*CFrame.fromOrientation(0,-1.5707963267949,0),"Block")
part(1,1,Vector3.new(1.0017429590225,0.12521786987782,0.12521786987782),"Block",0,0,0,0,4,char.Torso,CFrame.new(0.69218444824219,1.0643520355225,0)*CFrame.fromOrientation(0,-1.5707963267949,0),"Block")
part(1,1,Vector3.new(0.12521786987782,0.12521786987782,0.12521786987782),"Wedge",0,0,0,0,4,char.Torso,CFrame.new(0.69218921661377,1.3147916793823,-0.56349737927303)*CFrame.fromOrientation(0,0,0),"Wedge")
part(1,1,Vector3.new(0.12521786987782,2.2539215087891,0.12521786987782),"Block",0,0,0,0,4,char.Torso,CFrame.new(0.69218444824219,0.12521839141846,-0.56348039194927)*CFrame.fromOrientation(0,-1.5707963267949,0),"Block")
part(1,1,Vector3.new(1.0017429590225,0.12521786987782,0.12521786987782),"Block",0,0,0,0,4,char.Torso,CFrame.new(0.69218444824219,1.3147876262665,0)*CFrame.fromOrientation(0,-1.5707963267949,0),"Block")
part(1,1,Vector3.new(0.12521786987782,0.12521786987782,0.12521786987782),"Wedge",0,0,0,0,4,char.Torso,CFrame.new(0.69218397140503,1.0643520355225,0.56348012402668)*CFrame.fromOrientation(0,3.1415926535898,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.12521786987782,0.12521786987782,0.12521786987782),"Wedge",1,1,0,0,6,char.Torso,CFrame.new(0.69218397140503,1.1895704269409,0.56348012402668)*CFrame.fromOrientation(0,3.1415926535898,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.12521786987782,0.12521786987782,0.12521786987782),"Wedge",0,0,0,0,4,char.Torso,CFrame.new(-0.68521165847778,1.0643525123596,0.56348012402668)*CFrame.fromOrientation(0,3.1415926535898,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.12521786987782,0.12521786987782,1.2521786689758),"Block",0,0,0,0,4,char.Torso,CFrame.new(0.0034863948822021,1.0643520355225,0.56348042204991)*CFrame.fromOrientation(0,-1.5707963267949,0),"Block")
part(1,1,Vector3.new(0.12521786987782,0.12521786987782,0.12521786987782),"Wedge",0,0,0,0,4,char.Torso,CFrame.new(-0.68521165847778,1.3147883415222,0.56348012402668)*CFrame.fromOrientation(0,3.1415926535898,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.12521786987782,0.12521786987782,1.2521786689758),"Block",0,0,0,0,4,char.Torso,CFrame.new(0.0034863948822021,1.3147876262665,0.56348042204991)*CFrame.fromOrientation(0,-1.5707963267949,0),"Block")
part(1,1,Vector3.new(0.12521786987782,0.12521786987782,0.12521786987782),"Wedge",0,0,0,0,4,char.Torso,CFrame.new(0.69218444824219,1.3147876262665,0.56348012402668)*CFrame.fromOrientation(0,3.1415926535898,1.5707963267949),"Wedge")

part(1,1,Vector3.new(1,0.875,1),"Block",0,0,0,0,4,LeftArm,CFrame.new(0,0.5625,0)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(1,0.875,1),"Block",0.91372555494308,0.85490202903748,0.85490202903748,0,4,LeftArm,CFrame.new(0,-0.5625,0)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(1,0.125,1),"Block",0,0,0,0,4,LeftArm,CFrame.new(0,-0.0625,0)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(1,0.125,1),"Block",1,1,0,0,6,LeftArm,CFrame.new(0,0.0625,0)*CFrame.fromOrientation(0,0,0),"Block")

part(1,1,Vector3.new(1,0.875,1),"Block",0,0,0,0,4,RightArm,CFrame.new(0,0.5625,0)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(1,0.875,1),"Block",0.91372555494308,0.85490202903748,0.85490202903748,0,4,RightArm,CFrame.new(0,-0.5625,0)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(1,0.125,1),"Block",0,0,0,0,4,RightArm,CFrame.new(0,-0.0625,0)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(1,0.125,1),"Block",1,1,0,0,6,RightArm,CFrame.new(0,0.0625,0)*CFrame.fromOrientation(0,0,0),"Block")

part(1,1,Vector3.new(1,2,1),"Block",0,0,0,0,4,LeftLeg,CFrame.new(0,0,0)*CFrame.fromOrientation(0,0,0),"Block")

part(1,1,Vector3.new(1,2,1),"Block",0,0,0,0,4,RightLeg,CFrame.new(0,0,0)*CFrame.fromOrientation(0,0,0),"Block")

part(1,1,Vector3.new(1,1,1),"Block",0,0,0,0,4,char.Head,CFrame.new(0,0.5,0)*CFrame.fromOrientation(0,0,0),"Hair")

local hairmesh = Instance.new("SpecialMesh", weapon.Hair)
hairmesh.MeshType = "FileMesh"
hairmesh.MeshId = "http://www.roblox.com/asset/?id=16627529"
hairmesh.Scale = Vector3.new(1.05,1.05,1.05)

char.Head.face:Destroy()

local d = char:GetChildren()
for i=1, #d  do 
	if d[i].ClassName == "Accessory" then
	d[i]:Destroy()
	end 
end

local animuface = Instance.new("Decal", char.Head)
animuface.Face = "Front"
animuface.Texture = "http://www.roblox.com/asset/?id=283737387"

--[[]]
local animusong = Instance.new("Sound", char.Torso)
animusong.SoundId = "rbxassetid://319240170"
animusong.MaxDistance = 100
animusong:Play()
--]]
local at = Instance.new("Attachment", weapon.Hitbox)
at.Position = Vector3.new(weapon.Hitbox.Size.X/2,0,0)
local att = Instance.new("Attachment", weapon.Hitbox)
att.Position = Vector3.new(-weapon.Hitbox.Size.X/2,0,0)
local trail = Instance.new("Trail", weapon.Hitbox)
trail.Attachment0 = at
trail.Attachment1 = att
trail.Lifetime = 0.2
trail.Color = ColorSequence.new(Color3.new(1,1,0),Color3.new(1,1,1),1)
trail.MinLength = 0
trail.Enabled = false

char.Head.Color = Color3.new(0.91372555494308,0.85490202903748,0.85490202903748)
LeftArm.Transparency = 1
RightArm.Transparency = 1
RightLeg.Transparency = 1
LeftLeg.Transparency = 1
char.Torso.Transparency = 1

local screengu = Instance.new("ScreenGui", play.PlayerGui)
screengu.Enabled = true

local makegui = function(pos1,pos2,tex)
local a = Instance.new("TextLabel",screengu)
a.Size = UDim2.new(.3, 0,.03, 0)
a.Text = tex
a.Position = UDim2.new(pos1,0,pos2,0)
a.TextScaled = true
a.TextStrokeColor3 = Color3.new(0,0,0)
a.TextStrokeTransparency = 0
a.TextColor3 = Color3.fromRGB(255,255,0)
a.TextXAlignment = "Left"
a.BackgroundTransparency = 1
end

local cd1 = 6
local cd2 = 10
local cd3 = 14
local cd4 = 18
local ccd1 = 6
local ccd2 = 10
local ccd3 = 14
local ccd4 = 18


local bar1 = Instance.new("Frame", screengu)
bar1.Position = UDim2.new(0.83,0,0.66,0)
bar1.Size = UDim2.new(0.156,0,0.055,0)
bar1.BackgroundColor3 = Color3.new(1,1,0)
bar1.BorderColor3 = Color3.fromRGB(0,0,0)
local bar2 = Instance.new("Frame", screengu)
bar2.Position = UDim2.new(0.83,0,0.72,0)
bar2.Size = UDim2.new(0.156,0,0.055,0)
bar2.BackgroundColor3 = Color3.new(1,1,0)
bar2.BorderColor3 = Color3.fromRGB(0,0,0)
local bar3 = Instance.new("Frame", screengu)
bar3.Position = UDim2.new(0.83,0,0.78,0)
bar3.Size = UDim2.new(0.156,0,0.055,0)
bar3.BackgroundColor3 = Color3.new(1,1,0)
bar3.BorderColor3 = Color3.fromRGB(0,0,0)
local bar4 = Instance.new("Frame", screengu)
bar4.Position = UDim2.new(0.83,0,0.84,0)
bar4.Size = UDim2.new(0.156,0,0.055,0)
bar4.BackgroundColor3 = Color3.new(1,1,0)
bar4.BorderColor3 = Color3.fromRGB(0,0,0)
bar4.BackgroundColor3 = Color3.new(1,1,0)
coroutine.resume(coroutine.create(function()
while true do
bar1:TweenSize(UDim2.new(0.156 * (ccd1 /cd1), 0, .055, 0), "Out", "Quad", 0.6)
bar2:TweenSize(UDim2.new(0.156 * (ccd2 /cd2), 0, .055, 0), "Out", "Quad", 0.6)
bar3:TweenSize(UDim2.new(0.156 * (ccd3 /cd3), 0, .055, 0), "Out", "Quad", 0.6)
bar4:TweenSize(UDim2.new(0.156 * (ccd4 /cd4), 0, .055, 0), "Out", "Quad", 0.6)
bar1.BackgroundTransparency = (ccd1 /cd1)
bar2.BackgroundTransparency = (ccd2 /cd2)
bar3.BackgroundTransparency = (ccd3 /cd3)
bar4.BackgroundTransparency = (ccd4 /cd4)
if ccd1 < cd1 then
	ccd1 = ccd1 + 0.04
end
if ccd2 < cd2 then
	ccd2 = ccd2 + 0.04
end
if ccd3 < cd3 then
	ccd3 = ccd3 + 0.04
end
if ccd4 < cd4 then
	ccd4 = ccd4 + 0.04
end
wait()
end
end))

makegui(0.838,.67,"[Z] Lunge")
makegui(0.838,.73,"[X] Grab")
makegui(0.838,.79,"[C] Blossom")
makegui(0.838,.85,"[V] Parry")







local sheath = function()
	attack = true
	if sheathed == false then
	for i = 0, 1, 0.1 do
		wait()
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, .5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(90), math.rad(0)), 0.5)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(-90), math.rad(0)), 0.5)
		weapon.Handle2.Weld.C0 = clerp(weapon.Handle2.Weld.C0, CFrame.new(0,-1,0) * CFrame.Angles(math.rad(180), math.rad(0), math.rad(90)), 0.3)
	end
	else
	weapon.Handle2.Weld.Part0 = LeftArm
	for i = 0, 1, 0.1 do
		wait()
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(45)), 0.3)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, .5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(90), math.rad(0)), 0.5)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(-90), math.rad(0)), 0.5)
		weapon.Handle2.Weld.C0 = clerp(weapon.Handle2.Weld.C0, CFrame.new(0,-1,0) * CFrame.Angles(math.rad(180), math.rad(0), math.rad(90)), 0.3)
	end
	end
	if sheathed == false then
	sheathed = true
	CreateSound("rbxassetid://211134014",char.Torso,.5,1)
	for i = 0, 1, 0.1 do
		wait()
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, .5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(90), math.rad(0)), 0.2)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(-90), math.rad(0)), 0.2)
		weapon.Handle2.Weld.C0 = clerp(weapon.Handle2.Weld.C0, CFrame.new(0,-1,-0.5) * CFrame.Angles(math.rad(180), math.rad(0), math.rad(90)), 0.2)
	end
	weapon.Handle.Weld.Part0 = weapon.Handle2
	weapon.Handle2.Weld.Part0 = char.Torso
	
	else
	
	sheathed = false
	CreateSound("rbxasset://sounds/unsheath.wav",char.Torso,.5,1.4)
	for i = 0, 1, 0.3 do
		wait()
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(45)), 0.3)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, .5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(90), math.rad(0)), 0.5)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(-90), math.rad(0)), 0.5)
		weapon.Handle2.Weld.C0 = clerp(weapon.Handle2.Weld.C0, CFrame.new(0,-1,0) * CFrame.Angles(math.rad(180), math.rad(0), math.rad(90)), 0.3)
	end
	weapon.Handle.Weld.Part0 = RightArm
	RW.C0 = clerp(RW.C0, CFrame.new(1.5, .5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(0)), 1)
	LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(0)), 1)
	weapon.Handle.Weld.C0 = clerp(weapon.Handle.Weld.C0, CFrame.new(0,-1,0) * CFrame.Angles(math.rad(0), math.rad(90), math.rad(-90)), 1)
	weapon.Handle2.Weld.C0 = clerp(weapon.Handle2.Weld.C0, CFrame.new(-1,-1,0) * CFrame.Angles(math.rad(180), math.rad(90), math.rad(90)), 1)
	local debounce = false
	local dam = weapon.Hitbox.Touched:connect(function(hit)
		if debounce == false then
			local hum = hit.Parent:FindFirstChild("Humanoid")
			if hum ~= nil then
				debounce = true
				hum.Health = hum.Health - 5
				showdam(5,hum.Parent.Head,Color3.new(1,1,0))
				wait(.02)
				debounce = false
			end
		end
	end)
	trail.Enabled = true
	for i = 0, 1, 0.2 do
		wait()
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(45)), 0.3)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, .5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(140)), 0.5)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(-70)), 0.5)
	end
	trail.Enabled = false
	dam:disconnect()
	end
	attack = false
end

local attack1 = function()
	attack = true
	for i = 0, 1, 0.2 do
		wait()
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-10)), 0.3)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, .4 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(0)), 0.5)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(20), math.rad(0), math.rad(-10)), 0.3)
	end
	canmove = false
	char.Humanoid.JumpPower = 25
	char.Humanoid.Jump = true
	CreateSound("rbxassetid://166423113",char.Torso,.5,1)
	for i = 0,1, 0.2 do
		wait()
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(45), math.rad(90)), 0.3)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, .4 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(0)), 0.5)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(20), math.rad(0), math.rad(-10)), 0.3)
		char.Torso.Velocity = char.HumanoidRootPart.CFrame.lookVector * 50
		block(RightArm.CFrame * CFrame.new(0,-1,0),Vector3.new(1,1,1),Vector3.new(.05,.05,.05),.1,BrickColor.new("New Yeller"), 1)
		magn(2,RightArm,4)
	end
	char.Humanoid.JumpPower = 50
	for i = 0, 1, 0.2 do
		wait()
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0.5, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(90), math.rad(180)), 0.3)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, .4 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(90)), 0.5)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(20), math.rad(0), math.rad(-10)), 0.3)
		RH.C0 = clerp(RH.C0, CFrame.new(1, -1 + 0.1 * math.cos((sine) / 20), 0) * RHCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(45)), 0.3)
		LH.C0 = clerp(LH.C0, CFrame.new(-1, -1 + 0.1 * math.cos((sine) / 20), 0) * LHCF * CFrame.Angles(math.rad(0), math.rad(30), math.rad(-45)), 0.3)
	end
	local kek = 0
	CreateSound("rbxassetid://166423113",char.Torso,.5,1)
	for i = 0, 1, 0.4 do
		wait()
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0.5, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(kek), math.rad(90 + kek), math.rad(180)), 0.6)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, .4 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(90)), 0.5)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(20), math.rad(0), math.rad(-10)), 0.3)
		RH.C0 = clerp(RH.C0, CFrame.new(1, -1 + 0.1 * math.cos((sine) / 20), 0) * RHCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(45)), 0.3)
		kek = kek + 15
		LH.C0 = clerp(LH.C0, CFrame.new(-1, -1 + 0.1 * math.cos((sine) / 20), 0) * LHCF * CFrame.Angles(math.rad(0), math.rad(30), math.rad(-45)), 0.3)
	end
	magn(2.5,LeftLeg,4)
	magn(2.5,RightLeg,4)
	canmove = true
	attack = false
end

local attack2 = function()
	attack = true
	for i = 0, 1, 0.2 do
		wait()
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1, .4 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(45), math.rad(0), math.rad(-10)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(45), math.rad(0), math.rad(10)), 0.3)
	end
	canmove = false
	for i = 0,1, 0.2 do
		wait()
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(.5, .4 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(45), math.rad(0), math.rad(-40)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(45), math.rad(0), math.rad(40)), 0.3)
		RH.C0 = clerp(RH.C0, CFrame.new(1, -1 + 0.1 * math.cos((sine) / 20), 0) * RHCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		LH.C0 = clerp(LH.C0, CFrame.new(-1, -.5 + 0.1 * math.cos((sine) / 20), -.5) * LHCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
	end
	local kek = 0
	CreateSound("rbxassetid://166423113",char.Torso,.5,1)
	while kek < 400 do
		wait()
		magn(2,LeftLeg,4)
		kek = kek + 30
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(-kek), math.rad(0), math.rad(0)), 0.6)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(.5, .4 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(30), math.rad(0), math.rad(-20)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(30), math.rad(0), math.rad(20)), 0.3)
		RH.C0 = clerp(RH.C0, CFrame.new(1, -1 + 0.1 * math.cos((sine) / 20), 0) * RHCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		LH.C0 = clerp(LH.C0, CFrame.new(-1, -.5 + 0.1 * math.cos((sine) / 20), -.5) * LHCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(45)), 0.3)
		block(LeftLeg.CFrame * CFrame.new(0,-1,0),Vector3.new(1,1,1),Vector3.new(.05,.05,.05),.1,BrickColor.new("New Yeller"), 1)
	end
	canmove = true
	attack = false
end

local attack3 = function()
	attack = true
	for i = 0,1, 0.2 do
		wait()
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1, .5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(-40)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(40)), 0.3)
	end
	canmove = false
	for i = 0,1, 0.2 do
		wait()
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(0)), 0.3)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1, .5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(-40)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(40)), 0.3)
		RH.C0 = clerp(RH.C0, CFrame.new(1, -1 + 0.1 * math.cos((sine) / 20), 0) * RHCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-30)), 0.3)
		LH.C0 = clerp(LH.C0, CFrame.new(-1, -.5 + 0.1 * math.cos((sine) / 20), -.5) * LHCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(45)), 0.3)
	end
	trail.Enabled = true
	local debounce = false
	local dam = weapon.Hitbox.Touched:connect(function(hit)
		if debounce == false then
			local hum = hit.Parent:FindFirstChild("Humanoid")
			if hum ~= nil then
				debounce = true
				hum.Health = hum.Health - 5
				showdam(5,hum.Parent.Head,Color3.new(1,1,0))
				wait(.02)
				debounce = false
			end
		end
	end)
	local kek = 0
	while kek < 720 do
		wait()
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(kek)), 0.3)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1, .5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(-40)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(40)), 0.3)
		RH.C0 = clerp(RH.C0, CFrame.new(1, -1 + 0.1 * math.cos((sine) / 20), 0) * RHCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		LH.C0 = clerp(LH.C0, CFrame.new(-1, -.5 + 0.1 * math.cos((sine) / 20), -.5) * LHCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		char.Torso.Velocity = char.HumanoidRootPart.CFrame.lookVector * 50
		kek = kek + 30
	end
	for i = 0,1, 0.1 do
		wait()
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1, .5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(0)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(-90)), 0.3)
		RH.C0 = clerp(RH.C0, CFrame.new(1, -1 + 0.1 * math.cos((sine) / 20), 0) * RHCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-30)), 0.3)
		LH.C0 = clerp(LH.C0, CFrame.new(-1, -.5 + 0.1 * math.cos((sine) / 20), -.5) * LHCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(45)), 0.3)
		weapon.Handle.Weld.C0 = clerp(weapon.Handle.Weld.C0, CFrame.new(0,-1,0) * CFrame.Angles(math.rad(0), math.rad(90), math.rad(-90)), 1)
	end
	canmove = true
	for i = 0,1, 0.1 do
		wait()
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, .5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(140)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-10)), 0.3)
		weapon.Handle.Weld.C0 = clerp(weapon.Handle.Weld.C0, CFrame.new(0,-1,0) * CFrame.Angles(math.rad(0), math.rad(90), math.rad(-90)), .3)
	end
	trail.Enabled = false
	dam:disconnect()
	attack = false
end

local dash1 = function()
	attack = true
	for i = 0,1, 0.05 do
		wait()
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(20)), 0.3)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-20)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(.75, .4 - 0.1 * math.cos((sine) / 15), -.5) * CFrame.Angles(math.rad(60), math.rad(0), math.rad(-40)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-10)), 0.3)
		RH.C0 = clerp(RH.C0, CFrame.new(1, -1 + 0.1 * math.cos((sine) / 20), 0) * RHCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		LH.C0 = clerp(LH.C0, CFrame.new(-1, -1 + 0.1 * math.cos((sine) / 20), 0) * LHCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		weapon.Handle2.Weld.C0 = clerp(weapon.Handle2.Weld.C0, CFrame.new(-1.1, -1.2, .5) * CFrame.Angles(math.rad(210), math.rad(20), math.rad(90)), .3)
	end
	for i = 0,14 do
	char.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame * CFrame.new(0,0,-2)
	magnslic(2,char.Torso,4)
	end
	block(char.HumanoidRootPart.CFrame * CFrame.new(0,0,10),Vector3.new(0,0,20),Vector3.new(.2,.2,0),.1,BrickColor.new("New Yeller"), 2)
	weapon.Handle.Weld.Part0 = RightArm
	char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 1)
	char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 1)
	RW.C0 = clerp(RW.C0, CFrame.new(1.5, .5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(130), math.rad(0), math.rad(45)), 1)
	weapon.Handle.Weld.C0 = clerp(weapon.Handle.Weld.C0, CFrame.new(0,-1,0) * CFrame.Angles(math.rad(-90), math.rad(0), math.rad(0)), 1)
	local kek = 0
	trail.Enabled = true
	while kek > - 720 do
		wait()
		kek = kek - 30
		weapon.Handle.Weld.C0 = clerp(weapon.Handle.Weld.C0, CFrame.new(0,-1,0) * CFrame.Angles(math.rad(-90+kek), math.rad(0), math.rad(-90)), .6)
	end
	trail.Enabled = false
	for i = 0,1, 0.1 do
		wait()
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(20)), 0.3)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-20)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(.75, .4 - 0.1 * math.cos((sine) / 15), -.5) * CFrame.Angles(math.rad(60), math.rad(0), math.rad(-40)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-10)), 0.3)
		RH.C0 = clerp(RH.C0, CFrame.new(1, -1 + 0.1 * math.cos((sine) / 20), 0) * RHCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		LH.C0 = clerp(LH.C0, CFrame.new(-1, -1 + 0.1 * math.cos((sine) / 20), 0) * LHCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		weapon.Handle.Weld.C0 = clerp(weapon.Handle.Weld.C0, CFrame.new(0,-1,0) * CFrame.Angles(math.rad(-10), math.rad(140), math.rad(-130)), .3)
		weapon.Handle2.Weld.C0 = clerp(weapon.Handle2.Weld.C0, CFrame.new(-1.1, -1.2, .5) * CFrame.Angles(math.rad(210), math.rad(20), math.rad(90)), .3)
	end
	weapon.Handle.Weld.Part0 = weapon.Handle2
	attack = false
end

local dash2 = function()
	attack = true
	for i = 0,1, 0.1 do
		wait()
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(90)), 0.3)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-90)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, .5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(90)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-10)), 0.3)
		RH.C0 = clerp(RH.C0, CFrame.new(1, -1 + 0.1 * math.cos((sine) / 20), 0) * RHCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		LH.C0 = clerp(LH.C0, CFrame.new(-1, -1 + 0.1 * math.cos((sine) / 20), 0) * LHCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		weapon.Handle.Weld.C0 = clerp(weapon.Handle.Weld.C0, CFrame.new(0,-1,0) * CFrame.Angles(math.rad(-90), math.rad(0), math.rad(-90)), .6)
	end
	for i = 0,1, 0.05 do
		wait()
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, .5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90+math.random(-30,30)), math.rad(0), math.rad(90+math.random(-30,30))), 1)
		ball(weapon.Hitbox.CFrame,weapon.Hitbox.Size,Vector3.new(.2,0,0),.1,BrickColor.new("New Yeller"), 2)
		magn(3,weapon.Hitbox,5)
		char.Torso.Velocity = char.HumanoidRootPart.CFrame.lookVector * -50
	end
	for i = 0,1, 0.05 do
		wait()
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(30), math.rad(0), math.rad(0)), 0.3)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(-30), math.rad(0), math.rad(0)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, .5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(120), math.rad(0), math.rad(0)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), -.5) * CFrame.Angles(math.rad(120), math.rad(0), math.rad(40)), 0.3)
		RH.C0 = clerp(RH.C0, CFrame.new(1, -1 + 0.1 * math.cos((sine) / 20), 0) * RHCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		LH.C0 = clerp(LH.C0, CFrame.new(-1, -1 + 0.1 * math.cos((sine) / 20), 0) * LHCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		weapon.Handle.Weld.C0 = clerp(weapon.Handle.Weld.C0, CFrame.new(0,-1,0) * CFrame.Angles(math.rad(180), math.rad(0), math.rad(90)), .6)
	end
	trail.Enabled = true
	for i = 0,14 do
	char.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame * CFrame.new(0,0,-2)
	magnslic(1,char.Torso,4)
	end
	trail.Enabled = false
	block(char.HumanoidRootPart.CFrame * CFrame.new(0,0,10),Vector3.new(0,0,20),Vector3.new(.2,.2,0),.1,BrickColor.new("New Yeller"), 2)
	for i = 0,1, 0.1 do
		wait()
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, .5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(120), math.rad(0), math.rad(40)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-10)), 0.3)
		RH.C0 = clerp(RH.C0, CFrame.new(1, -1 + 0.1 * math.cos((sine) / 20), 0) * RHCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		LH.C0 = clerp(LH.C0, CFrame.new(-1, -1 + 0.1 * math.cos((sine) / 20), 0) * LHCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		weapon.Handle.Weld.C0 = clerp(weapon.Handle.Weld.C0, CFrame.new(0,-1,0) * CFrame.Angles(math.rad(90), math.rad(90), math.rad(-90)), .6)
	end
	attack = false
end

play:GetMouse().Button1Down:connect(function()
	if attack == false then
		if sheathed == false then
		if combo == 1 and attack == false then
			attack3()
			combo = 1
		elseif combo == 2 and attack == false then
			attack4()
			combo = 2
		end
		else
		if combo == 1 and attack == false then
			attack1()
			combo = 2
		elseif combo == 2 and attack == false then
			attack2()
			combo = 1
		end
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
	if k == "f" and attack == false then
	sheath()
	elseif k == "z" and attack == false and ccd1 >= cd1 then
	if sheathed == true then
	dash1()
	else
	dash2()
	end
	ccd1 = 0
	elseif k == "x" and attack == false and ccd2 >= cd2 then
	if sheathed == true then
	grab1()	
	else
	grab2()	
	end
	ccd2 = 0
	elseif k == "c" and attack == false and ccd3 >= cd3 then
	ccd3 = 0		
	elseif k == "v" and attack == false and ccd4 >= cd4 then
	ccd4 = 0
	end
end)

local keke = 0


coroutine.resume(coroutine.create(function()
while true do
	sine = sine + change
	torsovel = (char.HumanoidRootPart.Velocity * Vector3.new(1, 0, 1)).magnitude
					if sheathed == true then
					if torsovel < 1 then
						Anim = "Idle"
							change = 1
							if attack == false then
							char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
							char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
							RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(10)), 0.3)
							LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-10)), 0.3)
							weapon.Handle.Weld.C0 = clerp(weapon.Handle.Weld.C0, CFrame.new(0,.03,2.45) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 1)
							weapon.Handle2.Weld.C0 = clerp(weapon.Handle2.Weld.C0, CFrame.new(-1.1, -1.2, .5) * CFrame.Angles(math.rad(190), math.rad(0), math.rad(90)), 1)
							end
							if canmove == true then
							RH.C0 = clerp(RH.C0, CFrame.new(1, -1 + 0.1 * math.cos((sine) / 20), 0) * RHCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
							LH.C0 = clerp(LH.C0, CFrame.new(-1, -1 + 0.1 * math.cos((sine) / 20), 0) * LHCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
							end	
					elseif 2 < torsovel then
							Anim = "Walk"
								if attack == false then
								char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
								char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
								RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(-10), math.rad(0), math.rad(10)), 0.3)
								LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(-10), math.rad(0), math.rad(-10)), 0.3)
								weapon.Handle.Weld.C0 = clerp(weapon.Handle.Weld.C0, CFrame.new(0,.03,2.45) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 1)
								weapon.Handle2.Weld.C0 = clerp(weapon.Handle2.Weld.C0, CFrame.new(-1.1, -1.2, .5) * CFrame.Angles(math.rad(190), math.rad(0), math.rad(90)), 1)
								end
								if canmove == true then
								RH.C0 = clerp(RH.C0, CFrame.new(1, -1 + 0.1 * math.cos((sine) / 20), 0) * RHCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0 - 50 * math.cos((sine) / 3))), 0.3)
								LH.C0 = clerp(LH.C0, CFrame.new(-1, -1 + 0.1 * math.cos((sine) / 20), 0.1) * LHCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0 - 50 * math.cos((sine) / 3))), 0.3)
								end
					end
					else
					if torsovel < 1 then
						Anim = "Idle"
							change = 1
							if attack == false then
							char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
							char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
							RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(10)), 0.3)
							LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-10)), 0.3)
							weapon.Handle.Weld.C0 = clerp(weapon.Handle.Weld.C0, CFrame.new(0,-1,0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-90)), 1)
							weapon.Handle2.Weld.C0 = clerp(weapon.Handle2.Weld.C0, CFrame.new(0,-1,1) * CFrame.Angles(math.rad(180), math.rad(0), math.rad(90)), 1)
							end
							if canmove == true then
							RH.C0 = clerp(RH.C0, CFrame.new(1, -1 + 0.1 * math.cos((sine) / 20), 0) * RHCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
							LH.C0 = clerp(LH.C0, CFrame.new(-1, -1 + 0.1 * math.cos((sine) / 20), 0) * LHCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)	
							end
					elseif 2 < torsovel then
							Anim = "Walk"
								if attack == false then
								char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
								char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
								RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(-10), math.rad(0), math.rad(10)), 0.3)
								LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(-10), math.rad(0), math.rad(-10)), 00.3)
								weapon.Handle.Weld.C0 = clerp(weapon.Handle.Weld.C0, CFrame.new(0,-1,0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-90)), 1)
								weapon.Handle2.Weld.C0 = clerp(weapon.Handle2.Weld.C0, CFrame.new(0,-1,1) * CFrame.Angles(math.rad(180), math.rad(0), math.rad(90)), 1)
								end
								if canmove == true then
								RH.C0 = clerp(RH.C0, CFrame.new(1, -1 + 0.1 * math.cos((sine) / 20), 0) * RHCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0 - 50 * math.cos((sine) / 3))), 0.3)
								LH.C0 = clerp(LH.C0, CFrame.new(-1, -1 + 0.1 * math.cos((sine) / 20), 0.1) * LHCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0 - 50 * math.cos((sine) / 3))), 0.3)
								end					
					end
					end
wait()
end
end))

while true do
wait()
end