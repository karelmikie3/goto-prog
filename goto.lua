-- goto program for turtle made by: karelmikie3 and thib0704

local tArgs = {...}
	
local x = tonumber(tArgs[1]) or error("you have no x specified!",0)
local y = tonumber(tArgs[2]) or error("you have no y specified!",0)
local z = tonumber(tArgs[3]) or error("you have no z specified!",0)
local cx, cy, cz
	
local function refuel()
	turtle.refuel()
end
	
local function getpos()
	return gps.locate()
end
	
local function getFacing()
	cx1, cy1, cz1 = getpos()
	if not	turtle.forward() then
		if not turtle.up() then
			if not turtle.down() then
				refuel()
			end
		end
		turtle.forward()
	end
	cx2, cy2, cz2 = getpos()
	if (cx1 - cx2) == 1 then
		return "WEST"
	elseif (cx1 - cx2) == -1 then
		return "EAST"
	end
	if (cz1 - cz2) == -1 then
		return "SOUTH"
	elseif (cz1 - cz2) == 1 then
		return "NORTH"
	end
end
	
local function turnRight()
	if facing == "NORTH" then
		facing = "EAST"
		turtle.turnRight()
	elseif facing == "EAST" then
		facing = "SOUTH"
		turtle.turnRight()
	elseif facing == "SOUTH" then
		facing = "WEST"
		turtle.turnRight()
	elseif facing == "WEST" then
		facing = "NORTH"
		turtle.turnRight()
	end
end
	
local function turnLeft()
	if facing == "NORTH" then
		facing = "WEST"
		turtle.turnLeft()
	elseif facing == "WEST" then
		facing = "SOUTH"
		turtle.turnLeft()
	elseif facing == "SOUTH" then
		facing = "EAST"
		turtle.turnLeft()
	elseif facing == "EAST" then
		facing = "NORTH"
		turtle.turnLeft()
	end
end
	
local function od()
	if turtle.detect() then
		print("Detected block")
		if facing == "EAST" then
			if turtle.detect() then
				if cz < z then
					turnRight()
					if turtle.detect() then
						turtle.up()
					end
				else
					turnLeft()
					if turtle.detect() then
						turtle.up()
					end
				end
			end
		elseif facing == "WEST" then
			if turtle.detect() then
				if cz < z then
					turnLeft()
					if turtle.detect() then
						turtle.up()
					end
				else
					turnRight()
					if turtle.detect() then
						turtle.up()
					end
				end
			end
		elseif facing == "NORTH" then
			if turtle.detect() then
				if cx < x then
					turnRight()
					if turtle.detect() then
						turtle.up()
					end
				else
					turnLeft()
					if turtle.detect() then
						turtle.up()
					end
				end
			end
		elseif facing == "SOUTH" then
			if	turtle.detect()	then
				if cx < x then
					turnLeft()
					if turtle.detect() then
						turtle.up()
					end
				else
					turnRight()
					if turtle.detect() then
						turtle.up()
					end
				end
			end
		end
		turtle.forward()
	end
end
	
facing = getFacing()
print("facing: "..facing)
while cx ~= x or cy ~= y or cz ~= z do
	sleep(.1)
	cx, cy, cz = getpos()
	
	if x ==	cx then
		od()
	end
	if z ==	cz then
		od()
	end
	
	if cx > x then
		if facing == "WEST" then
			print("SW")
			od()
			print("EW")
			turtle.forward()
		else
			print("TW")
			turnLeft()
		end
	elseif cx < x then
		if facing == "EAST" then
			print("SE")
			od()
			print("EE")
			turtle.forward()
		else
			print("TE")
			turnLeft()
		end
	end
	
	if cy > y then
		turtle.down()
	elseif cy < y then
		turtle.up()
	end
	
	if cx == x then
		if cz > z then
			if facing == "NORTH" then
				od()
				turtle.forward()
			else
			turnRight()
			end
		elseif cz < z then
			if facing == "SOUTH" then
				od()
				turtle.forward()
			else
				turnRight()
			end
		end
	end
	cx, cy, cz = getpos()
end
