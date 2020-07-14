PlayState = Class{__includes = BaseState}

local types = {'toy_blocks', 'toy_truck', 'baby_bottle', 'pacifier'}

function PlayState:init()
	self.baby = Baby()
	self.timer = 0

	self.objects = {}
end

function PlayState:update(dt)
	local timeToSpawn = math.random(4)
	self.timer = self.timer + dt
	if self.timer > timeToSpawn then
		table.insert(self.objects, GameObject('toy_blocks', math.random((VIRTUAL_HEIGHT / 2 + 192), (VIRTUAL_HEIGHT / 2))))
		self.timer = 0
	end

	for k, pair in pairs(self.objects) do 
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

	love.graphics.draw(healthBar, healthQuads[healthFrame],
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
