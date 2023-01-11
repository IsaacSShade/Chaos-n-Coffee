local TeaGiver = script.Parent
local GreenTea = game.ServerStorage["Uncapped Green Tea"]

script.Parent.Touched:connect(function(hit)
	if hit.Parent:FindFirstChild("Humanoid") then
		local plr = workspace[hit.Parent.Name]
		local player = game.Players:GetPlayerFromCharacter(plr)
		local HotWater = plr:FindFirstChild("Cup with Hot Water")
		
		if plr:FindFirstChild("Cup with Hot Water") == nil then
		else
			HotWater:Destroy()
			local cup2 = GreenTea:Clone()
			cup2.Parent = player.Backpack
			plr.Humanoid:EquipTool(cup2.Parent:FindFirstChild("Uncapped Green Tea"))
		end
	end
end)

script.Parent:FindFirstChild("Prox Giver").Triggered:Connect(function(player)
	local plr = game.Workspace:FindFirstChild(player.Name)
	local Cup = plr:FindFirstChild("Cup with Hot Water")

	if plr:FindFirstChild("Cup with Hot Water") == nil then
		if player.Backpack:FindFirstChild("Cup with Hot Water") == nil then

		else
			repeat
				local Cup1 = player.Backpack:FindFirstChild("Cup with Hot Water")
				Cup1:Destroy()
				local cup2 = GreenTea:Clone()
				cup2.Parent = player.Backpack
			until player.Backpack:FindFirstChild("Cup with Hot Water") == nil
		end
	else
		Cup:Destroy()
		local cup2 = GreenTea:Clone()
		cup2.Parent = player.Backpack
		plr.Humanoid:EquipTool(cup2.Parent:FindFirstChild("Cup with Hot Water"))
	end
end)