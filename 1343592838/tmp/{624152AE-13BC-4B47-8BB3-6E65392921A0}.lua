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

magnhalo = function(mindam,maxdam,par,dist)
	
	for _,c in pairs(workspace:children()) do
		local hum = c:findFirstChild("Humanoid")
		if hum ~= nil then
			local head = c:findFirstChild("HumanoidRootPart")
			local damage = math.random(mindam,maxdam)
			if head ~= nil then
				local targ = head.Position - par.Position
				local mag = targ.magnitude
				if mag <= dist and c.Name ~= play.Name and hum.MaxHealth ~= 200 then
					hum.MaxHealth = 200
				hum.Health = hum.Health*2
				local halo = Instance.new("Part", head.Parent)
				halo.CanCollide = false
				halo.Name = "Halo"
				halo.BrickColor = BrickColor.new("Really black")
				halo.Size = Vector3.new(0,0,0)
				local haloMesh = Instance.new("SpecialMesh", halo)
				haloMesh.MeshType = "Sphere"
				haloMesh.MeshId = "http://www.roblox.com/asset/?id=3270017"
				haloMesh.Scale = Vector3.new(1.25,1.25,1.25)
				local haloWeld = Instance.new("Weld", halo)
				haloWeld.Part0 = halo
				haloWeld.Part1 = head.Parent.Head
				haloWeld.C0 = CFrame.new(0,0,-1.7) * CFrame.fromEulerAnglesXYZ(1.57,0,0)
				
				local halo = Instance.new("Part", head.Parent)
				halo.CanCollide = false
				halo.Name = "Halo"
				halo.BrickColor = char.Torso.BrickColor
				halo.Size = Vector3.new(0,0,0)
				local haloMesh = Instance.new("SpecialMesh", halo)
				haloMesh.MeshType = "Sphere"
				haloMesh.MeshId = "http://www.roblox.com/asset/?id=3270017"
				haloMesh.Scale = Vector3.new(1,1,1.4)
				local haloWeld = Instance.new("Weld", halo)
				haloWeld.Part0 = halo
				haloWeld.Part1 = head.Parent.Head
				haloWeld.C0 = CFrame.new(0,0,-1.7) * CFrame.fromEulerAnglesXYZ(1.57,0,0)
				
				local halo = Instance.new("Part", head.Parent)
				halo.CanCollide = false
				halo.Name = "Halo"
				halo.BrickColor = BrickColor.new("Really black")
				halo.Size = Vector3.new(0,0,0)
				local haloMesh = Instance.new("SpecialMesh", halo)
				haloMesh.MeshType = "Sphere"
				haloMesh.MeshId = "http://www.roblox.com/asset/?id=3270017"
				haloMesh.Scale = Vector3.new(.75,.75,1.55)
				local haloWeld = Instance.new("Weld", halo)
				haloWeld.Part0 = halo
				haloWeld.Part1 = head.Parent.Head
				haloWeld.C0 = CFrame.new(0,0,-1.7) * CFrame.fromEulerAnglesXYZ(1.57,0,0)
				
				Block(halo.CFrame,Vector3.new(1,1,1),Vector3.new(0.05,0.05,0.05),0.05,char.Torso.BrickColor,1)
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

