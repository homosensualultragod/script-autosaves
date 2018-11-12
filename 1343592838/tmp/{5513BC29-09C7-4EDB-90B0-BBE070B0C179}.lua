-- Remake of Armatae by
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
local parry = true
local equipcheck = false
local charge = 1
local orb = false
local throwing = false
local sped = 1
local riding = false
local sine = 0
local torsovel = 0
local sit = false
local ult = false
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
if kind == 3 then

pm:Destroy()
p.Size = size
p.CanCollide = true
p.Touched:connect(function(hit)
if debounce == false then
if hit.Parent.Humanoid then
	debounce = true
	hit.Parent.Humanoid.Health = hit.Parent.Humanoid.Health - 5
	wait()
	debounce = false
end
end
end)
end
coroutine.resume(coroutine.create(function()
while p.Transparency < 1 do
if kind == 3 then
p.Transparency = p.Transparency + transp
p.Size = p.Size + expansize
else

p.Transparency = p.Transparency + transp
pm.Scale = pm.Scale + expansize
end
if kind == 1 then
p.CFrame = p.CFrame * CFrame.fromEulerAnglesXYZ(math.rad(math.random(0,180)),math.rad(math.random(0,180)),math.rad(math.random(0,180)))
end
wait()
end
p:Destroy()
end))
end


local wave = function(cframe,color,v1,v2,trans,typ) 
local p = Instance.new("Part", nolagplease) 
p.BrickColor = color 
p.Transparency = 0 
p.Anchored = true 
p.CFrame = cframe
if typ == 1 then
	p.CFrame = p.CFrame * CFrame.fromEulerAnglesXYZ(math.rad(math.random(0,180)),math.rad(math.random(0,180)),math.rad(math.random(0,180)))
end
p.CanCollide = false 
local pm = Instance.new("SpecialMesh", p) 
pm.MeshType = "FileMesh" 
pm.MeshId = "http://www.roblox.com/asset/?id=20329976" 
pm.Scale = v1
coroutine.resume(coroutine.create(function()
while p.Transparency < 1 do
wait() 
pm.Scale = pm.Scale + v2
p.Transparency = p.Transparency + trans
if typ == 1 then
	p.CFrame = p.CFrame * CFrame.fromEulerAnglesXYZ(math.rad(math.random(0,180)),math.rad(math.random(0,180)),math.rad(math.random(0,180)))
end
end 
p:Remove() 
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
a.Size = UDim2.new(1, 0,.05, 0)
a.Text = tex
a.Position = UDim2.new(pos1,0,pos2,0)
a.TextScaled = true
a.TextColor3 = char.Torso.Color
a.TextXAlignment = "Left"
a.BackgroundTransparency = 1
coroutine.resume(coroutine.create(function()
if tex == "[X]" then
while true do
if equipcheck == false then
if equipped == true then
	a.Text = "[X]  Spin Attack  [35]"
elseif equipped == false then
	if parry == true then
	a.Text = "[X]  Parry  [35]"
	elseif parry == false then
	a.Text = "[X]  Forced Parry  [15]"
	end
end
else
a.Text = "[X] Hexagon Trap [150]"
end
wait(.1)
end
end

if tex == "[E]" then
while true do
if ult == false then
if equipped == true then
	a.Text = "[E]  Unequip"
elseif equipped == false then
	a.Text = "[E]  Equip"
end
end
if ult == true then
	a.Text = "[E]  Exit Ult"
end
wait(.1)
end	
end

if tex == "[C]" then
while true do
if ult == false then
	a.Text = "[C]  Orbs  [7/s]"
end
if ult == true then
	if equipcheck == true then
	a.Text = "[C]  Orbs  [11/s]"
	else
	a.Text = "[C]  Ultimate Orbs  [11/s]"
	end
end
wait(.1)
end	
end

if tex == "[H]" then
while true do
if equipped == true then
	if ult == false then
	a.Text = "[H]  Sword Ult Mode	[200]"
	end
elseif equipped == false then
	if ult == false then
	a.Text = "[H]  Magic Ult Mode	[200]"
	else
	if equipcheck == false then
	a.Text = "[H]  Magic Ult	[400]"
	else
	a.Text = "[H]  Sword Ult	[400]"
	end
	end
end
wait(.1)
end	
end

if tex == "[Z]" then
while true do
if ult == false then
	a.Text = "[Z]  Shield Dash  [25]"
else
	if equipcheck == true then
	a.Text = "[Z]  Sword Bounce  [25]"
	end
end
wait(.1)
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
a.Size = UDim2.new(1, 0,1, 0)
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

makegui(0,0,"[E]")
makegui(0,.12,"[Z]")
makegui(0,.18,"[X]")
makegui(0,.24,"[C]")
makegui(0,.36,"[H]")
makegui(0,.36,"[H]")




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

local sword1 = Instance.new("Part", weapon)
sword1.CanCollide = false
sword1.Transparency = 1
sword1.BrickColor = BrickColor.new("Institutional white")
local mesh1 = Instance.new("SpecialMesh", sword1)
mesh1.MeshType = "FileMesh"
mesh1.MeshId = "rbxasset://fonts/sword.mesh"
local weld1 = Instance.new("Weld", sword1)
weld1.Part0 = char.Torso
weld1.Part1 = sword1
weld1.C0 = CFrame.fromEulerAnglesXYZ(math.rad(-30),math.rad(15),math.rad(90)) * CFrame.new(.5,-.8,3.4)

local sword2 = Instance.new("Part", weapon)
sword2.CanCollide = false
sword2.Transparency = 1
sword2.BrickColor = BrickColor.new("Institutional white")
local mesh2 = Instance.new("SpecialMesh", sword2)
mesh2.MeshType = "FileMesh"
mesh2.MeshId = "rbxasset://fonts/sword.mesh"
local weld2 = Instance.new("Weld", sword2)
weld2.Part0 = char.Torso
weld2.Part1 = sword2
weld2.C0 = CFrame.fromEulerAnglesXYZ(math.rad(-30),math.rad(-15),math.rad(90)) * CFrame.new(.5,.8,3.4)

local sword11 = Instance.new("Part", weapon)
sword11.CanCollide = false
sword11.Transparency = 1
sword11.BrickColor = BrickColor.new("Institutional white")
local mesh11 = Instance.new("SpecialMesh", sword11)
mesh11.MeshType = "FileMesh"
mesh11.MeshId = "rbxasset://fonts/sword.mesh"
local weld11 = Instance.new("Weld", sword11)
weld11.Part0 = char.Torso
weld11.Part1 = sword11
weld11.C0 = CFrame.fromEulerAnglesXYZ(0,math.rad(15),math.rad(90)) * CFrame.new(0,-.8,3)

local sword21 = Instance.new("Part", weapon)
sword21.CanCollide = false
sword21.Transparency = 1
sword21.BrickColor = BrickColor.new("Institutional white")
local mesh21 = Instance.new("SpecialMesh", sword21)
mesh21.MeshType = "FileMesh"
mesh21.MeshId = "rbxasset://fonts/sword.mesh"
local weld21 = Instance.new("Weld", sword21)
weld21.Part0 = char.Torso
weld21.Part1 = sword21
weld21.C0 = CFrame.fromEulerAnglesXYZ(0,math.rad(-15),math.rad(90)) * CFrame.new(0,.8,3)

local sword12 = Instance.new("Part", weapon)
sword12.CanCollide = false
sword12.Transparency = 1
sword12.BrickColor = BrickColor.new("Institutional white")
local mesh12 = Instance.new("SpecialMesh", sword12)
mesh12.MeshType = "FileMesh"
mesh12.MeshId = "rbxasset://fonts/sword.mesh"
local weld12 = Instance.new("Weld", sword12)
weld12.Part0 = char.Torso
weld12.Part1 = sword12
weld12.C0 = CFrame.fromEulerAnglesXYZ(math.rad(30),math.rad(15),math.rad(90)) * CFrame.new(-.5,-.8,3.4)

local sword22 = Instance.new("Part", weapon)
sword22.CanCollide = false
sword22.Transparency = 1
sword22.BrickColor = BrickColor.new("Institutional white")
local mesh22 = Instance.new("SpecialMesh", sword22)
mesh22.MeshType = "FileMesh"
mesh22.MeshId = "rbxasset://fonts/sword.mesh"
local weld22 = Instance.new("Weld", sword22)
weld22.Part0 = char.Torso
weld22.Part1 = sword22
weld22.C0 = CFrame.fromEulerAnglesXYZ(math.rad(30),math.rad(-15),math.rad(90)) * CFrame.new(-.5,.8,3.4)



part(1,1,Vector3.new(1,1,1),"Block",0,0,0,1,2,LeftArm,CFrame.new(0,-1,0),"ST")
part(1,1,Vector3.new(1.3333345651627,0.66666728258133,1.3333345651627),"Block",0.066666670143604,0.066666670143604,0.066666670143604,0,2,RightArm,CFrame.new(0,0.0033329725265503,-0.0028928816318512)*CFrame.fromOrientation(0,0,0),"Handle2")
part(1,1,Vector3.new(0.50000047683716,0.66666728258133,0.50000047683716),"Block",1,0,0,0,6,weapon.Handle2,CFrame.new(0,0.086666345596313,-0.71837568283081)*CFrame.fromOrientation(0,-0.78539816339745,0),"Block")
part(1,1,Vector3.new(0.16666682064533,0.8333340883255,0.8333340883255),"Wedge",1,0,0,0,6,weapon.Handle2,CFrame.new(0.41666704416275,0.16999989748001,-1.2528940439224)*CFrame.fromOrientation(0,-1.5707963267949,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.16666682064533,0.66666728258133,0.66666728258133),"Wedge",0.066666670143604,0.066666670143604,0.066666670143604,0,2,weapon.Handle2,CFrame.new(-0.33333364129066,0.25333324074745,-1.0028936862946)*CFrame.fromOrientation(0,0,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.50000047683716,1.0000009536743,1.0000009536743),"Wedge",0.066666670143604,0.066666670143604,0.066666670143604,0,2,weapon.Handle2,CFrame.new(-0.50000047683716,-0.080000340938568,-1.5028941631317)*CFrame.fromOrientation(0,0,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.50000047683716,1.0000009536743,1.0000009536743),"Wedge",0.066666670143604,0.066666670143604,0.066666670143604,0,2,weapon.Handle2,CFrame.new(0.50000047683716,-0.080000340938568,-1.5028941631317)*CFrame.fromOrientation(0,0,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.16666682064533,0.8333340883255,0.8333340883255),"Wedge",1,0,0,0,6,weapon.Handle2,CFrame.new(-0.41666704416275,0.16999989748001,-1.2528940439224)*CFrame.fromOrientation(0,0,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.16666682064533,0.66666728258133,0.66666728258133),"Wedge",0.066666670143604,0.066666670143604,0.066666670143604,0,2,weapon.Handle2,CFrame.new(0.33333364129066,0.25333324074745,-1.0028936862946)*CFrame.fromOrientation(0,0,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(1.666668176651,0.50000047683716,1.666668176651),"Block",1,0,0,0,6,weapon.Handle2,CFrame.new(0,0.0033329725265503,-0.0028928816318512)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(2.0000019073486,0.50000071525574,2.0000019073486),"Block",0.066666670143604,0.066666670143604,0.066666670143604,0,2,weapon.Handle2,CFrame.new(0,-0.080000519752502,-0.0028928816318512)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.66666728258133,0.50000047683716,1.0000009536743),"Block",1,0,0,0,6,weapon.Handle2,CFrame.new(-0.88214945793152,0.0033442378044128,0.87925684452057)*CFrame.fromOrientation(0,-0.78539816339745,0),"Block")
part(1,1,Vector3.new(1.0000009536743,0.50000047683716,1.0000009536743),"Block",0.066666670143604,0.066666670143604,0.066666670143604,0,2,weapon.Handle2,CFrame.new(-1.0000009536743,-0.079989075660706,0.9971079826355)*CFrame.fromOrientation(0,-0.78539816339745,0),"Block")
part(1,1,Vector3.new(0.33333364129066,0.58333384990692,0.8333340883255),"Block",0.066666670143604,0.066666670143604,0.066666670143604,0,2,weapon.Handle2,CFrame.new(0.84344428777695,0.045011043548584,0.82033109664917)*CFrame.fromOrientation(0,0.78539816339745,0),"Block")
part(1,1,Vector3.new(0.66666728258133,0.66666728258133,0.66666728258133),"Block",1,0,0,0,6,weapon.Handle2,CFrame.new(0,0.086666345596313,0.080440580844879)*CFrame.fromOrientation(0,-0.78539816339745,0),"Block")
part(1,1,Vector3.new(1.0000009536743,0.50000047683716,1.0000009536743),"Block",0.066666670143604,0.066666670143604,0.066666670143604,0,2,weapon.Handle2,CFrame.new(1.0000009536743,-0.079989075660706,0.9971079826355)*CFrame.fromOrientation(0,-0.78539816339745,0),"Block")
part(1,1,Vector3.new(0.91666752099991,0.50000047683716,0.66666728258133),"Block",1,0,0,0,6,weapon.Handle2,CFrame.new(0.91161245107651,0.0033442378044128,0.90871953964233)*CFrame.fromOrientation(0,-0.78539816339745,0),"Block")
part(1,1,Vector3.new(0.33333364129066,0.58333384990692,0.8333340883255),"Block",0.066666670143604,0.066666670143604,0.066666670143604,0,2,weapon.Handle2,CFrame.new(-0.82322382926941,0.045011043548584,0.82033109664917)*CFrame.fromOrientation(0,-0.78539816339745,0),"Block")

part(1,1,Vector3.new(0.29704913496971,0.29704913496971,0.29704913496971),"Block",0.63921570777893,0.63529413938522,0.64705884456635,1,1,LeftArm,CFrame.new(0.15389770269394,-0.20993836224079,-0.37024655938148)*CFrame.fromOrientation(0.75258595481783,2.3242549329229,1.9734437799037),"Handle")
part(1,1,Vector3.new(0.29704913496971,0.29704913496971,0.14852456748486),"Block",0.066666670143604,0.066666670143604,0.066666670143604,0,2,weapon.Handle,CFrame.new(0.59409826993942,0,-0.59950757026672)*CFrame.fromOrientation(0,1.5707963267949,0),"Block")
part(1,1,Vector3.new(0.89114737510681,0.29704913496971,0.29704913496971),"Block",0.066666670143604,0.066666670143604,0.066666670143604,0,2,weapon.Handle,CFrame.new(0,0,-0.59950757026672)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.89114737510681,0.29704913496971,0.29704913496971),"Cylinder",0.066666670143604,0.066666670143604,0.066666670143604,0,2,weapon.Handle,CFrame.new(0,0,-0.0054092407226563)*CFrame.fromOrientation(0,1.5707963267949,0),"Cylinder")
part(1,1,Vector3.new(0.59409826993942,0.14852456748486,2.2278685569763),"Block",1,0,0,0,6,weapon.Handle,CFrame.new(0,0,-1.8619664907455)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.14852456748486,0.29704913496971,0.59409826993942),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(0.14852456748486,0,-3.2729496955872)*CFrame.fromOrientation(0,0,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.29704913496971,0.14852456748486,0.29704913496971),"Wedge",0.066666670143604,0.066666670143604,0.066666670143604,0,2,weapon.Handle,CFrame.new(-0.074262283742428,0,-3.1244254112244)*CFrame.fromOrientation(0,0,1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.29704913496971,0.14852456748486,0.29704913496971),"Wedge",0.066666670143604,0.066666670143604,0.066666670143604,0,2,weapon.Handle,CFrame.new(0.074262283742428,0,-3.1244254112244)*CFrame.fromOrientation(0,0,-1.5707963267949),"Wedge")
part(1,1,Vector3.new(0.089114740490913,0.59409826993942,0.59409826993942),"Cylinder",0.066666670143604,0.066666670143604,0.066666670143604,0,2,weapon.Handle,CFrame.new(0,0,0.66295099258423)*CFrame.fromOrientation(0,0,1.5707963267949),"Cylinder")
part(1,1,Vector3.new(0.29704913496971,0.29704913496971,0.29704913496971),"Ball",0.066666670143604,0.066666670143604,0.066666670143604,0,2,weapon.Handle,CFrame.new(0,4.4263770426767e-09,0.44016432762146)*CFrame.fromOrientation(0,0,0),"Ball")
part(1,1,Vector3.new(0.11881965398788,0.44557368755341,0.44557368755341),"Cylinder",1,0,0,0,6,weapon.Handle,CFrame.new(0,0,0.66295099258423)*CFrame.fromOrientation(0,0,1.5707963267949),"Cylinder")
part(1,1,Vector3.new(0.29704913496971,0.29704913496971,2.2278685569763),"Block",0.066666670143604,0.066666670143604,0.066666670143604,0,2,weapon.Handle,CFrame.new(0,0,-1.8619664907455)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.14852456748486,0.29704913496971,0.29704913496971),"Cylinder",0.066666670143604,0.066666670143604,0.066666670143604,0,2,weapon.Handle,CFrame.new(0,0,0.66295099258423)*CFrame.fromOrientation(0,0,1.5707963267949),"Cylinder")
part(1,1,Vector3.new(0.14852456748486,0.29704913496971,0.59409826993942),"Wedge",1,0,0,0,6,weapon.Handle,CFrame.new(-0.14852456748486,0,-3.2729496955872)*CFrame.fromOrientation(0,0,1.5707963267949),"Wedge")
part(1,1,Vector3.new(1.4852457046509,0.14852456748486,0.14852456748486),"Block",1,0,0,0,6,weapon.Handle,CFrame.new(0,0,-0.59950757026672)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.29704913496971,0.29704913496971,0.14852456748486),"Block",0.066666670143604,0.066666670143604,0.066666670143604,0,2,weapon.Handle,CFrame.new(-0.59409826993942,0,-0.59950757026672)*CFrame.fromOrientation(0,1.5707963267949,0),"Block")

	
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
	local ActualPosition = partt.Position
	local MainPos2 = Vector3.new()
	if mouse == play:GetMouse() then
	MainPos2 = mouse.Hit.p + SpreadVectors
	else
		MainPos2 = mouse.Position
	end
	local MouseLook = CFrame.new((ActualPosition + MainPos2) / 2, MainPos2)
	local distance = 150
	if rage == true then
		distance = distance * 2
	end
	local remainder = 1
	local charge2 = charge
	charge = 1
	coroutine.resume(coroutine.create(function()
		
		repeat
			wait()
			local hit, pos = rayCast(ActualPosition, MouseLook.lookVector, distance, char.HumanoidRootPart.Parent)
			local magnitude = (ActualPosition - pos).magnitude
			Laser(char.Torso.BrickColor, CFrame.new((ActualPosition + pos) / 2, pos) * CFrame.fromEulerAnglesXYZ(math.rad(90), 0, 0), 3, magnitude *(-distance / (distance / 2)), 3, -.1, 0, -.1, .1)
			ActualPosition = ActualPosition + MouseLook.lookVector * distance
			remainder = remainder - 1
			--MouseLook = MouseLook * CFrame.Angles(-.01,0, 0)
			if hit ~= nil then
				remainder = 0
			end
			do
				if remainder <= 0 then
					local magnblock = Instance.new("Part", nolagplease)
					magnblock.Transparency = 1
					magnblock.CanCollide = false
					magnblock.Anchored = true
					magnblock.CFrame = CFrame.new(pos)
					block(CFrame.new(pos),Vector3.new(2,2,2),Vector3.new(.5,.5,.5),.05,char.Torso.BrickColor,1)
					magn(10,magnblock,7)
					game:GetService("Debris"):AddItem(magnblock, 0.1)
				end
			end
		until remainder <= 0
	end
))
end

