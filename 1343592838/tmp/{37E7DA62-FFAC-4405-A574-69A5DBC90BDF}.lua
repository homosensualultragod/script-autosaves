wait(.2)
local play = game.Players.LocalPlayer
local char = play.Character
local LeftArm = char["Left Arm"]
local RightArm = char["Right Arm"]
local LeftLeg = char["Left Leg"]
local RightLeg = char["Right Leg"]
local spawned = false
local debounce = false
local asdrot = 0
local mode = "Combo"
local mana = 200
local change = 0
local rage = false
local explosion = false
local golden = false
local equipped = true
local equipcheck = true
local sped = 1
local healing = false
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


local model = Instance.new("Model", char)
model.Name = "weapon parts go here!"
local weapon = Instance.new("Model", model)
weapon.Name = "weapon"


local nolagplease = Instance.new("Model", char)
nolagplease.Name = "Block spam goes here"


Block = function(cfram,size,expansize,transp,color,kind)
local p = Instance.new("Part", nolagplease)
p.CFrame = cfram
p.Size = size
p.Anchored = true
p.Material = "Neon"
p.CanCollide = false
if golden == false then
p.BrickColor = color
end
if golden == true then
p.BrickColor = BrickColor.new("New Yeller")
end
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

local screengu = Instance.new("ScreenGui", play.PlayerGui)
screengu.Enabled = true

local fram = Instance.new("Frame",screengu)
fram.Position = UDim2.new(0.83,0,.46, 0)
fram.Size = UDim2.new(0.156, 0,0.487, 0)
fram.Style = "RobloxRound"

local makegui = function(pos1,pos2,tex)
local a = Instance.new("TextLabel",fram)
a.Size = UDim2.new(0, 280,0, 25)
a.Text = tex
a.Position = UDim2.new(0,pos1,0,pos2)
a.TextScaled = true
a.TextColor3 = char.Torso.Color
a.TextXAlignment = "Left"
a.BackgroundTransparency = 1
coroutine.resume(coroutine.create(function()
if tex == "[Q]  Mode : Combo" then
while true do
a.Text = "[Q]  Mode : "..mode..""
wait()
end
end
if tex == "[Q]  Mode : Combo" then
while true do
a.Text = "[Q]  Mode : "..mode..""
wait()
end
end
if tex == "[K] : Sit / Stand" then
while true do
if sit == true then
a.Text = "[K] : Stand"	
end
if sit == false then
a.Text = "[K] : Sit"	
end
wait()
end
end
if tex == "[1] : Equip / Unequip" then
while true do
if equipped == true then
a.Text = "[1] : Unequip"
end
if equipped == false then
a.Text = "[1] : Equip"
end
wait()
end
end
end))
end

local bar = Instance.new("Frame",screengu)
bar.Position = UDim2.new(.83,0,.385,0)
bar.Size = UDim2.new(0.156,0,0.055,0)
bar.Style = "RobloxRound"

local neg = Instance.new("Frame", bar)
neg.Position = UDim2.new(0,0,0,0)
neg.Size = UDim2.new(1,0,0.6,0)
neg.BackgroundColor3 = Color3.fromRGB(0,0,0)
neg.BorderColor3 = char.Torso.Color

local a = Instance.new("TextBox",neg)
a.Size = UDim2.new(0, 280,0, 25)
a.Position = UDim2.new(0, 0, 1, 0)
a.TextXAlignment = "Center"
coroutine.resume(coroutine.create(function()
while true do
a.Text = "Mana : "..math.floor(mana)..""
wait()
end
end))
a.TextScaled = true
a.TextColor3 = char.Torso.Color
a.BackgroundTransparency = 1

local manabar = Instance.new("Frame", neg)
manabar.Position = UDim2.new(0,0,0,0)
manabar.Size = UDim2.new(0,0,0,0)
manabar.BackgroundColor3 = char.Torso.Color
manabar.BorderColor3 = Color3.fromRGB(0,0,0)
coroutine.resume(coroutine.create(function()
while true do
manabar.Size = UDim2(0,mana*1.4,0,30)
wait()
end
end))

makegui(0,0,"[Q]  Mode : Combo")
makegui(0,60,"[R] : Charge Shot (Hold)")
makegui(0,120,"[B] : Rage Buff")
makegui(0,210,"[F] : Summon Chariot")
makegui(0,90,"[T] : Bounce Shot")
makegui(0,30,"[E] : Spin")
makegui(0,150,"[J] : Explosion Buff")
makegui(0,300,"[X] : Halo Buff")
makegui(0,270,"[Z] : Self Halo")
makegui(0,510,"[1] : Equip / Unequip")
makegui(0,360,"[V] : Speed Buff")
makegui(0,330,"[C] : Heal (Hold)")
makegui(0,540,"[K] : Sit / Stand")
makegui(0,420,"[H] : Ultima")




local damageindicator = function(typ,cfram,dam)
coroutine.resume(coroutine.create(function()
local m = Instance.new("Model", nolagplease)
if dam > 1 then
local p1 = Instance.new("Part", m)
p1.Anchored = true
p1.Shape = "Cylinder"
p1.Size = Vector3.new(.4,1,1)
p1.CanCollide = false
if typ == 1 then
p1.Material = "Granite"
p1.BrickColor = BrickColor.new("Really black")
end
if typ == 2 then
p1.Material = "Marble"
p1.BrickColor = BrickColor.new("Institutional white")
end
p1.CFrame = cfram * CFrame.new(math.random(-2,2),2,math.random(-2,2)) * CFrame.fromEulerAnglesXYZ(0,0,math.rad(90))
local p2 = Instance.new("Part", m)
p2.Anchored = true
p2.Shape = "Cylinder"
p2.Size = Vector3.new(.45,.75,.75)
p2.CanCollide = false
p2.Material = "Neon"
p2.CFrame = p1.CFrame
if typ == 1 then
p2.BrickColor = char.Torso.BrickColor
end
if typ == 2 then
p2.BrickColor = BrickColor.new("New Yeller")
end
local p3 = Instance.new("Part", m)
p3.Anchored = true
p3.Shape = "Cylinder"
p3.Size = Vector3.new(.5,.5,.5)
p3.CanCollide = false
p3.Name = "Head"
if typ == 1 then
p1.Material = "Granite"
p1.BrickColor = BrickColor.new("Really black")
end
if typ == 2 then
p1.Material = "Marble"
p1.BrickColor = BrickColor.new("Institutional white")
end
local hum = Instance.new("Humanoid",m)
m.Name = "-"..dam..""
while p1.Transparency < 1 do
	p1.Transparency = p1.Transparency + 0.01
	p3.Transparency = p1.Transparency
	p1.CFrame = p1.CFrame * CFrame.new(0.05,0,0)
	p2.CFrame = p1.CFrame
	p3.CFrame = p1.CFrame
	wait()
end
m:Destroy()
end


if dam < 1 then
local p1 = Instance.new("Part", m)
p1.Anchored = true
p1.Shape = "Cylinder"
p1.Size = Vector3.new(.4,1,1)
p1.CanCollide = false
p1.Material = "Marble"
p1.BrickColor = BrickColor.new("Institutional white")
p1.CFrame = cfram * CFrame.new(math.random(-2,2),2,math.random(-2,2)) * CFrame.fromEulerAnglesXYZ(0,0,math.rad(90))
local p2 = Instance.new("Part", m)
p2.Anchored = true
p2.Shape = "Cylinder"
p2.Size = Vector3.new(.45,.75,.75)
p2.CanCollide = false
p2.Material = "Neon"
p2.CFrame = p1.CFrame
p2.BrickColor = BrickColor.new("Lime green")
local p3 = Instance.new("Part", m)
p3.Anchored = true
p3.Shape = "Cylinder"
p3.Size = Vector3.new(.5,.5,.5)
p3.CanCollide = false
p3.Name = "Head"
p3.Material = "Marble"
p3.BrickColor = BrickColor.new("Institutional white")
local hum = Instance.new("Humanoid",m)
m.Name = "+"..-dam..""
while p1.Transparency < 1 do
	p1.Transparency = p1.Transparency + 0.01
	p3.Transparency = p1.Transparency
	p1.CFrame = p1.CFrame * CFrame.new(0.05,0,0)
	p2.CFrame = p1.CFrame
	p3.CFrame = p1.CFrame
	wait()
end
m:Destroy()
end
end))
end


