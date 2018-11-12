Bolt=function(amt)
	End=CFrame.new(script.Parent.Position+Vector3.new(math.random(-20,20)/20,math.random(-20,20)/20,math.random(-20,20)/20))
	for i=1, amt do
		ST=End
		End=script.Parent.CFrame*CFrame.new(math.random(-10,10)/4,math.random(-10,10)/8,math.random(-10,10)/4)
		e=Instance.new("Part")
		e.TopSurface=0
		e.BottomSurface=0
		e.CanCollide=false
		e.Anchored=true
		e.formFactor="Symmetric"
		e.Size=Vector3.new(1,1,1)
		Look=(End.p-ST.p).unit
		m=Instance.new("BlockMesh")
		m.Scale=Vector3.new(.15,.15,(ST.p-End.p).magnitude)
		m.Parent=e
		e.CFrame=CFrame.new(ST.p+Look*(m.Scale.z/2),End.p)
		e.Reflectance=.025
		e.Name="Zap"
		e.BrickColor=script.Parent.BrickColor
		e.Parent=script.Parent.Parent
		coroutine.resume(coroutine.create(function(PAR) for i=1, 20 do PAR.Transparency=i/20 wait() end PAR.Parent=nil end),e)
		wait(.01)
	end
end
wait()
Bolt(400)
