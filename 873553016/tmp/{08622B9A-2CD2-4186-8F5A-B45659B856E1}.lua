char = game.Players.LocalPlayer.Character

local cash = 0
local val = 1
local tewl = Instance.new("Tool", char)
tewl.Name = "Moneyz : 0  "
local cost1 = 10
local sped = 1
local cost2 = 50
local cost4 = 50
local droppers = 1
local val2 = 5
local sped2 = 4
local cost4 = 250
local cost5 = 335
local cost6 = 400
local upgraded = false
local claimed = false
local tycoonparent = "wow"
local debounce = false

local p = Instance.new("Part", workspace)
p.Size = Vector3.new(15,1,5)
p.CFrame = CFrame.new(char.Torso.CFrame.X+10, 3, char.Torso.CFrame.Z+15)
p.Anchored = true
p.Velocity = Vector3.new(30,0,0)
p.BrickColor = BrickColor.new("Dark stone grey")
p.Material = "SmoothPlastic"
p.Locked = true

local w = function(x,y,z,x2,y2,z2,mat,col)
local ww = Instance.new("Part", workspace)
ww.CFrame = CFrame.new(p.CFrame.X+x+2.5,y,p.CFrame.Z+z)
ww.Size = Vector3.new(x2,y2,z2)
ww.Material = mat
ww.BrickColor = col
ww.Anchored = true
if mat == "Glass" then
ww.Transparency = 0.8
end
end

w(-10.5,6,3, 1,7,13, "SmoothPlastic",BrickColor.new("Really black"))
w(0,3,-3, 20,1,1, "SmoothPlastic",BrickColor.new("Really black"))
w(0,9,-3, 20,1,1, "SmoothPlastic",BrickColor.new("Really black"))
w(0,9,3, 20,1,1, "SmoothPlastic",BrickColor.new("Really black"))
w(0,9,9, 20,1,1, "SmoothPlastic",BrickColor.new("Really black"))
w(10.5,6,7, 1,7,21, "SmoothPlastic",BrickColor.new("Really black"))
w(7.5,6,18, 7,7,1, "SmoothPlastic",BrickColor.new("Really black"))
w(4.5,6,13.5, 1,7,8, "SmoothPlastic",BrickColor.new("Really black"))
w(4.5,6,9, 1,5,1, "SmoothPlastic",BrickColor.new("Really black"))
w(-2.5,3,9, 15,1,1, "SmoothPlastic",BrickColor.new("Really black"))
w(-2.5,3,3, 15,1,1, "SmoothPlastic",BrickColor.new("Really black"))
w(7.5,7.5,17, 5,4,1, "SmoothPlastic",BrickColor.new("Really black"))
w(7.5,9,13, 5,1,7, "Glass",BrickColor.new("Really black"))
w(1.5,9,6, 17,1,5, "Glass",BrickColor.new("Really black"))
w(1.5,9,0, 17,1,5, "Glass",BrickColor.new("Really black"))
w(-3,6,9,14,5,1, "Glass",BrickColor.new("Really black"))
w(-3,6,3,14,5,1, "Glass",BrickColor.new("Really black"))
w(0,6,-3,20,5,1, "Glass",BrickColor.new("Really black"))



local p2 = Instance.new("Part", workspace)
p2.Size = Vector3.new(15,1,5)
p2.CFrame = CFrame.new(char.Torso.CFrame.X+10, 3, char.Torso.CFrame.Z+21)
p2.Anchored = true
p2.Velocity = Vector3.new(30,0,0)
p2.BrickColor = BrickColor.new("Dark stone grey")
p2.Material = "SmoothPlastic"

local p3 = Instance.new("Part", workspace)
p3.Size = Vector3.new(5,1,20)
p3.CFrame = CFrame.new(char.Torso.CFrame.X+20, 3, char.Torso.CFrame.Z+22.5)
p3.Anchored = true
p3.Velocity = Vector3.new(0,0,30)
p3.BrickColor = BrickColor.new("Dark stone grey")
p3.Material = "SmoothPlastic"

local w3 = Instance.new("Part", workspace)
w3.Size = Vector3.new(3,1,5)
w3.CFrame = CFrame.new(p.Position.X-6, 9, p.Position.Z)
w3.Anchored = true
w3.BrickColor = BrickColor.new("Really black")
w3.Material = "SmoothPlastic"
coroutine.resume(coroutine.create(function()
while true do
if claimed == true then
local drop = Instance.new("Part", workspace)
drop.Size = Vector3.new(1,1,1)
drop.CFrame = w3.CFrame * CFrame.new(0,-2,0)
drop.Material = "SmoothPlastic"
drop.Name = "val"
drop.Color = Color3.fromRGB(sped*5,val*10,val*20)
coroutine.resume(coroutine.create(function()
drop.Name = "val"
wait()
end))
end
wait(1/sped)
end
end))

