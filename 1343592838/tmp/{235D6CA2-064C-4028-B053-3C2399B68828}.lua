local cookies = 0
local additive = 1

showdam = function(num,par,col)
	local num2 = 0
	local billp = Instance.new("Part", workspace)
	billp.Anchored = true
	billp.Transparency = 1
	billp.Size = Vector3.new(1,1,1)
	billp.CanCollide = false
	billp.Position = par.Position + Vector3.new(math.random(-2,2),2,math.random(-2,2))
	local bill = Instance.new("BillboardGui", billp)
	bill.Size = UDim2.new(3,0,3,0)
	bill.Adornee = billp
	local number = Instance.new("TextLabel", bill)
	number.BackgroundTransparency = 1
	number.TextColor3 = Color3.fromRGB(0,0,0)
	number.TextStrokeColor3 = col
	number.TextScaled = true
	number.Text = ""..num..""
	number.TextStrokeTransparency = 0
	number.Size = UDim2.new(1,0,1,0)
	coroutine.resume(coroutine.create(function()
	while num2 < 1 do
	number.TextTransparency = num2
	number.TextStrokeTransparency = num2
	num2 = num2 + 0.05
	billp.CFrame = billp.CFrame * CFrame.new(0,0.05,0)
	wait()
	end
	billp:Destroy()
	end))
end

local mod = Instance.new("Model", workspace.Base)
local hum = Instance.new("Humanoid", mod)
local cki = Instance.new("Part", mod)
cki.Anchored = true
cki.Name = "Head"
cki.Size = Vector3.new(1,10,10)
cki.CFrame = CFrame.new(50,.5,50) * CFrame.Angles(math.rad(90),math.rad(90),0)
local ckim = Instance.new("SpecialMesh",cki)
ckim.MeshType = "FileMesh"
ckim.Scale = Vector3.new(4,4,4)
ckim.MeshId = "http://www.roblox.com/asset/?id=20939848"
ckim.TextureId = "http://www.roblox.com/asset/?id=21456464"
local clickdec = Instance.new("ClickDetector", cki)
local cookiedeb = false
coroutine.resume(coroutine.create(function()
while true do
	mod.Name = "cookies : "..cookies..""
	wait(.1)
end
end))
clickdec.MouseClick:connect(function()
if cookiedeb == false then
	cookiedeb = true
	ckim.Scale = ckim.Scale / Vector3.new(1.1,1.1,1.1)
	cookies = cookies + additive
	showdam(additive, cki, Color3.fromRGB(199, 172, 120))
	wait(.1)
	mod.Name = "cookies : "..cookies..""
	cookiedeb = false
	ckim.Scale = ckim.Scale * Vector3.new(1.1,1.1,1.1)
end
end)

local selx = 0
local selz = 0
local selcost = 10
local selm = Instance.new("Model", workspace.Base)
local hum = Instance.new("Humanoid", selm)
local selbuy = Instance.new("Part", selm)
selbuy.Anchored = true
selbuy.Color = Color3.new(1,1,1)
selbuy.Material = "Neon"
selbuy.CFrame = CFrame.new(75,.5,50)
local seldec = Instance.new("ClickDetector", cki)
local seldeb = false

seldec.MouseClick:connect(function()
if seldeb == false and cookies >= selcost then
	seldeb = true
	cookies = cookies - 10
	cookies = cookies + additive
	showdam(additive, cki, Color3.fromRGB(199, 172, 120))
	wait(.1)
	mod.Name = "cookies : "..cookies..""
	seldeb = false
	ckim.Scale = ckim.Scale * Vector3.new(1.1,1.1,1.1)
end
end)