local golddebounce = false

magngold = function(mindam,maxdam,par,dist)
	
	for _,c in pairs(workspace:children()) do
		local hum = c:findFirstChild("Humanoid")
		if hum ~= nil then
			local head = c:findFirstChild("HumanoidRootPart")
			local damage = math.random(mindam,maxdam)
			if rage == true then
				damage = damage*2
			end
			if head ~= nil then
				local targ = head.Position - par.Position
				local mag = targ.magnitude
				if rage == true then
					mag = mag/2
				end
				if mag <= dist and c.Name ~= play.Name then
					hum.Health = hum.Health - damage
					if damage > 1 then
					if golden == true then
					Block(par.CFrame,Vector3.new(10,10,10),Vector3.new(1,1,1),0.15,BrickColor.new("New Yeller"),1)
					end
					damageindicator(2,head.CFrame,damage)
					end
					if damage < 1 and hum.Health < hum.MaxHealth then
						damageindicator(2,head.CFrame,damage)
					end
				end
			end
		end
	end
end


magn = function(mindam,maxdam,par,dist)
	
	for _,c in pairs(workspace:children()) do
		local hum = c:findFirstChild("Humanoid")
		if hum ~= nil then
			local head = c:findFirstChild("Head")
			local damage = math.random(mindam,maxdam)
			if rage == true then
				damage = damage*2
			end
			if head ~= nil then
				local targ = head.Position - par.Position
				local mag = targ.magnitude
				if rage == true then
					mag = mag/2
				end
				if mag <= dist and c.Name ~= play.Name then
					if damage > 0 then
					mana = mana + damage
					end
					hum.Health = hum.Health - damage
					if damage > 1 then
					if golden == true and golddebounce == false then
						coroutine.resume(coroutine.create(function()
						golddebounce = true
						magngold(mindam,maxdam,par,10)
						wait(0.1)
						golddebounce = false
						end))
						
					end
					if explosion == true then
					explosion = false
					magn(20,20,par,20)
					Block(par.CFrame,Vector3.new(15,15,15),Vector3.new(1,1,1),0.05,BrickColor.new("Institutional white"),1)
					end
					damageindicator(1,head.CFrame,damage)
					end
					if damage < 1 and hum.Health < hum.MaxHealth then
						damageindicator(1,head.CFrame,damage)
					end
				end
			end
		end
	end
end

healperson = workspace

magnhalo = function(mindam,maxdam,par,dist)
	
	for _,c in pairs(workspace:children()) do
		local hum = c:findFirstChild("Humanoid")
		if hum ~= nil then
			local head = c:findFirstChild("Head")
			local damage = math.random(mindam,maxdam)
			if head ~= nil then
				local targ = head.Position - par.Position
				local mag = targ.magnitude
				if mag <= dist and c.Name ~= play.Name and hum.MaxHealth ~= 200 then
					healperson = hum.Parent
					while healperson ~= workspace do
					shoottrailheal(play:GetMouse(),weapon.Hitbox, 2, 1)
					wait(.075)
					end
				end
			end
		end
	end
end

magnspeed = function(mindam,maxdam,par,dist)
	for _,c in pairs(workspace:children()) do
		local hum = c:findFirstChild("Humanoid")
		if hum ~= nil then
			local head = c:findFirstChild("HumanoidRootPart")
			local damage = math.random(mindam,maxdam)
			if head ~= nil then
				local targ = head.Position - par.Position
				local mag = targ.magnitude
				if mag <= dist and c.Name ~= play.Name then
					for i = 0,149 do
						hum.WalkSpeed = 64
						Block(head.Parent["Right Leg"].CFrame * CFrame.new(0,-.5,0),Vector3.new(1,1,1),Vector3.new(0.05,0.05,0.05),0.05,char.Torso.BrickColor,1)
						Block(head.Parent["Left Leg"].CFrame * CFrame.new(0,-.5,0),Vector3.new(1,1,1),Vector3.new(0.05,0.05,0.05),0.05,char.Torso.BrickColor,1)
						wait(0.1)
					end
					hum.WalkSpeed = 16
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




local asd = 0

part2 = function(wel,cancollid,size,shape,color,transp,mat,weldpart,c0,nam)
if shape ~= "Wedge" then
local q = Instance.new("Part", model)
q.CustomPhysicalProperties = PhysicalProperties.new(0,0,0,0,0)
q.Shape = shape
q.Size = size
q.CFrame = CFrame.new(100,100,100)
q.Transparency = 1
q.BrickColor = color
q.Material = mat
if cancollid == 1 then
q.CanCollide = false
end
q.Name = nam
if wel == 1 then
end
local qw = Instance.new("Weld", q)
qw.Part0 = weldpart
qw.Part1 = q
qw.C0 = c0
coroutine.resume(coroutine.create(function()
while q.Transparency >= 0 and transp ~= 1 do
q.Transparency = q.Transparency - 0.05
wait()
end
q.Transparency = transp
if weldpart == model.spinneblock then
q.CanCollide = false
q.Anchored = true
coroutine.resume(coroutine.create(function()
while true do
q.CFrame = model.spinneblock.CFrame * c0
wait()
end
end))
end
if nam == "spinneblock" then
qw:Destroy()
q.CanCollide = false
q.Anchored = true
local asd2 = 0
while true do
q.CFrame = model.spinneblock2.CFrame * CFrame.fromEulerAnglesXYZ(math.rad(asd2),0,0)
asd2 = asd2 + 1
wait()
end
end
--[[game:service'RunService'.RenderStepped:connect(function() 
if riding == true then
q.CFrame = weldpart.CFrame * c0
asd = asd + 1
if nam == "spinneblock" then
magn(.3,model.spinneblock,5)
end
end
end)]]
if q.Name == "spinneblock" then
while true do
--if char.Torso.Velocity.X ~= 0 or char.Torso.Velocity.Z ~= 0 then

--end
wait()
end
end
end))
end
if shape == "Wedge" then
local q = Instance.new("WedgePart", model)
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
coroutine.resume(coroutine.create(function()
while q.Transparency >= 0 do
q.Transparency = q.Transparency - 0.01
wait()
end
q.Transparency = transp
end))
end
end

