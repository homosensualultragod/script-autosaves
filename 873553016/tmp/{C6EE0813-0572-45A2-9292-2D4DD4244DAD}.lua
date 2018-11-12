--[[

local d = workspace.iFractal:GetChildren()
for i=1, #d  do 
	print(d[i])
end

x/game.Players.LocalPlayer.Character = workspace["Dummy (Magma) (HP : 150/150)"]
workspace.dev_ic3.Animate.Parent = game.Players.LocalPlayer.Character

--]]

block = function(cfram,size,expansize,transp,color,kind)
local p = Instance.new("Part", workspace)
p.CFrame = cfram
p.Size = size
p.Anchored = true
p.Material = "Granite"
p.CanCollide = false
p.BrickColor = color
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


recolor = function(h,m,c)
wait(0.2)
local d = h:GetChildren()
for i=1, #d  do 
	if d[i].ClassName == "Part" then
	if d[i].BrickColor == BrickColor.new("Dark green") then
		d[i].Transparency = 1
	end
	if d[i].Size == Vector3.new(2,1,1) then
	d[i].Mesh:Destroy()
	end
	local a = Instance.new("BlockMesh", d[i])
	if d[i].Size == Vector3.new(2,1,1) then
	a.Scale = Vector3.new(0.57,1.15,1.15)
	end
	
	if m ~= "Glass" then
	d[i].BrickColor = c
	d[i].Material = m
	end
	if m == "Glass" then
		if d[i].Transparency ~= 1 then
		d[i].Transparency = 0.7
		end
	end
	end
end
local p = Instance.new("Part", h)
p.Size = Vector3.new(.75,2,.75)
local pw = Instance.new("Weld", p)
pw.Part0 = p
pw.C0 = CFrame.new(0,2,0)
local p2 = Instance.new("Part", h)
p2.Size = Vector3.new(1.5,.25,1.5)
local pw2 = Instance.new("Weld", p2)
pw2.Part0 = p2
pw2.C0 = CFrame.new(0,2.87,0)
--p.CanCollide = false
local d = h:GetChildren()
for i=1, #d  do 
	if d[i].ClassName == "Part" then
	if d[i].Size == Vector3.new(2,2,1) then
		pw.Part1 = d[i]
		pw2.Part1 = d[i]
	end
	end
end
p.Material = "Wood"
p.BrickColor = BrickColor.new("Reddish brown")
p2.Material = "Granite"
p2.BrickColor = BrickColor.new("Really black")
end


local loadchar = function(char)
	char["Body Colors"]:Destroy()
	local type = "wow"
	local typ = math.random(1,6)
	if typ == 1 or typ == 2 then
		type = "Standard"
	end
	if typ == 3 then
		type = "Heavy"
		recolor(char,"Metal", BrickColor.new("Dark stone grey"))
		char.Humanoid.MaxHealth = 250
	end
	if typ == 4 then
		type = "Weak"
		recolor(char,"Glass", BrickColor.new("Sea green"))
		char.Humanoid.MaxHealth = 50
	end
	if typ == 5 then
		type = "Ultra"
		recolor(char,"Foil", BrickColor.new("New Yeller"))
		char.Humanoid.MaxHealth = 500
	end
	if typ == 6 then
		type = "Magma"
		recolor(char,"Granite", BrickColor.new("Really red"))
		char.Humanoid.MaxHealth = 150
		local debounce = false
		char.Torso.Touched:connect(function(hit)
		if debounce == false and hit.Parent.Humanoid ~= nil then
		debounce = true
		hit.Parent.Humanoid.Health = hit.Parent.Humanoid.Health - 5
		block(hit.Parent.Head.CFrame * CFrame.new(0,-1.5,0),Vector3.new(2,2,2),Vector3.new(.2,.2,.2),.15,BrickColor.new("Really red"), 1)
		wait(.1)
		debounce = false
		end
		end)
	end
	char.Head.Mesh:Destroy()
	local a = Instance.new("BlockMesh", char.Head)
	a.Scale = Vector3.new(0.57,1.15,1.15)
	wait(0.5)
	for i = 0,3,1 do
	char.Humanoid.Health = char.Humanoid.MaxHealth
	wait()
	end
	coroutine.resume(coroutine.create(function()
	while true do
	char.Name = "Dummy ("..type..") (HP : "..char.Humanoid.Health.."/"..char.Humanoid.MaxHealth..")"
	if char.Humanoid.Health < 1 and char.Name ~= "Dummy (Dead)" then
		char.Name = "Dummy ("..type..") (Dead)"
		wait(5)
		char:Destroy()
	end
	wait(0.5)
	end
	end))
end



while true do
local d = workspace:GetChildren()
for i=1, #d  do 
	if d[i].Name == "Dummy" then
		coroutine.resume(coroutine.create(function()
		loadchar(d[i])
		end))
	end 
end
wait(.5)
end