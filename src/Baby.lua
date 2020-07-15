--[[
	Baby class

	Day3 - moop

	-Collision function for objects
]]

Baby = Class{}

function Baby:init(def)
	--self.image = love.graphics.newImage('graphics/tempbaby.png')
	self.width = 64--self.image:getWidth()
	self.height = 96--self.image:getHeight()
	--self.baby = baby
	
	self.x = VIRTUAL_WIDTH / 4 + (self.width / 2)
	self.y = VIRTUAL_HEIGHT / 2 + (self.height / 2)

	self.texture = 'walk'
	

	self.animation = Animation {
		frames = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16},
		interval = 0.08
	}
	
	self.stateMachine = def.stateMachine

	self.currentAnimation = self.animation
	self.invulnerable = false
	self.invulnerableDuration = 0
	self.invulnerableTimer = 0
	self.flashTimer = 0

	self.health = 4
	-- to add
	-- self.score = 0
	--self:changeState('walk')
	
end

function Baby:damage()
	if self.health > 0 then
		self.health = self.health - 1
	end
end

function Baby:goInvulnerable(duration)
	self.invulnerable = true
	self.invulnerableDuration = duration
end

function Baby:collides(object)

	if (self.x + self.width) >= object.x and (self.x + self.width) <= object.x + object.width then
		if object.solid then
			if self.y + self.height >= object.y + object.height - 16 and self.y + self.height <= object.y + object.height + 16  then
				return true
			end
		else
			if self.y + self.height >= object.y + object.height - 4 and self.y <= object.y + 4 then
				return true
			end
		end
	end

	return false

end

function Baby:changeState(state, params)

	self.stateMachine:change(state, params)
end

function Baby:update(dt)

	if self.invulnerable then
		self.flashTimer = self.flashTimer + dt
		self.invulnerableTimer = self.invulnerableTimer + dt

		if self.invulnerableTimer > self.invulnerableDuration then
			self.invulnerable = false
			self.invulnerableTimer = 0
			self.invulnerableDuration = 0
			self.flashTimer = 0
		end
	end
	if self.currentAnimation then
		self.currentAnimation:update(dt)
	end

	self.stateMachine:update(dt)

end

function Baby:render()
	if self.invulnerable and self.flashTimer > 0.06 then
        self.flashTimer = 0
        love.graphics.setColor(255, 255, 255, 64)
    end
	--love.graphics.draw(self.image, self.x, self.y)
	love.graphics.draw(gTextures[self.texture], gFrames[self.texture][self.currentAnimation:getCurrentFrame()],
        self.x, self.y,
		0, 1 or -1, 1)
end