shoottrail2 = function(mouse, partt, SpreadAmount, multiply)
	
	local SpreadVectors = Vector3.new(math.random(-SpreadAmount, SpreadAmount), math.random(-SpreadAmount, SpreadAmount), math.random(-SpreadAmount, SpreadAmount))
	local MainPos = partt.Position
	local MainPos2 = Vector3.new()
	if mouse == play:GetMouse() then
	MainPos2 = mouse.Hit.p + SpreadVectors
	else
		MainPos2 = mouse.Position
	end
	local MouseLook = CFrame.new((MainPos + MainPos2) / 2, MainPos2)
	local speed = 30
	if rage == true then
		speed = speed * 2
	end
	local remainder = 5
	local charge2 = charge
	charge = 1
	coroutine.resume(coroutine.create(function()
		
		repeat
			wait()
			MainPos2 = mouse.Hit.p + SpreadVectors
			MouseLook = CFrame.new((MainPos + MainPos2) / 2, MainPos2) * CFrame.Angles(math.rad(math.random(-5,5)),math.rad(math.random(-5,5)),math.rad(math.random(-5,5)))
			local hit, pos = rayCast(MainPos, MouseLook.lookVector, speed, char.HumanoidRootPart.Parent)
			local mag = (MainPos - pos).magnitude
			Laser(BrickColor.new("Institutional white"), CFrame.new((MainPos + pos) / 2, pos) * CFrame.Angles(1.57, 0, 0), 1, mag *(-speed / (speed / 2)), 1, -.1, 0, -.1, .3)
			MainPos = MainPos + MouseLook.lookVector * speed
			remainder = remainder - 1
			if hit ~= nil then
				remainder = 0
				local refpart = Instance.new("Part", nolagplease)
				refpart.Transparency = 1
				refpart.CanCollide = false
				refpart.Anchored = true
				refpart.CFrame = CFrame.new(pos)
				game:GetService("Debris"):AddItem(refpart, 2)
			end
			do
				if remainder <= 0 then
					local refpart = Instance.new("Part", nolagplease)
					refpart.Transparency = 1
					refpart.CanCollide = false
					refpart.Anchored = true
					refpart.CFrame = CFrame.new(pos)
					block(CFrame.new(pos),Vector3.new(1,1,1),Vector3.new(.5,.5,.5),.1,BrickColor.new("Really black"),1)
					magn(6,refpart,2)
					--CreateSound("http://www.roblox.com/asset/?id=10209590",refpart,1,1)
					game:GetService("Debris"):AddItem(refpart, 0.1)
				end
			end
		until remainder <= 0
	end
))
end

