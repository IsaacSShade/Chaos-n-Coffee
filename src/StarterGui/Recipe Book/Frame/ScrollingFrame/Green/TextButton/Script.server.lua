local button = script.Parent

button.MouseButton1Click:Connect(function()
	if script.Parent.AutoButtonColor == true then
		script.Parent.Parent.Parent.Visible = false
		script.Parent.Parent.Parent.Parent.Info.GreenTea.Visible = true
	end
end)