part(1,1, Vector3.new(2.3780362606049,0.4920075237751,0.32800501585007),"Cylinder",BrickColor.new("Really black"),1,"Granite",LeftArm,CFrame.new(0,-1,0)*CFrame.fromOrientation(1.57,0,-1.5707963267949),"notthehandle")
part(1,1, Vector3.new(0,0,0),"Cylinder",BrickColor.new("Really black"),1,"Granite",weapon.notthehandle,CFrame.new(0,0,0)*CFrame.fromOrientation(0,0,-1.5707963267949),"Handle")
part(1,1, Vector3.new(2.3780362606049,0.4920075237751,0.32800501585007),"Cylinder",BrickColor.new("Really black"),0,"Granite",weapon.Handle,CFrame.new(0,0,0.03)*CFrame.fromOrientation(0,0,-1.5707963267949),"handle2")
part(1,1, Vector3.new(0.32800501585007,0.32800501585007,0.32800501585007),"Ball",BrickColor.new("Really black"),0,"Granite",weapon.Handle,CFrame.new(0,-1.2,0.03)*CFrame.fromOrientation(-1.5707963267949,-1.5707963267949,0),"Ball")
part(1,1, Vector3.new(0.16400250792503,0.9840150475502,0.9840150475502),"Cylinder",BrickColor.new("Really black"),0,"Granite",weapon.Handle,CFrame.new(-0.00023698806762695,4.4263134002686,0.029651820659637)*CFrame.fromOrientation(0,0,0),"Cylinder")
part(1,1, Vector3.new(0.41000625491142,0.4920075237751,0.16400250792503),"Cylinder",BrickColor.new("Really black"),0,"Granite",weapon.Handle,CFrame.new(-0.00029599666595459,-1.3956775665283,0.029684811830521)*CFrame.fromOrientation(0,0,-1.5707963267949),"Cylinder")
part(1,1, Vector3.new(2.2140338420868,0.4920075237751,0.4920075237751),"Cylinder",BrickColor.new("Really black"),0,"Granite",weapon.Handle,CFrame.new(-0.00016897916793823,2.2942905426025,0.02976980805397)*CFrame.fromOrientation(0,0,-1.5707963267949),"Cylinder")
part(1,1, Vector3.new(0.4920075237751,0.24600376188755,0.24600376188755),"Cylinder",BrickColor.new("Really black"),0,"Granite",weapon.Handle,CFrame.new(-0.00029399991035461,3.8113231658936,0.029715806245804)*CFrame.fromOrientation(0,0,-1.5707963267949),"Cylinder")
part(1,1, Vector3.new(0.4920075237751,0.4920075237751,0.4920075237751),"Ball",BrickColor.new("Really black"),0,"Granite",weapon.Handle,CFrame.new(-0.00029498338699341,1.1873874664307,0.029700815677643)*CFrame.fromOrientation(-1.5707963267949,-1.5707963267949,0),"Ball")
part(1,1, Vector3.new(0.32800501585007,0.24600376188755,1.722026348114),"Wedge",BrickColor.new("Really black"),0,"Granite",weapon.Handle,CFrame.new(-0.00018599629402161,5.2874851226807,-0.093318179249763)*CFrame.fromOrientation(1.5707963267949,3.1415926535898,0),"Wedge")
part(1,1, Vector3.new(0.16400250792503,0.49200737476349,1.8860286474228),"Wedge",BrickColor.new("Really black"),0,"Granite",weapon.Handle,CFrame.new(-0.00027099251747131,5.3692207336426,0.27569279074669)*CFrame.fromOrientation(1.5707963267949,0,0),"Wedge")
part(1,1, Vector3.new(0.16400250792503,0.49200737476349,1.8860286474228),"Wedge",BrickColor.new("Really black"),0,"Granite",weapon.Handle,CFrame.new(-0.00031399726867676,5.3693504333496,-0.21621617674828)*CFrame.fromOrientation(1.5707963267949,3.1415926535898,0),"Wedge")
part(1,1, Vector3.new(0.32800501585007,0.24600376188755,1.722026348114),"Wedge",BrickColor.new("Really black"),0,"Granite",weapon.Handle,CFrame.new(-0.00015997886657715,5.2873001098633,0.15272080898285)*CFrame.fromOrientation(1.5707963267949,0,0),"Wedge")
part(1,1, Vector3.new(0.4920075237751,0.28700441122055,0.28700441122055),"Cylinder",BrickColor.new("Really black"),0,"Granite",weapon.Handle,CFrame.new(-0.00029599666595459,4.1394081115723,0.029684811830521)*CFrame.fromOrientation(0,0,-1.5707963267949),"Cylinder")
part(1,1, Vector3.new(0.32800501585007,0.4920075237751,0.4920075237751),"Cylinder",BrickColor.new("Really black"),0,"Granite",weapon.Handle,CFrame.new(-0.00023698806762695,4.4263134002686,0.029651820659637)*CFrame.fromOrientation(0,0,3.1415926535898),"Cylinder")
part(1,1, Vector3.new(0.24600376188755,0.24600376188755,0.9840150475502),"Block",BrickColor.new("Really black"),0,"Granite",weapon.Handle,CFrame.new(-3.1977891921997e-05,3.8318824768066,-1.0000902414322)*CFrame.fromOrientation(-0.5235987755983,0,-1.5707963267949),"Block")
part(1,1, Vector3.new(0.24600376188755,0.24600376188755,1.3120200634003),"Block",BrickColor.new("Really black"),0,"Granite",weapon.Handle,CFrame.new(-0.00023999810218811,4.4264698028564,-1.323251247406)*CFrame.fromOrientation(0,0,-1.5707963267949),"Block")
part(1,1, Vector3.new(0.24600376188755,0.24600376188755,0.82001250982285),"Block",BrickColor.new("Really black"),0,"Granite",weapon.Handle,CFrame.new(-0.00014999508857727,3.643611907959,0.81246781349182)*CFrame.fromOrientation(-0.78539816339745,3.1415926535898,1.5707963267949),"Block")
part(1,1, Vector3.new(0.24600376188755,0.24600376188755,0.9840150475502),"Block",BrickColor.new("Really black"),0,"Granite",weapon.Handle,CFrame.new(-0.00025898218154907,3.8317718505859,1.059369802475)*CFrame.fromOrientation(-0.5235987755983,3.1415926535898,1.5707963267949),"Block")
part(1,1, Vector3.new(0.24600376188755,0.24600376188755,1.1480176448822),"Block",BrickColor.new("Really black"),0,"Granite",weapon.Handle,CFrame.new(-0.00018298625946045,4.0973472595215,1.2573857307434)*CFrame.fromOrientation(-0.26179938779915,3.1415926535898,1.5707963267949),"Block")
part(1,1, Vector3.new(0.24600376188755,0.24600376188755,1.3120200634003),"Block",BrickColor.new("Really black"),0,"Granite",weapon.Handle,CFrame.new(-9.8973512649536e-05,4.426362991333,1.3827627897263)*CFrame.fromOrientation(0,0,-1.5707963267949),"Block")
part(1,1, Vector3.new(0.24600376188755,0.24600376188755,1.1480176448822),"Block",BrickColor.new("Really black"),0,"Granite",weapon.Handle,CFrame.new(-0.00040099024772644,4.0972995758057,-1.1978921890259)*CFrame.fromOrientation(-0.26179938779915,0,-1.5707963267949),"Block")
part(1,1, Vector3.new(0.24600376188755,0.24600376188755,0.82001250982285),"Block",BrickColor.new("Really black"),0,"Granite",weapon.Handle,CFrame.new(-0.00019299983978271,3.6434783935547,-0.75301814079285)*CFrame.fromOrientation(-0.78539816339745,0,-1.5707963267949),"Block")
part(1,1, Vector3.new(0.24600376188755,0.24600376188755,0.65601003170013),"Block",BrickColor.new("Really black"),0,"Granite",weapon.Handle,CFrame.new(-0.00031599402427673,3.5385646820068,0.54219877719879)*CFrame.fromOrientation(-1.0471975511966,-3.1415926535898,1.5707963267949),"Block")
part(1,1, Vector3.new(0.24600376188755,0.24600376188755,0.65601003170013),"Block",BrickColor.new("Really black"),0,"Granite",weapon.Handle,CFrame.new(-0.00027397274971008,3.5385341644287,-0.48281317949295)*CFrame.fromOrientation(-1.0471975511966,0,-1.5707963267949),"Block")
part(1,1, Vector3.new(7,.5,3),"Block",BrickColor.new("Really black"),1,"Granite",weapon.Handle,CFrame.new(0,3,0)*CFrame.fromOrientation(0,0,-1.5707963267949),"hitbox1")
part(1,1, Vector3.new(0,0,0),"Block",BrickColor.new("Really black"),1,"Granite",weapon.Handle,CFrame.new(0,4.5,0)*CFrame.fromOrientation(0,0,-1.5707963267949),"throwpart")

