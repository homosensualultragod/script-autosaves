--part = function(size,shape,color,transp,mat,weldpart,c0,nam) "..d[i].."

wait(1)

local d = script.Parent:GetChildren()
for i=1, #d  do 
	if d[i].ClassName ~= "Script" then
	print("part(1,1,Vector3.new("..d[i].Size.X..","..d[i].Size.Y..","..d[i].Size.Z.."),"..d[i].Name..",REPLACE1,"..d[i].Transparency..",REPLACE2,weapon.Handle,CFrame.new("..d[i].CFrame.X..","..(d[i].CFrame.Y) ..","..d[i].CFrame.Z..")*CFrame.fromOrientation("..math.rad(d[i].Orientation.X)..","..math.rad(d[i].Orientation.Y)..","..math.rad(d[i].Orientation.Z).."),"..d[i].Name..")")
	end
end
