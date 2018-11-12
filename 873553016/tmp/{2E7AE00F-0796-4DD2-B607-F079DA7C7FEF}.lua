local char = game.Players.LocalPlayer.Character
local asd = 0

local followpart = Instance.new("Part", char)
followpart.Anchored = true
followpart.CanCollide = false
followpart.Size = Vector3.new(1,1,1)
followpart.Transparency = 1

local nolagplease = Instance.new("Model", char)
nolagplease.Name = "block spam goes here"

block = function(cfram,size,expansize,transp,color,kind)
local p = Instance.new("Part", nolagplease)
p.CFrame = cfram
p.Size = size
p.Anchored = true
p.Material = "Neon"
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

local dd1 = 10
local asdadd = 0.1
game.Players.LocalPlayer:GetMouse().KeyDown:connect(function(k)
	
	k = k:lower()
	if k == "q" then
		dd1 = dd1 + 1
		asdadd = asdadd * .9
	end
	if k == "e" then
		dd1 = dd1 - 1
		asdadd = asdadd * 1.11
	end
end)

while true do
followpart.Position = char.Torso.Position
followpart.CFrame = followpart.CFrame * CFrame.fromEulerAnglesXYZ(0,math.rad(5+asdadd),0)
block(followpart.CFrame * CFrame.new(-dd1,0,0) * CFrame.fromEulerAnglesXYZ(asd,0,asd), Vector3.new(0.5,0.5,0.5), Vector3.new(0,.5,0),0.1,BrickColor.new("Really black"), 2)
block(followpart.CFrame * CFrame.new(dd1,0,0) * CFrame.fromEulerAnglesXYZ(-asd,0,-asd), Vector3.new(0.5,0.5,0.5), Vector3.new(0,.5,0),0.1,BrickColor.new("Institutional white"), 2)
block(followpart.CFrame * CFrame.new(-dd1,0,0) * CFrame.fromEulerAnglesXYZ(asd,0,asd), Vector3.new(0.5,0.5,0.5), Vector3.new(0,0,.5),0.1,BrickColor.new("Really black"), 2)
block(followpart.CFrame * CFrame.new(dd1,0,0) * CFrame.fromEulerAnglesXYZ(-asd,0,-asd), Vector3.new(0.5,0.5,0.5), Vector3.new(0,0,.5),0.1,BrickColor.new("Institutional white"), 2)
asd = asd + asdadd
wait()
end

