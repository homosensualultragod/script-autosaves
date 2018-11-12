--turdulator
--Bleh, gotta use normal scripts instead of Localscripts.
--For Fen :3
print("HELLO WORLD BILLY MAYS HERE")

char = game.Players.LocalPlayer.Character


local lehg21 = Instance.new("Part", char)
lehg21.Size = Vector3.new(1,2,1)
lehg21.Material = "Neon"
lehg21.CanCollide = false
lehg21.BrickColor = BrickColor.new("New Yeller")
local weld21 = Instance.new("Weld", lehg21)
weld21.Part0 = lehg21
weld21.Part1 = char["Left Arm"]
char["Left Arm"].Transparency = 1

local lehg22 = Instance.new("Part", char)
lehg22.Size = Vector3.new(1,2,1)
lehg22.Material = "Neon"
lehg22.CanCollide = false
lehg22.BrickColor = BrickColor.new("New Yeller")
local weld22 = Instance.new("Weld", lehg22)
weld22.Part0 = lehg22
weld22.Part1 = char["Right Arm"]
char["Right Arm"].Transparency = 1

Tool=script.Parent;
CPlayer=nil
RightS=nil
LeftS=nil
hWeld=CFrame.new(0, -0, -1,0, -2.3, 0,1, -0, 0,0, 1, 0)
FakeS=Instance.new("Motor")
FakeS.Name="Right Shoulder"
FakeSL=Instance.new("Motor")
FakeSL.Name="Left Shoulder"
FakeR=Instance.new("Motor")
FakeR.Name="Right Hip"
FakeL=Instance.new("Motor")
FakeL.Name="Left Hip"
G=Instance.new("Weld")
local started = false
Time=0
Deb=true
tDeb=true
canTrail=false
Rage=Tool.Rage
Attacking=false
RageMode=false
Speed=0
MaxRage=300
wEnabled=true
Anim="Standing" --Idling.
canAnim=true --false when attacking
Gyro=Instance.new("BodyGyro")
Gyro.P=90000
Gyro.D=2100
Gyro.maxTorque=Vector3.new(500000,500000,500000)*5000000000
BarGUI=nil
resWelds=function()
	FakeS.DesiredAngle=0
	FakeSL.DesiredAngle=0
	FakeS.C0=RightS.C0
	FakeSL.C0=LeftS.C0
	FakeS.C1=RightS.C1
	FakeSL.C1=LeftS.C1
	FakeS.MaxVelocity=.3
	FakeSL.MaxVelocity=.3
	FakeR.C0=RightH.C0
	FakeR.C1=RightH.C1
	FakeL.C0=LeftH.C0
	FakeL.C1=LeftH.C1
	CPlayer.Torso.Neck.C0=neckC0
end
anims={}
anims["Jump"]=function()
	resWelds()
	canAnim=false
	FakeS.DesiredAngle=3.2
	FakeSL.DesiredAngle=-1.8
	f=Instance.new("BodyForce")
	f.force=Vector3.new(0,1500,0)
	f.Parent=Tool.Parent.Torso
	game:GetService("Debris"):AddItem(f,2)
	elapse=0
	while true do
		if (Vector3.new(0,Tool.Parent.Torso.Velocity.y,0)-Vector3.new(0,0,0)).magnitude<=4 then
			break
		end
		wait(.5)
	end
	f.Parent=nil
	canAnim=true
end
CRIT=false
hitDeb=true
CritChance=35
Damage=function(hit,Damage,Knockback)
	if hit.Parent==nil then
		return
	end
	CPlayer=Tool.Parent
	h=hit.Parent:FindFirstChild("Humanoid")
	if h~=nil and hit.Parent~=CPlayer and hit.Parent:FindFirstChild("Torso")~=nil then
		if h.Health<1 then
			hitDeb=true
			return
		end
		for lolol,hax in pairs(h:children()) do
			if hax.Name=="creator" then
				if hax.Value==game.Players:GetPlayerFromCharacter(Tool.Parent) then
					return
				end
			end
		end
		c=Instance.new("ObjectValue")
		c.Name="creator"
		c.Value=game.Players.LocalPlayer
		c.Parent=h
		game:GetService("Debris"):AddItem(c,.3)
		print(c.Value)
		if RageMode==false then
		Rage.Value=Rage.Value+Damage/1
		else
		Rage.Value=Rage.Value+Damage/2
		if Rage.Value>MaxRage then
			Rage.Value=MaxRage
		end
		t=hit.Parent:FindFirstChild("Torso")
		if t~=nil then
			if t:FindFirstChild("DarkBurn")==nil then
				s=script.DarkBurn:clone()
				s.Disabled=false
				s.Parent=t
			end
		end
		end
		Damage=math.floor(Damage*1+math.random(-2,2) + 1)
		Blood(hit.CFrame*CFrame.new(math.random(-10,10)/10,math.random(-10,10)/10,0),math.floor(Damage/5))
		h:TakeDamage(Damage)
		showDamage(hit.Parent,Damage,.75)
		vp=Instance.new("BodyVelocity")
		vp.P=2500
		vp.maxForce=Vector3.new(math.huge,0,math.huge)
		vp.velocity=Knockback * 1.2
		vp.Parent=hit.Parent:FindFirstChild("Torso",nil)
		game:GetService("Debris"):AddItem(vp,.25)
		if AttackPos==5 then
			r=Instance.new("BodyAngularVelocity")
			r.P=5000
			r.maxTorque=Vector3.new(50000,50000,50000)*500000
			r.angularvelocity=Vector3.new(math.random(-30,30),math.random(-30,30),math.random(-30,30))/2
			r.Parent=hit.Parent:FindFirstChild("Torso",nil)
			game:GetService("Debris"):AddItem(r,.25)
		end
		CRIT=false
		wait(.6)
		hitDeb=true
	end
end
anims["Standing"]=function()
	resWelds()
	des=.1*math.sin(time())
	FakeS.DesiredAngle=des-.2
	FakeSL.DesiredAngle=des*.9+.4
	FakeR.DesiredAngle=des+.05
	FakeL.DesiredAngle=des-.05
end
anims["Run"]=function()
	FakeS.C0=RightS.C0*CFrame.fromEulerAnglesXYZ(-math.pi/8,math.pi/12,0)
	FakeS.DesiredAngle=-.9
	FakeSL.C0=LeftS.C0*CFrame.fromEulerAnglesXYZ(-math.pi/8,math.pi/12,0)
	FakeSL.DesiredAngle=.6
	des=1*math.sin(time()*10)
	FakeR.DesiredAngle=des
	FakeL.DesiredAngle=des
	Tool.Parent.Humanoid.WalkSpeed=24
end
checkSpeed=function(spd)
	if spd>0 then
		Anim="Run"
		return
	end
	Anim="Standing"
end
for _,v in pairs(Tool:children()) do
	if v.className=="Sound" then
		v:Stop()
	end
end
GetHums=function()
	Chars={}
	Things=workspace:GetChildren()
	for i,v in pairs(Things) do
		if v.className=="Model" and v~=script.Parent.Parent then
			Human=v:FindFirstChild("Humanoid")
			PTorso=v:FindFirstChild("Torso")
			if Human~=nil and PTorso~=nil then
				table.insert(Chars,PTorso)
			end
		end
	end
	return Chars
end
Specials={}
Specials[1]=function()
	if Rage.Value<10 then
		return
	end
	Rage.Value=Rage.Value-10
	--Funny. Do a flip off of the enemies face.
	--turns into an actual ability in rage.
	r=Ray.new(Tool.Parent.Torso.Position,Tool.Parent.Torso.CFrame.lookVector)
	Torso=Tool.Parent.Torso
	hums=GetHums()
	targs={}
	for _,v in pairs(hums) do
		if (Torso.Position-v.Position).magnitude<=50 and r:Distance(v.Position)<=80 then
			table.insert(targs,v)
		end
	end
	targ=nil
	if #targs==1 then
		targ=targs[1]
	elseif #targs<1 then
		targ=nil
	else
		mags={}
		for _,v in pairs(targs) do
			table.insert(mags,(v.Position-Torso.Position).magnitude)
		end
		low=math.min(unpack(mags))
		for _,v in pairs(targs) do
			if (v.Position-Torso.Position).magnitude==low then
				targ=v
			end
		end
	end
	s=Instance.new("Sound")
	s.Volume=1
	s.SoundId="rbxasset://sounds/hit.wav"
	s.Parent=Tool.Parent.Torso
	s:Play()
	game:GetService("Debris"):AddItem(s,3)
	print("LOLOL I KICK U")
	g=Instance.new("BodyGyro")
	g.P=9000
	g.D=400
	g.maxTorque=Vector3.new(50000,50000,50000)*50000000000000
	g.cframe=Torso.CFrame
	g.Parent=Torso
	canAnim=false
	wEnabled=false
	FakeS.DesiredAngle=-.6
	FakeS.CurrentAngle=.1
	FakeSL.DesiredAngle=.6
	FakeSL.CurrentAngle=-.3
	FakeS.MaxVelocity=.3
	FakeSL.MaxVelocity=.4
	Tool.Handle.Hit.Volume=0
	Tool.Handle.Hit.Pitch=4.6
	Tool.Handle.Hit:Play()
	FakeR.DesiredAngle=-.2
	FakeL.DesiredAngle=-.1
	wait(.3)
	Tool.Handle.Hit.Volume=1
	Tool.Handle.Hit.Pitch=0
	wait(.1)
	FakeS.DesiredAngle=.9
	FakeSL.DesiredAngle=-.9
	look=Torso.CFrame.lookVector
	r=Ray.new(Torso.Position,look)
	v=Instance.new("BodyVelocity")
	v.P=5000
	v.maxForce=Vector3.new(math.huge,math.huge,math.huge)
	v.velocity=Torso.CFrame.lookVector*40+Vector3.new(0,15,0)
	if RageMode==true then
		v.velocity=Torso.CFrame.lookVector*60+Vector3.new(0,17.5,0)
	end
	v.Parent=Torso
	g.cframe=g.cframe*CFrame.fromEulerAnglesXYZ(math.pi/2.05,0,0)
	print(targ)
			s=Instance.new("Sound")
			s.Volume=1.25
			s.SoundId="rbxasset://sounds/swoosh.wav"
			s.Parent=Tool.Parent.Torso
			s:Play()
			game:GetService("Debris"):AddItem(s,3)
	wait(.12)
	print(targ)
	if targ==nil then
		v.Parent=nil
		wait(.3)
		s=Instance.new("Sound")
		s.Volume=1
		s.SoundId="rbxasset://sounds/splat.wav"
		s.Parent=Tool.Parent.Torso
		s:Play()
		game:GetService("Debris"):AddItem(s,3)
		Tool.Parent.Humanoid:TakeDamage(Tool.Parent.Humanoid.MaxHealth*.05)
	else
		if (targ.Position-Torso.Position).magnitude<=6 and r:Distance(targ.Position)<=5 then
			if RageMode==true then
			Tool.Handle.Hit.Pitch=1
			print("POW HAHA")
			v.velocity=-look*32.5+Vector3.new(0,25,0)
			coroutine.resume(coroutine.create(Damage),targ,math.random(20,25),look*60+Vector3.new(0,3,0))
			gg=Instance.new("BodyGyro")
			gg.P=2000
			gg.D=500
			gg.maxTorque=Vector3.new(50000,50000,50000)*50000
			gg.cframe=g.cframe*CFrame.fromEulerAnglesXYZ(-math.pi,0,0)
			gg.Parent=targ
			game:GetService("Debris"):AddItem(gg,3)
			FakeS.DesiredAngle=3.2
			FakeSL.DesiredAngle=-3.2
			for i=1, 12 do
				v.velocity=v.velocity-Vector3.new(0,1.5,0)
				g.cframe=g.cframe*CFrame.fromEulerAnglesXYZ(math.pi/8,0,0)
				wait()
			end
			v.Parent=nil
			wait(.5)
			wEnabled=true
			FakeS.DesiredAngle=0
			FakeSL.DesiredAngle=0
			canAnim=true
			wait(2)
			g.Parent=nil
			else
			Tool.Handle.Hit.Pitch=.75
			print("POW HAHA")
			v.velocity=-look*30+Vector3.new(0,40,0)
			coroutine.resume(coroutine.create(Damage),targ,math.random(20,25),look*80+Vector3.new(0,-20,0))
			gg=Instance.new("BodyGyro")
			gg.P=2000
			gg.D=500
			gg.maxTorque=Vector3.new(50000,50000,50000)*50000
			gg.cframe=g.cframe*CFrame.fromEulerAnglesXYZ(-math.pi,0,0)
			gg.Parent=targ
			game:GetService("Debris"):AddItem(gg,3)
			FakeS.DesiredAngle=3.2
			FakeSL.DesiredAngle=-3.2
			s=script.DarkBurn:clone()
			s.Disabled=false
			s.Parent=targ
			for i=1, 28 do
				v.velocity=v.velocity-Vector3.new(0,1,0)
				g.cframe=g.cframe*CFrame.fromEulerAnglesXYZ(math.pi/8,0,0)
				wait()
			end
			v.Parent=nil
			wait(.5)
			wEnabled=true
			FakeS.DesiredAngle=0
			FakeSL.DesiredAngle=0
			canAnim=true
			wait(2)
			g.Parent=nil
			end
		else
			v.Parent=nil
			s=Instance.new("Sound")
			s.Volume=1
			s.SoundId="rbxasset://sounds/splat.wav"
			s.Parent=Tool.Parent.Torso
			s:Play()
			game:GetService("Debris"):AddItem(s,3)
			wait(.3)
			Tool.Parent.Humanoid:TakeDamage(Tool.Parent.Humanoid.MaxHealth*.01)
		end
	end
	v.Parent=nil
	g.Parent=nil
	resWelds()
	canAnim=true
	wEnabled=true
