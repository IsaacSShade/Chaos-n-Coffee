local button = script.Parent

button.MouseButton1Click:Connect(function()
	script.Parent.Parent.Visible = false
	script.Parent.Parent.Parent.Parent.ScrollingFrame.Visible = true
end)

