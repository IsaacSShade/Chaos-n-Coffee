function fire(player)
	game.ReplicatedStorage.PuzzleOneComplete:FireClient(player)
	game.ReplicatedStorage.ResetWorld:FireClient(player)
end

game.ReplicatedStorage.PuzzleOneComplete.OnServerEvent:Connect(fire)

--script is literally here to pass back and forth a client thing it's stupid but works