part(1,1, Vector3.new(0.24600376188755,0.36900553107262,1.804027557373),"Wedge",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-0.00030198693275452,5.3282432556152,0.21430280804634)*CFrame.fromOrientation(1.5707963267949,0,0),"Wedge")
part(1,1, Vector3.new(0.24600376188755,0.36900553107262,1.804027557373),"Wedge",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-0.00028297305107117,5.3283748626709,-0.15481118857861)*CFrame.fromOrientation(1.5707963267949,3.1415926535898,0),"Wedge")
part(1,1, Vector3.new(0.24600376188755,0.73801124095917,0.73801124095917),"Cylinder",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-0.00023698806762695,4.4263134002686,0.029651820659637)*CFrame.fromOrientation(0,0,3.1415926535898),"Cylinder")
part(1,1, Vector3.new(0.4920075237751,0.4920075237751,0.4920075237751),"Ball",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-0.00029599666595459,3.4012985229492,0.029684811830521)*CFrame.fromOrientation(-1.5707963267949,-1.5707963267949,0),"Ball")
part(1,1, Vector3.new(0.4920075237751,0.32800501585007,0.32800501585007),"Cylinder",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-0.00041499733924866,3.1143436431885,0.029737830162048)*CFrame.fromOrientation(0,0,0),"Cylinder")
part(1,1, Vector3.new(0.24600376188755,0.24600359797478,0.24600376188755),"Wedge",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-0.00022599101066589,3.1480598449707,0.7676477432251)*CFrame.fromOrientation(-1.0471975511966,3.1415926535898,0),"Wedge")
part(1,1, Vector3.new(0.24600376188755,0.24600359797478,0.24600376188755),"Wedge",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-9.4980001449585e-05,3.2666397094727,1.1894178390503)*CFrame.fromOrientation(-0.78539816339745,3.1415926535898,0),"Wedge")
part(1,1, Vector3.new(0.24600376188755,0.24600359797478,0.24600376188755),"Wedge",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-0.00024497509002686,3.5243244171143,1.5920548439026)*CFrame.fromOrientation(-0.5235987755983,3.1415926535898,0),"Wedge")
part(1,1, Vector3.new(0.24600376188755,0.24600359797478,0.24600376188755),"Wedge",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-0.00020599365234375,3.9169292449951,1.930676817894)*CFrame.fromOrientation(-0.26179938779915,3.1415926535898,0),"Wedge")
part(1,1, Vector3.new(0.24600376188755,0.24600359797478,0.24600376188755),"Wedge",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-0.00017297267913818,4.4261741638184,2.1616308689117)*CFrame.fromOrientation(0,3.1415926535898,0),"Wedge")
part(1,1, Vector3.new(0.24600376188755,0.24600359797478,0.24600376188755),"Wedge",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-0.00024399161338806,3.1480197906494,-0.70829916000366)*CFrame.fromOrientation(0.5235987755983,0,3.1415926535898),"Wedge")
part(1,1, Vector3.new(0.24600376188755,0.24600359797478,0.24600376188755),"Wedge",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-0.00030797719955444,3.2666702270508,-1.1299492120743)*CFrame.fromOrientation(0.78539816339745,0,3.1415926535898),"Wedge")
part(1,1, Vector3.new(0.24600376188755,0.24600359797478,0.24600376188755),"Wedge",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-0.00028097629547119,3.5243263244629,-1.5326101779938)*CFrame.fromOrientation(1.0471975511966,0,3.1415926535898),"Wedge")
part(1,1, Vector3.new(0.24600376188755,0.24600359797478,0.24600376188755),"Wedge",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-0.00025999546051025,3.9169883728027,-1.8712502717972)*CFrame.fromOrientation(1.3089969389957,0,3.1415926535898),"Wedge")
part(1,1, Vector3.new(0.24600376188755,0.24600359797478,0.24600376188755),"Wedge",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-0.00029799342155457,4.4263534545898,-2.1022951602936)*CFrame.fromOrientation(1.5707963267949,3.1415926535898,0),"Wedge")
part(1,1, Vector3.new(0.082001253962517,0.51250785589218,0.51250785589218),"Cylinder",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-0.00029197335243225,2.4582576751709,0.029745817184448)*CFrame.fromOrientation(0,0,-1.5707963267949),"Cylinder")
part(1,1, Vector3.new(0.082001253962517,0.51250785589218,0.51250785589218),"Cylinder",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-0.00016799569129944,2.1303100585938,0.029784828424454)*CFrame.fromOrientation(0,0,-1.5707963267949),"Cylinder")
part(1,1, Vector3.new(0.082001253962517,0.51250785589218,0.51250785589218),"Cylinder",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-0.00017297267913818,1.8023014068604,0.029693812131882)*CFrame.fromOrientation(0,0,-1.5707963267949),"Cylinder")
part(1,1, Vector3.new(0.082001253962517,0.51250785589218,0.51250785589218),"Cylinder",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-0.00017297267913818,1.4741916656494,0.029693812131882)*CFrame.fromOrientation(0,0,-1.5707963267949),"Cylinder")
part(1,1, Vector3.new(0.32800501585007,0.32800501585007,0.32800501585007),"Ball",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-0.00023499131202698,-1.6825618743896,0.029681831598282)*CFrame.fromOrientation(-1.5707963267949,-1.5707963267949,0),"Ball")
part(1,1, Vector3.new(0.16400250792503,0.4920075237751,0.32800501585007),"Cylinder",char.Torso.BrickColor,0,"Neon",weapon.Handle,CFrame.new(-0.00023898482322693,-1.7645244598389,0.029605805873871)*CFrame.fromOrientation(0,0,-1.5707963267949),"Cylinder")

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


