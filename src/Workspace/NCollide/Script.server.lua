local Grass = script.Parent
local debounce = false

local function onTouched(person)
	
	if person.Parent:FindFirstChild("Humanoid") and person.Parent:FindFirstChild("Head") and debounce == false then
		debounce = true
		local number = math.random(131.8, 151.8)
		local position = Vector3.new(418.2, 11.359, 0 -(number))
		local plr = person.Parent
		plr:FindFirstChild("HumanoidRootPart").Position = position
		wait(.2)
		debounce = false
	end
end

Grass.Touched:Connect(onTouched)
