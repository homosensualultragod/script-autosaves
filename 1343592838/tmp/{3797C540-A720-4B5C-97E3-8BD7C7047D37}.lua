script.Parent = workspace.Base
local d = game.Players:GetChildren()
for i=1, #d  do 
coroutine.resume(coroutine.create(function()
local p = Instance.new("Part",workspace)
p.Transparency = 1
p.Size = Vector3.new(1020,5,1020)
p.Anchored = true
while true do
p.CFrame = CFrame.new(d[i].Character.Torso.CFrame.X,-.5,d[i].Character.Torso.CFrame.Z)
d[i].Character.Humanoid.WalkSpeed = 16
d[i].Character.Humanoid.JumpPower = 50
wait()
end
end))
end

wait(5)

while true do
local m = Instance.new("BlockMesh",workspace.Base)
m.Scale = Vector3.new(3,1,3)
 
local wav = Instance.new("Part", workspace.CodeLad)
wav.Size = Vector3.new(2048,1,40)
wav.Anchored = true
wav.CFrame = workspace.Base.CFrame * CFrame.fromEulerAnglesXYZ(0,math.rad(math.random(-360,360)),0) * CFrame.new(0,0,2048)
wav.BrickColor = BrickColor.new("Dark green")
wav.Material = "Grass"
local wav2 = Instance.new("Part", workspace.CodeLad)
wav2.Size = Vector3.new(2048,1,40)
wav2.Anchored = true
wav2.CFrame = wav.CFrame * CFrame.new(2048,0,0)
wav2.BrickColor = BrickColor.new("Dark green")
wav2.Material = "Grass"
local wav3 = Instance.new("Part", workspace.CodeLad)
wav3.Size = Vector3.new(2048,1,40)
wav3.Anchored = true
wav3.CFrame = wav.CFrame * CFrame.new(-2048,0,0)
wav3.BrickColor = BrickColor.new("Dark green")
wav3.Material = "Grass"

local k = Instance.new("Sound", workspace)
k.SoundId = "rbxassetid://232857483"
k.Playing = true
k.Looped = true
k.Volume = 1
k.Pitch = 1

local con = wav.Touched:connect(function(hit)
hit:Destroy()
end)

local con = wav2.Touched:connect(function(hit)
hit:Destroy()
end)

local con = wav3.Touched:connect(function(hit)
hit:Destroy()
end)


while wav.Size.Y < 2048 do
wav.CFrame = wav.CFrame * CFrame.new(0,0,-6)
wav.Size = wav.Size + Vector3.new(0,4,0)
wav2.Size = wav.Size
wav2.CFrame = wav2.CFrame * CFrame.new(0,0,-6)
wav3.Size = wav.Size
wav3.CFrame = wav3.CFrame * CFrame.new(0,0,-6)
wait()
end
m:Destroy()
wav:Destroy()
wav2:Destroy()
wav3:Destroy()
k:Destroy()
end