local play = game.Players.LocalPlayer
local char = play.Character
local LeftArm = char["Left Arm"]
local RightArm = char["Right Arm"]
local LeftLeg = char["Left Leg"]
local RightLeg = char["Right Leg"]
local spawned = false
local debounce = false
local asdrot = 0
local bouncing = false
local mode = "Combo"
local mana = 200
local change = 0
local rage = false
local explosion = false
local golden = false
local equipped = true
local equipcheck = true
local charge = 1
local sped = 1
local riding = false
local sine = 0
local torsovel = 0
local sit = false
local charging = false
local combo = 1
local Anim = "wot"
local attack = false

local model = Instance.new("Model", char)
model.Name = "weapon parts go here!"
local weapon = Instance.new("Model", model)
weapon.Name = "weapon"

part = function(wel,cancollid,size,shape,color,transp,mat,weldpart,c0,nam)
if shape ~= "Wedge" then
local q = Instance.new("Part", weapon)
q.CustomPhysicalProperties = PhysicalProperties.new(0,0,0,0,0)
q.Shape = shape
q.Size = size
q.Transparency = transp
q.BrickColor = color
q.Material = mat
q.FrontSurface = "Smooth"
q.BackSurface = "Smooth"
q.LeftSurface = "Smooth"
q.RightSurface = "Smooth"
q.BottomSurface = "Smooth"
q.TopSurface = "Smooth"
if cancollid == 1 then
q.CanCollide = false
end
q.Name = nam
if wel == 1 then
local qw = Instance.new("Weld", q)
qw.Part0 = weldpart
qw.Part1 = q
qw.C0 = c0
end
end
end

char.Torso.Transparency = 1
RightArm.Transparency = 1
LeftArm.Transparency = 1
RightLeg.Transparency = 1
LeftLeg.Transparency = 1

