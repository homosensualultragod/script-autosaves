asd = -5.32
asd2 = 0
local a = Instance.new("Part")
a.CFrame = CFrame.new(0,1,0)
a.Anchored = true
a.Size = Vector3.new(2,2,2)
workspace.Base.Transparency = 0.01
makewalls = function()
local b = Instance.new("Part", workspace.Base)
b.Size = Vector3.new(5,25,1)
b.Transparency = 0.99
b.Material = "Glass"
b.CFrame = a.CFrame * CFrame.new(0,4.5+asd,98)
b.Anchored = true
local b2 = Instance.new("Part", workspace.Base)
b2.Transparency = 0.99
b2.Material = "Glass"
b2.Size = Vector3.new(5,20,1)
b2.CFrame = a.CFrame * CFrame.new(0,4.5+asd,82)
b2.Anchored = true
local m = Instance.new("Part")
m.Parent = workspace.Base
m.Material = "Marble"
m.Transparency = 0.01
m.Size = Vector3.new(5,1,15)
m.CFrame = a.CFrame * CFrame.new(0,asd,90)
m.Anchored = true
local m2 = Instance.new("Part")
m2.Parent = workspace.Base
m2.Material = "Glass"
m2.Transparency = 0.99
m2.Size = Vector3.new(5,1,15)
m2.CFrame = a.CFrame * CFrame.new(0,asd+18,90)
m2.Anchored = true
end

while asd < 300 do
for i = 0, 4 do
makewalls()
asd = asd + 1
a.CFrame = a.CFrame * CFrame.fromEulerAnglesXYZ(0,-.05,0)
end
wait()
end