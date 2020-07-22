MomDropState = Class{__includes = BaseState}

function MomDropState:init(momarms)
	self.momarms = momarms
    --self.texture = 'momarms'
   self.animation = Animation {
		frames = {1},
		interval = 1
	}
	self.momarms.currentAnimation = self.animation
    self.momarms.collidable = false
end

--[[
function MomDropState:collides(target)
	return false
end]]

function MomDropState:update(dt)
    --self.momarms.currentAnimation:update(dt)
	if self.momarms.y + self.momarms.height < self.momarms.targetY + self.momarms.babyHeight / 2  and self.momarms.goUp == false then
        self.momarms.y = self.momarms.y + self.momarms.dy * dt - ((OBJECT_ACCEL * dt * dt) / 2)
        if self.momarms.y + self.momarms.height >= self.momarms.targetY + self.momarms.babyHeight / 2 then
            self.momarms:changeState('grab')
        end
    end
    if self.momarms.goUp == true then
    	self.momarms.y = self.momarms.y + self.momarms.dy * dt - ((OBJECT_ACCEL * dt * dt)/2)
        if self.momarms.y <= -400 then
            self.momarms.dy = -self.momarms.dy
            self.momarms.grabNow = false
            self.momarms:changeState('rest')
        end
    end

end