part(1,1,Vector3.new(6.9124989509583,0.43749994039536,0.43749994039536),"Cylinder",BrickColor.new("Institutional white"),1,"Marble",LeftArm,CFrame.new(0,2.6,-1)*CFrame.fromOrientation(0,-1.6114623971662,1.5707963267949),"Handle")
part(1,1,Vector3.new(6.9124989509583,0.43749994039536,0.43749994039536),"Cylinder",BrickColor.new("Institutional white"),0,"Marble",weapon.Handle,CFrame.new(-3.6566977500916,0.0050044059753418,0.072273254394531)*CFrame.fromOrientation(0,1.6114623971662,1.5707963267949),"NotTheHandle")
part(1,1,Vector3.new(0.25,0.90000009536743,0.90000009536743),"Cylinder",BrickColor.new("Institutional white"),0,"Marble",weapon.Handle,CFrame.new(-4.3819403648376,4.9165663719177,0.18930053710938)*CFrame.fromOrientation(0.80285145591739,1.6114623971662,0),"Cylinder")
part(1,1,Vector3.new(0.30000001192093,0.60000002384186,0.60000002384186),"Cylinder",BrickColor.new("Institutional white"),0,"Marble",weapon.Handle,CFrame.new(-4.3819403648376,4.9165663719177,0.18930053710938)*CFrame.fromOrientation(0.80285145591739,1.6114623971662,0),"Cylinder")
part(1,1,Vector3.new(0.25,0.90000009536743,0.90000009536743),"Cylinder",BrickColor.new("Institutional white"),0,"Marble",weapon.Handle,CFrame.new(-4.7022757530212,4.1612601280212,0.20230102539063)*CFrame.fromOrientation(0,1.6114623971662,0),"Cylinder")
part(1,1,Vector3.new(0.30000001192093,0.60000002384186,0.60000002384186),"Cylinder",BrickColor.new("Institutional white"),0,"Marble",weapon.Handle,CFrame.new(-2.6040167808533,4.1612668037415,0.11708831787109)*CFrame.fromOrientation(0,1.6114623971662,0),"Cylinder")
part(1,1,Vector3.new(0.25,0.90000009536743,0.90000009536743),"Cylinder",BrickColor.new("Institutional white"),0,"Marble",weapon.Handle,CFrame.new(-2.6040167808533,4.1612668037415,0.11708831787109)*CFrame.fromOrientation(0,1.6114623971662,0),"Cylinder")
part(1,1,Vector3.new(0.25,0.90000009536743,0.90000009536743),"Cylinder",BrickColor.new("Institutional white"),0,"Marble",weapon.Handle,CFrame.new(-3.6165289878845,5.2106223106384,0.15821075439453)*CFrame.fromOrientation(1.535889741755,-1.5301301232655,3.1415926535898),"Cylinder")
part(1,1,Vector3.new(0.30000001192093,0.60000002384186,0.60000002384186),"Cylinder",BrickColor.new("Institutional white"),0,"Marble",weapon.Handle,CFrame.new(-3.6165289878845,5.2106223106384,0.15821075439453)*CFrame.fromOrientation(1.535889741755,-1.5301301232655,3.1415926535898),"Cylinder")
part(1,1,Vector3.new(0.30000001192093,0.60000002384186,0.60000002384186),"Cylinder",BrickColor.new("Institutional white"),0,"Marble",weapon.Handle,CFrame.new(-2.8734946250916,4.8638548851013,0.12803649902344)*CFrame.fromOrientation(0.73303828583762,-1.5301301232655,3.1415926535898),"Cylinder")
part(1,1,Vector3.new(0.25,0.90000009536743,0.90000009536743),"Cylinder",BrickColor.new("Institutional white"),0,"Marble",weapon.Handle,CFrame.new(-2.8734946250916,4.8638548851013,0.12803649902344)*CFrame.fromOrientation(0.73303828583762,-1.5301301232655,3.1415926535898),"Cylinder")
part(1,1,Vector3.new(0.5818749666214,0.79187315702438,0.087499998509884),"Block",BrickColor.new("Institutional white"),0,"Marble",weapon.Handle,CFrame.new(-3.6549201011658,4.2487788200378,0.11595153808594)*CFrame.fromOrientation(-0.78539816339745,-1.5301301232655,3.1415926535898),"Block")
part(1,1,Vector3.new(0.52499997615814,1.0499999523163,1.0499999523163),"Cylinder",BrickColor.new("Institutional white"),0,"Marble",weapon.Handle,CFrame.new(-3.6549124717712,4.2487463951111,0.11598205566406)*CFrame.fromOrientation(0,1.6114623971662,0),"Cylinder")
part(1,1,Vector3.new(0.61249995231628,0.52499997615814,0.52499997615814),"Cylinder",BrickColor.new("Institutional white"),0,"Marble",weapon.Handle,CFrame.new(-3.6549124717712,4.2487463951111,0.11598205566406)*CFrame.fromOrientation(0,1.6114623971662,0),"Cylinder")
part(1,1,Vector3.new(0.5818749666214,0.79187315702438,0.087499998509884),"Block",BrickColor.new("Institutional white"),0,"Marble",weapon.Handle,CFrame.new(-3.6549201011658,4.2487788200378,0.11595153808594)*CFrame.fromOrientation(0.78539816339745,-1.5301301232655,3.1415926535898),"Hitbox")
part(1,1,Vector3.new(0.43749994039536,1.5749998092651,1.5749998092651),"Cylinder",BrickColor.new("Institutional white"),0,"Marble",weapon.Handle,CFrame.new(-3.6549124717712,4.2487463951111,0.11598205566406)*CFrame.fromOrientation(0,1.6114623971662,0),"Cylinder")
part(1,1,Vector3.new(0.43749994039536,0.43749994039536,0.43749994039536),"Ball",BrickColor.new("Institutional white"),0,"Marble",weapon.Handle,CFrame.new(-3.6567053794861,-3.4512510299683,0.072273254394531)*CFrame.fromOrientation(0,1.6114623971662,1.5707963267949),"Ball")
part(1,1,Vector3.new(0.87499988079071,0.87499988079071,0.87499988079071),"Ball",BrickColor.new("Institutional white"),0,"Marble",weapon.Handle,CFrame.new(-3.6567053794861,3.1987547874451,0.072273254394531)*CFrame.fromOrientation(0,1.6114623971662,1.5707963267949),"Ball")
part(1,1,Vector3.new(0.87499988079071,0.87499988079071,0.87499988079071),"Ball",BrickColor.new("Institutional white"),0,"Marble",weapon.Handle,CFrame.new(-3.6567053794861,3.5487551689148,0.072273254394531)*CFrame.fromOrientation(0,1.6114623971662,1.5707963267949),"Ball")
part(1,1,Vector3.new(0.17499999701977,0.87499988079071,0.87499988079071),"Cylinder",BrickColor.new("Institutional white"),0,"Marble",weapon.Handle,CFrame.new(-3.6566977500916,3.2862496376038,0.072280883789063)*CFrame.fromOrientation(0,1.6114623971662,1.5707963267949),"Cylinder")
part(1,1,Vector3.new(0.087499998509884,0.87499988079071,0.87499988079071),"Cylinder",BrickColor.new("Institutional white"),0,"Marble",weapon.Handle,CFrame.new(-3.6567053794861,3.5050024986267,0.072273254394531)*CFrame.fromOrientation(0,1.6114623971662,1.5707963267949),"Cylinder")
part(1,1,Vector3.new(0.30000001192093,0.60000002384186,0.60000002384186),"Cylinder",BrickColor.new("Institutional white"),0,"Marble",weapon.Handle,CFrame.new(-4.7022757530212,4.1612601280212,0.20230102539063)*CFrame.fromOrientation(0,1.6114623971662,0),"Cylinder")

