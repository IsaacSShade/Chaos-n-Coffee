
local function Teleport(player, position, condition)
	
	if condition == "puzzleonestart" then
		game.Workspace:FindFirstChild(player.Name).HumanoidRootPart.Position = position
		game.Workspace:FindFirstChild(player.Name).HumanoidRootPart.Anchored = true
	elseif condition == "puzzleoneend" then
		game.Workspace:FindFirstChild(player.Name).HumanoidRootPart.Position = position
		game.Workspace:FindFirstChild(player.Name).HumanoidRootPart.Anchored = false
		local PuzzleOne = game.Players:FindFirstChild(player.Name):FindFirstChild("Data"):FindFirstChild("PuzzleOne")
		PuzzleOne.Value = true
		print(PuzzleOne.Value)
	end

	
end


game.ReplicatedStorage.Teleport.OnServerEvent:Connect(Teleport)
