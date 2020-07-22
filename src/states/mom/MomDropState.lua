MomDropState = Class{__includes = BaseState}

function MomDropState:init(momarms)
	self.momarms = momarms
end

function MomDropState:update(dt)
	if self.momarms.y + self.momarms.height < self.momarms.targetY + self.momarms.babyHeight / 2  and self.momarms.goUp == false then
        self.momarms.y = self.momarms.y + self.momarms.dy * dt - ((OBJECT_ACCEL * dt * dt) / 2)
        if self.momarms.y + self.momarms.height >= self.momarms.targetY + self.momarms.babyHeight / 2 then
            self.momarms.goUp = true
            self.momarms.dy = -self.momarms.dy
        end
    end
    if self.momarms.goUp == true then
        self.momarms.y = self.momarms.y + self.momarms.dy * dt - ((OBJECT_ACCEL * dt * dt)/2)
        if self.momarms.y <= -400 then
            self.momarms.goUp = false
            self.momarms.dy = -self.momarms.dy
        end
    end
end