local button = script.Parent

button.MouseButton1Click:Connect(function()
	local player = script.Parent.Parent.Parent.Parent
	if player.PlayerGui:FindFirstChild("Tutorial") == nil then
		local tut = game.ReplicatedStorage:FindFirstChild("Tutorial"):Clone()
		tut.Parent = player.PlayerGui
	end
end)

