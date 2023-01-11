wait()
local debounce = false


local Calmify = game.Players.LocalPlayer:FindFirstChild("Calmify")
local Decay = game.Players.LocalPlayer:FindFirstChild("Decay")
local plr = game.Players.LocalPlayer
local function BlackTeaChange()
	
	if Calmify.Value == 1 and Decay.Value == 1 then
		--cham + black = untouchable holy and shadow
		for i,v in pairs(workspace:FindFirstChild("HolyBlocks"):GetChildren()) do
			v.CanCollide = false
		end
		local shadow = game.ReplicatedStorage:FindFirstChild("ShadowBlocks")
		shadow.Parent = game.Workspace
		for i,v in pairs(shadow:GetChildren()) do
			v.CanCollide = true
		end
	elseif Calmify.Value == 2 and Decay.Value == 1 then
		--2 cham + 1 black = holy and shadow
		game.ReplicatedStorage.HolyBlocks.Parent = game.Workspace
		for i,v in pairs(workspace:FindFirstChild("HolyBlocks"):GetChildren()) do
			v.CanCollide = true
		end
		game.ReplicatedStorage:FindFirstChild("ShadowBlocks").Parent = game.Workspace
		for i,v in pairs(game.Workspace:FindFirstChild("ShadowBlocks"):GetChildren()) do
			v.CanCollide = true
		end
	elseif Calmify.Value == 2 and Decay.Value == 2 then
		--2 cham + 2 black = untouchable shadow
		game.Workspace:FindFirstChild("HolyBlocks").Parent = game.ReplicatedStorage
		for i,v in pairs(workspace:FindFirstChild("ShadowBlocks"):GetChildren()) do
			v.CanCollide = false
		end
	end
	if Decay.Value == 1 and plr.Character.Humanoid.WalkSpeed > 11.2 then
		plr.Character.Humanoid.WalkSpeed = 11.2
	elseif Decay.Value == 2 and plr.Character.Humanoid.WalkSpeed > 8 then
		plr.Character.Humanoid.WalkSpeed = 8
		
		game.ReplicatedStorage.Decay.Decaywait:FireServer(plr)
		
	elseif Decay.Value >= 3 then
		game.ReplicatedStorage.Decay.Decaywait:FireServer(plr)
		
	end
end
--When tool is used, add one to decay and destroy the tool.
script.Parent.Equipped:Connect(function(Mouse)
	Mouse.Button1Down:Connect(function()
		if debounce == false then

			debounce = true
			local animation = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(script.Parent.Animation)
			animation:Play()

			wait(1.7)
			game.ReplicatedStorage.DecayEvent:FireServer(script.Parent)
			wait(0.7)
			BlackTeaChange()
			debounce = false
		end
	end)

end)