part(1,1,Vector3.new(0.17499999701977,0.45937496423721,0.087499998509884),"Block",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-3.6543550491333,-1.7870727777481,0.072166003286839)*CFrame.fromOrientation(0,1.6114623971662,1.5707963267949),"Block")
part(1,1,Vector3.new(0.17499999701977,0.45937496423721,0.087499998509884),"Block",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-3.6543629169464,-2.3120574951172,0.072166003286839)*CFrame.fromOrientation(0,1.6114623971662,1.5707963267949),"Block")
part(1,1,Vector3.new(0.17499999701977,0.45937496423721,0.087499998509884),"Block",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-3.6543629169464,-2.0495653152466,0.072166003286839)*CFrame.fromOrientation(0,-3.1009264500604,1.5707963267949),"Block")
part(1,1,Vector3.new(0.2799998819828,0.90250033140182,0.050000000745058),"Block",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-3.6165359020233,5.2123107910156,0.15818800032139)*CFrame.fromOrientation(-0.75049157835756,1.6114623971662,0),"Block")
part(1,1,Vector3.new(0.17499999701977,0.45937496423721,0.087499998509884),"Block",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-3.6543550491333,1.6254261732101,0.072166003286839)*CFrame.fromOrientation(0,-3.1009264500604,1.5707963267949),"Block")
part(1,1,Vector3.new(0.087499998509884,0.48124995827675,0.48124995827675),"Cylinder",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-3.6566979885101,1.7566803693771,0.072281002998352)*CFrame.fromOrientation(0,1.6114623971662,1.5707963267949),"Cylinder")
part(1,1,Vector3.new(0.17499999701977,0.45937496423721,0.087499998509884),"Block",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-3.6543550491333,0.57543158531189,0.072166003286839)*CFrame.fromOrientation(0,-3.1009264500604,1.5707963267949),"Block")
part(1,1,Vector3.new(0.087499998509884,0.48124995827675,0.48124995827675),"Cylinder",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-3.6566979885101,0.70667624473572,0.072281002998352)*CFrame.fromOrientation(0,1.6114623971662,1.5707963267949),"Cylinder")
part(1,1,Vector3.new(0.087499998509884,0.48124995827675,0.48124995827675),"Cylinder",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-3.6567049026489,0.96918368339539,0.072273001074791)*CFrame.fromOrientation(0,1.6114623971662,1.5707963267949),"Cylinder")
part(1,1,Vector3.new(0.2799998819828,0.90250033140182,0.050000000745058),"Block",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-2.8734951019287,4.8655347824097,0.12801399827003)*CFrame.fromOrientation(0.83775804095728,1.6114623971662,0),"Block")
part(1,1,Vector3.new(0.17499999701977,0.45937496423721,0.087499998509884),"Block",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-3.6543629169464,1.1004437208176,0.072166003286839)*CFrame.fromOrientation(0,-3.1009264500604,1.5707963267949),"Block")
part(1,1,Vector3.new(0.087499998509884,0.48124995827675,0.48124995827675),"Cylinder",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-3.6566979885101,-2.4433150291443,0.072281002998352)*CFrame.fromOrientation(0,1.6114623971662,1.5707963267949),"Cylinder")
part(1,1,Vector3.new(0.2799998819828,0.90250033140182,0.050000000745058),"Block",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-4.7022910118103,4.1629467010498,0.20226299762726)*CFrame.fromOrientation(-1.5707963267949,1.6114623971662,0),"Block")
part(1,1,Vector3.new(0.2799998819828,0.90250033140182,0.050000000745058),"Block",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-4.3819398880005,4.9182729721069,0.18926200270653)*CFrame.fromOrientation(0.80285145591739,1.6114623971662,0),"Block")
part(1,1,Vector3.new(0.087499998509884,0.48124995827675,0.48124995827675),"Cylinder",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-3.6566979885101,-1.9183127880096,0.072281002998352)*CFrame.fromOrientation(0,1.6114623971662,1.5707963267949),"Cylinder")
part(1,1,Vector3.new(0.17499999701977,0.45937496423721,0.087499998509884),"Block",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-3.6543629169464,-1.2620602846146,0.072166003286839)*CFrame.fromOrientation(0,1.6114623971662,1.5707963267949),"Block")
part(1,1,Vector3.new(0.17499999701977,0.45937496423721,0.087499998509884),"Block",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-3.6543629169464,-1.5245697498322,0.072166003286839)*CFrame.fromOrientation(0,-3.1009264500604,1.5707963267949),"Block")
part(1,1,Vector3.new(0.087499998509884,0.48124995827675,0.48124995827675),"Cylinder",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-3.6566979885101,-1.1308223009109,0.072281002998352)*CFrame.fromOrientation(0,1.6114623971662,1.5707963267949),"Cylinder")
part(1,1,Vector3.new(0.17499999701977,0.45937496423721,0.087499998509884),"Block",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-3.6543629169464,1.8879355192184,0.072166003286839)*CFrame.fromOrientation(0,1.6114623971662,1.5707963267949),"Block")
part(1,1,Vector3.new(0.087499998509884,0.48124995827675,0.48124995827675),"Cylinder",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-3.6567049026489,-1.3933182954788,0.072273001074791)*CFrame.fromOrientation(0,1.6114623971662,1.5707963267949),"Cylinder")
part(1,1,Vector3.new(0.17499999701977,0.45937496423721,0.087499998509884),"Block",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-3.6543629169464,-0.99956429004669,0.072166003286839)*CFrame.fromOrientation(0,-3.1009264500604,1.5707963267949),"Block")
part(1,1,Vector3.new(0.2799998819828,0.90250033140182,0.050000000745058),"Block",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-3.6165359020233,5.2123107910156,0.15818800032139)*CFrame.fromOrientation(0.82030474843733,1.6114623971662,0),"Block")
part(1,1,Vector3.new(0.17499999701977,0.45937496423721,0.087499998509884),"Block",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-3.6543629169464,1.3629378080368,0.072166003286839)*CFrame.fromOrientation(0,1.6114623971662,1.5707963267949),"Block")
part(1,1,Vector3.new(0.17499999701977,0.45937496423721,0.087499998509884),"Block",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-3.6543710231781,-0.21205639839172,0.072173997759819)*CFrame.fromOrientation(0,1.6114623971662,1.5707963267949),"Block")
part(1,1,Vector3.new(0.2799998819828,0.90250033140182,0.050000000745058),"Block",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-4.3819398880005,4.9182729721069,0.18926200270653)*CFrame.fromOrientation(-1.553343034275,1.6114623971662,0),"Block")
part(1,1,Vector3.new(0.087499998509884,0.87499988079071,0.87499988079071),"Cylinder",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-3.6567049026489,3.4191846847534,0.072273001074791)*CFrame.fromOrientation(0,1.6114623971662,1.5707963267949),"Cylinder")
part(1,1,Vector3.new(0.2799998819828,0.90250033140182,0.050000000745058),"Block",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-4.3819398880005,4.9182729721069,0.18926200270653)*CFrame.fromOrientation(-0.7679448708775,1.6114623971662,0),"Block")
part(1,1,Vector3.new(0.2799998819828,0.90250033140182,0.050000000745058),"Block",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-3.6165359020233,5.2123107910156,0.15818800032139)*CFrame.fromOrientation(1.535889741755,-1.5301301232655,3.1415926535898),"Block")
part(1,1,Vector3.new(0.087499998509884,0.48124995827675,0.48124995827675),"Cylinder",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-3.6566979885101,0.44418400526047,0.072281002998352)*CFrame.fromOrientation(0,1.6114623971662,1.5707963267949),"Cylinder")
part(1,1,Vector3.new(0.4899996817112,1.5793751478195,0.087499998509884),"Block",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-3.6549348831177,4.2504568099976,0.11595200002193)*CFrame.fromOrientation(-0.78539816339745,-1.5301301232655,3.1415926535898),"Block")
part(1,1,Vector3.new(0.4899996817112,1.5793751478195,0.087499998509884),"Block",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-3.6549348831177,4.2504568099976,0.11595200002193)*CFrame.fromOrientation(-1.5707963267949,1.6114623971662,0),"Block")
part(1,1,Vector3.new(0.2799998819828,0.90250033140182,0.050000000745058),"Block",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-2.6040239334106,4.1629428863525,0.11707299947739)*CFrame.fromOrientation(-0.78539816339745,1.6114623971662,0),"Block")
part(1,1,Vector3.new(0.2799998819828,0.90250033140182,0.050000000745058),"Block",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-4.3819398880005,4.9182729721069,0.18926200270653)*CFrame.fromOrientation(0.017453292519943,1.6114623971662,0),"Block")
part(1,1,Vector3.new(0.2799998819828,0.90250033140182,0.050000000745058),"Block",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-2.6040239334106,4.1629428863525,0.11707299947739)*CFrame.fromOrientation(-1.5707963267949,1.6114623971662,0),"Block")
part(1,1,Vector3.new(0.087499998509884,0.48124995827675,0.48124995827675),"Cylinder",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-3.6566979885101,1.2316797971725,0.072281002998352)*CFrame.fromOrientation(0,1.6114623971662,1.5707963267949),"Cylinder")
part(1,1,Vector3.new(0.2799998819828,0.90250033140182,0.050000000745058),"Block",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-4.7022910118103,4.1629467010498,0.20226299762726)*CFrame.fromOrientation(-0.78539816339745,-1.5301301232655,3.1415926535898),"Block")
part(1,1,Vector3.new(0.27500003576279,0.75000011920929,0.75000011920929),"Cylinder",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-4.7022762298584,4.1629428863525,0.2023009955883)*CFrame.fromOrientation(0,1.6114623971662,0),"Cylinder")
part(1,1,Vector3.new(0.087499998509884,0.48124995827675,0.48124995827675),"Cylinder",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-3.6567049026489,-0.86831963062286,0.072273001074791)*CFrame.fromOrientation(0,1.6114623971662,1.5707963267949),"Cylinder")
part(1,1,Vector3.new(0.087499998509884,0.48124995827675,0.48124995827675),"Cylinder",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-3.6566979885101,-0.080818429589272,0.072281002998352)*CFrame.fromOrientation(0,1.6114623971662,1.5707963267949),"Cylinder")
part(1,1,Vector3.new(0.2799998819828,0.90250033140182,0.050000000745058),"Block",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-2.6040239334106,4.1629428863525,0.11707299947739)*CFrame.fromOrientation(0,1.6114623971662,0),"Block")
part(1,1,Vector3.new(0.48124995827675,1.3125,1.3125),"Cylinder",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-3.6549119949341,4.2504329681396,0.11598200351)*CFrame.fromOrientation(0,1.6114623971662,0),"Cylinder")
part(1,1,Vector3.new(0.17499999701977,0.45937496423721,0.087499998509884),"Block",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-3.6543629169464,0.31293362379074,0.072166003286839)*CFrame.fromOrientation(0,1.6114623971662,1.5707963267949),"Block")
part(1,1,Vector3.new(0.087499998509884,0.48124995827675,0.48124995827675),"Cylinder",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-3.6566979885101,-0.60581982135773,0.072281002998352)*CFrame.fromOrientation(0,1.6114623971662,1.5707963267949),"Cylinder")
part(1,1,Vector3.new(0.2799998819828,0.90250033140182,0.050000000745058),"Block",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-2.8734951019287,4.8655347824097,0.12801399827003)*CFrame.fromOrientation(0.73303828583762,-1.5301301232655,3.1415926535898),"Block")
part(1,1,Vector3.new(0.17499999701977,0.45937496423721,0.087499998509884),"Block",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-3.6543550491333,-0.73706829547882,0.072166003286839)*CFrame.fromOrientation(0,1.6114623971662,1.5707963267949),"Block")
part(1,1,Vector3.new(0.087499998509884,0.48124995827675,0.48124995827675),"Cylinder",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-3.6567049026489,2.0191876888275,0.072273001074791)*CFrame.fromOrientation(0,1.6114623971662,1.5707963267949),"Cylinder")
part(1,1,Vector3.new(0.17499999701977,0.45937496423721,0.087499998509884),"Block",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-3.6543550491333,-0.47457233071327,0.072166003286839)*CFrame.fromOrientation(0,-3.1009264500604,1.5707963267949),"Block")
part(1,1,Vector3.new(0.27500003576279,0.75000011920929,0.75000011920929),"Cylinder",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-2.6040170192719,4.1629447937012,0.11708799749613)*CFrame.fromOrientation(0,1.6114623971662,0),"Cylinder")
part(1,1,Vector3.new(0.2799998819828,0.90250033140182,0.050000000745058),"Block",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-4.7022910118103,4.1629467010498,0.20226299762726)*CFrame.fromOrientation(0,1.6114623971662,0),"Block")
part(1,1,Vector3.new(0.087499998509884,0.48124995827675,0.48124995827675),"Cylinder",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-3.6567049026489,1.4941776990891,0.072273001074791)*CFrame.fromOrientation(0,1.6114623971662,1.5707963267949),"Cylinder")
part(1,1,Vector3.new(0.17499999701977,0.45937496423721,0.087499998509884),"Block",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-3.6543629169464,0.050439529120922,0.072166003286839)*CFrame.fromOrientation(0,-3.1009264500604,1.5707963267949),"Block")
part(1,1,Vector3.new(0.56874996423721,0.78749990463257,0.78749990463257),"Cylinder",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-3.6549119949341,4.2504329681396,0.11598200351)*CFrame.fromOrientation(0,1.6114623971662,0),"Cylinder")
part(1,1,Vector3.new(0.2799998819828,0.90250033140182,0.050000000745058),"Block",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-2.6040239334106,4.1629428863525,0.11707299947739)*CFrame.fromOrientation(-0.78539816339745,-1.5301301232655,3.1415926535898),"Block")
part(1,1,Vector3.new(0.27500003576279,0.75000011920929,0.75000011920929),"Cylinder",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-4.3819398880005,4.9182548522949,0.18930099904537)*CFrame.fromOrientation(0.80285145591739,1.6114623971662,0),"Cylinder")
part(1,1,Vector3.new(0.087499998509884,0.48124995827675,0.48124995827675),"Cylinder",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-3.6566979885101,-0.34332773089409,0.072281002998352)*CFrame.fromOrientation(0,1.6114623971662,1.5707963267949),"Cylinder")
part(1,1,Vector3.new(0.2799998819828,0.90250033140182,0.050000000745058),"Block",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-3.6165359020233,5.2123107910156,0.15818800032139)*CFrame.fromOrientation(0.034906585039887,1.6114623971662,0),"Block")
part(1,1,Vector3.new(0.2799998819828,0.90250033140182,0.050000000745058),"Block",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-2.8734951019287,4.8655347824097,0.12801399827003)*CFrame.fromOrientation(1.5184364492351,-1.5301301232655,3.1415926535898),"Block")
part(1,1,Vector3.new(0.087499998509884,0.48124995827675,0.48124995827675),"Cylinder",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-3.6566979885101,0.18167752027512,0.072281002998352)*CFrame.fromOrientation(0,1.6114623971662,1.5707963267949),"Cylinder")
part(1,1,Vector3.new(0.087499998509884,0.48124995827675,0.48124995827675),"Cylinder",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-3.6567049026489,-1.6558145284653,0.072273001074791)*CFrame.fromOrientation(0,1.6114623971662,1.5707963267949),"Cylinder")
part(1,1,Vector3.new(0.27500003576279,0.75000011920929,0.75000011920929),"Cylinder",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-3.6165289878845,5.2123069763184,0.15821099281311)*CFrame.fromOrientation(1.535889741755,-1.5301301232655,3.1415926535898),"Cylinder")
part(1,1,Vector3.new(0.4899996817112,1.5793751478195,0.087499998509884),"Block",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-3.6549348831177,4.2504568099976,0.11595200002193)*CFrame.fromOrientation(0,1.6114623971662,0),"Block")
part(1,1,Vector3.new(0.17499999701977,0.45937496423721,0.087499998509884),"Block",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-3.6543629169464,0.83792757987976,0.072166003286839)*CFrame.fromOrientation(0,1.6114623971662,1.5707963267949),"Block")
part(1,1,Vector3.new(0.087499998509884,0.48124995827675,0.48124995827675),"Cylinder",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-3.6567049026489,-2.1808080673218,0.072273001074791)*CFrame.fromOrientation(0,1.6114623971662,1.5707963267949),"Cylinder")
part(1,1,Vector3.new(0.2799998819828,0.90250033140182,0.050000000745058),"Block",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-2.8734951019287,4.8655347824097,0.12801399827003)*CFrame.fromOrientation(0.05235987755983,1.6114623971662,0),"Block")
part(1,1,Vector3.new(0.4899996817112,1.5793751478195,0.087499998509884),"Block",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-3.6549348831177,4.2504568099976,0.11595200002193)*CFrame.fromOrientation(-0.78539816339745,1.6114623971662,0),"Block")
part(1,1,Vector3.new(0.27500003576279,0.75000011920929,0.75000011920929),"Cylinder",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-2.8734951019287,4.865532875061,0.12803600728512)*CFrame.fromOrientation(0.73303828583762,-1.5301301232655,3.1415926535898),"Cylinder")
part(1,1,Vector3.new(0.2799998819828,0.90250033140182,0.050000000745058),"Block",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-4.7022910118103,4.1629467010498,0.20226299762726)*CFrame.fromOrientation(-0.78539816339745,1.6114623971662,0),"Block")



