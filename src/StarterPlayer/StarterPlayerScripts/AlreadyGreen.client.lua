
game.ReplicatedStorage:WaitForChild("Greenify Values").Complete.Changed:Connect(function ()
	if game.Players.LocalPlayer:FindFirstChild("Greenify").Value >= 2 and game.ReplicatedStorage:FindFirstChild("Greenify Values").Complete.Value == true then
		game.ReplicatedStorage:FindFirstChild("Greenify Parts").Parent = game.Workspace
	end
	
end)