part(1,1,Vector3.new(1.8,1.8,1),"Block",char.Torso.BrickColor,0,"SmoothPlastic",char.Torso,CFrame.new(0,0,0)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(1.8,2,.8),"Block",char.Torso.BrickColor,0,"SmoothPlastic",char.Torso,CFrame.new(0,0,0)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(2,1.8,.8),"Block",char.Torso.BrickColor,0,"SmoothPlastic",char.Torso,CFrame.new(0,0,0)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(0.79999971389771,0.20000000298023,0.20000000298023),"Cylinder",char.Torso.BrickColor,0,"SmoothPlastic",char.Torso,CFrame.new(-0.89999997615814,-0.90000009536743,0)*CFrame.fromOrientation(0,1.5707963267949,0),"Cylinder")
part(1,1,Vector3.new(0.20000000298023,0.20000000298023,0.20000000298023),"Ball",char.Torso.BrickColor,0,"SmoothPlastic",char.Torso,CFrame.new(-0.89999997615814,-0.90000009536743,-0.40000000596046)*CFrame.fromOrientation(0,0,0),"Ball")
part(1,1,Vector3.new(0.20000000298023,0.20000000298023,0.20000000298023),"Ball",char.Torso.BrickColor,0,"SmoothPlastic",char.Torso,CFrame.new(-0.89999997615814,-0.90000009536743,0.39999997615814)*CFrame.fromOrientation(0,0,0),"Ball")
part(1,1,Vector3.new(1.7999999523163,0.20000000298023,0.20000000298023),"Cylinder",char.Torso.BrickColor,0,"SmoothPlastic",char.Torso,CFrame.new(-1.1920928955078e-07,-0.90000021457672,-0.40000003576279)*CFrame.fromOrientation(0,0,0),"Cylinder")
part(1,1,Vector3.new(1.7999999523163,0.20000000298023,0.20000000298023),"Cylinder",char.Torso.BrickColor,0,"SmoothPlastic",char.Torso,CFrame.new(-0.89999997615814,-3.129243850708e-07,0.40000000596046)*CFrame.fromOrientation(0,-3.1415926535898,-1.5707963267949),"Cylinder")
part(1,1,Vector3.new(1.7999999523163,0.20000000298023,0.20000000298023),"Cylinder",char.Torso.BrickColor,0,"SmoothPlastic",char.Torso,CFrame.new(-0.89999997615814,-3.129243850708e-07,-0.39999997615814)*CFrame.fromOrientation(0,-3.1415926535898,-1.5707963267949),"Cylinder")
part(1,1,Vector3.new(1.7999999523163,0.20000000298023,0.20000000298023),"Cylinder",char.Torso.BrickColor,0,"SmoothPlastic",char.Torso,CFrame.new(-1.1920928955078e-07,-0.90000021457672,0.39999994635582)*CFrame.fromOrientation(0,0,0),"Cylinder")
part(1,1,Vector3.new(1.7999999523163,0.20000000298023,0.20000000298023),"Cylinder",char.Torso.BrickColor,0,"SmoothPlastic",char.Torso,CFrame.new(-1.1920928955078e-07,0.89999985694885,0.39999994635582)*CFrame.fromOrientation(0,0,0),"Cylinder")
part(1,1,Vector3.new(1.7999999523163,0.20000000298023,0.20000000298023),"Cylinder",char.Torso.BrickColor,0,"SmoothPlastic",char.Torso,CFrame.new(0.90000009536743,-3.129243850708e-07,-0.39999997615814)*CFrame.fromOrientation(0,-3.1415926535898,-1.5707963267949),"Cylinder")
part(1,1,Vector3.new(1.7999999523163,0.20000000298023,0.20000000298023),"Cylinder",char.Torso.BrickColor,0,"SmoothPlastic",char.Torso,CFrame.new(0.90000009536743,-3.129243850708e-07,0.40000000596046)*CFrame.fromOrientation(0,-3.1415926535898,-1.5707963267949),"Cylinder")
part(1,1,Vector3.new(0.79999971389771,0.20000000298023,0.20000000298023),"Cylinder",char.Torso.BrickColor,0,"SmoothPlastic",char.Torso,CFrame.new(0.90000009536743,-0.90000009536743,0)*CFrame.fromOrientation(0,1.5707963267949,0),"Cylinder")
part(1,1,Vector3.new(0.20000000298023,0.20000000298023,0.20000000298023),"Ball",char.Torso.BrickColor,0,"SmoothPlastic",char.Torso,CFrame.new(-0.89999997615814,0.89999997615814,0.39999997615814)*CFrame.fromOrientation(0,0,0),"Ball")
part(1,1,Vector3.new(0.20000000298023,0.20000000298023,0.20000000298023),"Ball",char.Torso.BrickColor,0,"SmoothPlastic",char.Torso,CFrame.new(0.90000140666962,-0.90000009536743,-0.40000000596046)*CFrame.fromOrientation(0,0,0),"Ball")
part(1,1,Vector3.new(0.20000000298023,0.20000000298023,0.20000000298023),"Ball",char.Torso.BrickColor,0,"SmoothPlastic",char.Torso,CFrame.new(0.90000140666962,0.89999997615814,0.39999997615814)*CFrame.fromOrientation(0,0,0),"Ball")
part(1,1,Vector3.new(0.20000000298023,0.20000000298023,0.20000000298023),"Ball",char.Torso.BrickColor,0,"SmoothPlastic",char.Torso,CFrame.new(0.90000140666962,-0.90000009536743,0.39999997615814)*CFrame.fromOrientation(0,0,0),"Ball")
part(1,1,Vector3.new(0.79999971389771,0.20000000298023,0.20000000298023),"Cylinder",char.Torso.BrickColor,0,"SmoothPlastic",char.Torso,CFrame.new(-0.89999997615814,0.89999997615814,0)*CFrame.fromOrientation(0,1.5707963267949,0),"Cylinder")
part(1,1,Vector3.new(0.79999971389771,0.20000000298023,0.20000000298023),"Cylinder",char.Torso.BrickColor,0,"SmoothPlastic",char.Torso,CFrame.new(0.90000009536743,0.89999997615814,0)*CFrame.fromOrientation(0,1.5707963267949,0),"Cylinder")
part(1,1,Vector3.new(0.20000000298023,0.20000000298023,0.20000000298023),"Ball",char.Torso.BrickColor,0,"SmoothPlastic",char.Torso,CFrame.new(-0.89999997615814,0.89999997615814,-0.40000000596046)*CFrame.fromOrientation(0,0,0),"Ball")
part(1,1,Vector3.new(1.7999999523163,0.20000000298023,0.20000000298023),"Cylinder",char.Torso.BrickColor,0,"SmoothPlastic",char.Torso,CFrame.new(-1.1920928955078e-07,0.89999985694885,-0.40000003576279)*CFrame.fromOrientation(0,0,0),"Cylinder")
part(1,1,Vector3.new(0.20000000298023,0.20000000298023,0.20000000298023),"Ball",char.Torso.BrickColor,0,"SmoothPlastic",char.Torso,CFrame.new(0.90000140666962,0.89999997615814,-0.40000000596046)*CFrame.fromOrientation(0,0,0),"Ball")

