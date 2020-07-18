PlayState = Class{__includes = BaseState}

local toytypes = {'toy_blocks', 'toy_truck', 'doll', 'chef', 'train', 'phone'}
local healtypes = {'baby_bottle', 'pacifier'}

local spawnLocations = {VIRTUAL_HEIGHT - 64, VIRTUAL_HEIGHT - 96, VIRTUAL_HEIGHT - 128, VIRTUAL_HEIGHT - 160, VIRTUAL_HEIGHT - 192}

function PlayState:init()
	self.timer = 0
	self.healtimer = 0
	self.score = 0
	self.objects = {}

	self.toySpeed = 10

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
end

function PlayState:update(dt)
	--location of spawning toys
	local spawnIndex = math.random(5)

	--toy spawning acceleration (so deltaX is not increasing as toy speed increases)
	local toyPrevious = self.toySpeed
	--toyspeed increases for each toy that spawns
	self.toySpeed = self.toySpeed + OBJECT_ACCEL * dt 
	local spawnTime = ((160) * 2) / (self.toySpeed + toyPrevious)
	local healspawnTime = ((1200) * 2) / (self.toySpeed + toyPrevious)


	--randomization of toys
	local toyType = toytypes[math.random(#toytypes)]

	--toy spawn
	self.timer = self.timer + dt
	if self.timer > spawnTime then
		table.insert(self.objects, GameObject (
			GAME_OBJECT_DEFS[toyType],
			spawnLocations[spawnIndex],
			self.toySpeed))
		self.timer = 0
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

	for k, object in pairs(self.objects) do
	--ensures previous toys still on screen are not slower than new toys that spawn
		object.dx = self.toySpeed
		object:update(dt)

		if self.baby:collides(object) and not self.baby.invulnerable then
			if object.solid == true then
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

	self.score = self.score + (dt * 10)

	self.baby:update(dt)
end

function PlayState:render()
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
        0, 2)
	local drawn = false

	-- adding baby scores
	local scores = math.floor(self.score)
	love.graphics.setFont(gFonts['large'])
	love.graphics.setColor(0, 0, 0, 255)
	love.graphics.printf('Score: ' .. tostring(scores), 0, 20, VIRTUAL_WIDTH - 20, 'right')

end
