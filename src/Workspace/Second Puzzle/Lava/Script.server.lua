local Lava = script.Parent
local debounce = false

local function onTouched(person)

	if person.Parent:FindFirstChild("Humanoid") and person.Parent:FindFirstChild("Head") and debounce == false then
		debounce = true
		local number = math.random(322.5, 339.5)
		local position = Vector3.new(number, -58.6, -355.25)
		local plr = person.Parent
		plr:FindFirstChild("HumanoidRootPart").Position = position
		wait(.2)
		debounce = false
	end
end

Lava.Touched:Connect(onTouched)

