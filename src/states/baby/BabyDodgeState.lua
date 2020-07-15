BabyDodgeState = Class{__includes = BaseState}

function BabyDodgeState:init(baby)
	self.baby = baby
	self.baby.texture = 'dodge' 
	self.animation = Animation {
		frames = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16},
		looping = false,
		interval = 0.08
	}
	self.baby.currentAnimation = self.animation
end

function BabyDodgeState:enter(params)
	self.baby.currentAnimation:refresh()
end

function BabyDodgeState:update(dt)
	self.baby.currentAnimation:update(dt)
	if self.baby.currentAnimation.timesPlayed > 0 then
		self.baby.currentAnimation.timesPlayed = 0
		self.baby:changeState('walk')
	end

	if love.keyboard.wasPressed('space') then
		self.baby:changeState('dodge')
	end
end