local play = game.Players.LocalPlayer
local char = play.Character

local tewl = Instance.new("Tool",play.Backpack)
tewl.Name = "Harpoon Launcher"
tewl.GripPos = Vector3.new(0,0,.5)

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

local han = part(Vector3.new(1,1,1))
han.Name = "Handle"
han.CanCollide = true
local bas = part(Vector3.new(1,1,3))
weld(bas,han,CFrame.new(0,-1,-1))
local bar = part(Vector3.new(.5,.5,3))
bar.Color = Color3.new(0,0,0)
weld(bar,han,CFrame.new(0,-1,-.95))

tewl.Activated:connect(function(pers)
	local bul = part(Vector3.new(2,.5,.5))
	bul.Shape = "Cylinder"
	bul.Name = "Harpoon"
	local tip = part(Vector3.new(1,1,1))
	tip.Parent = bul
	local spec = Instance.new("SpecialMesh",tip)
	spec.MeshType = "FileMesh"
	spec.MeshId = "http://www.roblox.com/asset/?id=1778999"
	spec.Scale = Vector3.new(.5,1,.5)
	weld(bul,tip,CFrame.new(-1.5,0,0)*CFrame.Angles(0,0,math.rad(90)))
	bul.Parent = workspace
	bul.CFrame = bar.CFrame * CFrame.Angles(math.rad(-90),0,0)
	local vel = Instance.new("BodyVelocity",bul)
	vel.Velocity = (bar.Position - bas.Position).Unit * 150
	local deb = false
	bul.Touched:connect(function(hit)
		if hit.Parent ~= tewl and hit.Parent ~= char and hit.Parent.ClassName ~= "Accessory" and hit.Parent ~= bul and hit.Name ~= "Base" and deb == false then
			deb = true
		local d = hit.Parent:FindFirstChildOfClass("Humanoid")
		if d ~= nil then
			d.PlatformStand = true
			for i, v in pairs(hit.Parent:GetChildren()) do
				if v.ClassName == "Part" or v.ClassName == "MeshPart" then
					v.CustomPhysicalProperties = PhysicalProperties.new(0,0,0,0,0)
				end
			end
		else
			hit.Anchored = false
			hit.CustomPhysicalProperties = PhysicalProperties.new(0,0,0,0,0)
		end
		vel:Destroy()
		bul.CanCollide = true
		tip.CanCollide = true
		weld(bul,hit,bul.CFrame:toObjectSpace(hit.CFrame))
		local att = Instance.new("Attachment",bul)
		att.Position = Vector3.new(1,0,0)
		local att2 = Instance.new("Attachment",bar)
		att2.Position = Vector3.new(0,0,-1.5)
		local spring = Instance.new("SpringConstraint",bul)
		spring.Attachment0 = att
		spring.Attachment1 = att2
		spring.Coils = 1
		spring.Radius = 0
		spring.Visible = true
		spring.Stiffness = 5
		end
	end)
end)

tewl.Unequipped:connect(function()
	for i, v in pairs(workspace:GetChildren()) do
		if v.Name == "Harpoon" then
			v:Destroy()
		end
			local d = v:FindFirstChildOfClass("Humanoid")
			if d ~= nil then
				d.PlatformStand = false
			end
	end
end)