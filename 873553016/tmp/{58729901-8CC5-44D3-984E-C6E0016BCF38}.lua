local Player = game.Players.LocalPlayer
local Character = Player.Character
local mouse = Player:GetMouse()
local attack = false

dolphin = function()
	local target = Character
		target.archivable = true
		c = target:Clone()
		c.Parent = workspace
		c.Name = "I"
		c.Torso.CFrame = c.Torso.CFrame * CFrame.new(0,0,0)
		c.Name = ""
		Character.Torso.CFrame = Character.Torso.CFrame * CFrame.new(0,0,50)
		local death = Instance.new("Explosion")
		death.BlastPressure = 500000
		death.BlastRadius = 20
		death.ExplosionType = "CratersAndDebris"
		death.Parent = c.Torso
		death.Position = c.Torso.Position
		wait(.2)
		workspace[""]:Destroy()
end

mouse.Button1Down:connect(function()
	
	if attack == false then
		attack = true
		dolphin()
		attack = false
	end
end
)

mouse.KeyDown:connect(function(k)
	
	k = k:lower()
	if attack == false and k == "q" then
		dolphin()
	end
end
)

while true do
if attack == false and Character.Humanoid.Health < Character.Humanoid.MaxHealth then
	Character.Humanoid.Health = Character.Humanoid.MaxHealth
	dolphin()
end
wait()
end