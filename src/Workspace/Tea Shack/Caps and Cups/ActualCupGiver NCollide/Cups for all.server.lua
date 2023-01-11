local CupGiver = script.Parent
local Cup = game.ServerStorage["Cup"]
local prox = script.Parent:FindFirstChild("Prox Giver")
script.Parent.ClickDetector.MaxActivationDistance = 3
debounce = false

script.Parent.ClickDetector.MouseClick:connect(function(player)
	if debounce == false then
		debounce = true
		local cup2 = Cup:Clone()
		cup2.Parent = player.Backpack
		wait(0.5)
		debounce = false
		end
end)

prox.Triggered:Connect(function(player)
	if debounce == false then
		debounce = true
		local cup2 = Cup:Clone()
		cup2.Parent = player.Backpack
		wait(0.5)
		debounce = false
	end
end)