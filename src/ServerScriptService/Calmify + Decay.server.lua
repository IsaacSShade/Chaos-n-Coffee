
--Makes the calmify value +1 after drinking.
local function CalmifyIncrement(player, tool)
	local Calmify = player:FindFirstChild("Calmify")
	Calmify.Value = Calmify.Value + 1
	wait(0.7)
	tool:Destroy()
end

local function DecayIncrement(player, tool)
	local Decay = player:FindFirstChild("Decay")
	Decay.Value = Decay.Value + 1
	wait(0.7)
	tool:Destroy()
end

local function ReplaceHat(player)
	local Decay = player:FindFirstChild("Decay")
	if Decay.Value <= 2 then
		
		for i, v in pairs(player.Character:GetChildren()) do
			if v:IsA("Accessory") then
				v:Destroy()
			end
		end
	
		local old = game.ServerStorage:FindFirstChild("Old"):Clone()
		old.Parent = player.Character
	elseif Decay.Value == 3 then
		local Decayitem = game.ServerStorage:FindFirstChild("Decay")
		Decayitem:Clone().Parent = player.Backpack
		player.Character.Humanoid.WalkSpeed = 4
		player.Character.Humanoid.Health = 50
		wait(10)
		player.Character.Humanoid.WalkSpeed = 2
		player.Character.Humanoid.Health = 25
		wait(5)
		player.Character.Humanoid.Health = 0
	end
end

-- Makes the person they click on an old person
local function Antagonize(player, plr)
	local decay = plr:FindFirstChild("Decay")
	if decay.Value <= 2 then
		local tool2 = game.ServerStorage:FindFirstChild("Decay"):Clone()
		tool2.Parent = plr.Backpack
	end
	
	decay.Value = 2
	print(plr.Name, decay.Value)
	if 	plr.Character.Humanoid.WalkSpeed > 8 then
		plr.Character.Humanoid.WalkSpeed = 8
	end
	
	for i, v in pairs(plr.Character:GetChildren()) do
		if v:IsA("Accessory") then
			v:Destroy()
		end
	end
	local old = game.ServerStorage:FindFirstChild("Old"):Clone()
	old.Parent = plr.Character
	

end

--Destroys the tool after 2 seconds in case they don't use the decay tool
local function DestroyTool(player, tool)
	wait(2)
	tool:Destroy()
	
end




game.ReplicatedStorage.CalmifyEvent.OnServerEvent:Connect(CalmifyIncrement)
game.ReplicatedStorage.DecayEvent.OnServerEvent:Connect(DecayIncrement)
game.ReplicatedStorage.Decay.Decaywait.OnServerEvent:Connect(ReplaceHat)
game.ReplicatedStorage.Decay.Antagonize.OnServerEvent:Connect(Antagonize)
game.ReplicatedStorage.Decay.DestroyTool.OnServerEvent:Connect(DestroyTool)