local spawn = function()
spawned = true
char.Humanoid.JumpPower = 150
for i = 0,5,1 do
char.Humanoid.Jump = true
wait()
end
char.Torso.Anchored = false
part2(1,2, Vector3.new(1.1000000238419,1.5,1.5),"Cylinder",char.Torso.BrickColor,1,"Neon",char.Torso,CFrame.new(0,-8.1,-4)*CFrame.fromOrientation(0,-2.1019000235031,0),"BasePart")
part2(1,2, Vector3.new(1.1000000238419,1.5,1.5),"Cylinder",char.Torso.BrickColor,0,"Neon",model.BasePart,CFrame.new(2.1555550098419,4.0000138282776,-1.266299366951)*CFrame.fromOrientation(0,2.1019000235031,0),"Cylinder")
part2(1,2, Vector3.new(2.5999999046326,3,3),"Cylinder",char.Torso.BrickColor,0,"Neon",model.BasePart,CFrame.new(-0.99156177043915,4.5000038146973,0.58280622959137)*CFrame.fromOrientation(0,2.1019000235031,0),"Cylinder")
part2(1,2, Vector3.new(3.1,3.5,3.5),"Cylinder",char.Torso.BrickColor,0,"Neon",model.BasePart,CFrame.new(-5.4750900268555,3.7999861240387,3.2168049812317)*CFrame.fromOrientation(0,2.1019000235031,0),"spinneblock2")
part2(1,2, Vector3.new(4.5000052452087,1,1.1000000238419),"Block",char.Torso.BrickColor,0,"Neon",model.BasePart,CFrame.new(0.21556633710861,3.7500033378601,-0.12658739089966)*CFrame.fromOrientation(0,0.53110366341868,0),"Block")
part2(1,2, Vector3.new(1.850000500679,1.5,3.0999999046326),"Block",char.Torso.BrickColor,0,"Neon",model.BasePart,CFrame.new(-1.6157166957855,2.4586198329926,0.94924479722977)*CFrame.fromOrientation(0,0.53110366341868,2.0943951023932),"Block")
part2(1,2, Vector3.new(1.5,1.5,1.3499999046326),"Block",char.Torso.BrickColor,0,"Neon",model.BasePart,CFrame.new(5.4535346031189,4.5000190734863,-3.2038094997406)*CFrame.fromOrientation(0,2.1019000235031,0),"Block")
part2(1,2, Vector3.new(1.5,1.5,2.0999999046326),"Block",char.Torso.BrickColor,0,"Neon",model.BasePart,CFrame.new(5.7768659591675,4.5000195503235,-3.3937623500824)*CFrame.fromOrientation(0,0.53110366341868,0),"Block")
part2(1,2, Vector3.new(1.8500003814697,1.5,3.0999999046326),"Block",char.Torso.BrickColor,0,"Neon",model.BasePart,CFrame.new(-2.2602372169495,7.2333459854126,1.3279511928558)*CFrame.fromOrientation(0,0.53110366341868,2.0943951023932),"Block")
part2(1,2, Vector3.new(3.9000000953674,1.5,3.0999999046326),"Block",char.Torso.BrickColor,0,"Neon",model.BasePart,CFrame.new(-1.939973950386,4.8499946594238,1.1397709846497)*CFrame.fromOrientation(0,0.53110366341868,1.5707963267949),"Block")
part2(1,2,Vector3.new(2.2000026702881,0.99999976158142,1),"Block",BrickColor.new("Really black"),0,"Granite",model.BasePart,CFrame.new(3.966215133667,4.5000076293945,-2.3300228118896)*CFrame.fromOrientation(0,0.53110366341868,0),"Block")
part2(1,2,Vector3.new(1,1.9999990463257,1.9999990463257),"Cylinder",BrickColor.new("Really black"),0,"Granite",model.BasePart,CFrame.new(2.1555550098419,4.0000138282776,-1.266299366951)*CFrame.fromOrientation(0,2.1019000235031,0),"Cylinder")
part2(1,2,Vector3.new(1,1,2.2000000476837),"Block",BrickColor.new("Really black"),0,"Granite",model.BasePart,CFrame.new(5.7768659591675,4.5000195503235,-3.3937623500824)*CFrame.fromOrientation(0,0.53110366341868,0),"Block")
part2(1,2,Vector3.new(2,2,2),"Block",BrickColor.new("Really black"),0,"Granite",model.BasePart,CFrame.new(5.7768659591675,4.5000195503235,-3.3937623500824)*CFrame.fromOrientation(0,0.53110366341868,0),"Block")
part2(1,2,Vector3.new(4.5000052452087,0.49999964237213,1.2000000476837),"Block",BrickColor.new("Really black"),0,"Granite",model.BasePart,CFrame.new(0.21556633710861,3.7500033378601,-0.12658739089966)*CFrame.fromOrientation(0,0.53110366341868,0),"Block")
part2(1,2,Vector3.new(6.5999984741211,0.99999976158142,2),"Block",BrickColor.new("Really black"),0,"Granite",model.BasePart,CFrame.new(0.17245972156525,4.4999995231628,-0.10125237703323)*CFrame.fromOrientation(0,0.53110366341868,0),"Block")
part2(1,2,Vector3.new(2.5,3.5,3.5),"Cylinder",BrickColor.new("Really black"),0,"Granite",model.BasePart,CFrame.new(-0.99156177043915,4.5000038146973,0.58280622959137)*CFrame.fromOrientation(0,2.1019000235031,0),"Cylinder")
part2(1,2,Vector3.new(4.5000052452087,0.99999976158142,1),"Block",BrickColor.new("Really black"),0,"Granite",model.BasePart,CFrame.new(0.21556544303894,3.5000023841858,-0.12659052014351)*CFrame.fromOrientation(0,0.53110366341868,0),"Block")
part2(1,2,Vector3.new(4,2,3),"Block",BrickColor.new("Really black"),0,"Granite",model.BasePart,CFrame.new(-1.939973950386,4.8499941825867,1.1397709846497)*CFrame.fromOrientation(0,0.53110366341868,1.5707963267949),"Block")
part2(1,2,Vector3.new(2.2000002861023,2,3),"Block",BrickColor.new("Really black"),0,"Granite",model.BasePart,CFrame.new(-1.58338367939,2.3936681747437,0.93024861812592)*CFrame.fromOrientation(0,0.53110366341868,2.0943951023932),"Block")
part2(1,2,Vector3.new(1.5500005483627,1,3.2000000476837),"Block",BrickColor.new("Really black"),0,"Granite",model.BasePart,CFrame.new(-1.6588274240494,2.5452220439911,0.97457301616669)*CFrame.fromOrientation(0,0.53110366341868,2.0943951023932),"Block")
part2(1,2,Vector3.new(3.6999967098236,1.5499994754791,2),"Block",BrickColor.new("Really black"),0,"Granite",model.BasePart,CFrame.new(-3.6644024848938,4.2249784469604,2.1528503894806)*CFrame.fromOrientation(0,0.53110366341868,0),"Block")
part2(1,2,Vector3.new(3.2000000476837,3,3),"Cylinder",BrickColor.new("Really black"),0,"Granite",model.BasePart,CFrame.new(-5.4750900268555,3.7999861240387,3.2168049812317)*CFrame.fromOrientation(0,2.1019000235031,0),"Cylinder")
part2(1,2,Vector3.new(1.2000000476837,1,1),"Cylinder",BrickColor.new("Really black"),0,"Granite",model.BasePart,CFrame.new(2.1555550098419,4.0000138282776,-1.266299366951)*CFrame.fromOrientation(0,2.1019000235031,0),"Cylinder")
part2(1,2,Vector3.new(2.7000000476837,2.5,2.5),"Cylinder",BrickColor.new("Really black"),0,"Granite",model.BasePart,CFrame.new(-0.99156177043915,4.5000038146973,0.58280622959137)*CFrame.fromOrientation(0,2.1019000235031,0),"Cylinder")
part2(1,2,Vector3.new(1,1.9999990463257,1.9999990463257),"Cylinder",BrickColor.new("Really black"),0,"Granite",model.BasePart,CFrame.new(3.0177764892578,4.5000081062317,-1.7728351354599)*CFrame.fromOrientation(0,2.1019000235031,-1.5707963267949),"Cylinder")
part2(1,2,Vector3.new(1.5500004291534,1,3.2000000476837),"Block",BrickColor.new("Really black"),0,"Granite",model.BasePart,CFrame.new(-2.2171263694763,7.1467437744141,1.3026230335236)*CFrame.fromOrientation(0,0.53110366341868,2.0943951023932),"Block")
part2(1,2,Vector3.new(3.8000001907349,1,3.2000000476837),"Block",BrickColor.new("Really black"),0,"Granite",model.BasePart,CFrame.new(-1.939973950386,4.8499946594238,1.1397709846497)*CFrame.fromOrientation(0,0.53110366341868,1.5707963267949),"Block")
part2(1,2,Vector3.new(2.2000002861023,2,3),"Block",BrickColor.new("Really black"),0,"Granite",model.BasePart,CFrame.new(-2.2925703525543,7.2982974052429,1.346947312355)*CFrame.fromOrientation(0,0.53110366341868,2.0943951023932),"Block")