swordthrow = function(mouse, partt, SpreadAmount, multiply, sword, reweldc0)
	local SpreadVectors = Vector3.new(math.random(-SpreadAmount, SpreadAmount), math.random(-SpreadAmount, SpreadAmount), math.random(-SpreadAmount, SpreadAmount))
	local ActualPosition = partt.Position
	local MainPos2 = Vector3.new()
	local kappa = 0
	if mouse == play:GetMouse() then
	MainPos2 = mouse.Hit.p + SpreadVectors
	else
	MainPos2 = mouse.Position
	end
	local MouseLook = CFrame.new((ActualPosition + MainPos2) / 2, MainPos2)
	local distance = 4
	local remainder = 25
	local reweld = sword.Weld.Part0
	sword.Weld.Part0 = sword
	sword.Anchored = true
	coroutine.resume(coroutine.create(function()
		
		repeat
			wait()
			throwing = true
			local hit, pos = rayCast(ActualPosition, MouseLook.lookVector, distance, char.HumanoidRootPart.Parent)
			local magnitude = (ActualPosition - pos).magnitude
			kappa = kappa + 30
			sword.CFrame = CFrame.new((ActualPosition + pos) / 2, pos) * CFrame.fromEulerAnglesXYZ(math.rad(-kappa),0,math.rad(90))
			ActualPosition = ActualPosition + MouseLook.lookVector * distance
			remainder = remainder - 1
			--MouseLook = MouseLook * CFrame.Angles(-.01,0, 0)
			if hit ~= nil then
				remainder = 0
			end
			do
				if remainder <= 0 then
					local magnblock = Instance.new("Part", nolagplease)
					magnblock.Transparency = 1
					magnblock.CanCollide = false
					magnblock.Anchored = true
					magnblock.CFrame = CFrame.new(pos)
					block(CFrame.new(pos),Vector3.new(2,2,2),Vector3.new(.5,.5,.5),.05,BrickColor.new("Really black"),1)
					magn(10,magnblock,7)
					game:GetService("Debris"):AddItem(magnblock, 0.1)
				end
			end
		until remainder <= 0
		while attack == true do
		sword.Transparency = 1
		wait()
		end
		sword.Transparency = 0.4
		sword.Anchored = false
		sword.Weld.Part0 = char.Torso
		sword.Weld.C0 = reweldc0
		
		block(sword.CFrame,Vector3.new(1,1,5),Vector3.new(0,0,0),.1,BrickColor.new("Institutional white"),2)
		throwing = false
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
					hum.Health = hum.Health - dam * (hum.MaxHealth/100)
					mana = mana + dam/5
					if ult == true and equipcheck == false then
					mana = mana + dam/5
					end
					if ult == true and equipcheck == true then
					char.Humanoid.Health = char.Humanoid.Health + dam/5
					end
				end
			end
		end
	end
end

magna = function(dam,par,dist)
	
	for _,c in pairs(workspace:children()) do
		local hum = c:findFirstChild("Humanoid")
		if hum ~= nil then
			local head = c:findFirstChild("Torso")
			if head ~= nil then
				local targ = head.Position - par.Position
				local mag = targ.magnitude
				if mag <= dist then
					hum.Health = hum.Health - dam * (hum.MaxHealth/100)
				end
			end
		end
	end
end

local pasthp = 0

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


attack1 = function()
	attack = true
	local kekke = 0
	for i = 0, 1, 0.1 do
		wait()
		kekke = kekke + 8
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(kekke+70)), 0.3)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-70)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(0)), 01)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-10)), 0.3)
		weapon.Handle.Weld.C0 = clerp(weapon.Handle.Weld.C0, CFrame.new(0, -1, -.1) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-90)), 1)
	end
	for i = 0, 1, 0.1 do
		wait()
		magn(1.5,weapon.Handle2,4)
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(20)), 0.3)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-20)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(90)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-10)), 0.3)
		weapon.Handle.Weld.C0 = clerp(weapon.Handle.Weld.C0, CFrame.new(0, -1, -.1) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-90)), 1)
	end
	attack = false
end

attack2 = function()
	attack = true
	local kekke = 0
	for i = 0, 1, 0.1 do
		wait()
		kekke = kekke + 20
		magn(3,weapon.Handle,4)
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-kekke+70)), 1)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-70)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(0)), 1)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(90), math.rad(0)), 0.3)
		weapon.Handle.Weld.C0 = clerp(weapon.Handle.Weld.C0, CFrame.new(0, -1, -.1) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-90)), 1)
	end
	attack = false
end

swordattack3 = function()
	attack = true
	local kekke = 0
	for i = 0, 1, 0.1 do
		wait()
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), .3)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(-75), math.rad(0), math.rad(0)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(-75), math.rad(0), math.rad(0)), 0.3)
	end
	weld11.Part0 = LeftArm
	weld21.Part0 = RightArm
	weld21.C0 = CFrame.fromEulerAnglesXYZ(math.rad(-90),math.rad(180),0) * CFrame.new(0,0,2.5)
	weld11.C0 = CFrame.fromEulerAnglesXYZ(math.rad(-90),math.rad(180),0) * CFrame.new(0,0,2.5)
	for i = 0, 1, 0.2 do
		wait()
		magn(1,sword11,4)
		magn(1,sword21,4)
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 1)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(30), math.rad(0), math.rad(0)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(30), math.rad(0), math.rad(0)), 0.3)
	end
	for i = 0, 1, 0.2 do
		wait()
		
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 1)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(0), math.rad(45), math.rad(45)), 0.6)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(160), math.rad(-60), math.rad(45)), 0.6)
	end
	magn(7.5,sword21,4)
	for i = 0, 1, 0.2 do
		wait()
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 1)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(160), math.rad(60), math.rad(-45)), 0.6)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(0), math.rad(-45), math.rad(-45)), 0.6)
	end
	magn(7.5,sword11,4)
	for i = 0, 1, 0.2 do
		wait()
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 1)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(180), math.rad(40), math.rad(-45)), 0.6)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(180), math.rad(-40), math.rad(45)), 0.6)
	end
	magn(7.5,sword11,4)
	magn(7.5,sword21,4)
	for i = 0, 1, 0.2 do
		wait()
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 1)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(-60), math.rad(45), math.rad(45)), 0.6)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(-60), math.rad(-45), math.rad(-45)), 0.6)
	end
	weld11.Part0 = char.Torso
	weld11.C0 = CFrame.fromEulerAnglesXYZ(0,math.rad(15),math.rad(90)) * CFrame.new(0,-.8,3)
	weld21.Part0 = char.Torso
	weld21.C0 = CFrame.fromEulerAnglesXYZ(0,math.rad(-15),math.rad(90)) * CFrame.new(0,.8,3)
	block(sword11.CFrame,Vector3.new(1,1,5),Vector3.new(0,0,0),.1,BrickColor.new("Institutional white"),2)
	block(sword21.CFrame,Vector3.new(1,1,5),Vector3.new(0,0,0),.1,BrickColor.new("Institutional white"),2)
	attack = false
end

swordattack4 = function()
	attack = true
	local kekke = 0
	for i = 0, 1, 0.1 do
		wait()
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), .3)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.4 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(-40), math.rad(0), math.rad(0)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.4 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
	end
	weld12.Part0 = LeftArm
	weld22.Part0 = RightArm
	weld22.C0 = CFrame.fromEulerAnglesXYZ(math.rad(-90),math.rad(180),0) * CFrame.new(0,0,2.5)
	weld12.C0 = CFrame.fromEulerAnglesXYZ(math.rad(-90),math.rad(180),0) * CFrame.new(0,0,2.5)
	for i = 0, 1, 0.2 do
		wait()
		magn(1,sword11,4)
		magn(1,sword21,4)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(120), math.rad(0), math.rad(10)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(-40), math.rad(0), math.rad(0)), 0.3)
	end
	swordthrow(play:GetMouse(),sword22,0,0,sword22, CFrame.fromEulerAnglesXYZ(math.rad(30),math.rad(-15),math.rad(90)) * CFrame.new(-.5,.8,3.4))
	for i = 0, 1, 0.2 do
		wait()
		magn(1,sword11,4)
		magn(1,sword21,4)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(120), math.rad(0), math.rad(10)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(120), math.rad(0), math.rad(-10)), 0.3)
	end
	swordthrow(play:GetMouse(),sword12,0,0,sword12, CFrame.fromEulerAnglesXYZ(math.rad(30),math.rad(15),math.rad(90)) * CFrame.new(-.5,-.8,3.4))
	for i = 0, 1, 0.2 do
		wait()
		magn(1,sword11,4)
		magn(1,sword21,4)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(120), math.rad(0), math.rad(-10)), 0.3)
	end
	attack = false
end

swordattack5 = function()
	attack = true
	local kekke = 60
	for i = 0, 1, 0.2 do
		wait()
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), .3)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.4 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(240), math.rad(0), math.rad(0)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.4 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(240), math.rad(0), math.rad(0)), 0.3)
	end
	weld1.Part0 = LeftArm
	weld2.Part0 = RightArm
	weld2.C0 = CFrame.fromEulerAnglesXYZ(math.rad(0),math.rad(180),0) * CFrame.new(0,-1,0)
	weld1.C0 = CFrame.fromEulerAnglesXYZ(math.rad(0),math.rad(180),0) * CFrame.new(0,-1,0)
	for i = 0, 1, 0.2 do
		wait()
		magn(1,sword11,4)
		magn(1,sword21,4)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(-kekke)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(kekke)), 0.3)
	end
	while kekke > -120 do
		wait()
		magn(1,sword1,2)
		magn(1,sword2,2)
		kekke = kekke - 7
		weld2.C0 = CFrame.fromEulerAnglesXYZ(math.rad(0),math.rad(180+kekke*15),0) * CFrame.new(0,-1,0)
		weld1.C0 = CFrame.fromEulerAnglesXYZ(math.rad(0),math.rad(180-kekke*15),0) * CFrame.new(0,-1,0)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(-kekke)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(kekke)), 0.3)
		--block(sword1.CFrame,Vector3.new(1,1,5),Vector3.new(0,0,0),.3,BrickColor.new("Institutional white"),2)
		--block(sword2.CFrame,Vector3.new(1,1,5),Vector3.new(0,0,0),.3,BrickColor.new("Institutional white"),2)
	end
	attack = false
	weld1.Part0 = char.Torso
	weld2.Part0 = char.Torso
	weld2.C0 = CFrame.fromEulerAnglesXYZ(math.rad(-30),math.rad(-15),math.rad(90)) * CFrame.new(.5,.8,3.4)
	weld1.C0 = CFrame.fromEulerAnglesXYZ(math.rad(-30),math.rad(15),math.rad(90)) * CFrame.new(.5,-.8,3.4)
	block(sword1.CFrame,Vector3.new(1,1,5),Vector3.new(0,0,0),.1,BrickColor.new("Institutional white"),2)
	block(sword2.CFrame,Vector3.new(1,1,5),Vector3.new(0,0,0),.1,BrickColor.new("Institutional white"),2)
end

