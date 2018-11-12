wait(0.016666666666667)
script.Name = "wow this took forever"
local Player = game.Players.LocalPlayer
local Character = Player.Character
	Effects = {}
	ShootEffects = {}
	local Humanoid = Character.Humanoid
	local mouse = Player:GetMouse()
	local m = Instance.new("Model", Character)
	m.Name = "WeaponModel"
	local effect = Instance.new("Model", Character)
	effect.Name = "hb"
	local LeftArm = Character["Left Arm"]
	local RightArm = Character["Right Arm"]
	local hobb = 0
	local asd = 0
	local ultimate = false
	local followthrough = 0
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
	local mana = 0
	local it = Instance.new
	vt = Vector3.new
	local grabbed = false
	local cf = CFrame.new
	local mr = math.rad
	local angles = CFrame.Angles
	local ud = UDim2.new
	local c3 = Color3.new
	local NeckCF = cf(0, 1, 0, -1, 0, 0, 0, 0, 1, 0, 1, 0)
	local RootCF = CFrame.fromEulerAnglesXYZ(-1.57, 0, 3.14)
	local RHCF = CFrame.fromEulerAnglesXYZ(0, 1.6, 0)
	local LHCF = (CFrame.fromEulerAnglesXYZ(0, -1.6, 0))
	RSH = nil
	RW = Instance.new("Weld")
	LW = Instance.new("Weld")
	RH = Torso["Right Hip"]
	LH = Torso["Left Hip"]
	RSH = Torso["Right Shoulder"]
	LSH = Torso["Left Shoulder"]
	RSH.Parent = nil
	LSH.Parent = nil
	RW.Name = "RW"
	RW.Part0 = Torso
	RW.C0 = cf(1.5, 0.5, 0)
	RW.C1 = cf(0, 0.5, 0)
	RW.Part1 = RightArm
	RW.Parent = Torso
	LW.Name = "LW"
	LW.Part0 = Torso
	LW.C0 = cf(-1.5, 0.5, 0)
	LW.C1 = cf(0, 0.5, 0)
	LW.Part1 = LeftArm
	LW.Parent = Torso
	clerp = function(a, b, t)
	
	return a:lerp(b, t)
end

	local RbxUtility = LoadLibrary("RbxUtility")
	local Create = RbxUtility.Create
	RemoveOutlines = function(part)
	
	part.TopSurface = 10
end

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

	local co1 = 5
	local co2 = 14
	local co3 = 20
	local co4 = 35
	local cooldown1 = 5
	local cooldown2 = 14
	local cooldown3 = 20
	local cooldown4 = 35
	local maxEnergy = 100
	local Energy = 0
	local skill1stam = 10
	local skill2stam = 50
	local skill3stam = 60
	local skill4stam = 100
	local recovermana = 5
	local skillcolorscheme = BrickColor.new("Medium blue").Color
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
	label.Font = Enum.Font.SourceSansBold
	label.BorderSizePixel = 0
	label.TextScaled = true
	label.Text = text
end

	framesk1 = makeframe(scrn, 0.5, UDim2.new(0.05, 0, 0.76, 0), UDim2.new(0.16, 0, 0.1, 0), skillcolorscheme)
	framesk2 = makeframe(scrn, 0.5, UDim2.new(0.22, 0, 0.76, 0), UDim2.new(0.16, 0, 0.1, 0), skillcolorscheme)
	framesk3 = makeframe(scrn, 0.5, UDim2.new(0.39, 0, 0.76, 0), UDim2.new(0.16, 0, 0.1, 0), skillcolorscheme)
	framesk4 = makeframe(scrn, 0.5, UDim2.new(0.05, 0, 0.87, 0), UDim2.new(0.50, 0, 0.1, 0), skillcolorscheme)
	bar1 = makeframe(framesk1, 0, UDim2.new(0, 0, 0, 0), UDim2.new(1, 0, 1, 0), skillcolorscheme)
	bar2 = makeframe(framesk2, 0, UDim2.new(0, 0, 0, 0), UDim2.new(1, 0, 1, 0), skillcolorscheme)
	bar3 = makeframe(framesk3, 0, UDim2.new(0, 0, 0, 0), UDim2.new(1, 0, 1, 0), skillcolorscheme)
	bar4 = makeframe(framesk4, 0, UDim2.new(0, 0, 0, 0), UDim2.new(1, 0, 1, 0), skillcolorscheme)
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
	text1.Text = "[Z]\n Eye of the Moon"
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
	text2.Text = "[X]\n Lunar Mirror"
	text3 = Instance.new("TextLabel", framesk3)
	text3.BackgroundTransparency = 1
	text3.Size = UDim2.new(1, 0, 1, 0)
	text3.Position = UDim2.new(0, 0, 0, 0)
	text3.TextColor3 = Color3.new(255, 255, 255)
	text3.TextStrokeTransparency = 0
	text3.FontSize = Enum.FontSize.Size18
	text3.Font = Enum.Font.SourceSansLight
	text3.BorderSizePixel = 0
	text3.TextScaled = false
	text3.Text = "[C]\n Lunar Repulse"
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
	text4.Text = "[V]\n Moon dance"
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

	CreateWeld = function(Parent, Part0, Part1, C0, C1)
	
	local Weld = Create("Weld")({Parent = Parent, Part0 = Part0, Part1 = Part1, C0 = C0, C1 = C1})
	return Weld
end

	rayCast = function(Position, Direction, Range, Ignore)
	
	return game:service("Workspace"):FindPartOnRay(Ray.new(Position, Direction.unit * (Range or 999.999)), Ignore)
end

	CreateSound = function(id, par, vol, pit)
	
	coroutine.resume(coroutine.create(function()
		
		local sou = Instance.new("Sound", par or workspace)
		sou.Volume = vol
		sou.Pitch = pit or 1
		sou.SoundId = id
		swait()
		sou:play()
		game:GetService("Debris"):AddItem(sou, 6)
	end
))
end

	local getclosest = function(obj, distance)
	
	local last, lastx = distance + 1, nil
	for i,v in pairs(workspace:GetChildren()) do
		if v:IsA("Model") and v ~= Character and v:findFirstChild("Humanoid") and v:findFirstChild("Torso") and v:findFirstChild("Humanoid").Health > 0 then
			local t = v.Torso
			local dist = t.Position - obj.Position.magnitude
			if dist <= distance and dist < last then
				last = dist
				lastx = v
			end
		end
	end
	return lastx
end

	Handle = CreatePart(m, Enum.Material.Plastic, 0, 1, "Cyan", "FakeHandle", Vector3.new(0.209999993, 1.86000013, 0.289999992))
	HandleWeld = CreateWeld(m, Character["Right Arm"], Handle, CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1), CFrame.new(0.0391082764, 0.0218582153, 0.941995382, 1, 0, 0, 0, 0, -1, 0, 1, 0))
	CreateMesh("CylinderMesh", FakeHandle, "", "", Vector3.new(0, 0, 0), Vector3.new(1, 1, 1))
	FakeHandle = CreatePart(m, Enum.Material.Plastic, 0, 1, "Cyan", "FakeHandle", Vector3.new(0.209999993, 1.86000013, 0.289999992))
	FakeHandleWeld = CreateWeld(m, Handle, FakeHandle, CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1), CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1))
	Hitbox = CreatePart(m, Enum.Material.Neon, 0, 1, "Storm blue", "Hitbox", Vector3.new(0.200000003, 4.38000011, 2.41000009))
	HitboxWeld = CreateWeld(m, FakeHandle, Hitbox, CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1), CFrame.new(0, -4.23288536, 0.408658504, 1, 0, 0, 0, 1, 0, 0, 0, 1))
	CreateMesh("SpecialMesh", Hitbox, Enum.MeshType.Wedge, "", Vector3.new(0, 0, 0), Vector3.new(0.300000012, 1, 1))
	Motor = CreatePart(m, Enum.Material.Neon, 0, 1, "Storm blue", "Motor", Vector3.new(0.200000003, 0.200000003, 0.200000003))
	MotorWeld = CreateWeld(m, Character.HumanoidRootPart, Motor, CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1), CFrame.new(-0.100189209, 0.0700187683, -0.530023575, -1, 0, 0, 0, 0, 1, 0, 1, 0))
	CreateMesh("CylinderMesh", Motor, "", "", Vector3.new(0, 0, 0), Vector3.new(1, 1, 1))
	Motor2 = CreatePart(m, Enum.Material.Neon, 0, 1, "Storm blue", "Motor2", Vector3.new(0.200000003, 0.200000003, 0.200000003))
	Motor2Weld = CreateWeld(m, Character.HumanoidRootPart, Motor2, CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1), CFrame.new(-0.100067139, 0.0700206757, -0.530020714, -1, 0, 0, 0, 0, 1, 0, 1, 0))
	Center = CreatePart(m, Enum.Material.SmoothPlastic, 0, 0, "Institutional white", "Part", Vector3.new(0.2,0.2,0.85))
	CenterWeld = CreateWeld(m, FakeHandle, Center, CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1), CFrame.new(0.041, -2.7, -0.001, -1, 1, -10, 0, 25, 1, 0, 1, 0))
	local ddd = Instance.new("SpecialMesh", Center)
	ddd.MeshId = "http://www.roblox.com/asset/?id=31758253"
	ddd.Scale = Vector3.new(0.3,0.4,0.3)
	ddd.VertexColor = Vector3.new(0.75,0.75,1)
	ddd.TextureId = "http://www.roblox.com/asset/?id=61464223"
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
			CreateSound(HitSound, hit, 1, HitPitch)
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
			h.Health = h.Health - Damage
			if ultimate == true and cooldown4 <= co4 then
			cooldown4 = cooldown4 + (Damage/10)
			end
			ShowDamage(Part.CFrame * CFrame.new(0, 0, Part.Size.Z / 2).p + Vector3.new(0, 1.5, 0), -Damage, 1.5, Part.BrickColor.Color)
		else
			h.Health = h.Health - Damage / 2
			ShowDamage(Part.CFrame * CFrame.new(0, 0, Part.Size.Z / 2).p + Vector3.new(0, 1.5, 0), -Damage, 1.5, Part.BrickColor.Color)
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
							local bodyVelocity = Create("BodyVelocity")({velocity = vt(0, 20, 0), P = 5000, maxForce = Vector3.new(8000, 8000, 8000), Parent = hit})
							game:GetService("Debris"):AddItem(bodyVelocity, 0.5)
						elseif Type == "Tele" then
									CreateSound("http://www.roblox.com/asset/?id=299439036", hit.Parent.Torso, 1, 2)
									hit.Parent:MoveTo(Motor.Position)
		elseif type == "Dark" then
		local asd = Instance.new("Fire", hit)
		asd.Color = Color3.new()
		asd.SecondaryColor = Color3.new()
		for i = 0,100, 1 do
			hit.Parent.Humanoid.Health = hit.Parent.Humanoid.Health - 0.05
			if hit.Parent.Humanoid.Health > 0.05 then
			cooldown4 = cooldown4 + (0.01)
			end
			swait()
		end
		asd:Destroy()
								elseif Type == "DarkUp" then
										coroutine.resume(coroutine.create(function()
		
		for i = 0, 1, 0.1 do
			swait()
			BlockEffect(BrickColor.new("Black"), hit.Parent.Torso.CFrame, 5, 5, 5, 1, 1, 1, 0.08, 1)
		end
	end
))
										local bodyVelocity = Create("BodyVelocity")({velocity = vt(0, 20, 0), P = 5000, maxForce = Vector3.new(8000, 8000, 8000), Parent = hit})
										game:GetService("Debris"):AddItem(bodyVelocity, 1)
									elseif Type == "Snare" then
												local bp = Create("BodyPosition")({P = 2000, D = 100, maxForce = Vector3.new(math.huge, math.huge, math.huge), position = hit.Parent.Torso.Position, Parent = hit.Parent.Torso})
												game:GetService("Debris"):AddItem(bp, 0.1)
											elseif Type == "Freeze" then
														local BodPos = Create("BodyPosition")({P = 50000, D = 1000, maxForce = Vector3.new(math.huge, math.huge, math.huge), position = hit.Parent.Torso.Position, Parent = hit.Parent.Torso})
														local BodGy = Create("BodyGyro")({maxTorque = Vector3.new(400000, 400000, 400000) * math.huge, P = 20000, Parent = hit.Parent.Torso, cframe = hit.Parent.Torso.CFrame})
														hit.Parent.Torso.Anchored = true
														coroutine.resume(coroutine.create(function(Part)
		
		swait(1.5)
		Part.Anchored = false
	end
), hit.Parent.Torso)
														game:GetService("Debris"):AddItem(BodPos, 3)
														game:GetService("Debris"):AddItem(BodGy, 3)
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
	local EffectPart = CreatePart(workspace, "SmoothPlastic", 0, 1, BrickColor.new(Color), "Effect", vt(0, 0, 0))
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
					Damagefunc(head, head, mindam, maxdam, knock, Type, RootPart, 0.1, "http://www.roblox.com/asset/?id=231917784", 1)
				end
			end
		end
	end
