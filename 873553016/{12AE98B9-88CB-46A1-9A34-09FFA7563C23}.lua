wait(0.016666666666667)
script.Name = "Chaos"
local Player = game.Players.LocalPlayer
repeat
	wait()
until Player
local Character = Player.Character
repeat
	wait()
until Character
	local Effects = {}
	local Humanoid = Character.Humanoid
	local mouse = Player:GetMouse()
	local m = Instance.new("Model", Character)
	m.Name = "WeaponModel"
	local LeftArm = Character["Left Arm"]
	local RightArm = Character["Right Arm"]
	local LeftLeg = Character["Left Leg"]
	local RightLeg = Character["Right Leg"]
	local Head = Character.Head
	local Torso = Character.Torso
	local cam = game.Workspace.CurrentCamera
	local RootPart = Character.HumanoidRootPart
	local RootJoint = RootPart.RootJoint
	local equipped = false
	local attack = false
	local Anim = "Idle"
	local idle = 0
	local attacktype = 1
	local Torsovelocity = RootPart.Velocity * Vector3.new(1, 0, 1).magnitude
	local velocity = RootPart.Velocity.y
	local sine = 0
	local change = 1
	local grabbed = false
	local cn = CFrame.new
	local mr = math.rad
	local angles = CFrame.Angles
	local ud = UDim2.new
	local c3 = Color3.new
	local cf = CFrame.new
	local RHCF = CFrame.fromEulerAnglesXYZ(0, 1.6, 0)
	local LHCF = (CFrame.fromEulerAnglesXYZ(0, -1.6, 0))
	local color1 = "Really blue"
	local color2 = "Pastel Blue"
	local oplevel = 1
	local overheat = 0
	local selectfire = 1
	local semidelay = 0
	Humanoid.Animator.Parent = nil
	Character.Animate.Parent = nil
	local newFakeMotor = function(part0, part1, c0, c1)
	
	local w = Instance.new("Motor", part0)
	w.Part0 = part0
	w.Part1 = part1
	w.C0 = c0
	w.C1 = c1
	return w
end

	clerp = function(a, b, t)
	
	return a:lerp(b, t)
end

	RootCF = CFrame.fromEulerAnglesXYZ(-1.57, 0, 3.14)
	NeckCF = CFrame.new(0, 1, 0, -1, 0, 0, 0, 0, 1, 0, 1, 0)
	local RW = newFakeMotor(Torso, RightArm, CFrame.new(1.5, 0, 0), CFrame.new(0, 0, 0))
	local LW = newFakeMotor(Torso, LeftArm, CFrame.new(-1.5, 0, 0), CFrame.new(0, 0, 0))
	local RH = newFakeMotor(Torso, RightLeg, CFrame.new(0.5, -2, 0), CFrame.new(0, 0, 0))
	local LH = newFakeMotor(Torso, LeftLeg, CFrame.new(-0.5, -2, 0), CFrame.new(0, 0, 0))
	RootJoint.C1 = CFrame.new(0, 0, 0)
	RootJoint.C0 = CFrame.new(0, 0, 0)
	Torso.Neck.C1 = CFrame.new(0, 0, 0)
	Torso.Neck.C0 = CFrame.new(0, 1.5, 0)
	local rarmc1 = RW.C1
	local larmc1 = LW.C1
	local rlegc1 = RH.C1
	local llegc1 = LH.C1
	local resetc1 = false
	PlayAnimationFromTable = function(table, speed, bool)
	
	RootJoint.C0 = clerp(RootJoint.C0, table[1], speed)
	Torso.Neck.C0 = clerp(Torso.Neck.C0, table[2], speed)
	RW.C0 = clerp(RW.C0, table[3], speed)
	LW.C0 = clerp(LW.C0, table[4], speed)
	RH.C0 = clerp(RH.C0, table[5], speed)
	LH.C0 = clerp(LH.C0, table[6], speed)
	if bool == true and resetc1 == false then
		resetc1 = true
		RootJoint.C1 = RootJoint.C1
		Torso.Neck.C1 = Torso.Neck.C1
		RW.C1 = rarmc1
		LW.C1 = larmc1
		RH.C1 = rlegc1
		LH.C1 = llegc1
	end
end

	ArtificialHB = Instance.new("BindableEvent", Player.PlayerGui)
	ArtificialHB.Name = "Heartbeat"
	Player.PlayerGui:WaitForChild("Heartbeat")
	frame = 0.033333333333333
	tf = 0
	allowframeloss = false
	tossremainder = false
	lastframe = tick()
	Player.PlayerGui.Heartbeat:Fire()
	local gg = false
	game:GetService("RunService").Heartbeat:connect(function(s, p)
	
	if Player.PlayerGui:FindFirstChild("Heartbeat") == nil then
		gg = true
	end
	if gg == true then
		return 
	end
	tf = tf + s
	if frame <= tf then
		if allowframeloss then
			Player.PlayerGui.Heartbeat:Fire()
			lastframe = tick()
		else
			for i = 1, math.floor(tf / frame) do
				Player.PlayerGui.Heartbeat:Fire()
			end
			lastframe = tick()
		end
		if tossremainder then
			tf = 0
		else
			tf = tf - frame * math.floor(tf / frame)
		end
	end
end
)
	swait = function(num)
	
	if num == 0 or num == nil then
		ArtificialHB.Event:wait()
	else
		for i = 0, num do
			ArtificialHB.Event:wait()
		end
	end
end

	local RbxUtility = LoadLibrary("RbxUtility")
	local Create = RbxUtility.Create
	RemoveOutlines = function(part)
	
	part.TopSurface = 10
end

	local co1 = 72
	local co2 = 20
	local co3 = 30
	local co4 = 30
	local co5 = 100
	local co6 = 1
	local cooldown1 = 72
	local cooldown2 = 20
	local cooldown3 = 30
	local cooldown4 = 30
	local cooldown5 = 100
	local cooldown6 = 0
	local skillcolorscheme = BrickColor.new("Pastel Blue").Color
	local scrn = Instance.new("ScreenGui", Player.PlayerGui)
	makeframe = function(par, trans, pos, size, color)
	
	local frame = Instance.new("Frame", par)
	frame.BackgroundTransparency = trans
	frame.BorderSizePixel = 0
	frame.Position = pos
	frame.Size = size
	frame.BackgroundColor3 = color
	return frame
end

	makelabel = function(par, text)
	
	local label = Instance.new("TextLabel", par)
	label.BackgroundTransparency = 1
	label.Size = UDim2.new(1, 0, 1, 0)
	label.Position = UDim2.new(0, 0, 0, 0)
	label.TextColor3 = Color3.new(255, 255, 255)
	label.TextStrokeTransparency = 0
	label.FontSize = Enum.FontSize.Size32
	label.Font = Enum.Font.SourceSansLight
	label.BorderSizePixel = 0
	label.TextScaled = true
	label.Text = text
