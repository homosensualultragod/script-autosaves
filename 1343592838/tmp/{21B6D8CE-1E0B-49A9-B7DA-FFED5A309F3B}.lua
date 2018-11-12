local play = game.Players.LocalPlayer
local char = play.Character
local debounce = false
local attack = false
local collid = true
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

local r = 255
local g = 0
local b = 0

coroutine.resume(coroutine.create(function()

while true do
while b < 255 do
b = b + 5
wait()
end
while r > 0 do
r = r - 5
wait()
end
while g < 255 do
g = g + 5
wait()
end
while b > 5 do
b = b - 5
wait()
end
while b > 5 do
b = b - 5
wait()
end
while r < 255 do
r = r + 5
wait()
end
while g > 0 do
g = g - 5
wait()
end
end
end))


local tewl = Instance.new("Tool", char)
tewl.Name = "Splitter"

local split = Instance.new("Part", tewl)
split.Name = "Handle"
split.Size = Vector3.new(1.1,1.1,4.1)
--split.Size = Vector3.new(15,15,15)
split.Material = "Glass"
split.Transparency = 0.5
split.CFrame = CFrame.new(100,100,100)
split.CFrame = split.CFrame * CFrame.new(0,100,0)

play:GetMouse().Button1Down:connect(function()
	local str = Instance.new("StringValue")
	str.Name = "toolanim"
	str.Value = "Slash"
	str.Parent = tewl
end)

local grav = function(par)
	par.Velocity = Vector3.new(par.Velocity.X/1.1,40, par.Velocity.Z/1.1)
end

coroutine.resume(coroutine.create(function()
while true do
split.Color = Color3.fromRGB(r,g,b)
wait()
end
end))