shoottrail = function(mouse, partt, SpreadAmount, multiply)
	
	local SpreadVectors = Vector3.new(math.random(-SpreadAmount, SpreadAmount), math.random(-SpreadAmount, SpreadAmount), math.random(-SpreadAmount, SpreadAmount))
	local MainPos = partt.Position
	local MainPos2 = mouse.Hit.p + SpreadVectors
	local MouseLook = CFrame.new((MainPos + MainPos2) / 2, MainPos2)
	local speed = 30
	if rage == true then
		speed = speed * 2
	end
	local num = 75
	coroutine.resume(coroutine.create(function()
		
		repeat
			wait()
			local hit, pos = rayCast(MainPos, MouseLook.lookVector, speed, char.HumanoidRootPart.Parent)
			local mag = (MainPos - pos).magnitude
			Laser(char.Torso.BrickColor, CFrame.new((MainPos + pos) / 2, pos) * CFrame.Angles(1.57, 0, 0), 3, mag *(-speed / (speed / 2)), 3, 0, 0, 0, 0.15)
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
					magn(12,17,refpart,2)
					CreateSound("http://www.roblox.com/asset/?id=10209590",refpart,1,1)
					for i = 0,15,1 do
					Block(weapon.Handle.CFrame*CFrame.new(0,1,0),Vector3.new(1,7,2),Vector3.new(0.05,0.35,0.15),0.05,char.Torso.BrickColor,2)
					wait(.05)
					end
					local d = weapon:GetChildren()
					for i=1, #d  do 
						if d[i].Name ~= "hitbox1" and d[i].Name ~= "Handle2" and d[i].Name ~= "Handle" and d[i].Name ~= "notthehandle" then
						d[i].Transparency = 0
						end
					end
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

shoottrailtracking = function(mouse, partt, SpreadAmount, multiply)
	
	local SpreadVectors = Vector3.new(math.random(-SpreadAmount, SpreadAmount), 6, math.random(-SpreadAmount, SpreadAmount))
	local MainPos = partt.Position
	local MainPos2 = mouse.Hit.p + SpreadVectors
	local MouseLook = CFrame.new((MainPos + MainPos2) / 2, MainPos2)
	local speed = 15
	local num = 150
	coroutine.resume(coroutine.create(function()
		
		repeat
			wait()
			MainPos2 = Vector3.new(mouse.Hit.p.X + math.random(-SpreadAmount, SpreadAmount), 6,mouse.Hit.p.Z + math.random(-SpreadAmount, SpreadAmount))
			MouseLook = CFrame.new((MainPos + MainPos2) / 2, MainPos2)
			local hit, pos = rayCast(MainPos, MouseLook.lookVector, speed, char.HumanoidRootPart.Parent)
			local mag = (MainPos - pos).magnitude
			Laser(char.Torso.BrickColor, CFrame.new((MainPos + pos) / 2, pos) * CFrame.Angles(1.57, 0, 0), 3, mag *(-speed / (speed / 2)), 3, 0, 0, 0, 0.15)
			MainPos = MainPos + MouseLook.lookVector * speed
			num = num - 1
			MouseLook = MouseLook * CFrame.Angles(-.01,0, 0)
			if hit ~= nil then
				local refpart = Instance.new("Part", nolagplease)
				refpart.Transparency = 1
				refpart.CanCollide = false
				refpart.Anchored = true
				refpart.CFrame = CFrame.new(pos)
				game:GetService("Debris"):AddItem(refpart, 2)
				magn(6,9,refpart,2)
				CreateSound("http://www.roblox.com/asset/?id=10209590",refpart,1,1)
				num = num - 10
			end
			do
				if num <= 0 then
					local refpart = Instance.new("Part", nolagplease)
					refpart.Transparency = 1
					refpart.CanCollide = false
					refpart.Anchored = true
					refpart.CFrame = CFrame.new(pos)
					Block(refpart.CFrame,Vector3.new(2,2,2),Vector3.new(0.05,0.05,0.05),0.05,char.Torso.BrickColor,1)
					magn(12,17,refpart,2)
					
					for i = 0,15,1 do
					Block(weapon.Handle.CFrame*CFrame.new(0,1,0),Vector3.new(1,7,2),Vector3.new(0.05,0.35,0.15),0.05,char.Torso.BrickColor,2)
					wait(.05)
					end
					local d = weapon:GetChildren()
					for i=1, #d  do 
						if d[i].Name ~= "hitbox1" and d[i].Name ~= "Handle2" and d[i].Name ~= "Handle" and d[i].Name ~= "notthehandle" then
						d[i].Transparency = 0
						end
					end
					game:GetService("Debris"):AddItem(refpart, 0)
					wait(0.3)
					attack = false
				end
			end
		until num <= 0
	end
))
end

shoottrail2 = function(mouse, partt, SpreadAmount, multiply)
	
	local SpreadVectors = Vector3.new(math.random(-SpreadAmount, SpreadAmount), math.random(-SpreadAmount, SpreadAmount), math.random(-SpreadAmount, SpreadAmount))
	local MainPos = partt.Position
	local MainPos2 = mouse.Hit.p
	local MouseLook = CFrame.new((MainPos + MainPos2) / 2, MainPos2)
	MouseLook = MouseLook * CFrame.Angles(math.rad(math.random(-SpreadAmount, SpreadAmount)),math.rad(math.random(-SpreadAmount, SpreadAmount)),math.rad(math.random(-SpreadAmount, SpreadAmount)))
	local speed = 90 * sped
	local sped2 = sped
	local num = 45
	local fakesize = 3
	if sped < 1 then
		fakesize = 3*sped
	end
	coroutine.resume(coroutine.create(function()
		
		repeat
			wait()
			local hit, pos = rayCast(MainPos, MouseLook.lookVector, speed, char.HumanoidRootPart.Parent)
			local mag = (MainPos - pos).magnitude
			Laser(char.Torso.BrickColor, CFrame.new((MainPos + pos) / 2, pos) * CFrame.Angles(1.57, 0, 0), fakesize, mag *(-speed / (speed / 2)), fakesize, 0, 0, 0, 0.15)
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
				Block(refpart.CFrame,Vector3.new(2*sped2,2*sped2,2*sped2),Vector3.new(0.05*sped2,0.05*sped2,0.05*sped2),0.05,char.Torso.BrickColor,1)
				game:GetService("Debris"):AddItem(refpart, 2)
			end
			do
				if num <= 0 then
					local refpart = Instance.new("Part", nolagplease)
					refpart.Transparency = 1
					refpart.CanCollide = false
					refpart.Anchored = true
					refpart.CFrame = CFrame.new(pos)
					if SpreadAmount == 5 then
					magn(5,10,refpart,2*sped2)
					end
					if SpreadAmount == 2.5 then
					magn(1*sped2,3*sped2,refpart,2)
					end
					CreateSound("http://www.roblox.com/asset/?id=10209590",refpart,.2,1)
					game:GetService("Debris"):AddItem(refpart, 0)
				end
			end
		until num <= 0
	end
))
end

shoottrailheal = function(mouse, partt, SpreadAmount, multiply)
	
	local SpreadVectors = Vector3.new(math.random(-SpreadAmount, SpreadAmount), math.random(-SpreadAmount, SpreadAmount), math.random(-SpreadAmount, SpreadAmount))
	local MainPos = partt.Position
	local MainPos2 = mouse.Hit.p
	local MouseLook = CFrame.new((MainPos + MainPos2) / 2, MainPos2)
	MouseLook = MouseLook * CFrame.Angles(math.rad(math.random(-SpreadAmount, SpreadAmount)),math.rad(math.random(-SpreadAmount, SpreadAmount)),math.rad(math.random(-SpreadAmount, SpreadAmount)))
	Block(partt.CFrame,Vector3.new(2,2,2),Vector3.new(0.05,0.05,0.05),0.1,BrickColor.new("Institutional white"),1)
	local speed = 9000
	sped = 1
	local sped2 = sped
	local num = 1
	local fakesize = 3
	if sped < 1 then
		fakesize = 3*sped
	end
	coroutine.resume(coroutine.create(function()
		
		repeat
			wait()
			local hit, pos = rayCast(MainPos, MouseLook.lookVector, speed, char.HumanoidRootPart.Parent)
			local mag = (MainPos - pos).magnitude
			Laser(BrickColor.new("Institutional white"), CFrame.new((MainPos + pos) / 2, pos) * CFrame.Angles(1.57, 0, 0), fakesize, mag *(-speed / (speed / 2)), fakesize, 0, 0, 0, 1)
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
				Block(refpart.CFrame,Vector3.new(2*sped2,2*sped2,2*sped2),Vector3.new(0.05*sped2,0.05*sped2,0.05*sped2),.1,BrickColor.new("Institutional white"),1)
				game:GetService("Debris"):AddItem(refpart, 2)
			end
			do
				if num <= 0 then
					local refpart = Instance.new("Part", nolagplease)
					refpart.Transparency = 1
					refpart.CanCollide = false
					refpart.Anchored = true
					refpart.CFrame = CFrame.new(pos)
					magn(-6,-6,refpart,4*sped2)					
					game:GetService("Debris"):AddItem(refpart, 0)
				end
			end
		until num <= 0
	end
))
end


shoottrailhalo = function(mouse, partt, SpreadAmount, multiply,typ)
	
	local SpreadVectors = Vector3.new(math.random(-SpreadAmount, SpreadAmount), math.random(-SpreadAmount, SpreadAmount), math.random(-SpreadAmount, SpreadAmount))
	local MainPos = partt.Position
	local MainPos2 = mouse.Hit.p
	local MouseLook = CFrame.new((MainPos + MainPos2) / 2, MainPos2)
	MouseLook = MouseLook * CFrame.Angles(math.rad(math.random(-SpreadAmount, SpreadAmount)),math.rad(math.random(-SpreadAmount, SpreadAmount)),math.rad(math.random(-SpreadAmount, SpreadAmount)))
	Block(partt.CFrame,Vector3.new(2,2,2),Vector3.new(0.05,0.05,0.05),0.1,char.Torso.BrickColor,1)
	local speed = 9000
	sped = 1
	local sped2 = sped
	local num = 1
	local fakesize = 3
	if sped < 1 then
		fakesize = 3*sped
	end
	coroutine.resume(coroutine.create(function()
		
		repeat
			wait()
			local hit, pos = rayCast(MainPos, MouseLook.lookVector, speed, char.HumanoidRootPart.Parent)
			local mag = (MainPos - pos).magnitude
			Laser(char.Torso.BrickColor, CFrame.new((MainPos + pos) / 2, pos) * CFrame.Angles(1.57, 0, 0), fakesize, mag *(-speed / (speed / 2)), fakesize, 0, 0, 0, 1)
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
				Block(refpart.CFrame,Vector3.new(2*sped2,2*sped2,2*sped2),Vector3.new(0.05*sped2,0.05*sped2,0.05*sped2),.1,char.Torso.BrickColor,1)
				game:GetService("Debris"):AddItem(refpart, 2)
			end
			do
				if num <= 0 then
					local refpart = Instance.new("Part", nolagplease)
					refpart.Transparency = 1
					refpart.CanCollide = false
					refpart.Anchored = true
					refpart.CFrame = CFrame.new(pos)
					coroutine.resume(coroutine.create(function()
					if typ == "halo" then
					magnhalo(-6,-6,refpart,4*sped2)
					end		
					if typ == "speed" then
					magnspeed(-6,-6,refpart,4*sped2)
					end				
					end))
					game:GetService("Debris"):AddItem(refpart, 0)
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


local attack2 = function()
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
	CreateSound("http://roblox.com/asset/?id=10209645",weapon.Handle,1,0.5)
	for i = 0, 1, 0.1 do
		wait()
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-70)), 0.3)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(10), math.rad(0), math.rad(70)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, .4 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(10)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(-90), math.rad(-10)), 0.3)				
	end
	
	for i = 0, 1, 0.1 do
		wait()
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(30)), 0.3)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(10), math.rad(0), math.rad(-30)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, .4 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(10)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(-45), math.rad(45), math.rad(0)), 0.3)			
	end
	con:disconnect()
	attack = false
