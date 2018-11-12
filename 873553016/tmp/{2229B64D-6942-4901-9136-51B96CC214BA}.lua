script["Neo Elemental Sword"].Parent = game.StarterPack
script["Neo Paintball Gun"].Parent = game.StarterPack
local d = game.StarterPack:GetChildren()
for i=1, #d  do 
	if d[i].Name == "weapons" then
		d[i]:Destroy()
	end
end	