PlayState = Class{__includes = BaseState}

local toytypes = {'toy_blocks', 'toy_truck', 'doll', 'chef', 'train', 'phone'}
local healtypes = {'baby_bottle', 'pacifier'}


local spawnLocations = {VIRTUAL_HEIGHT - 64, VIRTUAL_HEIGHT - 96, VIRTUAL_HEIGHT - 128, VIRTUAL_HEIGHT - 160, VIRTUAL_HEIGHT - 192}

-- paintings & drawings
local paintings = {'painting1', 'painting2', 'painting3'}
local drawings = {'drawing1'}
local paintinglocations = {VIRTUAL_HEIGHT - 400, VIRTUAL_HEIGHT - 392}
local drawinglocations = {VIRTUAL_HEIGHT - 240, VIRTUAL_HEIGHT - 256}


function PlayState:init()
	self.timer = 0
	self.healtimer = 0
	self.score = 0
	self.objects = {}
	

	self.toySpeed = 10
	
	-- paintigns & drawings
	self.wallstuffSpeed = 10
	self.wallassets = {}
	self.paintingtimer = 0
	self.drawingtimer = 0

	--momlegs
	--self.momlegs = MomLegs()

end

-- initialized baby here to pass score through states
function PlayState:enter(params)
	local scores = params.score

	self.baby = Baby({
		score = scores,
		stateMachine = StateMachine {
		['walk'] = function() return BabyWalkState(self.baby) end,
		['dodge'] = function() return BabyDodgeState(self.baby) end
		}
	})

	self.baby:changeState('walk')

--	self.momlegs = MomLegs()
end

function PlayState:update(dt)
	--location of spawning toys
	local spawnIndex = math.random(5)
	--location of painting & drawing spawns
	local PandDIndex = math.random(2)

	--toy spawning acceleration (so deltaX is not increasing as toy speed increases)
	local toyPrevious = self.toySpeed
	local wallstuffPrevious = self.wallstuffSpeed
	--toyspeed increases for each toy that spawns
	if self.score < 800 then
		self.toySpeed = self.toySpeed + OBJECT_ACCEL * dt 
	else
		self.toySpeed = self.toySpeed
	end

	local spawnTime = ((160) * 2) / (self.toySpeed + toyPrevious)
	local healspawnTime = ((1200) * 2) / (self.toySpeed + toyPrevious)

	-- paintings&drawings spawns
	self.wallstuffSpeed = self.wallstuffSpeed + OBJECT_ACCEL * dt
	local paintingTime = ((400) * 2) / (self.wallstuffSpeed + wallstuffPrevious)
	local drawingTime = ((2000) * 2) / (self.wallstuffSpeed + wallstuffPrevious)


	--randomization of toys
	local toyType = toytypes[math.random(#toytypes)]

	--toy spawn logic
	self.timer = self.timer + dt

	if self.score < 250 then

		if	self.timer > spawnTime then
			table.insert(self.objects, GameObject (
				GAME_OBJECT_DEFS[toyType],
				spawnLocations[spawnIndex],
				self.toySpeed))
			self.timer = 0
		end
	elseif self.score >= 250 and self.score < 500 then

		if	self.timer > (spawnTime - (spawnTime / 8)) then
			table.insert(self.objects, GameObject (
				GAME_OBJECT_DEFS[toyType],
				spawnLocations[spawnIndex],
				self.toySpeed))
			self.timer = 0
		end
	elseif self.score >= 500 and self.score < 750 then

		if	self.timer > (spawnTime - (spawnTime / 4)) then
			table.insert(self.objects, GameObject (
				GAME_OBJECT_DEFS[toyType],
				spawnLocations[spawnIndex],
				self.toySpeed))
			self.timer = 0
		end
	else
		if self.timer > (2 * spawnTime/3) then
			table.insert(self.objects, GameObject (
				GAME_OBJECT_DEFS[toyType],
				spawnLocations[spawnIndex],
				self.toySpeed))
			self.timer = 0
		end
	end

	local healType = healtypes[math.random(#healtypes)]

	self.healtimer = self.healtimer + dt
	if self.healtimer > healspawnTime then
		table.insert(self.objects, GameObject (
			GAME_OBJECT_DEFS[healType],
			spawnLocations[spawnIndex],
			self.toySpeed
		))
		self.healtimer = 0
	end

	local paintingType = paintings[math.random(#paintings)]
	self.paintingtimer = self.paintingtimer + dt
	if self.paintingtimer > paintingTime then
		table.insert(self.wallassets, GameObject (
			GAME_OBJECT_DEFS[paintingType],
			paintinglocations[PandDIndex],
			self.wallstuffSpeed
		))
		self.paintingtimer = 0
	end

	local drawingType = drawings[math.random(#drawings)]
	self.drawingtimer = self.drawingtimer + dt
	if self.drawingtimer > drawingTime then
		table.insert(self.wallassets, GameObject (
			GAME_OBJECT_DEFS[drawingType],
			drawinglocations[PandDIndex],
			self.wallstuffSpeed
		))
		self.drawingtimer = 0
	end


	for k, object in pairs(self.objects) do
	--ensures previous toys still on screen are not slower than new toys that spawn
		object.dx = self.toySpeed
		object:update(dt)

		if self.baby:collides(object) then
			if object.solid == true and not self.baby.invulnerable then
				self.baby:damage()
				gSounds[object.sound]:play()
				self.baby:goInvulnerable(1.5)
			end

			if object.consumable == true then
				--gSounds['yay']:play()
				self.baby.health = math.min(self.baby.health + 1, BABY_MAX_HEALTH)
				table.remove(self.objects, k)
			end
		end
	end

	for k, object in pairs(self.objects) do
		if object.remove then
			table.remove(self.objects, k)
		end
	end

	for i, asset in pairs(self.wallassets) do
		asset.dx = self.wallstuffSpeed
		asset:update(dt)
		if asset.remove then
			table.remove(self.wallassets, i)
		end
	end


	self.score = self.score + (dt * 10)

	self.baby:update(dt)
end

function PlayState:render()

	for j, pair in pairs(self.wallassets) do
		pair:render()
	end

	for k, pair in pairs(self.objects) do
		pair:render()
		if pair.y + 64 < self.baby.y + 96 then
			pair.rendered = true
		end
	end

	--self.momlegs:render()

	self.baby:render()
	for i, pair in pairs(self.objects) do
		if not pair.rendered then
			pair:render()
		end
	end

	local health = self.baby.health

	if health == 4 then
		healthFrame = 4
	elseif health == 3 then
		healthFrame = 3
	elseif health == 2 then
		healthFrame = 2
	elseif health == 1 then
		healthFrame = 1
		gStateMachine:change('game-over', {
			score = self.score
		})
	end



	
	love.graphics.draw(gTextures['health-bar'], gFrames['health-bar'][healthFrame],
        20, 20)
	local drawn = false


	-- adding baby scores
	local scores = math.floor(self.score)
	love.graphics.setFont(gFonts['large'])
	love.graphics.setColor(0, 0, 0, 255)
	love.graphics.printf('Score: ' .. tostring(scores), 0, 20, VIRTUAL_WIDTH - 20, 'right')

end