end

local attack3 = function()
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
	for i = 0, 1, 0.1 do
		wait()
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, .4 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(170), math.rad(0), math.rad(0)), 0.3)
		weapon.Handle.Weld.C0 = clerp(weapon.Handle.Weld.C0, CFrame.new(.3,0, 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(80)), 0.3)	
	end
	shoottrail(play:GetMouse(), weapon.throwpart, 0, 0)
	CreateSound("http://www.roblox.com/asset/?id=10209590",weapon.Handle,1,1)
	local d = weapon:GetChildren()
	for i=1, #d  do 
		if d[i].Name ~= "Halo" then
		d[i].Transparency = 1
		end
	end
	con:disconnect()
end


local attack4 = function()
attack = true
	for i = 0, 1, 0.1 do
		wait()
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 7 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, .4 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(170), math.rad(0), math.rad(0)), 0.3)
		weapon.Handle.Weld.C0 = clerp(weapon.Handle.Weld.C0, CFrame.new(.3,0, 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(80)), 0.3)	
	end
	for i = 0,4 do
	shoottrail2(play:GetMouse(), weapon.throwpart, 5, 0)
	end
	CreateSound("http://www.roblox.com/asset/?id=10209590",weapon.Handle,0.16,1)
	wait(1)
	attack = false
