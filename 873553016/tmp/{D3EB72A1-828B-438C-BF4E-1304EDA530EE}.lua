asd = -5.32
asd2 = 0
local debounce = false
local char = game.Players.LocalPlayer.Character
local a = Instance.new("Part", workspace.CurrentCamera)
a.CFrame = CFrame.new(15,4,15)
a.Anchored = true
a.Size = Vector3.new(2,2,2)

makewalls = function()
local b = Instance.new("Part", workspace.CurrentCamera)
b.Size = Vector3.new(1,25,1)
b.Transparency = 0.999
b.Material = "Glass"
b.CFrame = a.CFrame * CFrame.new(0,4.5+asd,98)
b.Anchored = true
local b2 = Instance.new("Part", workspace.CurrentCamera)
b2.Transparency = 0.999
b2.Material = "Glass"
b2.Size = Vector3.new(1,25,1)
b2.CFrame = a.CFrame * CFrame.new(0,4.5+asd,82)
b2.Anchored = true
local m = Instance.new("Part")
m.Parent = workspace.CurrentCamera
m.Material = "Marble"
m.Transparency = 0
m.Size = Vector3.new(5,1,15)
m.CFrame = a.CFrame * CFrame.new(0,asd,90)
m.Anchored = true

local m2 = Instance.new("Part")
m2.Parent = workspace.CurrentCamera
m2.Material = "Glass"
m2.Transparency = 0.999
m2.Size = Vector3.new(5,1,15)
m2.CFrame = a.CFrame * CFrame.new(0,asd+18,90)
m2.Anchored = true
end

while asd < 600 do
makewalls()
asd = asd + 0.1
a.CFrame = a.CFrame * CFrame.fromEulerAnglesXYZ(0.01/10,-.01,-0.01/10)
end

a.BrickColor = BrickColor.new("Bright green")
local con = a.Touched:connect(function(hit)
hit.Parent.Torso.CFrame = a.CFrame * CFrame.new(0,asd+5,90)
end)

while true do
workspace.Base.Transparency = 0.01
wait()
end