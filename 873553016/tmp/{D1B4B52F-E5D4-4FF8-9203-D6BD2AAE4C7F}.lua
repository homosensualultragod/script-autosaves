


local changed = false
local mat = "Wood"
local type = "wall"
local tim = 0
local col = BrickColor.new("Reddish brown")

heart = Instance.new("BindableEvent", game.Players.LocalPlayer.PlayerGui)
	heart.Name = "Heartbeat"
	game.Players.LocalPlayer.PlayerGui:WaitForChild("Heartbeat")
	frame = 0.033333333333333
	TickFrame = 0
	allowframeloss = false
	lastframe = tick()
	game.Players.LocalPlayer.PlayerGui.Heartbeat:Fire()
	local gg = false
	game:GetService("RunService").Heartbeat:connect(function(s, p)
	
	if game.Players.LocalPlayer.PlayerGui:FindFirstChild("Heartbeat") == nil then
		gg = true
	end
	if gg == true then
		return 
	end
	TickFrame = TickFrame + s
	if frame <= TickFrame then
		if allowframeloss then
			game.Players.LocalPlayer.PlayerGui.Heartbeat:Fire()
			lastframe = tick()
		else
			for i = 1, math.floor(TickFrame / frame) do
				game.Players.LocalPlayer.PlayerGui.Heartbeat:Fire()
			end
			lastframe = tick()
		end
			TickFrame = TickFrame - frame * math.floor(TickFrame / frame)
	end
end
)
	swait = function(num)
	
	if num == 0 or num == nil then
		heart.Event:wait()
	else
		for i = 0, num do
			heart.Event:wait()
		end
	end
end

local memme = false


game.Players.LocalPlayer:GetMouse().Button1Down:connect(function()
			memme = true
end
)

game.Players.LocalPlayer:GetMouse().Button1Up:connect(function()
			memme = false
end
)

game.Players.LocalPlayer:GetMouse().KeyDown:connect(function(k)
	
	k = k:lower()
	
	if k == "q" then
	local d = workspace:GetChildren()
	for i=1, #d  do 
	if d[i].Name:sub(1,13) == "asdadasdasdas" then
		d[i]:Destroy()
	end 
	end
	else
		if k == "e" then
			local d = workspace:GetChildren()
			for i=1, #d  do 
				if d[i].Name:sub(1,13) == "asdadasdasdas" then
				d[i].Anchored = false
				end
			end
		else
			if k == "r" then
				local d = workspace:GetChildren()
				for i=1, #d  do 
				if d[i].Name== "asdadasdasdas"..tim.."" then
				d[i]:Destroy()
				tim = tim - 1
				end
				end
			else
				if k == "z" then
					type = "wall"
				else
					if k == "x" then
						type = "floor"
					else
						if k == "c" then
							type = "ceil"
						else
							if k == "v" then
								if mat == "Brick" and changed == false then
									mat = "Wood"
									col = BrickColor.new("Reddish brown")
									changed = true
								end
								if mat == "Slate" and changed == false then
									mat = "Brick"
									col = BrickColor.new("Reddish browngdfg")
									changed = true
								end
								if mat == "Wood" and changed == false then
									mat = "Slate"
									col = BrickColor.new("Dark stone grey")
									changed = true
								end
								changed = false
							end
						end
					end
				end
			end
		end
	end
	end

)
while true do
if memme == true then
local p = Instance.new("Part", workspace)
local mos = game.Players.LocalPlayer:GetMouse().Hit.p
local asd = Vector3.new(mos.X/2,0,mos.Z/2)
local asd1 = math.floor(asd.X)
local asd3 = math.floor(asd.Z)
if type == "wall" then
p.Size = Vector3.new(4,15,4)
p.CFrame = CFrame.new(asd1*4,8,asd3*4)
p.Material = mat
p.BrickColor = col
end
if type == "ceil" then
p.Size = Vector3.new(4,1,4)
p.CFrame = CFrame.new(asd1*4,15,asd3*4)
p.Material = mat
p.BrickColor = col
end
if type == "floor" then
p.Size = Vector3.new(2,1,2)
p.CFrame = CFrame.new(asd1*2,2.1,asd3*2)
p.Material = "Fabric"
p.BrickColor = game.Players.LocalPlayer.Character.Torso.BrickColor
end
print(""..asd1.."")
p.Anchored = true
tim = tim + 1
p.Name = "asdadasdasdas"..tim..""
p.CanCollide = true
p.TopSurface = "Smooth"
p.BottomSurface = "Smooth"
--[[coroutine.resume(coroutine.create(function()
wait(1)
p.Anchored = false
end))]]
end
wait()
end

while true do
local mos = game.Players.LocalPlayer:GetMouse().Hit.p
local s = Instance.new("Part", workspace)
local asd = Vector3.new(mos.X/4,0,mos.Z/4)
local asd1 = math.floor(asd.X)
local asd3 = math.floor(asd.Z)
s.Size = Vector3.new(4,1.1,4)
s.CFrame = CFrame.new(asd1*4,2,asd3*4)
print(""..asd1.."")
s.Anchored = true
s.Name = "asdadasdasdas"
s.Material = "Neon"
s.BrickColor = BrickColor.new("Bright green")
s.CanCollide = false
s.Transparency = 0.5
s.TopSurface = "Smooth"
s.BottomSurface = "Smooth"
game:GetService("Debris"):AddItem(s, 0.2)
swait()
end

--https://discord.gg/pxv5br










