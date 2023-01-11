local achievements = game:GetService("DataStoreService"):GetDataStore("achievements")

game.Players.PlayerAdded:Connect(function(player)
	local data = Instance.new("Folder")
	data.Name = "Data"
	data.Parent = player
	
	local tutorial = Instance.new("BoolValue")
	tutorial.Name = "Tutorial"
	tutorial.Parent = data
	
	local PuzzleOne = Instance.new("BoolValue")
	PuzzleOne.Name = "PuzzleOne"
	PuzzleOne.Parent = data
	
	local Table = {"no", "no"}
	local success, errormessage = pcall(function()
		Table = achievements:GetAsync(player.UserId)
	end)
	
	if success then
		if Table ~= nil and Table[1] == "tut" then
			tutorial.Value = true
			print("Tutorial Carried Out")
		end
		if Table ~= nil and Table[2] == "one" then
			PuzzleOne.Value = true
			print("PuzzleOne Carried Out")
		end
	else
		warn(errormessage)
	end
end)

game.Players.PlayerRemoving:Connect(function(player)
	local data = player:FindFirstChild("Data")
	local Table = {}
	
	if data.Tutorial.Value == true then
		table.insert(Table, "tut")
		print("Tutorial Stored")
	else
		table.insert(Table, "no")
	end
	if data:FindFirstChild("PuzzleOne").Value == true then
		table.insert(Table, "one")
		print("PuzzleOne Stored")
	else
		table.insert(Table, "no")
	end

	local success, errormessage = pcall(function()
		achievements:SetAsync(player.UserId, Table)
	end)
	
	if success then
	else
		warn(errormessage)
	end
end)