for i, v in pairs(game.Players:GetChildren()) do
	coroutine.resume(coroutine.create(function()
		local char = v.Character
		while true do
				char.Humanoid.BodyDepthScale.Value = char.Humanoid.BodyDepthScale.Value + 0.01
				char.Humanoid.BodyHeightScale.Value = char.Humanoid.BodyDepthScale.Value + 0.01
				char.Humanoid.BodyWidthScale.Value = char.Humanoid.BodyDepthScale.Value + 0.01
				char.Humanoid.HeadScale.Value = char.Humanoid.BodyDepthScale.Value + 0.01
				char.Humanoid.WalkSpeed = char.Humanoid.WalkSpeed + .16
				if char.Humanoid.BodyWidthScale.Value >= .95 then
					char.Humanoid.JumpPower = char.Humanoid.JumpPower + .25
				end
			wait()
		end
	end))
end