local r = 255
local g = 0
local b = 0

while true do
while b < 255 do
game.Lighting.OutdoorAmbient = Color3.fromRGB(r,g,b)
b = b + 5
wait()
end
while r > 0 do
game.Lighting.OutdoorAmbient = Color3.fromRGB(r,g,b)
r = r - 5
wait()
end
while g < 255 do
game.Lighting.OutdoorAmbient = Color3.fromRGB(r,g,b)
g = g + 5
wait()
end
while b > 5 do
game.Lighting.OutdoorAmbient = Color3.fromRGB(r,g,b)
b = b - 5
wait()
end
while b > 5 do
game.Lighting.OutdoorAmbient = Color3.fromRGB(r,g,b)
b = b - 5
wait()
end
while r < 255 do
game.Lighting.OutdoorAmbient = Color3.fromRGB(r,g,b)
r = r + 5
wait()
end
while g > 0 do
game.Lighting.OutdoorAmbient = Color3.fromRGB(r,g,b)
g = g - 5
wait()
end
end