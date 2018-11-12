script.Parent = workspace.CurrentCamera
local plr = game:GetService("Players").LocalPlayer

local tool = Instance.new("Tool",plr:WaitForChild("Backpack"))
tool.Grip = CFrame.new(0,-0.8,-0.2) * CFrame.Angles(math.rad(0),math.rad(180),math.rad(0))
tool.Name = "hammer of holiness"

local part = Instance.new("Part",tool)
part.Name = "Handle"
part.Size = Vector3.new(1,2,1)
part.TopSurface = "Smooth"
part.BottomSurface = "Smooth"
part.CanCollide = false
part:BreakJoints()

local sound = Instance.new("Sound",part)
sound.SoundId = "rbxassetid://511340819"
sound.Volume = 3

local sound2 = Instance.new("Sound",part)
sound2.SoundId = "rbxassetid://280667448"
sound2.Volume = 5

local sound3 = Instance.new("Sound",part)
sound3.SoundId = "rbxassetid://139100774"
sound3.Volume = 10

local sound4 = Instance.new("Sound",part)
sound4.SoundId = "rbxassetid://258057783"
sound4.Volume = 10

local sound5 = Instance.new("Sound",part)
sound5.SoundId = "rbxassetid://130932305"
sound5.Volume = 10

local sound6 = Instance.new("Sound",part)
sound6.SoundId = "rbxassetid://906084456"
sound6.Volume = 10
sound6.TimePosition = 2

function firstHum(target)
	for i,v in pairs(target:GetChildren()) do
		if v:IsA("Humanoid") then
			return v
		end
	end
	return nil
end

local slap = false
local cd = false

plr:GetMouse().Button1Down:connect(function()
	if tool.Parent == plr.Character then
		if slap == false then
			slap = true
			sound2:Play()
			local str = Instance.new("StringValue")
			str.Name = "toolanim"
			str.Value = "Slash"
			str.Parent = tool
			wait(1)
			slap = false
		end
	end
end)

part.Touched:connect(function(hit)
	if slap == true then
		if cd == false then
			if not hit:IsDescendantOf(plr.Character) then
				if hit.Parent:IsA("Model") then
					local fhum = firstHum(hit.Parent)
					if fhum then
						cd = true
						fhum.PlatformStand = true
						sound:Play()
						local con1
						con1 = game:GetService("RunService").Heartbeat:connect(function()
							fhum.PlatformStand = true
						end)
						wait(0.1)
						local vel = Instance.new("BodyVelocity",hit)
						vel.Velocity = ((hit.Position - plr.Character:WaitForChild("HumanoidRootPart").Position).unit + Vector3.new(0,0.5,0))*50
						vel.MaxForce = Vector3.new(10000000,10000000,10000000)
						wait(1)
						cd = false
						vel:Destroy()
						local vel2 = Instance.new("BodyVelocity",hit)
						vel2.Velocity = Vector3.new(0,12.5,0)
						vel2.MaxForce = Vector3.new(10000000,10000000,10000000)
						local p2 = Instance.new("Part",hit)
						p2.Anchored = true
						p2.Transparency = 0.6
						p2.CanCollide = false
						p2.Size = Vector3.new(0.2,0.2,0.2)
						p2.CFrame = CFrame.new(hit.CFrame.p) * CFrame.Angles(math.rad(0),math.rad(90),math.rad(0))
						p2.BrickColor = BrickColor.new("New Yeller")
						p2.Material = "Neon"
						local m2 = Instance.new("CylinderMesh",p2)
						m2.Scale = Vector3.new(60,10000,60)
						local p3 = Instance.new("Part",hit)
						p3.Anchored = true
						p3.Transparency = 0.6
						p3.CanCollide = false
						p3.Shape = "Ball"
						p3.Size = Vector3.new(30,30,30)
						p3.CFrame = CFrame.new(hit.CFrame.X,0,hit.CFrame.Z) * CFrame.Angles(math.rad(0),math.rad(90),math.rad(0))
						p3.BrickColor = BrickColor.new("New Yeller")
						p3.Material = "Neon"
						local scln = sound3:Clone()
						scln.Parent = hit
						scln:Play()
						local con2
						con2 = game:GetService("RunService").Heartbeat:connect(function()
							p2.CFrame = CFrame.new(hit.CFrame.p) * CFrame.Angles(math.rad(0),math.rad(90),math.rad(0))
							p3.CFrame = CFrame.new(hit.CFrame.X,0,hit.CFrame.Z) * CFrame.Angles(math.rad(0),math.rad(90),math.rad(0))
						end)
						wait(8)
						vel2.Velocity = Vector3.new(0,0,0)
						wait(0.5)
						p3:Destroy()
						p2:Destroy()
						for i = 0,4 do
						local p4 = Instance.new("Part", hit)
						p4.Anchored = true
						p4.Transparency = 0
						p4.CanCollide = false
						p4.Shape = "Ball"
						p4.Size = Vector3.new(15,15,15)
						p4.CFrame = CFrame.new(hit.CFrame.p)
						p4.BrickColor = BrickColor.new("New Yeller")
						p4.Material = "Neon"
						while p4.Transparency < 1 do
						p4.Transparency = p4.Transparency + 0.03
						p4.Size = p4.Size + Vector3.new(2,2,2)
						wait()
						end
						p4:Destroy()
						end
						local d = hit.Parent:GetChildren()
						for i=1, #d  do 
							if d[i].className == ("Accessory") then 
								d[i].Handle.Transparency = 1 
							end 
							if d[i].className == ("CharacterMesh") then 
								d[i]:Destroy()
							end 
							if d[i].className == ("Part") then 
								d[i].Material = "Neon"
								d[i].BrickColor = BrickColor.new("New Yeller")
								if d[i].Name == "Head" then
									d[i].Mesh.MeshType = "Brick"
									d[i].Mesh.Scale = Vector3.new(0.65,1.15,1.15)
								end
							end 
							if d[i].className == ("Shirt") then 
								d[i]:Destroy()
							end 
							if d[i].className == ("Humanoid") then 
								d[i].WalkSpeed = 32
								d[i].MaxHealth = 1500
								d[i].JumpPower = 150
							end 
							if d[i].className == ("Pants") then 
								d[i]:Destroy()
							end 
						end
						vel:Destroy()
						vel2:Destroy()
						con1:Disconnect()
						con2:Disconnect()
						fhum.PlatformStand = false
						wait(0.2)
						for i = 0,15,1 do
						fhum.Health = 1500
						wait()
						end
						con2:Disconnect()
					end
				end
			end
		end
	end
end)