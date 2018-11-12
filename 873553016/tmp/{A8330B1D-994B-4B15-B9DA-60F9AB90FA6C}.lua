char = game.Players.LocalPlayer.Character


Clone = function()
	for _,v in pairs(char.Torso.Parent:children()) do
		if v.className == "Part" and v.Name ~= "HumanoidRootPart" then
			n = v:clone()
			n:BreakJoints()
			n.archivable = true
			n.Anchored = true
			n.CanCollide = false
			n.Name = "TRAILER"
			n.Parent = workspace
			n.CFrame = v.CFrame
			coroutine.resume(coroutine.create(function(ne)
		
		for i = 1, 80 do
			ne:BreakJoints()
			ne.Transparency = i / 80
			wait()
		end
		ne.Parent = nil
	end
), n)
		else
			if v.className == "Accessory" then
				n = v.Handle:clone()
				n:BreakJoints()
				n.archivable = true
				n.Anchored = true
				n.CanCollide = false
				n.Name = "TRAILER"
				n.Parent = workspace
				n.CFrame = v.Handle.CFrame
				coroutine.resume(coroutine.create(function(ne)
		
		for i = 1, 80 do
			ne:BreakJoints()
			ne.Transparency = i / 80
			wait()
		end
		ne.Parent = nil
	end
), n)
			end
		end
	end
end

while true do
Clone()
wait(1)
end