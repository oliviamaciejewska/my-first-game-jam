--[[
    Day 9 - Update 1 - Mom Arms
]]

MomArms = Class{}

function MomArms:init()
    self.width = 256
    self.height = 400
    self.x = VIRTUAL_WIDTH / 2 - self.width/2
    self.y = 0 - self.height
    self.texture = 'momarms'
    self.dx = 100
    self.goUp = false

end



function MomArms:update(dt)
    if self.y < -64 and goUp == false then
        self.y = self.y + self.dx * dt - ((OBJECT_ACCEL * dt * dt) / 2)
        if self.y > -60 then
            goUp = true
        end
    end
    if self.y > -64 and goUp == true then
        self.dx = -self.dx
        self.y = self.y - self.dx * dt + ((OBJECT_ACCEL * dt * dt)/2)
        if self.y < - 250 then
            goUp = false
        end
    end
end

function MomArms:render()
    love.graphics.draw(gTextures[self.texture], gFrames[self.texture][1],
        self.x, self.y,
		0, 1 or -1, 1)

end