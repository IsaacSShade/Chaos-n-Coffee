
repeat
	wait(1)
until game.Workspace:FindFirstChild("Greenify Parts") ~= nil 

part = game.Workspace:FindFirstChild("Greenify Parts"):FindFirstChild("NCollide Teleporter")
local debounce = false

part.Touched:Connect(function(hit)
	if hit.Parent:FindFirstChild("Humanoid") and debounce == false then
		debounce = true
		local plr = hit.Parent.Name
		local player = game.Players:FindFirstChild(plr)
		game.ReplicatedStorage:FindFirstChild("PuzzleOneComplete"):FireServer(player)
		print("Fired")
		wait(2)
		debounce = false
	end
end)

local function a()
	print("Cameraed")
	local camera = workspace.CurrentCamera
	local player = game.Players.LocalPlayer
	local Focus = Vector3.new(348.55, -0.5, -98)
	local Desiredpos = Vector3.new(348.55, 90, -98)

	camera.CameraType = "Scriptable"
	local plr = workspace:FindFirstChild(player.Name)
	game.ReplicatedStorage:FindFirstChild("Teleport"):FireServer(Vector3.new(829.7, 0.5, -3570.1), "puzzleonestart")
	camera.CFrame = CFrame.new(Desiredpos, Focus)
	camera.CFrame = camera.CFrame * CFrame.Angles(0, 0, math.rad(-90))
	game.ReplicatedStorage:FindFirstChild("Trees Left"):Clone().Parent = player:FindFirstChild("PlayerGui")
	game.ReplicatedStorage:FindFirstChild("Place Tree"):Clone().Parent = plr
	workspace:FindFirstChild("Tea Shack"):FindFirstChild("Roof").Parent = game.ReplicatedStorage
	
end

game.ReplicatedStorage:FindFirstChild("PuzzleOneComplete").OnClientEvent:Connect(a)