end
Specials[2]=function()
	if Rage.Value<100 then
		return
	end
	wEnabled=false
	canAnim=false
	Torso=Tool.Parent.Torso
	look=Torso.CFrame.lookVector
	Rage.Value=Rage.Value-100
	g=Instance.new("BodyGyro")
	g.P=5000
	g.D=700
	g.maxTorque=Vector3.new(50000,50000,50000)*500000000000
	g.cframe=Torso.CFrame*CFrame.fromEulerAnglesXYZ(0,math.pi/2,0)
	g.Parent=Torso
	FakeS.DesiredAngle=3.2
	FakeSL.DesiredAngle=.3
	FakeR.DesiredAngle=.1
	FakeL.DesiredAngle=0
	wait(.1)
	Tool.Handle.Slash:Play()
	grip=Tool.Parent["Right Arm"]["RightGrip"]
	origrip=grip.C0
	neck=Torso.Neck
	nco=neck.C0
	ref=CFrame.new(1.5, 0.5, -0.49999997, 1, 0, -4.37113883e-008, 0, 1, 0, 4.37113883e-008, 0, 1)
	Tool.Parent.Humanoid.WalkSpeed=0
	for i=1, 6 do
		neck.C0=neck.C0*CFrame.fromEulerAnglesXYZ(0,0,-math.pi/12)
		grip.C0=grip.C0*CFrame.fromEulerAnglesXYZ(0,0,math.pi/6)
		wait()
	end
	FakeS.DesiredAngle=3.5
	FakeS.C0=ref
	for i=1, 12 do
		grip.C0=grip.C0*CFrame.fromEulerAnglesXYZ(0,0,math.pi/6)
		wait()
	end
	smt=3
	Tool.Handle.Slash:Play()
	wait(.05)
	v=Instance.new("BodyVelocity")
	v.velocity=look*40
	v.maxForce=Vector3.new(math.huge,1000,math.huge)
	v.Parent=Torso
	FakeS.MaxVelocity=.9
	FakeS.DesiredAngle=1.7
	wait(.075)
	v.Parent=nil
	wait(.075)
	Tool.Handle.Implant:Play()
	pos=Torso.Position+look*3.5-Vector3.new(0,2.5,0)
	for i=1, smt do
		for _,v in pairs(Tool.Handle:children()) do
			if v.Name=="PunishSound"..i then
				v:Play()
			end
		end
	end
	game.Players.LocalPlayer.Character.Torso.Anchored = true
	for _,v in pairs(game.Players:children()) do
		if v.Character~=nil then
			if v.Character:FindFirstChild("Head") ~=nil then
				if (v.Character.Head.Position-pos).magnitude<=20 and v.Character.Name ~= game.Players.LocalPlayer.Character.Name then
					s=script.Shake:clone()
					s.Disabled=false
					s.Parent=v.Character
				end
			end
		end
	end
	r=Ray.new(pos,-(pos-(pos+Vector3.new(0,1,0))).unit)
	hums=GetHums()
	targs={}
	k=Instance.new("Part")
	k.TopSurface=0
	k.BottomSurface=0
	k.Name="Blast"
	k.Anchored=true
	k.CanCollide=false
	k.formFactor="Symmetric"
	k.Size=Vector3.new(2,2,2)
	m=Instance.new("SpecialMesh")
	m.MeshType="Sphere"
	m.Parent=k
	m.Scale=Vector3.new(1,1,1)
	k.CFrame=CFrame.new(pos)
	k.Parent=Tool.Parent
	k.Reflectance=0
	k.BrickColor=BrickColor.new("Really black")
	script.Fire:clone().Parent=k
	coroutine.resume(coroutine.create(function(par) for i=1, 20 do if RageMode==false then par.Fire.Size=par.Mesh.Scale.y else par.Fire.Size=par.Mesh.Scale.y*2 end par.Mesh.Scale=par.Mesh.Scale+Vector3.new(.25*4/(i/2.5),.4*4/(i/2.5),.25*4/(i/2.5)) par.Transparency=i/20 wait(.015) end par.Fire.Enabled=false wait(2.5) par.Parent=nil end),k)
	if RageMode==false then
		for i=1, 14 do
	k=Instance.new("Part")
	k.TopSurface=0
	k.BottomSurface=0
	k.Name="Blast"
	k.Anchored=true
	k.CanCollide=false
	k.formFactor="Symmetric"
	k.Size=Vector3.new(2,2,2)
	m=Instance.new("SpecialMesh")
	m.MeshType="Sphere"
	m.Parent=k
	m.Scale=Vector3.new(2.5+i/5,1+i/5,2.5+i/5)
	k.CFrame=CFrame.new(pos+Vector3.new(math.random(-3,3),math.random(-3,3)/4,math.random(-3,3)))
	k.Parent=Tool.Parent
	k.Reflectance=0
	DCCOLS={BrickColor:Black(),BrickColor.new("Really black"),BrickColor.new("New Yeller"),BrickColor.new("Institutional white"),BrickColor.new("New Yeller")}
	k.BrickColor=DCCOLS[math.random(1,#DCCOLS)]
	coroutine.resume(coroutine.create(function(par,p) for i=1, 8 do par.Mesh.Scale=par.Mesh.Scale+Vector3.new(-.1*2,.6*4/(i/3)+p/7.5,-.1*2) par.CFrame=par.CFrame+Vector3.new(0,.2+p/10,0) par.Transparency=i/8 wait(.005) end par.Parent=nil end),k,i)
			for _,v in pairs(hums) do
				vp=Vector3.new(v.Position.x,0,v.Position.z)
				vpos=Vector3.new(pos.x,0,pos.z)
				print((vpos-vp).magnitude)
				if (vpos-vp).magnitude<=20.4 then
					h=v.Parent:FindFirstChild("Humanoid")
					if h~=nil then
						p=Instance.new("BodyVelocity")
						p.P=5000
						p.maxForce=Vector3.new(50000000,50000000,50000000)*50
						p.velocity=Vector3.new(0,30,0)+(v.Position-pos).unit*10
						p.Parent=v
						game:GetService("Debris"):AddItem(p,.1)
						p=Instance.new("BodyAngularVelocity")
						p.P=5000
						p.maxTorque=Vector3.new(50000000,50000000,50000000)*50
						p.angularvelocity=Vector3.new(math.random(-20,20),math.random(-20,20),math.random(-20,20))+(v.Position-pos).unit*10
						p.Parent=v
						game:GetService("Debris"):AddItem(p,.1)
						h:TakeDamage(4.5)

					end
				end
			end
			wait(.0325)
		end
	else
		for i=1, 17 do
	k=Instance.new("Part")
	k.TopSurface=0
	k.BottomSurface=0
	k.Name="Blast"
	k.Anchored=true
	k.CanCollide=false
	k.formFactor="Symmetric"
	k.Size=Vector3.new(2,2,2)
	m=Instance.new("SpecialMesh")
	m.MeshType="Sphere"
	m.Parent=k
	m.Scale=Vector3.new(2.5+i/10,1+i/10,2.5+i/10)
	k.CFrame=CFrame.new(pos+Vector3.new(math.random(-3,3),math.random(-3,3)/4,math.random(-3,3)))
	k.Parent=Tool.Parent
	k.Reflectance=0
	DCCOLS={BrickColor:Black(),BrickColor.new("Really black"),BrickColor.new("New Yeller"),BrickColor.new("Institutional white"),BrickColor.new("New Yeller")}
	k.BrickColor=DCCOLS[math.random(1,#DCCOLS)]
	coroutine.resume(coroutine.create(function(par,p) for i=1, 8 do par.Mesh.Scale=par.Mesh.Scale+Vector3.new(-.1*2,.65*4/(i/3)+p/7.5,-.1*2) par.CFrame=par.CFrame+Vector3.new(0,.225+p/9,0) par.Transparency=i/8 wait(.005) end par.Parent=nil end),k,i)
		if i==2 or i==7 or i==14 then
		me=Instance.new("Part")
		me.formFactor="Symmetric"
		me.Transparency=1
		me.Name="TRAIL"
		me.TopSurface=0
		me.BottomSurface=0
		me.CanCollide=false
		me.BrickColor=BrickColor:Black()
		me.Reflectance=0
		me.Size=Vector3.new(2,200,2)
		me.Parent=workspace
		me.Anchored=false
		me.CFrame=CFrame.new(pos-Vector3.new(math.random(-5,5),3,math.random(-5,5)))
		m=Instance.new("SpecialMesh")
		m.Scale=Vector3.new(.3,1,.3)
		m.Parent=me
		s=script.Bolt:clone()
		s.Disabled=false
		s.creator.Value=game.Players:GetPlayerFromCharacter(Tool.Parent)
		s.Parent=me
		end
			for _,v in pairs(hums) do
				vp=Vector3.new(v.Position.x,0,v.Position.z)
				vpos=Vector3.new(pos.x,0,pos.z)
				print((vpos-vp).magnitude)
				if (vpos-vp).magnitude<=10 then
					h=v.Parent:FindFirstChild("Humanoid")
					if h~=nil then
						p=Instance.new("BodyVelocity")
						p.P=5000
						p.maxForce=Vector3.new(50000000,50000000,50000000)*50
						p.velocity=Vector3.new(0,10 + i * 4,0)+(v.Position-pos).unit*5
						p.Parent=v
						game:GetService("Debris"):AddItem(p,.1)
						p=Instance.new("BodyAngularVelocity")
						p.P=5000
						p.maxTorque=Vector3.new(50000000,50000000,50000000)*50
						p.angularvelocity=Vector3.new(math.random(-20,20),math.random(-20,20),math.random(-20,20))+(v.Position-pos).unit*10
						p.Parent=v
						game:GetService("Debris"):AddItem(p,.1)
						h:TakeDamage(2.5)
					end
				end
			end
			wait(.0325)
		end
	end
	game.Players.LocalPlayer.Character.Torso.Anchored = false
	wait(.25)
	g.cframe=g.cframe*CFrame.fromEulerAnglesXYZ(0,-math.pi/2,0)
	grip.C0=origrip
	neck.C0=nco
	Tool.Parent.Humanoid.WalkSpeed=24
	wait(.25)
	g.Parent=nil
	canAnim=true
	wEnabled=true
	resWelds()
end

local asd = false
Specials[3]=function()
	if Rage.Value<50 or asd == true then
		return
	end
	asd = true
	Torso=Tool.Parent.Torso
	look=Torso.CFrame.lookVector
	FakeR.DesiredAngle=0
	FakeL.DesiredAngle=0
	ddsc=Torso.Parent.Humanoid.WalkSpeed
	g=Instance.new("BodyGyro")
	g.Name="Turn"
	g.maxTorque=Vector3.new(50000,50000,50000)*500000000
	g.P=8000
	g.D=500
	g.cframe=Torso.CFrame*CFrame.fromEulerAnglesXYZ(0,math.pi/2,0)
	g.Parent=Torso
	FakeSL.DesiredAngle=-3.2
	FakeSL.MaxVelocity=.3
	neck=Torso.Neck
	ggrip=Tool.Spear.SpearGrip
	ggripc0=ggrip.C0
	ggripc1=ggrip.C1
	--[[ggrip.C0=CFrame.new(0,-1,0)
	ggrip.C1=CFrame.new(0,0,0)]]
	--[[for i=1, 8 do
		ggrip.C0=ggrip.C0*CFrame.fromEulerAnglesXYZ(0,math.pi/6,0)
		neck.C0=neck.C0*CFrame.fromEulerAnglesXYZ(0,0,-math.pi/16)
		wait()
	end
	for i=1, 18 do
		ggrip.C0=ggrip.C0*CFrame.fromEulerAnglesXYZ(0,math.pi/6,0)
		wait()
	end
	wait(.5)
	for i=1, 2 do
		ggrip.C0=ggrip.C0*CFrame.fromEulerAnglesXYZ(0,math.pi/2,0)
		g.cframe=g.cframe*CFrame.fromEulerAnglesXYZ(0,-math.pi/4,0)
		neck.C0=neck.C0*CFrame.fromEulerAnglesXYZ(0,0,math.pi/4)
		FakeSL.C0=FakeSL.C0*CFrame.fromEulerAnglesXYZ(math.pi/4,0,0)
		wait()
	end
	FakeSL.CurrentAngle=-1.6
	FakeSL.DesiredAngle=-1.6
FakeSL.C0=LeftS.C0*CFrame.fromEulerAnglesXYZ(-math.pi/2,0,0)+Vector3.new(.25,-.5,0)
		FakeSL.C0=FakeSL.C0*CFrame.fromEulerAnglesXYZ(math.pi/4,math.pi/8,math.pi/10)]]
	m=Instance.new("Model")
	m.Name="Projectile"
	m.Parent=workspace
	p=Instance.new("Part")
	p.CanCollide=false
	p.Transparency=.25
	p.TopSurface=0
	p.BottomSurface=0
	p.BrickColor=BrickColor:Black()
	p.formFactor="Symmetric"
	p.Size=Vector3.new(5,4,5)
	p.Reflectance=.25
	mm=Tool.SpikeMesh:clone()
	mm.Scale=Vector3.new(1.5,-6,1.5)*2
	mm.Parent=p
	p.CFrame=CFrame.new(Torso.Position,Torso.Position+look*30)*CFrame.fromEulerAnglesXYZ(math.pi/2,0,0)
	p.Parent=m
	v=Instance.new("BodyVelocity")
	v.P=5000
	v.maxForce=Vector3.new(math.huge,math.huge,math.huge)
	v.velocity=look*95
	v.Parent=p
	s=Tool.Fire:clone()
	s.Parent=p
	s.Looped=true
	s:Play()
	s=Tool.FireBeamFire:clone()
	s.Parent=p
	s:Play()
	s=script.FireBoltScript:clone()
	s.Disabled=false
	s.Parent=p
	s.Rage.Value=RageMode
	c=Instance.new("ObjectValue")
	c.Name="creator"
	c.Value=game.Players.LocalPlayer
	c.Parent=s
	s=Instance.new("Sparkles")
	s.SparkleColor=Color3.new(254,254,254)
	s.Parent=p
	if RageMode==true then
	s=script.ElecScript:clone()
	s.Disabled=false
	s.Parent=p
	canAnim=true
	end
	e=Instance.new("BoolValue")
	e.Name="Ex"
	e.Parent=m
	
	p2=Instance.new("Part")
	p2.CanCollide=false
	p2.Transparency=.25
	p2.TopSurface=0
	p2.BottomSurface=0
	p2.BrickColor=BrickColor:Black()
	p2.formFactor="Symmetric"
	p2.Size=Vector3.new(2,3,2)
	p2.Reflectance=.25
	mm=Tool.SpikeMesh:clone()
	mm.Parent=p2
	mm.Scale=Vector3.new(1.25,12,1.25)*2
	p2.CFrame=CFrame.new(Torso.Position,Torso.Position+look*30)*CFrame.fromEulerAnglesXYZ(-math.pi/2,0,0)
	p2.Parent=m
	w=Instance.new("Weld")
	w.Parent=p2
	w.Part0=p
	w.Part1=p2
	w.C0=CFrame.new(0,6*2,0)--*CFrame.fromEulerAnglesXYZ(math.pi,0,0)
	f=script.fireScript.Fire:clone()
	f.Parent=p
	s=script.FireBoltScript:clone()
	s.Disabled=false
	s.Parent=p2
		c=Instance.new("ObjectValue")
		c.Name="creator"
		c.Value=game.Players.LocalPlayer
		c.Parent=s

	
	p2=Instance.new("Part")
	p2.CanCollide=false
	p2.Transparency=.25
	p2.TopSurface=0
	p2.BottomSurface=0
	p2.BrickColor=BrickColor:Black()
	p2.formFactor="Symmetric"
	p2.Size=Vector3.new(2,3,2)
	p2.Reflectance=.25
	mm=Tool.SpikeMesh:clone()
	mm.Parent=p2
	mm.Scale=Vector3.new(.4,12,.4)*2
	p2.CFrame=CFrame.new(Torso.Position,Torso.Position+look*30)*CFrame.fromEulerAnglesXYZ(-math.pi/2,0,0)
	p2.Parent=m
	w=Instance.new("Weld")
	w.Parent=p2
	w.Part0=p
	w.Part1=p2
	w.C0=CFrame.new(0,12*2,0)--*CFrame.fromEulerAnglesXYZ(math.pi,0,0)

	s=script.FireBoltScript:clone()
	s.Disabled=false
	s.Parent=p2
		c=Instance.new("ObjectValue")
		c.Name="creator"
		c.Value=game.Players.LocalPlayer
		c.Parent=s


	--[[for i=1, 2 do
		g.cframe=g.cframe*CFrame.fromEulerAnglesXYZ(0,-math.pi/4,0)
		neck.C0=neck.C0*CFrame.fromEulerAnglesXYZ(0,0,math.pi/4)
		wait()
	end]]
Torso.Parent.Humanoid.WalkSpeed=ddsc
	--[[for i=1, 8 do
		neck.C0=neck.C0*CFrame.fromEulerAnglesXYZ(0,0,math.pi/16)
		wait()
	end]]
	g.Parent=nil
	canAnim=true
end



--------
--------
----------------------------------------------------

Specials[5]=function() --Here's the finish... GC REFERENCE LOLOLOLOOOOOOOOOOOOOO Dio sucks.
	--Haunting Shock Expy :/
	if Rage.Value<999 then
		return
	end
	Rage.Value=Rage.Value-0
	Tool.Parent.Humanoid.WalkSpeed=0
	canAnim=false
	g=Instance.new("BodyGyro")
	Torso=Tool.Parent.Torso
	Moar=Torso.CFrame.lookVector
	g.Parent=Torso
	g.P=12000
	g.D=400
	g.maxTorque=Vector3.new(50000000,50000000,50000000)*500
	g.cframe=Torso.CFrame*CFrame.fromEulerAnglesXYZ(0,-math.pi/2,0)
	FakeR.DesiredAngle=.3
	FakeL.DesiredAngle=.1
	FakeS.DesiredAngle=-.5
	FakeSL.DesiredAngle=-3.6
	FakeSL.CurrentAngle=-3.2
	FakeSL.MaxVelocity=.2
	Neck=Torso.Neck
	orin=Neck.C0
	Neck.C0=Neck.C0*CFrame.fromEulerAnglesXYZ(0,math.pi/6,math.pi/2.5)
	ori=Torso.CFrame
	Pos=Torso.Position+Torso.CFrame.lookVector*30-Vector3.new(0,3.4,0)
		wait()
		Sword=BarGUI.HSword:clone()
		for _,v in pairs(Sword:children()) do
			if v.className=="Part" then
				v.Anchored=false
				v.Transparency=0
				v.Velocity=Vector3.new(0,0,0) v.RotVelocity=Vector3.new(0,0,0)
			end
		end
		Sword:BreakJoints()
		Sword.BladeMain.CFrame=CFrame.new(Pos,Torso.Position)*CFrame.new(0,13,-7.5)*CFrame.fromEulerAnglesXYZ(math.pi/1.25,math.pi/2,0)
		Sword.Parent=Tool.Parent
		po=Instance.new("BodyPosition")
		po.P=8000
		po.D=300
		po.maxForce=Vector3.new(50000000,500000000,500000000)*5000000000
		po.position=Sword.BladeMain.Position
		po.Parent=Sword.BladeMain
	ringDec="http://www.roblox.com/asset/?id=30603016"
	ring=Instance.new("Part")
	ring.formFactor="Symmetric"
	ring.Transparency=1
	d=Instance.new("Decal")
	d.Texture=ringDec
	d.Face="Top"
	d.Parent=ring
	ring.Anchored=true
	ring.CanCollide=false
	ring.Size=Vector3.new(14,1,14)
	ring.CFrame=CFrame.new(Pos)*CFrame.fromEulerAnglesXYZ(0,math.random(-50,50),0)
	ring.Parent=Tool
	f=script.Fire:clone()
	f.Size=25
	f.Heat=10
	f.Parent=ring
		wait(.15)
		v=Instance.new("BodyVelocity")
		v.P=5000
		v.velocity=(Torso.Position-Pos).unit*30
		v.Parent=Torso
		game:GetService("Debris"):AddItem(v,.2)
		FakeSL.MaxVelocity=.4
		FakeSL.DesiredAngle=-.6
		po.position=Pos
		s=Tool.Handle.Implant:clone()
		s.Parent=Sword.BladeMain
		s:Play()
		hums=GetHums()
		wait(.06)
		s=Tool.Handle.PunishSound3:clone()
		s.Pitch=.55
		s.Parent=Sword.BladeMain
		s:Play()
		s=Tool.Handle.PunishSound1:clone()
		s.Pitch=.55
		s.Parent=Sword.BladeMain
		s:Play()
		s=Tool.Fire:clone()
		s.Looped=false
		s.Pitch=.8
		s.Parent=ring
		s:Play()
		p=Instance.new("Part")
		p.Name="BlastRing"
		p.TopSurface=0
		p.BottomSurface=0
		p.CanCollide=false
		p.Anchored=true
		p.BrickColor=BrickColor:Black()
		p.Size=Vector3.new(1,1,1)
		p.CFrame=CFrame.new(Pos-Vector3.new(0,0,0))*CFrame.fromEulerAnglesXYZ(0,0,0)
		p.Parent=workspace
		script.Parent.BlastMesh:clone().Parent=p
		p.BlastMesh.Scale=Vector3.new(1,.5,1)
		coroutine.resume(coroutine.create(function(par,int) for lol=1, 15 do par.BlastMesh.Scale=par.BlastMesh.Scale+Vector3.new(.4+int,.6/(lol/6),.4+int) if int==1.2 then par.BlastMesh.Scale=par.BlastMesh.Scale+Vector3.new(0,.9,0) end par.Transparency=lol/15 par.CFrame=par.CFrame*CFrame.new(0,.01,0) wait() end par.Parent=nil end),p,.5)
		p=Instance.new("Part")
		p.Name="BlastRing"
		p.TopSurface=0
		p.BottomSurface=0
		p.CanCollide=false
		p.Anchored=true
		p.BrickColor=BrickColor:Black()
		p.Size=Vector3.new(1,1,1)
		p.CFrame=CFrame.new(Pos-Vector3.new(0,0,0))*CFrame.fromEulerAnglesXYZ(0,0,0)
		p.Parent=workspace
		script.Parent.BlastMesh:clone().Parent=p
		p.BlastMesh.Scale=Vector3.new(1,.5,1)
		coroutine.resume(coroutine.create(function(par,int) for lol=1, 14 do par.BlastMesh.Scale=par.BlastMesh.Scale+Vector3.new(.8+int,.05/(lol/6),.8+int) if int==1.2 then par.BlastMesh.Scale=par.BlastMesh.Scale+Vector3.new(0,.9,0) end par.Transparency=lol/10 par.CFrame=par.CFrame*CFrame.new(0,.01,0) wait() end par.Parent=nil end),p,.5)
			for _,v in pairs(hums) do
				if (Pos-v.Position).magnitude<=11.5 then
					print("Dead.")
					h=v.Parent:FindFirstChild("Humanoid")
					if h~=nil then
						p=Instance.new("BodyVelocity")
						p.P=5000
						p.maxForce=Vector3.new(500000000000,500000000000,500000000000)*500000000000
						p.velocity=Vector3.new(math.random(-10,10),math.random(3,30),math.random(-10,10))+Moar*50
						p.Parent=v
						game:GetService("Debris"):AddItem(p,.3)
						p=Instance.new("BodyAngularVelocity")
						p.P=5000
						p.maxTorque=Vector3.new(50000000,50000000,50000000)*500000000000
						p.angularvelocity=Vector3.new(math.random(-20,20),math.random(-20,20),math.random(-20,20))+(v.Position-Pos).unit*30
						p.Parent=v
						game:GetService("Debris"):AddItem(p,.5)
						h:TakeDamage(20)
						if RageMode==true then
						h:TakeDamage(10)
						if v:FindFirstChild("DarkBurn")==nil then
							s=script.DarkBurn:clone()
							s.Disabled=false
							s.Parent=v
						end
						end
					end
				end
			end
	for _,v in pairs(game.Players:children()) do
		if v.Character~=nil then
			if v.Character:FindFirstChild("Head") ~=nil then
				if (v.Character.Head.Position-Pos).magnitude<=23 and v.Character.Name ~= game.Players.LocalPlayer.Character.Name then
					s=script.Shake:clone()
					s.Disabled=false
					s.Parent=v.Character
				end
			end
		end
	end
		wait(.5)
		g.P=2000
		g.cframe=ori
		Neck.C0=orin
		FakeSL.DesiredAngle=0
		FakeSL.MaxVelocity=.15
		wait(.75)
		g.Parent=nil
	wait(.2)
	Sword.Parent=nil
	wait(.2)
Tool.Parent.Humanoid.WalkSpeed=24
	ring.Decal.Parent=nil
	ring.Fire.Enabled=false
	game:GetService("Debris"):AddItem(ring,1)
	canAnim=true
end
---------
-------------
------------------
---------------------
---------------------------
------------------------------------
----------------------------------------------
-----------------------------------------------------
-------------------------------------------------------------
Specials[6]=function() --Culminated final move, Eternal Abyss
	if Rage.Value<225 then
		return
	end
	Rage.Value=Rage.Value-225
	canAnim=false
	Torso=Tool.Parent.Torso
	vHuman=Tool.Parent.Humanoid
	vHuman.WalkSpeed=0
	FakeS.DesiredAngle=2
	FakeS.CurrentAngle=2
	FakeSL.DesiredAngle=0
	FakeR.DesiredAngle=0
	FakeL.DesiredAngle=0
	FakeS.C0=RightS.C0*CFrame.fromEulerAnglesXYZ(-math.pi/2,0,0)+Vector3.new(.5,-.5,0)
	g=Instance.new("BodyGyro")
	g.P=5000
	g.maxTorque=Vector3.new(50000,50000,50000)*500000000000000000000
	g.cframe=Torso.CFrame*CFrame.fromEulerAnglesXYZ(0,math.pi/2,0)
	Look=Torso.CFrame.lookVector
	g.Parent=Torso
	wait(.25)
	FakeS.DesiredAngle=0
	Pos=Torso.Position+Look*10+Vector3.new(0,7,0)
	hums=GetHums()
	p=Instance.new("Part")
	p.Name="Win"
	p.TopSurface=0
	p.BottomSurface=0
	p.BrickColor=BrickColor:Black()
	p.Anchored=true
	p.CanCollide=false
	p.formFactor="Symmetric"
	p.Size=Vector3.new(1,1,1)
	m=Instance.new("SpecialMesh")
	m.MeshType="Sphere"
	m.Parent=p
	m.Scale=Vector3.new(3,3,3)
	p.CFrame=CFrame.new(Pos)
	p.Parent=Tool
	game.Players.LocalPlayer.Character.Torso.Anchored = true
	if RageMode==true then
		s=script.BoltScript:clone()
		s.Disabled=false
		s.Parent=p
	end
	coroutine.resume(coroutine.create(function(par) for i=1, 75 do wait() par.Transparency=i/260 par.Mesh.Scale=par.Mesh.Scale+Vector3.new(.3,.3,.3) end for i=1, 10 do par.Transparency=par.Transparency-.05 par.Mesh.Scale=par.Mesh.Scale*1.02 wait() end for i=1, 7 do par.Transparency=par.Transparency-.05 par.Mesh.Scale=par.Mesh.Scale/1.6 wait() end if par:FindFirstChild("ElecScript")~=nil then for lol,hax in pairs(Tool:children()) do  if hax.Name=="Zap" then game:GetService("Debris"):AddItem(hax,math.random(1,15)/10) end end end par.Transparency=0 for i=1, 20 do par.SPSound.Volume=par.SPSound.Volume/1.02 wait() end par.SPSound:Stop() wait() par.Parent=nil end),p)
	s1=Tool.Handle.SPSound:clone()
	s1.Volume=.35
	s1.Pitch=.35
	s1.Parent=p
	s1:Play()
	for i=1, 30 do
	p=Instance.new("Part")
	p.Name="Win"
	p.TopSurface=0
	p.BottomSurface=0
	p.BrickColor=BrickColor:Black()
	p.Anchored=true
	p.CanCollide=false
	p.formFactor="Symmetric"
	p.Size=Vector3.new(1,1,1)
	m=Instance.new("SpecialMesh")
	m.MeshType="Sphere"
	m.Parent=p
	m.Scale=Vector3.new(8,8,8)
	p.CFrame=CFrame.new(Pos+Vector3.new(math.random(-15,15)/1,math.random(-15,15)/1,math.random(-15,15)/1))
	p.Parent=Tool
	coroutine.resume(coroutine.create(function(par) for i=1, 18 do wait() par.CFrame=par.CFrame+(Pos-par.Position).unit*.7 par.Transparency=i/18 par.Mesh.Scale=par.Mesh.Scale-Vector3.new(.35,.35,.35) end if par:FindFirstChild("ElecScript")~=nil then for lol,hax in pairs(Tool:children()) do  if hax.Name=="Zap" then game:GetService("Debris"):AddItem(hax,math.random(1,15)/10) end end end par.Parent=nil end),p)
		for _,v in pairs(hums) do
				if (Pos-v.Position).magnitude<=50+i then
					print("Dead.")
					h=v.Parent:FindFirstChild("Humanoid")
					if h~=nil then
						p=Instance.new("BodyVelocity")
						p.P=500
						p.maxForce=Vector3.new(50000000,50000000,50000000)*6
						if RageMode==false then
							p.velocity=(Pos-v.Position).unit*15
						else
							p.velocity=(Pos-v.Position).unit*22.5
						end
						p.Parent=v
						game:GetService("Debris"):AddItem(p,.06)
						p=Instance.new("BodyAngularVelocity")
						p.P=39
						p.maxTorque=Vector3.new(500000,500000,500000)
						p.angularvelocity=Vector3.new(math.random(-20,20),math.random(-20,20),math.random(-20,20))+(v.Position-Pos).unit*30
						p.Parent=v
						game:GetService("Debris"):AddItem(p,.05)
						h:TakeDamage(.5)
						
					end
				end
			end
		wait(.075)
	end
	wait(.15)
	for i=1, 8 do
	wait()
	for _,v in pairs(game.Players:children()) do
		if v.Character~=nil then
			if v.Character:FindFirstChild("Head") ~=nil then
				if (v.Character.Head.Position-Pos).magnitude<=70 and v.Character.Name ~= game.Players.LocalPlayer.Character.Name then
					s=script.Shake:clone()
					s.Disabled=false
					s.Parent=v.Character
				end
			end
		end
	end
	p=Instance.new("Part")
	p.Name="Win"
	p.TopSurface=0
	p.BottomSurface=0
	p.BrickColor=BrickColor:Black()
	p.Anchored=true
	p.CanCollide=false
	p.formFactor="Symmetric"
	p.Size=Vector3.new(1,1,1)
	m=Instance.new("BlockMesh")
	m.Parent=p
	m.Scale=Vector3.new(1,1,1)
	p.CFrame=CFrame.new(Pos+Vector3.new(math.random(-2,2),math.random(-2,2),math.random(-2,2)))
	p.Parent=Tool
	s=Tool.Handle.PunishSound1:clone()
	s.Parent=p
	s.Pitch=.6
	s.Volume=.65
	s:Play()
	s=Tool.Handle.PunishSound2:clone()
	s.Parent=p
	s.Pitch=2.5
	s.Volume=.45
	s:Play()
	s=Tool.Handle.PunishSound5:clone()
	s.Parent=p
	s.Pitch=1.5
	s.Volume=.75
	s:Play()
	if i==1 then
	s=Tool.Handle.PunishSound4:clone()
	s.Parent=p
	s.Pitch=1.1
	s.Volume=.4
	s:Play()
	end
	coroutine.resume(coroutine.create(function(par) for i=1, 12 do wait() par.Transparency=i/12 par.Mesh.Scale=par.Mesh.Scale+Vector3.new(2,2,2) par.CFrame=par.CFrame*CFrame.fromEulerAnglesXYZ(math.random(-10,10)/10,math.random(-10,10)/10,math.random(-10,10)/40) end if par:FindFirstChild("ElecScript")~=nil then for lol,hax in pairs(Tool:children()) do  if hax.Name=="Zap" then game:GetService("Debris"):AddItem(hax,math.random(1,15)/10) end end end par.Parent=nil end),p)
		for _,v in pairs(hums) do
				if (Pos-v.Position).magnitude<=18 then
					print("Dead.")
					h=v.Parent:FindFirstChild("Humanoid")
					if h~=nil then
						for snoo,pingas in pairs(v.Parent:children()) do
							if pingas.className=="Part" then
						p=Instance.new("BodyVelocity")
						p.P=500
						p.maxForce=Vector3.new(50000000,50000000,50000000)
						if i~=8 then
						p.velocity=(Pos-pingas.Position).unit*(7*i)+Vector3.new(math.random(-10,10),math.random(-10,10),math.random(-10,10))/4
						else
						p.velocity=(Pos-pingas.Position).unit*-40+Vector3.new(math.random(-10,10),math.random(-10,10),math.random(-10,10))
						end
						p.Parent=pingas
						game:GetService("Debris"):AddItem(p,.05)
						p=Instance.new("BodyAngularVelocity")
						p.P=390
						p.maxTorque=Vector3.new(50000000,50000000,50000000)
						p.angularvelocity=Vector3.new(math.random(-20,20),math.random(-20,20),math.random(-20,20))+(pingas.Position-Pos).unit*30
						p.Parent=pingas
						game:GetService("Debris"):AddItem(p,.05)
							end
						end
						h:TakeDamage(4)
						if RageMode==true then
							if v:FindFirstChild("DarkBurn")==nil then
								s=script.DarkBurn:clone()
								s.Disabled=false
								s.Parent=v
							end
						end
					end
				end
			end
		wait()
	end
	wait(1)
	g.Parent=nil
	canAnim=true
	resWelds()
	vHuman.WalkSpeed=24
	game.Players.LocalPlayer.Character.Torso.Anchored = false
end
Specials[7]=function() --Disabling move, Grinding Flames
	if Rage.Value<300 then
		return
	end
	Rage.Value=Rage.Value-300
	--Use of this move enables movement, but does not allow you to attack for a period of time.
	canAnim=false
	wEnabled=false
	Torso=Tool.Parent.Torso
	vHuman=Torso.Parent.Humanoid
	vHuman.WalkSpeed=0
	grip=Tool.Parent["Right Arm"]["RightGrip"]
	origrip=grip.C0
	FakeS.C0=CFrame.new(1.4, 0.716506362, -0.249999985, 0, 0.5, 0.866025388, 0, 0.866025329, -0.49999997, -0.99999994, 0, 0)*CFrame.fromEulerAnglesXYZ(math.pi/2,0,0)
	FakeS.DesiredAngle=2.9
	FakeS.CurrentAngle=2
	for i=1, 20 do
		if i==1 or i==8 then
			Tool.Handle.Slash:Play()
			Tool.Handle.Slash.Pitch=1
		end
		grip.C0=grip.C0*CFrame.fromEulerAnglesXYZ(0,0,math.pi/4)
		wait()
	end
	Tool.Handle.Slash:Play()
	Tool.Handle.Slash.Pitch=1.5
	wait(.25)
	FakeS.MaxVelocity=.6
	FakeS.DesiredAngle=.7
	Tool.Handle.Implant:Play()
	FakeSword=Tool.Handle:clone()
	for _,v in pairs(FakeSword:children()) do
		if v.className=="Sound" then
			v:Remove()
		end
	end
	HitPos=Torso.Position-Vector3.new(0,3,0)+Torso.CFrame.lookVector*16
	Tool.Handle.Transparency=1
	FakeSword.CFrame=CFrame.new(Tool.Handle.Position,HitPos)*CFrame.fromEulerAnglesXYZ(-math.pi/1.5,0,-math.pi/24)
	FakeSword.Parent=workspace
	g=Instance.new("BodyGyro")
	g.P=5000
	g.maxTorque=Vector3.new(500000,500000,500000)*500000
	g.cframe=FakeSword.CFrame
	g.Parent=FakeSword
	p=Instance.new("BodyPosition")
	p.P=9000
	p.D=250
	p.maxForce=Vector3.new(math.huge,math.huge,math.huge)
	p.position=FakeSword.Position
	p.Parent=FakeSword
	wait()
	ringDec="http://www.roblox.com/asset/?id=30603016"
	ring=Instance.new("Part")
	ring.formFactor="Symmetric"
	ring.Transparency=1
	d=Instance.new("Decal")
	d.Texture=ringDec
	d.Face="Top"
	d.Parent=ring
	ring.Anchored=true
	ring.CanCollide=false
	ring.Size=Vector3.new(20,1,20)
	ring.CFrame=CFrame.new(HitPos)*CFrame.fromEulerAnglesXYZ(0,math.random(-50,50),0)
	ring.Parent=Tool
	f=script.Fire:clone()
	f.Size=32
	f.Heat=20
	f.Parent=ring
	p.position=HitPos
	print("Throw")
	coroutine.resume(coroutine.create(function(par,vv) while par.Parent~=nil do vv=vv+1 if vv<6 then par.Size=par.Size+Vector3.new(1,0,1) end par.CFrame=CFrame.new(HitPos)*CFrame.fromEulerAnglesXYZ(0,.15*vv,0) wait(.025) end print("FIN") end),ring,0)
	DCCOLS={BrickColor:Black(),BrickColor.new("Really black"),BrickColor.new("New Yeller"),BrickColor.new("Institutional white"),BrickColor.new("New Yeller")}
			hums=GetHums()
		for _,v in pairs(hums) do
				if (HitPos-v.Position).magnitude<=40 then
					print("Dead.")
					h=v.Parent:FindFirstChild("Humanoid")
					if h~=nil then
						for snoo,pingas in pairs(v.Parent:children()) do
							if pingas.className=="Part" then
						p=Instance.new("BodyVelocity")
						p.P=500
						p.maxForce=Vector3.new(50000000,50000000,50000000)
						p.velocity=(HitPos-pingas.Position).unit*60+Vector3.new(math.random(-10,10),math.random(-5,5),math.random(-10,10))
						p.Parent=pingas
						game:GetService("Debris"):AddItem(p,.15)
						p=Instance.new("BodyAngularVelocity")
						p.P=390
						p.maxTorque=Vector3.new(50000000,50000000,50000000)
						p.angularvelocity=Vector3.new(math.random(-20,20),math.random(-20,20),math.random(-20,20))+(pingas.Position-HitPos).unit*30
						p.Parent=pingas
						game:GetService("Debris"):AddItem(p,.05)
							end
						end
					end
				end
			end
		p=Instance.new("Part")
		p.Name="BlastRing"
		p.TopSurface=0
		p.BottomSurface=0
		p.CanCollide=false
		p.Anchored=true
		p.BrickColor=BrickColor:Black()
		p.Size=Vector3.new(1,1,1)
		p.CFrame=CFrame.new(HitPos-Vector3.new(0,0,0))*CFrame.fromEulerAnglesXYZ(0,0,0)
		p.Parent=workspace
		script.Parent.BlastMesh:clone().Parent=p
		p.BlastMesh.Scale=Vector3.new(5,.5,5)
		coroutine.resume(coroutine.create(function(par,int) for lol=1, 15 do par.BlastMesh.Scale=par.BlastMesh.Scale+Vector3.new(1+int,.6/(lol/6),1+int) if int==1.2 then par.BlastMesh.Scale=par.BlastMesh.Scale+Vector3.new(0,.9,0) end par.Transparency=lol/15 par.CFrame=par.CFrame*CFrame.new(0,.01,0) wait() end par.Parent=nil end),p,.5)
		s=Tool.Handle.PunishSound1:clone()
		s.Parent=p
		s:Play()
	for i=1, 25 do
		p=Instance.new("Part")
		p.Name="Win"
		p.TopSurface=0
		p.BottomSurface=0
		p.BrickColor=DCCOLS[math.random(1,#DCCOLS)]
		p.Anchored=true
		p.CanCollide=false
		p.formFactor="Symmetric"
		p.Size=Vector3.new(1,1,1)
		m=Instance.new("BlockMesh")
		m.Parent=p
		m.Scale=Vector3.new(8,8,8)
		p.CFrame=CFrame.new(HitPos+Vector3.new(math.random(-9,9)/2,0,math.random(-9,9)/2))*CFrame.fromEulerAnglesXYZ(math.random(-20,20),math.random(-20,20),math.random(-20,20))
		p.Parent=Tool
		coroutine.resume(coroutine.create(function(par,num) for i=1, 20 do par.CFrame=CFrame.new(HitPos+Vector3.new(math.cos(i/2)*(3/(i/4)+8),i/2,math.sin(i/2)*(3/(i/4)+8)))*CFrame.fromEulerAnglesXYZ(math.random(-10,10)/10,math.random(-10,10)/10,math.random(-10,10)/10) par.Transparency=i/42 par.Mesh.Scale=par.Mesh.Scale/1.025 wait(.01) end par.Parent=nil end),p)

		p=Instance.new("Part")
		p.Name="Win"
		p.TopSurface=0
		p.BottomSurface=0
		p.BrickColor=DCCOLS[math.random(1,#DCCOLS)]
		p.Anchored=true
		p.CanCollide=false
		p.formFactor="Symmetric"
		p.Size=Vector3.new(1,1,1)
		m=Instance.new("BlockMesh")
		m.Parent=p
		m.Scale=Vector3.new(7,7,7)
		p.CFrame=CFrame.new(HitPos+Vector3.new(math.random(-9,9)/4,0,math.random(-9,9)/4))*CFrame.fromEulerAnglesXYZ(math.random(-20,20),math.random(-20,20),math.random(-20,20))
		p.Parent=Tool
		coroutine.resume(coroutine.create(function(par,num) for i=1, 20 do par.CFrame=CFrame.new(HitPos+Vector3.new(math.sin(i/3)*(2/(i/3.5)+5),i/1.7,math.cos(i/3)*(2/(i/3.5)+5)))*CFrame.fromEulerAnglesXYZ(math.random(-10,10)/10,math.random(-10,10)/10,math.random(-10,10)/10) par.Transparency=i/21 par.Mesh.Scale=par.Mesh.Scale/1.025 wait(.01) end par.Parent=nil end),p)

		--[[p=Instance.new("Part")
		p.Name="Win"
		p.TopSurface=0
		p.BottomSurface=0
		p.BrickColor=DCCOLS[math.random(1,#DCCOLS)]
		p.Anchored=true
		p.CanCollide=false
		p.formFactor="Symmetric"
		p.Size=Vector3.new(1,1,1)
		m=Instance.new("BlockMesh")
		m.Parent=p
		m.Scale=Vector3.new(4,4,4)
		p.CFrame=CFrame.new(HitPos+Vector3.new(math.random(-15,15)/1,0,math.random(-15,15)/1))*CFrame.fromEulerAnglesXYZ(math.random(-20,20),math.random(-20,20),math.random(-20,20))
		p.Parent=Tool
		coroutine.resume(coroutine.create(function(par,num) for i=1, 25 do par.CFrame=CFrame.new(par.Position+Vector3.new(0,.1*i,0))*CFrame.fromEulerAnglesXYZ(math.random(-10,10)/10,math.random(-10,10)/10,math.random(-10,10)/10) par.Transparency=i/25 par.Mesh.Scale=par.Mesh.Scale-Vector3.new(.05,.05,.05) wait(.01) end par.Fire.Enabled=false wait(1) par.Parent=nil end),p)
		]]

		p=Instance.new("Part")
		p.Name="Win"
		p.TopSurface=0
		p.BottomSurface=0
		p.BrickColor=DCCOLS[math.random(1,#DCCOLS)]
		p.Anchored=true
		p.CanCollide=false
		p.formFactor="Symmetric"
		p.Size=Vector3.new(1,1,1)
		m=Instance.new("BlockMesh")
		m.Parent=p
		m.Scale=Vector3.new(6,6,6)
		p.CFrame=CFrame.new(HitPos+Vector3.new(math.random(-9,9)/4,0,math.random(-9,9)/4))*CFrame.fromEulerAnglesXYZ(math.random(-20,20),math.random(-20,20),math.random(-20,20))
		p.Parent=Tool
		s=Tool.Handle.SPSound:clone()
		s.Pitch=math.random(3,6)/10
		s.Volume=.45
		s.Parent=p
		s:Play()
		coroutine.resume(coroutine.create(function(par,num) for i=1, 40 do par.SPSound.Pitch=par.SPSound.Pitch+.01 par.CFrame=CFrame.new(HitPos+Vector3.new(math.cos(i/2)*(3+(i/8)),i/1.5,math.sin(i/2)*(3+(i/8))    ))*CFrame.fromEulerAnglesXYZ(math.random(-10,10)/1,math.random(-10,10)/1,math.random(-10,10)/1) par.Transparency=i/40 par.Mesh.Scale=par.Mesh.Scale/1.025 wait(.01) end par.SPSound:Stop() par.Fire.Enabled=false wait(1) par.Parent=nil end),p)
		f=script.Fire:clone()
		f.Size=6
		f.Heat=2
		f.Parent=p

		wait(.05)

		for _,v in pairs(hums) do
				if ((HitPos+Vector3.new(0,20,0))-v.Position).magnitude<=30 then
					h=v.Parent:FindFirstChild("Humanoid")
					if h~=nil then
						for snoo,pingas in pairs(v.Parent:children()) do
							if pingas.className=="Part" then
						p=Instance.new("BodyVelocity")
						p.P=500
						p.maxForce=Vector3.new(50000000,50000000,50000000)
						p.velocity=((HitPos+Vector3.new(0,5,0))-pingas.Position).unit*10+Vector3.new(math.random(-10,10),math.random(25,30)/3+(i/3),math.random(-10,10))
						p.Parent=pingas
						game:GetService("Debris"):AddItem(p,.15)
						p=Instance.new("BodyAngularVelocity")
						p.P=390
						p.maxTorque=Vector3.new(50000000,50000000,50000000)
						p.angularvelocity=Vector3.new(math.random(-20,20),math.random(-20,20),math.random(-20,20))+(pingas.Position-HitPos).unit*30
						p.Parent=pingas
						game:GetService("Debris"):AddItem(p,.05)
							end
						end
						h:TakeDamage(1)
						if RageMode==true then
							h:TakeDamage(.5)
							if v:FindFirstChild("DarkBurn")==nil then
								s=script.DarkBurn:clone()
								s.Disabled=false
								s.Parent=v
							end
						end
					end
				end
			end
	end
	FakeS.DesiredAngle=0
	if RageMode==true then
	for i=1, 10 do
		wait(.1)
		for _,v in pairs(hums) do
				if ((HitPos+Vector3.new(0,20,0))-v.Position).magnitude<=30 then
					h=v.Parent:FindFirstChild("Humanoid")
					if h~=nil then
						for snoo,pingas in pairs(v.Parent:children()) do
							if pingas.className=="Part" then
						p=Instance.new("BodyVelocity")
						p.P=500
						p.maxForce=Vector3.new(50000000,50000000,50000000)
						p.velocity=((HitPos+Vector3.new(0,5,0))-pingas.Position).unit*10+Vector3.new(math.random(-10,10),math.random(25,30)/2+(i/3),math.random(-10,10))
						p.Parent=pingas
						game:GetService("Debris"):AddItem(p,.15)
						p=Instance.new("BodyAngularVelocity")
						p.P=390
						p.maxTorque=Vector3.new(50000000,50000000,50000000)
						p.angularvelocity=Vector3.new(math.random(-20,20),math.random(-20,20),math.random(-20,20))+(pingas.Position-HitPos).unit*30
						p.Parent=pingas
						game:GetService("Debris"):AddItem(p,.05)
							end
						end
						print("Contact")
						h:TakeDamage(1)
						if RageMode==true then
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
		end
	else
		wait(.5)
	end
	wait(.25)
	coroutine.resume(coroutine.create(function(par) for i=1, 5 do par.CFrame=par.CFrame-Vector3.new(0,.15,0) wait() end par.Fire.Enabled=false wait(1.25) par.Parent=nil end),ring)
	FakeSword:Remove()
	Tool.Handle.Transparency=0
	grip.C0=origrip
	resWelds()
	wEnabled=true
	canAnim=true
	vHuman.WalkSpeed=24
end
fixzap=function()
	for _,v in pairs(Tool:children()) do 
		if v.Name=="Zap" then	
			coroutine.resume(coroutine.create(function(par) trans=100-par.Transparency*100 for i=1, trans/2 do par.Transparency=par.Transparency+.02 wait() end par.Parent=nil end),v) 
		end
	end
end
Specials[8]=function()
	--Basically throws a hunk of dark energy in front of you.
	if Rage.Value<150 then
		return
	end
	Rage.Value=Rage.Value-150
	canAnim=false
	wEnabled=false
	Torso=Tool.Parent.Torso
	vHuman=Torso.Parent.Humanoid
	vHuman.WalkSpeed=0
	grip=Tool.Parent["Right Arm"]["RightGrip"]
	origrip=grip.C0
	FakeS.C0=CFrame.new(1.5, 0.816506362, -0.249999985, 0, 0.5, 0.866025388, 0, 0.866025329, -0.49999997, -0.99999994, 0, 0)*CFrame.fromEulerAnglesXYZ(math.pi/2,0,0)
	FakeS.DesiredAngle=3.5
	FakeS.CurrentAngle=2
	FakeR.DesiredAngle=0
	FakeL.DesiredAngle=0
	Tool.Handle.SPSound:Play()
	for i=1, 24 do
		p=Instance.new("Part")
		p.TopSurface=0
		p.BottomSurface=0
		p.BrickColor=BrickColor.new("Really black")
		p.formFactor="Symmetric"
		p.Size=Vector3.new(1,1,1)
		p.Name="The game"
		p.CanCollide=false
		p.Anchored=true
		p.CFrame=Tool.Parent["Right Arm"].CFrame*CFrame.new(0,-1.4,0)*CFrame.fromEulerAnglesXYZ(math.random(-50,50),math.random(-50,50),math.random(-50,50))
		p.Parent=Tool
		m=Instance.new("BlockMesh")
		m.Parent=p
		m.Scale=Vector3.new(1,5,1)
		coroutine.resume(coroutine.create(function(par,ori) for i=1, 15 do par.Mesh.Scale=par.Mesh.Scale+Vector3.new(.075,.075,.075) par.CFrame=ori*CFrame.new(math.random(-10,10)/20,math.random(-10,10)/20,math.random(-10,10)/20)*CFrame.fromEulerAnglesXYZ(math.random(-10,10)/20,math.random(-10,10)/20,math.random(-10,10)/20) par.Transparency=i/15 wait(.015) end par.Parent=nil end),p,p.CFrame)
		wait()
	end
	wait(.35)
	FakeS.DesiredAngle=1.6
	FakeS.MaxVelocity=.325
	for i=1, 5 do
		p=Instance.new("Part")
		p.TopSurface=0
		p.BottomSurface=0
		p.BrickColor=BrickColor.new("Really black")
		p.formFactor="Symmetric"
		p.Size=Vector3.new(1,12,1)
		p.Name="The game"
		p.CanCollide=false
		p.Anchored=true
		p.CFrame=Tool.Parent["Right Arm"].CFrame*CFrame.new(0,-1.4,0)*CFrame.fromEulerAnglesXYZ(math.random(-50,50),math.random(-50,50),math.random(-50,50))
		p.Parent=Tool
		m=Instance.new("BlockMesh")
		m.Parent=p
		m.Scale=Vector3.new(1,1,1)
		coroutine.resume(coroutine.create(function(par,ori) for i=1, 15 do par.Mesh.Scale=par.Mesh.Scale+Vector3.new(.075,.075,.075) par.CFrame=ori*CFrame.new(math.random(-10,10)/20,math.random(-10,10)/20,math.random(-10,10)/20)*CFrame.fromEulerAnglesXYZ(math.random(-10,10)/20,math.random(-10,10)/20,math.random(-10,10)/20) par.Transparency=i/15 wait(.015) end par.Parent=nil end),p,p.CFrame)
		wait()
	end
		Tool.Handle.SPSound:Stop()
		Tool.Handle.Fire:Play()
		Tool.Handle.Fire.Pitch=.85
		FakeS.DesiredAngle=.8
		p=Instance.new("Part")
		p.TopSurface=0
		p.BottomSurface=0
		p.BrickColor=BrickColor.new("Really black")
		p.Shape="Ball"
		p.formFactor="Symmetric"
		p.Size=Vector3.new(1,12,1)
		p.Name="NecroBomb"
		p.CanCollide=true
		p.Anchored=false
		p.CFrame=Tool.Parent["Right Arm"].CFrame*CFrame.new(0,-1.4,0)*CFrame.fromEulerAnglesXYZ(math.random(-50,50),math.random(-50,50),math.random(-50,50))
		p.Parent=Tool
		m=Instance.new("BlockMesh")
		m.Parent=p
		m.Scale=Vector3.new(1,12,1)
		v=Instance.new("BodyVelocity")
		v.P=5000
		v.maxForce=Vector3.new(math.huge,0,math.huge)
		v.velocity=Torso.CFrame.lookVector*20+Vector3.new(math.random(-2,2),15,math.random(-2,2))
		v.Parent=p
		if RageMode==false then
		else
		end
		s=script.ElecScript2:clone()
		s.Disabled=false
		s.Parent=p
		s=script.Necro:clone()
		s.Rage.Value=RageMode
		s.Dir.Value=Torso.CFrame.lookVector
		s.Disabled=false
		s.Parent=p
		wait(.25)
		wEnabled=true
		resWelds()
		canAnim=true
		coroutine.resume(coroutine.create(function() while true do if Tool:FindFirstChild("NecroBomb")==nil then break end wait() end fixzap() end))
		vHuman.WalkSpeed=24
end
Specials[4]=function()
	if RageMode==true or Rage.Value<100 then
		return
	end
	RageMode=true
	fsc=script.fireScript:clone()
	fsc.Parent=Tool.Parent
	fsc.Disabled=false
	CritChance=CritChance-10
	Tool.Handle.SPSound:Play()
	elapse=0
	cTorso=Tool.Parent.Torso
	while true do
		Rage.Value=Rage.Value-(elapse+1)
		if Rage.Value<=0 then
			break
		end
		elapse=elapse+1
		if elapse>=2 then
			cpos=cTorso.Position
			zhums=GetHums()
			for __,vvh in pairs(zhums) do
				vvp=vvh.Position
				vvpos=cpos
				if (vvpos-vvp).magnitude<=6.5 then
					print("GIT OUT DA WAY")
					hh=vvh.Parent:FindFirstChild("Humanoid")
					if hh~=nil then
						hh:TakeDamage(1)
						ff=script.Fire:clone()
						ff.Size=4
						ff.Parent=vvh
						game:GetService("Debris"):AddItem(ff,.35)
					end
				end
			end
			elapse=0
		end
		wait(.06)
	end
	RageMode=false
	Tool.Handle.SPSound:Stop()
	CritChance=CritChance+10
	fsc.Parent=nil
end
BloodHandle=function(hit,BLOOD)
	if hit.CanCollide==false or hit.Name=="Blood" or hit.Parent==nil then
		return
	end
	h=hit.Parent:FindFirstChild("Humanoid")
	if h==nil or hit.Name=="Handle" and hit.Parent~=Tool then
		BLOOD.Parent=nil
	end
end
Blood=function(CF,amt)
	for BLUD=1, amt do
	B=Instance.new("Part")
	B.TopSurface=0
	B.BottomSurface=0
	B.Transparency=math.random(0,30)*.01
	B.formFactor="Plate"
	B.CanCollide=false
	B.BrickColor=BrickColor:Red()
	B.CFrame=CF*CFrame.fromEulerAnglesXYZ(math.random(-30,30)/10,math.random(-30,30)/10,math.random(-30,30)/10)
	B.Size=Vector3.new(1,.4,1)
	B.Parent=workspace
	B.Velocity=Vector3.new(math.random(-5,5),math.random(-3,5),math.random(-5,5))*2
	B.RotVelocity=Vector3.new(math.random(-5,5),math.random(-5,5),math.random(-5,5))*2
	B.Touched:connect(function(hit) BloodHandle(hit,B) end)
	game:GetService("Debris"):AddItem(B,1)
	end
end
Grip=function()
	return Tool.Parent["Right Arm"].RightGrip
end
showDamage=function(Char,Dealt,du)
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
	c.Size=Vector3.new(1,.4,1)
	ms=Instance.new("CylinderMesh")
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
Animation=function(T,C)
	if C=="Stop" then
		RightS=T:FindFirstChild("Right Shoulder")
		if RightS==nil then
			return
		end
		LeftS=T:FindFirstChild("Left Shoulder")
		if LeftS==nil then
			return
		end
		RightH=T:FindFirstChild("Right Hip")
		if RightH==nil then
			return
		end
		LeftH=T:FindFirstChild("Left Hip")
		if LeftH==nil then
			return
		end
		RightS.Parent=nil
		LeftS.Parent=nil
		FakeS.Part0=T
		FakeS.C0=RightS.C0
		FakeS.C1=RightS.C1	
		FakeS.Part1=T.Parent["Right Arm"]
		FakeS.Parent=T
		FakeS.DesiredAngle=-.4
		FakeS.MaxVelocity=.15
		FakeSL.Part0=T
		FakeSL.C0=LeftS.C0
		FakeSL.C1=LeftS.C1	
		FakeSL.Part1=T.Parent["Left Arm"]
		FakeSL.Parent=T
		FakeSL.DesiredAngle=-.3
		FakeSL.MaxVelocity=.15

		FakeR.Part0=T
		FakeR.C0=RightH.C0
		FakeR.C1=RightH.C1	
		FakeR.Part1=T.Parent["Right Leg"]
		FakeR.Parent=T
		FakeR.DesiredAngle=-.4
		FakeR.MaxVelocity=.15
		FakeL.Part0=T
		FakeL.C0=LeftH.C0
		FakeL.C1=LeftH.C1	
		FakeL.Part1=T.Parent["Left Leg"]
		FakeL.Parent=T
		FakeL.DesiredAngle=-.3
		FakeL.MaxVelocity=.15

		w=Instance.new("Weld")
		w.Name="SpearGrip"
		w.Part0=T.Parent["Left Arm"]
		w.Part1=Tool.Spear
		w.C0=CFrame.new(0,-1,-1.25)*CFrame.fromEulerAnglesXYZ(0,math.pi,math.pi/2)
		w.Parent=Tool.Spear
	elseif C=="Resume" then
		FakeS.Parent=nil
		FakeSL.Parent=nil
		FakeR.Parent=nil
		FakeL.Parent=nil
		RightS.Parent=T
		LeftS.Parent=T
		RightH.Parent=T
		LeftH.Parent=T
		if Tool.Spear:FindFirstChild("SpearGrip")~=nil then
			Tool.Spear.SpearGrip:Remove()
		end
	end
end
Reset=function(Weld)
	Weld.DesiredAngle=1.6
	Weld.MaxVelocity=.15
end
SetSpeed=function(int)
	FakeS.MaxVelocity=int
	FakeSL.MaxVelocity=int
end
neckC0=CFrame.new(0, 1, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0)
Attack=function(Pos)
	if wEnabled==false then return end
	wEnabled=false
	CPlayer=Tool.Parent
	if Pos==1 then
		ori=CPlayer.Humanoid.WalkSpeed
		sgrip=Tool.Spear.SpearGrip.C0
		CPlayer.Humanoid.WalkSpeed=16
		print("Lunge!")
		Tool.Spear.metalSwing.Pitch=1
		Tool.Spear.metalSwing:Play()
		wait(.15)
		dir=CPlayer.Torso.CFrame.lookVector
		Gyro.Parent=CPlayer.Torso
		Gyro.cframe=CPlayer.Torso.CFrame*CFrame.fromEulerAnglesXYZ(0,-math.pi/1.9,0)
		CPlayer.Torso.Neck.C0=neckC0*CFrame.fromEulerAnglesXYZ(math.pi/8,math.pi/12,math.pi/2)
		FakeSL.C0=LeftS.C0*CFrame.fromEulerAnglesXYZ(-math.pi/2,0,0)+Vector3.new(.25,-.5,0)
		FakeSL.C0=FakeSL.C0*CFrame.fromEulerAnglesXYZ(math.pi/4,math.pi/8,math.pi/10)
		Tool.Spear.SpearGrip.C0=Tool.Spear.SpearGrip.C0*CFrame.fromEulerAnglesXYZ(math.pi/2,-math.pi/2,0)
		Tool.Spear.SpearGrip.C0=Tool.Spear.SpearGrip.C0*CFrame.new(.1,-.75,0.65)*CFrame.fromEulerAnglesXYZ(math.pi/34,0,0)
		FakeS.DesiredAngle=-.3
		FakeSL.DesiredAngle=0
		FakeSL.CurrentAngle=0
		FakeS.CurrentAngle=0
		FakeR.CurrentAngle=0.3
		FakeR.DesiredAngle=.3
		FakeL.CurrentAngle=.3
		FakeL.DesiredAngle=.2
		
		--[[vel=Instance.new("BodyVelocity")
		vel.P=4000
		vel.maxForce=Vector3.new(800000,0,800000)
		vel.velocity=dir*10
		vel.Parent=CPlayer.Torso
		game:GetService("Debris"):AddItem(vel,.125)]]
		wait(.075)
		local R_Con=Tool.Spear.Touched:connect(function(hit) Damage(hit,math.random(18,19),dir*37) Specials[3]() end)
		for i=1, 4 do
			FakeSL.C0=LeftS.C0*CFrame.fromEulerAnglesXYZ(-math.pi/2.3,0,0)+Vector3.new(.25-i*.185,-.5,0)
			wait(.01)
		end
		--[[if Rage.Value>=40 then
				Rage.Value=Rage.Value-5
			local e=Instance.new("Part", workspace)
			e.Name="Effect"
			e.TopSurface=0
			e.BottomSurface=0
			e.formFactor="Symmetric"
			e.Size=Vector3.new(1,2,1)
			e.Anchored=false
			e.CFrame = CPlayer["Left Arm"].CFrame
			p=Instance.new("BodyVelocity")
			p.P=5000
			p.maxForce=Vector3.new(800000,800000,800000)
			p.velocity=dir*40
			p.Parent=e
			e.BrickColor=BrickColor:Black()
			e.Reflectance=.25
			s=script.BoltScript:clone()
			s.Parent=e
			s.Disabled=false
			end]]
		wait(.2)
		CPlayer.Humanoid.WalkSpeed=ori
		Tool.Spear.SpearGrip.C0=sgrip
		Gyro.Parent=nil
		AttackPos=2
		R_Con:disconnect()
		R_Con=nil
		asd = false
		wEnabled=true
	elseif Pos==2 then
		ori=CPlayer.Humanoid.WalkSpeed
		sgrip=Tool.Spear.SpearGrip.C0
		CPlayer.Humanoid.WalkSpeed=16
		print("Lunge!")
		Tool.Spear.metalSwing:Play()
		Tool.Spear.metalSwing.Pitch=1.2
		Gyro.Parent=CPlayer.Torso
		Gyro.cframe=CPlayer.Torso.CFrame
		CPlayer.Torso.Neck.C0=neckC0*CFrame.fromEulerAnglesXYZ(math.pi/8,math.pi/12,math.pi/2)
		FakeSL.C0=LeftS.C0*CFrame.fromEulerAnglesXYZ(-math.pi/2,0,0)+Vector3.new(.25,-.5,0)
		FakeSL.C0=FakeSL.C0*CFrame.fromEulerAnglesXYZ(0,0,math.pi/10)
		FakeS.C0=RightS.C0*CFrame.fromEulerAnglesXYZ(-math.pi/7,0,0)
		Tool.Spear.SpearGrip.C0=Tool.Spear.SpearGrip.C0*CFrame.fromEulerAnglesXYZ(math.pi/2,-math.pi/2,0)
		Tool.Spear.SpearGrip.C0=Tool.Spear.SpearGrip.C0*CFrame.new(.1,-.75,0.65)*CFrame.fromEulerAnglesXYZ(math.pi/34,0,0)
		FakeS.DesiredAngle=-.3
		FakeSL.DesiredAngle=0
		FakeSL.CurrentAngle=0
		FakeS.CurrentAngle=0
		FakeR.CurrentAngle=0.3
		FakeR.DesiredAngle=.3
		FakeL.CurrentAngle=.3
		FakeL.DesiredAngle=.2
		--[[vel=Instance.new("BodyVelocity")
		vel.P=4000
		vel.maxForce=Vector3.new(800000,0,800000)
		vel.velocity=dir*18
		vel.Parent=CPlayer.Torso
		game:GetService("Debris"):AddItem(vel,.125)]]
		local R_Con=Tool.Spear.Touched:connect(function(hit) Damage(hit,math.random(16,17),dir*6) end)
		for i=1, 4 do
			FakeSL.C0=LeftS.C0*CFrame.fromEulerAnglesXYZ(-math.pi/1.7,0,0)+Vector3.new(.25-i*.2,-.5,0)
			wait(.01)
		end
		wait(.3)
		CPlayer.Humanoid.WalkSpeed=ori
		Tool.Spear.SpearGrip.C0=sgrip
		Gyro.Parent=nil
		wait(.15)
		R_Con:disconnect()
		R_Con=nil
		AttackPos=3
		wEnabled=true
	elseif Pos==3 then
		grip=Grip()
		Gyro.Parent=CPlayer.Torso
		Gyro.cframe=CPlayer.Torso.CFrame
		CPlayer.Torso.Neck.C0=CPlayer.Torso.Neck.C0*CFrame.fromEulerAnglesXYZ(-math.pi/8,0,math.pi)
		FakeS.C0=CFrame.new(1.125, 0.716506362, -0.249999985, 0, 0.5, 0.866025388, 0, 0.866025329, -0.49999997, -0.99999994, 0, 0)
		FakeS.DesiredAngle=.6
		FakeS.CurrentAngle=2.6
		FakeS.MaxVelocity=.2
		Tool.Handle.Slash:Play()
		Tool.Handle.Slash.Pitch=1
		--[[vel=Instance.new("BodyVelocity")
		vel.P=4000
		vel.maxForce=Vector3.new(800000,0,800000)
		vel.velocity=dir*35
		vel.Parent=CPlayer.Torso
		game:GetService("Debris"):AddItem(vel,.15)]]
		local R_Con=Tool.Handle.Touched:connect(function(hit) Damage(hit,math.random(15,16),dir*20) end)
		for i=1, 6 do
			Gyro.cframe=Gyro.cframe*CFrame.fromEulerAnglesXYZ(0,math.pi/6,0)
			grip.C0=grip.C0*CFrame.fromEulerAnglesXYZ(-math.pi/11,0,0)
			wait()
		end
		R_Con:disconnect()
		AttackPos=4
		wait(.4)
		for i=1, 6 do
			grip.C0=grip.C0*CFrame.fromEulerAnglesXYZ(math.pi/11,0,0)
			wait()
		end
		Gyro.Parent=nil
		wEnabled=true
	elseif Pos==4 then
		Tool.Parent.Torso.Neck.C0=neckC0
		Tool.Handle.Slash:Play()
		Tool.Handle.Slash.Pitch=1.3
		Gyro.Parent=Tool.Parent.Torso
		Gyro.cframe=Tool.Parent.Torso.CFrame*CFrame.fromEulerAnglesXYZ(0,-math.pi/2,0)
		FakeS.C0=RightS.C0*CFrame.fromEulerAnglesXYZ(-math.pi/2,0,0)+Vector3.new(.5,-.5,0)
		FakeS.CurrentAngle=1.65
		FakeS.MaxVelocity=.35
		FakeS.DesiredAngle=-.8
		local R_Con=Tool.Handle.Touched:connect(function(hit) Damage(hit,math.random(10,12),dir*20) end)
		--[[vel=Instance.new("BodyVelocity")
		vel.P=4000
		vel.maxForce=Vector3.new(800000,0,800000)
		vel.velocity=dir*25
		vel.Parent=CPlayer.Torso
		game:GetService("Debris"):AddItem(vel,.15)]]
		wait(.45)
		R_Con:disconnect()
		AttackPos=5
		wEnabled=true
		Gyro.Parent=nil
	elseif Pos==5 then
		calc=Tool.Y.Value/Tool.MaxY.Value/1
		print(calc)
		if calc<=.33 then
		resWelds()
		grip=Grip()
		grip.C0=grip.C0*CFrame.fromEulerAnglesXYZ(math.pi,0,0)
		FakeS.CurrentAngle=-.8
		FakeS.DesiredAngle=3.3
		FakeS.MaxVelocity=.8
		FakeSL.DesiredAngle=.6
		FakeR.DesiredAngle=0.2
		FakeL.DesiredAngle=.6
		Tool.Handle.Lunge:Play()
		local R_Con=Tool.Handle.Touched:connect(function(hit) Damage(hit,15,dir*7+Vector3.new(0,50,0)) end)
		--[[vel=Instance.new("BodyVelocity")
		vel.P=4000
		vel.maxForce=Vector3.new(800000,0,800000)
		vel.velocity=dir*18
		vel.Parent=CPlayer.Torso
		game:GetService("Debris"):AddItem(vel,.15)]]
		for i=1, 5 do
			wait(.015)
			CPlayer.Torso.Neck.C0=CPlayer.Torso.Neck.C0*CFrame.fromEulerAnglesXYZ(-math.pi/20,0,0)
		end
		wait(.15)
		grip.C0=grip.C0*CFrame.fromEulerAnglesXYZ(-math.pi,0,0)
		R_Con:disconnect()
		wait(.35)
		CPlayer.Torso.Neck.C0=CPlayer.Torso.Neck.C0*CFrame.fromEulerAnglesXYZ(math.pi/20*5,0,0)
		FakeS.DesiredAngle=-.3
		elseif calc<=.66 and calc>.33 then
		ori=CPlayer.Humanoid.WalkSpeed
		sgrip=Tool.Spear.SpearGrip.C0
		CPlayer.Humanoid.WalkSpeed=16
		print("Lunge!")
		Tool.Spear.metalSwing.Pitch=.7
		Tool.Handle.Lunge.Pitch=1.2
		Tool.Handle.Lunge:Play()
		Tool.Spear.metalSwing:Play()
		wait(.15)
		dir=CPlayer.Torso.CFrame.lookVector
		Gyro.Parent=CPlayer.Torso
		Gyro.cframe=CPlayer.Torso.CFrame*CFrame.fromEulerAnglesXYZ(0,-math.pi/1.9,0)
		CPlayer.Torso.Neck.C0=neckC0*CFrame.fromEulerAnglesXYZ(math.pi/8,math.pi/12,math.pi/2)
		FakeSL.C0=LeftS.C0*CFrame.fromEulerAnglesXYZ(-math.pi/2,0,0)+Vector3.new(.25,-.5,0)
		FakeSL.C0=FakeSL.C0*CFrame.fromEulerAnglesXYZ(0,0,0)
		Tool.Spear.SpearGrip.C0=Tool.Spear.SpearGrip.C0*CFrame.fromEulerAnglesXYZ(math.pi/2,-math.pi/2,0)
		Tool.Spear.SpearGrip.C0=Tool.Spear.SpearGrip.C0*CFrame.new(.1,-.75,0.65)*CFrame.fromEulerAnglesXYZ(math.pi/34,0,0)
		FakeS.DesiredAngle=-.3
		FakeSL.DesiredAngle=0
		FakeSL.CurrentAngle=0
		FakeS.CurrentAngle=0
		FakeR.CurrentAngle=0.3
		FakeR.DesiredAngle=.3
		FakeL.CurrentAngle=.3
		FakeL.DesiredAngle=.2
		--[[vel=Instance.new("BodyVelocity")
		vel.P=4000
		vel.maxForce=Vector3.new(math.huge,0,math.huge)
		vel.velocity=dir*15
		vel.Parent=CPlayer.Torso
		game:GetService("Debris"):AddItem(vel,.125)]]
		wait(.075)
			if Rage.Value>=40 then
				Rage.Value=Rage.Value-5
			e=Instance.new("Part")
			e.Name="Effect"
			e.TopSurface=0
			e.BottomSurface=0
			e.formFactor="Symmetric"
			e.Size=Vector3.new(1,2,1)
			e.Anchored=false
			p=Instance.new("BodyVelocity")
			p.P=5000
			p.maxForce=Vector3.new(800000,800000,800000)
			p.velocity=dir*40
			p.Parent=e
			e.BrickColor=BrickColor:Black()
			e.Reflectance=.25
			s=script.BoltScript:clone()
			s.Parent=e
			s.Disabled=false
		c=Instance.new("ObjectValue")
		c.Name="creator"
		c.Value=game.Players.LocalPlayer
		c.Parent=s

			e.CanCollide=false
			m=script.Parent.SpikeMesh:clone()
			m.Name="Mesh"
			m.Parent=e
			e.CFrame=script.Parent.Spear.CFrame*CFrame.fromEulerAnglesXYZ(math.pi/2,0,0)
			e.Parent=workspace
			coroutine.resume(coroutine.create(function(m) for i=1, 16 do m.Transparency=i/16 m.Mesh.Scale=m.Mesh.Scale-Vector3.new(.1,-.05,.1)wait() end m.Parent=nil end),e)
			
			s=Tool.Spear.Bolt:clone()
			s.Parent=e
			s:Play()
			end
			local R_Con=Tool.Spear.Touched:connect(function(hit) Damage(hit,10,dir*50) end)
			for i=1, 4 do
			FakeSL.C0=LeftS.C0*CFrame.fromEulerAnglesXYZ(-math.pi/2.3,0,0)+Vector3.new(.25-i*.185,-.5,0)
			wait(.01)
		end
		wait(.15)
		R_Con:disconnect()
		CPlayer.Humanoid.WalkSpeed=ori
		Tool.Spear.SpearGrip.C0=sgrip
		Gyro.Parent=nil
		AttackPos=2
		wEnabled=true
			print("!")
		
		elseif calc>.66 then
			print("Tumble")
		end
		wEnabled=true
		AttackPos=1
	end
	if type(R_Con)=="userdata" then
		R_Con:disconnect()
		R_Con=nil
	end
end
AttackResetDeb=true
CD=true
AttackPos=1
doSpecial=function(Add)
	if Add.Name=="SpecialRequest" then
		game:GetService("Debris"):AddItem(Add,1)
		val=Add.Value
		if wEnabled==false then
			while true do
				if wEnabled==true then
					break
				end
				wait()
			end
		end
		print("PERFORM")
		Specials[val]()
	end
end
Initiate=function()
	if CD==false then return end
	canAnim=false
	Attack(AttackPos)
	if AttackResetDeb == false then 
		return 
	end
	AttackResetDeb=false
	while true do
		SAPos=AttackPos
		wait(.6)
		if WEnabled==false then
			wait(.35)
		end
		if AttackPos==SAPos then
			AttackPos=1
			AttackDeb=false
			resWelds()
			canAnim=true
			wait(.1)
			AttackDeb=true
			break
		end
	end
	AttackResetDeb=true
end
EquipDebounce=true
onEquipped=function(mouse)
	if not EquipDebounce then
		return
	end
	EquipDebounce=false
	CPlayer=Tool.Parent
	Animation(CPlayer["Torso"],"Stop")
	Hum=CPlayer:FindFirstChild("Humanoid")
	rj=Hum.Running:connect(checkSpeed)
	j=Hum.Jumping:connect(function() Anim="Jump" end)
	for _,v in pairs(Tool.Handle:children()) do
		if v.className=="Sound" then
			v:Stop()
		end
	end
	while Tool.Parent==CPlayer do
		if canAnim==true then
			anims[Anim]()
		end
		wait(.05)
	end
end
onPutAway=function()
	canAnim = true
	if CPlayer==nil then
		return
	end
	rj:disconnect()
	j:disconnect()
	if EquipDebounce==false then
		Animation(CPlayer["Torso"],"Resume")
		EquipDebounce=true
	end
	for _,v in pairs(Tool.Handle:children()) do
		if v.className=="Sound" then
			v:Stop()
		end
	end
end
Tool.Unequipped:connect(onPutAway)
Tool.Equipped:connect(onEquipped)
Tool.Activated:connect(Initiate)
HandlePB=function(BAR)
	while true do
		Div=Rage.Value/MaxRage
		if Rage.Value<10 then
			Rag=string.sub(Rage.Value,1,3)
		else
			Rag=string.sub(Rage.Value,1,4)
		end
		BAR.PressureBar.RageBar.Fill.Size=UDim2.new(Div,0,.9,0)
		BAR.PressureBar.RageBar.Label.Text="Energy ("..tostring(Rag)..")"
		wait()
	end
end

script.ChildAdded:connect(doSpecial)
Offset=CFrame.new(0,2.4,0)
while true do
	wait(.11)
	Tool.Rage.Value=Tool.Rage.Value+1
	if Tool.Rage.Value>300 then
		Tool.Rage.Value=300
		RageMode = true
	end
	Div=Rage.Value/MaxRage
		if Rage.Value<10 then
			Rag=string.sub(Rage.Value,1,3)
		else
			Rag=string.sub(Rage.Value,1,4)
		end
		if started == false then
		started = true
		script.RageGUI2.Parent = game.Players.LocalPlayer.PlayerGui
		end
		game.Players.LocalPlayer.PlayerGui.RageGUI2.PressureBar.RageBar.Fill.Size=UDim2.new(Div,0,.9,0)
		game.Players.LocalPlayer.PlayerGui.RageGUI2.PressureBar.RageBar.Label.Text="Ascension("..tostring(Rag)..")"
		lehg21.Transparency = 1 - (script.Parent.Rage.Value/300)
		char["Left Arm"].Transparency = 0 + (script.Parent.Rage.Value/300)
		lehg22.Transparency = 1 - (script.Parent.Rage.Value/300)
		char["Right Arm"].Transparency = 0 + (script.Parent.Rage.Value/300)
		--game.Players.LocalPlayer.PlayerGui.RageGUI2.PressureBar.RageBar.Fill.oof.Value = tostring(Rag)
		wait()
end
