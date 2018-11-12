local on = true
local person = nil
local model = Instance.new("Model",workspace)

local p = Instance.new("Part",workspace)
p.Anchored = true
p.Size = Vector3.new(6,3,4)
p.CFrame = CFrame.new(0,1.5,20)
p.Material = "SmoothPlastic"
local p = Instance.new("Part",workspace)
p.Anchored = true
p.Size = Vector3.new(6,6,6)
p.CFrame = CFrame.new(0,3,25)
p.Material = "SmoothPlastic"
local p = Instance.new("Part",workspace)
p.Anchored = true
p.Size = Vector3.new(6,1,6)
p.CFrame = CFrame.new(0,14.5,25)
p.Material = "SmoothPlastic"
local p = Instance.new("Part",workspace)
p.Anchored = true
p.Shape = "Cylinder"
p.Size = Vector3.new(8,6,6)
p.CFrame = CFrame.new(0,10,25) * CFrame.Angles(0,0,math.rad(90))
p.Transparency = .5
p.Material = "SmoothPlastic"




local p = Instance.new("WedgePart",workspace)
p.Anchored = true
p.Size = Vector3.new(6,1,3)
p.CFrame = CFrame.new(0,3.5,19.5)
p.Material = "SmoothPlastic"
local p = Instance.new("Part",workspace)
p.Anchored = true
p.Size = Vector3.new(6,1,1)
p.CFrame = CFrame.new(0,3.5,21.5)
p.Material = "SmoothPlastic"
local p = Instance.new("Part",workspace)
p.Anchored = true
p.Size = Vector3.new(5,1.5,1)
p.CFrame = CFrame.new(0,4.75,21.5)
p.Material = "SmoothPlastic"
local surf = Instance.new("SurfaceGui",p)
local tex = Instance.new("TextLabel",surf)
tex.Size = UDim2.new(1,0,1,0)
tex.TextScaled = true
tex.BackgroundTransparency = 1


local p = Instance.new("Part",workspace)
p.Anchored = true
p.Size = Vector3.new(1.5,1,1.5)
p.CFrame = CFrame.new(-1.5,3.5,19.5)
p.Material = "Neon"
p.Color = Color3.new(1,1,1)
local clic = Instance.new("ClickDetector",p)
local deb1 = false
clic.MouseClick:connect(function(play)
	if deb1 == false then
		deb1 = true
		p.CFrame = p.CFrame * CFrame.new(0,-.1,0)
		wait(.2)
		p.CFrame = p.CFrame * CFrame.new(0,.1,0)
		if on == false then
			on = true
			p.Color = Color3.new(1,1,1)
			p.Material = "Neon"
		else
			on = false
			p.Material = "SmoothPlastic"
		end
		deb1 = false
	end
end)
local p = Instance.new("Part",workspace)
p.Anchored = true
p.Size = Vector3.new(1.5,1,1.5)
p.CFrame = CFrame.new(1.5,3.5,19.5)
p.Material = "Neon"
p.Color = Color3.new(0,1,0)
local clic = Instance.new("ClickDetector",p)
local deb1 = false
clic.MouseClick:connect(function(play)
	if deb1 == false and on == true then
		deb1 = true
		person = play
		for i, v in pairs(model:GetChildren()) do
			v:Destroy()
		end
		for i, v in pairs(workspace:GetChildren()) do
			if v.Name == ""..play.Name.."" then
				v.Archivable = true
				local clon = v:Clone()
				clon.Torso.Anchored = true
				clon.Torso.CFrame = CFrame.new(0,9,25)
				clon.Name = "char"
				clon.Parent = model
				p.CFrame = p.CFrame * CFrame.new(0,-.1,0)
				p.Color = Color3.new(1,0,0)
				wait(.2)
				p.CFrame = p.CFrame * CFrame.new(0,.1,0)
				p.Color = Color3.new(0,1,0)
			end
		end
		deb1 = false
	end
end)
local angle = 0
coroutine.resume(coroutine.create(function()
	while true do
		angle = angle + 5
		if person ~= nil then
			tex.Text = "Person : "..person.Name..""
			for i, v in pairs(model:GetChildren()) do
				v.Torso.CFrame = v.Torso.CFrame:lerp(CFrame.new(0,10,25)*CFrame.Angles(0,math.rad(angle),0),.3)
			end
		else
			tex.Text = "Person : None"
		end
		if on == true then
			p.Material = "Neon"
		else
			p.Material = "SmoothPlastic"
		end
		wait()
	end
end))