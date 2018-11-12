wait()
showDamage=function(Char,Dealt,du)
	if Char:FindFirstChild(Dealt) then Char[Dealt]:Remove() end
	m=Instance.new("Model")
	m.Name=tostring(Dealt)
	h=Instance.new("Humanoid")
	h.Health=0
	h.MaxHealth=0
	h.Parent=m
	c=Instance.new("Part")
	c.Transparency=0
	c.BrickColor=BrickColor:Red()
	if CRIT==true then
		c.BrickColor=BrickColor.new("Brown")
	end
	c.Name="Head"
	c.TopSurface=0
	c.BottomSurface=0
	c.formFactor="Plate"
	c.Size=Vector3.new(2,.8,2)
	local ms=Instance.new("CylinderMesh")
	ms.Scale=Vector3.new(.8,.8,.8)
	if CRIT==true then
		ms.Scale=Vector3.new(1.25,1.5,1.25)
		ms.Bevel=.2
	end
	ms.Parent=c
	c.Reflectance=0
	Instance.new("BodyGyro").Parent=c
	c.Parent=m
	c.CFrame=CFrame.new(Char["Head"].CFrame.p+Vector3.new(0,1.5,0))
	f=Instance.new("BodyPosition")
	f.P=2000
	f.D=100
	f.maxForce=Vector3.new(math.huge,math.huge,math.huge)
	f.position=c.Position+Vector3.new(0,3,0)
	f.Parent=c
	game:GetService("Debris"):AddItem(m,.5+du)
	c.CanCollide=false
	m.Parent=workspace
	c.CanCollide=false
end
CRIT=false
critchance=20
d=true
onTouched=function(hit)
	if hit.Parent==nil then return end
	h=hit.Parent:FindFirstChild("Humanoid")
	if h~=nil then
		vp=game.Players:GetPlayerFromCharacter(hit.Parent)
		if vp==nil then
			if d==false or hit.Parent:FindFirstChild("Torso")==nil then return end
			if hit.Parent.Torso:FindFirstChild("BoltVel")~=nil then return end
			d=false
			if math.random(1,critchance)==1 then
				CRIT=true
			end
			if CRIT==true then
				h:TakeDamage(6)
				showDamage(h.Parent,9,1)
			else
				h:TakeDamage(3)
				showDamage(h.Parent,3,1)
			end
			v=Instance.new("BodyVelocity")
			v.Name="BoltVel"
			v.P=700
			v.maxForce=Vector3.new(math.huge,math.huge,math.huge)
			v.velocity=script.Parent.Velocity*1.05
			v.Parent=hit.Parent.Torso
			game:GetService("Debris"):AddItem(v,.05)
			t=script.creator:clone()
			t.Parent=h
			game:GetService("Debris"):AddItem(t,.5)
			d=true
		end
	end
end
script.Parent.Touched:connect(onTouched)