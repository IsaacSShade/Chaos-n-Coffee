--Increases Greenify Value for player
local function GreenifyIncrement(player,tool)

	local Greenify = player:FindFirstChild("Greenify")
	Greenify.Value = Greenify.Value + 1
	wait(0.7)
	tool:Destroy()
end

--Resets every value a player has, presumably after they die.
local function Reset(player)
	if game.Workspace:FindFirstChild(player.Name):FindFirstChild("Humanoid") ~= nil then
		local hum = game.Players:GetHumanoidDescriptionFromUserId(player.UserId)
		game.Workspace:FindFirstChild(player.Name):FindFirstChild("Humanoid"):ApplyDescription(hum)
	end
	local Greenify = player:FindFirstChild("Greenify")
	Greenify.Value = 0
	local Calmify = player:FindFirstChild("Calmify")
	Calmify.Value = 0
	local Decay = player:FindFirstChild("Decay")
	Decay.Value = 0
	print(Greenify.Value, Calmify.Value, player)
end

--Changes skin color of the player based on the values it is given.
local function Colors(player, Color_1, Color_2, Color_3) 
	local character = player.character
	if not character then return end
	local bodyColors = character["Body Colors"]
	bodyColors.HeadColor3 = Color3.fromRGB(Color_1, Color_2, Color_3)
	bodyColors.LeftArmColor3 = Color3.fromRGB(Color_1, Color_2, Color_3)
	bodyColors.LeftLegColor3 = Color3.fromRGB(Color_1, Color_2, Color_3)
	bodyColors.RightArmColor3 = Color3.fromRGB(Color_1, Color_2, Color_3)
	bodyColors.RightLegColor3 = Color3.fromRGB(Color_1, Color_2, Color_3)
	bodyColors.TorsoColor3 = Color3.fromRGB(Color_1, Color_2, Color_3)
end

local function TreeD(player)
	local debouncetree = player:FindFirstChild("Dying")
	if debouncetree.Value == false then
		debouncetree.Value = true 
		local Calmify = player:FindFirstChild("Calmify").Value
		local Decay = player:FindFirstChild("Decay").Value
		wait(.5)
		
		local chr = player.Character
		local Tree = nil
		local FirstPressurePlate = false
		
		if Calmify >= 1 then
			Tree = game.ReplicatedStorage:FindFirstChild("Cherry Tree"):Clone()
		elseif Decay >= 1 then
			Tree = game.ReplicatedStorage:FindFirstChild("Dead Tree"):Clone()
		else
			Tree = game.ReplicatedStorage:FindFirstChild("Tree"):Clone()
			FirstPressurePlate = true
		end
		
		local plrposition = chr:FindFirstChild("HumanoidRootPart").Position
		local newV = Vector3.new(plrposition.X, plrposition.Y - 20, plrposition.Z)
		Tree.HumanoidRootPart.Position = newV
		Tree.Parent = game.Workspace
		
		local TreeInfo = TweenInfo.new(0.5)
		local TreeTween = game:GetService("TweenService"):Create(Tree.HumanoidRootPart, TreeInfo, {CFrame = CFrame.new(plrposition) - Vector3.new(0, 2, 0)})
		TreeTween:Play()
		wait(0.2)

		chr.Humanoid.Health = 0

		--Seeing if the tree is on the first pressure plate                - - - - - - - - - - - - - - - - - - - -
		local firstplate = Vector3.new(556.25, -2.541, -178.95)
		local Treepos = Tree:FindFirstChild("Trunk").Position
		local Xpos1 = math.abs(firstplate.X - Treepos.X)
		local Zpos1 = math.abs(firstplate.Z - Treepos.Z)
		local TreeGrove = Vector3.new(670.1, 1.059, -159.55)
		local Xpos2 = math.abs(TreeGrove.X - Treepos.X)
		local Zpos2 = math.abs(TreeGrove.Z - Treepos.Z)
		
		--Moving the gate
		if 5 >= Xpos1 and 5 >= Zpos1 and FirstPressurePlate == true then
			local TweenService = game:GetService("TweenService")
			
			local GateLRoot = game.Workspace:FindFirstChild("Gate"):FindFirstChild("Left Root NCollide")
			local GateRRoot = game.Workspace:FindFirstChild("Gate"):FindFirstChild("Right Root NCollide")
			
			local Open = TweenInfo.new(5, Enum.EasingStyle.Quad, Enum.EasingDirection.In, 0, false, 0)
			local AddingTweenL = TweenService:Create(GateLRoot, Open, {CFrame = CFrame.new(GateLRoot.Position)})
			local SubtractingTweenL = TweenService:Create(GateLRoot, Open, {CFrame = CFrame.new(GateLRoot.Position) - Vector3.new(0, 0, 14.4)})
			local AddingTweenR = TweenService:Create(GateRRoot, Open, {CFrame = CFrame.new(GateRRoot.Position) + Vector3.new(0, 0, 14.4)})
			local SubtractingTweenR = TweenService:Create(GateRRoot, Open, {CFrame = CFrame.new(GateRRoot.Position)})
			
			SubtractingTweenL:Play()
			AddingTweenR:Play()
			debouncetree.Value = false
			
			wait(600)
			Tree:Destroy()
			AddingTweenL:Play()
			SubtractingTweenR:Play()

		elseif 20 >= Xpos2 and 20 >= Zpos2 then
			local Normal = game.ReplicatedStorage:FindFirstChild("Greenify Values").Normal
			local Cherry = game.ReplicatedStorage:FindFirstChild("Greenify Values").Cherry
			local Dead = game.ReplicatedStorage:FindFirstChild("Greenify Values").Dead
			local Complete = game.ReplicatedStorage:FindFirstChild("Greenify Values").Complete
			print(Normal.Value)
			
			--Eventually turn these into number values so that multiple trees can verify that the trees are complete instead of dying and turning it off.
			if Tree.Name == "Tree" then
				if Normal.Value == false then
					Normal.Value = true
					if Cherry.Value == true and Dead.Value == true then
						Complete.Value = true
					end
					
				end
				debouncetree.Value = false
				wait(600)
				if Complete.Value == true then
					Normal.Value = false
					Complete.Value = false	
				else
					Normal.Value = false
				end
				Tree:Destroy()
			elseif Tree.Name == "Cherry Tree" then
				if Cherry.Value == false then
					Cherry.Value = true
					if Normal.Value == true and Dead.Value == true then
						Complete.Value = true
					end
				end
				debouncetree.Value = false
				wait(600)
				if Complete.Value == true then
					Cherry.Value = false
					Complete.Value = false	
				else
					Cherry.Value = false
				end
				Tree:Destroy()
			elseif Tree.Name == "Dead Tree" then
				if Dead.Value == false then
					Dead.Value = true
					if Normal.Value == true and Cherry.Value == true then
						Complete.Value = true
					end
					
				end
				debouncetree.Value = false
				wait(600)
				if Complete.Value == true then
					Dead.Value = false
					Complete.Value = false	
				else
					Dead.Value = false
				end
				Tree:Destroy()
			end
			if Complete.Value == false and game.Workspace:FindFirstChild("Greenify Parts") ~= nil  then
				game.Workspace:FindFirstChild("Greenify Parts"):Destroy()
			end
		else
			debouncetree.Value = false
			wait(600)
			Tree:Destroy()
		end
	end
