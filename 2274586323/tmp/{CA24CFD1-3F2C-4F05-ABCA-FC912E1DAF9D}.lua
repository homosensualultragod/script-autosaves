wait(.3)
local play = game.Players.Infernal_Keeper
local char = workspace.Infernal_Keeper
local equipped = false
local combo = false
local cooldown = false

local tewl = Instance.new("Tool",play.Backpack)
tewl.Name = "Sealing Blade"
tewl.GripForward = Vector3.new(0,0,-1)
tewl.GripRight = Vector3.new(0,1,0)
tewl.GripUp = Vector3.new(0,0,1)
tewl.GripPos = Vector3.new(0,0,-1.5)
local han = Instance.new("Part",tewl)
han.Name = "Handle"
local specmm = Instance.new("SpecialMesh",han)
specmm.MeshId = "rbxasset://fonts/sword.mesh"
specmm.TextureId = "rbxasset://textures/SwordTexture.png"
specmm.VertexColor = Vector3.new(1,.1,.1)

tewl.Equipped:connect(function()
	equipped = true
end)

tewl.Unequipped:connect(function()
	equipped = false
end)

tewl.Activated:connect(function()
	if cooldown == false then
	if combo == false then
	combo = true
	local tt = Instance.new("StringValue",tewl)
	tt.Name = "toolanim"
	tt.Value = "Slash"
	wait(.2)
	combo = false
	else
	combo = false
	local anim = Instance.new("StringValue",tewl)
	anim.Name = "toolanim"
	anim.Value = "Lunge"
	cooldown = true
	tewl.GripForward = Vector3.new(0,0,1)
	tewl.GripRight = Vector3.new(0,-1,0)
	tewl.GripUp = Vector3.new(-1,0,0)
	wait(.4)
	cooldown = false
	tewl.GripForward = Vector3.new(-1,0,0)
	tewl.GripRight = Vector3.new(0,1,0)
	tewl.GripUp = Vector3.new(0,0,1)
	end
	end
end)

han.Touched:connect(function(hit)
	local d = hit.Parent:FindFirstChildOfClass("Humanoid")
	if d ~= nil then
		d.Health = d.Health - 5
	end
end)

while true do
	if equipped == true then
	for i, v in pairs(workspace:GetChildren()) do
		local d = v:FindFirstChildOfClass("Humanoid")
		local hed = v:FindFirstChild("Head")
		local tors = v:FindFirstChild("Torso")
		if d ~= nil and hed ~= nil and v ~= char then
			if (hed.Position - char.Torso.Position).Magnitude < 5 and d.Health > 0 then
				local fire = tors:FindFirstChildOfClass("Fire")
				if fire == nil then
				local flam = Instance.new("Fire",tors)
				flam.Color = Color3.new(1,.1,.1)
				flam.Name = "Flame"
				flam.SecondaryColor = Color3.new(0,0,0)
				coroutine.resume(coroutine.create(function()
					while (hed.Position - char.Torso.Position).Magnitude < 10 and d.Health > 0 do
						wait(.1)
					end
					flam:Destroy()
				end))
				end
				for i = 0,1 do
				local p = Instance.new("Part",tors)
				p.CanCollide = false
				p.Anchored = true
				p.Size = Vector3.new(1,1,1)
				if i == 0 then
				p.Color = Color3.new(0,0,0)
				else
				p.Color = Color3.new(1,0,0)
				end
				local sm = Instance.new("SpecialMesh",p)
				sm.MeshId = "rbxasset://fonts/sword.mesh"
				local x = math.random(0,360)
				local y = math.random(0,360)
				local z = math.random(0,360)
				p.CFrame = tors.CFrame * CFrame.Angles(math.rad(x),math.rad(y),math.rad(z))
				p.CFrame = p.CFrame * CFrame.new(0,0,-500)
				p.CFrame = CFrame.new(p.Position,tors.Position) * CFrame.Angles(0,math.rad(180),0)
				coroutine.resume(coroutine.create(function()
					local trans = 1
					for i = 0,1,.05 do
						trans = trans + (0-trans) * .3
						p.Transparency = trans
						p.CFrame = p.CFrame:Lerp(tors.CFrame * CFrame.Angles(math.rad(x),math.rad(y),math.rad(z)),.3)
						wait()
					end
					d.Health = d.Health - 5
					d.WalkSpeed = d.WalkSpeed - .8
					coroutine.resume(coroutine.create(function()
						local pp = Instance.new("Part",workspace)
						pp.CanCollide = false
						pp.Anchored = true
						pp.CFrame = p.CFrame * CFrame.Angles(math.rad(90),0,0)
						if p.Color == Color3.new(1,0,0) then
							pp.Color = Color3.new(0,0,0)
						else
							pp.Color = Color3.new(1,0,0)
						end
						local pms = Instance.new("SpecialMesh",pp)
						pms.MeshId = "http://www.roblox.com/asset/?id=20329976"
						pms.Scale = Vector3.new(1,3,1)
						while pp.Transparency < 1 do
							pp.Transparency = pp.Transparency + .1
							pms.Scale = pms.Scale:Lerp(Vector3.new(8,.1,8),.4)
							wait()
						end
						pp:Destroy()
					end))
					trans = 0
					while p.Transparency < 1 and d.Health > 0 do
						trans = trans + .05
						sm.Scale = sm.Scale:Lerp(Vector3.new(0,0,2),.3)
						p.Transparency = trans
						wait()
					end
					if d.Health <= 0 then
						if tors.Parent ~= workspace then
						hed.Parent = workspace
						tors.Parent = workspace
						tors.Shape = "Ball"
						tors.Size = Vector3.new(7,7,7)
						tors.Transparency = 1
						local wel = Instance.new("Weld",hed)
						wel.Part0 = hed
						wel.Part1 = tors
						end
						local wel = Instance.new("Weld",p)
						wel.Part0 = p
						wel.Part1 = tors
						wel.C0 = CFrame.Angles(math.rad(x),math.rad(y),math.rad(z))
						p.Anchored = false
						for i = 0,1,.05 do
							trans = trans + (0-trans) * .3
							p.Transparency = trans
							sm.Scale = sm.Scale:Lerp(Vector3.new(1,1,2),.3)
							wait()
						end
					else
						p:Destroy()
						d.WalkSpeed = d.WalkSpeed + .8
					end
				end))
				end
			end
		end
	end
	end
	wait(.1)
end