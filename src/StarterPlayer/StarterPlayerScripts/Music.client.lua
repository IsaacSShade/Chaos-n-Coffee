
local Unknown = 12117501012
local Icosa = 12117491082
local Incision = 12117499085
local Hourglass = 12117489517
local Vacillate = 12117502382
local Music = game.Workspace["Background Music"]

while true do
	local number = math.random(1, 5)
	if number == 1 then
		Music.SoundId = "rbxassetid://"..Icosa
		Music.Volume = 0.5
	elseif number == 2 then
		Music.SoundId = "rbxassetid://"..Incision
		Music.Volume = 0.5
	elseif number == 3 then
		Music.SoundId = "rbxassetid://"..Hourglass
		Music.Volume = 0.5
	elseif number == 4 then
		Music.SoundId = "rbxassetid://"..Vacillate
		Music.Volume = 1.25
	elseif number == 5 then
		Music.SoundId = "rbxassetid://"..Unknown
		Music.Volume = 0.5
	end
	Music:Play()
	Music.Ended:wait()
end