end

	framesk1 = makeframe(scrn, 0.5, UDim2.new(0.05, 0, 0.795, 0), UDim2.new(0.3, 0, 0.1, 0), skillcolorscheme)
	framesk2 = makeframe(scrn, 1, UDim2.new(0.355, 0, 0.795, 0), UDim2.new(0.3, 0, 0.1, 0), skillcolorscheme)
	framesk3 = makeframe(scrn, 1, UDim2.new(0355, 0, 0.795, 0), UDim2.new(0.16, 0, 0.1, 0), skillcolorscheme)
	framesk4 = makeframe(scrn, 0.5, UDim2.new(.355, 0, 0.795, 0), UDim2.new(0.605, 0, 0.1, 0), skillcolorscheme)
	framesk5 = makeframe(scrn, 0.5, UDim2.new(.05, 0, 0.9, 0), UDim2.new(0.91, 0, 0.1, 0), skillcolorscheme)
	framesk6 = makeframe(scrn, 0.5, UDim2.new(.05, 0, 0.585, 0), UDim2.new(0.25, 0, 0.1, 0), skillcolorscheme) 
	framesk7 = makeframe(scrn, 0.5, UDim2.new(.05, 0, 0.690, 0), UDim2.new(0.25, 0, 0.1, 0), skillcolorscheme) 
	bar1 = makeframe(framesk1, 0, UDim2.new(0, 0, 0, 0), UDim2.new(1, 0, 1, 0), skillcolorscheme)
	bar2 = makeframe(framesk2, 1, UDim2.new(0, 0, 0, 0), UDim2.new(1, 0, 1, 0), skillcolorscheme)
	bar3 = makeframe(framesk3, 1, UDim2.new(0, 0, 0, 0), UDim2.new(1, 0, 1, 0), skillcolorscheme)
	bar4 = makeframe(framesk4, 0, UDim2.new(0, 0, 0, 0), UDim2.new(1, 0, 1, 0), skillcolorscheme)
	bar5 = makeframe(framesk5, 0, UDim2.new(0, 0, 0, 0), UDim2.new(1, 0, 1, 0), skillcolorscheme)
	bar6 = makeframe(framesk6, 0, UDim2.new(0, 0, 0, 0), UDim2.new(1, 0, 1, 0), skillcolorscheme)
	text1 = Instance.new("TextLabel", framesk1)
	text1.BackgroundTransparency = 1
	text1.Size = UDim2.new(1, 0, 1, 0)
	text1.Position = UDim2.new(0, 0, 0, 0)
	text1.TextColor3 = Color3.new(255, 255, 255)
	text1.TextStrokeTransparency = 0
	text1.FontSize = Enum.FontSize.Size18
	text1.Font = Enum.Font.SourceSansLight
	text1.BorderSizePixel = 0
	text1.TextScaled = true
	text1.Text = "[Z]\n N/A"
	text2 = Instance.new("TextLabel", framesk2)
	text2.BackgroundTransparency = 1
	text2.Size = UDim2.new(1, 0, 1, 0)
	text2.Position = UDim2.new(0, 0, 0, 0)
	text2.TextColor3 = Color3.new(255, 255, 255)
	text2.TextStrokeTransparency = 0
	text2.FontSize = Enum.FontSize.Size18
	text2.Font = Enum.Font.SourceSansLight
	text2.BorderSizePixel = 0
	text2.TextScaled = true
	text2.Text = "  "
	text3 = Instance.new("TextLabel", framesk3)
	text3.BackgroundTransparency = 1
	text3.Size = UDim2.new(1, 0, 1, 0)
	text3.Position = UDim2.new(0, 0, 0, 0)
	text3.TextColor3 = Color3.new(255, 255, 255)
	text3.TextStrokeTransparency = 0
	text3.FontSize = Enum.FontSize.Size18
	text3.Font = Enum.Font.SourceSansLight
	text3.BorderSizePixel = 0
	text3.TextScaled = true
	text3.Text = "[C]\n nil"
	text4 = Instance.new("TextLabel", framesk4)
	text4.BackgroundTransparency = 1
	text4.Size = UDim2.new(1, 0, 1, 0)
	text4.Position = UDim2.new(0, 0, 0, 0)
	text4.TextColor3 = Color3.new(255, 255, 255)
	text4.TextStrokeTransparency = 0
	text4.FontSize = Enum.FontSize.Size18
	text4.Font = Enum.Font.SourceSansLight
	text4.BorderSizePixel = 0
	text4.TextScaled = true
	text4.Text = "[C]\n Omega"
	text5 = Instance.new("TextLabel", framesk5)
	text5.BackgroundTransparency = 1
	text5.Size = UDim2.new(1, 0, 1, 0)
	text5.Position = UDim2.new(0, 0, 0, 0)
	text5.TextColor3 = Color3.new(255, 255, 255)
	text5.TextStrokeTransparency = 0
	text5.FontSize = Enum.FontSize.Size18
	text5.Font = Enum.Font.SourceSansLight
	text5.BorderSizePixel = 0
	text5.TextScaled = true
	text5.Text = "Accuracy"
	text6 = Instance.new("TextLabel", framesk6)
	text6.BackgroundTransparency = 1
	text6.Size = UDim2.new(1, 0, 1, 0)
	text6.Position = UDim2.new(0, 0, 0, 0)
	text6.TextColor3 = Color3.new(255, 255, 255)
	text6.TextStrokeTransparency = 0
	text6.FontSize = Enum.FontSize.Size18
	text6.Font = Enum.Font.SourceSansLight
	text6.BorderSizePixel = 0
	text6.TextScaled = true
	text6.Text = "[V] select fire : auto"
	text7 = Instance.new("TextLabel", framesk7)
	text7.BackgroundTransparency = 1
	text7.Size = UDim2.new(1, 0, 1, 0)
	text7.Position = UDim2.new(0, 0, 0, 0)
	text7.TextColor3 = Color3.new(255, 255, 255)
	text7.TextStrokeTransparency = 0
	text7.FontSize = Enum.FontSize.Size18
	text7.Font = Enum.Font.SourceSansLight
	text7.BorderSizePixel = 0
	text7.TextScaled = true
	text7.Text = "Damage = ??"
	CreatePart = function(Parent, Material, Reflectance, Transparency, BColor, Name, Size)
	
	local Part = Create("Part")({Parent = Parent, Reflectance = Reflectance, Transparency = Transparency, CanCollide = false, Locked = true, BrickColor = BrickColor.new(tostring(BColor)), Name = Name, Size = Size, Material = Material})
	RemoveOutlines(Part)
	return Part
end

	CreateMesh = function(Mesh, Part, MeshType, MeshId, OffSet, Scale)
	
	local Msh = Create(Mesh)({Parent = Part, Offset = OffSet, Scale = Scale})
	if Mesh == "SpecialMesh" then
		Msh.MeshType = MeshType
		Msh.MeshId = MeshId
	end
	return Msh
end

	CreateWeld = function(Parent, Part0, Part1, C0, C1)
	
	local Weld = Create("Weld")({Parent = Parent, Part0 = Part0, Part1 = Part1, C0 = C0, C1 = C1})
	return Weld
end

	CFuncs = {
Part = {Create = function(Parent, Material, Reflectance, Transparency, BColor, Name, Size)
	
	local Part = Create("Part")({Parent = Parent, Reflectance = Reflectance, Transparency = Transparency, CanCollide = false, Locked = true, BrickColor = BrickColor.new(tostring(BColor)), Name = Name, Size = Size, Material = Material})
	RemoveOutlines(Part)
	return Part
end
}
, 
Mesh = {Create = function(Mesh, Part, MeshType, MeshId, OffSet, Scale)
	
	local Msh = Create(Mesh)({Parent = Part, Offset = OffSet, Scale = Scale})
	if Mesh == "SpecialMesh" then
		Msh.MeshType = MeshType
		Msh.MeshId = MeshId
	end
	return Msh
end
}
, 
Mesh = {Create = function(Mesh, Part, MeshType, MeshId, OffSet, Scale)
	
	local Msh = Create(Mesh)({Parent = Part, Offset = OffSet, Scale = Scale})
	if Mesh == "SpecialMesh" then
		Msh.MeshType = MeshType
		Msh.MeshId = MeshId
	end
	return Msh
end
}
, 
Weld = {Create = function(Parent, Part0, Part1, C0, C1)
	
	local Weld = Create("Weld")({Parent = Parent, Part0 = Part0, Part1 = Part1, C0 = C0, C1 = C1})
	return Weld
end
}
, 
Sound = {Create = function(id, par, vol, pit)
	
	coroutine.resume(coroutine.create(function()
		
		local S = Create("Sound")({Volume = vol, Pitch = pit or 1, SoundId = id, Parent = par or workspace})
		wait()
		S:play()
		game:GetService("Debris"):AddItem(S, 6)
	end
))
end
}
, 
ParticleEmitter = {Create = function(Parent, Color1, Color2, LightEmission, Size, Texture, Transparency, ZOffset, Accel, Drag, LockedToPart, VelocityInheritance, EmissionDirection, Enabled, LifeTime, Rate, Rotation, RotSpeed, Speed, VelocitySpread)
	
	local fp = Create("ParticleEmitter")({Parent = Parent, Color = ColorSequence.new(Color1, Color2), LightEmission = LightEmission, Size = Size, Texture = Texture, Transparency = Transparency, ZOffset = ZOffset, Acceleration = Accel, Drag = Drag, LockedToPart = LockedToPart, VelocityInheritance = VelocityInheritance, EmissionDirection = EmissionDirection, Enabled = Enabled, Lifetime = LifeTime, Rate = Rate, Rotation = Rotation, RotSpeed = RotSpeed, Speed = Speed, VelocitySpread = VelocitySpread})
	return fp
end
}
}
	Handle = CreatePart(m, Enum.Material.Plastic, 0, 1, "Black", "FakeHandle", Vector3.new(0.210000008, 0.690000117, 0.280000001))
	HandleWeld = CreateWeld(m, Character["Right Arm"], Handle, CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1), CFrame.new(-1.09519327, -0.237398148, 0.0399169922, 0, -1, 0, 0, 0, -1, 1, 0, 0))
	FakeHandle = CreatePart(m, Enum.Material.Plastic, 0, 1, "Black", "FakeHandle", Vector3.new(0.210000008, 0.690000117, 0.280000001))
	FakeHandleWeld = CreateWeld(m, Handle, FakeHandle, CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1), CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1))
	Motor = CreatePart(m, Enum.Material.SmoothPlastic, 0, 1, "Black", "Motor", Vector3.new(0.50999999, 0.430000126, 0.460000008))
	MotorWeld = CreateWeld(m, FakeHandle, Motor, CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1), CFrame.new(-0.565002441, 0, -0.155000687, 0, 1, 0, 0, 0, 1, 1, 0, 0))
	CreateMesh("CylinderMesh", Motor, "", "", Vector3.new(0, 0, 0), Vector3.new(1, 1, 1))
	Guhn = CreatePart(m, Enum.Material.Ice, 0, 0, "Bright blue", "Guhn", Vector3.new(4,.8,.6))
	GuhnWeld = CreateWeld(m, Handle, Guhn, CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1), CFrame.new(-1, 0, -.4, 1, 0, 0, 0, 1, 0, 0, 0, 1))
	Barrel = CreatePart(m, Enum.Material.Plastic, 0, 0, "Really black", "Barrel", Vector3.new(0.200000003, 0.290000021, 0.420000017))
	BarrelWeld = CreateWeld(m, Guhn, Barrel, CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1), CFrame.new(-2,0,0, 1, 0, 0, 0, -1, 0, 0, 0, -1))
	CreateMesh("BlockMesh", Barrel, "", "", Vector3.new(0, 0, 0), Vector3.new(1, 1, 1))	
	Part = CreatePart(m, Enum.Material.Plastic, 0, 0, "Black", "Hitbox", Vector3.new(.3, 1.00000003, 0.3))
	Part = CreateWeld(m, Guhn, Part, CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1), CFrame.new(1.09000206, .5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1))
	Hitbox = CreatePart(m, Enum.Material.Plastic, 0, 1, "Black", "Hitbox", Vector3.new(4,.8,.6))
	HitboxWeld = CreateWeld(m, Guhn, Hitbox, CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1), CFrame.new(0,0,0, 1, 0, 0, 0, 1, 0, 0, 0, 1))	
	FakeMotor = CreatePart(m, Enum.Material.Metal, 0.20000000298023, 1, "Medium stone grey", "Part", Vector3.new(1.60000002, 5.46000004, 1.48000002))
	FakeMotorWeld = CreateWeld(m, Motor, FakeMotor, CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1), CFrame.new(0, 0, 0, 1.00000012, 2.98023224e-08, 0, 2.98023224e-08, 1.00000012, 0, 0, 0, 1))
	FakeMag = CreatePart(m, Enum.Material.Plastic, 0, 1, "Black", "Hitbox", Vector3.new(1.2, .3, 0.3))
	FakeMagWeld = CreateWeld(m, Character["Left Arm"], FakeMag, CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1), CFrame.new(-0.5, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1))
	Mag = CreatePart(m, Enum.Material.Plastic, 0, 0, "Black", "Hitbox", Vector3.new(.3, .3, 1.2))
	MagWeld = CreateWeld(m, Guhn, Mag, CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1), CFrame.new(-1.4, 0, .7, 1, 0, 0, 0, 1, 0, 0, 0, 1))
	Part2 = CreatePart(m, Enum.Material.Plastic, 0, 0, "Black", "Hitbox", Vector3.new(.3, .85,.65))
	Part2 = CreateWeld(m, Guhn, Part2, CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1), CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1))
	Part3 = CreatePart(m, Enum.Material.Plastic, 0, 0, "Black", "Hitbox", Vector3.new(1.5, .3,.65))
	Part3 = CreateWeld(m, Guhn, Part3, CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1), CFrame.new(-1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1))
	Part4 = CreatePart(m, Enum.Material.Plastic, 0, 0, "Black", "Hitbox", Vector3.new(1.5, .3,.65))
	Part4 = CreateWeld(m, Guhn, Part4, CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1), CFrame.new(1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1))
	
	
	rayCast = function(Position, Direction, Range, Ignore)
	
	return game:service("Workspace"):FindPartOnRay(Ray.new(Position, Direction.unit * (Range or 999.999)), Ignore)