swordattack6 = function()
	attack = true
	local sworda = Instance.new("Part", char)
	sworda.CanCollide = false
	sworda.Transparency = 1
	local aw = Instance.new("Weld", sworda)
	aw.Part0 = sworda
	aw.Part1 = char.HumanoidRootPart
	local kekke = 0
	for i = 0, 1, 0.2 do
		wait()
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), .3)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.4 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(45)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.4 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(45)), 0.3)
	end
	sword1.Weld.Part0 = sworda
	sword2.Weld.Part0 = sworda
	sword11.Weld.Part0 = sworda
	sword21.Weld.Part0 = sworda
	sword12.Weld.Part0 = sworda
	sword22.Weld.Part0 = sworda
	sword1.Weld.C0 = CFrame.fromEulerAnglesXYZ(math.rad(0),math.rad(60),math.rad(0)) * CFrame.new(0,0,4)
	sword2.Weld.C0 = CFrame.fromEulerAnglesXYZ(math.rad(0),math.rad(120),math.rad(0)) * CFrame.new(0,0,4)
	sword11.Weld.C0 = CFrame.fromEulerAnglesXYZ(math.rad(0),math.rad(180),math.rad(0)) * CFrame.new(0,0,4)
	sword21.Weld.C0 = CFrame.fromEulerAnglesXYZ(math.rad(0),math.rad(240),math.rad(0)) * CFrame.new(0,0,4)
	sword12.Weld.C0 = CFrame.fromEulerAnglesXYZ(math.rad(0),math.rad(300),math.rad(0)) * CFrame.new(0,0,4)
	sword22.Weld.C0 = CFrame.fromEulerAnglesXYZ(math.rad(0),math.rad(360),math.rad(0)) * CFrame.new(0,0,4)
	block(sword1.CFrame,Vector3.new(1,1,5),Vector3.new(0,0,0),.1,BrickColor.new("Institutional white"),2)
	block(sword2.CFrame,Vector3.new(1,1,5),Vector3.new(0,0,0),.1,BrickColor.new("Institutional white"),2)
	block(sword11.CFrame,Vector3.new(1,1,5),Vector3.new(0,0,0),.1,BrickColor.new("Institutional white"),2)
	block(sword21.CFrame,Vector3.new(1,1,5),Vector3.new(0,0,0),.1,BrickColor.new("Institutional white"),2)
	block(sword12.CFrame,Vector3.new(1,1,5),Vector3.new(0,0,0),.1,BrickColor.new("Institutional white"),2)
	block(sword22.CFrame,Vector3.new(1,1,5),Vector3.new(0,0,0),.1,BrickColor.new("Institutional white"),2)
	while kekke > -120 do
		wait()
		kekke = kekke - 3.5
		aw.C0 = aw.C0 * CFrame.fromEulerAnglesXYZ(0,math.rad(-3.5),0)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(45+kekke)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(45+kekke)), 0.3)
		--block(sword1.CFrame,Vector3.new(1,1,5),Vector3.new(0,0,0),.3,BrickColor.new("Institutional white"),2)
		--block(sword2.CFrame,Vector3.new(1,1,5),Vector3.new(0,0,0),.3,BrickColor.new("Institutional white"),2)
	end
	for i = 0,1,0.1 do
		wait()
		magn(1,sword1,4)
		magn(1,sword2,4)
		magn(1,sword11,4)
		magn(1,sword21,4)
		magn(1,sword12,4)
		magn(1,sword22,4)
		aw.C0 = aw.C0 * CFrame.fromEulerAnglesXYZ(0,math.rad(28),0)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(60)), 0.6)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(60)), 0.6)
		--block(sword1.CFrame,Vector3.new(1,1,5),Vector3.new(0,0,0),.3,BrickColor.new("Institutional white"),2)
		--block(sword2.CFrame,Vector3.new(1,1,5),Vector3.new(0,0,0),.3,BrickColor.new("Institutional white"),2)
	end
	kekke = 28
	while kekke >= 0 do
		wait()
		kekke = kekke - 0.4
		magn(1*(kekke/28),sword1,4)
		magn(1*(kekke/28),sword2,4)
		magn(1*(kekke/28),sword11,4)
		magn(1*(kekke/28),sword21,4)
		magn(1*(kekke/28),sword12,4)
		magn(1*(kekke/28),sword22,4)
		aw.C0 = aw.C0 * CFrame.fromEulerAnglesXYZ(0,math.rad(kekke),0)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		--block(sword1.CFrame,Vector3.new(1,1,5),Vector3.new(0,0,0),.3,BrickColor.new("Institutional white"),2)
		--block(sword2.CFrame,Vector3.new(1,1,5),Vector3.new(0,0,0),.3,BrickColor.new("Institutional white"),2)
	end
	attack = false
	weld1.Part0 = char.Torso
	weld2.Part0 = char.Torso
	weld11.Part0 = char.Torso
	weld21.Part0 = char.Torso
	weld12.Part0 = char.Torso
	weld22.Part0 = char.Torso
	weld1.C0 = CFrame.fromEulerAnglesXYZ(math.rad(-30),math.rad(15),math.rad(90)) * CFrame.new(.5,-.8,3.4)
	weld2.C0 = CFrame.fromEulerAnglesXYZ(math.rad(-30),math.rad(-15),math.rad(90)) * CFrame.new(.5,.8,3.4)
	weld11.C0 = CFrame.fromEulerAnglesXYZ(0,math.rad(15),math.rad(90)) * CFrame.new(0,-.8,3)
	weld21.C0 = CFrame.fromEulerAnglesXYZ(0,math.rad(-15),math.rad(90)) * CFrame.new(0,.8,3)
	weld12.C0 = CFrame.fromEulerAnglesXYZ(math.rad(30),math.rad(15),math.rad(90)) * CFrame.new(-.5,-.8,3.4)
	weld22.C0 = CFrame.fromEulerAnglesXYZ(math.rad(30),math.rad(-15),math.rad(90)) * CFrame.new(-.5,.8,3.4)
	block(sword1.CFrame,Vector3.new(1,1,5),Vector3.new(0,0,0),.1,BrickColor.new("Institutional white"),2)
	block(sword2.CFrame,Vector3.new(1,1,5),Vector3.new(0,0,0),.1,BrickColor.new("Institutional white"),2)
	block(sword11.CFrame,Vector3.new(1,1,5),Vector3.new(0,0,0),.1,BrickColor.new("Institutional white"),2)
	block(sword21.CFrame,Vector3.new(1,1,5),Vector3.new(0,0,0),.1,BrickColor.new("Institutional white"),2)
	block(sword12.CFrame,Vector3.new(1,1,5),Vector3.new(0,0,0),.1,BrickColor.new("Institutional white"),2)
	block(sword22.CFrame,Vector3.new(1,1,5),Vector3.new(0,0,0),.1,BrickColor.new("Institutional white"),2)
	sworda:Destroy()
	
end

swordult = function()
	attack = true
	local sworda = Instance.new("Part", char)
	sworda.CanCollide = false
	sworda.Transparency = 1
	local aw = Instance.new("Weld", sworda)
	aw.Part0 = sworda
	aw.Part1 = char.HumanoidRootPart
	local kekke = 0
	for i = 0, 1, 0.2 do
		wait()
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), .3)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.4 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(45)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.4 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(45)), 0.3)
	end
	sword1.Weld.Part0 = sworda
	sword2.Weld.Part0 = sworda
	sword11.Weld.Part0 = sworda
	sword21.Weld.Part0 = sworda
	sword12.Weld.Part0 = sworda
	sword22.Weld.Part0 = sworda
	sword1.Weld.C0 = CFrame.fromEulerAnglesXYZ(math.rad(0),math.rad(60),math.rad(0)) * CFrame.new(0,0,4)
	sword2.Weld.C0 = CFrame.fromEulerAnglesXYZ(math.rad(0),math.rad(120),math.rad(0)) * CFrame.new(0,0,4)
	sword11.Weld.C0 = CFrame.fromEulerAnglesXYZ(math.rad(0),math.rad(180),math.rad(0)) * CFrame.new(0,0,4)
	sword21.Weld.C0 = CFrame.fromEulerAnglesXYZ(math.rad(0),math.rad(240),math.rad(0)) * CFrame.new(0,0,4)
	sword12.Weld.C0 = CFrame.fromEulerAnglesXYZ(math.rad(0),math.rad(300),math.rad(0)) * CFrame.new(0,0,4)
	sword22.Weld.C0 = CFrame.fromEulerAnglesXYZ(math.rad(0),math.rad(360),math.rad(0)) * CFrame.new(0,0,4)
	block(sword1.CFrame,Vector3.new(1,1,5),Vector3.new(0,0,0),.1,BrickColor.new("Institutional white"),2)
	block(sword2.CFrame,Vector3.new(1,1,5),Vector3.new(0,0,0),.1,BrickColor.new("Institutional white"),2)
	block(sword11.CFrame,Vector3.new(1,1,5),Vector3.new(0,0,0),.1,BrickColor.new("Institutional white"),2)
	block(sword21.CFrame,Vector3.new(1,1,5),Vector3.new(0,0,0),.1,BrickColor.new("Institutional white"),2)
	block(sword12.CFrame,Vector3.new(1,1,5),Vector3.new(0,0,0),.1,BrickColor.new("Institutional white"),2)
	block(sword22.CFrame,Vector3.new(1,1,5),Vector3.new(0,0,0),.1,BrickColor.new("Institutional white"),2)
	while kekke > -135 do
		wait()
		kekke = kekke - 1
		aw.C0 = aw.C0 * CFrame.fromEulerAnglesXYZ(0,math.rad(-3.5),0)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(-45-kekke)), 0.6)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(45+kekke)), 0.6)
		--block(sword1.CFrame,Vector3.new(1,1,5),Vector3.new(0,0,0),.3,BrickColor.new("Institutional white"),2)
		--block(sword2.CFrame,Vector3.new(1,1,5),Vector3.new(0,0,0),.3,BrickColor.new("Institutional white"),2)
	end
	local spinneblock = Instance.new("Part", char)
	spinneblock.CanCollide = false
	spinneblock.Transparency = 1
	local spinneweld = Instance.new("Weld",spinneblock)
	spinneweld.Part0 = spinneblock
	spinneweld.Part1 = char.Torso
	local spinnemesh = Instance.new("SpecialMesh", spinneblock)
	spinnemesh.MeshType = "FileMesh"
	spinnemesh.MeshId = "http://www.roblox.com/asset/?id=1051557"
	spinnemesh.Scale = Vector3.new(4,6,4)
	spinneblock.BrickColor = char.Torso.BrickColor
	for i = 0,1,0.1 do
		wait()
		magn(1,sword1,4)
		magn(1,sword2,4)
		magn(1,sword11,4)
		magn(1,sword21,4)
		magn(1,sword12,4)
		magn(1,sword22,4)
		aw.C0 = aw.C0 * CFrame.fromEulerAnglesXYZ(0,math.rad(28),0)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(60)), 0.6)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(60)), 0.6)
		--block(sword1.CFrame,Vector3.new(1,1,5),Vector3.new(0,0,0),.3,BrickColor.new("Institutional white"),2)
		--block(sword2.CFrame,Vector3.new(1,1,5),Vector3.new(0,0,0),.3,BrickColor.new("Institutional white"),2)
	end
	kekke = 0
	char.Humanoid.AutoRotate = false
	char.Humanoid.WalkSpeed = 64
	for i = 0,1,0.005 do
		wait()
		spinneblock.Transparency = spinneblock.Transparency - 0.01
		kekke = kekke + 30
		magn(2,sword1,6)
		magn(2,sword2,6)
		magn(2,sword11,6)
		magn(2,sword21,6)
		magn(2,sword12,6)
		magn(2,sword22,6)
		aw.C0 = aw.C0 * CFrame.fromEulerAnglesXYZ(0,math.rad(15),0)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(90)), 0.3)
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-kekke)), .6)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-90)), 0.3)
		--block(sword1.CFrame,Vector3.new(1,1,5),Vector3.new(0,0,0),.3,BrickColor.new("Institutional white"),2)
		--block(sword2.CFrame,Vector3.new(1,1,5),Vector3.new(0,0,0),.3,BrickColor.new("Institutional white"),2)
	end
	attack = false
	char.Humanoid.AutoRotate = true
	weld1.Part0 = char.Torso
	weld2.Part0 = char.Torso
	weld11.Part0 = char.Torso
	weld21.Part0 = char.Torso
	weld12.Part0 = char.Torso
	weld22.Part0 = char.Torso
	weld1.C0 = CFrame.fromEulerAnglesXYZ(math.rad(-30),math.rad(15),math.rad(90)) * CFrame.new(.5,-.8,3.4)
	weld2.C0 = CFrame.fromEulerAnglesXYZ(math.rad(-30),math.rad(-15),math.rad(90)) * CFrame.new(.5,.8,3.4)
	weld11.C0 = CFrame.fromEulerAnglesXYZ(0,math.rad(15),math.rad(90)) * CFrame.new(0,-.8,3)
	weld21.C0 = CFrame.fromEulerAnglesXYZ(0,math.rad(-15),math.rad(90)) * CFrame.new(0,.8,3)
	weld12.C0 = CFrame.fromEulerAnglesXYZ(math.rad(30),math.rad(15),math.rad(90)) * CFrame.new(-.5,-.8,3.4)
	weld22.C0 = CFrame.fromEulerAnglesXYZ(math.rad(30),math.rad(-15),math.rad(90)) * CFrame.new(-.5,.8,3.4)
	sworda:Destroy()
	spinneblock:Destroy()
	ult = false
	weapon.Handle2.Weld.Part0 = RightArm
	sword1.Transparency = 1
	sword2.Transparency = 1
	sword11.Transparency = 1
	sword21.Transparency = 1
	sword12.Transparency = 1
	sword22.Transparency = 1
	char.Humanoid.Health = 1
	mana = mana - 400
end

