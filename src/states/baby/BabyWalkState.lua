BabyWalkState = Class{__includes = BaseState}

function BabyWalkState:init(baby)
	self.baby = baby
	self.baby.texture = 'walk'
	self.animation = Animation {
		frames = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16},
		interval = 0.08
	}
	self.baby.currentAnimation = self.animation
end

function BabyWalkState:update(dt)
	self.baby.currentAnimation:update(dt)

	if love.keyboard.wasPressed('w') and self.baby.y > VIRTUAL_HEIGHT - 192 - self.baby.height + 64 then
		self.baby.y = self.baby.y - 32
	elseif love.keyboard.wasPressed('s') and self.baby.y + self.baby.height < VIRTUAL_HEIGHT - 32 then
		self.baby.y = self.baby.y + 32
	end

	if love.keyboard.wasPressed('space') then
		self.baby:changeState('dodge')
	end
end