end

	local GetNearest = function(obj, distance)
	
	local last, lastx = distance + 1, nil
	for i,v in pairs(workspace:GetChildren()) do
		if v:IsA("Model") and v ~= Character and v:findFirstChild("Humanoid") and v:findFirstChild("Torso") and v:findFirstChild("Humanoid").Health > 0 then
			local t = v.Torso
			local dist = (t.Position - obj.Position).magnitude
			if dist <= distance and dist < last then
				last = dist
				lastx = v
			end
		end
	end
	return lastx
end

	Damagefunc = function(Part, hit, minim, maxim, knockback, Type, Property, Delay, HitSound, HitPitch)
	
	if hit.Parent == nil then
		return 
	end
	local h = hit.Parent:FindFirstChild("Humanoid")
	for _,v in pairs(hit.Parent:children()) do
		if v:IsA("Humanoid") then
			h = v
		end
	end
	if h ~= nil and hit.Parent.Name ~= Character.Name and hit.Parent:FindFirstChild("Torso") ~= nil then
		if hit.Parent:findFirstChild("DebounceHit") ~= nil and hit.Parent.DebounceHit.Value == true then
			return 
		end
		local c = Create("ObjectValue")({Name = "creator", Value = game:service("Players").LocalPlayer, Parent = h})
		game:GetService("Debris"):AddItem(c, 0.5)
		if HitSound ~= nil and HitPitch ~= nil then
		end
		local Damage = math.random(minim, maxim)
		local blocked = false
		local block = hit.Parent:findFirstChild("Block")
		if block ~= nil and block.className == "IntValue" and block.Value > 0 then
			blocked = true
			block.Value = block.Value - 1
			print(block.Value)
		end
		if blocked == false then
			h.MaxHealth = 100
			h.Health = h.Health - Damage
			ShowDamage(Part.CFrame * CFrame.new(0, 0, Part.Size.Z / 2).p + Vector3.new(0, 1.5, 0), -(Damage), 1.5, Part.BrickColor.Color)
		else
			h.Health = h.Health - Damage / 2
			ShowDamage(Part.CFrame * CFrame.new(0, 0, Part.Size.Z / 2).p + Vector3.new(0, 1.5, 0), -(Damage), 1.5, Part.BrickColor.Color)
		end
		if Type == "Knockdown" then
			local hum = hit.Parent.Humanoid
			hum.PlatformStand = true
			coroutine.resume(coroutine.create(function(HHumanoid)
		
		swait(1)
		HHumanoid.PlatformStand = false
	end
), hum)
			local angle = hit.Position - (Property.Position + Vector3.new(0, 0, 0)).unit
			local bodvol = Create("BodyVelocity")({velocity = angle * knockback, P = 5000, maxForce = Vector3.new(8000, 8000, 8000), Parent = hit})
			local rl = Create("BodyAngularVelocity")({P = 3000, maxTorque = Vector3.new(500000, 500000, 500000) * 50000000000000, angularvelocity = Vector3.new(math.random(-10, 10), math.random(-10, 10), math.random(-10, 10)), Parent = hit})
			game:GetService("Debris"):AddItem(bodvol, 0.5)
			game:GetService("Debris"):AddItem(rl, 0.5)
		elseif Type == "Normal" then
					local vp = Create("BodyVelocity")({P = 500, maxForce = Vector3.new(math.huge, 0, math.huge), velocity = Property.CFrame.lookVector * knockback + Property.Velocity / 1.05})
					if knockback > 0 then
						vp.Parent = hit.Parent.Torso
					end
					game:GetService("Debris"):AddItem(vp, 0.5)
				elseif Type == "Up" then
							local bodyVelocity = Create("BodyVelocity")({velocity = Vector3.new(0, 20, 0), P = 5000, maxForce = Vector3.new(8000, 8000, 8000), Parent = hit})
							game:GetService("Debris"):AddItem(bodyVelocity, 0.5)
						elseif Type == "DarkUp" then
									coroutine.resume(coroutine.create(function()
		
		for i = 0, 1, 0.1 do
			swait()
			BlockEffect(BrickColor.new("Black"), hit.Parent.Torso.CFrame, 5, 5, 5, 1, 1, 1, 0.08, 1)
			local bodyVelocity = Create("BodyVelocity")({velocity = Vector3.new(0, 40, 0), P = 5000, maxForce = Vector3.new(8000, 8000, 8000), Parent = hit})
			game:GetService("Debris"):AddItem(bodyVelocity, 1)
		end
	end
))
									local bodyVelocity = Create("BodyVelocity")({velocity = Vector3.new(0, 40, 0), P = 5000, maxForce = Vector3.new(8000, 8000, 8000), Parent = hit})
									game:GetService("Debris"):AddItem(bodyVelocity, 1)
								elseif Type == "Snare" then
											local bp = Create("BodyPosition")({P = 2000, D = 100, maxForce = Vector3.new(math.huge, math.huge, math.huge), position = hit.Parent.Torso.Position, Parent = hit.Parent.Torso})
											game:GetService("Debris"):AddItem(bp, 1)
										elseif Type == "Curse" then
													CreateSound("http://roblox.com/asset/?id=283389706", Torso, 1, 1)
													for i = 0, 1, 0.025 do
														swait(30)
														SphereEffect(BrickColor.new("Bright violet"), hit.Parent.Torso.CFrame, 1, 1, 1, 3, 3, 3, 0.07)
														hit.Parent.Humanoid:TakeDamage(1)
													end
												elseif Type == "Freeze" then
															local BodPos = Create("BodyPosition")({P = 50000, D = 1000, maxForce = Vector3.new(math.huge, math.huge, math.huge), position = hit.Parent.Torso.Position, Parent = hit.Parent.Torso})
															local BodGy = Create("BodyGyro")({maxTorque = Vector3.new(400000, 400000, 400000) * math.huge, P = 20000, Parent = hit.Parent.Torso, cframe = hit.Parent.Torso.CFrame})
															hit.Parent.Torso.Anchored = true
															coroutine.resume(coroutine.create(function(Part)
		
		swait(1.5)
		Part.Anchored = false
	end
), hit.Parent.Torso)
															game:GetService("Debris"):AddItem(BodPos, 6)
															game:GetService("Debris"):AddItem(BodGy, 6)
														end
															local debounce = Create("BoolValue")({Name = "DebounceHit", Parent = hit.Parent, Value = true})
															game:GetService("Debris"):AddItem(debounce, Delay)
															c = Instance.new("ObjectValue")
															c.Name = "creator"
															c.Value = Player
															c.Parent = h
															game:GetService("Debris"):AddItem(c, 0.5)
														end
													end

	ShowDamage = function(Pos, Text, Time, Color)
	
	local Rate = 0.033333333333333
	if not Pos then
		local Pos = Vector3.new(0, 0, 0)
	end
	local Text = Text or ""
	local Time = Time or 2
	if not Color then
		local Color = Color3.new(1, 0, 1)
	end
	local EffectPart = CreatePart(workspace, "SmoothPlastic", 0, 1, BrickColor.new(Color), "Effect", Vector3.new(0, 0, 0))
	EffectPart.Anchored = true
	local BillboardGui = Create("BillboardGui")({Size = UDim2.new(3, 0, 3, 0), Adornee = EffectPart, Parent = EffectPart})
	local TextLabel = Create("TextLabel")({BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0), Text = Text, TextColor3 = Color, TextScaled = true, Font = Enum.Font.ArialBold, Parent = BillboardGui})
	game.Debris:AddItem(EffectPart, Time + 0.1)
	EffectPart.Parent = game:GetService("Workspace")
	delay(0, function()
		
		local Frames = Time / Rate
		for Frame = 1, Frames do
			wait(Rate)
			local Percent = Frame / Frames
			EffectPart.CFrame = CFrame.new(Pos) + Vector3.new(0, Percent, 0)
			TextLabel.TextTransparency = Percent
		end
		if EffectPart and EffectPart.Parent then
			EffectPart:Destroy()
		end
	end
)
end

	MagniDamage = function(Part, magni, mindam, maxdam, knock, Type)
	
	for _,c in pairs(workspace:children()) do
		local hum = c:findFirstChild("Humanoid")
		if hum ~= nil then
			local head = c:findFirstChild("Torso")
			if head ~= nil then
				local targ = head.Position - Part.Position
				local mag = targ.magnitude
				if mag <= magni and c.Name ~= Player.Name then
					Damagefunc(head, head, mindam, maxdam, knock, Type, RootPart, 0.1, "http://www.roblox.com/asset/?id=160432334", 1)
				end
			end
		end
	end