end	

local function TreePlace(player, position)
	
	local chance = math.random (1, 5)
	local Tree = nil
	local tool = game.Workspace:FindFirstChild(player.Name):FindFirstChild("Place Tree")

	if chance <= 3 then
		Tree = game.ReplicatedStorage:FindFirstChild("Tree"):Clone()
	elseif chance == 4 then
		Tree = game.ReplicatedStorage:FindFirstChild("Cherry Tree"):Clone()
	elseif chance == 5 then	
		Tree = game.ReplicatedStorage:FindFirstChild("Dead Tree"):Clone()
	end
	
	local newV = Vector3.new(position.X, position.Y - 17, position.Z)
	Tree.HumanoidRootPart.Position = newV
	Tree.Parent = game.Workspace
	game.ReplicatedStorage:FindFirstChild("TouchisDeath"):Clone().Parent = Tree:FindFirstChild("Top")
	game.ReplicatedStorage:FindFirstChild("TouchisDeath"):Clone().Parent = Tree:FindFirstChild("Top2")
	

	game.ReplicatedStorage.TreePlacement:FireClient(player)
	
	local TreeInfo = TweenInfo.new(0.5)
	local TreeTween = game:GetService("TweenService"):Create(Tree.HumanoidRootPart, TreeInfo, {CFrame = CFrame.new(position)})
	TreeTween:Play()
	wait(0.5)
	Tree:FindFirstChild("Top"):FindFirstChild("TouchisDeath"):Destroy()
	Tree:FindFirstChild("Top2"):FindFirstChild("TouchisDeath"):Destroy()
	wait(300)
	Tree:Destroy()
end
--These connect the above functions to their events that can be called on.
game.ReplicatedStorage.GreenifyEvent.OnServerEvent:Connect(GreenifyIncrement)
game.ReplicatedStorage.ResetValues.OnServerEvent:Connect(Reset)
game.ReplicatedStorage.ChangeColor.OnServerEvent:Connect(Colors)
game.ReplicatedStorage.TreeDeath.OnServerEvent:Connect(TreeD)
game.ReplicatedStorage.TreePlacement.OnServerEvent:Connect(TreePlace)