end

local spinattack = function()
attack = true
local debounce = false
local rotat = 0
	local con = weapon.hitbox1.Touched:connect(function(hit)
		if hit.Parent ~= workspace and debounce == false and hit.Parent ~= nolagplease then
		debounce = true
		magn(5,10,hit,2)
		CreateSound("http://www.roblox.com/asset/?id=10209590",weapon.Handle,1,1)
		wait(0.2)
		debounce = false
		end
	end
	)
	for i = 0, 1, 0.1 do
		wait()
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, .4 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(0)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(0)), 0.3)
		weapon.Handle.Weld.C0 = clerp(weapon.Handle.Weld.C0, CFrame.new(.3,0, 0) * CFrame.Angles(math.rad(20), math.rad(0), math.rad(0)), 0.3)	
	end
	for i = 0,5 do
	for i = 0, 1, 0.1 do
		wait()
		rotat = rotat + 30
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(rotat)), 0.3)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, .4 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(0)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(0)), 0.3)
		weapon.Handle.Weld.C0 = clerp(weapon.Handle.Weld.C0, CFrame.new(.3,0, 0) * CFrame.Angles(math.rad(10), math.rad(0), math.rad(0)), 0.3)	
	end
	end
	attack = false
	con:disconnect()
end

local burstshot = function()
attack = true
sped = 0.1
local kek = 1
	for i = 0, 1, 0.1 do
		wait()
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, .4 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(170), math.rad(0), math.rad(0)), 0.3)
		weapon.Handle.Weld.C0 = clerp(weapon.Handle.Weld.C0, CFrame.new(.3,0, 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(80)), 0.3)	
	end
	while charging == true do
	kek = kek + 1*sped
	if sped < 3 then
	sped = sped + 0.01
	print(sped)
	end
	if kek > 19 then
	kek = 0
	mana = mana - 2
	Block(weapon.throwpart.CFrame,Vector3.new(2,2,2),Vector3.new(0.1,0.1,0.1),0.1,char.Torso.BrickColor,1)
	end
	wait()
	end
	for i = 0,9 do
	shoottrail2(play:GetMouse(), weapon.throwpart, 2.5, 0)
	end
	sped = 1
	CreateSound("http://www.roblox.com/asset/?id=10209590",weapon.Handle,0.16,1)
	wait(1)
	attack = false
end

local followingshot = function()
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
	for i = 0, 1, 0.1 do
		wait()
		
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, .4 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(170), math.rad(0), math.rad(0)), 0.3)
		weapon.Handle.Weld.C0 = clerp(weapon.Handle.Weld.C0, CFrame.new(.3,0, 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(80)), 0.3)	
	end
	shoottrailtracking(play:GetMouse(), weapon.throwpart, 15, 0)
	CreateSound("http://www.roblox.com/asset/?id=10209590",weapon.Handle,1,1)
	local d = weapon:GetChildren()
	for i=1, #d  do 
		d[i].Transparency = 1
	end
	con:disconnect()
end

equip = function()
	if equipped == true then
	equipped = false
	weapon.notthehandle.Weld.Part0 = char.Torso
	weapon.notthehandle.Weld.C0 = CFrame.new(-1,-1,.5)*CFrame.fromOrientation(math.rad(45),math.rad(90),math.rad(90))
	elseif equipped == false then
	equipped = true
	weapon.notthehandle.Weld.Part0 = LeftArm
	weapon.notthehandle.Weld.C0 = CFrame.new(0,-1,0)*CFrame.fromOrientation(1.57,0,-1.5707963267949)
	end
end

local multishot = function()
attack = true
	for i = 0, 1, 0.1 do
		wait()
		if riding == true then
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 7 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		end
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, .4 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(170), math.rad(0), math.rad(0)), 0.3)
		weapon.Handle.Weld.C0 = clerp(weapon.Handle.Weld.C0, CFrame.new(.3,0, 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(80)), 0.3)	
	end
	for i = 0,25 do
	shoottrail2(play:GetMouse(), weapon.throwpart, 2.5, 0)
	wait(.1)
	CreateSound("http://www.roblox.com/asset/?id=10209590",weapon.Handle,0.16,1)
	end
	wait(.5)
	shoottrail(play:GetMouse(), weapon.throwpart, 0.1, 0)
	CreateSound("http://www.roblox.com/asset/?id=10209590",weapon.Handle,0.5,1)
	wait(1)
	attack = false
end

local sitdown = function()
	attack = true
	sit = true
	char.Humanoid.WalkSpeed = 0
	char.Humanoid.JumpPower = 0
	while attack == true do
	char.Humanoid.Health = char.Humanoid.Health + 1
	char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, -2 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(-30), math.rad(0), math.rad(0)), 0.3)
	char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.new(0,0,0)  * CFrame.Angles(math.rad(10), math.rad(0), math.rad(0)), 0.3)
	RW.C0 = clerp(RW.C0, CFrame.new(1.5, .4 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(-30), math.rad(0), math.rad(0)), 0.3)
	LW.C0 = clerp(LW.C0, CFrame.new(-1.5, .4 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(-30), math.rad(0), math.rad(0)), 0.3)
	RH.C0 = clerp(RH.C0, CFrame.new(1, -1 + 0.1 * math.cos((sine) / 20), 0) * RHCF * CFrame.Angles(math.rad(-30), math.rad(0), math.rad(60)), 0.3)
	LH.C0 = clerp(LH.C0, CFrame.new(-1, -1 + 0.1 * math.cos((sine) / 20), 0) * LHCF * CFrame.Angles(math.rad(-30), math.rad(0), math.rad(-60)), 0.3)
	wait()
	end
end

local stand = function()
	attack = false
	sit = false
	char.Humanoid.WalkSpeed = 16
	char.Humanoid.JumpPower = 50
end


