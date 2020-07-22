MomGrabState = Class{__includes = BaseState}

function MomGrabState:init(momarms)
	self.momarms = momarms
   -- self.momarms.texture = 'momright'
    self.animation = Animation {
		frames = {2,3,4,5,6,7,8},
		looping = false,
		interval = 0.08
	}
    self.momarms.currentAnimation = self.animation
	self.momarms.collidable = true
end

--[[function MomGrabState:collides(target)
	return not (self.x + self.width < target.x or self.x > target.x + target.width or
                self.y + self.height < target.y or self.y > target.y + target.height)
end]]

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