local w32 = Instance.new("Part", workspace)
w32.Size = Vector3.new(3,1,5)
w32.CFrame = CFrame.new(p.Position.X-6, 9, p.Position.Z+6)
w32.Anchored = true
w32.BrickColor = BrickColor.new("Really black")
w32.Material = "SmoothPlastic"
coroutine.resume(coroutine.create(function()
while true do
if droppers >= 2 then
local drop = Instance.new("Part", workspace)
drop.Size = Vector3.new(1.01,1.01,1.01)
drop.CFrame = w32.CFrame * CFrame.new(0,-2,0)
drop.Material = "SmoothPlastic"
drop.Name = "val2"
drop.Color = Color3.fromRGB(sped2*20,val2*10,val2*5)
coroutine.resume(coroutine.create(function()
drop.Name = "val2"
wait()
end))
end
wait(1/sped2)
end
end))

local w2 = Instance.new("Part", workspace)
w2.Size = Vector3.new(5,3,1)
w2.CFrame = CFrame.new(p.Position.X+10, 4, p.Position.Z+17)
w2.Anchored = true
w2.CanCollide = false
w2.BrickColor = BrickColor.new("Really red")
w2.Material = "Neon"
local con = w2.Touched:connect(function(hit)
if hit.Size == Vector3.new(1,1,1) then
hit:Destroy()
cash = cash + val
end
if hit.Size == Vector3.new(1.01,1.01,1.01) then
cash = cash + val2
hit:Destroy()
end
end)

local g3 = Instance.new("Model", workspace)
g3.Name = "Claim This Tycoon!"
local b3 = Instance.new("Part", g3)
b3.Size = Vector3.new(3,1,3)
b3.CFrame = CFrame.new(p.Position.X-15, 3, p.Position.Z)
b3.Anchored = true
b3.BrickColor = BrickColor.new("Really black")
b3.Material = "SmoothPlastic"
b3.Transparency = 0
b3.CanCollide = false
b3.Name = "Head"
local h = Instance.new("Humanoid", g3)
local con = b3.Touched:connect(function(hit)
if hit.Parent.Humanoid ~= nil then

if claimed == false then

tycoonparent = hit.Parent.Name
b3.Transparency = .99
end
claimed = true
end
end)
-- p.Position.X-9
-- p.Position.Z-7.5


local upgrader = function(x,z, name, type, cost, dropper)
local g1 = Instance.new("Model", workspace)
g1.Name = "Upgrade "..name.." : "..cost..""
local b1 = Instance.new("Part", g1)
b1.Size = Vector3.new(3,1,3)
b1.CFrame = CFrame.new(x, 3, z)
b1.Anchored = true
b1.BrickColor = BrickColor.new("Bright green")
b1.Material = "SmoothPlastic"
b1.Transparency = 0
b1.Name = "Head"
local con = b1.Touched:connect(function(hit)
if hit.Parent.Name == tycoonparent and debounce == false then
if cash >= cost then
debounce = true
cash = cash - cost
cost = cost*1.5
cost = math.floor(cost)
if name == "speed" then
sped = sped + 0.5
end
if name == "value" then
val = val + 1
end
if name == "speed 2" then
sped2 = sped2 + 0.5
end
if name == "value 2" then
val2 = val2 + 5
end
if name == "Dropper" then
droppers = 2
upgraded = true
g1:Destroy()
end
g1.Name = "Upgrade "..name.." : "..cost..""
wait(.25)
debounce = false
end
end
end)
local h = Instance.new("Humanoid", g1)
end

upgrader(p.Position.X-9,p.Position.Z-7.5, "speed", sped, cost1, 1)
upgrader(p.Position.X-3,p.Position.Z-7.5, "value", val, cost2, 1)
upgrader(p.Position.X+3,p.Position.Z-7.5, "Dropper", droppers, cost4, 1)





while true do
local asdd = Instance.new("Part", workspace)
asdd.Transparency = 1
asdd.CanCollide = false
if claimed == true then
	g3.Name = ""..tycoonparent.."'s Moneyz : "..cash..""
tewl.Name = "Moneyz : "..cash.."  "
p.Velocity = Vector3.new(30,0,0)
if droppers == 2 and upgraded == true then
upgraded = false
upgrader(p.Position.X-9,p.Position.Z-13.5, "speed 2", sped2, cost5, 2)
upgrader(p.Position.X-3,p.Position.Z-13.5, "value 2", val2, cost6, 2)
end
end
wait()
end