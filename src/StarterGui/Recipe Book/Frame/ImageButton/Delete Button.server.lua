local button = script.Parent
local guis = script.Parent.Parent.Parent.Parent

button.MouseButton1Click:Connect(function()
	guis:FindFirstChild("RecipeButton").TextButton.Visible = true
	guis:FindFirstChild("TutorialButton").TextButton.Visible = true
	button.Parent.Visible = false
end)