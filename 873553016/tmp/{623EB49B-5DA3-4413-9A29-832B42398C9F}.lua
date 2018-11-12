local Player = game.Players.LocalPlayer
local Character = Player.Character
local mouse = Player:GetMouse()

wait(1)



Character.Shirt:Destroy()
Character.Pants:Destroy()


Character.Torso.BrickColor = BrickColor.new("Pink")
Character.Head.BrickColor = BrickColor.new("Pink")
Character["Right Arm"].BrickColor = BrickColor.new("Pink")
Character["Right Leg"].BrickColor = BrickColor.new("Pink")
Character["Left Arm"].BrickColor = BrickColor.new("Pink")
Character["Left Leg"].BrickColor = BrickColor.new("Pink")

kwapooy = function(pos)
	local multiplier = 0.95
	local memes = Instance.new("Part")
	memes.Parent = Character
	memes.Size = Vector3.new(15,15,15)
	memes.CFrame = Character.Torso.CFrame
	memes.Anchored = true
	memes.Material = "Neon"
	memes.BrickColor = BrickColor.new("Pink")
	memes.Transparency = 0.6
	local memes2 = Instance.new("Part")
	memes2.Parent = Character
	memes2.Size = Vector3.new(10,10,10)
	memes2.CFrame = Character.Torso.CFrame
	memes2.Anchored = true
	memes2.Material = "Neon"
	memes2.BrickColor = BrickColor.new("Pink")
	local refpart = Instance.new("Part")
	refpart.CFrame = Character.Torso.CFrame
	refpart.Transparency = 1
	refpart.Anchored = true
	refpart.CanCollide = false
	Character.Torso.CFrame = CFrame.new(Vector3.new(pos.x, pos.y + 7, pos.z))
	while memes.Size.Y > 0.15 do
		wait()		
		memes.Size = memes.Size * Vector3.new(multiplier,multiplier,multiplier)
		memes2.Size = memes2.Size * Vector3.new(multiplier,multiplier,multiplier) 
		memes.CFrame = refpart.CFrame
		memes2.CFrame = refpart.CFrame
	end
	local lolrip = Instance.new("Explosion")
	lolrip.BlastPressure = 500000
	lolrip.BlastRadius = 15
	lolrip.Parent = memes2
	lolrip.Position = memes2.Position
	wait(1)
	memes:Destroy()
	memes2:Destroy()
end

mouse.Button1Down:connect(function()
	local cf = mouse.Hit
	kwapooy(cf.p)
end
)