part(1,1,Vector3.new(.8,1.8,1),"Block",RightArm.BrickColor,0,"SmoothPlastic",RightArm,CFrame.new(0,0,0)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(.8,2,.8),"Block",RightArm.BrickColor,0,"SmoothPlastic",RightArm,CFrame.new(0,0,0)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(1,1.8,.8),"Block",RightArm.BrickColor,0,"SmoothPlastic",RightArm,CFrame.new(0,0,0)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(1.7999999523163,0.20000000298023,0.20000000298023),"Cylinder",RightArm.BrickColor,0,"SmoothPlastic",RightArm,CFrame.new(-0.39999985694885,-3.129243850708e-07,-0.39999997615814)*CFrame.fromOrientation(0,-3.1415926535898,-1.5707963267949),"Cylinder")
part(1,1,Vector3.new(0.20000000298023,0.20000000298023,0.20000000298023),"Ball",RightArm.BrickColor,0,"SmoothPlastic",RightArm,CFrame.new(0.39999997615814,0.89999997615814,-0.40000000596046)*CFrame.fromOrientation(0,0,0),"Ball")
part(1,1,Vector3.new(0.20000000298023,0.20000000298023,0.20000000298023),"Ball",RightArm.BrickColor,0,"SmoothPlastic",RightArm,CFrame.new(-0.40000021457672,-0.90000009536743,-0.40000000596046)*CFrame.fromOrientation(0,0,0),"Ball")
part(1,1,Vector3.new(0.79999971389771,0.20000000298023,0.20000000298023),"Cylinder",RightArm.BrickColor,0,"SmoothPlastic",RightArm,CFrame.new(9.5367431640625e-07,-0.89999997615814,-0.40000000596046)*CFrame.fromOrientation(0,3.1415926535898,0),"Cylinder")
part(1,1,Vector3.new(1.7999999523163,0.20000000298023,0.20000000298023),"Cylinder",RightArm.BrickColor,0,"SmoothPlastic",RightArm,CFrame.new(0.40000033378601,-3.129243850708e-07,-0.39999997615814)*CFrame.fromOrientation(0,-3.1415926535898,-1.5707963267949),"Cylinder")
part(1,1,Vector3.new(0.79999971389771,0.20000000298023,0.20000000298023),"Cylinder",RightArm.BrickColor,0,"SmoothPlastic",RightArm,CFrame.new(-0.40000021457672,0.89999997615814,0)*CFrame.fromOrientation(0,1.5707963267949,0),"Cylinder")
part(1,1,Vector3.new(0.79999971389771,0.20000000298023,0.20000000298023),"Cylinder",RightArm.BrickColor,0,"SmoothPlastic",RightArm,CFrame.new(-0.40000021457672,-0.90000009536743,0)*CFrame.fromOrientation(0,1.5707963267949,0),"Cylinder")
part(1,1,Vector3.new(0.20000000298023,0.20000000298023,0.20000000298023),"Ball",RightArm.BrickColor,0,"SmoothPlastic",RightArm,CFrame.new(0.39999997615814,-0.90000009536743,-0.40000000596046)*CFrame.fromOrientation(0,0,0),"Ball")
part(1,1,Vector3.new(0.79999971389771,0.20000000298023,0.20000000298023),"Cylinder",RightArm.BrickColor,0,"SmoothPlastic",RightArm,CFrame.new(0.39999997615814,0.89999997615814,0)*CFrame.fromOrientation(0,1.5707963267949,0),"Cylinder")
part(1,1,Vector3.new(0.20000000298023,0.20000000298023,0.20000000298023),"Ball",RightArm.BrickColor,0,"SmoothPlastic",RightArm,CFrame.new(-0.40000021457672,0.89999997615814,0.39999997615814)*CFrame.fromOrientation(0,0,0),"Ball")
part(1,1,Vector3.new(1.7999999523163,0.20000000298023,0.20000000298023),"Cylinder",RightArm.BrickColor,0,"SmoothPlastic",RightArm,CFrame.new(-0.39999985694885,-3.129243850708e-07,0.40000000596046)*CFrame.fromOrientation(0,-3.1415926535898,-1.5707963267949),"Cylinder")
part(1,1,Vector3.new(0.79999971389771,0.20000000298023,0.20000000298023),"Cylinder",RightArm.BrickColor,0,"SmoothPlastic",RightArm,CFrame.new(9.5367431640625e-07,0.89999997615814,0.40000000596046)*CFrame.fromOrientation(0,3.1415926535898,0),"Cylinder")
part(1,1,Vector3.new(0.20000000298023,0.20000000298023,0.20000000298023),"Ball",RightArm.BrickColor,0,"SmoothPlastic",RightArm,CFrame.new(-0.40000021457672,-0.90000009536743,0.39999997615814)*CFrame.fromOrientation(0,0,0),"Ball")
part(1,1,Vector3.new(0.79999971389771,0.20000000298023,0.20000000298023),"Cylinder",RightArm.BrickColor,0,"SmoothPlastic",RightArm,CFrame.new(0.39999997615814,-0.90000009536743,0)*CFrame.fromOrientation(0,1.5707963267949,0),"Cylinder")
part(1,1,Vector3.new(0.79999971389771,0.20000000298023,0.20000000298023),"Cylinder",RightArm.BrickColor,0,"SmoothPlastic",RightArm,CFrame.new(9.5367431640625e-07,-0.89999997615814,0.40000000596046)*CFrame.fromOrientation(0,3.1415926535898,0),"Cylinder")
part(1,1,Vector3.new(0.20000000298023,0.20000000298023,0.20000000298023),"Ball",RightArm.BrickColor,0,"SmoothPlastic",RightArm,CFrame.new(0.39999997615814,0.89999997615814,0.39999997615814)*CFrame.fromOrientation(0,0,0),"Ball")
part(1,1,Vector3.new(1.7999999523163,0.20000000298023,0.20000000298023),"Cylinder",RightArm.BrickColor,0,"SmoothPlastic",RightArm,CFrame.new(0.40000033378601,-3.129243850708e-07,0.40000000596046)*CFrame.fromOrientation(0,-3.1415926535898,-1.5707963267949),"Cylinder")
part(1,1,Vector3.new(0.20000000298023,0.20000000298023,0.20000000298023),"Ball",RightArm.BrickColor,0,"SmoothPlastic",RightArm,CFrame.new(0.39999997615814,-0.90000009536743,0.39999997615814)*CFrame.fromOrientation(0,0,0),"Ball")
part(1,1,Vector3.new(0.79999971389771,0.20000000298023,0.20000000298023),"Cylinder",RightArm.BrickColor,0,"SmoothPlastic",RightArm,CFrame.new(9.5367431640625e-07,0.89999997615814,-0.40000000596046)*CFrame.fromOrientation(0,3.1415926535898,0),"Cylinder")
part(1,1,Vector3.new(0.20000000298023,0.20000000298023,0.20000000298023),"Ball",RightArm.BrickColor,0,"SmoothPlastic",RightArm,CFrame.new(-0.40000021457672,0.89999997615814,-0.40000000596046)*CFrame.fromOrientation(0,0,0),"Ball")

