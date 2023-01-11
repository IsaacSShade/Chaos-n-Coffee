script.Parent:FindFirstChild("Prox Giver").Triggered:Connect(function(player)
	if workspace:FindFirstChild("Hintify").BoolValue.Value == false then
		workspace:FindFirstChild("MagicButton").Button:FireClient(player)
		workspace:FindFirstChild("Hintify").BoolValue.Value = true
	end
end)