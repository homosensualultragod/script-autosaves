local play = game.Players.LocalPlayer
local char = play.Character

local tewl = Instance.new("Tool",play.Backpack)
tewl.Name = "Bow"
tewl.GripPos = Vector3.new(0,-.75,-.5)

local part = function(siz)
	local p = Instance.new("Part", tewl)
	p.Size = siz
	p.CanCollide = false
	p.Material = "SmoothPlastic"
	return p
end

local weld = function(p0,p1,c0)
	local wel = Instance.new("Weld",p0)
	wel.Part0 = p0
	wel.Part1 = p1
	wel.C0 = c0
end

local han = part(Vector3.new(.5,.5,.5))
han.Name = "Handle"
local spec = Instance.new("SpecialMesh",han)
spec.MeshId = "rbxassetid://395019777"
spec.Scale = Vector3.new(.75,.75,.75)
local ar = part(Vector3.new(.5,.5,3))
ar.Color = Color3.new(0,0,0)
weld(ar,han,CFrame.new(0,0,0))
local spec = Instance.new("SpecialMesh",ar)
spec.MeshId = "http://www.roblox.com/asset/?id=395019701"
spec.Scale = Vector3.new(.75,.75,.75)

local debounce = false
tewl.Activated:connect(function()
	if debounce == false then
	debounce = true
	local target = nil
	local arrow = ar:Clone()
	arrow.Weld:Destroy()
	arrow.Name = "aimbotzz"
	arrow.Parent = workspace
	ar.Transparency = 1
	arrow.CFrame = ar.CFrame * CFrame.new(0,0,-1)
	local att1 = Instance.new("Attachment",arrow)
	att1.Position = Vector3.new(0,.1,1.5)
	local att2 = Instance.new("Attachment",arrow)
	att2.Position = Vector3.new(0,-.1,1.5)
	local trail = Instance.new("Trail",arrow)
	trail.Attachment0 = att1
	trail.Attachment1 = att2
	trail.Lifetime = .2
	local vel = Instance.new("BodyVelocity",arrow)
	vel.Velocity = (arrow.Position - han.Position).Unit * 150
	local firsthit = false
	arrow.Touched:connect(function(hit)
		local d = hit.Parent:FindFirstChild("Head")
		local aa = hit.Parent:FindFirstChild("cooldown")
		local dd = hit.Parent:FindFirstChildOfClass("Humanoid")
		if d ~= nil and hit.Parent ~= char and dd ~= nil and firsthit == false then
			firsthit = true
			if dd.MaxHealth > 100 then
				dd.MaxHealth = 100
			else
				dd.Health = dd.Health - 20*(dd.MaxHealth/100)
			end
		end
		if d ~= nil and aa == nil and hit.Parent ~= char and dd ~= nil then
			if dd.MaxHealth > 100 then
				dd.MaxHealth = 100
			else
			end
				d.face.Transparency = 1
				d.Transparency = 1
				local d = d:Clone()
				d.Parent = workspace
				d.Transparency = 0
				d:BreakJoints()
				d.CustomPhysicalProperties = PhysicalProperties.new(0,0,0,0,0)
				if target ~= nil then
					local att0 = Instance.new("Attachment",d)
					local att1 = Instance.new("Attachment",target)
					local rope = Instance.new("RopeConstraint",workspace)
					rope.Enabled = true
					rope.Visible = true
					rope.Attachment0 = att0
					rope.Attachment1 = att1
				else
					local att0 = Instance.new("Attachment",d)
					local att1 = Instance.new("Attachment",arrow)
					local rope = Instance.new("RopeConstraint",workspace)
					rope.Enabled = true
					rope.Visible = true
					rope.Attachment0 = att0
					rope.Attachment1 = att1
				end
			target = d
			local aaa = Instance.new("NumberValue",hit.Parent)
			aaa.Name = "cooldown"
			local rip = game:GetService("Debris"):AddItem(aaa,5)
			local found = false
			for i, v in pairs(workspace:GetChildren()) do
				local d2 = v:FindFirstChild("Head")
				local deb = v:FindFirstChild("cooldown")
				local hum = v:FindFirstChildOfClass("Humanoid")
				if d2 ~= nil and v ~= char and deb == nil and hum ~= nil then
					if hum.Health > 0 then
					found = true
					arrow.CFrame = arrow.CFrame * CFrame.new(0,0,-10)
					arrow.CFrame = CFrame.new(arrow.Position,d.Position)
					coroutine.resume(coroutine.create(function()
					local sped = 150
					while target == d do
						vel.Velocity = (d2.Position - arrow.Position).Unit * sped
						wait(.3)
					end
					end))
					end
				end
			end
			if found == false then
				arrow:Destroy()
			end
			wait(.1)
		end 
	end)
	wait(.1)
	debounce = false
	ar.Transparency = 0
	end
end)

tewl.Equipped:connect(function()
	for i, v in pairs(workspace:GetChildren()) do
		if v.Name == "aimbotzz" then
			v:Destroy()
		end
	end
end)