part(1,1,Vector3.new(.8,1.8,1),"Block",RightLeg.BrickColor,0,"SmoothPlastic",RightLeg,CFrame.new(0,0,0)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(.8,2,.8),"Block",RightLeg.BrickColor,0,"SmoothPlastic",RightLeg,CFrame.new(0,0,0)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(1,1.8,.8),"Block",RightLeg.BrickColor,0,"SmoothPlastic",RightLeg,CFrame.new(0,0,0)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(1.7999999523163,0.20000000298023,0.20000000298023),"Cylinder",RightLeg.BrickColor,0,"SmoothPlastic",RightLeg,CFrame.new(-1.8999998569489,-3.129243850708e-07,-0.39999997615814)*CFrame.fromOrientation(0,-3.1415926535898,-1.5707963267949),"Cylinder")
part(1,1,Vector3.new(0.20000000298023,0.20000000298023,0.20000000298023),"Ball",RightLeg.BrickColor,0,"SmoothPlastic",RightLeg,CFrame.new(-1.1000000238419,0.89999997615814,-0.40000000596046)*CFrame.fromOrientation(0,0,0),"Ball")
part(1,1,Vector3.new(0.20000000298023,0.20000000298023,0.20000000298023),"Ball",RightLeg.BrickColor,0,"SmoothPlastic",RightLeg,CFrame.new(-1.9000002145767,-0.90000009536743,-0.40000000596046)*CFrame.fromOrientation(0,0,0),"Ball")
part(1,1,Vector3.new(0.79999971389771,0.20000000298023,0.20000000298023),"Cylinder",RightLeg.BrickColor,0,"SmoothPlastic",RightLeg,CFrame.new(-1.4999990463257,-0.89999997615814,-0.40000000596046)*CFrame.fromOrientation(0,3.1415926535898,0),"Cylinder")
part(1,1,Vector3.new(1.7999999523163,0.20000000298023,0.20000000298023),"Cylinder",RightLeg.BrickColor,0,"SmoothPlastic",RightLeg,CFrame.new(-1.099999666214,-3.129243850708e-07,-0.39999997615814)*CFrame.fromOrientation(0,-3.1415926535898,-1.5707963267949),"Cylinder")
part(1,1,Vector3.new(0.79999971389771,0.20000000298023,0.20000000298023),"Cylinder",RightLeg.BrickColor,0,"SmoothPlastic",RightLeg,CFrame.new(-1.9000002145767,0.89999997615814,0)*CFrame.fromOrientation(0,1.5707963267949,0),"Cylinder")
part(1,1,Vector3.new(0.79999971389771,0.20000000298023,0.20000000298023),"Cylinder",RightLeg.BrickColor,0,"SmoothPlastic",RightLeg,CFrame.new(-1.9000002145767,-0.90000009536743,0)*CFrame.fromOrientation(0,1.5707963267949,0),"Cylinder")
part(1,1,Vector3.new(0.20000000298023,0.20000000298023,0.20000000298023),"Ball",RightLeg.BrickColor,0,"SmoothPlastic",RightLeg,CFrame.new(-1.1000000238419,-0.90000009536743,-0.40000000596046)*CFrame.fromOrientation(0,0,0),"Ball")
part(1,1,Vector3.new(0.79999971389771,0.20000000298023,0.20000000298023),"Cylinder",RightLeg.BrickColor,0,"SmoothPlastic",RightLeg,CFrame.new(-1.1000000238419,0.89999997615814,0)*CFrame.fromOrientation(0,1.5707963267949,0),"Cylinder")
part(1,1,Vector3.new(0.20000000298023,0.20000000298023,0.20000000298023),"Ball",RightLeg.BrickColor,0,"SmoothPlastic",RightLeg,CFrame.new(-1.9000002145767,0.89999997615814,0.39999997615814)*CFrame.fromOrientation(0,0,0),"Ball")
part(1,1,Vector3.new(1.7999999523163,0.20000000298023,0.20000000298023),"Cylinder",RightLeg.BrickColor,0,"SmoothPlastic",RightLeg,CFrame.new(-1.8999998569489,-3.129243850708e-07,0.40000000596046)*CFrame.fromOrientation(0,-3.1415926535898,-1.5707963267949),"Cylinder")
part(1,1,Vector3.new(0.79999971389771,0.20000000298023,0.20000000298023),"Cylinder",RightLeg.BrickColor,0,"SmoothPlastic",RightLeg,CFrame.new(-1.4999990463257,0.89999997615814,0.40000000596046)*CFrame.fromOrientation(0,3.1415926535898,0),"Cylinder")
part(1,1,Vector3.new(0.20000000298023,0.20000000298023,0.20000000298023),"Ball",RightLeg.BrickColor,0,"SmoothPlastic",RightLeg,CFrame.new(-1.9000002145767,-0.90000009536743,0.39999997615814)*CFrame.fromOrientation(0,0,0),"Ball")
part(1,1,Vector3.new(0.79999971389771,0.20000000298023,0.20000000298023),"Cylinder",RightLeg.BrickColor,0,"SmoothPlastic",RightLeg,CFrame.new(-1.1000000238419,-0.90000009536743,0)*CFrame.fromOrientation(0,1.5707963267949,0),"Cylinder")
part(1,1,Vector3.new(0.79999971389771,0.20000000298023,0.20000000298023),"Cylinder",RightLeg.BrickColor,0,"SmoothPlastic",RightLeg,CFrame.new(-1.4999990463257,-0.89999997615814,0.40000000596046)*CFrame.fromOrientation(0,3.1415926535898,0),"Cylinder")
part(1,1,Vector3.new(0.20000000298023,0.20000000298023,0.20000000298023),"Ball",RightLeg.BrickColor,0,"SmoothPlastic",RightLeg,CFrame.new(-1.1000000238419,0.89999997615814,0.39999997615814)*CFrame.fromOrientation(0,0,0),"Ball")
part(1,1,Vector3.new(1.7999999523163,0.20000000298023,0.20000000298023),"Cylinder",RightLeg.BrickColor,0,"SmoothPlastic",RightLeg,CFrame.new(-1.099999666214,-3.129243850708e-07,0.40000000596046)*CFrame.fromOrientation(0,-3.1415926535898,-1.5707963267949),"Cylinder")
part(1,1,Vector3.new(0.20000000298023,0.20000000298023,0.20000000298023),"Ball",RightLeg.BrickColor,0,"SmoothPlastic",RightLeg,CFrame.new(-1.1000000238419,-0.90000009536743,0.39999997615814)*CFrame.fromOrientation(0,0,0),"Ball")