split.Touched:connect(function(hit)
if hit.Name ~= "Base" and hit.Parent ~= char and debounce == false and hit.Name ~= "splitpart" then
	debounce = true
	
	local sp1 = Instance.new("Part", workspace)
	sp1.Color  = Color3.fromRGB(r,g,b)
	sp1.Material = hit.Material
	sp1.Size = Vector3.new(hit.Size.X/2,hit.Size.Y/2,hit.Size.Z/2)
	sp1.CFrame = hit.CFrame*CFrame.new(hit.Size.X/4,hit.Size.Y/4,-hit.Size.Z/4)
	local sp2 = Instance.new("Part", workspace)
	sp2.Color  = Color3.fromRGB(r,g,b)
	sp2.Material = hit.Material
	sp2.Size = Vector3.new(hit.Size.X/2,hit.Size.Y/2,hit.Size.Z/2)
	sp2.CFrame = hit.CFrame*CFrame.new(-hit.Size.X/4,hit.Size.Y/4,-hit.Size.Z/4)
	local sp3 = Instance.new("Part", workspace)
	sp3.Color  = Color3.fromRGB(r,g,b)
	sp3.Material = hit.Material
	sp3.Size = Vector3.new(hit.Size.X/2,hit.Size.Y/2,hit.Size.Z/2)
	sp3.CFrame = hit.CFrame*CFrame.new(hit.Size.X/4,-hit.Size.Y/4,-hit.Size.Z/4)
	local sp4 = Instance.new("Part", workspace)
	sp4.Color  = Color3.fromRGB(r,g,b)
	sp4.Material = hit.Material
	sp4.Size = Vector3.new(hit.Size.X/2,hit.Size.Y/2,hit.Size.Z/2)
	sp4.CFrame = hit.CFrame*CFrame.new(-hit.Size.X/4,-hit.Size.Y/4,-hit.Size.Z/4)
	
	local sp11 = Instance.new("Part", workspace)
	sp11.Color  = Color3.fromRGB(r,g,b)
	sp11.Material = hit.Material
	sp11.Size = Vector3.new(hit.Size.X/2,hit.Size.Y/2,hit.Size.Z/2)
	sp11.CFrame = hit.CFrame*CFrame.new(hit.Size.X/4,hit.Size.Y/4,hit.Size.Z/4)
	local sp21 = Instance.new("Part", workspace)
	sp21.Color  = Color3.fromRGB(r,g,b)
	sp21.Material = hit.Material
	sp21.Size = Vector3.new(hit.Size.X/2,hit.Size.Y/2,hit.Size.Z/2)
	sp21.CFrame = hit.CFrame*CFrame.new(-hit.Size.X/4,hit.Size.Y/4,hit.Size.Z/4)
	local sp31 = Instance.new("Part", workspace)
	sp31.Color  = Color3.fromRGB(r,g,b)
	sp31.Material = hit.Material
	sp31.Size = Vector3.new(hit.Size.X/2,hit.Size.Y/2,hit.Size.Z/2)
	sp31.CFrame = hit.CFrame*CFrame.new(hit.Size.X/4,-hit.Size.Y/4,hit.Size.Z/4)
	local sp41 = Instance.new("Part", workspace)
	sp41.Color  = Color3.fromRGB(r,g,b)
	sp41.Material = hit.Material
	sp41.Size = Vector3.new(hit.Size.X/2,hit.Size.Y/2,hit.Size.Z/2)
	sp41.CFrame = hit.CFrame*CFrame.new(-hit.Size.X/4,-hit.Size.Y/4,hit.Size.Z/4)
	
	sp1.Name = "splitpart"
	sp2.Name = "splitpart"
	sp3.Name = "splitpart"
	sp4.Name = "splitpart"
	
	sp11.Name = "splitpart"
	sp21.Name = "splitpart"
	sp31.Name = "splitpart"
	sp41.Name = "splitpart"
	
	sp1.Material = "Neon"	
	sp2.Material = "Neon"	
	sp3.Material = "Neon"	
	sp4.Material = "Neon"
	
	sp11.Material = "Neon"	
	sp21.Material = "Neon"	
	sp31.Material = "Neon"	
	sp41.Material = "Neon"		
	
	sp1.RotVelocity = Vector3.new(math.random(-150,150),math.random(-150,150),math.random(-150,150))
	sp2.RotVelocity = Vector3.new(math.random(-150,150),math.random(-150,150),math.random(-150,150))
	sp3.RotVelocity = Vector3.new(math.random(-150,150),math.random(-150,150),math.random(-150,150))
	sp4.RotVelocity = Vector3.new(math.random(-150,150),math.random(-150,150),math.random(-150,150))
	sp11.RotVelocity = Vector3.new(math.random(-150,150),math.random(-150,150),math.random(-150,150))
	sp21.RotVelocity = Vector3.new(math.random(-150,150),math.random(-150,150),math.random(-150,150))
	sp31.RotVelocity = Vector3.new(math.random(-150,150),math.random(-150,150),math.random(-150,150))
	sp41.RotVelocity = Vector3.new(math.random(-150,150),math.random(-150,150),math.random(-150,150))
	
	
	sp1.Velocity = Vector3.new(math.random(-150,150),math.random(-150,150),math.random(-150,150))	
	sp2.Velocity = Vector3.new(math.random(-150,150),math.random(-150,150),math.random(-150,150))
	sp3.Velocity = Vector3.new(math.random(-150,150),math.random(-150,150),math.random(-150,150))
	sp4.Velocity = Vector3.new(math.random(-150,150),math.random(-150,150),math.random(-150,150))
	sp11.Velocity = Vector3.new(math.random(-150,150),math.random(-150,150),math.random(-150,150))	
	sp21.Velocity = Vector3.new(math.random(-150,150),math.random(-150,150),math.random(-150,150))
	sp31.Velocity = Vector3.new(math.random(-150,150),math.random(-150,150),math.random(-150,150))
	sp41.Velocity = Vector3.new(math.random(-150,150),math.random(-150,150),math.random(-150,150))
	
	if collid == true then
	sp1.CanCollide = false
	sp2.CanCollide = false
	sp3.CanCollide = false
	sp4.CanCollide = false
	
	sp11.CanCollide = false
	sp21.CanCollide = false
	sp31.CanCollide = false
	sp41.CanCollide = false
	end
		
	
	hit:Destroy()
	coroutine.resume(coroutine.create(function()
	while sp1.Transparency < 1 do
	sp1.Transparency = sp1.Transparency + 0.01
	sp2.Transparency = sp1.Transparency
	sp3.Transparency = sp1.Transparency
	sp4.Transparency = sp1.Transparency
	sp11.Transparency = sp1.Transparency
	sp21.Transparency = sp1.Transparency
	sp31.Transparency = sp1.Transparency
	sp41.Transparency = sp1.Transparency
	
	sp1.Color  = Color3.fromRGB(r,g,b)
	sp2.Color  = Color3.fromRGB(r,g,b)
	sp3.Color  = Color3.fromRGB(r,g,b)
	sp4.Color  = Color3.fromRGB(r,g,b)
	
	sp11.Color  = Color3.fromRGB(r,g,b)
	sp21.Color  = Color3.fromRGB(r,g,b)
	sp31.Color  = Color3.fromRGB(r,g,b)
	sp41.Color  = Color3.fromRGB(r,g,b)
	
	grav(sp1)
	grav(sp2)
	grav(sp3)
	grav(sp4)
	grav(sp11)
	grav(sp21)
	grav(sp31)
	grav(sp41)
	wait()
	end
	sp1:Destroy()
	sp2:Destroy()
	sp3:Destroy()
	sp4:Destroy()
	sp11:Destroy()
	sp21:Destroy()
	sp31:Destroy()
	sp41:Destroy()
	end))

	debounce = false
end
end)

