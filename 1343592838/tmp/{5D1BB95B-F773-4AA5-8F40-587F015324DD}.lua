char = game.Players.LocalPlayer.Character
local num = 0


spawn = function(weld)
num = num + 1
local part = Instance.new("Part", char)
part.Size = Vector3.new(1,1,1)
part.BrickColor = BrickColor.new("Dusty Rose")
part.Name = num
part.CFrame = char.Torso.CFrame
local at1 = Instance.new("Attachment", part)
local at2 = Instance.new("Attachment", char.Torso)
if num > 1 then
at2.Parent = char[""..(num-1)..""]
end
local spring = Instance.new("SpringConstraint", part)
spring.Attachment0 = at1
spring.Attachment1 = at2
spring.Stiffness = 20
spring.Visible = true
print(at1)
print(at2)
print(spring.Attachment0)
print(spring.Attachment1)
end

for i = 0,49 do
spawn()
end