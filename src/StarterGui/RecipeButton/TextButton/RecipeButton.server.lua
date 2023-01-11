local button = script.Parent

button.MouseButton1Click:Connect(function()
	local player = script.Parent.Parent.Parent.Parent
	local Book = script.Parent.Parent.Parent:FindFirstChild("Recipe Book"):FindFirstChild("Frame")
	Book.Visible = true
	script.Parent.Visible = false
	player.PlayerGui:FindFirstChild("TutorialButton").TextButton.Visible = false
	
	if player.Data.PuzzleOne.Value == true then
		Book.Info.GreenTea.Steps.Text = [[- 2+ turns you Green and let's you see certain things
- 4 turns you into a tree
- 4 and a chamomile tea turns you into a cherry tree
- 4 and a black tea turns you into a dead tree]]
	end
end)