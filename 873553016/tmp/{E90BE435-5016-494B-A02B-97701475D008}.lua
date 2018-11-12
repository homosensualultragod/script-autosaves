local mous = Vector3.new(0,0,0)
for i = 0,25,1 do
char = game.Players.LocalPlayer.Character
local target = char
target.archivable = true
c = target:Clone()
c.Parent = workspace
c.Name = "gottam"
c.Humanoid.WalkSpeed = 32
c.Humanoid.MaxHealth = 10
c.Torso.CFrame = c.Torso.CFrame * CFrame.new(-10,0,5)
end

local respawn = function()
	for i = 0,25,1 do
char = game.Players.LocalPlayer.Character
local target = char
target.archivable = true
c = target:Clone()
c.Parent = workspace
c.Name = "gottam"
c.Humanoid.WalkSpeed = 32
c.Humanoid.MaxHealth = 10
c.Torso.CFrame = c.Torso.CFrame * CFrame.new(-10,0,5)
end
end
game.Players.LocalPlayer:GetMouse().KeyDown:connect(function(k)
	
	k = k:lower()
	 if k == "z" then
		local d = workspace:GetChildren()
	for i=1, #d  do 
	if d[i].Name == "gottam" then
		d[i]:Destroy()
end 
	end
	end
	if k == "x" then
		local d = workspace:GetChildren()
	for i=1, #d  do 
	if d[i].Name == "gottam" then
		local asd = Instance.new("Explosion", workspace)
		asd.Position = d[i].Torso.Position
	end 
	end
	wait(0.3)
	for i=1, #d  do 
	if d[i].Name == "Explosion" then
		d[i]:Destroy()
	end 
	end
	end
	if k == "c" then
	respawn()
	end
	if k == " " then
	local d = workspace:GetChildren()
	for i=1, #d  do 
	if d[i].Name == "gottam" then
		d[i].Humanoid.Jump = true
	end 
	end
	end
end)

while true do
local d = workspace:GetChildren()
	for i=1, #d  do 
	if d[i].Name == "gottam" then
		d[i].Humanoid.WalkToPoint = mous + Vector3.new(math.random(-30,30),0,math.random(-30,30))
		if d[i].Humanoid.Health < 1 then
			local asd = Instance.new("Explosion", workspace)
			asd.Position = d[i].Torso.Position
			d[i]:Destroy()
		end
	end 
end
mous = game.Players.LocalPlayer:GetMouse().Hit.p 
wait()
end