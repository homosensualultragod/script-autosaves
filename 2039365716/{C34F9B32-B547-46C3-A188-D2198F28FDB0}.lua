wait(.3)
for i, v in pairs(game.Players:GetChildren()) do
coroutine.resume(coroutine.create(function()
local play = v
local char = v.Character

local LeftArm = char["Left Arm"]
local RightArm = char["Right Arm"]
local LeftLeg = char["Left Leg"]
local RightLeg = char["Right Leg"]
local NeckCF = CFrame.new(0, 1, 0, -1, 0, 0, 0, 0, 1, 0, 1, 0)
	char.Humanoid.Animator:Destroy()
	char.Animate:Destroy()
	local RootCF = CFrame.fromEulerAnglesXYZ(-1.57, 0, 3.14)
	local RHCF = CFrame.fromEulerAnglesXYZ(0, 1.6, 0)
	local LHCF = (CFrame.fromEulerAnglesXYZ(0, -1.6, 0))
	RSH = nil
	RW = Instance.new("Weld")
	LW = Instance.new("Weld")
	RH = char.Torso["Right Hip"]
	LH = char.Torso["Left Hip"]
	RSH = char.Torso["Right Shoulder"]
	LSH = char.Torso["Left Shoulder"]
	RSH.Parent = nil
	LSH.Parent = nil
	RW.Name = "RW"
	RW.Part0 = char.Torso
	RW.C0 = CFrame.new(1.5, 0.5, 0)
	RW.C1 = CFrame.new(0, 0.5, 0)
	RW.Part1 = RightArm
	RW.Parent = char.Torso
	LW.Name = "LW"
	LW.Part0 = char.Torso
	LW.C0 = CFrame.new(-1.5, 0.5, 0)
	LW.C1 = CFrame.new(0, 0.5, 0)
	LW.Part1 = LeftArm
	LW.Parent = char.Torso
	clerp = function(a, b, t)
	
	return a:lerp(b, t)
end
local legr = 0

local sound = Instance.new("Sound",char.Torso)
sound.SoundId = "rbxassetid://324910276" -- audio id
sound.Playing = true
sound.Looped = true
while true do
	torsovel = (char.HumanoidRootPart.Velocity * Vector3.new(1, 0, 1)).magnitude
		legr = legr + 1
	if torsovel < 1 then
		--dist.Enabled = false
		--dist2.Enabled = false
		sound.Volume = 1
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.Angles(math.rad(30), math.rad(0), math.rad(-45)), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1, 1, -.5) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-90)), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-90)), 0.3)
		RH.C0 = clerp(RH.C0, CFrame.new(1, -1, 0) * RHCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
		LH.C0 = clerp(LH.C0, CFrame.new(-1, -1, 0) * LHCF * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)), 0.3)
	else
		--dist.Enabled = true
		--dist2.Enabled = true
		sound.Volume = 5
		char.HumanoidRootPart.RootJoint.C0 = clerp(char.HumanoidRootPart.RootJoint.C0, RootCF * CFrame.new(math.random(-70,70)/30,math.random(-70,70)/30,math.random(-70,70)/30) * CFrame.Angles(math.rad(math.random(-180,180)), math.rad(math.random(-180,180)), math.rad(math.random(-180,180))), 0.3)
		char.Torso.Neck.C0 = clerp(char.Torso.Neck.C0, NeckCF * CFrame.new(math.random(-70,70)/30,math.random(-70,70)/30,math.random(-70,70)/30) * CFrame.Angles(math.rad(math.random(-180,180)), math.rad(math.random(-180,180)), math.rad(math.random(-180,180))), 0.3)
		RW.C0 = clerp(RW.C0, CFrame.new(1.5,0.5,0) * CFrame.Angles(math.rad(math.random(-180,180)), math.rad(math.random(-180,180)), math.rad(math.random(-180,180))), 0.3)
		LW.C0 = clerp(LW.C0, CFrame.new(-1.5,0.5,0) * CFrame.Angles(math.rad(math.random(-180,180)), math.rad(math.random(-180,180)), math.rad(-90)), 0.3)
		RH.C0 = clerp(RH.C0, CFrame.new(1,-1,0) * RHCF * CFrame.Angles(math.rad(math.random(-180,180)), math.rad(math.random(-180,180)), math.rad(math.random(-180,180))), 0.3)
		LH.C0 = clerp(LH.C0, CFrame.new(-1,-1,0) * LHCF * CFrame.Angles(math.rad(math.random(-180,180)), math.rad(math.random(-180,180)), math.rad(math.random(-180,180))), 0.3)
		
	end
	wait()
end
end))
end