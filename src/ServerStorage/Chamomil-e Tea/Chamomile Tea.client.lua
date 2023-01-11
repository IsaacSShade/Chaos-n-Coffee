wait()
local debounce = false

local Calmify = game.Players.LocalPlayer:FindFirstChild("Calmify")
local Decay = game.Players.LocalPlayer:FindFirstChild("Decay")
local plr = game.Players.LocalPlayer

function CalmifyChange()
	if Calmify.Value == 1 then
		plr.Character.Animate.walk.WalkAnim.AnimationId = "rbxassetid://6539765738"
		plr.Character.Animate.run.RunAnim.AnimationId = "rbxassetid://6539765738"
		plr.Character.Animate.idle.Animation1.AnimationId = "rbxassetid://6539761661"
		plr.Character.Animate.idle.Animation2.AnimationId = "rbxassetid://6539761661"
		-- Displays hints
		for i,v in pairs(game.ReplicatedStorage.Hints:GetChildren()) do
			local clone = v:Clone()
			clone.Parent = game.Workspace
		end
		--2nd puzzle stuff
		local hintify = game.Workspace:FindFirstChild("Hintify")
		if hintify.BoolValue.Value == false then
			hintify.Transparency = 0.3
			hintify.Material = "Neon"
			hintify.Color = Color3.fromRGB(255, 251, 152)
		end
		--1 cham = holy
		local holy = game.ReplicatedStorage.HolyBlocks
		holy.Parent = game.Workspace
		print(holy.Name)
		print(holy.Parent.Name)
		for i,v in pairs(holy:GetChildren()) do
			v.CanCollide = true
		end
		if Decay.Value >= 1 then
			--Cham + black = holy + shadow
			local shadow = game.ReplicatedStorage.ShadowBlocks
			shadow.Parent = game.Workspace
			for i,v in pairs(shadow:GetChildren()) do
				v.CanCollide = true
			end
		end
	elseif Calmify.Value == 2 then
		plr.Character.Animate.walk.WalkAnim.AnimationId = "rbxassetid://6539753027"
		plr.Character.Animate.run.RunAnim.AnimationId = "rbxassetid://6539753027"
		plr.Character.Animate.jump.JumpAnim.AnimationId = "rbxassetid://6539744257"
		plr.Character.Animate.idle.Animation1.AnimationId = "rbxassetid://6539753027"
		plr.Character.Animate.idle.Animation2.AnimationId = "rbxassetid://6539753027"
		plr.Character.Animate.fall.FallAnim.AnimationId = "rbxassetid://6539744257"
		--plr.Character.Animate.swim.Swim.AnimationId = "rbxassetid://6539744257"
		--plr.Character.Animate.swimidle.SwimIdle.AnimationId = "rbxassetid://6539744257"
		plr.Character.Animate.climb.ClimbAnim.AnimationId = "rbxassetid://6539744257"
		-- Removes hints
		for i,v in pairs(game.Workspace:GetDescendants()) do
			if v:IsA("Model") and string.match(v.Name, "Hint") then
				v:Destroy()
			end
			-- Turns thing that collide to not collide
			if v:IsA("BasePart") and v.Name ~= string.match(v.Name, "Baseplate") then
					v.CanCollide = false
			end
		end
		local hintify = game.Workspace:FindFirstChild("Hintify")
		if hintify.BoolValue.Value == false then
			hintify.Transparency = 0
			hintify.Material = "Concrete"
			hintify.Color = Color3.fromRGB(134, 80, 50)
		end
		--2nd Puzzle stuff
		if Decay.Value == 1 then
			--2 cham + black = holy + shadow
			for i,v in pairs(game.Workspace:FindFirstChild("HolyBlocks"):GetChildren()) do
				v.CanCollide = true
			end
			if game.ReplicatedStorage:FindFirstChild("ShadowBlocks") ~= nil then
				game.ReplicatedStorage:FindFirstChild("ShadowBlocks").Parent = game.Workspace
			end
			for i,v in pairs(game.Workspace:FindFirstChild('ShadowBlocks'):GetChildren()) do
				v.CanCollide = true
			end
		elseif Decay.Value == 2 then
			--2 cham + 2 black = untouchable shadow
			game.Workspace:FindFirstChild("HolyBlocks").Parent = game.ReplicatedStorage
			for i,v in pairs(game.Workspace:FindFirstChild('ShadowBlocks'):GetChildren()) do
				v.CanCollide = false
			end
		else
			game.Workspace:FindFirstChild("HolyBlocks").Parent = game.ReplicatedStorage
		end
	elseif Calmify.Value >= 3 then
		for i,v in pairs(game.Workspace:GetDescendants())do
			if v:IsA("BasePart") then
				v.CanCollide = false
			end
		end
		--2nd Puzzle Stuff
		if Decay.Value == 2 then
			for i,v in pairs(game.Workspace:FindFirstChild("ShadowBlocks"):GetChildren()) do 
				v.CanCollide = true
			end
		end
	else
		print("not 1")
	end
	
end
--When tool is used, add one to calmify and destroy the tool.
script.Parent.Equipped:Connect(function(Mouse)
	Mouse.Button1Down:Connect(function()
		if debounce == false then

			debounce = true
			local animation = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(script.Parent.Animation)
			animation:Play()

			wait(1.7)
			game.ReplicatedStorage.CalmifyEvent:FireServer(script.Parent)
			wait(0.7)
			CalmifyChange()
			debounce = false
		end
	end)

end)