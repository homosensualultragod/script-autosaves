wait()
vel=script.Parent.BodyVelocity
Rage=script.Rage.Value
Dir=script.Dir.Value
Exploded=false
GetHums=function()
	Chars={}
	Things=workspace:GetChildren()
	for i,v in pairs(Things) do
		if v.className=="Model" and v~=script.Parent.Parent and v~=script.Parent.Parent.Parent then
			Human=v:FindFirstChild("Humanoid")
			PTorso=v:FindFirstChild("Torso")
			if Human~=nil and PTorso~=nil then
				table.insert(Chars,PTorso)
			end
		end
	end
	return Chars
end

Explode=function()
	if Exploded==true then return end
	Exploded=true
	script.Parent.Transparency=1
	Pos=script.Parent.Position
	script.Parent.Anchored=true
p=Instance.new("Part")
			p.TopSurface=0
			p.BottomSurface=0
			p.BrickColor=BrickColor.new("Really black")
			p.Anchored=true
			p.CanCollide=false
			p.CFrame=CFrame.new(script.Parent.Position)
			p.formFactor="Symmetric"
			p.Size=Vector3.new(1,1,1)
			m=Instance.new("SpecialMesh")
			m.MeshType="Sphere"
			m.Parent=p
			m.Scale=Vector3.new(2,2,2)
			p.Parent=script.Parent.Parent
			coroutine.resume(coroutine.create(function(par) for i=1, 19 do wait(.01) par.Mesh.Scale=par.Mesh.Scale+Vector3.new(.5,.5,.5)*(i*.25) par.Transparency=i/19 end par.Parent=nil end),p)
	s=Instance.new("Sound")
	s.SoundId="http://www.roblox.com/asset/?id=2974000"
	s.Volume=1
	s.Pitch=.3
	s.Parent=script.Parent
	s:Play()

	s=Instance.new("Sound")
	s.SoundId="http://www.roblox.com/asset/?id=4678959"
	s.Volume=1
	s.Pitch=.3
	s.Parent=script.Parent
	s:Play()

	s=Instance.new("Sound")
	s.SoundId="http://www.roblox.com/asset/?id=3264793"
	s.Volume=1
	s.Pitch=.3
	s.Parent=script.Parent
	s:Play()
	for ex=1, 40-el do
		wait(.075)
			hums=GetHums()
			for _,v in pairs(hums) do
				if (Pos-v.Position).magnitude<=18 then
					h=v.Parent:FindFirstChild("Humanoid")
					if h~=nil then
						s=script.Slowdown:clone()
						s.Disabled=false
						s.Parent=h
						h:TakeDamage(.6)
						pingas=h.Parent:FindFirstChild("Torso")
						p=Instance.new("BodyVelocity")
						p.P=200
						p.maxForce=Vector3.new(5000,0,5000)
						p.velocity=(Pos-pingas.Position).unit*3
						p.Parent=pingas
						game:GetService("Debris"):AddItem(p,.1)
						if Rage==true then
						h:TakeDamage(1)
							if v:FindFirstChild("DarkBurn")==nil then
								s=script.DarkBurn:clone()
								s.Disabled=false
								s.Parent=v
							end
						end
					end
				end
			end
			p=Instance.new("Part")
			p.TopSurface=0
			p.BottomSurface=0
			p.BrickColor=BrickColor.new("Really black")
			p.Anchored=true
			p.CanCollide=false
			p.CFrame=CFrame.new(script.Parent.Position-Vector3.new(math.random(-10,10)/10,.5,math.random(-10,10)/10))
			p.formFactor="Symmetric"
			p.Size=Vector3.new(1,1,1)
			m=Instance.new("SpecialMesh")
			m.MeshType="Sphere"
			m.Parent=p
			m.Scale=Vector3.new(1,28,1)
			p.Parent=script.Parent.Parent
			p.Reflectance=.1
			coroutine.resume(coroutine.create(function(par) for i=1, 10 do wait(.01) par.Mesh.Scale=par.Mesh.Scale+Vector3.new(.45+i*.6,-2.7,.45+i*.6) par.Transparency=i/25 end par.Parent=nil end),p)
	end
	wait(2)
	script.Parent:Remove()
end
coroutine.resume(coroutine.create(function()
	while true do
		if Exploded==true then
			break
		end
		wait(.15)
		p=script.Parent:clone()
		for _,v in pairs(p:children()) do
			if v.className~="BlockMesh" then
				v:Remove()
			end
		end
		p.Anchored=true
		p.CanCollide=false
		s=script.Trail:clone()
		s.Disabled=false
		s.Parent=p
		p.Parent=script.Parent.Parent
		p.Name="C"
		wait(.05)
		p=script.Parent:clone()
		for _,v in pairs(p:children()) do
			if v.className~="BlockMesh" then
				v:Remove()
			end
		end
		p.Anchored=true
		p.Name="C"
		p.Mesh.Scale=p.Mesh.Scale*1.5
		p.CanCollide=false
		s=script.Trail2:clone()
		s.Disabled=false
		s.Parent=p
		p.Parent=script.Parent.Parent
		p.CFrame=p.CFrame+Vector3.new(math.random(-5,5)/20,math.random(-5,5)/20,math.random(-5,5)/20)
	end
end))
el=0
while true do
	if Exploded==false then
	el=el+1
	print(el)
	if el>25 then
		break
	end
	vdir=Vector3.new(math.random(-10,10),-5,math.random(-10,10))*3
	vcomp=(vdir-Dir).magnitude*1.35
	vel.velocity=(Dir*(vcomp/1)+vdir)/8
			Pos=script.Parent.Position
			hums=GetHums()
			for _,v in pairs(hums) do
				if (Pos-v.Position).magnitude<=17.5 then
					h=v.Parent:FindFirstChild("Humanoid")
					if h~=nil and Exploded==false then
						s=script.Slowdown:clone()
						s.Disabled=false
						s.Parent=h
						pingas=h.Parent:FindFirstChild("Torso")
						p=Instance.new("BodyVelocity")
						p.P=500
						p.maxForce=Vector3.new(50000000,50000000,50000000)
						p.velocity=(Pos-pingas.Position).unit*40+Vector3.new(math.random(-10,10),math.random(-10,10),math.random(-10,10))
						p.Parent=pingas
						game:GetService("Debris"):AddItem(p,.2)
						wait(.1)
						h:TakeDamage(10)
						if Rage==true then
						h:TakeDamage(10+math.random(-2,2))
						end
						Explode()
					end
				end
			end
	end
	wait(math.random(10,50)/100)
end
Explode()