swordspin = function()
	attack = true
	local thrown = false
	local side = false
	local sworda = Instance.new("Part", char)
	sworda.CanCollide = false
	sworda.Transparency = 1
	local aw = Instance.new("Weld", sworda)
	aw.Part0 = sworda
	aw.Part1 = char.HumanoidRootPart
	local kekke = 0
	for i = 0, 1, 0.2 do
		wait()
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), .3)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.4 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(45)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.4 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(45)), 0.3)
	end
	sword1.Weld.Part0 = sworda
	sword2.Weld.Part0 = sworda
	sword11.Weld.Part0 = sworda
	sword21.Weld.Part0 = sworda
	sword12.Weld.Part0 = sworda
	sword22.Weld.Part0 = sworda
	sword1.Weld.C0 = CFrame.fromEulerAnglesXYZ(math.rad(0),math.rad(60),math.rad(0)) * CFrame.new(0,0,4)
	sword2.Weld.C0 = CFrame.fromEulerAnglesXYZ(math.rad(0),math.rad(120),math.rad(0)) * CFrame.new(0,0,4)
	sword11.Weld.C0 = CFrame.fromEulerAnglesXYZ(math.rad(0),math.rad(180),math.rad(0)) * CFrame.new(0,0,4)
	sword21.Weld.C0 = CFrame.fromEulerAnglesXYZ(math.rad(0),math.rad(240),math.rad(0)) * CFrame.new(0,0,4)
	sword12.Weld.C0 = CFrame.fromEulerAnglesXYZ(math.rad(0),math.rad(300),math.rad(0)) * CFrame.new(0,0,4)
	sword22.Weld.C0 = CFrame.fromEulerAnglesXYZ(math.rad(0),math.rad(360),math.rad(0)) * CFrame.new(0,0,4)
	while kekke > -120 do
		wait()
		kekke = kekke - 3.5
		aw.C0 = aw.C0 * CFrame.fromEulerAnglesXYZ(0,math.rad(-3.5),0)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(45+kekke)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(45+kekke)), 0.3)
		--block(sword1.CFrame,Vector3.new(1,1,5),Vector3.new(0,0,0),.3,BrickColor.new("Institutional white"),2)
		--block(sword2.CFrame,Vector3.new(1,1,5),Vector3.new(0,0,0),.3,BrickColor.new("Institutional white"),2)
	end
	coroutine.resume(coroutine.create(function()
	swordthrow(play:GetMouse(),sword22,0,0,sword22, CFrame.fromEulerAnglesXYZ(math.rad(30),math.rad(-15),math.rad(90)) * CFrame.new(-.5,.8,3.4)		)
	side = true
	wait(.42)
	swordthrow(play:GetMouse(),sword1,0,0,sword1, CFrame.fromEulerAnglesXYZ(math.rad(-30),math.rad(15),math.rad(90)) * CFrame.new(.5,-.8,3.4)		)	
	side = false	
	wait(.42)
	swordthrow(play:GetMouse(),sword2,0,0,sword2, CFrame.fromEulerAnglesXYZ(math.rad(-30),math.rad(-15),math.rad(90)) * CFrame.new(.5,.8,3.4)		)
	side = true	
	wait(.42)
	swordthrow(play:GetMouse(),sword11,0,0,sword11, CFrame.fromEulerAnglesXYZ(0,math.rad(15),math.rad(90)) * CFrame.new(0,-.8,3)					)	
	side = false	
	wait(.42)
	swordthrow(play:GetMouse(),sword21,0,0,sword21, CFrame.fromEulerAnglesXYZ(0,math.rad(-15),math.rad(90)) * CFrame.new(0,.8,3)					)	
	side = true	
	wait(.42)
	swordthrow(play:GetMouse(),sword12,0,0,sword12, CFrame.fromEulerAnglesXYZ(math.rad(30),math.rad(15),math.rad(90)) * CFrame.new(-.5,-.8,3.4)		)
	side = false	
	wait(.42)
	thrown = true
	end))
	while thrown == false do
	wait()
		aw.C0 = aw.C0 * CFrame.fromEulerAnglesXYZ(0,math.rad(28),0)
		
		if side == true then
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(90)), .6)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-90)), .6)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.4 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(90)), .6)			
		else
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-90)), .6)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(90)), .6)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.4 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-90)), .6)	
		end
	end
	attack = false
	sworda:Destroy()
end

swordcombo = function()
	attack = true
	local thrown = false
	local side = false
	local sworda = Instance.new("Part", char)
	sworda.CanCollide = false
	sworda.Transparency = 1
	local aw = Instance.new("Weld", sworda)
	aw.Part0 = sworda
	aw.Part1 = char.HumanoidRootPart
	local kekke = 0
	for i = 0, 1, 0.2 do
		wait()
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), .3)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.4 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(-60)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.4 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(60)), 0.3)
	end
	sword1.Weld.Part0 = sworda
	sword2.Weld.Part0 = sworda
	sword11.Weld.Part0 = sworda
	sword21.Weld.Part0 = sworda
	sword12.Weld.Part0 = sworda
	sword22.Weld.Part0 = sworda
	sword1.Weld.C0 = CFrame.fromEulerAnglesXYZ(math.rad(0),math.rad(60),math.rad(90)) * CFrame.new(0,0,4)
	sword2.Weld.C0 = CFrame.fromEulerAnglesXYZ(math.rad(0),math.rad(120),math.rad(90)) * CFrame.new(0,0,4)
	sword11.Weld.C0 = CFrame.fromEulerAnglesXYZ(math.rad(0),math.rad(180),math.rad(90)) * CFrame.new(0,0,4)
	sword21.Weld.C0 = CFrame.fromEulerAnglesXYZ(math.rad(0),math.rad(240),math.rad(90)) * CFrame.new(0,0,4)
	sword12.Weld.C0 = CFrame.fromEulerAnglesXYZ(math.rad(0),math.rad(300),math.rad(90)) * CFrame.new(0,0,4)
	sword22.Weld.C0 = CFrame.fromEulerAnglesXYZ(math.rad(0),math.rad(360),math.rad(90)) * CFrame.new(0,0,4)
	while kekke > -180 do
		wait()
		kekke = kekke - 4
		aw.C0 = aw.C0 * CFrame.fromEulerAnglesXYZ(0,math.rad(-4),0)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(-kekke/2)), 0.3)
		sword1.Weld.C0 = clerp(sword1.Weld.C0, CFrame.fromEulerAnglesXYZ(math.rad(0),math.rad(60),math.rad(0)) * CFrame.new(0,0,4-kekke/15) * CFrame.fromEulerAnglesXYZ(math.rad(kekke),0,0), 1)
		sword2.Weld.C0 = clerp(sword2.Weld.C0, CFrame.fromEulerAnglesXYZ(math.rad(0),math.rad(120),math.rad(0)) * CFrame.new(0,0,4-kekke/15) * CFrame.fromEulerAnglesXYZ(math.rad(kekke),0,0), 1)
		sword11.Weld.C0 = clerp(sword11.Weld.C0, CFrame.fromEulerAnglesXYZ(math.rad(0),math.rad(180),math.rad(0)) * CFrame.new(0,0,4-kekke/15) * CFrame.fromEulerAnglesXYZ(math.rad(kekke),0,0), 1)
		sword21.Weld.C0 = clerp(sword21.Weld.C0, CFrame.fromEulerAnglesXYZ(math.rad(0),math.rad(240),math.rad(0)) * CFrame.new(0,0,4-kekke/15) * CFrame.fromEulerAnglesXYZ(math.rad(kekke),0,0), 1)
		sword12.Weld.C0 = clerp(sword12.Weld.C0, CFrame.fromEulerAnglesXYZ(math.rad(0),math.rad(300),math.rad(0)) * CFrame.new(0,0,4-kekke/15) * CFrame.fromEulerAnglesXYZ(math.rad(kekke),0,0), 1)
		sword22.Weld.C0 = clerp(sword22.Weld.C0, CFrame.fromEulerAnglesXYZ(math.rad(0),math.rad(360),math.rad(0)) * CFrame.new(0,0,4-kekke/15) * CFrame.fromEulerAnglesXYZ(math.rad(kekke),0,0), 1)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(kekke/2)), 0.3)
	end
	coroutine.resume(coroutine.create(function()
	
	end))
	aw.C0 = aw.C0 * CFrame.fromEulerAnglesXYZ(0,math.rad(-20),0)
	block(sword2.CFrame,Vector3.new(20,200,1),Vector3.new(0,.1,0),.005,BrickColor.new("Institutional white"),3)
	block(sword12.CFrame,Vector3.new(20,200,1),Vector3.new(0,.1,0),.005,BrickColor.new("Really black"),3)
	block(sword11.CFrame,Vector3.new(20,200,1),Vector3.new(0,.1,0),.005,BrickColor.new("Institutional white"),3)
	block(sword22.CFrame,Vector3.new(20,200,1),Vector3.new(0,.1,0),.005,BrickColor.new("Really black"),3)
	block(sword1.CFrame,Vector3.new(20,200,1),Vector3.new(0,.1,0),.005,BrickColor.new("Institutional white"),3)
	block(sword21.CFrame,Vector3.new(20,200,1),Vector3.new(0,.1,0),.005,BrickColor.new("Really black"),3)
	attack = false
	weld1.Part0 = char.Torso
	weld2.Part0 = char.Torso
	weld11.Part0 = char.Torso
	weld21.Part0 = char.Torso
	weld12.Part0 = char.Torso
	weld22.Part0 = char.Torso
	weld1.C0 = CFrame.fromEulerAnglesXYZ(math.rad(-30),math.rad(15),math.rad(90)) * CFrame.new(.5,-.8,3.4)
	weld2.C0 = CFrame.fromEulerAnglesXYZ(math.rad(-30),math.rad(-15),math.rad(90)) * CFrame.new(.5,.8,3.4)
	weld11.C0 = CFrame.fromEulerAnglesXYZ(0,math.rad(15),math.rad(90)) * CFrame.new(0,-.8,3)
	weld21.C0 = CFrame.fromEulerAnglesXYZ(0,math.rad(-15),math.rad(90)) * CFrame.new(0,.8,3)
	weld12.C0 = CFrame.fromEulerAnglesXYZ(math.rad(30),math.rad(15),math.rad(90)) * CFrame.new(-.5,-.8,3.4)
	weld22.C0 = CFrame.fromEulerAnglesXYZ(math.rad(30),math.rad(-15),math.rad(90)) * CFrame.new(-.5,.8,3.4)
	block(sword1.CFrame,Vector3.new(1,1,5),Vector3.new(0,0,0),.1,BrickColor.new("Institutional white"),2)
	block(sword2.CFrame,Vector3.new(1,1,5),Vector3.new(0,0,0),.1,BrickColor.new("Institutional white"),2)
	block(sword11.CFrame,Vector3.new(1,1,5),Vector3.new(0,0,0),.1,BrickColor.new("Institutional white"),2)
	block(sword21.CFrame,Vector3.new(1,1,5),Vector3.new(0,0,0),.1,BrickColor.new("Institutional white"),2)
	block(sword12.CFrame,Vector3.new(1,1,5),Vector3.new(0,0,0),.1,BrickColor.new("Institutional white"),2)
	block(sword22.CFrame,Vector3.new(1,1,5),Vector3.new(0,0,0),.1,BrickColor.new("Institutional white"),2)
	sworda:Destroy()
end

attack3 = function()
	attack = true
	for i = 0, 1, 0.1 do
		wait()
		magn(2,LeftArm,2)
		block(LeftArm.CFrame*CFrame.new(0,-1,0),Vector3.new(1,1,1),Vector3.new(.1,.1,.1),.1,char.Torso.BrickColor,1)
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-30)), .3)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(30)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(0)), .3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(130), math.rad(0), math.rad(0)), 1)
	end
	block(LeftArm.CFrame*CFrame.new(0,-1,0),Vector3.new(5,5,5),Vector3.new(1,1,1),.1,char.Torso.BrickColor,1)
	for i = 0, 1, 0.1 do
		wait()
		block(LeftArm.CFrame*CFrame.new(0,-1,0),Vector3.new(1.5,1.5,1.5),Vector3.new(.1,.1,.1),.2,char.Torso.BrickColor,1)
		magn(2,LeftArm,2)
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-30)), .3)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(30)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(0)), .3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(20), math.rad(0), math.rad(0)), .3)
	end
	attack = false
end

attack4 = function()
	attack = true
	for i = 0, 1, 0.1 do
		wait()
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-90)), .3)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(30)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(90)), .3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(-90)), 1)
	end
	block(LeftArm.CFrame*CFrame.new(0,-1,0),Vector3.new(5,5,5),Vector3.new(1,1,1),.1,char.Torso.BrickColor,1)
	shoottrail(weapon.ST,LeftArm,0,1)
	for i = 0, 1, 0.1 do
		wait()
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-90)), .3)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(30)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(90)), .3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(-90)), 1)
	end
	attack = false
end