part2(1,2,Vector3.new(3,4,4),"Cylinder",BrickColor.new("Really black"),1,"Granite",model.BasePart,CFrame.new(-5.4750900268555,3.7999861240387,3.2168049812317)*CFrame.fromOrientation(0,0,asd),"spinneblock")
part2(1,2,Vector3.new(3,4,4),"Cylinder",BrickColor.new("Really black"),0,"Granite",model.spinneblock,CFrame.new(0,0,0)*CFrame.fromOrientation(0,2.1019000235031,0),"Cylinder")
part2(1,2,Vector3.new(7,1.5,1.5),"Cylinder",BrickColor.new("Really black"),0,"Granite",model.spinneblock,CFrame.new(0,0,0)*CFrame.fromOrientation(1.0471975511966,2.1019000235031,1.5707963267949),"Cylinder")
part2(1,2,Vector3.new(5,2,2),"Cylinder",BrickColor.new("Really black"),0,"Granite",model.spinneblock,CFrame.new(0,0,0)*CFrame.fromOrientation(0.5235987755983,-1.0396926300867,-1.5707963267949),"Cylinder")
part2(1,2,Vector3.new(9,1,1),"Cylinder",BrickColor.new("Really black"),0,"Granite",model.spinneblock,CFrame.new(0,0,0)*CFrame.fromOrientation(1.0471975511966,2.1019000235031,1.5707963267949),"Cylinder")
part2(1,2,Vector3.new(9,1,1),"Cylinder",BrickColor.new("Really black"),0,"Granite",model.spinneblock,CFrame.new(0,0,0)*CFrame.fromOrientation(0.5235987755983,-1.0396926300867,-1.5707963267949),"Cylinder")
part2(1,2,Vector3.new(11,0.25,0.25),"Cylinder",BrickColor.new("Really black"),0,"Granite",model.spinneblock,CFrame.new(0,0,0)*CFrame.fromOrientation(1.0471975511966,2.1019000235031,1.5707963267949),"Cylinder")
part2(1,2,Vector3.new(10.5,0.5,0.5),"Cylinder",BrickColor.new("Really black"),0,"Granite",model.spinneblock,CFrame.new(0,0,0)*CFrame.fromOrientation(1.0471975511966,2.1019000235031,1.5707963267949),"Cylinder")
part2(1,2,Vector3.new(5,2,2),"Cylinder",BrickColor.new("Really black"),0,"Granite",model.spinneblock,CFrame.new(0,0,0)*CFrame.fromOrientation(1.0471975511966,2.1019000235031,1.5707963267949),"Cylinder")
part2(1,2,Vector3.new(10.5,0.5,0.5),"Cylinder",BrickColor.new("Really black"),0,"Granite",model.spinneblock,CFrame.new(0,0,0)*CFrame.fromOrientation(0.5235987755983,-1.0396926300867,-1.5707963267949),"Cylinder")
part2(1,2,Vector3.new(7,1.5,1.5),"Cylinder",BrickColor.new("Really black"),0,"Granite",model.spinneblock,CFrame.new(0,0,0)*CFrame.fromOrientation(-0.26179938779915,-1.0396926300867,-1.5707963267949),"Cylinder")
part2(1,2,Vector3.new(9,1,1),"Cylinder",BrickColor.new("Really black"),0,"Granite",model.spinneblock,CFrame.new(0,0,0)*CFrame.fromOrientation(-0.26179938779915,-1.0396926300867,-1.5707963267949),"Cylinder")
part2(1,2,Vector3.new(5,2,2),"Cylinder",BrickColor.new("Really black"),0,"Granite",model.spinneblock,CFrame.new(0,0,0)*CFrame.fromOrientation(-0.26179938779915,-1.0396926300867,-1.5707963267949),"Cylinder")
part2(1,2,Vector3.new(11,0.25,0.25),"Cylinder",BrickColor.new("Really black"),0,"Granite",model.spinneblock,CFrame.new(0,0,0)*CFrame.fromOrientation(1.3089969389957,-1.0396926300867,-1.5707963267949),"Cylinder")
part2(1,2,Vector3.new(10.5,0.5,0.5),"Cylinder",BrickColor.new("Really black"),0,"Granite",model.spinneblock,CFrame.new(0,0,0)*CFrame.fromOrientation(1.3089969389957,-1.0396926300867,-1.5707963267949),"Cylinder")
part2(1,2,Vector3.new(7,1.5,1.5),"Cylinder",BrickColor.new("Really black"),0,"Granite",model.spinneblock,CFrame.new(0,0,0)*CFrame.fromOrientation(1.3089969389957,-1.0396926300867,-1.5707963267949),"Cylinder")
part2(1,2,Vector3.new(5,2,2),"Cylinder",BrickColor.new("Really black"),0,"Granite",model.spinneblock,CFrame.new(0,0,0)*CFrame.fromOrientation(1.3089969389957,-1.0396926300867,-1.5707963267949),"Cylinder")
part2(1,2,Vector3.new(9,1,1),"Cylinder",BrickColor.new("Really black"),0,"Granite",model.spinneblock,CFrame.new(0,0,0)*CFrame.fromOrientation(1.3089969389957,-1.0396926300867,-1.5707963267949),"Cylinder")
part2(1,2,Vector3.new(11,0.25,0.25),"Cylinder",BrickColor.new("Really black"),0,"Granite",model.spinneblock,CFrame.new(0,0,0)*CFrame.fromOrientation(0.5235987755983,-1.0396926300867,-1.5707963267949),"Cylinder")
part2(1,2,Vector3.new(7,1.5,1.5),"Cylinder",BrickColor.new("Really black"),0,"Granite",model.spinneblock,CFrame.new(0,0,0)*CFrame.fromOrientation(0.5235987755983,-1.0396926300867,-1.5707963267949),"Cylinder")
part2(1,2,Vector3.new(10.5,0.5,0.5),"Cylinder",BrickColor.new("Really black"),0,"Granite",model.spinneblock,CFrame.new(0,0,0)*CFrame.fromOrientation(-0.26179938779915,-1.0396926300867,-1.5707963267949),"Cylinder")
part2(1,2,Vector3.new(11,0.25,0.25),"Cylinder",BrickColor.new("Really black"),0,"Granite",model.spinneblock,CFrame.new(0,0,0)*CFrame.fromOrientation(-0.26179938779915,-1.0396926300867,-1.5707963267949),"Cylinder")

