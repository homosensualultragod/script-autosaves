char = game.Players.LocalPlayer.Character
char.Parent = workspace.CurrentCamera
--[[local d = workspace:GetChildren()
			for i=1, #d  do 
				if d[i].Name:sub(1,13) == "asdadasdasdas" then
				d[i].Anchored = false
				end
			end
]]

makepart = function(par)
par.CollisionGroupId = 2
local p = Instance.new("Part", workspace)
p.TopSurface = "Smooth"
p.BottomSurface = "Smooth"
p.Size = par.Size
if par == char.Head then
p.Size = Vector3.new(1.15,1.15,1.15)
end
p.BrickColor = BrickColor.new("Really red")
p.Material = "Glass"
p.Transparency = 0.8
p.Anchored = true
p.CanCollide = false
p.CFrame = par.CFrame
p.Locked = true
game:GetService("Debris"):AddItem(p,0.001)
end

wait(0.5)
char.Torso.CFrame = char.Torso.CFrame * CFrame.new(0,5,0)

platform = function()
local a = Instance.new("Part", char)
a.Anchored = true
a.Size = Vector3.new(5,1,5)
a.TopSurface = "Smooth"
a.CFrame = char.Torso.CFrame * CFrame.new(0,-3.45,0)
a:Destroy()
end



game:service'RunService'.RenderStepped:connect(function()

makepart(char["Left Leg"])
makepart(char["Left Arm"])
makepart(char["Right Leg"])
makepart(char["Right Arm"])
makepart(char.Torso)
makepart(char.Head)
end)