magicattack3 = function()
	attack = true
	local kekke = 0
	local shotsfired = 0
	for i = 0, 1, 0.1 do
		wait()
		block(LeftArm.CFrame*CFrame.new(0,-1,0),Vector3.new(3,3,3),Vector3.new(.1,.1,.1),.2,BrickColor.new("Institutional white"),1)
		magn(0.3,LeftArm,6)
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-30)), .3)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(30)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(0)), .3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(130), math.rad(0), math.rad(0)), 1)
	end
	block(LeftArm.CFrame*CFrame.new(0,-1,0),Vector3.new(5,5,5),Vector3.new(1,1,1),.1,BrickColor.new("Institutional white"),1)
	magn(10,LeftArm,5)
	local a4 = Instance.new("Part", char)
	a4.Anchored = true
	a4.CanCollide = false
	a4.Transparency = 1
	a4.Size = Vector3.new(1,1,1)
	a4.CFrame = LeftArm.CFrame * CFrame.new(0,-1,0)
	coroutine.resume(coroutine.create(function()
	while shotsfired < 5 do
	kekke = kekke + 1
	block(a4.CFrame,Vector3.new(3*(1-shotsfired/5),3*(1-shotsfired/5),3*(1-shotsfired/5)),Vector3.new(.1,.1,.1),.2,BrickColor.new("Institutional white"),1)
	if kekke >= 15 then
		kekke = 0
		block(a4.CFrame,Vector3.new(10,10,10),Vector3.new(-1,-1,-1),.2,BrickColor.new("Really black"),1)
		magn(5,a4,5)
		shotsfired = shotsfired + 1
	end
	wait()
	end
	a4:Destroy()
	end))
	for i = 0, 1, 0.1 do
		wait()
		block(LeftArm.CFrame*CFrame.new(0,-1,0),Vector3.new(3,3,3),Vector3.new(.1,.1,.1),.2,BrickColor.new("Really black"),1)
		magn(1,LeftArm,6)
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-30)), .3)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(30)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(0)), .3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(20), math.rad(0), math.rad(0)), .3)
	end
	attack = false
end

magicattack4 = function()
	attack = true
	local kekke = 0
	local shotsfired = 0
	for i = 0, 1, 0.1 do
		wait()
		block(RightArm.CFrame*CFrame.new(0,-1,0),Vector3.new(3,3,3),Vector3.new(.1,.1,.1),.2,BrickColor.new("Really black"),1)
		magn(0.3,RightArm,6)
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-30)), .3)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(30)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(130), math.rad(0), math.rad(0)), .3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(0)), 1)
	end
	block(RightArm.CFrame*CFrame.new(0,-1,0),Vector3.new(5,5,5),Vector3.new(1,1,1),.1,BrickColor.new("Really black"),1)
	magn(10,RightArm,5)
	local a4 = Instance.new("Part", char)
	a4.Anchored = true
	a4.CanCollide = false
	a4.Transparency = 1
	a4.Size = Vector3.new(1,1,1)
	a4.CFrame = RightArm.CFrame * CFrame.new(0,-1,0)
	coroutine.resume(coroutine.create(function()
	while shotsfired < 5 do
	kekke = kekke + 1
	block(a4.CFrame,Vector3.new(3*(1-shotsfired/5),3*(1-shotsfired/5),3*(1-shotsfired/5)),Vector3.new(.1,.1,.1),.2,BrickColor.new("Really black"),1)
	if kekke >= 15 then
		kekke = 0
		shoottrail2(play:GetMouse(),a4,0,0)
		shotsfired = shotsfired + 1
	end
	wait()
	end
	a4:Destroy()
	end))
	for i = 0, 1, 0.1 do
		wait()
		block(RightArm.CFrame*CFrame.new(0,-1,0),Vector3.new(3,3,3),Vector3.new(.1,.1,.1),.2,BrickColor.new("Institutional white"),1)
		magn(1,RightArm,6)
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-30)), .3)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(30)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(20), math.rad(0), math.rad(0)), .3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(0)), .3)
	end
	attack = false
end


shieldbash = function()
	attack = true
	local kekke = 0
	for i = 0, 1, 0.1 do
		wait()
		kekke = kekke + 8
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(90)), 0.3)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-90)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(0)), 01)
		if equipped == true then
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(-90), math.rad(0)), 0.3)
		end
		if equipped == false then
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		end
	end
	char.Humanoid.Jump = true
	for i = 0, 1, 0.1 do
		wait()
		char.Torso.Velocity = char.HumanoidRootPart.CFrame.lookVector * 150
		block(char.HumanoidRootPart.CFrame*CFrame.new(0,0,3),Vector3.new(1,1,1),Vector3.new(.5,.5,.5),.04,char.Torso.BrickColor,1)
		magn(3,char.Torso,5)
		wave(char.Torso.CFrame * CFrame.fromEulerAnglesXYZ(math.rad(90),0,math.rad(90)),char.Torso.BrickColor,Vector3.new(2.5,2.5,2.5),Vector3.new(0.5,0,.5),0.04,2)
	end
	block(char.HumanoidRootPart.CFrame*CFrame.new(0,0,3),Vector3.new(15,15,15),Vector3.new(1,1,1),.1,char.Torso.BrickColor,1)
	magn(10,char.Torso,15)
	for i = 0, 1, 0.1 do
		wait()
		magn(1.5,weapon.Handle2,4)
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(20)), 0.3)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-20)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(90)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-10)), 0.3)
	end
	attack = false
end

teleportback = function()
	attack = true
	parry = false
	char.Humanoid.WalkSpeed = 4
	local kekke = 0
	while parry == false do
		wait()
		kekke = kekke + 8
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(90)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(-90)), 0.3)
	end
	block(char.HumanoidRootPart.CFrame*CFrame.new(0,0,3),Vector3.new(15,15,15),Vector3.new(1,1,1),.1,char.Torso.BrickColor,1)
	magn(20,char.Torso,15)
	char.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame * CFrame.new(0,0,15)
	char.Humanoid.WalkSpeed = 16
	attack = false
end

supershieldbash = function()
	attack = true
	local kekke = 0
	for i = 0, 1, 0.1 do
		wait()
		kekke = kekke + 8
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(90)), 0.3)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-90)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(0)), 01)
		if equipped == true then
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(-90), math.rad(0)), 0.3)
		end
		if equipped == false then
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		end
	end
	char.Humanoid.Jump = true
	for i = 0, 1, 0.05 do
		wait()
		char.Torso.Velocity = char.HumanoidRootPart.CFrame.lookVector * 150
		block(char.HumanoidRootPart.CFrame*CFrame.new(0,0,3),Vector3.new(2,2,2),Vector3.new(1,1,1),.04,BrickColor.new("Institutional white"),1)
		magn(3,char.Torso,10)
		wave(char.Torso.CFrame * CFrame.fromEulerAnglesXYZ(math.rad(90),0,math.rad(90)),BrickColor.new("Really black"),Vector3.new(5,5,5),Vector3.new(0.5,0,.5),0.02,1)
	end
	block(char.HumanoidRootPart.CFrame*CFrame.new(0,0,3),Vector3.new(30,30,30),Vector3.new(1,1,1),.1,BrickColor.new("Really black"),1)
	magn(10,char.Torso,30)
	for i = 0, 1, 0.1 do
		wait()
		magn(1.5,weapon.Handle2,4)
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(20)), 0.3)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-20)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(90)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-10)), 0.3)
	end
	attack = false
end

superteleportback = function()
	attack = true
	parry = false
	char.Humanoid.WalkSpeed = 4
	local kekke = 0
	while parry == false do
		wait()
		kekke = kekke + 8
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(90)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(-90)), 0.3)
	end
	char.Humanoid.AutoRotate = false
	for i = 0,2 do
	block(char.HumanoidRootPart.CFrame*CFrame.new(0,0,3),Vector3.new(2,2,2),Vector3.new(1,1,1),.04,BrickColor.new("Really black"),1)
		magn(3,char.Torso,10)
		wave(char.Torso.CFrame * CFrame.fromEulerAnglesXYZ(math.rad(90),0,math.rad(90)),BrickColor.new("Institutional white"),Vector3.new(5,5,5),Vector3.new(0.5,0,.5),0.02,1)
	char.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame * CFrame.new(0,0,15)
	end
	wait(.3)
	for i = 0,5 do
	block(char.HumanoidRootPart.CFrame*CFrame.new(0,0,3),Vector3.new(2,2,2),Vector3.new(1,1,1),.04,BrickColor.new("Institutional white"),1)
		magn(3,char.Torso,10)
		wave(char.Torso.CFrame * CFrame.fromEulerAnglesXYZ(math.rad(90),0,math.rad(90)),BrickColor.new("Really black"),Vector3.new(5,5,5),Vector3.new(0.5,0,.5),0.02,1)
	char.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame * CFrame.new(0,0,-15)
	end
	wait(.3)
	for i = 0,8 do
	block(char.HumanoidRootPart.CFrame*CFrame.new(0,0,3),Vector3.new(2,2,2),Vector3.new(1,1,1),.04,BrickColor.new("Really black"),1)
		magn(3,char.Torso,10)
		wave(char.Torso.CFrame * CFrame.fromEulerAnglesXYZ(math.rad(90),0,math.rad(90)),BrickColor.new("Institutional white"),Vector3.new(5,5,5),Vector3.new(0.5,0,.5),0.02,1)
	char.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame * CFrame.new(0,0,15)
	end
	wait(.3)
	for i = 0,8 do
	block(char.HumanoidRootPart.CFrame*CFrame.new(0,0,3),Vector3.new(2,2,2),Vector3.new(1,1,1),.04,BrickColor.new("Institutional white"),1)
		magn(3,char.Torso,10)
		wave(char.Torso.CFrame * CFrame.fromEulerAnglesXYZ(math.rad(90),0,math.rad(90)),BrickColor.new("Really black"),Vector3.new(5,5,5),Vector3.new(0.5,0,.5),0.02,1)
	char.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame * CFrame.new(0,0,-15)
	end
	char.Humanoid.WalkSpeed = 16
	attack = false
	char.Humanoid.AutoRotate = true
end

local equip = function()
	attack = true
	for i = 0, 1, 0.1 do
		wait()
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.2 - 0.1 * math.cos((sine) / 15), -1) * CFrame.Angles(math.rad(90), math.rad(90), math.rad(0)), 0.5)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(-90), math.rad(0)), 0.3)
	end
	if equipped == true then
	char.Humanoid.WalkSpeed = 32
	equipped = false
	weapon.Handle.Weld.Part0 = weapon.Handle2
	weapon.Handle.Weld.C0 = clerp(weapon.Handle.Weld.C0, CFrame.new(0, -.1, 2.5) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 1)
	elseif equipped == false then
	equipped = true
	char.Humanoid.WalkSpeed = 16
	weapon.Handle.Weld.Part0 = LeftArm
	weapon.Handle.Weld.C0 = clerp(weapon.Handle.Weld.C0, CFrame.new(0, -1, -.1) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-90)), 1)
	end
	attack = false
end



comboattack = function()
	attack = true
	local kekke = 0
	while kekke < 1440 do
		wait()
		kekke = kekke + 40
		magn(4,weapon.Handle,4)
		block(LeftArm.CFrame*CFrame.new(0,-2,0),Vector3.new(1,1,4),Vector3.new(0,0,1),.1,char.Torso.BrickColor,1)
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-kekke)), 1)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-70)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(0)), 1)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-90)), 0.3)
		weapon.Handle.Weld.C0 = clerp(weapon.Handle.Weld.C0, CFrame.new(0, -1, -.1) * CFrame.Angles(math.rad(-90), math.rad(0), math.rad(-90)), 1)
	end
	attack = false
end