part2(1,2,Vector3.new(10,0.75,0.75),"Cylinder",char.Torso.BrickColor,0,"Neon",model.spinneblock,CFrame.new(0,0,0)*CFrame.fromOrientation(1.3089969389957,-1.0396926300867,-1.5707963267949),"Cylinder")
part2(1,2,Vector3.new(8,1.25,1.25),"Cylinder",char.Torso.BrickColor,0,"Neon",model.spinneblock,CFrame.new(0,0,0)*CFrame.fromOrientation(1.3089969389957,-1.0396926300867,-1.5707963267949),"Cylinder")
part2(1,2,Vector3.new(6,1.75,1.75),"Cylinder",char.Torso.BrickColor,0,"Neon",model.spinneblock,CFrame.new(0,0,0)*CFrame.fromOrientation(1.3089969389957,-1.0396926300867,-1.5707963267949),"Cylinder")
part2(1,2,Vector3.new(10,0.75,0.75),"Cylinder",char.Torso.BrickColor,0,"Neon",model.spinneblock,CFrame.new(0,0,0)*CFrame.fromOrientation(0.5235987755983,-1.0396926300867,-1.5707963267949),"Cylinder")
part2(1,2,Vector3.new(8,1.25,1.25),"Cylinder",char.Torso.BrickColor,0,"Neon",model.spinneblock,CFrame.new(0,0,0)*CFrame.fromOrientation(0.5235987755983,-1.0396926300867,-1.5707963267949),"Cylinder")
part2(1,2,Vector3.new(6,1.75,1.75),"Cylinder",char.Torso.BrickColor,0,"Neon",model.spinneblock,CFrame.new(0,0,0)*CFrame.fromOrientation(0.5235987755983,-1.0396926300867,-1.5707963267949),"Cylinder")
part2(1,2,Vector3.new(8,1.25,1.25),"Cylinder",char.Torso.BrickColor,0,"Neon",model.spinneblock,CFrame.new(0,0,0)*CFrame.fromOrientation(1.0471975511966,2.1019000235031,1.5707963267949),"Cylinder")
part2(1,2,Vector3.new(6,1.75,1.75),"Cylinder",char.Torso.BrickColor,0,"Neon",model.spinneblock,CFrame.new(0,0,0)*CFrame.fromOrientation(1.0471975511966,2.1019000235031,1.5707963267949),"Cylinder")
part2(1,2,Vector3.new(10,0.75,0.75),"Cylinder",char.Torso.BrickColor,0,"Neon",model.spinneblock,CFrame.new(0,0,0)*CFrame.fromOrientation(1.0471975511966,2.1019000235031,1.5707963267949),"Cylinder")
part2(1,2,Vector3.new(10,0.75,0.75),"Cylinder",char.Torso.BrickColor,0,"Neon",model.spinneblock,CFrame.new(0,0,0)*CFrame.fromOrientation(-0.26179938779915,-1.0396926300867,-1.5707963267949),"Cylinder")
part2(1,2,Vector3.new(8,1.25,1.25),"Cylinder",char.Torso.BrickColor,0,"Neon",model.spinneblock,CFrame.new(0,0,0)*CFrame.fromOrientation(-0.26179938779915,-1.0396926300867,-1.5707963267949),"Cylinder")
part2(1,2,Vector3.new(6,1.75,1.75),"Cylinder",char.Torso.BrickColor,0,"Neon",model.spinneblock,CFrame.new(0,0,0)*CFrame.fromOrientation(-0.26179938779915,-1.0396926300867,-1.5707963267949),"Cylinder")
char.Humanoid.JumpPower = 50
end


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