selfhalo = function()
	attack = true
	for i = 0, 1, 0.05 do
		wait()
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 7 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, .4 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(170), math.rad(0), math.rad(0)), 0.3)
		weapon.Handle.Weld.C0 = clerp(weapon.Handle.Weld.C0, CFrame.new(.3,0, 0) * CFrame.Angles(math.rad(0), math.rad(90), math.rad(90)), 0.3)	
	end
	attack = false
	char.Humanoid.MaxHealth = 200
	wait(0.1)
	char.Humanoid.Health = char.Humanoid.Health*2
	local halo = Instance.new("Part", weapon)
	halo.CanCollide = false
	halo.Name = "Halo"
	halo.BrickColor = BrickColor.new("Really black")
	halo.Position = char.Torso.Position
	halo.Size = Vector3.new(0,0,0)
	local haloMesh = Instance.new("SpecialMesh", halo)
	haloMesh.MeshType = "Sphere"
	haloMesh.MeshId = "http://www.roblox.com/asset/?id=3270017"
	haloMesh.Scale = Vector3.new(1.25,1.25,1.25)
	local haloWeld = Instance.new("Weld", halo)
	haloWeld.Part0 = halo
	haloWeld.Part1 = char.Head
	haloWeld.C0 = CFrame.new(0,0,-1.7) * CFrame.fromEulerAnglesXYZ(1.57,0,0)
	
	local halo = Instance.new("Part", weapon)
	halo.CanCollide = false
	halo.Name = "Halo"
	halo.BrickColor = char.Torso.BrickColor
	halo.Position = char.Torso.Position
	halo.Size = Vector3.new(0,0,0)
	local haloMesh = Instance.new("SpecialMesh", halo)
	haloMesh.MeshType = "Sphere"
	haloMesh.MeshId = "http://www.roblox.com/asset/?id=3270017"
	haloMesh.Scale = Vector3.new(1,1,1.4)
	local haloWeld = Instance.new("Weld", halo)
	haloWeld.Part0 = halo
	haloWeld.Part1 = char.Head
	haloWeld.C0 = CFrame.new(0,0,-1.7) * CFrame.fromEulerAnglesXYZ(1.57,0,0)
	
	local halo = Instance.new("Part", weapon)
	halo.CanCollide = false
	halo.Name = "Halo"
	halo.BrickColor = BrickColor.new("Really black")
	halo.Position = char.Torso.Position
	halo.Size = Vector3.new(0,0,0)
	local haloMesh = Instance.new("SpecialMesh", halo)
	haloMesh.MeshType = "Sphere"
	haloMesh.MeshId = "http://www.roblox.com/asset/?id=3270017"
	haloMesh.Scale = Vector3.new(.75,.75,1.55)
	local haloWeld = Instance.new("Weld", halo)
	haloWeld.Part0 = halo
	haloWeld.Part1 = char.Head
	haloWeld.C0 = CFrame.new(0,0,-1.7) * CFrame.fromEulerAnglesXYZ(1.57,0,0)
	
	Block(halo.CFrame,Vector3.new(1,1,1),Vector3.new(0.05,0.05,0.05),0.05,char.Torso.BrickColor,1)
end


local healray = function()
attack = true
	CreateSound("http://www.roblox.com/asset/?id=2101144",weapon.Handle,.5,1)
	for i = 0, 1, 0.1 do
		wait()
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, .4 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(170), math.rad(0), math.rad(0)), 0.3)
		weapon.Handle.Weld.C0 = clerp(weapon.Handle.Weld.C0, CFrame.new(.3,0, 0) * CFrame.Angles(math.rad(0), math.rad(100), math.rad(90)), 0.3)	
	end
	while charging == true do
	shoottrailheal(play:GetMouse(), weapon.throwpart, 0, 0)
	wait(.05)
	end
	
	attack = false
end

halo = function()
	attack = true
	for i = 0, 1, 0.05 do
		wait()
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 7 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, .4 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(170), math.rad(0), math.rad(0)), 0.3)
		weapon.Handle.Weld.C0 = clerp(weapon.Handle.Weld.C0, CFrame.new(.3,0, 0) * CFrame.Angles(math.rad(0), math.rad(90), math.rad(90)), 0.3)	
	end
	shoottrailhalo(play:GetMouse(), weapon.throwpart, 0, 0,"halo")
	attack = false
end

speed = function()
	attack = true
	for i = 0, 1, 0.05 do
		wait()
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 7 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, .4 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(170), math.rad(0), math.rad(0)), 0.3)
		weapon.Handle.Weld.C0 = clerp(weapon.Handle.Weld.C0, CFrame.new(.3,0, 0) * CFrame.Angles(math.rad(0), math.rad(90), math.rad(90)), 0.3)	
	end
	shoottrailhalo(play:GetMouse(), weapon.throwpart, 0, 0,"speed")
	attack = false
end

ragebuff = function()
	attack = true
	local duration = 250
	for i = 0, 1, 0.05 do
		wait()
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, .4 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(170), math.rad(0), math.rad(0)), 0.3)
		weapon.Handle.Weld.C0 = clerp(weapon.Handle.Weld.C0, CFrame.new(.3,0, 0) * CFrame.Angles(math.rad(0), math.rad(90), math.rad(90)), 0.3)	
	end
	CreateSound("rbxasset://sounds/Launching rocket.wav",weapon.Handle,.5,1)
	rage = true
	attack = false
	while rage == true do
	Block(weapon.throwpart.CFrame,Vector3.new(1,1,1),Vector3.new(0.1,0.1,0.1),0.05,char.Torso.BrickColor,1)
	char.Humanoid.Health = char.Humanoid.Health - 0.5
	magn(1,2,weapon.throwpart,1)
	wait(.1)
	end
	rage = false
end

explosionbuff = function()
	attack = true
	local duration = 250
	for i = 0, 1, 0.05 do
		wait()
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, .4 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(170), math.rad(0), math.rad(0)), 0.3)
		weapon.Handle.Weld.C0 = clerp(weapon.Handle.Weld.C0, CFrame.new(.3,0, 0) * CFrame.Angles(math.rad(0), math.rad(90), math.rad(90)), 0.3)	
	end
	CreateSound("rbxasset://sounds/Launching rocket.wav",weapon.Handle,.5,1)
	explosion = true
	attack = false
	while duration > 0 and explosion == true do
	Block(weapon.throwpart.CFrame*CFrame.new(-2,0,0),Vector3.new(1,1,1),Vector3.new(0.1,0.1,0.1),0.05,BrickColor.new("Institutional white"),1)
	duration = duration - 2
	magn(1,2,weapon.throwpart,1)
	wait(.1)
	end
	explosion = false
end

