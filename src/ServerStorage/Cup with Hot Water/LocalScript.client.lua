script.Parent.Equipped:Connect(function(Mouse)
	Mouse.Button1Down:Connect(function()
		
		local animation = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(script.Parent.Animation)
		
		animation:Play()

	end)

end)
