local WaterGiver = script.Parent
local HotWater = game.ServerStorage["Cup with Hot Water"]

script.Parent.Touched:connect(function(hit)
	if hit.Parent:FindFirstChild("Humanoid") then
		local plr = workspace[hit.Parent.Name]
		local player = game.Players:GetPlayerFromCharacter(plr)
		local Cup = plr:FindFirstChild("Cup")
		
		if plr:FindFirstChild("Cup") == nil then
		else
			Cup:Destroy()
			local cup2 = HotWater:Clone()
			cup2.Parent = player.Backpack
			plr.Humanoid:EquipTool(cup2.Parent:FindFirstChild("Cup with Hot Water"))
		end
	end
end)

script.Parent:FindFirstChild("Prox Giver").Triggered:Connect(function(player)
	local plr = game.Workspace:FindFirstChild(player.Name)
	local Cup = plr:FindFirstChild("Cup")

	if plr:FindFirstChild("Cup") == nil then
		if player.Backpack:FindFirstChild("Cup") == nil then
			
		else
			repeat
				local Cup1 = player.Backpack:FindFirstChild("Cup")
				Cup1:Destroy()
				local cup2 = HotWater:Clone()
				cup2.Parent = player.Backpack
			until player.Backpack:FindFirstChild("Cup") == nil
		end
	else
		Cup:Destroy()
		local cup2 = HotWater:Clone()
		cup2.Parent = player.Backpack
		plr.Humanoid:EquipTool(cup2.Parent:FindFirstChild("Cup with Hot Water"))
	end
end)