orbs = function()
	local kekke = 0
	local shot1 = 1
	local a = Instance.new("Part", char)
	a.CanCollide = false
	a.Transparency = 1
	a.Size = Vector3.new(1,1,1)
	local aw = Instance.new("Weld", a)
	aw.Part0 = a
	aw.Part1 = char.HumanoidRootPart
	if ult == true and equipcheck == false then
	aw.C0 = CFrame.fromEulerAnglesXYZ(0,0,math.rad(-18))
	end
	local a2 = Instance.new("Part", char)
	a2.Anchored = true
	a2.CanCollide = false
	a2.Transparency = 1
	a2.Size = Vector3.new(1,1,1)
	local a3 = Instance.new("Part", char)
	a3.Anchored = true
	a3.CanCollide = false
	a3.Transparency = 1
	a3.Size = Vector3.new(1,1,1)
	local a4 = Instance.new("Part", char)
	a4.Anchored = true
	a4.CanCollide = false
	a4.Transparency = 1
	a4.Size = Vector3.new(1,1,1)
	while mana >= 1 and orb == true do
		wait()
		kekke = kekke + 1
		if ult == false then
			magn(.3,a2,4)
			block(a2.CFrame,Vector3.new(1,1,1),Vector3.new(-.2,-.2,-.2),.1,char.Torso.BrickColor,1)
			magn(.3,a3,4)
			block(a3.CFrame,Vector3.new(1,1,1),Vector3.new(-.2,-.2,-.2),.1,char.Torso.BrickColor,1)
			magn(.3,a4,4)
			block(a4.CFrame,Vector3.new(1,1,1),Vector3.new(-.2,-.2,-.2),.1,char.Torso.BrickColor,1)
			mana = mana - 0.3
			aw.C0 = aw.C0 * CFrame.fromEulerAnglesXYZ(0,math.rad(6),0)
			a2.CFrame = a.CFrame * CFrame.new(2,0,-4)
			a3.CFrame = a.CFrame * CFrame.new(2,0,4)
			a4.CFrame = a.CFrame * CFrame.new(-4,0,0)
		else
			if kekke >= 20 and equipcheck == false then
					kekke = 0
					if shot1 == 1 then
					shot1 = 2
					shoottrail2(play:GetMouse(),a4,0,1)
					elseif shot1 == 2 then
					shot1 = 3
					shoottrail2(play:GetMouse(),a2,0,1)
					elseif shot1 == 3 then
					shot1 = 1
					shoottrail2(play:GetMouse(),a3,0,1)
					end
			end
			magn(.4,a2,6)
			block(a2.CFrame,Vector3.new(1.5,1.5,1.5),Vector3.new(-.2,-.2,-.2),.1,BrickColor.new("Really black"),1)
			magn(.4,a3,6)
			block(a3.CFrame,Vector3.new(1.5,1.5,1.5),Vector3.new(-.2,-.2,-.2),.1,BrickColor.new("Really black"),1)
			magn(.4,a4,6)
			block(a4.CFrame,Vector3.new(1.5,1.5,1.5),Vector3.new(-.2,-.2,-.2),.1,BrickColor.new("Really black"),1)
			mana = mana - .6
			if equipcheck == false then
			aw.C0 = aw.C0 * CFrame.fromEulerAnglesXYZ(0,0,math.rad(6))
			a2.CFrame = a.CFrame * CFrame.new(2,-4,0)
			a3.CFrame = a.CFrame * CFrame.new(2,4,0)
			a4.CFrame = a.CFrame * CFrame.new(-4,0,0)
			else
			aw.C0 = aw.C0 * CFrame.fromEulerAnglesXYZ(0,math.rad(6),0)
			a2.CFrame = a.CFrame * CFrame.new(2,0,-4)
			a3.CFrame = a.CFrame * CFrame.new(2,0,4)
			a4.CFrame = a.CFrame * CFrame.new(-4,0,0)	
			end
		end
	end
	a:Destroy()
	a2:Destroy()
	a3:Destroy()
	a4:Destroy()
end

local magictransform = function()
	attack = true
	char.Humanoid.WalkSpeed = 0
	char.Humanoid.JumpPower = 0
	local kekke = 0
	local kekke1 = 0
	local kekke2 = 0
	local kekke3 = 0
	local coold = 1
	for i = 0,1,0.01 do
		wait()
		magn(0.5,char.Torso,10)
		kekke = kekke + 0.1
		block(char.Torso.CFrame*CFrame.new(0,0,0),Vector3.new(8,8,8),Vector3.new(-1,-1,-1),.2,BrickColor.new("Really black"),1)
		block(char.Torso.CFrame*CFrame.new(0,0,0),Vector3.new(8,1,1),Vector3.new(1,0,0),.05,BrickColor.new("Institutional white"),1)
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, kekke - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), .3)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(90)), 1)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-90)), 0.3)
	end
	coroutine.resume(coroutine.create(function()
	while attack == true do
	kekke1 = math.random(0,180)
	kekke2 = math.random(0,180)
	kekke3 = math.random(0,180)
	wave(char.Torso.CFrame * CFrame.fromEulerAnglesXYZ(math.rad(kekke1),math.rad(kekke2),math.rad(kekke3)),BrickColor.new("Institutional white"),Vector3.new(10,10,10),Vector3.new(1,-1,1),0.1,2)
	wave(char.Torso.CFrame * CFrame.fromEulerAnglesXYZ(math.rad(kekke1),math.rad(kekke2),math.rad(180+kekke3)),BrickColor.new("Really black"),Vector3.new(10,10,10),Vector3.new(1,-1,1),0.1,2)
	magn(0.5,char.Torso,20)
	wait(coold)
	end
	end))
	for i = 0,1,0.01 do
		wait()
		coold = coold - 0.01
		print(coold)
		block(char.Torso.CFrame*CFrame.new(0,0,0),Vector3.new(8,8,8),Vector3.new(1,-1,-1),.2,BrickColor.new("Really black"),1)
		block(char.Torso.CFrame*CFrame.new(0,0,0),Vector3.new(8,8,8),Vector3.new(1,-1,-1),.2,BrickColor.new("Institutional white"),1)
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, kekke - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), .3)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(0), math.rad(45), math.rad(40)), 1)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(0), math.rad(-45), math.rad(-40)), 0.3)
	end
	block(char.Torso.CFrame*CFrame.new(0,0,0),Vector3.new(8,8,8),Vector3.new(1,-1,-1),.02,BrickColor.new("Really black"),1)
	block(char.Torso.CFrame*CFrame.new(0,0,0),Vector3.new(8,8,8),Vector3.new(1,-1,-1),.02,BrickColor.new("Institutional white"),1)
	wave(char.Torso.CFrame * CFrame.fromEulerAnglesXYZ(0,0,0),BrickColor.new("Institutional white"),Vector3.new(10,10,10),Vector3.new(1,-1,1),0.01,2)
	wave(char.Torso.CFrame * CFrame.fromEulerAnglesXYZ(0,0,math.rad(180)),BrickColor.new("Really black"),Vector3.new(10,10,10),Vector3.new(1,-1,1),0.01,2)
	attack = false
	char.Humanoid.WalkSpeed = 16
	char.Humanoid.JumpPower = 50
end

local magicult = function()
	attack = true
	char.Humanoid.WalkSpeed = 0
	char.Humanoid.JumpPower = 0
	local kekke = 0
	local coold = 1
	coroutine.resume(coroutine.create(function()
	while kekke == 0 do
	block(RightArm.CFrame*CFrame.new(0,-1,0)*CFrame.fromEulerAnglesXYZ(.33,.33,.33),Vector3.new(2,2,2),Vector3.new(.5,.5,.5),.025,BrickColor.new("Really black"),1)
	block(LeftArm.CFrame*CFrame.new(0,-1,0)*CFrame.fromEulerAnglesXYZ(.33,.33,.33),Vector3.new(2,2,2),Vector3.new(0.5,0.5,0.5),.025,BrickColor.new("Institutional white"),1)
	wave(char.Torso.CFrame * CFrame.fromEulerAnglesXYZ(math.rad(0),math.rad(0),math.rad(0)),BrickColor.new("Institutional white"),Vector3.new(10,10,10),Vector3.new(-.2,-.2,-.2),0.1,2)
	wave(char.Torso.CFrame * CFrame.fromEulerAnglesXYZ(math.rad(0),math.rad(0),math.rad(180)),BrickColor.new("Really black"),Vector3.new(10,10,10),Vector3.new(-.2,-.2,-.2),0.1,2)
	magn(0.5,char.Torso,20)
	wait(coold)
	end
	kekke = 0
	end))
	RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(90)), 1)
	LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-90)), 1)
	for i = 0,1,0.012 do
		wait()
		coold = coold
		print(coold)
		magn(0.5,char.Torso,10)
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), .3)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(-60)), 0.05)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(60)), 0.05)
	end
	kekke = 1
	for i = 0,1,0.01 do
		wait()
		kekke = kekke + 0.1
		block(RightArm.CFrame*CFrame.new(0,0,0),Vector3.new(kekke,kekke,kekke),Vector3.new(0,0,0),.2,BrickColor.new("Really black"),1)
		block(LeftArm.CFrame*CFrame.new(0,0,0),Vector3.new(kekke,kekke,kekke),Vector3.new(0,0,0),.2,BrickColor.new("Institutional white"),1)
	end
	wave(char.Torso.CFrame * CFrame.fromEulerAnglesXYZ(0,0,0),BrickColor.new("Institutional white"),Vector3.new(110,50000,110),Vector3.new(30,-1,30),0.05,2)
	wave(char.Torso.CFrame * CFrame.fromEulerAnglesXYZ(0,0,math.rad(180)),BrickColor.new("Really black"),Vector3.new(110,50000,110),Vector3.new(30,-1,30),0.05,2)
	wait(2)
	kekke = 100
	magn(90,char.Torso,100)
	for i = 0,1,0.05 do
		wait()
		kekke = kekke + 0.1
		block(RightArm.CFrame*CFrame.new(0,0,0),Vector3.new(kekke,kekke,kekke),Vector3.new(0,0,0),.2,BrickColor.new("Really black"),1)
		block(LeftArm.CFrame*CFrame.new(0,0,0),Vector3.new(kekke,kekke,kekke),Vector3.new(0,0,0),.2,BrickColor.new("Institutional white"),1)
		wave(char.Torso.CFrame * CFrame.fromEulerAnglesXYZ(0,0,0),BrickColor.new("Institutional white"),Vector3.new(110,-90,110),Vector3.new(0,0,0),0.01,1)
		wave(char.Torso.CFrame * CFrame.fromEulerAnglesXYZ(0,0,math.rad(180)),BrickColor.new("Really black"),Vector3.new(110,-90,110),Vector3.new(0,0,0),0.01,1)
	end
	
	attack = false
	char.Humanoid.Health = 1
	ult = false
	weapon.Handle2.Weld.Part0 = RightArm
	mana = mana - 400
	char.Humanoid.WalkSpeed = 24
	char.Humanoid.JumpPower = 50
end

