--[[
    Day 9 - Update 1 - Mom Arms
]]

MomArms = Class{}

function MomArms:init(def)
    self.width = 256
    self.height = 400
    self.x = VIRTUAL_WIDTH / 2 - self.width/2
    self.y = 0 -self.height
    self.texture = 'momright'
    self.dy = 200
    self.goUp = false
    self.targetY = 0
    self.babyHeight = 96
    self.stateMachine = def.stateMachine
    self.grabNow = false

    self.collidable = false

end

function MomArms:collides(target)
    if self.collidable == true then
        return not (self.x + self.width < target.x or self.x > target.x + target.width or
                        self.y + self.height < target.y or self.y > target.y + target.height)
    end
end

function MomArms:changeState(state, params)

	self.stateMachine:change(state, params)
end


function MomArms:update(dt)

    if self.currentAnimation then
		self.currentAnimation:update(dt)
	end

	self.stateMachine:update(dt)
end

function MomArms:render()
    love.graphics.draw(gTextures[self.texture], gFrames[self.texture][self.currentAnimation:getCurrentFrame()],
        self.x, self.y,
		0, 1 or -1, 1)

end