MomGrabState = Class{__includes = BaseState}

function MomGrabState:init(momarms)
	self.momarms = momarms
    self.animation = Animation {
		frames = {2,3,4,5,6,7,8},
		looping = false,
		interval = 0.08
	}
    self.momarms.currentAnimation = self.animation
	self.momarms.collidable = true

	self.momarms.inRest = false
end

function MomGrabState:enter(params)
    self.momarms.currentAnimation:refresh()
end

function MomGrabState:update(dt)
	self.momarms.currentAnimation:update(dt)
	if self.momarms.currentAnimation.timesPlayed > 0 then
		self.momarms.currentAnimation.timesPlayed = 0
		self.momarms.goUp = true
		self.momarms.dy = -self.momarms.dy
		self.momarms:changeState('drop')
	end
end
