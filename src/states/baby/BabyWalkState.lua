BabyWalkState = Class{__includes = BaseState}

function BabyWalkState:init(baby, momarms)
	self.baby = baby
	self.momarms = momarms
	self.baby.texture = 'walk'
	self.animation = Animation {
		frames = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16},
		interval = 0.08
	}
	self.baby.currentAnimation = self.animation

	self.babyHitbox = Hitbox(self.baby.x, self.baby.y, self.baby.width, self.baby.height)
end

function BabyWalkState:update(dt)
	self.baby.currentAnimation:update(dt)
	self.momarms.targetY = self.baby.y
	self.momarms.tagetY = self.baby.y

	if self.momarms:collides(self.babyHitbox) then
		self.baby:damage()
		self.baby:goInvulnerable(3)
	end

	if love.keyboard.wasPressed('w') and self.baby.y > VIRTUAL_HEIGHT - 192 - self.baby.height + 64 then
		self.baby.y = self.baby.y - 32
	elseif love.keyboard.wasPressed('s') and self.baby.y + self.baby.height < VIRTUAL_HEIGHT - 32 then
		self.baby.y = self.baby.y + 32
	end

	if love.keyboard.wasPressed('space') then
		self.baby:changeState('dodge')
	end


end