local Tool = script.Parent
local equipped = Instance.new("BoolValue")
equipped.Parent = Tool
equipped.Value = false


if Tool.Parent.Name == "Backpack" then
	plr = Tool.Parent.Parent	
else
	plr = Tool.Parent
end
local mouse = plr:GetMouse()

local Decay = plr:FindFirstChild("Decay")


Tool.Equipped:Connect(function()
	equipped = true
	game.ReplicatedStorage.Decay.DestroyTool:FireServer(Tool)
end)

Tool.Unequipped:Connect(function()
	equipped = false
end)


mouse.Button1Down:Connect(function()
	local Touched = mouse.Target:FindFirstAncestorOfClass("Model")
	if Touched == nil then

	elseif Touched ~= nil and equipped == true then
		local Players = game:GetService("Players"):GetChildren()
		for i=1, #Players do
			if Players[i].Name == Touched.Name then
				local plar = Players[i]
				print(plar.Name)
				game.ReplicatedStorage.Decay.Antagonize:FireServer(plar)
				Tool:Destroy()
			end
		end

	end




end)