shoottrailheal = function(mouse, partt, SpreadAmount, multiply)
	
	local SpreadVectors = Vector3.new(math.random(-SpreadAmount, SpreadAmount), math.random(-SpreadAmount, SpreadAmount), math.random(-SpreadAmount, SpreadAmount))
	local MainPos = partt.Position 
	local MainPos2 = healperson.Torso.Position + SpreadVectors
	local MouseLook = CFrame.new((MainPos + MainPos2) / 2, MainPos2)
	local speed = 10
	local num = 75
	coroutine.resume(coroutine.create(function()
		
		repeat
			wait()
			MouseLook = CFrame.new((MainPos + MainPos2) / 2, MainPos2)
			SpreadVectors = Vector3.new(math.random(-SpreadAmount, SpreadAmount), math.random(-SpreadAmount, SpreadAmount), math.random(-SpreadAmount, SpreadAmount))
			MainPos2 = healperson.Torso.Position + SpreadVectors
			local hit, pos = rayCast(MainPos, MouseLook.lookVector, speed, char.HumanoidRootPart.Parent)
			local mag = (MainPos - pos).magnitude
			Laser(char.Torso.BrickColor, CFrame.new((MainPos + pos) / 2, pos) * CFrame.Angles(1.57, 0, 0), 1, mag *(-speed / (speed / 2)), 1, 0, 0, 0, 0.3)
			MainPos = MainPos + MouseLook.lookVector * speed
			num = num - 1
			MouseLook = MouseLook * CFrame.Angles(-.01,0, 0)
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
					Block(refpart.CFrame,Vector3.new(2,2,2),Vector3.new(0.05,0.05,0.05),0.05,char.Torso.BrickColor,1)
					magn(-17,-12,refpart,2)
					CreateSound("http://www.roblox.com/asset/?id=10209590",refpart,1,1)
					game:GetService("Debris"):AddItem(refpart, 0)
					wait(0.3)
					if SpreadAmount == 0 then
					attack = false
					end
				end
			end
		until num <= 0
	end
))
end


local attack1 = function()
attack = true
local debounce = false
	local con = weapon.hitbox1.Touched:connect(function(hit)
		if hit.Parent ~= workspace and debounce == false then
		debounce = true
		magn(12,17,hit,2)
		wait(0.2)
		debounce = false
		end
	end
	)
	CreateSound("http://roblox.com/asset/?id=10209645",weapon.Handle,1,0.7)
	for i = 0, 1, 0.2 do
		wait()
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(-30), math.rad(0), math.rad(0)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, .4 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(10)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(180), math.rad(0), math.rad(-10)), 0.3)				
	end
	
	for i = 0, 1, 0.2 do
		wait()
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(30), math.rad(0), math.rad(0)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, .4 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(10)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)			
	end
	for i = 0, 1, 0.2 do
		wait()
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(30), math.rad(0), math.rad(0)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, .4 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(10)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(-40), math.rad(0), math.rad(0)), 0.3)			
	end
	con:disconnect()
	attack = false
end



play:GetMouse().Button1Down:connect(function()
	local k = Instance.new("Part", nolagplease)
	k.Transparency = 1
	k.Anchored = true
	k.CanCollide = false
	k.Position = play:GetMouse().Hit.p
	magnhalo(0,0,k,5)
end)

play:GetMouse().Button1Up:connect(function()
	healing = false
	healperson = workspace
end)

play:GetMouse().KeyDown:connect(function(k)
	
	k = k:lower()
	if k == "f" and attack == false and equipped == true then

	end
end)

play:GetMouse().KeyUp:connect(function(k)
	if k == "r" and attack == true and charging == true then
		charging = false
	end
	if k == "c" and attack == true and charging == true then
		charging = false
	end
end)

coroutine.resume(coroutine.create(function()
while true do
mana = mana + 1
if mana >= 200 then
	mana = 200
end
wait(.5)
end
end))


local debounce2 = false

coroutine.resume(coroutine.create(function()
while true do
	if asdrot <= 360 then
		asdrot = asdrot + 2
		else
		asdrot = 0
	end
	manabar:TweenSize(UDim2.new(1 * (mana /200), 0, 1, 0), "Out", "Quad", 0.5)
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
							RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(100), math.rad(0), math.rad(-10)), 0.3)
							LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(80), math.rad(-70), math.rad(10)), 0.3)
							weapon.Handle.Weld.C0 = clerp(weapon.Handle.Weld.C0, CFrame.new(3.6543550491333,-1.07870727777481,-1.572166003286839) * CFrame.Angles(math.rad(-90), math.rad(0), math.rad(0)), 0.3)
							end
							RH.C0 = clerp(RH.C0, CFrame.new(1, -1 + 0.1 * math.cos((sine) / 20), 0) * RHCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
							LH.C0 = clerp(LH.C0, CFrame.new(-1, -1 + 0.1 * math.cos((sine) / 20), 0.1) * LHCF * CFrame.Angles(math.rad(0), math.rad(20), math.rad(0)), 0.3)
							
					else
						if 2 < torsovel then
							Anim = "Walk"
								if attack == false and sit == false then
								char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
								char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
								RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(100), math.rad(0), math.rad(-10)), 0.3)
								LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(80), math.rad(-70), math.rad(10)), 0.3)
								weapon.Handle.Weld.C0 = clerp(weapon.Handle.Weld.C0, CFrame.new(3.6543550491333,-1.07870727777481,-1.572166003286839) * CFrame.Angles(math.rad(-90), math.rad(0), math.rad(0)), 0.3)
								end
								if riding == false then
								RH.C0 = clerp(RH.C0, CFrame.new(1, -1 + 0.1 * math.cos((sine) / 20), 0) * RHCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0 - 50 * math.cos((sine) / 3))), 0.3)
								LH.C0 = clerp(LH.C0, CFrame.new(-1, -1 + 0.1 * math.cos((sine) / 20), 0.1) * LHCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0 - 50 * math.cos((sine) / 3))), 0.3)
								end
						end
					end
					end
wait()
end
end))

