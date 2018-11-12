local r = 255
local g = 0
local b = 0
local val = 40

while true do
while b < 255 do
game.Lighting.OutdoorAmbient = Color3.fromRGB(r,g,b)
b = b + val
wait()
end
while r > val do
game.Lighting.OutdoorAmbient = Color3.fromRGB(r,g,b)
r = r - val
wait()
end
while g < 255 do
game.Lighting.OutdoorAmbient = Color3.fromRGB(r,g,b)
g = g + val
wait()
end
while b > val do
game.Lighting.OutdoorAmbient = Color3.fromRGB(r,g,b)
b = b - val
wait()
end
while b > val do
game.Lighting.OutdoorAmbient = Color3.fromRGB(r,g,b)
b = b - val
wait()
end
while r < 255 do
game.Lighting.OutdoorAmbient = Color3.fromRGB(r,g,b)
r = r + val
wait()
end
while g > val do
game.Lighting.OutdoorAmbient = Color3.fromRGB(r,g,b)
g = g - val
wait()
end
end