local swordtransform = function()
	attack = true
	char.Humanoid.WalkSpeed = 0
	char.Humanoid.JumpPower = 0
	
	local kekke = 0
	local kekke1 = 0
	local kekke2 = 0
	local kekke3 = 0
	local coold = 1
	for i = 0,1,0.01 do
		wait()
		magn(0.5,char.Torso,10)
		block(char.Torso.CFrame*CFrame.new(0,0,0),Vector3.new(8,8,8),Vector3.new(-1,-1,-1),.2,BrickColor.new("Really black"),1)
		block(char.Torso.CFrame*CFrame.new(0,0,0),Vector3.new(8,1,1),Vector3.new(1,0,0),.05,BrickColor.new("Institutional white"),1)
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), .3)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(90)), 1)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-90)), 0.3)
	end
	--[[coroutine.resume(coroutine.create(function()
	while attack == true do
	kekke1 = math.random(0,180)
	kekke2 = math.random(0,180)
	kekke3 = math.random(0,180)
	wave(char.Torso.CFrame * CFrame.fromEulerAnglesXYZ(math.rad(kekke1),math.rad(kekke2),math.rad(kekke3)),BrickColor.new("Institutional white"),Vector3.new(5,10,5),Vector3.new(-.5,1,-.5),0.1,1)
	wave(char.Torso.CFrame * CFrame.fromEulerAnglesXYZ(math.rad(kekke1),math.rad(kekke2),math.rad(180+kekke3)),BrickColor.new("Really black"),Vector3.new(5,10,5),Vector3.new(-.5,1,-.5),0.1,1)
	magn(0.5,char.Torso,20)
	wait(coold)
	end
	end))]]
	
	block(char.Torso.CFrame*CFrame.new(0,0,0),Vector3.new(8,8,8),Vector3.new(1,-1,-1),.02,BrickColor.new("Really black"),1)
	block(char.Torso.CFrame*CFrame.new(0,0,0),Vector3.new(8,8,8),Vector3.new(1,-1,-1),.02,BrickColor.new("Institutional white"),1)
	wave(char.Torso.CFrame * CFrame.fromEulerAnglesXYZ(0,0,0),BrickColor.new("Institutional white"),Vector3.new(210,-190,210),Vector3.new(-2,1,-2),0.01,2)
	wave(char.Torso.CFrame * CFrame.fromEulerAnglesXYZ(0,0,math.rad(180)),BrickColor.new("Really black"),Vector3.new(210,-190,210),Vector3.new(-2,1,-2),0.01,2)
	for i = 0,1,0.01 do
		wait()
		coold = coold - 0.01
		print(coold)
		block(char.Torso.CFrame*CFrame.new(0,0,0),Vector3.new(8,8,8),Vector3.new(1,-1,-1),.2,BrickColor.new("Really black"),1)
		block(char.Torso.CFrame*CFrame.new(0,0,0),Vector3.new(8,8,8),Vector3.new(1,-1,-1),.2,BrickColor.new("Institutional white"),1)
		kekke = kekke + 0.5
		block(char.Torso.CFrame*CFrame.new(math.random(-kekke,kekke),0,math.random(-kekke,kekke)),Vector3.new(1,1,1),Vector3.new(0,kekke/2,0),.2,BrickColor.new("Institutional white"),2)
		block(char.Torso.CFrame*CFrame.new(math.random(-kekke,kekke),0,math.random(-kekke,kekke)),Vector3.new(1,1,1),Vector3.new(0,kekke/2,0),.2,BrickColor.new("Really black"),2)
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), .3)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(0), math.rad(45), math.rad(40)), 1)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(0), math.rad(-45), math.rad(-40)), 0.3)
	end
	attack = false
	sword1.Transparency = 0.4
	sword2.Transparency = 0.4
	sword11.Transparency = 0.4
	sword21.Transparency = 0.4
	sword12.Transparency = 0.4
	sword22.Transparency = 0.4
	char.Humanoid.WalkSpeed = 24
	char.Humanoid.JumpPower = 50
end

local ultimate = function()
	ult = true
	weapon.Handle.Weld.Part0 = weapon.Handle2
	weapon.Handle.Weld.C0 = clerp(weapon.Handle.Weld.C0, CFrame.new(0, -.1, 2.5) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 1)
	weapon.Handle2.Weld.Part0 = char.Torso
	weapon.Handle2.Weld.C0 = clerp(weapon.Handle2.Weld.C0, CFrame.new(0, 0, .8) * CFrame.Angles(math.rad(90), math.rad(180), math.rad(0)), 1)
		if equipped == false then
			equipcheck = false
			magictransform()
		elseif equipped == true then
			equipcheck = true
			equipped = false
			char.Humanoid.MaxHealth = 200
			swordtransform()	
			char.Humanoid.Health = 200
			sword1.Transparency = 0.4
			sword2.Transparency = 0.4
			sword11.Transparency = 0.4
			sword21.Transparency = 0.4
			sword12.Transparency = 0.4
			sword22.Transparency = 0.4
		end
		
		while ult == true do
			if Anim == "Walk" then
			weapon.Handle2.Weld.C0 = clerp(weapon.Handle2.Weld.C0, CFrame.new(0, 0, .8) * CFrame.Angles(math.rad(100), math.rad(180), math.rad(0)), .3)
			else
			weapon.Handle2.Weld.C0 = clerp(weapon.Handle2.Weld.C0, CFrame.new(0, 0, .8) * CFrame.Angles(math.rad(90), math.rad(180), math.rad(0)), .3)
			end
		wait()
	end
end

play:GetMouse().Button1Down:connect(function()
	if attack == false and throwing == false then
		if combo == 1 and attack == false and throwing == false and equipped == true then
			attack1()
			combo = 2
		elseif combo == 2 and attack == false and throwing == false and equipped == true then
			attack2()
			combo = 1
		elseif combo == 1 and attack == false and throwing == false and equipped == false and mana >= 15 then
			mana = mana - 15
			if ult == false then
			attack3()
			else
			if equipcheck == false then
			magicattack3()
			else
			mana = mana + 15
			swordattack3()
			
			end
			end
			combo = 2
		elseif combo == 2 and attack == false and throwing == false and equipped == false and mana >= 20 and throwing == false then
			mana = mana - 20
			if ult == false then
			attack4()
			combo = 1
			else
			if equipcheck == false then
			magicattack4()
			combo = 1
			else
			mana = mana + 20
			swordattack4()
			
			combo = 3
			end
			end
		elseif combo == 3 and attack == false and throwing == false and equipped == false and equipcheck == true and mana >= 10 then
			mana = mana + 0
			swordattack5()
			combo = 4
		elseif combo == 4 and attack == false and throwing == false and equipped == false and equipcheck == true and mana >= 10 then
			mana = mana + 0
			swordattack6()
			combo = 1
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
	if k == "z" and attack == false and throwing == false and mana >= 25 then
		if ult == false then
		mana = mana - 25
		shieldbash()
		end
		if ult == true then
			if equipcheck == false then
			mana = mana - 25
			supershieldbash()
			else
			swordspin()
			mana = mana - 25
			end
		end
	elseif k == "e" and attack == false and throwing == false then
		ult = false
		sword1.Transparency = 1
		sword2.Transparency = 1
		sword11.Transparency = 1
		sword21.Transparency = 1
		sword12.Transparency = 1
		sword22.Transparency = 1
		char.Humanoid.MaxHealth = 100
		if combo >= 3 then
		combo = 1
		end
		weapon.Handle2.Weld.C0 = clerp(weapon.Handle2.Weld.C0, CFrame.new(.5, 0.05, 0) * CFrame.Angles(math.rad(180), math.rad(0), math.rad(-90)), 1)
		weapon.Handle2.Weld.Part0 = RightArm
		equip()
	elseif k == "x" and attack == false and throwing == false and mana >= 35 then
		if ult == false then
		mana = mana - 35
		if equipped == true then
			comboattack()
		elseif equipped == false then
			teleportback()
		end
		else
		if equipcheck == false then
		superteleportback()
		else
		swordcombo()
		end
		end
	elseif k == "x" and attack == true and parry == false and mana >= 15 then
		mana = mana - 15
		char.Humanoid.Health = char.Humanoid.Health - 10
	elseif k == "c" and attack == false and throwing == false and mana >= 20 and orb == false then
		orb = true
		orbs()
	elseif k == "c" and orb == true then
		orb = false
	elseif k == "h" and attack == false and throwing == false and mana >= 200 then
		if ult == false then
		ultimate()
		else
		if mana >= 400 then
		if equipcheck == false then
		magicult()
		else
		swordult()
		equip()
		end
		end
		end
	end
end)

local keke = 0
coroutine.resume(coroutine.create(function()
while true do
pasthp = char.Humanoid.Health
wait(.5)
if char.Humanoid.Health < pasthp then
parry = true
if equipped == true then
char.Humanoid.Health = char.Humanoid.Health + (pasthp-char.Humanoid.Health)/2
mana = mana + (pasthp-char.Humanoid.Health)*2
CreateSound("rbxassetid://10209583",weapon.Handle2,.1,1)
print("Blocked!")
end
if ult == true and equipcheck == false and mana >= (pasthp-char.Humanoid.Health)*2 then
	mana = mana - (pasthp-char.Humanoid.Health)*2
	block(char.Torso.CFrame,Vector3.new((1*(pasthp-char.Humanoid.Health)/5),(1*(pasthp-char.Humanoid.Health)/5),(1*(pasthp-char.Humanoid.Health)/5)),Vector3.new(0.5,.5,.5),0.1,char.Torso.BrickColor,1)
	char.Humanoid.Health = pasthp
end
end
end
end))

coroutine.resume(coroutine.create(function()
while true do
mana = mana + 1
if ult == true and equipcheck == false then
	mana = mana + 4
end
if mana >= 400 then
	mana = 400
end
wait(.5)
end
end))

coroutine.resume(coroutine.create(function()
while true do
keke = keke + 1
if keke > 10 then
	keke = 0
end
	if asdrot <= 360 then
		asdrot = asdrot + 2
		else
		asdrot = 0
	end
	manabar:TweenSize(UDim2.new(1 * (mana /400), 0, 1, 0), "Out", "Quad", 0.5)
	if sit == true then
	mana = mana + .33
	end
	if ult == true and equipcheck == false then
		block(LeftArm.CFrame*CFrame.new(0,-1,0)*CFrame.fromEulerAnglesXYZ(0,0.333,0),Vector3.new(1,1,1),Vector3.new(0.1,0.1,0.1),0.2,BrickColor.new("Institutional white"),1)
		block(RightArm.CFrame*CFrame.new(0,-1,0)*CFrame.fromEulerAnglesXYZ(0,0.333,0),Vector3.new(1,1,1),Vector3.new(0.1,0.1,0.1),0.2,BrickColor.new("Really black"),1)
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
					if char.HumanoidRootPart.Velocity.Y > 1 then
						Anim = "Jump"
						if attack == false and sit == false then
							char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
							char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
							RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(90)), 0.3)
							LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-90)), 0.3)
							RH.C0 = clerp(RH.C0, CFrame.new(1, -.5 + 0.1 * math.cos((sine) / 20), -0.4) * RHCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-40)), 0.3)
							LH.C0 = clerp(LH.C0, CFrame.new(-1, -.5 + 0.1 * math.cos((sine) / 20), -0.4) * LHCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(40)), 0.3)
						end
					elseif torsovel < 1 then
						Anim = "Idle"
							change = 1
							if attack == false and sit == false then
							if equipped == true then
							char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(70)), 0.3)
							char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-70)), 0.3)
							RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(-20)), 0.3)
							LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-10)), 0.3)
							weapon.Handle.Weld.C0 = clerp(weapon.Handle.Weld.C0, CFrame.new(0, -1, -.1) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-90)), 1)
							end
							if equipped == false then
							char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
							char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
							if ult == false then
							RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(50), math.rad(0), math.rad(0)), 0.3)
							else
							RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
							end
							LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
							end
							if ult == false then
							weapon.Handle2.Weld.C0 = clerp(weapon.Handle2.Weld.C0, CFrame.new(.5, .05, 0) * CFrame.Angles(math.rad(180), math.rad(0), math.rad(-90)), 0.3)
							end
							end
							RH.C0 = clerp(RH.C0, CFrame.new(1, -1 + 0.1 * math.cos((sine) / 20), 0) * RHCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
							LH.C0 = clerp(LH.C0, CFrame.new(-1, -1 + 0.1 * math.cos((sine) / 20), 0.1) * LHCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)	
					elseif 2 < torsovel then
							Anim = "Walk"
								if attack == false and sit == false then
								if equipped == true then
								char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(70)), 0.3)
								char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-70)), 0.3)
								RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(-20)), 0.3)
								LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-10)), 0.3)
								weapon.Handle.Weld.C0 = clerp(weapon.Handle.Weld.C0, CFrame.new(0, -1, -.1) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-90)), 1)
								end
								if equipped == false then
								char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * CFrame.Angles(math.rad(30), math.rad(0), math.rad(0)), 0.3)
								char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(-20), math.rad(0), math.rad(0)), 0.3)
								RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(-60), math.rad(0), math.rad(0)), 0.3)
								LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * CFrame.Angles(math.rad(-60), math.rad(0), math.rad(0)), 0.3)
								end
								if ult == false then
								weapon.Handle2.Weld.C0 = clerp(weapon.Handle2.Weld.C0, CFrame.new(.5, 0.05, 0) * CFrame.Angles(math.rad(180), math.rad(0), math.rad(-90)), 0.3)
								end
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