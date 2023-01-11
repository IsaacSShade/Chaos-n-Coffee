local player = script.Parent.Parent

local function Reset()
	
	--Makes things collideable again
	if player:FindFirstChild('Calmify').Value >= 2 then
		for i,v in pairs(game.Workspace:GetDescendants()) do
			if v.Name == "Hintify" and v:FindFirstChild("BoolValue").Value == true then
				
			elseif v:IsA("BasePart") and string.match(v.Name, "NCollide") ~= "NCollide" then
				v.CanCollide = true
			end
		end
		--2nd Puzzle Stuff
		if player:FindFirstChild("Decay").Value == 1 then
			local shadow = game.Workspace:FindFirstChild("ShadowBlocks")
			local holy = game.Workspace:FindFirstChild("HolyBlocks")
			holy.Parent = game.ReplicatedStorage
			shadow.Parent = game.ReplicatedStorage
		elseif player:FindFirstChild("Decay").Value == 2 then
			local shadow = game.Workspace:FindFirstChild("ShadowBlocks")
			shadow.Parent = game.ReplicatedStorage
		end
	--Destroys hints that were put into the client
	elseif player:FindFirstChild("Calmify").Value >= 1 then
		for i,v in pairs(game.Workspace:GetChildren()) do
			if v:IsA("Model") and string.match(v.Name, "Hint") then
				v:Destroy()
			end
		end
		--2nd puzzle stuff
		local hintify = game.Workspace:FindFirstChild("Hintify")
		if hintify.BoolValue.Value == false then
			hintify.Transparency = 0
			hintify.Material = "Concrete"
			hintify.Color = Color3.fromRGB(134, 80, 50)
		end
		
		local holy = game.Workspace:FindFirstChild("HolyBlocks")
		local shadow = game.Workspace:FindFirstChild("ShadowBlocks")
		if holy ~= nil then
			holy.Parent = game.ReplicatedStorage
		end
		if shadow ~= nil then
			shadow.Parent = game.ReplicatedStorage
		end
	end
	--Removes any Green Magic stuff 
	if player:FindFirstChild("Greenify").Value >= 2 and game.ReplicatedStorage:FindFirstChild("Greenify Values").Complete.Value == true then
		print("Here")
		game.Workspace:FindFirstChild("Greenify Parts").Parent = game.ReplicatedStorage
	end
end


game.ReplicatedStorage:FindFirstChild("ResetWorld").OnClientEvent:Connect(Reset)