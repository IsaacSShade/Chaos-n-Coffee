wait()
local debounce = false

local Greenify = game.Players.LocalPlayer:FindFirstChild("Greenify")
local plr = game.Players.LocalPlayer
local chr = plr.Character

--Changes the player's colors to varying shades of green, at the end it kills them
local ChangeColors = game.ReplicatedStorage:FindFirstChild("ChangeColor")
local debounce1 = false
local function GreenifyChange()
	if Greenify.Value == 2 then
		--Change colors and reveal the end of the puzzle if complete
		ChangeColors:FireServer(210, 254, 205)
		if game.ReplicatedStorage:FindFirstChild("Greenify Values").Complete.Value == true and game.ReplicatedStorage:FindFirstChild("Greenify Parts") ~= nil then
			game.ReplicatedStorage:FindFirstChild("Greenify Parts").Parent = game.Workspace
		end
	elseif Greenify.Value == 3 then
		--Change colors
		ChangeColors:FireServer(166, 232, 144)
	elseif Greenify.Value >= 4 and debounce1 == false then
		debounce1 = true
			--Change colors and make the player unable to move
		ChangeColors:FireServer(118, 168, 124)
		chr.Humanoid.WalkSpeed = 0
		chr.Humanoid.JumpPower = 0 --Going to play an animation here too later 
		
		game.ReplicatedStorage:FindFirstChild("TreeDeath"):FireServer(plr)

		debounce1 = false
	end
end

local Drank = 0

--When the drink is clicked it will destroy itself after being drank. Can be modified so you drink it multiple times.
script.Parent.Equipped:Connect(function(Mouse)
	Mouse.Button1Down:Connect(function()
		if debounce == false then
			debounce = true
			local animation = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(script.Parent.Animation)
			animation:Play()
			wait(1.7)
			game.ReplicatedStorage:FindFirstChild("GreenifyEvent"):FireServer(script.Parent)
			wait(0.7)
			GreenifyChange()
			debounce = false
		end
	end)
end)


