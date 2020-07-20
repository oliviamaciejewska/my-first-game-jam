--[[ 
    Day 6 - Update1 - Mom Legs 
]]

MomLegs = Class{}

function MomLegs:init()

    self.x = 32
    self.y = 0

    self.texture = 'momlegs'

    self.animation = Animation{

        frames = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14},
        interval = 0.08
    }

    self.currentAnimation = self.animation

end

function MomLegs:update(dt)

    if self.currentAnimation then
		self.currentAnimation:update(dt)
	end
end

function MomLegs:render()

    love.graphics.draw(
        gTextures[self.texture], gFrames[self.texture][self.currentAnimation:getCurrentFrame()],
        self.x, self.y,
        0, 1 or -1, 1
    )
end