end

	EffectModel = Instance.new("Model", Character)
	EffectModel.Name = "Effects"
	Effects = {
Block = {Create = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay, Type)
	
	local prt = CFuncs.Part.Create(EffectModel, "SmoothPlastic", 0, 0, brickcolor, "Effect", Vector3.new())
	prt.Anchored = true
	prt.CFrame = cframe
	local msh = CFuncs.Mesh.Create("BlockMesh", prt, "", "", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
	game:GetService("Debris"):AddItem(prt, 10)
	if Type == 1 or Type == nil then
		table.insert(Effects, {prt, "Block1", delay, x3, y3, z3, msh})
	else
		if Type == 2 then
			table.insert(Effects, {prt, "Block2", delay, x3, y3, z3, msh})
		end
	end
end
}
, 
Sphere = {Create = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
	
	local prt = CFuncs.Part.Create(EffectModel, "SmoothPlastic", 0, 0, brickcolor, "Effect", Vector3.new())
	prt.Anchored = true
	prt.CFrame = cframe
	local msh = CFuncs.Mesh.Create("SpecialMesh", prt, "Sphere", "", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
	game:GetService("Debris"):AddItem(prt, 10)
	table.insert(Effects, {prt, "Cylinder", delay, x3, y3, z3, msh})
end
}
, 
Ring = {Create = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
	
	local prt = CFuncs.Part.Create(EffectModel, "Neon", 0, 0, brickcolor, "Effect", Vector3.new())
	prt.Anchored = true
	prt.CFrame = cframe
	local msh = CFuncs.Mesh.Create("CylinderMesh", prt, "", "", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
	game:GetService("Debris"):AddItem(prt, 10)
	table.insert(Effects, {prt, "Cylinder", delay, x3, y3, z3, msh})
end
}
, 
Cloud = {Create = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
	
	local prt = CFuncs.Part.Create(EffectModel, "SmoothPlastic", 0, 0, brickcolor, "Effect", Vector3.new())
	prt.Anchored = true
	prt.CFrame = cframe
	local msh = CFuncs.Mesh.Create("SpecialMesh", prt, "FileMesh", "rbxassetid://1095708", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
	game:GetService("Debris"):AddItem(prt, 10)
	table.insert(Effects, {prt, "Cylinder", delay, x3, y3, z3, msh})
end
}
, 
Wave = {Create = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
	
	local prt = CFuncs.Part.Create(EffectModel, "SmoothPlastic", 0, 0, brickcolor, "Effect", Vector3.new())
	prt.Anchored = true
	prt.CFrame = cframe
	local msh = CFuncs.Mesh.Create("SpecialMesh", prt, "FileMesh", "rbxassetid://20329976", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
	game:GetService("Debris"):AddItem(prt, 10)
	table.insert(Effects, {prt, "Cylinder", delay, x3, y3, z3, msh})
end
}
, 
Break = {Create = function(brickcolor, cframe, x1, y1, z1)
	
	local prt = CFuncs.Part.Create(EffectModel, "SmoothPlastic", 0, 0, brickcolor, "Effect", Vector3.new(0.5, 0.5, 0.5))
	prt.Anchored = true
	prt.CFrame = cframe * CFrame.fromEulerAnglesXYZ(math.random(-50, 50), math.random(-50, 50), math.random(-50, 50))
	local msh = CFuncs.Mesh.Create("SpecialMesh", prt, "Sphere", "", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
	local num = math.random(10, 50) / 1000
	game:GetService("Debris"):AddItem(prt, 10)
	table.insert(Effects, {prt, "Shatter", num, prt.CFrame, math.random() - math.random(), 0, math.random(50, 100) / 100})
end
}
}
	local rev = Instance.new("Sound", Barrel)
	rev.Volume = 0.05
	rev.Pitch = 1.2
	rev.Looped = false
	rev.SoundId = "rbxassetid://357820124"
	rev.MaxDistance = 1000
	local spim = Instance.new("Sound", Barrel)
	spim.Volume = 1
	spim.Pitch = 1
	spim.Looped = true
	spim.SoundId = "rbxassetid://167882734"
	spim.MaxDistance = 1000
	local aiming = false
	local nu = 0
	Aim = function()
	
	aiming = true
	attack = true
	Humanoid.WalkSpeed = 2
	Humanoid.JumpPower = 0
	while aiming do
		swait()
		if rev.Playing == false and spim.Playing == false then
		end
		if nu < 360 then
			nu = nu + 20
		else
			nu = 0
		end
		FakeMotorWeld.C0 = clerp(FakeMotorWeld.C0, CFrame.new(0, 0, 0) * angles(math.rad(0), math.rad(nu), math.rad(0)), 0.3)
	end
end

	Laser = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
	
	local prt = CreatePart(EffectModel, "Neon", 0, 0, brickcolor, "Effect", Vector3.new(0.5, 0.5, 0.5))
	prt.Anchored = true
	prt.CFrame = cframe
	prt.Material = "Neon"
	local msh = CreateMesh("CylinderMesh", prt, "", "", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
	game:GetService("Debris"):AddItem(prt, 10)
	coroutine.resume(coroutine.create(function(Part, Mesh)
		
		for i = 0, 1, delay do
			swait()
			Part.Transparency = i
			Mesh.Scale = Mesh.Scale + Vector3.new(x3, y3, z3)
		end
		Part.Parent = nil
	end
), prt, msh)
end

	BlockEffect = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay, Type)
	
	local prt = CreatePart(EffectModel, "Neon", 0, 0, brickcolor, "Effect", Vector3.new())
	prt.Anchored = true
	prt.CFrame = cframe
	prt.Material = "neon"
	local msh = CreateMesh("BlockMesh", prt, "", "", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
	game:GetService("Debris"):AddItem(prt, 10)
	if Type == 1 or Type == nil then
		table.insert(Effects, {prt, "Block1", delay, x3, y3, z3, msh})
	else
		if Type == 2 then
			table.insert(Effects, {prt, "Block2", delay, x3, y3, z3, msh})
		end
	end
end

	shoottraildd = function(mouse, partt, SpreadAmount)
	
	local SpreadVectors = Vector3.new(math.random(-SpreadAmount, SpreadAmount), math.random(-SpreadAmount, SpreadAmount), math.random(-SpreadAmount, SpreadAmount))
	local MainPos = partt.Position
	local MainPos2 = mouse.Hit.p + SpreadVectors
	local MouseLook = CFrame.new((MainPos + MainPos2) / 2, MainPos2)
	local speed = 10
	local num = 100
	local dermage = (co1 / cooldown1 + 1)
	local maybe = selectfire
	coroutine.resume(coroutine.create(function()
		
		repeat
			swait()
			SpreadVectors = SpreadVectors - Vector3.new(0.05,0.05,0.05)
			MainPos2 = mouse.Hit.p + SpreadVectors
			MouseLook = CFrame.new((MainPos + MainPos2) / 2, MainPos2)
			local hit, pos = rayCast(MainPos, MouseLook.lookVector, speed, RootPart.Parent)
			local mag = (MainPos - pos).magnitude
			Laser(BrickColor.new(color1), CFrame.new((MainPos + pos) / 2, pos) * angles(1.57, 0, 0), 1, mag * (speed / (speed / 2)), 1, -0.25, 0, -0.25, 0.15)
			MainPos = MainPos + MouseLook.lookVector * speed
			num = num - 1
			MouseLook = MouseLook * angles(math.rad(0), 0, 0)
			if hit ~= nil then
				num = 0
				local refpart = CreatePart(EffectModel, "SmoothPlastic", 0, 1, BrickColor.new("Really black"), "Effect", Vector3.new())
				refpart.Anchored = true
				refpart.CFrame = CFrame.new(pos)
				game:GetService("Debris"):AddItem(refpart, 1)
			end
			do
				if num <= 0 then
					local refpart2 = CreatePart(EffectModel, "SmoothPlastic", 0, 1, BrickColor.new("Really black"), "Effect", Vector3.new())
					refpart2.Anchored = true
					refpart2.CFrame = CFrame.new(pos)
					game:GetService("Debris"):AddItem(refpart2, 1)
					if hit ~= nil then
						Effects.Block.Create(color1, refpart2.CFrame, 1,1,1,10,10,10,0.05)
						Effects.Block.Create(color2, refpart2.CFrame, 1, 1, 1, 25,2.5,2.5, 0.05)
						MagniDamage(refpart2, 5, 1  * dermage , 1  * dermage, 1, "Normal")
					end
				end
			end
		until num <= 0
	end
))
end

shoottraildd2 = function(mouse, partt, SpreadAmount)
	
	local SpreadVectors = Vector3.new(math.random(-SpreadAmount, SpreadAmount), math.random(-SpreadAmount, SpreadAmount), math.random(-SpreadAmount, SpreadAmount))
	local MainPos = partt.Position
	local MainPos2 = mouse.Hit.p + SpreadVectors
	local MouseLook = CFrame.new((MainPos + MainPos2) / 2, MainPos2)
	local speed = 100
	local num = 10
	coroutine.resume(coroutine.create(function()
		
		repeat
			swait()
			local hit, pos = rayCast(MainPos, MouseLook.lookVector, speed, RootPart.Parent)
			local mag = (MainPos - pos).magnitude
			Laser(BrickColor.new(color1), CFrame.new((MainPos + pos) / 2, pos) * angles(1.57, 0, 0), 1, mag * (speed / (speed / 2)), 1, -0.25, 0, -0.25, 0.15)
			MainPos = MainPos + MouseLook.lookVector * speed
			num = num - 1
			MouseLook = MouseLook * angles(math.rad(0), 0, 0)
			if hit ~= nil then
				num = 0
				local refpart = CreatePart(EffectModel, "SmoothPlastic", 0, 1, BrickColor.new("Really black"), "Effect", Vector3.new())
				refpart.Anchored = true
				refpart.CFrame = CFrame.new(pos)
				game:GetService("Debris"):AddItem(refpart, 1)
			end
			do
				if num <= 0 then
					local refpart2 = CreatePart(EffectModel, "SmoothPlastic", 0, 1, BrickColor.new("Really black"), "Effect", Vector3.new())
					refpart2.Anchored = true
					refpart2.CFrame = CFrame.new(pos)
					game:GetService("Debris"):AddItem(refpart2, 1)
					if hit ~= nil then
						MagniDamage(refpart2, 5, 1, 1, 1, "Normal")
						for i = 0,9,1 do
						Effects.Block.Create("Alder", refpart2.CFrame, 1, 1, 1, 2,2,2, 0.05)
						swait(5)
						end
						Effects.Block.Create("Royal purple", refpart2.CFrame, 1,1,1,10,10,10,0.05)
						Effects.Block.Create("Alder", refpart2.CFrame, 1, 1, 1, 25,2.5,2.5, 0.05)
						MagniDamage(refpart2, 15, 5, 5, 0, "Normal")
						for i = 9, 1 do
						hit.Parent.Humanoid.Health = hit.Parent.Humanoid.Health - 1
						swait(2)
						end
					end
				end
			end
		until num <= 0
	end
))
end

shoottraildd3 = function(mouse, partt, SpreadAmount)
	
	local SpreadVectors = Vector3.new(math.random(-SpreadAmount, SpreadAmount), math.random(-SpreadAmount, SpreadAmount), math.random(-SpreadAmount, SpreadAmount))
	local MainPos = partt.Position
	local MainPos2 = mouse.Hit.p + SpreadVectors
	local MouseLook = CFrame.new((MainPos + MainPos2) / 2, MainPos2)
	local speed = 100
	local num = 10
	coroutine.resume(coroutine.create(function()
		
		repeat
			swait()
			local hit, pos = rayCast(MainPos, MouseLook.lookVector, speed, RootPart.Parent)
			local mag = (MainPos - pos).magnitude
			Laser(BrickColor.new(color1), CFrame.new((MainPos + pos) / 2, pos) * angles(1.57, 0, 0), 1, mag * (speed / (speed / 2)), 1, -0.25, 0, -0.25, 0.15)
			MainPos = MainPos + MouseLook.lookVector * speed
			num = num - 1
			MouseLook = MouseLook * angles(math.rad(0), 0, 0)
			if hit ~= nil then
				num = 0
				local refpart = CreatePart(EffectModel, "SmoothPlastic", 0, 1, BrickColor.new("Really black"), "Effect", Vector3.new())
				refpart.Anchored = true
				refpart.CFrame = CFrame.new(pos)
				game:GetService("Debris"):AddItem(refpart, 1)
			end
			do
				if num <= 0 then
					local refpart2 = CreatePart(EffectModel, "SmoothPlastic", 0, 1, BrickColor.new("Really black"), "Effect", Vector3.new())
					refpart2.Anchored = true
					refpart2.CFrame = CFrame.new(pos)
					game:GetService("Debris"):AddItem(refpart2, 1)
					if hit ~= nil then
						MagniDamage(refpart2, 5, 1, 1, 1, "Normal")
						for i = 0,9,1 do
						Effects.Block.Create(color1, refpart2.CFrame, 1, 1, 1, 2,2,2, 0.05)
						swait(5)
						end
						Effects.Block.Create(color1, refpart2.CFrame, 1,1,1,10,10,10,0.05)
						Effects.Block.Create(color2, refpart2.CFrame, 1, 1, 1, 25,2.5,2.5, 0.05)
						MagniDamage(refpart2, 15, 1, 1, 1, "Normal")
					end
				end
			end
		until num <= 0
	end
))
end

	IceMortar = function()
	
	local dacf = Head.CFrame * angles(-1.57 + math.random(40, 80) / 100, 0, math.random(-80, 80) / 100)
	local icepart1 = CreatePart(EffectModel, "SmoothPlastic", 0, 1, BrickColor.new("Cyan"), "Ice", Vector3.new())
	icepart1.Anchored = true
	i1msh = CreateMesh("SpecialMesh", icepart1, "Sphere", "", Vector3.new(0, 0, 0), Vector3.new(5, 5, 5))
	icepart1.CFrame = dacf
	local cfinc = 99999
	icepart1.Transparency = 1
	CFuncs.Sound.Create("rbxassetid://192410089", icepart1, 1, 1)
	game:GetService("Debris"):AddItem(icepart1, 1)
	local spread = Vector3.new((math.random(-3, 30) + math.random()) * 16, (math.random(-1, 0) + math.random()) * 16, (math.random(-3, 3) + math.random()) * 16) * (icepart1.Position - (icepart1.Position + Vector3.new(0, -1, 0))).magnitude / 100
	local TheHit = mouse.Hit.p
	local MouseLook = cn((icepart1.Position + TheHit) / 2, TheHit + spread)
	local hit, pos = rayCast(icepart1.Position, MouseLook.lookVector, 999, Character)
	local target1, distance1 = rayCast(icepart1.Position, MouseLook.lookVector, 999, Character)
	local test1, dist1 = mouse.Hit.p, nil
	if target1 ~= nil then
		cfda = target1.Position + Vector3.new(math.random(-3000, 3000) / 100, 10, math.random(-3000, 3000) / 100)
		local hit2, pos2 = rayCast(icepart1.Position, MouseLook.lookVector, 999, Character)
		local d1 = CreatePart(EffectModel, "SmoothPlastic", 0, 1, BrickColor.new("Magenta"), "Effect", Vector3.new())
		d1.Anchored = true
		d1.CFrame = cn(pos2)
		MagniDamage(d1, 8, 3, 5, -10, "Normal")
		Effects.Sphere.Create(BrickColor.new("White"), Barrel.CFrame, 1, 1, 1, 3, 3, 3, 0.07)
		Effects.Sphere.Create(BrickColor.new("Bright yellow"), cn(pos2), 1, 1, 1, 3, 3, 3, 0.07)
		Effects.Block.Create(BrickColor.new("Bright red"), cn(pos2), 1, 1, 1, 3, 3, 3, 0.07)
		Effects.Sphere.Create(BrickColor.new("White"), cn(pos2), 1, 1, 1, 10, 10, 10, 0.07)
		Effects.Ring.Create(BrickColor.new("Bright yellow"), cn(pos2), 0.1, 9999, 0.1, 0.5, 10, 0.5, 0.07)
		game.Debris:AddItem(d1, 0.5)
	end
end

	Hee = function()
	
	local dacf = Head.CFrame * angles(-1.57 + math.random(40, 80) / 100, 0, math.random(-80, 80) / 100)
	local icepart1 = CreatePart(EffectModel, "SmoothPlastic", 0, 1, BrickColor.new("Cyan"), "Ice", Vector3.new())
	icepart1.Anchored = true
	i1msh = CreateMesh("SpecialMesh", icepart1, "Sphere", "", Vector3.new(0, 0, 0), Vector3.new(5, 5, 5))
	icepart1.CFrame = dacf
	local cfinc = 99999
	icepart1.Transparency = 1
	game:GetService("Debris"):AddItem(icepart1, 1)
	local spread = Vector3.new((math.random(-100, 100) + math.random()) * 16, (math.random(-1, 0) + math.random()) * 16, (math.random(-100, 100) + math.random()) * 16) * (icepart1.Position - (icepart1.Position + Vector3.new(0, -1, 0))).magnitude / 100
	local TheHit = Torso.position
	local MouseLook = cn((icepart1.Position + TheHit) / 2, TheHit + spread)
	local hit, pos = rayCast(icepart1.Position, MouseLook.lookVector, 999, Character)
	local target1, distance1 = rayCast(icepart1.Position, MouseLook.lookVector, 999, Character)
	local test1, dist1 = mouse.Hit.p, nil
	if target1 ~= nil then
		cfda = target1.Position + Vector3.new(math.random(-3000, 3000) / 100, 10, math.random(-3000, 3000) / 100)
		local hit2, pos2 = rayCast(icepart1.Position, MouseLook.lookVector, 999, Character)
		local d1 = CreatePart(EffectModel, "SmoothPlastic", 0, 1, BrickColor.new("Magenta"), "Effect", Vector3.new())
		d1.Anchored = true
		d1.CFrame = cn(pos2)
		for i = 0, 2 do
		MagniDamage(d1, 15, 3, 5, 0, "Normal")
		Effects.Block.Create(color1, cn(pos2), 1,1,1,20,20,20,0.05)
		Effects.Block.Create(color2, cn(pos2), 1, 1, 1, 40,2.5,2.5, 0.05)
		Effects.Ring.Create(BrickColor.new(color2), cn(pos2), 0.1, 9999, 0.1, 10, 60, 10, 0.07)
		game.Debris:AddItem(d1, 0.5)
		swait(.1)
		end
	end
end

	local soe = Instance.new("Sound", Barrel)
	soe.Volume = 0.25
	soe.Pitch = 1
	soe.Looped = true
	soe.SoundId = "rbxassetid://338565873"
	soe.MaxDistance = 1000
	local shoot = false
	local hot = false
	fire = function()
	
	hot = true
	shoot = true
	while shoot do
		while shoot do
			if shoot == true and selectfire == 1 then
				if cooldown1 < 1 then
				aiming = false
				shoot = false
				soe:Stop()
				reload()
				end
				swait(cooldown1 / 9.5)
				swait(1)
				if cooldown1 >= 1 then
					if overheat > 0 and oplevel == 1 then
					overheat = overheat - 0.66666
					end
					soe:Play()
					cooldown1 = cooldown1 - 1
					Effects.Block.Create(color1, Barrel.CFrame, 1,1,1,1,1,1,0.05)
					for i = 0, 2 do
					shoottraildd(mouse, Barrel, (1+overheat))
					end
				else
					soe:Stop()
					reload()
					aiming = false
				end
			end
		end
		swait(15)
		soe:Stop()
	end
	hot = false
end

	baka = function()
	
	attack = true
		IceMortar()
		for i = 0, 1, 0.5 do
			swait()
			PlayAnimationFromTable({CFrame.new(0, 0, 0, -0.335253149, 0.328955054, -0.882832885, 0.107930049, 0.944303334, 0.310873568, 0.935925424, 0.00893715583, -0.352084786), CFrame.new(-0.00419440866, 1.463902, 0.0260094106, 0.372635633, -0.266420603, 0.888911009, 0.176304489, 0.960780025, 0.214053184, -0.91107595, 0.0769551396, 0.404991925), CFrame.new(1.16062069, 1.21589506, -1.1315105, 0.461470664, 0.408944249, 0.787279725, 0.759406447, 0.276684046, -0.588853061, -0.458635807, 0.869603693, -0.182873294), CFrame.new(-1.1017859, 0.105088279, -0.580041945, 0.871761322, -0.489363998, -0.0235606134, 0.251738638, 0.48867017, -0.83536166, 0.420309335, 0.722304821, 0.549195588), CFrame.new(0.356478155, -1.8632127, -0.897590756, 0.318082392, -0.179918393, 0.930834651, 0.152005479, 0.978804231, 0.137247398, -0.935798109, 0.0978359506, 0.33868891), CFrame.new(-0.668343425, -1.97596669, -0.199289501, 0.642908812, 0.107930049, 0.758300424, 0.172217295, 0.944303334, -0.280414909, -0.746330738, 0.310873568, 0.588513494)}, 0.3, false)
		end
		FakeHandleWeld.C0 = clerp(FakeHandleWeld.C0, CFrame.new(0, 0, 0) * angles(math.rad(-40), math.rad(0), math.rad(-80)), 0.3)
	Humanoid.WalkSpeed = 14
	Humanoid.JumpPower = 50
	attack = false
	end
	
	bulletrain = function()
	
	attack = true
	shoot = true
	Humanoid.WalkSpeed = 2
	Humanoid.JumpPower = 0
	for i = 0, 1, 0.5 do
		swait()
		PlayAnimationFromTable({CFrame.new(-8.64267349e-07, -0.259999782, 0.509999871, 0.454838723, 0.207662866, -0.866024196, -0.415319771, 0.909675479, 2.65391373e-06, 0.787801504, 0.359675765, 0.500002146), CFrame.new(0.047690846, 1.37390435, -0.00346283242, 0.454838723, 0.0202630162, 0.890343308, 0.207662866, 0.969769061, -0.128156841, -0.866024196, 0.243181929, 0.436880678), CFrame.new(1.1759336, -0.214563698, -0.518012762, 0.694960654, 0.00311025977, -0.719041109, -0.715354204, -0.0982373655, -0.691822171, -0.0727884769, 0.995158195, -0.0660461485), CFrame.new(-0.00660583377, 0.722521007, -1.36138439, 0.0264981389, -0.398905575, 0.916609168, 0.381749183, -0.843399405, -0.378080904, 0.92388618, 0.359933168, 0.129933342), CFrame.new(0.993886769, -1.80155158, 0.41332227, 0.946233869, -0.168109909, -0.276370257, 0.32347101, 0.484278023, 0.812921524, -0.00282013416, -0.858611643, 0.512618959), CFrame.new(-0.795712531, -2.27605748, -0.675008774, 0.968845665, 0.247665286, -6.2584877e-07, -0.247665256, 0.968845665, -3.36766243e-06, -2.08616257e-07, 3.39746475e-06, 1)}, 0.3, false)
		FakeHandleWeld.C0 = clerp(FakeHandleWeld.C0, CFrame.new(0, 0, 0) * angles(math.rad(-40), math.rad(0), math.rad(-80)), 0.3)
	end
	soe:Play()
	for i = 1, 5 do
		for i = 0, 1, 0.5 do
			swait()
			PlayAnimationFromTable({CFrame.new(-8.64267349e-07, -0.259999782, 0.509999871, 0.454838723, 0.207662866, -0.866024196, -0.415319771, 0.909675479, 2.65391373e-06, 0.787801504, 0.359675765, 0.500002146), CFrame.new(0.047690846, 1.37390435, -0.00346283242, 0.454838723, 0.0202630162, 0.890343308, 0.207662866, 0.969769061, -0.128156841, -0.866024196, 0.243181929, 0.436880678), CFrame.new(1.1759336, -0.214563698, -0.518012762, 0.694960654, 0.00311025977, -0.719041109, -0.715354204, -0.0982373655, -0.691822171, -0.0727884769, 0.995158195, -0.0660461485), CFrame.new(-0.00660583377, 0.722521007, -1.36138439, 0.0264981389, -0.398905575, 0.916609168, 0.381749183, -0.843399405, -0.378080904, 0.92388618, 0.359933168, 0.129933342), CFrame.new(0.993886769, -1.80155158, 0.41332227, 0.946233869, -0.168109909, -0.276370257, 0.32347101, 0.484278023, 0.812921524, -0.00282013416, -0.858611643, 0.512618959), CFrame.new(-0.795712531, -2.27605748, -0.675008774, 0.968845665, 0.247665286, -6.2584877e-07, -0.247665256, 0.968845665, -3.36766243e-06, -2.08616257e-07, 3.39746475e-06, 1)}, 0.3, false)
		end
		Effects.Ring.Create(BrickColor.new("Bright yellow"), Barrel.CFrame, 0.05, 9999, 0.05, 0.5, 10, 0.5, 0.07)
		coroutine.resume(coroutine.create(function()
		
		swait(50)
		for i = 0, 3 do
			swait()
			Hee()
		end
	end
))
		for i = 0, 1, 0.5 do
			swait()
			PlayAnimationFromTable({CFrame.new(-4.02331352e-07, -0.429999679, 0.509999633, 0.454838723, 0.207662866, -0.866024196, -0.415319771, 0.909675479, 2.65391373e-06, 0.787801504, 0.359675765, 0.500002146), CFrame.new(-0.0229135007, 1.52854931, -0.00346241146, 0.454838723, 0.0202630162, 0.890343308, 0.207662866, 0.969769061, -0.128156841, -0.866024196, 0.243181929, 0.436880678), CFrame.new(1.34206092, -0.578433394, -0.518014491, 0.694960654, 0.00311025977, -0.719041109, -0.715354204, -0.0982373655, -0.691822171, -0.0727884769, 0.995158195, -0.0660461485), CFrame.new(0.159522176, 0.358650804, -1.36138511, 0.0264981389, -0.398905575, 0.916609168, 0.381749183, -0.843399405, -0.378080904, 0.92388618, 0.359933168, 0.129933342), CFrame.new(0.923282862, -1.64690685, 0.413322628, 0.946233869, -0.168109909, -0.276370257, 0.32347101, 0.484278023, 0.812921524, -0.00282013416, -0.858611643, 0.512618959), CFrame.new(-0.866316676, -2.12141252, -0.675008297, 0.968845665, 0.247665286, -6.2584877e-07, -0.247665256, 0.968845665, -3.36766243e-06, -2.08616257e-07, 3.39746475e-06, 1)}, 0.3, false)
		end
	end
	Humanoid.WalkSpeed = 16
	Humanoid.JumpPower = 50
	shoot = false
	attack = false
end

	reload = function()
	
	attack = true
	CFuncs.Sound.Create("rbxassetid://266022905", Torso, 1, 1)
	Humanoid.WalkSpeed = 16
	Humanoid.JumpPower = 50
	FakeMag.Transparency=0
	Mag.Transparency= 1
	RootJoint.C0 = clerp(RootJoint.C0, RootCF * cf(0, 0, 0 - 0.15 * math.cos(sine / 20)) * angles(math.rad(90), math.rad(90), math.rad(0)), 0.3)
	Torso.Neck.C0 = clerp(Torso.Neck.C0+Vector3.new(0,0.25,-.1), NeckCF * angles(math.rad(0), math.rad(0), math.rad(180)), 0.3)
	RW.C0 = clerp(RW.C0, CFrame.new(1, 1, -0.5) * angles(math.rad(50), math.rad(-60), math.rad(-20)), 0.3)
	LW.C0 = clerp(LW.C0, CFrame.new(-1.5, -1 - 0.1 * math.cos(sine / 25), 0) * angles(math.rad(90), math.rad(850), math.rad(-70)), 0.3)
	RH.C0 = clerp(RH.C0, CFrame.new(0.5, -2, 0 + 1 * math.cos((sine) / 3)) * angles(math.rad(0 - 50 * math.cos((sine) / 3)), math.rad(0), math.rad(0)), 0.3)
	LH.C0 = clerp(LH.C0, CFrame.new(-0.5, -2, 0 - 1 * math.cos((sine) / 3)) * angles(math.rad(0 + 50 * math.cos((sine) / 3)), math.rad(0), math.rad(0)), 0.3)
	FakeHandleWeld.C0 = clerp(FakeHandleWeld.C0, CFrame.new(0, 0, 0) * angles(math.rad(-40), math.rad(0), math.rad(-130)), 0.3)
	FakeMotorWeld.C0 = clerp(FakeMotorWeld.C0, CFrame.new(0, 0, 0) * angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
	FakeHandleWeld.C0 = clerp(FakeHandleWeld.C0, CFrame.new(0, 0, 0) * angles(math.rad(-40), math.rad(0), math.rad(-120)), 0.3)
	swait(45)
	RootJoint.C0 = clerp(RootJoint.C0, RootCF * cf(0, 0, 0 - 0.15 * math.cos(sine / 20)) * angles(math.rad(90), math.rad(90), math.rad(0)), 0.3)
	Torso.Neck.C0 = clerp(Torso.Neck.C0+Vector3.new(0,0.25,-.1), NeckCF * angles(math.rad(30), math.rad(-90), math.rad(-90)), 0.3)
	RW.C0 = clerp(RW.C0, CFrame.new(1, 0.5, -0.5) * angles(math.rad(90), math.rad(0), math.rad(-90)), 0.3)
	LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos(sine / 25), 0) * angles(math.rad(90), math.rad(0), math.rad(-70)), 0.3)
	RH.C0 = clerp(RH.C0, CFrame.new(0.5, -2, 0 + 1 * math.cos((sine) / 3)) * angles(math.rad(0 - 50 * math.cos((sine) / 3)), math.rad(0), math.rad(0)), 0.3)
	LH.C0 = clerp(LH.C0, CFrame.new(-0.5, -2, 0 - 1 * math.cos((sine) / 3)) * angles(math.rad(0 + 50 * math.cos((sine) / 3)), math.rad(0), math.rad(0)), 0.3)
	FakeHandleWeld.C0 = clerp(FakeHandleWeld.C0, CFrame.new(0, 0, 0) * angles(math.rad(-40), math.rad(0), math.rad(-130)), 0.3)
	FakeMotorWeld.C0 = clerp(FakeMotorWeld.C0, CFrame.new(0, 0, 0) * angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
	FakeHandleWeld.C0 = clerp(FakeHandleWeld.C0, CFrame.new(0, 0, 0) * angles(math.rad(-40), math.rad(0), math.rad(-120)), 0.3)
	FakeMag.Transparency=1
	Mag.Transparency=0
	cooldown1 = co1
	Humanoid.WalkSpeed = 16
	Humanoid.JumpPower = 50
	attack = false
end

	mouse.Button1Down:connect(function()
	
	if attack == true and aiming == true and hot == false and selectfire == 1 then
	fire()
	end
	if attack == true and aiming == true and hot == false and selectfire == 2 then
		swait(2.5)
		if cooldown1 >= 1 then
			if overheat > 0 and oplevel == 1 then
				overheat = overheat + 0.22222
				cooldown6 = co6
			end
			soe:Play()
			cooldown1 = cooldown1 - 1
			Effects.Block.Create(color1, Barrel.CFrame, 1,1,1,1,1,1,0.05)
			shoottraildd(mouse, Barrel, (1+overheat))
		else
			soe:Stop()
			reload()
			aiming = false
		end
	end
	if attack == true and aiming == true and hot == false and selectfire == 3 then
		swait(2.5)
		hot = true
		if cooldown1 >= 3 then
			if overheat < 13 and oplevel == 1 then
				overheat = overheat + 0.44444
				cooldown6 = co6
			end
			soe:Play()
			cooldown1 = cooldown1 - 1
			Effects.Block.Create(color1, Barrel.CFrame, 1,1,1,1,1,1,0.05)
			shoottraildd(mouse, Barrel, (1+overheat))
			swait(1)
			cooldown1 = cooldown1 - 1
			Effects.Block.Create(color1, Barrel.CFrame, 1,1,1,1,1,1,0.05)
			shoottraildd(mouse, Barrel, (1+overheat))
			swait(1)
			cooldown1 = cooldown1 - 1
			Effects.Block.Create(color1, Barrel.CFrame, 1,1,1,1,1,1,0.05)
			shoottraildd(mouse, Barrel, (1+overheat))
			swait(1)
			hot = false
		else
			soe:Stop()
			reload()
			aiming = false
		end
	end
	if attack == true and aiming == true and hot == false and selectfire == 4 then
		swait(2.5)
		hot = true
		shoot = true
		while cooldown1 >= 1 do
			if overheat < 13 and oplevel == 1 then
				overheat = overheat + 0.55555
			end
			soe:Play()
			cooldown1 = cooldown1 - 8
			Effects.Block.Create(color1, Barrel.CFrame, 1,1,1,1,1,1,0.05)
			for i = 0, 7 do
			shoottraildd(mouse, Barrel, (1+overheat))
			end
			swait(1)
		end
		shoot = false
		hot = false
		aiming = false
		reload()
	end
end
)
	mouse.Button1Up:connect(function()
			shoot = false
end
)
	mouse.KeyDown:connect(function(k)
	
	k = k:lower()
	
	if attack == false and aiming == false and k == "q" then
		Aim()
	else
		if attack == false and aiming == false and hot == false and k == "c534534535435" --[[and co3 <= cooldown3]] then
			cooldown3 = 0
			baka()
		else
			if attack == false and aiming == false and hot == false and k == "c" and cooldown4 >= co4 then
				cooldown4 = cooldown4
				swait()
				Effects.Sphere.Create(color1, Torso.CFrame, 1,1,1,10,10,10,0.05)
				for i = 0, 14 do
					swait(.5)
					Hee()
				end
				for i = 0, 14 do
					Effects.Sphere.Create("New Yeller", Torso.CFrame, 1,1,1,60,60,60,0.05)
					swait(3)
				end
				
				Guhn.Material = "Neon"
				Guhn.BrickColor = BrickColor.new"New Yeller"
				color1 = "New Yeller"
				color2 = "Really black"
				frame = 0.0233
				oplevel = 2
				
				
			else
				if attack == false and aiming == false and hot == false and k == "x3213213" --[[and co2 <= cooldown2]] then
					cooldown2 = 0
					reload()
				else
					if k == "b" then
						workspace.hfghfghfghfghf:destroy()
						Guhn.Material = "Ice"
						Guhn.BrickColor = BrickColor.new"Bright blue"
						color1 = "Really blue"
						color2 = "Pastel Blue"
						frame = 0.03333333333333
						oplevel = 1
					else
						if attack == true and aiming == true and k == "q" then
							attack = false
							aiming = false
							Humanoid.WalkSpeed = 14
							Humanoid.JumpPower = 50
							shoot = false
						else
							if k == "v7567" and selectfire == 4 then
								selectfire = 1
							else
								if k == "v756765" and selectfire ~= 4 then
									selectfire = selectfire + 1
								end
							end
						end
					end
				end
			end
		end
	end
end
)
	mouse.KeyUp:connect(function(k)
	
	k = k:lower()
	if attack == true and aiming == true and hot == true and k == "z" then
		shoot = false
	end
end
)
	updateskills = function()
	if selectfire ~= 2 then
	text7.Text = "Damage = " .. 1*(co1/cooldown1) .. ""
	end
	if selectfire == 2 then
	text7.Text = "Damage = " .. 1*(co1/cooldown1) .. ""
	end
	if overheat < 13 and shoot == false and cooldown6 <= 0 then
	overheat = overheat + 0.363333333333333
	end
	cooldown5 = 100 - (overheat*7.5)
	if cooldown5 < 0 then
		cooldown5 = 0
	end
	if oplevel == 2 then
	overheat = 0
	cooldown4 = cooldown4 - 0.033333333333
	cooldown1 = 2
	end
	if cooldown4 < 0.043333333333 then
	Guhn.Material = "Ice"
	Guhn.BrickColor = BrickColor.new"Bright blue"
	color1 = "Really blue"
	color2 = "Pastel Blue"
	frame = 0.03333333333333
	oplevel = 1
	end
	if aiming == false then
		text1.Text = "[Q]\n Aim"
	end
	if aiming == true and oplevel == 1 then
		text1.Text = "[Q]\n Un-Aim (energy : " .. 100 * (cooldown1 / co1) .. ")"
	end
	if aiming == true and oplevel == 2 then
		text1.Text = "[Q]\n Un-Aim (Ammo : " .. cooldown1 .. ")"
	end
	if selectfire == 1 then
		text6.Text = "[V] select fire : auto"
	end
	if selectfire == 2 then
		text6.Text = "[V] select fire : semi"
	end
	if selectfire == 3 then
		text6.Text = "[V] select fire : burst"
	end
	if selectfire == 4 then
		text6.Text = "[V] empty the magazine"
	end
	if cooldown2 <= co2 then
		cooldown2 = cooldown2 + 0.033333333333333
	end
	if cooldown3 <= co3 then
		cooldown3 = cooldown3 + 0.033333333333333
	end
	if cooldown4 <= co4 and oplevel == 1 then
		cooldown4 = cooldown4 + 0.033333333333333
	end
	if cooldown6 >= 0 then
		cooldown6 = cooldown6 - 0.02
		if overheat > 0.1 then
		overheat = overheat - 0.05
		end
	end
	if cooldown6 >= co6 then
		cooldown6 = co6
	end
end

	Humanoid.WalkSpeed = 14
	while true do
		swait()
		updateskills()
		bar6:TweenSize(UDim2.new(1 * (cooldown6 / co6), 0, 1, 0), "Out", "Quad", 0.5)
		bar5:TweenSize(UDim2.new(1 * (cooldown5 / co5), 0, 1, 0), "Out", "Quad", 0.5)
		bar4:TweenSize(UDim2.new(1 * (cooldown4 / co4), 0, 1, 0), "Out", "Quad", 0.5)
		bar3:TweenSize(UDim2.new(1 * (cooldown3 / co3), 0, 1, 0), "Out", "Quad", 0.5)
		bar1:TweenSize(UDim2.new(1 * (cooldown1 / co1), 0, 1, 0), "Out", "Quad", 0.5)
		bar2:TweenSize(UDim2.new(1 * (cooldown2 / co2), 0, 1, 0), "Out", "Quad", 0.5)
		if shoot == false then
			soe:Stop()
		end
		if aiming == false then
			spim:Stop()
		end
		if aiming == true then
			local aim = CFrame.new(RootPart.Position, mouse.Hit.p)
			local direction = aim.lookVector
			local headingA = math.atan2(direction.x, direction.z)
			headingA = math.deg(headingA)
			Humanoid.AutoRotate = false
			RootPart.CFrame = CFrame.new(RootPart.Position) * angles(math.rad(0), math.rad(headingA - 180), math.rad(0))
		else
			--do
				Humanoid.AutoRotate = true
end
				for i,v in pairs(Character:GetChildren()) do
					if v:IsA("Part") then
						v.Material = "SmoothPlastic"
					else
						if v:IsA("Hat") then
							v:WaitForChild("Handle").Material = "SmoothPlastic"
						end
					end
				end
				Torsovelocity = (RootPart.Velocity * Vector3.new(1, 0, 1)).magnitude
				velocity = RootPart.Velocity.y
				sine = sine + change
				local hit, pos = rayCast(RootPart.Position, CFrame.new(RootPart.Position, RootPart.Position - Vector3.new(0, 1, 0)).lookVector, 4, Character)
				if equipped == true or equipped == false then
					if 16565656565656565 < RootPart.Velocity.y and hit == nil then
						Anim = "Jump"
						if attack == false then
							RootJoint.C0 = clerp(RootJoint.C0, CFrame.new(0, 0, 0) * angles(math.rad(0), math.rad(-30), math.rad(0)), 0.3)
							Torso.Neck.C0 = clerp(Torso.Neck.C0, CFrame.new(0, 1.5, 0) * angles(math.rad(0), math.rad(30), math.rad(0)), 0.3)
							RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0, -0.3) * angles(math.rad(80), math.rad(-50), math.rad(30)), 0.3)
							LW.C0 = clerp(LW.C0, CFrame.new(-0.5, 0.4, -1) * angles(math.rad(90), math.rad(0), math.rad(50)), 0.3)
							RH.C0 = clerp(RH.C0, CFrame.new(0.5, -2, 0) * angles(math.rad(-50), math.rad(0), math.rad(0)), 0.3)
							LH.C0 = clerp(LH.C0, CFrame.new(-0.5, -1.5, -1) * angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
							FakeHandleWeld.C0 = clerp(FakeHandleWeld.C0, CFrame.new(0, 0, 0) * angles(math.rad(-40), math.rad(0), math.rad(-130)), 0.3)
							FakeMotorWeld.C0 = clerp(FakeMotorWeld.C0, CFrame.new(0, 0, 0) * angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
							FakeHandleWeld.C0 = clerp(FakeHandleWeld.C0, CFrame.new(0, 0, 0) * angles(math.rad(-40), math.rad(0), math.rad(-120)), 0.3)
						end
					else
						if RootPart.Velocity.y < -65656565665561 and hit == nil then
							Anim = "Fall"
							if attack == false then
								RootJoint.C0 = clerp(RootJoint.C0, CFrame.new(0, 0, 0) * angles(math.rad(20), math.rad(-30), math.rad(0)), 0.3)
								Torso.Neck.C0 = clerp(Torso.Neck.C0, CFrame.new(0, 1.5, 0) * angles(math.rad(-20), math.rad(30), math.rad(0)), 0.3)
								RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0, -0.3) * angles(math.rad(80), math.rad(-50), math.rad(30)), 0.3)
								LW.C0 = clerp(LW.C0, CFrame.new(-0.5, 0.4, -1) * angles(math.rad(90), math.rad(0), math.rad(50)), 0.3)
								RH.C0 = clerp(RH.C0, CFrame.new(0.5, -2, 0) * angles(math.rad(-50), math.rad(0), math.rad(0)), 0.3)
								LH.C0 = clerp(LH.C0, CFrame.new(-0.5, -1.5, -1) * angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
								FakeHandleWeld.C0 = clerp(FakeHandleWeld.C0, CFrame.new(0, 0, 0) * angles(math.rad(-40), math.rad(0), math.rad(-130)), 0.3)
								FakeMotorWeld.C0 = clerp(FakeMotorWeld.C0, CFrame.new(0, 0, 0) * angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
								FakeHandleWeld.C0 = clerp(FakeHandleWeld.C0, CFrame.new(0, 0, 0) * angles(math.rad(-40), math.rad(0), math.rad(-120)), 0.3)
							end
						else
							if Torsovelocity < 1 and hit ~= nil then
								Anim = "Idle"
								if attack == false then
									change = 1
											RootJoint.C0 = clerp(RootJoint.C0, RootCF * cf(0, 0, 0 - 0.15 * math.cos(sine / 20)) * angles(math.rad(90), math.rad(90), math.rad(0)), 0.3)
											Torso.Neck.C0 = clerp(Torso.Neck.C0+Vector3.new(0,0.25,-.1), NeckCF * angles(math.rad(30), math.rad(-90), math.rad(-90)), 0.3)
											RW.C0 = clerp(RW.C0, CFrame.new(1, 0.5, -0.5) * angles(math.rad(90), math.rad(0), math.rad(-90)), 0.3)
											LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos(sine / 25), 0) * angles(math.rad(90), math.rad(0), math.rad(-70)), 0.3)
											RH.C0 = clerp(RH.C0, cf(.5, -2, 0) * RHCF * angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
											LH.C0 = clerp(LH.C0, cf(-.5, -2, 0) * LHCF * angles(math.rad(0), math.rad(20), math.rad(0)), 0.3)
											FakeHandleWeld.C0 = clerp(FakeHandleWeld.C0, CFrame.new(0, 0, 0) * angles(math.rad(0), math.rad(0), math.rad(-60)), 0.3)end
							else
								if 2 < Torsovelocity and hit ~= nil then
									Anim = "Walk"
									if attack == false then
										RootJoint.C0 = clerp(RootJoint.C0, RootCF * cf(0, 0, 0 - 0.15 * math.cos(sine / 20)) * angles(math.rad(90), math.rad(90), math.rad(0)), 0.3)
										Torso.Neck.C0 = clerp(Torso.Neck.C0+Vector3.new(0,0.25,-.1), NeckCF * angles(math.rad(30), math.rad(-90), math.rad(-90)), 0.3)
										RW.C0 = clerp(RW.C0, CFrame.new(1, 0.5, -0.5) * angles(math.rad(90), math.rad(0), math.rad(-90)), 0.3)
										LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos(sine / 25), 0) * angles(math.rad(90), math.rad(0), math.rad(-70)), 0.3)
										RH.C0 = clerp(RH.C0, CFrame.new(0.5, -2, 0 + 1 * math.cos((sine) / 3)) * angles(math.rad(0 - 50 * math.cos((sine) / 3)), math.rad(0), math.rad(0)), 0.3)
										LH.C0 = clerp(LH.C0, CFrame.new(-0.5, -2, 0 - 1 * math.cos((sine) / 3)) * angles(math.rad(0 + 50 * math.cos((sine) / 3)), math.rad(0), math.rad(0)), 0.3)
										FakeHandleWeld.C0 = clerp(FakeHandleWeld.C0, CFrame.new(0, 0, 0) * angles(math.rad(-40), math.rad(0), math.rad(-130)), 0.3)
										FakeMotorWeld.C0 = clerp(FakeMotorWeld.C0, CFrame.new(0, 0, 0) * angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
										FakeHandleWeld.C0 = clerp(FakeHandleWeld.C0, CFrame.new(0, 0, 0) * angles(math.rad(-40), math.rad(0), math.rad(-120)), 0.3)
									end
								end
							end
						end
					end
				end
				if 0 < #Effects then
					for e = 1, #Effects do
						if Effects[e] ~= nil then
							local Thing = Effects[e]
							if Thing ~= nil then
								local Part = Thing[1]
								local Mode = Thing[2]
								local Delay = Thing[3]
								local IncX = Thing[4]
								local IncY = Thing[5]
								local IncZ = Thing[6]
								if Thing[1].Transparency <= 1 then
									if Thing[2] == "Block1" then
										Thing[1].CFrame = Thing[1].CFrame * CFrame.fromEulerAnglesXYZ(math.random(-50, 50), math.random(-50, 50), math.random(-50, 50))
										Mesh = Thing[1].Mesh
										Mesh.Scale = Mesh.Scale + Vector3.new(Thing[4], Thing[5], Thing[6])
										Thing[1].Transparency = Thing[1].Transparency + Thing[3]
									else
										if Thing[2] == "Block2" then
											Thing[1].CFrame = Thing[1].CFrame
											Mesh = Thing[7]
											Mesh.Scale = Mesh.Scale + Vector3.new(Thing[4], Thing[5], Thing[6])
											Thing[1].Transparency = Thing[1].Transparency + Thing[3]
										else
											if Thing[2] == "Cylinder" then
												Mesh = Thing[1].Mesh
												Mesh.Scale = Mesh.Scale + Vector3.new(Thing[4], Thing[5], Thing[6])
												Thing[1].Transparency = Thing[1].Transparency + Thing[3]
											else
												if Thing[2] == "Blood" then
													Mesh = Thing[7]
													Thing[1].CFrame = Thing[1].CFrame * Vector3.new(0, 0.5, 0)
													Mesh.Scale = Mesh.Scale + Vector3.new(Thing[4], Thing[5], Thing[6])
													Thing[1].Transparency = Thing[1].Transparency + Thing[3]
												else
													if Thing[2] == "Elec" then
														Mesh = Thing[1].Mesh
														Mesh.Scale = Mesh.Scale + Vector3.new(Thing[7], Thing[8], Thing[9])
														Thing[1].Transparency = Thing[1].Transparency + Thing[3]
													else
														if Thing[2] == "Disappear" then
															Thing[1].Transparency = Thing[1].Transparency + Thing[3]
														else
															if Thing[2] == "Shatter" then
																Thing[1].Transparency = Thing[1].Transparency + Thing[3]
																Thing[4] = Thing[4] * CFrame.new(0, Thing[7], 0)
																Thing[1].CFrame = Thing[4] * CFrame.fromEulerAnglesXYZ(Thing[6], 0, 0)
																Thing[6] = Thing[6] + Thing[5]
															end
														end
													end
												end
											end
										end
									end
								else
									Part.Parent = nil
									table.remove(Effects, e)
								end
							end
						end
					end
				end
			end

