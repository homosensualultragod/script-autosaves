transform = function(person)
local effect1 = Instance.new("Part", workspace)
effect1.Anchored = true
effect1.Size = effect1.Size + Vector3.new(5,5,5)
effect1.CFrame = person.Torso.CFrame * CFrame.fromEulerAnglesXYZ(0,0,math.rad(90))
effect1.CanCollide = false
effect1.BrickColor = BrickColor.new("New Yeller")
effect1.Material = "Neon"
local mesh1 = Instance.new("SpecialMesh", effect1)
mesh1.MeshType = "Cylinder"
mesh1.Scale = Vector3.new(20000,1,1)
monster =game:GetService("InsertService"):LoadAsset(95401558):GetChildren()[1]
monster.Parent=game.Workspace
monster.Torso.CFrame = person.Torso.CFrame
monster.Torso.Smoke:Destroy()
monster.Head.Transparency = 0
local shir = person:findFirstChild("Shirt")
local pant = person:findFirstChild("Pants")
if shir ~= nil then
    shir.Parent = monster
end
if pant ~= nil then
    pant.Parent = monster
end
monster.Head.Material = "Air"
monster.HealthRegenerationScript:Destroy()
monster.Torso.Anchored = true
person:Destroy()
while effect1.Transparency < 1 do
effect1.Transparency = effect1.Transparency + 0.05
mesh1.Scale = mesh1.Scale + Vector3.new(0,.1,.1)
wait()
end
effect1:Destroy()
monster.Torso.Anchored = false
wait(.2)
local ob = Instance.new("ObjectValue", monster)
ob.Name = "creator"
ob.Value = game.Players.EndIessShadow
local debounce = Instance.new("BoolValue", monster)
debounce.Name = "deb"
debounce.Value = false
local a = monster["Right Arm"].Touched:connect(function(hit)
local hum = hit.Parent:findFirstChild("Humanoid")
if hum ~= nil and monster.deb.Value == false and hit.Parent.Name ~= monster.Name then
monster.deb.Value = true
hum.Health = hum.Health - 10
if hum.Health <= 0 then
    transform(hit.Parent)
end
monster.Humanoid.Health = monster.Humanoid.Health - 5
monster.Torso.HitSound:Play()
wait(.05)
monster.deb.Value = false
end
end)
local b = monster["Left Arm"].Touched:connect(function(hit)
local hum = hit.Parent:findFirstChild("Humanoid")
if hum ~= nil and monster.deb.Value == false and hit.Parent.Name ~= monster.Name then
monster.deb.Value = true
hum.Health = hum.Health - 10
if hum.Health <= 0 then
    transform(hit.Parent)
end
monster.Humanoid.Health = monster.Humanoid.Health - 5
monster.Torso.HitSound:Play()
wait(.05)
monster.deb.Value = false
end
end)
end

game.Players.EndIessShadow.Chatted:connect(function(message)
	if message:sub(1, 7) == "!shade " then
		transform(workspace[""..message:sub(8)..""])
	elseif message:sub(1,5) == "!fall" then
		local d = workspace:GetChildren()
		for i = 1,#d do
			if d[i].Name == "Shade" then
				d[i].Humanoid.Health = 0
			end
		end
	end
end)

--[[while true do
local d = workspace:findFirstChild("Dummy")
if d ~= nil then
  transform(d)
end
wait()
end]]