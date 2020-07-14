PlayState = Class{__includes = BaseState}

local types = {'toy_blocks', 'toy_truck'}

local spawnLocations = {VIRTUAL_HEIGHT - 64, VIRTUAL_HEIGHT - 128, VIRTUAL_HEIGHT - 192}

function PlayState:init()
	self.baby = Baby()
	self.timer = 0

	self.objects = {}

	self.toySpeed = 10
end

function PlayState:update(dt)
	--location of spawning toys
	local spawnIndex = math.random(3)

	--toy spawning acceleration (so deltaX is not increasing as toy speed increases)
	local toyPrevious = self.toySpeed
	--toyspeed increases for each toy that spawns
	self.toySpeed = self.toySpeed + OBJECT_ACCEL * dt 
	local spawnTime = ((128) * 2) / (self.toySpeed + toyPrevious)


	--randomization of toys
	local toyType = types[math.random(#types)]

	--toy spawn
	self.timer = self.timer + dt
	if self.timer > spawnTime then
		table.insert(self.objects, GameObject (
			GAME_OBJECT_DEFS[toyType],
			spawnLocations[spawnIndex],
			self.toySpeed))
		self.timer = 0
	end

	for k, pair in pairs(self.objects) do
	--ensures previous toys still on screen are not slower than new toys that spawn
		pair.dx = self.toySpeed
		pair:update(dt)
	end

	for k, pair in pairs(self.objects) do
		if pair.remove then
			table.remove(self.objects, k)
		end
	end


	self.baby:update(dt)
end

function PlayState:render()
	local health = self.baby.health
	--TODO: doesnt work yet without hard coding
	local healthFrame = 4
	
	if health == 4 then
		local healthFrame = 4
	elseif health == 3 then
		local healthFrame = 3
	elseif health == 2 then
		local healthFrame = 2
	elseif health == 1 then
		local healthFrame = 1
	end

	love.graphics.draw(gTextures['health-bar'], gFrames['health-bar'][healthFrame],
        0, 2)
	local drawn = false

	for k, pair in pairs(self.objects) do
		pair:render()
		if pair.y + 64 < self.baby.y + 96 then
			pair.rendered = true
		end
	end
	self.baby:render()
	for i, pair in pairs(self.objects) do
		if not pair.rendered then
			pair:render()
		end
	end
end