goldenbuff = function()
	attack = true
	local brick = char.Torso.BrickColor
	local duration = 250
	for i = 0, 1, 0.05 do
		wait()
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, .4 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(170), math.rad(0), math.rad(0)), 0.3)
		weapon.Handle.Weld.C0 = clerp(weapon.Handle.Weld.C0, CFrame.new(.3,0, 0) * CFrame.Angles(math.rad(0), math.rad(90), math.rad(90)), 0.3)	
	end
	CreateSound("rbxasset://sounds/Launching rocket.wav",weapon.Handle,.5,1)
	golden = true
	attack = false
	while duration > 0 do
	mana = mana + 1
	duration = duration - 5
	Block(weapon.throwpart.CFrame,Vector3.new(4,4,4),Vector3.new(.1,.1,.1),0.15,BrickColor.new("New Yeller"),1)
	magn(2,4,weapon.throwpart,2)
	wait(.5)
	end
	mana = 0
	golden = false
end


equipped = false
	weapon.notthehandle.Weld.Part0 = char.Torso
	weapon.notthehandle.Weld.C0 = CFrame.new(-1,-1,.5)*CFrame.fromOrientation(math.rad(45),math.rad(90),math.rad(90))

play:GetMouse().Button1Down:connect(function()
	if riding == false and mode == "Combo" and equipped == true then
	if attack == false and combo == 1 then
		combo = 2
		attack1()
	elseif attack == false and combo == 2 then
		combo = 1
		attack2()
	elseif attack == false and combo == 3 then
		combo = 1
		attack3()
	end
	end
	if riding == false and mode == "Throw" and attack == false and equipped == true and mana >= 25 then
		mana = mana - 25
		attack3()
	end
	if riding == true and attack == false and equipped == true and mana >= 50 then
		attack4()
	end
end)

play:GetMouse().KeyDown:connect(function(k)
	
	k = k:lower()
	if k == "f" and attack == false and equipped == true then
		if spawned == false then
			attack = true
			riding = true
			char.Humanoid.WalkSpeed = 30
			spawn()
			attack = false
			elseif spawned == true then
			if riding == true then
			riding = false
			char.Humanoid.WalkSpeed = 16
			local d = model:GetChildren()
			for i=1, #d  do 
			if d[i].ClassName == "Part" then
			d[i].CanCollide = false
						d[i].Transparency = 1
					end 
				end
			elseif riding == false then
				riding = true
				char.Humanoid.WalkSpeed = 30
				local d = model:GetChildren()
				for i=1, #d  do 
					if d[i].ClassName == "Part" and d[i].Name ~= "spinneblock" and d[i].Name ~= "BasePart" then
						d[i].CanCollide = true
						d[i].Transparency = 0
					end 
				end
			end
		end
	elseif k == "q" and attack == false and equipped == true then
		if mode == "Combo" then
			mode = "Throw"
		elseif mode == "Throw" then
			mode = "Combo"
		end
	elseif k == "e" and attack == false and riding == false and equipped == true and mana >= 75 then
		mana = mana - 75
		spinattack()
	elseif k == "r" and attack == false and equipped == true and mana >= 50 then
		charging = true
		burstshot()
	elseif k == "t" and attack == false and equipped == true and mana >= 50 then
		mana = mana -50
		followingshot()
	elseif k == "y" and attack == false and equipped == true and mana >= 60 then
		mana = mana -60
		multishot()
	elseif k == "1" and attack == false then
		equip()
	elseif k == "k" and attack == false and sit == false and riding == false then
		if equipped == false then
		equipcheck = false
		end	
		if equipped == true then
		equipcheck = true
		equip()
		end		
		sitdown()
	elseif k == "k" and attack == true and sit == true and riding == false then
		stand()
		if equipcheck == true then
		equip()
		end
	elseif k == "z" and attack == false and riding == true and mana >= 100 and equipped == true then
		mana = mana - 100
		selfhalo()
	elseif k == "c" and attack == false and riding == true and mana >= 50 and equipped == true then
		charging = true		
		healray()
	elseif k == "x" and attack == false and riding == true and mana >= 50 and equipped == true then
		mana = mana - 50
		halo()
	elseif k == "v" and attack == false and riding == true and mana >= 50 and equipped == true then
		mana = mana - 50
		speed()
	elseif k == "b" and attack == false and rage == false and mana >= 0 and golden == false and equipped == true then
		mana = mana - 0
		ragebuff()
	elseif k == "b" and attack == false and mana >= 0 and golden == false and rage == true  and equipped == true then
		rage = false
	elseif k == "j" and attack == false and explosion == false and mana >= 20 and equipped == true then
		mana = mana - 20
		explosionbuff()
	elseif k == "h" and attack == false and golden == false and mana >= 200 and rage == false and equipped == true then
		goldenbuff()
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
							if riding == false then
							char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
							elseif riding == true then
							char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 7 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
							end
							char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
							RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(10)), 0.3)
							if equipped == true then
							LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(20), math.rad(0), math.rad(-10)), 0.3)
							end
							if equipped == false then
							LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-10)), 0.3)
							end
							weapon.Handle.Weld.C0 = clerp(weapon.Handle.Weld.C0, CFrame.new(0,0, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-90)), 0.3)
							end
							RH.C0 = clerp(RH.C0, CFrame.new(1, -1 + 0.1 * math.cos((sine) / 20), 0) * RHCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
							LH.C0 = clerp(LH.C0, CFrame.new(-1, -1 + 0.1 * math.cos((sine) / 20), 0.1) * LHCF * CFrame.Angles(math.rad(0), math.rad(20), math.rad(0)), 0.3)
							
					else
						if 2 < torsovel then
							Anim = "Walk"
								if attack == false and sit == false then
								if riding == false then
								char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
								elseif riding == true then
								char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 7 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(10), math.rad(0), math.rad(0)), 0.3)
								end
								char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
								RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(-10), math.rad(0), math.rad(10)), 0.3)
								if equipped == true then
								LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(20), math.rad(0), math.rad(-10)), 0.3)
								end
								if equipped == false then
								LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(-10), math.rad(0), math.rad(-10)), 0.3)
								end
								weapon.Handle.Weld.C0 = clerp(weapon.Handle.Weld.C0, CFrame.new(0,0, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-90)), 0.3)
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

