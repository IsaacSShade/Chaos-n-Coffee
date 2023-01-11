local function Reveal()
	local hint = game.Workspace:FindFirstChild("Hintify")
	hint.Color = Color3.fromRGB(255, 251, 152)
	hint.Material = "Neon"
	hint.CanCollide = false
	for i = 1,33  do
		wait(0.02)
		hint.Transparency = hint.Transparency + 0.03
	end
end

game.Workspace:FindFirstChild("MagicButton").Button.OnClientEvent:Connect(Reveal)