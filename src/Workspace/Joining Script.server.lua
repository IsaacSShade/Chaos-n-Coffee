local run = game.ReplicatedStorage:FindFirstChild("Run")
local gate = game.ReplicatedStorage:FindFirstChild("Gate Remover")
local puzzleone = game.ReplicatedStorage:FindFirstChild("Complete1stPuzzle")
--Just adding the counter when a player joins
game:GetService('Players').PlayerAdded:connect(function(player)
	local Dying = Instance.new("BoolValue", player)
	Dying.Name = "Dying"
	Dying.Value = false
	
	local Greenify = Instance.new("NumberValue", player)
	Greenify.Name = "Greenify"
	Greenify.Value = 0
	
	local Calmify = Instance.new("NumberValue", player)
	Calmify.Name = "Calmify"
	Calmify.Value = 0
	
	local Decay = Instance.new("NumberValue", player)
	Decay.Name = "Decay"
	Decay.Value = 0
	
	
end)

--Puts starting GUI in player
game:GetService('Players').PlayerAdded:connect(function(player)
	wait(0.5)
	if game.Players:FindFirstChild(player.Name):FindFirstChild("Data").Tutorial.Value == false then
		local info = game.ReplicatedStorage:FindFirstChild("Tutorial")
		player:WaitForChild("PlayerGui")
		info:Clone().Parent = player:FindFirstChild("PlayerGui")
	end
	
	if player.Name == "IsaacShadowShade1" or player.Name == "Inariono" or player.Name == "NontrivialZero" or player.Name == "Player1" or player.Name == "InvestedWheat40" then
		run:Clone().Parent = player:FindFirstChild("PlayerGui")
		gate:Clone().Parent = player:FindFirstChild("PlayerGui")
		puzzleone:Clone().Parent = player:FindFirstChild("PlayerGui")
	end
end)

--Resets all values after death
game:GetService('Players').PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function(character)
		character.Humanoid.Died:Connect(function()
			
			game.ReplicatedStorage:FindFirstChild("ResetWorld"):FireClient(player)	
			wait(1)
			player:FindFirstChild('Greenify').Value = 0
			player:FindFirstChild('Calmify').Value = 0
			player:FindFirstChild('Decay').Value = 0
			if player.Name == "IsaacShadowShade1" or player.Name == "Inariono" or player.Name == "NontrivialZero" or player.Name == "Player1" or player.Name == "InvestedWheat40" then
				wait(5)
				run:Clone().Parent = player:FindFirstChild("PlayerGui")
				gate:Clone().Parent = player:FindFirstChild("PlayerGui")
				puzzleone:Clone().Parent = player:FindFirstChild("PlayerGui")
			end
		end)	
	end)
end)