part(1,1,Vector3.new(.8,1.8,1),"Block",LeftLeg.BrickColor,0,"SmoothPlastic",LeftLeg,CFrame.new(0,0,0)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(.8,2,.8),"Block",LeftLeg.BrickColor,0,"SmoothPlastic",LeftLeg,CFrame.new(0,0,0)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(1,1.8,.8),"Block",LeftLeg.BrickColor,0,"SmoothPlastic",LeftLeg,CFrame.new(0,0,0)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(1.7999999523163,0.20000000298023,0.20000000298023),"Cylinder",LeftLeg.BrickColor,0,"SmoothPlastic",LeftLeg,CFrame.new(-1.8999998569489,-3.129243850708e-07,-0.39999997615814)*CFrame.fromOrientation(0,-3.1415926535898,-1.5707963267949),"Cylinder")
part(1,1,Vector3.new(0.20000000298023,0.20000000298023,0.20000000298023),"Ball",LeftLeg.BrickColor,0,"SmoothPlastic",LeftLeg,CFrame.new(-1.1000000238419,0.89999997615814,-0.40000000596046)*CFrame.fromOrientation(0,0,0),"Ball")
part(1,1,Vector3.new(0.20000000298023,0.20000000298023,0.20000000298023),"Ball",LeftLeg.BrickColor,0,"SmoothPlastic",LeftLeg,CFrame.new(-1.9000002145767,-0.90000009536743,-0.40000000596046)*CFrame.fromOrientation(0,0,0),"Ball")
part(1,1,Vector3.new(0.79999971389771,0.20000000298023,0.20000000298023),"Cylinder",LeftLeg.BrickColor,0,"SmoothPlastic",LeftLeg,CFrame.new(-1.4999990463257,-0.89999997615814,-0.40000000596046)*CFrame.fromOrientation(0,3.1415926535898,0),"Cylinder")
part(1,1,Vector3.new(1.7999999523163,0.20000000298023,0.20000000298023),"Cylinder",LeftLeg.BrickColor,0,"SmoothPlastic",LeftLeg,CFrame.new(-1.099999666214,-3.129243850708e-07,-0.39999997615814)*CFrame.fromOrientation(0,-3.1415926535898,-1.5707963267949),"Cylinder")
part(1,1,Vector3.new(0.79999971389771,0.20000000298023,0.20000000298023),"Cylinder",LeftLeg.BrickColor,0,"SmoothPlastic",LeftLeg,CFrame.new(-1.9000002145767,0.89999997615814,0)*CFrame.fromOrientation(0,1.5707963267949,0),"Cylinder")
part(1,1,Vector3.new(0.79999971389771,0.20000000298023,0.20000000298023),"Cylinder",LeftLeg.BrickColor,0,"SmoothPlastic",LeftLeg,CFrame.new(-1.9000002145767,-0.90000009536743,0)*CFrame.fromOrientation(0,1.5707963267949,0),"Cylinder")
part(1,1,Vector3.new(0.20000000298023,0.20000000298023,0.20000000298023),"Ball",LeftLeg.BrickColor,0,"SmoothPlastic",LeftLeg,CFrame.new(-1.1000000238419,-0.90000009536743,-0.40000000596046)*CFrame.fromOrientation(0,0,0),"Ball")
part(1,1,Vector3.new(0.79999971389771,0.20000000298023,0.20000000298023),"Cylinder",LeftLeg.BrickColor,0,"SmoothPlastic",LeftLeg,CFrame.new(-1.1000000238419,0.89999997615814,0)*CFrame.fromOrientation(0,1.5707963267949,0),"Cylinder")
part(1,1,Vector3.new(0.20000000298023,0.20000000298023,0.20000000298023),"Ball",LeftLeg.BrickColor,0,"SmoothPlastic",LeftLeg,CFrame.new(-1.9000002145767,0.89999997615814,0.39999997615814)*CFrame.fromOrientation(0,0,0),"Ball")
part(1,1,Vector3.new(1.7999999523163,0.20000000298023,0.20000000298023),"Cylinder",LeftLeg.BrickColor,0,"SmoothPlastic",LeftLeg,CFrame.new(-1.8999998569489,-3.129243850708e-07,0.40000000596046)*CFrame.fromOrientation(0,-3.1415926535898,-1.5707963267949),"Cylinder")
part(1,1,Vector3.new(0.79999971389771,0.20000000298023,0.20000000298023),"Cylinder",LeftLeg.BrickColor,0,"SmoothPlastic",LeftLeg,CFrame.new(-1.4999990463257,0.89999997615814,0.40000000596046)*CFrame.fromOrientation(0,3.1415926535898,0),"Cylinder")
part(1,1,Vector3.new(0.20000000298023,0.20000000298023,0.20000000298023),"Ball",LeftLeg.BrickColor,0,"SmoothPlastic",LeftLeg,CFrame.new(-1.9000002145767,-0.90000009536743,0.39999997615814)*CFrame.fromOrientation(0,0,0),"Ball")
part(1,1,Vector3.new(0.79999971389771,0.20000000298023,0.20000000298023),"Cylinder",LeftLeg.BrickColor,0,"SmoothPlastic",LeftLeg,CFrame.new(-1.1000000238419,-0.90000009536743,0)*CFrame.fromOrientation(0,1.5707963267949,0),"Cylinder")
part(1,1,Vector3.new(0.79999971389771,0.20000000298023,0.20000000298023),"Cylinder",LeftLeg.BrickColor,0,"SmoothPlastic",LeftLeg,CFrame.new(-1.4999990463257,-0.89999997615814,0.40000000596046)*CFrame.fromOrientation(0,3.1415926535898,0),"Cylinder")
part(1,1,Vector3.new(0.20000000298023,0.20000000298023,0.20000000298023),"Ball",LeftLeg.BrickColor,0,"SmoothPlastic",LeftLeg,CFrame.new(-1.1000000238419,0.89999997615814,0.39999997615814)*CFrame.fromOrientation(0,0,0),"Ball")
part(1,1,Vector3.new(1.7999999523163,0.20000000298023,0.20000000298023),"Cylinder",LeftLeg.BrickColor,0,"SmoothPlastic",LeftLeg,CFrame.new(-1.099999666214,-3.129243850708e-07,0.40000000596046)*CFrame.fromOrientation(0,-3.1415926535898,-1.5707963267949),"Cylinder")
part(1,1,Vector3.new(0.20000000298023,0.20000000298023,0.20000000298023),"Ball",LeftLeg.BrickColor,0,"SmoothPlastic",LeftLeg,CFrame.new(-1.1000000238419,-0.90000009536743,0.39999997615814)*CFrame.fromOrientation(0,0,0),"Ball")

