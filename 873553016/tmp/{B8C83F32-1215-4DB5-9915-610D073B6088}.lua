char = game.Players.LocalPlayer.Character



local colors= {}

local target = Color3.fromRGB(148, 0, 211)
table.insert(colors, target)
local target2 = Color3.fromRGB(75, 0, 130)
table.insert(colors, target2)

local target3 = Color3.fromRGB(0, 0, 255)
table.insert(colors, target3)

local target4 = Color3.fromRGB(0, 255, 0)
table.insert(colors, target4)

local target5 = Color3.fromRGB(255, 255, 0)
table.insert(colors, target5)

local target6 = Color3.fromRGB(255, 127, 0)
table.insert(colors, target6)

local target7 = Color3.fromRGB(255, 0 , 0)
table.insert(colors, target7)

local set = target


spawn(function()
for i = 1,10000 do
for i,v in next, colors do
set = colors[i]
wait(0.6)
end
end
end)

char.Shirt:Destroy()
char.Pants:Destroy()
local d = char:GetChildren()
for i=1, #d  do 
	if d[i].className == ("Accessory") then 
		d[i].Handle.Color = Color3.fromRGB(255,255,255)
	end
	if d[i].className == ("Part") then 
		d[i].Color = Color3.fromRGB(255,255,255)
		d[i].Material = "SmoothPlastic"
		if d[i].Name ~= "Head" then
		local asd = Instance.new("BlockMesh", d[i])
		end
	end 
end


 while true do 
local d = char:GetChildren()
for i=1, #d  do 
	if d[i].className == ("Accessory") then 
		d[i].Handle.Color = d[i].Handle.Color:Lerp(set,0.01)
		d[i].Handle.Mesh.TextureId = ""
	end 
	if d[i].className == ("Part") then 
		d[i].Color = d[i].Color:Lerp(set,0.01)
	end 
end
wait() 
end