end

	Laser = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
	
	local prt = CreatePart(effect, "Neon", 0, 0, brickcolor, "Effect", Vector3.new(0.5, 0.5, 0.5))
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
	
	local prt = CreatePart(effect, "Neon", 0, 0, brickcolor, "Effect", Vector3.new())
	prt.Anchored = true
	prt.CFrame = cframe
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

	SphereEffect = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
	
	local prt = CreatePart(effect, "SmoothPlastic", 0, 0, brickcolor, "Effect", Vector3.new())
	prt.Anchored = true
	prt.CFrame = cframe
	local msh = CreateMesh("SpecialMesh", prt, "Sphere", "", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
	game:GetService("Debris"):AddItem(prt, 10)
	table.insert(Effects, {prt, "Cylinder", delay, x3, y3, z3, msh})
end

	RingEffect = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
	
	local prt = CreatePart(effect, "SmoothPlastic", 0, 0, brickcolor, "Effect", Vector3.new(0.5, 0.5, 0.5))
	prt.Anchored = true
	prt.CFrame = cframe
	msh = CreateMesh("SpecialMesh", prt, "FileMesh", "rbxassetid://3270017", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
	game:GetService("Debris"):AddItem(prt, 2)
	coroutine.resume(coroutine.create(function(Part, Mesh, num)
		
		for i = 0, 1, delay do
			swait()
			Part.Transparency = i
			Mesh.Scale = Mesh.Scale + vt(x3, y3, z3)
		end
		Part.Parent = nil
	end
), prt, msh, (math.random(0, 1) + math.random()) / 5)
end

	CylinderEffect = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
	
	local prt = CreatePart(effect, "SmoothPlastic", 0, 0, brickcolor, "Effect", Vector3.new())
	prt.Anchored = true
	prt.CFrame = cframe
	local msh = CreateMesh("CylinderMesh", prt, "", "", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
	game:GetService("Debris"):AddItem(prt, 10)
	table.insert(Effects, {prt, "Cylinder", delay, x3, y3, z3, msh})
end

	WaveEffect = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
	
	local prt = CreatePart(effect, "SmoothPlastic", 0, 0, brickcolor, "Effect", Vector3.new())
	prt.Anchored = true
	prt.CFrame = cframe
	msh = CreateMesh("SpecialMesh", prt, "FileMesh", "http://www.roblox.com/asset/?id=20329976", vt(0, 0, 0), vt(x1, y1, z1))
	game:GetService("Debris"):AddItem(prt, 2)
	coroutine.resume(coroutine.create(function(Part, Mesh)
		
		for i = 0, 1, delay do
			swait()
			Part.CFrame = Part.CFrame * cf(0, y3 / 2, 0)
			Part.Transparency = i
			Mesh.Scale = Mesh.Scale + vt(x3, y3, z3)
		end
		Part.Parent = nil
	end
), prt, msh)
end

	StravEffect = function(brickcolor, cframe, x, y, z, x1, y1, z1, delay)
	
	local prt = CreatePart(effect, "SmoothPlastic", 0, 0, brickcolor, "Effect", Vector3.new())
	prt.Anchored = true
	prt.CFrame = cframe * cf(x, y, z)
	msh = CreateMesh("SpecialMesh", prt, "FileMesh", "rbxassetid://168892363", vt(0, 0, 0), vt(x1, y1, z1))
	game:GetService("Debris"):AddItem(prt, 5)
	coroutine.resume(coroutine.create(function(Part, Mesh, ex, why, zee)
		
		local num = math.random()
		local num2 = math.random(-3, 2) + math.random()
		local numm = 0
		for i = 0, 1, delay * 2 do
			swait()
			Part.CFrame = cframe * angles(0, numm * num * 10, 0) * cf(ex, why, zee) * cf(-i * 10, num2, 0)
			Part.Transparency = i
			numm = numm + 0.01
		end
		Part.Parent = nil
		Mesh.Parent = nil
	end
), prt, msh, x, y, z)
end

	SpecialEffect = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
	
	local prt = CreatePart(effect, "SmoothPlastic", 0, 0, brickcolor, "Effect", Vector3.new())
	prt.Anchored = true
	prt.CFrame = cframe
	local msh = CreateMesh("SpecialMesh", prt, "FileMesh", "rbxassetid://24388358", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
	game:GetService("Debris"):AddItem(prt, 10)
	table.insert(Effects, {prt, "Cylinder", delay, x3, y3, z3, msh})
end

	BreakEffect = function(brickcolor, cframe, x1, y1, z1)
	
	local prt = CreatePart(effect, "SmoothPlastic", 0, 0, brickcolor, "Effect", Vector3.new(0.5, 0.5, 0.5))
	prt.Anchored = true
	prt.CFrame = cframe * CFrame.fromEulerAnglesXYZ(math.random(-50, 50), math.random(-50, 50), math.random(-50, 50))
	local msh = CreateMesh("SpecialMesh", prt, "Sphere", "", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
	local num = math.random(10, 50) / 1000
	game:GetService("Debris"):AddItem(prt, 10)
	table.insert(Effects, {prt, "Shatter", num, prt.CFrame, math.random() - math.random(), 0, math.random(50, 100) / 100})
end

	attackone = function()
	
	attack = true
	local con = Hitbox.Touched:connect(function(hit)
		
		Damagefunc(Hitbox, hit, 10, 20, math.random(1, 5), "freeze", RootPart, 0.2, "rbxassetid://199149221", 0.8)
	end
	)
	for i = 0, 1, 6 do
	for i = 0, 1, 0.2 do
		swait()
		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cf(0, 0, 0 - 0.1 * math.cos(sine / 20)) * angles(math.rad(0), math.rad(0), math.rad(50)), 0.3)
		Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(10), math.rad(0), math.rad(-50)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(0), math.rad(100), math.rad(90)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(0), math.rad(0), math.rad(-10)), 0.3)
		RH.C0 = clerp(RH.C0, cf(1, -1 + 0.1 * math.cos(sine / 20), 0) * RHCF * angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		LH.C0 = clerp(LH.C0, cf(-1, -1 + 0.1 * math.cos(sine / 20), 0.1) * LHCF * angles(math.rad(0), math.rad(20), math.rad(0)), 0.3)
		FakeHandleWeld.C0 = clerp(FakeHandleWeld.C0, CFrame.new(0, 0, 0) * angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		MotorWeld.C0 = clerp(MotorWeld.C0, cf(0, 0, 0) * angles(math.rad(0 - 10 * math.cos(sine / 30)), math.rad(hobb), math.rad(0 - 30 * math.cos(sine / 30))), 0.3)
		Motor2Weld.C0 = clerp(Motor2Weld.C0, cf(0, 0, 0) * angles(math.rad(0 + 10 * math.cos(sine / 30)), math.rad(-hobb), math.rad(0 + 30 * math.cos(sine / 30))), 0.3)
	end
	CreateSound("http://roblox.com/asset/?id=10209645", RootPart, 1, 1)
	for i = 0, 1, 0.2 do
		swait()
		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cf(0, 0, 0 - 0.1 * math.cos(sine / 20)) * angles(math.rad(0), math.rad(0), math.rad(-80)), 0.3)
		Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(10), math.rad(0), math.rad(80)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(0), math.rad(0), math.rad(90)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(0), math.rad(0), math.rad(-10)), 0.3)
		RH.C0 = clerp(RH.C0, cf(1, -1 + 0.1 * math.cos(sine / 20), 0) * RHCF * angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		LH.C0 = clerp(LH.C0, cf(-1, -1 + 0.1 * math.cos(sine / 20), 0.1) * LHCF * angles(math.rad(0), math.rad(20), math.rad(0)), 0.3)
		FakeHandleWeld.C0 = clerp(FakeHandleWeld.C0, CFrame.new(0, 0, 0) * angles(math.rad(-60), math.rad(0), math.rad(0)), 0.3)
		MotorWeld.C0 = clerp(MotorWeld.C0, cf(0, 0, 0) * angles(math.rad(0 - 10 * math.cos(sine / 30)), math.rad(hobb), math.rad(0 - 30 * math.cos(sine / 30))), 0.3)
		Motor2Weld.C0 = clerp(Motor2Weld.C0, cf(0, 0, 0) * angles(math.rad(0 + 10 * math.cos(sine / 30)), math.rad(-hobb), math.rad(0 + 30 * math.cos(sine / 30))), 0.3)
	end
	for i = 0, 1, 0.2 do
		swait()
		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cf(0, 0, 0 - 0.1 * math.cos(sine / 20)) * angles(math.rad(0), math.rad(0), math.rad(50)), 0.3)
		Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(10), math.rad(0), math.rad(-50)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(0), math.rad(100), math.rad(90)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(0), math.rad(0), math.rad(-10)), 0.3)
		RH.C0 = clerp(RH.C0, cf(1, -1 + 0.1 * math.cos(sine / 20), 0) * RHCF * angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		LH.C0 = clerp(LH.C0, cf(-1, -1 + 0.1 * math.cos(sine / 20), 0.1) * LHCF * angles(math.rad(0), math.rad(20), math.rad(0)), 0.3)
		FakeHandleWeld.C0 = clerp(FakeHandleWeld.C0, CFrame.new(0, 0, 0) * angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		MotorWeld.C0 = clerp(MotorWeld.C0, cf(0, 0, 0) * angles(math.rad(0 - 10 * math.cos(sine / 30)), math.rad(hobb), math.rad(0 - 30 * math.cos(sine / 30))), 0.3)
		Motor2Weld.C0 = clerp(Motor2Weld.C0, cf(0, 0, 0) * angles(math.rad(0 + 10 * math.cos(sine / 30)), math.rad(-hobb), math.rad(0 + 30 * math.cos(sine / 30))), 0.3)
	end
	swait()
	end
	con:disconnect()
	attack = false
	end
	
	attackone2 = function()
	
	attack = true
	local con = Hitbox.Touched:connect(function(hit)
		BlockEffect(BrickColor.new("Really black"), hit.CFrame, 1, 1, 1, 10, 10, 10, 0.07)
		Damagefunc(Hitbox, hit, 15, 30, math.random(1, 5), "freeze", RootPart, 0.2, "rbxassetid://199149221", 0.8)
		local asd = Instance.new("Fire", hit)
		asd.Color = Color3.new()
		asd.SecondaryColor = Color3.new()
		for i = 0,100, 1 do
			hit.Parent.Humanoid.Health = hit.Parent.Humanoid.Health - 0.05
			if hit.Parent.Humanoid.Health > 0.05 then
			cooldown4 = cooldown4 + (0.01)
			end
			swait()
		end
		asd:Destroy()
	end
	)
	for i = 0, 1, 0.2 do
		swait()
		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cf(0, 0, 0 - 0.1 * math.cos(sine / 20)) * angles(math.rad(20), math.rad(0), math.rad(30)), 0.3)
		Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(10), math.rad(0), math.rad(-50)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(0), math.rad(100), math.rad(90)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(0), math.rad(0), math.rad(-10)), 0.3)
		RH.C0 = clerp(RH.C0, cf(1, -1 + 0.1 * math.cos(sine / 20), 0) * RHCF * angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		LH.C0 = clerp(LH.C0, cf(-1, -1 + 0.1 * math.cos(sine / 20), 0.1) * LHCF * angles(math.rad(0), math.rad(20), math.rad(0)), 0.3)
		FakeHandleWeld.C0 = clerp(FakeHandleWeld.C0, CFrame.new(0, 0, 0) * angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		MotorWeld.C0 = clerp(MotorWeld.C0, cf(0, 0, 0) * angles(math.rad(0 - 10 * math.cos(sine / 30)), math.rad(hobb), math.rad(0 - 30 * math.cos(sine / 30))), 0.3)
		Motor2Weld.C0 = clerp(Motor2Weld.C0, cf(0, 0, 0) * angles(math.rad(0 + 10 * math.cos(sine / 30)), math.rad(-hobb), math.rad(0 + 30 * math.cos(sine / 30))), 0.3)
	end
	CreateSound("http://roblox.com/asset/?id=10209645", RootPart, 1, 1)
	for i = 0, 1, 0.2 do
		swait()
		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cf(0, 0, 0 - 0.1 * math.cos(sine / 20)) * angles(math.rad(0), math.rad(0), math.rad(-110)), 0.3)
		Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(10), math.rad(0), math.rad(80)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(0), math.rad(0), math.rad(90)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(0), math.rad(0), math.rad(-10)), 0.3)
		RH.C0 = clerp(RH.C0, cf(1, -1 + 0.1 * math.cos(sine / 20), 0) * RHCF * angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		LH.C0 = clerp(LH.C0, cf(-1, -1 + 0.1 * math.cos(sine / 20), 0.1) * LHCF * angles(math.rad(0), math.rad(20), math.rad(0)), 0.3)
		FakeHandleWeld.C0 = clerp(FakeHandleWeld.C0, CFrame.new(0, 0, 0) * angles(math.rad(-60), math.rad(0), math.rad(0)), 0.3)
		MotorWeld.C0 = clerp(MotorWeld.C0, cf(0, 0, 0) * angles(math.rad(0 - 10 * math.cos(sine / 30)), math.rad(hobb), math.rad(0 - 30 * math.cos(sine / 30))), 0.3)
		Motor2Weld.C0 = clerp(Motor2Weld.C0, cf(0, 0, 0) * angles(math.rad(0 + 10 * math.cos(sine / 30)), math.rad(-hobb), math.rad(0 + 30 * math.cos(sine / 30))), 0.3)
	end
	for i = 0, 1, 0.2 do
		swait()
		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cf(0, 0, 0 - 0.1 * math.cos(sine / 20)) * angles(math.rad(0), math.rad(0), math.rad(50)), 0.3)
		Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(10), math.rad(0), math.rad(-50)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(0), math.rad(100), math.rad(90)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(0), math.rad(0), math.rad(-10)), 0.3)
		RH.C0 = clerp(RH.C0, cf(1, -1 + 0.1 * math.cos(sine / 20), 0) * RHCF * angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		LH.C0 = clerp(LH.C0, cf(-1, -1 + 0.1 * math.cos(sine / 20), 0.1) * LHCF * angles(math.rad(0), math.rad(20), math.rad(0)), 0.3)
		FakeHandleWeld.C0 = clerp(FakeHandleWeld.C0, CFrame.new(0, 0, 0) * angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		MotorWeld.C0 = clerp(MotorWeld.C0, cf(0, 0, 0) * angles(math.rad(0 - 10 * math.cos(sine / 30)), math.rad(hobb), math.rad(0 - 30 * math.cos(sine / 30))), 0.3)
		Motor2Weld.C0 = clerp(Motor2Weld.C0, cf(0, 0, 0) * angles(math.rad(0 + 10 * math.cos(sine / 30)), math.rad(-hobb), math.rad(0 + 30 * math.cos(sine / 30))), 0.3)
	end
	con:disconnect()
	attack = false
	end
	
	storm = function()
	
	attack = true
	local con = Hitbox.Touched:connect(function(hit)
		
		Damagefunc(Hitbox, hit, 10, 20, math.random(1, 5), "freeze", RootPart, 0.2, "rbxassetid://199149221", 0.8)
	end
	)
	Humanoid.WalkSpeed = 0
	if followthrough >= 1 then
	Humanoid.Jump = true
	Torso.Velocity = RootPart.CFrame.lookVector * 150
	followthrough = 0
	end
	for i = 0, 1, 6 do
	for i = 0, 1, 0.04 do
		swait()
		BlockEffect(BrickColor.new("Pastel Blue"), RootPart.CFrame, 1, 1, 1, 20, 20, 20, 0.07)
		MagniDamage(RootPart, 15, 1,5, 1, "Freeze")
		RootPart.CFrame = Torso.CFrame * CFrame.fromEulerAnglesXYZ(-0.01,0,0)
		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cf(0, 0, 0 - 0.1 * math.cos(sine / 20)) * angles(math.rad(0), math.rad(0), math.rad(50)), 0.3)
		Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(10), math.rad(0), math.rad(-50)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(0), math.rad(0), math.rad(90)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(0), math.rad(0), math.rad(-10)), 0.3)
		RH.C0 = clerp(RH.C0, cf(1, -1 + 0.1 * math.cos(sine / 20), 0) * RHCF * angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		LH.C0 = clerp(LH.C0, cf(-1, -1 + 0.1 * math.cos(sine / 20), 0.1) * LHCF * angles(math.rad(0), math.rad(20), math.rad(0)), 0.3)
		FakeHandleWeld.C0 = clerp(FakeHandleWeld.C0, CFrame.new(0, 0, 0) * angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		MotorWeld.C0 = clerp(MotorWeld.C0, cf(0, 0, 0) * angles(math.rad(0 - 10 * math.cos(sine / 30)), math.rad(hobb), math.rad(0 - 30 * math.cos(sine / 30))), 0.3)
		Motor2Weld.C0 = clerp(Motor2Weld.C0, cf(0, 0, 0) * angles(math.rad(0 + 10 * math.cos(sine / 30)), math.rad(-hobb), math.rad(0 + 30 * math.cos(sine / 30))), 0.3)
	end
	CreateSound("http://roblox.com/asset/?id=10209645", RootPart, 1, 1)
	swait()
	end
	con:disconnect()
	Humanoid.WalkSpeed = 16
	attack = false
end
	punch = function()
	local possible = true
	attack = true
	local con = LeftArm.Touched:connect(function(hit)
		hit.Parent.Torso.Anchored = true
		Damagefunc(LeftArm, hit, 10, 20, math.random(0,0), "Normal", RootPart, 0.2, "rbxassetid://131237241", 0.8)
		coroutine.resume(coroutine.create(function()
		if possible == true then
		possible = false
		for i = 0,48, 1 do
		CreateSound("http://roblox.com/asset/?id=10209645", RootPart, 1, 1)
		BlockEffect(BrickColor.new("Pastel Blue"), hit.Parent.Torso.CFrame * angles(math.rad(0), 0, 0), 3, 3, 50, 0, 50, 0.05, 0.05)
		hit.Parent.Humanoid.Health = hit.Parent.Humanoid.Health - .3
		BlockEffect(BrickColor.new("Pastel Blue"), hit.Parent.Torso.CFrame * angles(math.rad(0), 0, 0), 3, 3, 50, 0, 50, 0.05, 0.05)
		hit.Parent.Humanoid.Health = hit.Parent.Humanoid.Health - .3
		swait()
		end	
		hit.Parent.Torso.Anchored = false
		end
		end))
	end
	)
	for i = 0, 1, 0.2 do
	swait()
	RootJoint.C0 = clerp(RootJoint.C0, RootCF * cf(0, 0, 0 - 0.1 * math.cos(sine / 20)) * angles(math.rad(0), math.rad(0), math.rad(30)), 0.3)
	Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(10), math.rad(0), math.rad(0)), 0.3)
	RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(-70), math.rad(0), math.rad(0)), 0.3)
	LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(0), math.rad(-90), math.rad(-100)), 0.3)
	RH.C0 = clerp(RH.C0, cf(1, -1 + 0.1 * math.cos(sine / 20), 0) * RHCF * angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
	LH.C0 = clerp(LH.C0, cf(-1, -1 + 0.1 * math.cos(sine / 20), 0.1) * LHCF * angles(math.rad(0), math.rad(20), math.rad(0)), 0.3)
	FakeHandleWeld.C0 = clerp(FakeHandleWeld.C0, CFrame.new(0, 0, 0) * angles(math.rad(60), math.rad(0), math.rad(-40)), 0.3)
	MotorWeld.C0 = clerp(MotorWeld.C0, cf(0, 0, -4) * angles(math.rad(90), math.rad(0), math.rad(0)), 0.3)
	Motor2Weld.C0 = clerp(Motor2Weld.C0, cf(0, 0, -8) * angles(math.rad(90), math.rad(0), math.rad(0)), 0.3)
	end
	for i = 0, 1, 0.1 do
	swait()
	RootJoint.C0 = clerp(RootJoint.C0, RootCF * cf(0, 0, 0 - 0.1 * math.cos(sine / 20)) * angles(math.rad(0), math.rad(0), math.rad(-90)), 0.3)
	Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(10), math.rad(0), math.rad(0)), 0.3)
	RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(-70), math.rad(0), math.rad(0)), 0.3)
	LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(0), math.rad(-90), math.rad(-100)), 0.3)
	RH.C0 = clerp(RH.C0, cf(1, -1 + 0.1 * math.cos(sine / 20), 0) * RHCF * angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
	LH.C0 = clerp(LH.C0, cf(-1, -1 + 0.1 * math.cos(sine / 20), 0.1) * LHCF * angles(math.rad(0), math.rad(20), math.rad(0)), 0.3)
	FakeHandleWeld.C0 = clerp(FakeHandleWeld.C0, CFrame.new(0, 0, 0) * angles(math.rad(60), math.rad(0), math.rad(-40)), 0.3)
	MotorWeld.C0 = clerp(MotorWeld.C0, cf(0, 0, -4) * angles(math.rad(90), math.rad(0), math.rad(0)), 0.3)
	Motor2Weld.C0 = clerp(Motor2Weld.C0, cf(0, 0, -8) * angles(math.rad(90), math.rad(0), math.rad(0)), 0.3)
	end
	
	con:disconnect()
	attack = false
	end
	
	
	attacktwo = function()
	local didit = false
	local possible = true
	attack = true
	local con = Hitbox.Touched:connect(function(hit)
		if possible == true then
		didit = true
		end
		possible = false
		Damagefunc(Hitbox, hit, 5, 9, math.random(1, 5), "Normal", RootPart, 0.2, "rbxassetid://199149221", 0.8)
		while didit == true do
		swait()
		hit.Parent.Torso.CFrame = Center.CFrame * CFrame.new(0,1,0) * CFrame.fromEulerAnglesXYZ(90,0,90)
		end
		followthrough = 5
	end
)
	for i = 0, 1, 0.2 do
		swait()
		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cf(0, 0, 0 - 0.1 * math.cos(sine / 20)) * angles(math.rad(0), math.rad(0), math.rad(-90)), 0.3)
		Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(10), math.rad(0), math.rad(90)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(0), math.rad(0), math.rad(90)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(0), math.rad(0), math.rad(-10)), 0.3)
		RH.C0 = clerp(RH.C0, cf(1, -1 + 0.1 * math.cos(sine / 20), 0) * RHCF * angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		LH.C0 = clerp(LH.C0, cf(-1, -1 + 0.1 * math.cos(sine / 20), 0.1) * LHCF * angles(math.rad(0), math.rad(20), math.rad(0)), 0.3)
		FakeHandleWeld.C0 = clerp(FakeHandleWeld.C0, CFrame.new(0, 0, 0) * angles(math.rad(60), math.rad(0), math.rad(0)), 0.3)
		MotorWeld.C0 = clerp(MotorWeld.C0, cf(0, 0, 0) * angles(math.rad(0 - 10 * math.cos(sine / 30)), math.rad(hobb), math.rad(0 - 30 * math.cos(sine / 30))), 0.3)
		Motor2Weld.C0 = clerp(Motor2Weld.C0, cf(0, 0, 0) * angles(math.rad(0 + 10 * math.cos(sine / 30)), math.rad(-hobb), math.rad(0 + 30 * math.cos(sine / 30))), 0.3)
	end
	CreateSound("rbxasset://sounds/swordlunge.wav", RootPart, 1, 1.2)
	for i = 0, 1, 0.1 do
		swait()
		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cf(0, 0, 0 - 0.1 * math.cos(sine / 20)) * angles(math.rad(0), math.rad(0), math.rad(50)), 0.3)
		Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(10), math.rad(0), math.rad(-50)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(0), math.rad(0), math.rad(90)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(90), math.rad(0), math.rad(-10)), 0.3)
		RH.C0 = clerp(RH.C0, cf(1, -1 + 0.1 * math.cos(sine / 20), 0) * RHCF * angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		LH.C0 = clerp(LH.C0, cf(-1, -1 + 0.1 * math.cos(sine / 20), 0.1) * LHCF * angles(math.rad(0), math.rad(20), math.rad(0)), 0.3)
		FakeHandleWeld.C0 = clerp(FakeHandleWeld.C0, CFrame.new(0, 0, 0) * angles(math.rad(-40), math.rad(0), math.rad(0)), 0.3)
		MotorWeld.C0 = clerp(MotorWeld.C0, cf(0, 0, 0) * angles(math.rad(0 - 10 * math.cos(sine / 30)), math.rad(hobb), math.rad(0 - 30 * math.cos(sine / 30))), 0.3)
		Motor2Weld.C0 = clerp(Motor2Weld.C0, cf(0, 0, 0) * angles(math.rad(0 + 10 * math.cos(sine / 30)), math.rad(-hobb), math.rad(0 + 30 * math.cos(sine / 30))), 0.3)
	end
	if didit == true then
	for i = 0, 1, 0.2 do
		swait()
		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cf(0, 0, 0 - 0.1 * math.cos(sine / 20)) * angles(math.rad(0), math.rad(0), math.rad(-90)), 0.3)
		Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(10), math.rad(0), math.rad(90)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(0), math.rad(0), math.rad(90)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(0), math.rad(0), math.rad(-10)), 0.3)
		RH.C0 = clerp(RH.C0, cf(1, -1 + 0.1 * math.cos(sine / 20), 0) * RHCF * angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		LH.C0 = clerp(LH.C0, cf(-1, -1 + 0.1 * math.cos(sine / 20), 0.1) * LHCF * angles(math.rad(0), math.rad(20), math.rad(0)), 0.3)
		FakeHandleWeld.C0 = clerp(FakeHandleWeld.C0, CFrame.new(0, 0, 0) * angles(math.rad(60), math.rad(0), math.rad(0)), 0.3)
		MotorWeld.C0 = clerp(MotorWeld.C0, cf(0, 0, 0) * angles(math.rad(0 - 10 * math.cos(sine / 30)), math.rad(hobb), math.rad(0 - 30 * math.cos(sine / 30))), 0.3)
		Motor2Weld.C0 = clerp(Motor2Weld.C0, cf(0, 0, 0) * angles(math.rad(0 + 10 * math.cos(sine / 30)), math.rad(-hobb), math.rad(0 + 30 * math.cos(sine / 30))), 0.3)
	end
	for i = 0, 1, 0.1 do
		swait()
		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cf(0, 0, 0 - 0.1 * math.cos(sine / 20)) * angles(math.rad(0), math.rad(0), math.rad(50)), 0.3)
		Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(10), math.rad(0), math.rad(-50)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(0), math.rad(0), math.rad(90)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(90), math.rad(0), math.rad(-10)), 0.3)
		RH.C0 = clerp(RH.C0, cf(1, -1 + 0.1 * math.cos(sine / 20), 0) * RHCF * angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		LH.C0 = clerp(LH.C0, cf(-1, -1 + 0.1 * math.cos(sine / 20), 0.1) * LHCF * angles(math.rad(0), math.rad(20), math.rad(0)), 0.3)
		FakeHandleWeld.C0 = clerp(FakeHandleWeld.C0, CFrame.new(0, 0, 0) * angles(math.rad(-40), math.rad(0), math.rad(0)), 0.3)
		MotorWeld.C0 = clerp(MotorWeld.C0, cf(0, 0, 0) * angles(math.rad(0 - 10 * math.cos(sine / 30)), math.rad(hobb), math.rad(0 - 30 * math.cos(sine / 30))), 0.3)
		Motor2Weld.C0 = clerp(Motor2Weld.C0, cf(0, 0, 0) * angles(math.rad(0 + 10 * math.cos(sine / 30)), math.rad(-hobb), math.rad(0 + 30 * math.cos(sine / 30))), 0.3)
	end
	didit = false
	Humanoid.Jump = true
	Torso.Velocity = RootPart.CFrame.lookVector * -150
	for i = 0, 1, 0.2 do
		swait()
		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cf(0, 0, 0 - 0.1 * math.cos(sine / 20)) * angles(math.rad(0), math.rad(0), math.rad(90)), 0.3)
		Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(10), math.rad(0), math.rad(90)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(0), math.rad(0), math.rad(90)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(0), math.rad(0), math.rad(-10)), 0.3)
		RH.C0 = clerp(RH.C0, cf(1, -1 + 0.1 * math.cos(sine / 20), 0) * RHCF * angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		LH.C0 = clerp(LH.C0, cf(-1, -1 + 0.1 * math.cos(sine / 20), 0.1) * LHCF * angles(math.rad(0), math.rad(20), math.rad(0)), 0.3)
		FakeHandleWeld.C0 = clerp(FakeHandleWeld.C0, CFrame.new(0, 0, 0) * angles(math.rad(60), math.rad(0), math.rad(0)), 0.3)
		MotorWeld.C0 = clerp(MotorWeld.C0, cf(0, 0, 0) * angles(math.rad(0 - 10 * math.cos(sine / 30)), math.rad(hobb), math.rad(0 - 30 * math.cos(sine / 30))), 0.3)
		Motor2Weld.C0 = clerp(Motor2Weld.C0, cf(0, 0, 0) * angles(math.rad(0 + 10 * math.cos(sine / 30)), math.rad(-hobb), math.rad(0 + 30 * math.cos(sine / 30))), 0.3)
	end
	end
	con:disconnect()
	attack = false
end

	attacktwo2 = function()
	local didit = false
	local possible = true
	attack = true
	local con = Hitbox.Touched:connect(function(hit)
		if possible == true then
		didit = true
		end
		possible = false
		BlockEffect(BrickColor.new("Really black"), hit.CFrame, 1, 1, 1, 10, 10, 10, 0.07)
		Damagefunc(Hitbox, hit, 15, 30, math.random(1, 5), "freeze", RootPart, 0.2, "rbxassetid://199149221", 0.8)
		local asd = Instance.new("Fire", hit)
		asd.Color = Color3.new()
		asd.SecondaryColor = Color3.new()
		while didit == true do
		swait()
		hit.Parent.Torso.CFrame = Center.CFrame * CFrame.new(0,1,0) * CFrame.fromEulerAnglesXYZ(90,0,90)
		end
		followthrough = 5
		for i = 0,100, 1 do
			hit.Parent.Humanoid.Health = hit.Parent.Humanoid.Health - 0.05
			if hit.Parent.Humanoid.Health > 0.05 then
			cooldown4 = cooldown4 + (0.01)
			end
			swait()
		end
		asd:Destroy()
	end
)
	for i = 0, 1, 0.2 do
		swait()
		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cf(0, 0, 0 - 0.1 * math.cos(sine / 20)) * angles(math.rad(0), math.rad(0), math.rad(-90)), 0.3)
		Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(10), math.rad(0), math.rad(90)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(0), math.rad(0), math.rad(90)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(0), math.rad(0), math.rad(-10)), 0.3)
		RH.C0 = clerp(RH.C0, cf(1, -1 + 0.1 * math.cos(sine / 20), 0) * RHCF * angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		LH.C0 = clerp(LH.C0, cf(-1, -1 + 0.1 * math.cos(sine / 20), 0.1) * LHCF * angles(math.rad(0), math.rad(20), math.rad(0)), 0.3)
		FakeHandleWeld.C0 = clerp(FakeHandleWeld.C0, CFrame.new(0, 0, 0) * angles(math.rad(60), math.rad(0), math.rad(0)), 0.3)
		MotorWeld.C0 = clerp(MotorWeld.C0, cf(0, 0, 0) * angles(math.rad(0 - 10 * math.cos(sine / 30)), math.rad(hobb), math.rad(0 - 30 * math.cos(sine / 30))), 0.3)
		Motor2Weld.C0 = clerp(Motor2Weld.C0, cf(0, 0, 0) * angles(math.rad(0 + 10 * math.cos(sine / 30)), math.rad(-hobb), math.rad(0 + 30 * math.cos(sine / 30))), 0.3)
	end
	CreateSound("rbxasset://sounds/swordlunge.wav", RootPart, 1, 1.2)
	for i = 0, 1, 0.1 do
		swait()
		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cf(0, 0, 0 - 0.1 * math.cos(sine / 20)) * angles(math.rad(0), math.rad(0), math.rad(50)), 0.3)
		Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(10), math.rad(0), math.rad(-50)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(0), math.rad(0), math.rad(90)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(90), math.rad(0), math.rad(-10)), 0.3)
		RH.C0 = clerp(RH.C0, cf(1, -1 + 0.1 * math.cos(sine / 20), 0) * RHCF * angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		LH.C0 = clerp(LH.C0, cf(-1, -1 + 0.1 * math.cos(sine / 20), 0.1) * LHCF * angles(math.rad(0), math.rad(20), math.rad(0)), 0.3)
		FakeHandleWeld.C0 = clerp(FakeHandleWeld.C0, CFrame.new(0, 0, 0) * angles(math.rad(-40), math.rad(0), math.rad(0)), 0.3)
		MotorWeld.C0 = clerp(MotorWeld.C0, cf(0, 0, 0) * angles(math.rad(0 - 10 * math.cos(sine / 30)), math.rad(hobb), math.rad(0 - 30 * math.cos(sine / 30))), 0.3)
		Motor2Weld.C0 = clerp(Motor2Weld.C0, cf(0, 0, 0) * angles(math.rad(0 + 10 * math.cos(sine / 30)), math.rad(-hobb), math.rad(0 + 30 * math.cos(sine / 30))), 0.3)
	end
	if didit == true then
	for i = 0, 1, 0.2 do
		swait()
		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cf(0, 0, 0 - 0.1 * math.cos(sine / 20)) * angles(math.rad(0), math.rad(0), math.rad(-90)), 0.3)
		Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(10), math.rad(0), math.rad(90)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(0), math.rad(0), math.rad(90)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(0), math.rad(0), math.rad(-10)), 0.3)
		RH.C0 = clerp(RH.C0, cf(1, -1 + 0.1 * math.cos(sine / 20), 0) * RHCF * angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		LH.C0 = clerp(LH.C0, cf(-1, -1 + 0.1 * math.cos(sine / 20), 0.1) * LHCF * angles(math.rad(0), math.rad(20), math.rad(0)), 0.3)
		FakeHandleWeld.C0 = clerp(FakeHandleWeld.C0, CFrame.new(0, 0, 0) * angles(math.rad(60), math.rad(0), math.rad(0)), 0.3)
		MotorWeld.C0 = clerp(MotorWeld.C0, cf(0, 0, 0) * angles(math.rad(0 - 10 * math.cos(sine / 30)), math.rad(hobb), math.rad(0 - 30 * math.cos(sine / 30))), 0.3)
		Motor2Weld.C0 = clerp(Motor2Weld.C0, cf(0, 0, 0) * angles(math.rad(0 + 10 * math.cos(sine / 30)), math.rad(-hobb), math.rad(0 + 30 * math.cos(sine / 30))), 0.3)
	end
	for i = 0, 1, 0.1 do
		swait()
		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cf(0, 0, 0 - 0.1 * math.cos(sine / 20)) * angles(math.rad(0), math.rad(0), math.rad(50)), 0.3)
		Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(10), math.rad(0), math.rad(-50)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(0), math.rad(0), math.rad(90)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(90), math.rad(0), math.rad(-10)), 0.3)
		RH.C0 = clerp(RH.C0, cf(1, -1 + 0.1 * math.cos(sine / 20), 0) * RHCF * angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		LH.C0 = clerp(LH.C0, cf(-1, -1 + 0.1 * math.cos(sine / 20), 0.1) * LHCF * angles(math.rad(0), math.rad(20), math.rad(0)), 0.3)
		FakeHandleWeld.C0 = clerp(FakeHandleWeld.C0, CFrame.new(0, 0, 0) * angles(math.rad(-40), math.rad(0), math.rad(0)), 0.3)
		MotorWeld.C0 = clerp(MotorWeld.C0, cf(0, 0, 0) * angles(math.rad(0 - 10 * math.cos(sine / 30)), math.rad(hobb), math.rad(0 - 30 * math.cos(sine / 30))), 0.3)
		Motor2Weld.C0 = clerp(Motor2Weld.C0, cf(0, 0, 0) * angles(math.rad(0 + 10 * math.cos(sine / 30)), math.rad(-hobb), math.rad(0 + 30 * math.cos(sine / 30))), 0.3)
	end
	didit = false
	Humanoid.Jump = true
	Torso.Velocity = RootPart.CFrame.lookVector * -150
	for i = 0, 1, 0.2 do
		swait()
		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cf(0, 0, 0 - 0.1 * math.cos(sine / 20)) * angles(math.rad(0), math.rad(0), math.rad(90)), 0.3)
		Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(10), math.rad(0), math.rad(90)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(0), math.rad(0), math.rad(90)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(0), math.rad(0), math.rad(-10)), 0.3)
		RH.C0 = clerp(RH.C0, cf(1, -1 + 0.1 * math.cos(sine / 20), 0) * RHCF * angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		LH.C0 = clerp(LH.C0, cf(-1, -1 + 0.1 * math.cos(sine / 20), 0.1) * LHCF * angles(math.rad(0), math.rad(20), math.rad(0)), 0.3)
		FakeHandleWeld.C0 = clerp(FakeHandleWeld.C0, CFrame.new(0, 0, 0) * angles(math.rad(60), math.rad(0), math.rad(0)), 0.3)
		MotorWeld.C0 = clerp(MotorWeld.C0, cf(0, 0, 0) * angles(math.rad(0 - 10 * math.cos(sine / 30)), math.rad(hobb), math.rad(0 - 30 * math.cos(sine / 30))), 0.3)
		Motor2Weld.C0 = clerp(Motor2Weld.C0, cf(0, 0, 0) * angles(math.rad(0 + 10 * math.cos(sine / 30)), math.rad(-hobb), math.rad(0 + 30 * math.cos(sine / 30))), 0.3)
	end
	end
	swait(25)
	con:disconnect()
	attack = false
	if possible == false then
	storm2()
	end
	
end

	storm2 = function()
	
	attack = true
	local con = Hitbox.Touched:connect(function(hit)
		
		BlockEffect(BrickColor.new("Really black"), hit.CFrame, 1, 1, 1, 10, 10, 10, 0.07)
		Damagefunc(Hitbox, hit, 15, 30, math.random(1, 5), "freeze", RootPart, 0.2, "rbxassetid://199149221", 0.8)
		local asd = Instance.new("Fire", hit)
		asd.Color = Color3.new()
		asd.SecondaryColor = Color3.new()
		for i = 0,100, 1 do
			hit.Parent.Humanoid.Health = hit.Parent.Humanoid.Health - 0.05
			if hit.Parent.Humanoid.Health > 0.05 then
			cooldown4 = cooldown4 + (0.01)
			end
			swait()
		end
		asd:Destroy()
	end
	)
	Humanoid.WalkSpeed = 0
	if followthrough >= 1 then
	Humanoid.Jump = true
	Torso.Velocity = RootPart.CFrame.lookVector * 150
	followthrough = 0
	end
	for i = 0, 1, 6 do
	for i = 0, 1, 0.04 do
		swait()
		BlockEffect(BrickColor.new("Really black"), RootPart.CFrame, 1, 1, 1, 60, 60, 60, 0.07)
		MagniDamage(RootPart, 45, 1,5, 1, "Dark")
		RootPart.CFrame = Torso.CFrame * CFrame.fromEulerAnglesXYZ(-0.01,0,0)
		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cf(0, 0, 0 - 0.1 * math.cos(sine / 20)) * angles(math.rad(0), math.rad(0), math.rad(50)), 0.3)
		Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(10), math.rad(0), math.rad(-50)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(0), math.rad(0), math.rad(90)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(0), math.rad(0), math.rad(-10)), 0.3)
		RH.C0 = clerp(RH.C0, cf(1, -1 + 0.1 * math.cos(sine / 20), 0) * RHCF * angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		LH.C0 = clerp(LH.C0, cf(-1, -1 + 0.1 * math.cos(sine / 20), 0.1) * LHCF * angles(math.rad(0), math.rad(20), math.rad(0)), 0.3)
		FakeHandleWeld.C0 = clerp(FakeHandleWeld.C0, CFrame.new(0, 0, 0) * angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		MotorWeld.C0 = clerp(MotorWeld.C0, cf(0, 0, 0) * angles(math.rad(0 - 10 * math.cos(sine / 30)), math.rad(hobb), math.rad(0 - 30 * math.cos(sine / 30))), 0.3)
		Motor2Weld.C0 = clerp(Motor2Weld.C0, cf(0, 0, 0) * angles(math.rad(0 + 10 * math.cos(sine / 30)), math.rad(-hobb), math.rad(0 + 30 * math.cos(sine / 30))), 0.3)
	end
	CreateSound("http://roblox.com/asset/?id=10209645", RootPart, 1, 1)
	swait()
	end
	con:disconnect()
	Humanoid.WalkSpeed = 16
	attack = false
end

	sh00t = function()
	
	attack = true
	Humanoid.WalkSpeed = 10
	for i = 0, 1, 0.1 do
		swait()
		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cf(0, 0, 0 - 0.1 * math.cos(sine / 20)) * angles(math.rad(0), math.rad(0), math.rad(-90)), 0.3)
		Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(10), math.rad(0), math.rad(90)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(0), math.rad(0), math.rad(-90)), 0.3)
		RH.C0 = clerp(RH.C0, cf(1, -1 + 0.1 * math.cos(sine / 20), 0) * RHCF * angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		LH.C0 = clerp(LH.C0, cf(-1, -1 + 0.1 * math.cos(sine / 20), 0.1) * LHCF * angles(math.rad(0), math.rad(20), math.rad(0)), 0.3)
		FakeHandleWeld.C0 = clerp(FakeHandleWeld.C0, CFrame.new(0, 0, 0) * angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		MotorWeld.C0 = clerp(MotorWeld.C0, cf(0, 0, -5) * angles(math.rad(90), math.rad(0), math.rad(0)), 0.3)
		Motor2Weld.C0 = clerp(Motor2Weld.C0, cf(0, 0, -3) * angles(math.rad(90), math.rad(0), math.rad(0)), 0.3)
	end
	for i = 0, 2 do 
	Torso.Velocity = RootPart.CFrame.lookVector * -50
	SphereEffect(BrickColor.new("Pastel Blue"), LeftArm.CFrame * CFrame.new(0,-1,0), 40, 40, 40, 15, 15, 15, 0.05)
	RingEffect(BrickColor.new("Pastel Blue"), Motor2.CFrame * angles(math.rad(0), 0, 0), 3, 3, 1, 1, 1, 0, 0.04)
	shoottraildd2(mouse, LeftArm, 0, 2, "Explosive")
	swait(5)
	end
	for i = 0, 1, 0.1 do
		swait()
		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cf(0, 0, 0 - 0.1 * math.cos(sine / 20)) * angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(10), math.rad(0), math.rad(0)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(-70), math.rad(0), math.rad(0)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(0), math.rad(-90), math.rad(-100)), 0.3)
		RH.C0 = clerp(RH.C0, cf(1, -1 + 0.1 * math.cos(sine / 20), 0) * RHCF * angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		LH.C0 = clerp(LH.C0, cf(-1, -1 + 0.1 * math.cos(sine / 20), 0.1) * LHCF * angles(math.rad(0), math.rad(20), math.rad(0)), 0.3)
		FakeHandleWeld.C0 = clerp(FakeHandleWeld.C0, CFrame.new(0, 0, 0) * angles(math.rad(60), math.rad(0), math.rad(-40)), 0.3)
		MotorWeld.C0 = clerp(MotorWeld.C0, cf(0, 0, -4) * angles(math.rad(90), math.rad(0), math.rad(0)), 0.3)
		Motor2Weld.C0 = clerp(Motor2Weld.C0, cf(0, 0, -8) * angles(math.rad(90), math.rad(0), math.rad(0)), 0.3)
	end
	CreateSound("rbxassetid://357568316", RootPart, 0.5, 1.2)
	RingEffect(BrickColor.new("Pastel Blue"), Motor.CFrame * angles(math.rad(0), 0, 0), 20, 20, 1, -1, -1, 0, 0.07)
	
	
	for i = 0, 1, 0.1 do
		swait()
		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cf(0, 0, 0 - 0.1 * math.cos(sine / 20)) * angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(10), math.rad(0), math.rad(0)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(-70), math.rad(0), math.rad(0)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(0), math.rad(0), math.rad(-100)), 0.3)
		RH.C0 = clerp(RH.C0, cf(1, -1 + 0.1 * math.cos(sine / 20), 0) * RHCF * angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		LH.C0 = clerp(LH.C0, cf(-1, -1 + 0.1 * math.cos(sine / 20), 0.1) * LHCF * angles(math.rad(0), math.rad(20), math.rad(0)), 0.3)
		FakeHandleWeld.C0 = clerp(FakeHandleWeld.C0, CFrame.new(0, 0, 0) * angles(math.rad(60), math.rad(0), math.rad(-40)), 0.3)
		MotorWeld.C0 = clerp(MotorWeld.C0, cf(0, 0, -4) * angles(math.rad(90), math.rad(0), math.rad(0)), 0.3)
		Motor2Weld.C0 = clerp(Motor2Weld.C0, cf(0, 0, -8) * angles(math.rad(90), math.rad(hobb), math.rad(0)), 0.3)
	end
	Humanoid.WalkSpeed = 16
	attack = false
	end
	
	telehop = function()
	
	attack = true
	Humanoid.WalkSpeed = 10
	for i = 0, 1, 0.1 do
		swait()
		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cf(0, 0, 0 - 0.1 * math.cos(sine / 20)) * angles(math.rad(0), math.rad(0), math.rad(-90)), 0.3)
		Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(10), math.rad(0), math.rad(90)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(0), math.rad(0), math.rad(-90)), 0.3)
		RH.C0 = clerp(RH.C0, cf(1, -1 + 0.1 * math.cos(sine / 20), 0) * RHCF * angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		LH.C0 = clerp(LH.C0, cf(-1, -1 + 0.1 * math.cos(sine / 20), 0.1) * LHCF * angles(math.rad(0), math.rad(20), math.rad(0)), 0.3)
		FakeHandleWeld.C0 = clerp(FakeHandleWeld.C0, CFrame.new(0, 0, 0) * angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		MotorWeld.C0 = clerp(MotorWeld.C0, cf(0, 0, -5) * angles(math.rad(90), math.rad(0), math.rad(0)), 0.3)
		Motor2Weld.C0 = clerp(Motor2Weld.C0, cf(0, 0, -3) * angles(math.rad(90), math.rad(0), math.rad(0)), 0.3)
	end
	Torso.Velocity = RootPart.CFrame.lookVector * -50
	SphereEffect(BrickColor.new("Really black"), LeftArm.CFrame * CFrame.new(0,-1,0), 40, 40, 40, 15, 15, 15, 0.05)
	RingEffect(BrickColor.new("Really black"), Motor2.CFrame * angles(math.rad(0), 0, 0), 3, 3, 1, 1, 1, 0, 0.04)
	shoottraildd22(mouse, LeftArm, 0, 2, "Explosive")
	swait(5)
	CreateSound("rbxassetid://357568316", RootPart, 0.5, 1.2)
	
	
	for i = 0, 1, 0.1 do
		swait()
		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cf(0, 0, 0 - 0.1 * math.cos(sine / 20)) * angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(10), math.rad(0), math.rad(0)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(-70), math.rad(0), math.rad(0)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(0), math.rad(0), math.rad(-100)), 0.3)
		RH.C0 = clerp(RH.C0, cf(1, -1 + 0.1 * math.cos(sine / 20), 0) * RHCF * angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		LH.C0 = clerp(LH.C0, cf(-1, -1 + 0.1 * math.cos(sine / 20), 0.1) * LHCF * angles(math.rad(0), math.rad(20), math.rad(0)), 0.3)
		FakeHandleWeld.C0 = clerp(FakeHandleWeld.C0, CFrame.new(0, 0, 0) * angles(math.rad(60), math.rad(0), math.rad(-40)), 0.3)
		MotorWeld.C0 = clerp(MotorWeld.C0, cf(0, 0, -4) * angles(math.rad(90), math.rad(0), math.rad(0)), 0.3)
		Motor2Weld.C0 = clerp(Motor2Weld.C0, cf(0, 0, -8) * angles(math.rad(90), math.rad(hobb), math.rad(0)), 0.3)
	end
	Humanoid.WalkSpeed = 32
	attack = false
end

	shoottraildd2 = function(mouse, partt, SpreadAmount, multiply, Type)
	
	local SpreadVectors = Vector3.new(math.random(-SpreadAmount, SpreadAmount), math.random(-SpreadAmount, SpreadAmount), math.random(-SpreadAmount, SpreadAmount))
	local MainPos = partt.Position
	local MainPos2 = mouse.Hit.p + SpreadVectors
	local MouseLook = CFrame.new((MainPos + MainPos2) / 2, MainPos2)
	local speed = 100
	local num = 200
	coroutine.resume(coroutine.create(function()
		
		repeat
			swait()
			MainPos2 = mouse.Hit.p + SpreadVectors
			MouseLook = CFrame.new((MainPos + MainPos2) / 2, MainPos2)
			local hit, pos = rayCast(MainPos, MouseLook.lookVector, speed, RootPart.Parent)
			local mag = (MainPos - pos).magnitude
			if Type == "Explosive" then
				Laser(BrickColor.new("Pastel Blue"), CFrame.new((MainPos + pos) / 2, pos) * angles(1.57, 0, 0), 1, mag * (speed / (speed / 2)), 1, -1, 0, -1, 0.05)
			elseif Type == "Poison" then
				Laser(BrickColor.new("Bright violet"), CFrame.new((MainPos + pos) / 2, pos) * angles(1.57, 0, 0), 1, mag * (speed / (speed / 2)), 1, -0.175, 0, -0.175, 0.15)
				Effects.Sphere.Create(BrickColor.new("Bright violet"), CFrame.new((MainPos + pos) / 2, pos), 1, 1, 1, 2, 2, 2, 0.07)
			elseif Type == "Stun" then
				Laser(BrickColor.new("White"), CFrame.new((MainPos + pos) / 2, pos) * angles(1.57, 0, 0), 1, mag * (speed / (speed / 2)), 1, -0.175, 0, -0.175, 0.15)
			end
			MainPos = MainPos + MouseLook.lookVector * speed
			num = num - 1
			MouseLook = MouseLook * angles(0,.2,0)

			if hit ~= nil then
				num = 0				
				local refpart = CreatePart(workspace, "SmoothPlastic", 0, 1, BrickColor.new("Really black"), "Effect", Vector3.new())
				refpart.Anchored = true
				refpart.CFrame = CFrame.new(pos)
				game:GetService("Debris"):AddItem(refpart, 2)
				BlockEffect(BrickColor.new("Pastel Blue"), refpart.CFrame, 1, 1, 1, 30, 30, 30, 0.07)
				MagniDamage(refpart, 15, 1,5, 1, "Freeze")
				swait()
			end
			do
				if num <= 0 then
					local refpart = CreatePart(workspace, "SmoothPlastic", 0, 1, BrickColor.new("Really black"), "Effect", Vector3.new())
					refpart.Anchored = true
					refpart.CFrame = CFrame.new(pos)
					if hit ~= nil or hit == nil then
						if Type == "Explosive" then
							BlockEffect(BrickColor.new("Pastel Blue"), refpart.CFrame, 1, 1, 1, 30, 30, 30, 0.07)
							MagniDamage(refpart, 15, 10, 15, -5, "Normal")
							while attack == true do
							swait()
							end
							BlockEffect(BrickColor.new("Pastel Blue"), refpart.CFrame, 1, 1, 1, 90, 90, 90, 0.07)
							MagniDamage(refpart, 30, 10, 15, -5, "Normal")
							
						else
							if Type == "Poison" then
								if hit.Name == "Head" then
									Effects.Block.Create(BrickColor.new("Bright violet"), refpart.CFrame, 1, 1, 1, 1, 1, 1, 0.07)
									MagniDamage(refpart, 5, 18 * multiply, 20 * multiply, 0, "Curse")
								else
									Effects.Sphere.Create(BrickColor.new("Bright violet"), refpart.CFrame, 1, 1, 1, 1, 1, 1, 0.07)
									MagniDamage(refpart, 5, 3 * multiply, 3 * multiply, 0, "Curse")
								end
							else
								if Type == "Stun" then
									Effects.Block.Create(BrickColor.new("White"), refpart.CFrame, 1, 1, 1, 1, 1, 1, 0.07)
									MagniDamage(refpart, 5, 10 * multiply, 10 * multiply, 0, "Freeze")
								end
							end
						end
					end
					game:GetService("Debris"):AddItem(refpart, 0)
				end
			end
		until num <= 0
	end
))
end
	
	shoottraildd22 = function(mouse, partt, SpreadAmount, multiply, Type)
	
	local SpreadVectors = Vector3.new(math.random(-SpreadAmount, SpreadAmount), math.random(-SpreadAmount, SpreadAmount), math.random(-SpreadAmount, SpreadAmount))
	local MainPos = partt.Position
	local MainPos2 = mouse.Hit.p + SpreadVectors
	local MouseLook = CFrame.new((MainPos + MainPos2) / 2, MainPos2)
	local speed = 100
	local num = 200
	coroutine.resume(coroutine.create(function()
		
		repeat
			swait()
			MainPos2 = mouse.Hit.p + SpreadVectors
			MouseLook = CFrame.new((MainPos + MainPos2) / 2, MainPos2)
			local hit, pos = rayCast(MainPos, MouseLook.lookVector, speed, RootPart.Parent)
			local mag = (MainPos - pos).magnitude
			if Type == "Explosive" then
				Laser(BrickColor.new("Really black"), CFrame.new((MainPos + pos) / 2, pos) * angles(1.57, 0, 0), 1, mag * (speed / (speed / 2)), 1, -1, 0, -1, 0.05)
			elseif Type == "Poison" then
				Laser(BrickColor.new("Bright violet"), CFrame.new((MainPos + pos) / 2, pos) * angles(1.57, 0, 0), 1, mag * (speed / (speed / 2)), 1, -0.175, 0, -0.175, 0.15)
				Effects.Sphere.Create(BrickColor.new("Bright violet"), CFrame.new((MainPos + pos) / 2, pos), 1, 1, 1, 2, 2, 2, 0.07)
			elseif Type == "Stun" then
				Laser(BrickColor.new("White"), CFrame.new((MainPos + pos) / 2, pos) * angles(1.57, 0, 0), 1, mag * (speed / (speed / 2)), 1, -0.175, 0, -0.175, 0.15)
			end
			MainPos = MainPos + MouseLook.lookVector * speed
			num = num - 1
			MouseLook = MouseLook * angles(0,.2,0)

			if hit ~= nil then
				num = 0				
				local refpart = CreatePart(workspace, "SmoothPlastic", 0, 1, BrickColor.new("Really black"), "Effect", Vector3.new())
				refpart.Anchored = true
				refpart.CFrame = CFrame.new(pos)
				game:GetService("Debris"):AddItem(refpart, 2)
				--BlockEffect(BrickColor.new("Pastel Blue"), refpart.CFrame, 1, 1, 1, 30, 30, 30, 0.07)
				--MagniDamage(refpart, 15, 1,5, 1, "Freeze")
				swait()
			end
			do
				if num <= 0 then
					local refpart = CreatePart(workspace, "SmoothPlastic", 0, 1, BrickColor.new("Really black"), "Effect", Vector3.new())
					refpart.Anchored = true
					refpart.CFrame = CFrame.new(pos)
					if hit ~= nil or hit == nil then
						if Type == "Explosive" then
							BlockEffect(BrickColor.new("Really black"), refpart.CFrame, 1, 1, 1, 30, 30, 30, 0.07)
							MagniDamage(refpart, 15, 10, 15, -5, "Normal")
							Torso.CFrame = refpart.CFrame + Vector3.new(0,2,0)
							while attack == true do
							swait()
							end
							--BlockEffect(BrickColor.new("Pastel Blue"), refpart.CFrame, 1, 1, 1, 90, 90, 90, 0.07)
							--MagniDamage(refpart, 30, 10, 15, -5, "Normal")
							
						else
							if Type == "Poison" then
								if hit.Name == "Head" then
									Effects.Block.Create(BrickColor.new("Bright violet"), refpart.CFrame, 1, 1, 1, 1, 1, 1, 0.07)
									MagniDamage(refpart, 5, 18 * multiply, 20 * multiply, 0, "Curse")
								else
									Effects.Sphere.Create(BrickColor.new("Bright violet"), refpart.CFrame, 1, 1, 1, 1, 1, 1, 0.07)
									MagniDamage(refpart, 5, 3 * multiply, 3 * multiply, 0, "Curse")
								end
							else
								if Type == "Stun" then
									Effects.Block.Create(BrickColor.new("White"), refpart.CFrame, 1, 1, 1, 1, 1, 1, 0.07)
									MagniDamage(refpart, 5, 10 * multiply, 10 * multiply, 0, "Freeze")
								end
							end
						end
					end
					game:GetService("Debris"):AddItem(refpart, 0)
				end
			end
		until num <= 0
	end
))
end

	seek = function()
	
	attack = true
	Humanoid.WalkSpeed = 10
	for i = 0, 1, 0.1 do
		swait()
		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cf(0, 0, 0 - 0.1 * math.cos(sine / 20)) * angles(math.rad(0), math.rad(0), math.rad(-90)), 0.3)
		Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(10), math.rad(0), math.rad(90)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(0), math.rad(0), math.rad(-90)), 0.3)
		RH.C0 = clerp(RH.C0, cf(1, -1 + 0.1 * math.cos(sine / 20), 0) * RHCF * angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		LH.C0 = clerp(LH.C0, cf(-1, -1 + 0.1 * math.cos(sine / 20), 0.1) * LHCF * angles(math.rad(0), math.rad(20), math.rad(0)), 0.3)
		FakeHandleWeld.C0 = clerp(FakeHandleWeld.C0, CFrame.new(0, 0, 0) * angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		MotorWeld.C0 = clerp(MotorWeld.C0, cf(0, 0, 0) * angles(math.rad(0), math.rad(hobb), math.rad(0 - 30 * math.cos(sine / 30))), 0.3)
		Motor2Weld.C0 = clerp(Motor2Weld.C0, cf(0, 10, 0) * angles(math.rad(90), math.rad(0), math.rad(0)), 0.3)
	end
	CreateSound("http://www.roblox.com/asset?id=243711369", RootPart, 1, 1.5)
	local icepart1 = CreatePart(effect, "SmoothPlastic", 0.5, 0, BrickColor.new("White"), "Ice", vt(2, 4, 2))
	icepart1.Anchored = true
	icepart1.Material = Enum.Material.Neon
	i1msh = CreateMesh("SpecialMesh", icepart1, "FileMesh", "http://www.roblox.com/asset/?id=1778999", vt(0, 0, 0), vt(0.7, 2, 0.7))
	icepart1.CFrame = cf(Motor2.Position)
	game:GetService("Debris"):AddItem(icepart1, 20)
	MouseLook = cf(icepart1.Position, mouse.Hit.p)
	table.insert(ShootEffects, {MouseLook, "ShootIce", 50, icepart1.Position, 8, 27, 0, icepart1, 7, 2})
	for i = 0, 1, 0.1 do
		swait()
		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cf(0, 0, 0 - 0.1 * math.cos(sine / 20)) * angles(math.rad(0), math.rad(0), math.rad(-90)), 0.3)
		Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(10), math.rad(0), math.rad(90)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(-70), math.rad(0), math.rad(0)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(0), math.rad(-90), math.rad(-100)), 0.3)
		RH.C0 = clerp(RH.C0, cf(1, -1 + 0.1 * math.cos(sine / 20), 0) * RHCF * angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		LH.C0 = clerp(LH.C0, cf(-1, -1 + 0.1 * math.cos(sine / 20), 0.1) * LHCF * angles(math.rad(0), math.rad(20), math.rad(0)), 0.3)
		FakeHandleWeld.C0 = clerp(FakeHandleWeld.C0, CFrame.new(0, 0, 0) * angles(math.rad(60), math.rad(0), math.rad(-40)), 0.3)
		MotorWeld.C0 = clerp(MotorWeld.C0, cf(0, 0, 0) * angles(math.rad(0), math.rad(hobb), math.rad(0 - 30 * math.cos(sine / 30))), 0.3)
		Motor2Weld.C0 = clerp(Motor2Weld.C0, cf(0, 10, 0) * angles(math.rad(90), math.rad(0), math.rad(0)), 0.3)
	end
	RingEffect(BrickColor.new("Pastel Blue"), Motor2.CFrame * angles(math.rad(0), 0, 0), 20, 20, 1, -1, -1, 0, 0.07)
	SphereEffect(BrickColor.new("Pastel Blue"), Motor2.CFrame, 10, 10, 10, 5, 5, 5, 0.07)
	for i = 0, 1, 0.1 do
		swait()
		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cf(0, 0, 0 - 0.1 * math.cos(sine / 20)) * angles(math.rad(0), math.rad(0), math.rad(-90)), 0.3)
		Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(10), math.rad(0), math.rad(90)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(-70), math.rad(0), math.rad(0)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(0), math.rad(0), math.rad(-100)), 0.3)
		RH.C0 = clerp(RH.C0, cf(1, -1 + 0.1 * math.cos(sine / 20), 0) * RHCF * angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		LH.C0 = clerp(LH.C0, cf(-1, -1 + 0.1 * math.cos(sine / 20), 0.1) * LHCF * angles(math.rad(0), math.rad(20), math.rad(0)), 0.3)
		FakeHandleWeld.C0 = clerp(FakeHandleWeld.C0, CFrame.new(0, 0, 0) * angles(math.rad(60), math.rad(0), math.rad(-40)), 0.3)
		MotorWeld.C0 = clerp(MotorWeld.C0, cf(0, 0, 0) * angles(math.rad(0), math.rad(hobb), math.rad(0 - 30 * math.cos(sine / 30))), 0.3)
		Motor2Weld.C0 = clerp(Motor2Weld.C0, cf(0, 10, 0) * angles(math.rad(90), math.rad(0), math.rad(0)), 0.3)
	end
	Humanoid.WalkSpeed = 10
	attack = false
end

	bring = function()
	
	attack = true
	for i = 0, 1, 0.1 do
		swait()
		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cf(0, 0, 0 - 0.1 * math.cos(sine / 20)) * angles(math.rad(0), math.rad(0), math.rad(-90)), 0.3)
		Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(10), math.rad(0), math.rad(90)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(0), math.rad(0), math.rad(-90)), 0.3)
		RH.C0 = clerp(RH.C0, cf(1, -1 + 0.1 * math.cos(sine / 20), 0) * RHCF * angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		LH.C0 = clerp(LH.C0, cf(-1, -1 + 0.1 * math.cos(sine / 20), 0.1) * LHCF * angles(math.rad(0), math.rad(20), math.rad(0)), 0.3)
		FakeHandleWeld.C0 = clerp(FakeHandleWeld.C0, CFrame.new(0, 0, 0) * angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		MotorWeld.C0 = clerp(MotorWeld.C0, cf(0, 0, -5) * angles(math.rad(0), math.rad(hobb), math.rad(0 - 30 * math.cos(sine / 30))), 0.3)
		Motor2Weld.C0 = clerp(Motor2Weld.C0, cf(0, 0, -30) * angles(math.rad(90), math.rad(0), math.rad(0)), 0.3)
	end
	CreateSound("http://www.roblox.com/asset/?id=188959311", RootPart, 1, 1)
	CreateSound("http://www.roblox.com/asset/?id=241816017", RootPart, 1, 1.2)
	RingEffect(BrickColor.new("Pastel Blue"), Motor.CFrame * angles(math.rad(0), 0, 0), 20, 20, 1, -1, -1, 0, 0.07)
	SphereEffect(BrickColor.new("Pastel Blue"), Motor2.CFrame, 10, 10, 10, 5, 5, 5, 0.07)
	for i = 0, 1, 0.1 do
		swait()
		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cf(0, 0, 0 - 0.1 * math.cos(sine / 20)) * angles(math.rad(0), math.rad(0), math.rad(-40)), 0.3)
		Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(10), math.rad(0), math.rad(40)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(-70), math.rad(0), math.rad(0)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(0), math.rad(-90), math.rad(-100)), 0.3)
		RH.C0 = clerp(RH.C0, cf(1, -1 + 0.1 * math.cos(sine / 20), 0) * RHCF * angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		LH.C0 = clerp(LH.C0, cf(-1, -1 + 0.1 * math.cos(sine / 20), 0.1) * LHCF * angles(math.rad(0), math.rad(20), math.rad(0)), 0.3)
		FakeHandleWeld.C0 = clerp(FakeHandleWeld.C0, CFrame.new(0, 0, 0) * angles(math.rad(60), math.rad(0), math.rad(-40)), 0.3)
		MotorWeld.C0 = clerp(MotorWeld.C0, cf(0, 0, -5) * angles(math.rad(0), math.rad(hobb), math.rad(0 - 30 * math.cos(sine / 30))), 0.3)
		Motor2Weld.C0 = clerp(Motor2Weld.C0, cf(0, 0, -30) * angles(math.rad(90), math.rad(0), math.rad(0)), 0.3)
	end
	MagniDamage(Motor2, 8, 10, 15, 0, "Tele")
	CreateSound("http://www.roblox.com/asset/?id=315744661", Motor, 1, 2)
	SphereEffect(BrickColor.new("Pastel Blue"), Motor2.CFrame, 10, 10, 10, 5, 5, 5, 0.07)
	for i = 0, 1, 0.1 do
		swait()
		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cf(0, 0, 0 - 0.1 * math.cos(sine / 20)) * angles(math.rad(0), math.rad(0), math.rad(-90)), 0.3)
		Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(10), math.rad(0), math.rad(90)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(-70), math.rad(0), math.rad(0)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(0), math.rad(0), math.rad(-100)), 0.3)
		RH.C0 = clerp(RH.C0, cf(1, -1 + 0.1 * math.cos(sine / 20), 0) * RHCF * angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		LH.C0 = clerp(LH.C0, cf(-1, -1 + 0.1 * math.cos(sine / 20), 0.1) * LHCF * angles(math.rad(0), math.rad(20), math.rad(0)), 0.3)
		FakeHandleWeld.C0 = clerp(FakeHandleWeld.C0, CFrame.new(0, 0, 0) * angles(math.rad(60), math.rad(0), math.rad(-40)), 0.3)
		MotorWeld.C0 = clerp(MotorWeld.C0, cf(0, 0, -5) * angles(math.rad(0), math.rad(hobb), math.rad(0 - 30 * math.cos(sine / 30))), 0.3)
		Motor2Weld.C0 = clerp(Motor2Weld.C0, cf(0, 0, -30) * angles(math.rad(90), math.rad(0), math.rad(0)), 0.3)
	end
	SphereEffect(BrickColor.new("Pastel Blue"), Motor.CFrame, 10, 10, 10, 5, 5, 5, 0.07)
	attack = false
end

	Strike = function()
	
	attack = true
	for i = 0, 1, 0.05 do
		swait()
		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cf(0, 0, 0 - 0.1 * math.cos(sine / 20)) * angles(math.rad(0), math.rad(0), math.rad(-90)), 0.3)
		Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(10), math.rad(0), math.rad(90)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(0), math.rad(0), math.rad(90)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(0), math.rad(0), math.rad(-10)), 0.3)
		RH.C0 = clerp(RH.C0, cf(1, -1 + 0.1 * math.cos(sine / 20), 0) * RHCF * angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		LH.C0 = clerp(LH.C0, cf(-1, -1 + 0.1 * math.cos(sine / 20), 0.1) * LHCF * angles(math.rad(0), math.rad(20), math.rad(0)), 0.3)
		FakeHandleWeld.C0 = clerp(FakeHandleWeld.C0, CFrame.new(0, 0, 0) * angles(math.rad(60), math.rad(0), math.rad(0)), 0.3)
		MotorWeld.C0 = clerp(MotorWeld.C0, cf(0, 0, -4) * angles(math.rad(90), math.rad(hobb), math.rad(0)), 0.3)
		Motor2Weld.C0 = clerp(Motor2Weld.C0, cf(0, 0, -5) * angles(math.rad(90), math.rad(hobb), math.rad(0)), 0.3)
	end
	for i = 0, 1, 0.1 do
		swait()
		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cf(0, 0, 0 - 0.1 * math.cos(sine / 20)) * angles(math.rad(0), math.rad(0), math.rad(90)), 0.3)
		Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(10), math.rad(0), math.rad(-90)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(0), math.rad(0), math.rad(90)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(90), math.rad(0), math.rad(-10)), 0.3)
		RH.C0 = clerp(RH.C0, cf(1, -1 + 0.1 * math.cos(sine / 20), 0) * RHCF * angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		LH.C0 = clerp(LH.C0, cf(-1, -1 + 0.1 * math.cos(sine / 20), 0.1) * LHCF * angles(math.rad(0), math.rad(20), math.rad(0)), 0.3)
		FakeHandleWeld.C0 = clerp(FakeHandleWeld.C0, CFrame.new(0, 0, 0) * angles(math.rad(-90), math.rad(0), math.rad(0)), 0.3)
		MotorWeld.C0 = clerp(MotorWeld.C0, cf(0, 0, -4) * angles(math.rad(90), math.rad(hobb * 2), math.rad(0)), 0.3)
		Motor2Weld.C0 = clerp(Motor2Weld.C0, cf(0, 0, -5) * angles(math.rad(90), math.rad(hobb * 2), math.rad(0)), 0.3)
	end
	for i = 0, 1, 0.1 do
		swait()
		CreateSound("http://www.roblox.com/asset/?id=301033949", Hitbox, 1, 2)
		MagniDamage(Motor2, 6, 5, 9, 10, "Knockdown")
		RingEffect(BrickColor.new("Pastel Blue"), Motor2.CFrame * angles(math.rad(0), 0, 0), 5, 5, 1, 1, 1, 0, 0.03)
		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cf(0, 0, 0 - 0.1 * math.cos(sine / 20)) * angles(math.rad(0), math.rad(0), math.rad(90)), 0.3)
		Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(10), math.rad(0), math.rad(-90)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(0), math.rad(0), math.rad(90)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(90), math.rad(0), math.rad(-10)), 0.3)
		RH.C0 = clerp(RH.C0, cf(1, -1 + 0.1 * math.cos(sine / 20), 0) * RHCF * angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		LH.C0 = clerp(LH.C0, cf(-1, -1 + 0.1 * math.cos(sine / 20), 0.1) * LHCF * angles(math.rad(0), math.rad(20), math.rad(0)), 0.3)
		FakeHandleWeld.C0 = clerp(FakeHandleWeld.C0, CFrame.new(0, 0, 0) * angles(math.rad(-90), math.rad(0), math.rad(0)), 0.3)
		MotorWeld.C0 = clerp(MotorWeld.C0, cf(0, 0, -4) * angles(math.rad(90), math.rad(hobb * 2), math.rad(0)), 0.3)
		Motor2Weld.C0 = clerp(Motor2Weld.C0, cf(0, 0, -30) * angles(math.rad(90), math.rad(hobb * 2), math.rad(0)), 0.2)
	end
	for i = 0, 1, 0.05 do
		swait()
		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cf(0, 0, 0 - 0.1 * math.cos(sine / 20)) * angles(math.rad(0), math.rad(0), math.rad(90)), 0.3)
		Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(10), math.rad(0), math.rad(-90)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(0), math.rad(0), math.rad(90)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(90), math.rad(0), math.rad(-10)), 0.3)
		RH.C0 = clerp(RH.C0, cf(1, -1 + 0.1 * math.cos(sine / 20), 0) * RHCF * angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		LH.C0 = clerp(LH.C0, cf(-1, -1 + 0.1 * math.cos(sine / 20), 0.1) * LHCF * angles(math.rad(0), math.rad(20), math.rad(0)), 0.3)
		FakeHandleWeld.C0 = clerp(FakeHandleWeld.C0, CFrame.new(0, 0, 0) * angles(math.rad(-90), math.rad(0), math.rad(0)), 0.3)
		MotorWeld.C0 = clerp(MotorWeld.C0, cf(0, 0, -4) * angles(math.rad(90), math.rad(hobb * 2), math.rad(0)), 0.3)
		Motor2Weld.C0 = clerp(Motor2Weld.C0, cf(0, 0, -30) * angles(math.rad(90), math.rad(hobb), math.rad(0)), 0.3)
	end
	attack = false
end

	local super = false
	Ultimate = function()
	
	super = true
	attack = true
	Humanoid.JumpPower = 0
	Humanoid.WalkSpeed = 1
	for i = 0, 1, 0.1 do
		swait()
		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cf(0, 0, 0 - 0.1 * math.cos(sine / 20)) * angles(math.rad(0), math.rad(0), math.rad(-90)), 0.3)
		Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(10), math.rad(0), math.rad(90)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(0), math.rad(0), math.rad(90)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(0), math.rad(0), math.rad(-10)), 0.3)
		RH.C0 = clerp(RH.C0, cf(1, -1 + 0.1 * math.cos(sine / 20), 0) * RHCF * angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		LH.C0 = clerp(LH.C0, cf(-1, -1 + 0.1 * math.cos(sine / 20), 0.1) * LHCF * angles(math.rad(0), math.rad(20), math.rad(0)), 0.3)
		FakeHandleWeld.C0 = clerp(FakeHandleWeld.C0, CFrame.new(0, 0, 0) * angles(math.rad(60), math.rad(0), math.rad(0)), 0.3)
		MotorWeld.C0 = clerp(MotorWeld.C0, cf(0, 0, 0) * angles(math.rad(0), math.rad(hobb), math.rad(0)), 0.3)
		Motor2Weld.C0 = clerp(Motor2Weld.C0, cf(0, 0, 0) * angles(math.rad(0), math.rad(-hobb), math.rad(0)), 0.3)
	end
	coroutine.resume(coroutine.create(function()
		
		while super == true do
			randnum = math.random(2, 3) + math.random()
			tehr = math.random(200, 300) / 10000
			StravEffect(BrickColor.new("Pastel Blue"), RootPart.CFrame * angles(0, math.random(-50, 50), 0), -math.random(1, 10), 0, 0, randnum, randnum, randnum, tehr)
			swait(5)
		end
	end
))
	for i = 0, 1, 0.1 do
		swait()
		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cf(0, 0, 0 - 0.1 * math.cos(sine / 20)) * angles(math.rad(0), math.rad(0), math.rad(70)), 0.3)
		Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(0), math.rad(10), math.rad(-70)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(180), math.rad(0), math.rad(0)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(90), math.rad(0), math.rad(-10)), 0.3)
		RH.C0 = clerp(RH.C0, cf(1, -1 + 0.1 * math.cos(sine / 20), 0) * RHCF * angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		LH.C0 = clerp(LH.C0, cf(-1, -1 + 0.1 * math.cos(sine / 20), 0.1) * LHCF * angles(math.rad(0), math.rad(20), math.rad(0)), 0.3)
		FakeHandleWeld.C0 = clerp(FakeHandleWeld.C0, CFrame.new(0, 0, 0) * angles(math.rad(-90), math.rad(0), math.rad(0)), 0.3)
		MotorWeld.C0 = clerp(MotorWeld.C0, cf(0, 15, 0) * angles(math.rad(0), math.rad(hobb), math.rad(0)), 0.3)
		Motor2Weld.C0 = clerp(Motor2Weld.C0, cf(0, 8, 0) * angles(math.rad(0), math.rad(-hobb), math.rad(0)), 0.3)
	end
	CreateSound("http://www.roblox.com/asset/?id=156386031", Hitbox, 1, 0.1)
	for i = 1, 300 do
		swait()
		if i % 10 >= 0 then
			RingEffect(BrickColor.new("Medium blue"), RootPart.CFrame * angles(math.random(-50, 50), math.random(-50, 50), math.random(-50, 50)), 20, 20, 1, -1, -1, 0, 0.07)
			WaveEffect(BrickColor.new("Pastel Blue"), RootPart.CFrame * cf(0, -2, 0) * angles(0, 0, 0), 10, 1, 10, -0.5, 1, -0.5, 0.03)
			WaveEffect(BrickColor.new("Pastel Blue"), RootPart.CFrame * cf(0, -2, 0) * angles(0, 0, 0), 1, 1, 1, 0.5, 0, 0.5, 0.03)
		end
		if i % 20 >= 0 then
			CreateSound("http://www.roblox.com/asset/?id=156386031", Hitbox, 1, 0.5)
			CreateSound("http://www.roblox.com/asset/?id=377357774", Hitbox, 1, 0.5)
			Humanoid.Health = Humanoid.Health + 2
			CylinderEffect(BrickColor.new("Medium blue"), RootPart.CFrame, 5, 9999, 5, 5, 0, 5, 0.07)
			MagniDamage(RootPart, 15, 5, 9, 0, "Snare")
		end
		RootJoint.C0 = clerp(RootJoint.C0, RootCF * cf(0, 0, 0 - 0.1 * math.cos(sine / 20)) * angles(math.rad(0), math.rad(0), math.rad(70)), 0.3)
		Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(0), math.rad(10), math.rad(-70)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(170), math.rad(0), math.rad(0)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos(sine / 15), 0) * angles(math.rad(0), math.rad(0), math.rad(-10)), 0.3)
		RH.C0 = clerp(RH.C0, cf(1, -1 + 0.1 * math.cos(sine / 20), 0) * RHCF * angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		LH.C0 = clerp(LH.C0, cf(-1, -1 + 0.1 * math.cos(sine / 20), 0.1) * LHCF * angles(math.rad(0), math.rad(20), math.rad(0)), 0.3)
		FakeHandleWeld.C0 = clerp(FakeHandleWeld.C0, CFrame.new(0, 0, 0) * angles(math.rad(-90), math.rad(0), math.rad(0)), 0.3)
		MotorWeld.C0 = clerp(MotorWeld.C0, cf(0, 15, 0) * angles(math.rad(0), math.rad(hobb * 5), math.rad(0)), 0.3)
		Motor2Weld.C0 = clerp(Motor2Weld.C0, cf(0, 8, 0) * angles(math.rad(0), math.rad(-hobb * 5), math.rad(0)), 0.3)
	end
	Humanoid.JumpPower = 50
	Humanoid.WalkSpeed = 16
	super = false
	attack = false
end

	mouse.Button1Down:connect(function()
	
	if attack == false and attacktype == 1 then
		attacktype = 2
		if ultimate == false then
		attackone()
		end
		if ultimate == true then
		attackone2()
		end
	else
		if attack == false and attacktype == 2 then
			attacktype = 1
			if ultimate == false then
			attacktwo()
			end
			if ultimate == true then
			attacktwo2()
			end
		else
			if attack == false and attacktype == 3 then
				attacktype = 1
				attackthree()
			end
		end
	end
end
)
	mouse.KeyDown:connect(function(k)
	
	k = k:lower()
	if attack == false and co1 <= cooldown1 and k == "z" and ultimate == false then
		cooldown1 = 0
		sh00t()
	else
		if attack == false and co2/2 <= cooldown2 and k == "x" and ultimate == false then
			cooldown2 = cooldown2 - co2/2
			storm()
		else
			if attack == false and co3 <= cooldown3 and k == "c" and ultimate == false then
				cooldown3 = 0
				punch()
			else
				if attack == false and co4 <= cooldown4 and k == "v" then
					ultimate = true
					ddd.VertexColor = Vector3.new(0,0,0)
					ddd.Scale = Vector3.new(0.2,0.45,0.2)
					Humanoid.WalkSpeed = 32
				else
					if attack == false and co1/3 <= cooldown1 and k == "z" and ultimate == true then
						telehop()
					end
				end
			end
		end
	end
end
)
	updateskills = function()
	if ultimate == false then
	asd = asd + 1
	if asd > 4 then
	asd = 0
	randnum = math.random(0.2,0.3) + math.random()
	StravEffect(BrickColor.new("Pastel Blue"), LeftArm.CFrame * CFrame.new(0,-1,0) * angles(0, math.random(-50, 50), 0), -math.random(0.1,1), 0, 0, randnum, randnum, randnum, 0.01)	
	end
	
	BlockEffect(BrickColor.new("Pastel Blue"), LeftArm.CFrame * CFrame.new(0,-1,0), 10, 10, 10, 1, 1, 1, 0.05, 1)
		
	
	if followthrough >= 0.1 then
		text2.Text = "[X]\n Follow-Through " .. followthrough .. ""
		followthrough = followthrough - 0.1
		print(followthrough)
	end	
	
	if followthrough < 0.2 then
		text2.Text = "[X]\n Storm"
	end	
	end
	
	if ultimate == true then
		text1.Text = "[Z]\n Telehop"
		text2.Text = ""
		text3.Text = ""
		text4.Text = "Duration"
	end
	
	if ultimate == false then
		text1.Text = "[Z]\n Ice Beam"
		text3.Text = "[C]\n Needle Punch"
		text4.Text = "[V]\n LOCKED"
	end	
	
	if cooldown1 <= co1 then
		cooldown1 = cooldown1 + 0.033333333333333
	end
	if cooldown2 <= co2 then
		cooldown2 = cooldown2 + 0.033333333333333
	end
	if cooldown3 <= co3 then
		cooldown3 = cooldown3 + 0.033333333333333
	end
	if cooldown4 <= co4 and ultimate == false then
		cooldown4 = cooldown4 + 0.033333333333333
	end
	if cooldown4 >= 0.0633333 and ultimate == true then
		cooldown4 = cooldown4 - 0.063333333333333
	end
	if cooldown4 < 0.0633333 then
		ultimate = false
		ddd.VertexColor = Vector3.new(0.75,0.75,1)
		ddd.Scale = Vector3.new(0.3,0.4,0.3)
		Humanoid.WalkSpeed = 16
	end
end

	while 1 do
		swait()
		if hobb <= 360 then
			hobb = hobb + 2
		else
			hobb = 0
		end
		updateskills()
		bar4:TweenSize(UDim2.new(1 * (cooldown4 / co4), 0, 1, 0), "Out", "Quad", 0.5)
		bar3:TweenSize(UDim2.new(1 * (cooldown3 / co3), 0, 1, 0), "Out", "Quad", 0.5)
		bar1:TweenSize(UDim2.new(1 * (cooldown1 / co1), 0, 1, 0), "Out", "Quad", 0.5)
		bar2:TweenSize(UDim2.new(1 * (cooldown2 / co2), 0, 1, 0), "Out", "Quad", 0.5)
		Torsovelocity = (RootPart.Velocity * Vector3.new(1, 0, 1)).magnitude
		velocity = RootPart.Velocity.y
		sine = sine + change
		local hit, pos = rayCast(RootPart.Position, CFrame.new(RootPart.Position, RootPart.Position - Vector3.new(0, 1, 0)).lookVector, 4, Character)
		if equipped == true or equipped == false then
			if 1 < RootPart.Velocity.y and hit == nil then
				Anim = "Jump"
				if attack == false then
					RootJoint.C0 = clerp(RootJoint.C0, RootCF * cf(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
					Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(-10), math.rad(0), math.rad(0)), 0.3)
					RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * angles(math.rad(-30), math.rad(0), math.rad(0)), 0.3)
					LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * angles(math.rad(-10), math.rad(0), math.rad(-10)), 0.3)
					RH.C0 = clerp(RH.C0, cf(1, -1 + 0.1 * math.cos((sine) / 20), 0) * RHCF * angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
					LH.C0 = clerp(LH.C0, cf(-1, -1 + 0.1 * math.cos((sine) / 20), 0.1) * LHCF * angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
					FakeHandleWeld.C0 = clerp(FakeHandleWeld.C0, CFrame.new(0, 0, 0) * angles(math.rad(50), math.rad(0), math.rad(-40)), 0.3)
					MotorWeld.C0 = clerp(MotorWeld.C0, cf(0, 0, 0) * angles(math.rad(0 - 10 * math.cos((sine) / 30)), math.rad(hobb), math.rad(0 - 30 * math.cos((sine) / 30))), 0.3)
					Motor2Weld.C0 = clerp(Motor2Weld.C0, cf(0, 0, 0) * angles(math.rad(0 + 10 * math.cos((sine) / 30)), math.rad(-hobb), math.rad(0 + 30 * math.cos((sine) / 30))), 0.3)
				end
			else
				if RootPart.Velocity.y < -1 and hit == nil then
					Anim = "Fall"
					if attack == false then
						RootJoint.C0 = clerp(RootJoint.C0, RootCF * cf(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
						Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(20), math.rad(0), math.rad(0)), 0.3)
						RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * angles(math.rad(-30), math.rad(0), math.rad(0)), 0.3)
						LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * angles(math.rad(-10), math.rad(0), math.rad(-10)), 0.3)
						RH.C0 = clerp(RH.C0, cf(1, -1 + 0.1 * math.cos((sine) / 20), 0) * RHCF * angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
						LH.C0 = clerp(LH.C0, cf(-1, -1 + 0.1 * math.cos((sine) / 20), 0.1) * LHCF * angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
						FakeHandleWeld.C0 = clerp(FakeHandleWeld.C0, CFrame.new(0, 0, 0) * angles(math.rad(50), math.rad(0), math.rad(-40)), 0.3)
						MotorWeld.C0 = clerp(MotorWeld.C0, cf(0, 0, 0) * angles(math.rad(0 - 10 * math.cos((sine) / 30)), math.rad(hobb), math.rad(0 - 30 * math.cos((sine) / 30))), 0.3)
						Motor2Weld.C0 = clerp(Motor2Weld.C0, cf(0, 0, 0) * angles(math.rad(0 + 10 * math.cos((sine) / 30)), math.rad(-hobb), math.rad(0 + 30 * math.cos((sine) / 30))), 0.3)
					end
				else
					if Torsovelocity < 2 and hit ~= nil then
						Anim = "Idle"
						if attack == false then
							change = 1
							RootJoint.C0 = clerp(RootJoint.C0, RootCF * cf(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * angles(math.rad(0), math.rad(0), math.rad(-50)), 0.3)
							Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(10), math.rad(0), math.rad(50)), 0.3)
							RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * angles(math.rad(-20), math.rad(0), math.rad(0)), 0.3)
							LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * angles(math.rad(0), math.rad(0), math.rad(-10)), 0.3)
							RH.C0 = clerp(RH.C0, cf(1, -1 + 0.1 * math.cos((sine) / 20), 0) * RHCF * angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
							LH.C0 = clerp(LH.C0, cf(-1, -1 + 0.1 * math.cos((sine) / 20), 0.1) * LHCF * angles(math.rad(0), math.rad(20), math.rad(0)), 0.3)
							FakeHandleWeld.C0 = clerp(FakeHandleWeld.C0, CFrame.new(0, 0, 0) * angles(math.rad(50), math.rad(0), math.rad(-40)), 0.3)
							MotorWeld.C0 = clerp(MotorWeld.C0, cf(0, 0, 0) * angles(math.rad(0 - 10 * math.cos((sine) / 30)), math.rad(hobb), math.rad(0 - 30 * math.cos((sine) / 30))), 0.3)
							Motor2Weld.C0 = clerp(Motor2Weld.C0, cf(0, 0, 0) * angles(math.rad(0 + 10 * math.cos((sine) / 30)), math.rad(-hobb), math.rad(0 + 30 * math.cos((sine) / 30))), 0.3)
						end
					else
						if 2 < Torsovelocity and hit ~= nil then
							Anim = "Walk"
							if attack == false then
								if ultimate == false then
								RootJoint.C0 = clerp(RootJoint.C0, RootCF * cf(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
								Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(10), math.rad(0), math.rad(0)), 0.3)
								RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * angles(math.rad(-30), math.rad(0), math.rad(0)), 0.3)
								LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * angles(math.rad(-10), math.rad(0), math.rad(-10)), 0.3)
								RH.C0 = clerp(RH.C0, cf(1, -1 + 0.1 * math.cos((sine) / 20), 0) * RHCF * angles(math.rad(0), math.rad(0), math.rad(0 - 50 * math.cos((sine) / 3))), 0.3)
								LH.C0 = clerp(LH.C0, cf(-1, -1 + 0.1 * math.cos((sine) / 20), 0.1) * LHCF * angles(math.rad(0), math.rad(0), math.rad(0 - 50 * math.cos((sine) / 3))), 0.3)
								FakeHandleWeld.C0 = clerp(FakeHandleWeld.C0, CFrame.new(0, 0, 0) * angles(math.rad(50), math.rad(0), math.rad(-40)), 0.3)
								MotorWeld.C0 = clerp(MotorWeld.C0, cf(0, 0, 0) * angles(math.rad(0 - 10 * math.cos((sine) / 30)), math.rad(hobb), math.rad(0 - 30 * math.cos((sine) / 30))), 0.3)
								Motor2Weld.C0 = clerp(Motor2Weld.C0, cf(0, 0, 0) * angles(math.rad(0 + 10 * math.cos((sine) / 30)), math.rad(-hobb), math.rad(0 + 30 * math.cos((sine) / 30))), 0.3)
								end
								if ultimate == true then
								RootJoint.C0 = clerp(RootJoint.C0, RootCF * cf(0, 0, 0 - 0.1 * math.cos((sine) / 20)) * angles(math.rad(10), math.rad(0), math.rad(0)), 0.3)
								Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF * angles(math.rad(10), math.rad(0), math.rad(0)), 0.3)
								RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * angles(math.rad(-40), math.rad(0), math.rad(0)), 0.3)
								LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5 - 0.1 * math.cos((sine) / 15), 0) * angles(math.rad(-20), math.rad(0), math.rad(-10)), 0.3)
								RH.C0 = clerp(RH.C0, cf(1, -1 + 0.1 * math.cos((sine) / 20), 0) * RHCF * angles(math.rad(0), math.rad(0), math.rad(0 - 50 * math.cos((sine) / 3))), 0.3)
								LH.C0 = clerp(LH.C0, cf(-1, -1 + 0.1 * math.cos((sine) / 20), 0.1) * LHCF * angles(math.rad(0), math.rad(0), math.rad(0 - 50 * math.cos((sine) / 3))), 0.3)
								FakeHandleWeld.C0 = clerp(FakeHandleWeld.C0, CFrame.new(0, 0, 0) * angles(math.rad(50), math.rad(0), math.rad(-40)), 0.3)
								MotorWeld.C0 = clerp(MotorWeld.C0, cf(0, 0, 0) * angles(math.rad(0 - 10 * math.cos((sine) / 30)), math.rad(hobb), math.rad(0 - 30 * math.cos((sine) / 30))), 0.3)
								Motor2Weld.C0 = clerp(Motor2Weld.C0, cf(0, 0, 0) * angles(math.rad(0 + 10 * math.cos((sine) / 30)), math.rad(-hobb), math.rad(0 + 30 * math.cos((sine) / 30))), 0.3)
								end
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
				if 0 < #ShootEffects then
					for e = 1, #ShootEffects do
						if ShootEffects[e] ~= nil then
							local Thing = ShootEffects[e]
							if Thing ~= nil then
								local Part = Thing[1]
								local Mode = Thing[2]
								local Delay = Thing[3]
								local IncX = Thing[4]
								local IncY = Thing[5]
								local IncZ = Thing[6]
								if Thing[2] == "ShootIce" then
									local Look = Thing[1]
									local hit, pos = rayCast(Thing[4], Look.lookVector, Thing[9], Character)
									local mag = (Thing[4] - pos).magnitude
									Thing[8].CFrame = CFrame.new((Thing[4] + pos) / 2, pos) * angles(-1.57, 0, 0)
									Thing[4] = Thing[4] + Look.lookVector * Thing[9]
									Thing[3] = Thing[3] - 1
									BlockEffect(BrickColor.new("Pastel Blue"), Thing[8].CFrame, 20, 20, 20, 5, 5, 5, 0.1)
									if hit ~= nil or Thing[3] <= 0 then
										Thing[3] = 0
										ref = CreatePart(effect, "SmoothPlastic", 0, 1, BrickColor.new("Really red"), "Reference", vt())
										ref.Anchored = true
										ref.CFrame = cf(pos)
										game:GetService("Debris"):AddItem(ref, 1)
										ref2 = CreatePart(effect, "SmoothPlastic", 0, 1, BrickColor.new("Really red"), "Reference", vt(5, 5, 5))
										ref2.Anchored = true
										ref2.CFrame = cf(pos)
										game:GetService("Debris"):AddItem(ref2, 5)
										size = 3
										if Thing[10] == 2 then
											freeze = true
											size = 4
											CreateSound("http://www.roblox.com/asset/?id=188959279", ref, 1, 1)
										else
											CreateSound("http://www.roblox.com/asset/?id=188959279", ref, 1, 2)
										end
										MagniDamage(ref, size, Thing[5], Thing[6], Thing[7], "Normal")
										freeze = false
										for i = 1, 8 do
											BreakEffect(BrickColor.new("Pastel Blue"), ref.CFrame * cf(math.random(-200, 200) / 100, math.random(-200, 200) / 100, math.random(-200, 200) / 100), math.random(20, 50) / 100, math.random(1, 5), math.random(20, 50) / 100)
										end
										if Thing[10] == 2 then
											for i = 1, 5 do
												BlockEffect(BrickColor.new("Pastel Blue"), cf(ref.Position), 30, 30, 30, 5, 5, 5, 0.05)
											end
										end
									end
												if Thing[3] <= 0 then
													Thing[8].Transparency = 1
													game:GetService("Debris"):AddItem(Thing[8], 5)
													table.remove(ShootEffects, e)
												end
end
end
else
												Part.Parent = nil
												table.remove(ShootEffects, e)
						end
					end
				end
			end