part(1,1,Vector3.new(.8,1.8,1),"Block",LeftArm.BrickColor,0,"SmoothPlastic",LeftArm,CFrame.new(0,0,0)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(.8,2,.8),"Block",LeftArm.BrickColor,0,"SmoothPlastic",LeftArm,CFrame.new(0,0,0)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(1,1.8,.8),"Block",LeftArm.BrickColor,0,"SmoothPlastic",LeftArm,CFrame.new(0,0,0)*CFrame.fromOrientation(0,0,0),"Block")
part(1,1,Vector3.new(1.7999999523163,0.20000000298023,0.20000000298023),"Cylinder",LeftArm.BrickColor,0,"SmoothPlastic",LeftArm,CFrame.new(-0.39999985694885,-3.129243850708e-07,-0.39999997615814)*CFrame.fromOrientation(0,-3.1415926535898,-1.5707963267949),"Cylinder")
part(1,1,Vector3.new(0.20000000298023,0.20000000298023,0.20000000298023),"Ball",LeftArm.BrickColor,0,"SmoothPlastic",LeftArm,CFrame.new(0.39999997615814,0.89999997615814,-0.40000000596046)*CFrame.fromOrientation(0,0,0),"Ball")
part(1,1,Vector3.new(0.20000000298023,0.20000000298023,0.20000000298023),"Ball",LeftArm.BrickColor,0,"SmoothPlastic",LeftArm,CFrame.new(-0.40000021457672,-0.90000009536743,-0.40000000596046)*CFrame.fromOrientation(0,0,0),"Ball")
part(1,1,Vector3.new(0.79999971389771,0.20000000298023,0.20000000298023),"Cylinder",LeftArm.BrickColor,0,"SmoothPlastic",LeftArm,CFrame.new(9.5367431640625e-07,-0.89999997615814,-0.40000000596046)*CFrame.fromOrientation(0,3.1415926535898,0),"Cylinder")
part(1,1,Vector3.new(1.7999999523163,0.20000000298023,0.20000000298023),"Cylinder",LeftArm.BrickColor,0,"SmoothPlastic",LeftArm,CFrame.new(0.40000033378601,-3.129243850708e-07,-0.39999997615814)*CFrame.fromOrientation(0,-3.1415926535898,-1.5707963267949),"Cylinder")
part(1,1,Vector3.new(0.79999971389771,0.20000000298023,0.20000000298023),"Cylinder",LeftArm.BrickColor,0,"SmoothPlastic",LeftArm,CFrame.new(-0.40000021457672,0.89999997615814,0)*CFrame.fromOrientation(0,1.5707963267949,0),"Cylinder")
part(1,1,Vector3.new(0.79999971389771,0.20000000298023,0.20000000298023),"Cylinder",LeftArm.BrickColor,0,"SmoothPlastic",LeftArm,CFrame.new(-0.40000021457672,-0.90000009536743,0)*CFrame.fromOrientation(0,1.5707963267949,0),"Cylinder")
part(1,1,Vector3.new(0.20000000298023,0.20000000298023,0.20000000298023),"Ball",LeftArm.BrickColor,0,"SmoothPlastic",LeftArm,CFrame.new(0.39999997615814,-0.90000009536743,-0.40000000596046)*CFrame.fromOrientation(0,0,0),"Ball")
part(1,1,Vector3.new(0.79999971389771,0.20000000298023,0.20000000298023),"Cylinder",LeftArm.BrickColor,0,"SmoothPlastic",LeftArm,CFrame.new(0.39999997615814,0.89999997615814,0)*CFrame.fromOrientation(0,1.5707963267949,0),"Cylinder")
part(1,1,Vector3.new(0.20000000298023,0.20000000298023,0.20000000298023),"Ball",LeftArm.BrickColor,0,"SmoothPlastic",LeftArm,CFrame.new(-0.40000021457672,0.89999997615814,0.39999997615814)*CFrame.fromOrientation(0,0,0),"Ball")
part(1,1,Vector3.new(1.7999999523163,0.20000000298023,0.20000000298023),"Cylinder",LeftArm.BrickColor,0,"SmoothPlastic",LeftArm,CFrame.new(-0.39999985694885,-3.129243850708e-07,0.40000000596046)*CFrame.fromOrientation(0,-3.1415926535898,-1.5707963267949),"Cylinder")
part(1,1,Vector3.new(0.79999971389771,0.20000000298023,0.20000000298023),"Cylinder",LeftArm.BrickColor,0,"SmoothPlastic",LeftArm,CFrame.new(9.5367431640625e-07,0.89999997615814,0.40000000596046)*CFrame.fromOrientation(0,3.1415926535898,0),"Cylinder")
part(1,1,Vector3.new(0.20000000298023,0.20000000298023,0.20000000298023),"Ball",LeftArm.BrickColor,0,"SmoothPlastic",LeftArm,CFrame.new(-0.40000021457672,-0.90000009536743,0.39999997615814)*CFrame.fromOrientation(0,0,0),"Ball")
part(1,1,Vector3.new(0.79999971389771,0.20000000298023,0.20000000298023),"Cylinder",LeftArm.BrickColor,0,"SmoothPlastic",LeftArm,CFrame.new(0.39999997615814,-0.90000009536743,0)*CFrame.fromOrientation(0,1.5707963267949,0),"Cylinder")
part(1,1,Vector3.new(0.79999971389771,0.20000000298023,0.20000000298023),"Cylinder",LeftArm.BrickColor,0,"SmoothPlastic",LeftArm,CFrame.new(9.5367431640625e-07,-0.89999997615814,0.40000000596046)*CFrame.fromOrientation(0,3.1415926535898,0),"Cylinder")
part(1,1,Vector3.new(0.20000000298023,0.20000000298023,0.20000000298023),"Ball",LeftArm.BrickColor,0,"SmoothPlastic",LeftArm,CFrame.new(0.39999997615814,0.89999997615814,0.39999997615814)*CFrame.fromOrientation(0,0,0),"Ball")
part(1,1,Vector3.new(1.7999999523163,0.20000000298023,0.20000000298023),"Cylinder",LeftArm.BrickColor,0,"SmoothPlastic",LeftArm,CFrame.new(0.40000033378601,-3.129243850708e-07,0.40000000596046)*CFrame.fromOrientation(0,-3.1415926535898,-1.5707963267949),"Cylinder")
part(1,1,Vector3.new(0.20000000298023,0.20000000298023,0.20000000298023),"Ball",LeftArm.BrickColor,0,"SmoothPlastic",LeftArm,CFrame.new(0.39999997615814,-0.90000009536743,0.39999997615814)*CFrame.fromOrientation(0,0,0),"Ball")
part(1,1,Vector3.new(0.79999971389771,0.20000000298023,0.20000000298023),"Cylinder",LeftArm.BrickColor,0,"SmoothPlastic",LeftArm,CFrame.new(9.5367431640625e-07,0.89999997615814,-0.40000000596046)*CFrame.fromOrientation(0,3.1415926535898,0),"Cylinder")
part(1,1,Vector3.new(0.20000000298023,0.20000000298023,0.20000000298023),"Ball",LeftArm.BrickColor,0,"SmoothPlastic",LeftArm,CFrame.new(-0.40000021457672,0.89999997615814,-0.40000000596046)*CFrame.fromOrientation(0,0,0),"Ball")
