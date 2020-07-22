MomRestState = Class{__includes = BaseState}

function MomRestState:init(momarms)
	self.momarms = momarms
   self.animation = Animation {
		frames = {1},
		interval = 1
	}
	self.momarms.currentAnimation = self.animation
	self.momarms.collidable = false
end


function MomRestState:update(dt)

	self.momarms.y = 0 - self.momarms.height
	if self.momarms.grabNow == true then
		self.momarms.goUp = false
		self.momarms:changeState('drop')
	end

end