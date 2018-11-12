--Variables--
local Brick = script.Parent
--End--
local enabled = true
--Code--
if enabled == true then
enabled = false
local function PlayerTouched(Part)
	local Parent = Part.Parent
	if game.Players:GetPlayerFromCharacter(Parent) then
		Parent.Humanoid.Health = Parent.Humanoid.Health - 10
	end
end
wait(0.2)
enabled = true
end

Brick.Touched:connect(PlayerTouched)