local flying = false

local rip = function(nam, par)
	local d = par:GetChildren()
	for i=1, #d  do 
	if d[i].Name == nam then
		local sp1 = Instance.new("Part", workspace)
	sp1.Color  = Color3.fromRGB(r,g,b)
	sp1.Material = d[i].Material
	sp1.Size = Vector3.new(d[i].Size.X/2,d[i].Size.Y/2,d[i].Size.Z/2)
	sp1.CFrame = d[i].CFrame*CFrame.new(d[i].Size.X/4,d[i].Size.Y/4,-d[i].Size.Z/4)
	local sp2 = Instance.new("Part", workspace)
	sp2.Color  = Color3.fromRGB(r,g,b)
	sp2.Material = d[i].Material
	sp2.Size = Vector3.new(d[i].Size.X/2,d[i].Size.Y/2,d[i].Size.Z/2)
	sp2.CFrame = d[i].CFrame*CFrame.new(-d[i].Size.X/4,d[i].Size.Y/4,-d[i].Size.Z/4)
	local sp3 = Instance.new("Part", workspace)
	sp3.Color  = Color3.fromRGB(r,g,b)
	sp3.Material = d[i].Material
	sp3.Size = Vector3.new(d[i].Size.X/2,d[i].Size.Y/2,d[i].Size.Z/2)
	sp3.CFrame = d[i].CFrame*CFrame.new(d[i].Size.X/4,-d[i].Size.Y/4,-d[i].Size.Z/4)
	local sp4 = Instance.new("Part", workspace)
	sp4.Color  = Color3.fromRGB(r,g,b)
	sp4.Material = d[i].Material
	sp4.Size = Vector3.new(d[i].Size.X/2,d[i].Size.Y/2,d[i].Size.Z/2)
	sp4.CFrame = d[i].CFrame*CFrame.new(-d[i].Size.X/4,-d[i].Size.Y/4,-d[i].Size.Z/4)
	
	local sp11 = Instance.new("Part", workspace)
	sp11.Color  = Color3.fromRGB(r,g,b)
	sp11.Material = d[i].Material
	sp11.Size = Vector3.new(d[i].Size.X/2,d[i].Size.Y/2,d[i].Size.Z/2)
	sp11.CFrame = d[i].CFrame*CFrame.new(d[i].Size.X/4,d[i].Size.Y/4,d[i].Size.Z/4)
	local sp21 = Instance.new("Part", workspace)
	sp21.Color  = Color3.fromRGB(r,g,b)
	sp21.Material = d[i].Material
	sp21.Size = Vector3.new(d[i].Size.X/2,d[i].Size.Y/2,d[i].Size.Z/2)
	sp21.CFrame = d[i].CFrame*CFrame.new(-d[i].Size.X/4,d[i].Size.Y/4,d[i].Size.Z/4)
	local sp31 = Instance.new("Part", workspace)
	sp31.Color  = Color3.fromRGB(r,g,b)
	sp31.Material = d[i].Material
	sp31.Size = Vector3.new(d[i].Size.X/2,d[i].Size.Y/2,d[i].Size.Z/2)
	sp31.CFrame = d[i].CFrame*CFrame.new(d[i].Size.X/4,-d[i].Size.Y/4,d[i].Size.Z/4)
	local sp41 = Instance.new("Part", workspace)
	sp41.Color  = Color3.fromRGB(r,g,b)
	sp41.Material = d[i].Material
	sp41.Size = Vector3.new(d[i].Size.X/2,d[i].Size.Y/2,d[i].Size.Z/2)
	sp41.CFrame = d[i].CFrame*CFrame.new(-d[i].Size.X/4,-d[i].Size.Y/4,d[i].Size.Z/4)
	
	sp1.Name = "splitpart"
	sp2.Name = "splitpart"
	sp3.Name = "splitpart"
	sp4.Name = "splitpart"
	
	sp11.Name = "splitpart"
	sp21.Name = "splitpart"
	sp31.Name = "splitpart"
	sp41.Name = "splitpart"
	
	sp1.Material = "Neon"	
	sp2.Material = "Neon"	
	sp3.Material = "Neon"	
	sp4.Material = "Neon"
	
	sp11.Material = "Neon"	
	sp21.Material = "Neon"	
	sp31.Material = "Neon"	
	sp41.Material = "Neon"		
	
	sp1.RotVelocity = Vector3.new(math.random(-150,150),math.random(-150,150),math.random(-150,150))
	sp2.RotVelocity = Vector3.new(math.random(-150,150),math.random(-150,150),math.random(-150,150))
	sp3.RotVelocity = Vector3.new(math.random(-150,150),math.random(-150,150),math.random(-150,150))
	sp4.RotVelocity = Vector3.new(math.random(-150,150),math.random(-150,150),math.random(-150,150))
	sp11.RotVelocity = Vector3.new(math.random(-150,150),math.random(-150,150),math.random(-150,150))
	sp21.RotVelocity = Vector3.new(math.random(-150,150),math.random(-150,150),math.random(-150,150))
	sp31.RotVelocity = Vector3.new(math.random(-150,150),math.random(-150,150),math.random(-150,150))
	sp41.RotVelocity = Vector3.new(math.random(-150,150),math.random(-150,150),math.random(-150,150))
	
	
	sp1.Velocity = Vector3.new(math.random(-150,150),math.random(-150,150),math.random(-150,150))	
	sp2.Velocity = Vector3.new(math.random(-150,150),math.random(-150,150),math.random(-150,150))
	sp3.Velocity = Vector3.new(math.random(-150,150),math.random(-150,150),math.random(-150,150))
	sp4.Velocity = Vector3.new(math.random(-150,150),math.random(-150,150),math.random(-150,150))
	sp11.Velocity = Vector3.new(math.random(-150,150),math.random(-150,150),math.random(-150,150))	
	sp21.Velocity = Vector3.new(math.random(-150,150),math.random(-150,150),math.random(-150,150))
	sp31.Velocity = Vector3.new(math.random(-150,150),math.random(-150,150),math.random(-150,150))
	sp41.Velocity = Vector3.new(math.random(-150,150),math.random(-150,150),math.random(-150,150))
	
	if collid == true then
	sp1.CanCollide = false
	sp2.CanCollide = false
	sp3.CanCollide = false
	sp4.CanCollide = false
	
	sp11.CanCollide = false
	sp21.CanCollide = false
	sp31.CanCollide = false
	sp41.CanCollide = false
	end
		
	
	d[i]:Destroy()
	coroutine.resume(coroutine.create(function()
	while sp1.Transparency < 1 do
	sp1.Transparency = sp1.Transparency + 0.01
	sp2.Transparency = sp1.Transparency
	sp3.Transparency = sp1.Transparency
	sp4.Transparency = sp1.Transparency
	sp11.Transparency = sp1.Transparency
	sp21.Transparency = sp1.Transparency
	sp31.Transparency = sp1.Transparency
	sp41.Transparency = sp1.Transparency
	
	sp1.Color  = Color3.fromRGB(r,g,b)
	sp2.Color  = Color3.fromRGB(r,g,b)
	sp3.Color  = Color3.fromRGB(r,g,b)
	sp4.Color  = Color3.fromRGB(r,g,b)
	
	sp11.Color  = Color3.fromRGB(r,g,b)
	sp21.Color  = Color3.fromRGB(r,g,b)
	sp31.Color  = Color3.fromRGB(r,g,b)
	sp41.Color  = Color3.fromRGB(r,g,b)
	
	grav(sp1)
	grav(sp2)
	grav(sp3)
	grav(sp4)
	grav(sp11)
	grav(sp21)
	grav(sp31)
	grav(sp41)
	wait()
	end
	sp1:Destroy()
	sp2:Destroy()
	sp3:Destroy()
	sp4:Destroy()
	sp11:Destroy()
	sp21:Destroy()
	sp31:Destroy()
	sp41:Destroy()
	end))
	end 
