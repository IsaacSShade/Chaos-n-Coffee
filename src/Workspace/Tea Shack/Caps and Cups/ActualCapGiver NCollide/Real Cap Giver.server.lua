local CapGiver = script.Parent
local GreenTea = game.ServerStorage["Green Tea"]
local ChamomileTea = game.ServerStorage["Chamomil-e Tea"]
local BlackTea = game.ServerStorage["Black Tea"]
local prox = script.Parent:FindFirstChild("Prox Giver")

script.Parent.Touched:connect(function(hit)
	if hit.Parent:FindFirstChild("Humanoid") then
		local plr = workspace[hit.Parent.Name]
		local player = game.Players:GetPlayerFromCharacter(plr)
		local UGT = plr:FindFirstChild("Uncapped Green Tea")
		local UCT = plr:FindFirstChild("Uncapped Chamomil-e Tea")
		local UBT = plr:FindFirstChild("Uncapped Black Tea")

		--If it's not uncapped green tea then skip over this, if it is replace it with finished Green Tea
		if UGT == nil then
		else
			UGT:Destroy()
			local cup2 = GreenTea:Clone()
			cup2.Parent = player.Backpack
			plr.Humanoid:EquipTool(cup2)
		end

		--If it's not uncapped chamomile tea then skip over this, if it is replace it with finished Chamomile Tea
		if UCT == nil then
		else
			UCT:Destroy()
			local cup3 = ChamomileTea:Clone()
			cup3.Parent = player.Backpack
			plr.Humanoid:EquipTool(cup3)
		end
		
		if UBT == nil then
		else
			UBT:Destroy()
			local cup4 = BlackTea:Clone()
			cup4.Parent = player.Backpack
			plr.Humanoid:EquipTool(cup4)
		end
		
		
	end
end)

prox.Triggered:Connect(function(player)
	local plr = game.Workspace:FindFirstChild(player.Name)
	
	if plr:FindFirstChild("Uncapped Green Tea") == nil and plr:FindFirstChild("Uncapped Chamomil-e Tea") == nil and plr:FindFirstChild("Uncapped Black Tea") == nil then
		
		if player.Backpack:FindFirstChild("Uncapped Green Tea") == nil and player.Backpack:FindFirstChild("Uncapped Chamomil-e Tea") == nil and player.Backpack:FindFirstChild("Uncapped Black Tea") == nil then

		else
			repeat
				local UGT = player.Backpack:FindFirstChild("Uncapped Green Tea")
				local UCT = player.Backpack:FindFirstChild("Uncapped Chamomil-e Tea")
				local UBT = player.Backpack:FindFirstChild("Uncapped Black Tea")
				
				if UGT ~= nil then
					UGT:Destroy()
					local cup2 = GreenTea:Clone()
					cup2.Parent = player.Backpack
				elseif UCT ~= nil then
					UCT:Destroy()
					local cup3 = ChamomileTea:Clone()
					cup3.Parent = player.Backpack
				elseif UBT ~= nil then
					UBT:Destroy()
					local cup4 = BlackTea:Clone()
					cup4.Parent = player.Backpack
				end
			until player.Backpack:FindFirstChild("Uncapped Green Tea") == nil and player.Backpack:FindFirstChild("Uncapped Chamomil-e Tea") == nil and player.Backpack:FindFirstChild("Uncapped Black Tea") == nil
		end
	else
		local UGT = plr:FindFirstChild("Uncapped Green Tea")
		local UCT = plr:FindFirstChild("Uncapped Chamomil-e Tea")
		local UBT = plr:FindFirstChild("Uncapped Black Tea")
		
		if UGT ~= nil then
			UGT:Destroy()
			local cup2 = GreenTea:Clone()
			cup2.Parent = player.Backpack
			plr.Humanoid:EquipTool(cup2)
		elseif UCT ~= nil then
			UCT:Destroy()
			local cup3 = ChamomileTea:Clone()
			cup3.Parent = player.Backpack
			plr.Humanoid:EquipTool(cup3)
		elseif UBT ~= nil then
			UBT:Destroy()
			local cup4 = BlackTea:Clone()
			cup4.Parent = player.Backpack
			plr.Humanoid:EquipTool(cup4)
		end
	end
end)
