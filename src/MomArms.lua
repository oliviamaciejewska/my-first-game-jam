--[[
    Day 9 - Update 1 - Mom Arms
]]

MomArms = Class{}

function MomArms:init()
    self.width = 256
    self.height = 400
    self.x = VIRTUAL_WIDTH / 2 - self.width/2
    self.y = 0 -self.height
    self.texture = 'momarms'
    self.dy = 300
    self.goUp = false
    self.targetY = 0
    self.babyHeight = 96

end

function MomArms:collides(target)
    return not (self.x + self.width < target.x or self.x > target.x + target.width or
                    self.y + self.height < target.y or self.y > target.y + target.height)
end



function MomArms:update(dt)

    if self.y + self.height < self.targetY + self.babyHeight / 2  and self.goUp == false then
        self.y = self.y + self.dy * dt - ((OBJECT_ACCEL * dt * dt) / 2)
        if self.y + self.height >= self.targetY + self.babyHeight / 2 then
            self.goUp = true
            self.dy = -self.dy
        end
    end
    if self.goUp == true then
        self.y = self.y + self.dy * dt - ((OBJECT_ACCEL * dt * dt)/2)
        if self.y <= -400 then
            self.goUp = false
            self.dy = -self.dy
        end
    end
end

function MomArms:render()
    love.graphics.draw(gTextures[self.texture], gFrames[self.texture][1],
        self.x, self.y,
		0, 1 or -1, 1)

end