end
end

local ball = function()
	attack = true
	split.Parent = workspace
	local origsize = split.Size
	split.Size = Vector3.new(2,2,2)
	split.CanCollide = true
	coroutine.resume(coroutine.create(function()
	while charging == true do
	split.Size = split.Size + Vector3.new(0.1,0.1,0.1)
	wait()
	end
	split.Parent = tewl
	split.Size = origsize
	attack = false
	end))
end

local fly = function()
	attack = true	
	while charging == true do
	local flyblock = Instance.new("Part", char)
	flyblock.Size = Vector3.new(10,1,10)
	flyblock.CFrame = char.Torso.CFrame * CFrame.new(0,-4,0)
	flyblock.Name = "flyblock"
	flyblock.Anchored = true
	rip("flyblock", char)
	wait(.1)
	end
	attack = false
end

local spawnn = function()
	attack = true
	local k = Instance.new("Part", char)
	k.Size = Vector3.new(4,4,1)
	while charging == true do
	k.CFrame = char.Torso.CFrame * CFrame.new(0,0,-5)
	k.Name = "bigrip"
	k.Size = k.Size + Vector3.new(2,1,0)
	wait()
	end
	attack = false
end

local shoot = function()
	attack = true
	local cf = split.CFrame
	split.Parent = workspace
	local origsize = split.Size
	split.CanCollide = true
	split.Size = split.Size + Vector3.new(0,0,15)
	for i = 0,1,0.05 do
	split.CFrame = cf
	cf = cf * CFrame.new(0,0,-4)
	split.Velocity = Vector3.new(0,0,0)
	wait()
	end
	split.Parent = tewl
	split.Size = origsize
	attack = false
end

play:GetMouse().KeyDown:connect(function(k)
	
	k = k:lower()
	if k == "q" and attack == false then
	if collid == true then
		collid = false
	elseif collid == false then
		collid = true
	end
	elseif k == "e" and attack == false then
		attack = true
		for i = 0,19 do
			local p = Instance.new("Part", char)
			p.Anchored = true
			p.Size = Vector3.new(4,4,1)
			p.Name = "rip"
			p.CFrame = char.Torso.CFrame * CFrame.fromEulerAnglesXYZ(math.rad(math.random(-360,360)),math.rad(math.random(-360,360)),math.rad(math.random(-360,360))) * CFrame.new(0,0,math.random(5,10))
			wait(.1)
			rip("rip", char)
		end
		attack = false
	elseif k == "r" and attack == false then
		charging = true
		spawnn()
	elseif k == "t" and attack == false then
		charging = true
		ball()
	elseif k == "t" and charging == true then
		charging = false
	elseif k == "f" and charging == true then
		charging = false
	elseif k == "r" and charging == true then
		charging = false
		rip("bigrip", char)
	elseif k == "f" and attack == false and flying == false then
		charging = true
		collid = false
		fly()
	elseif k == "g" and attack == false then
		charging = true
		shoot()
	end
end)