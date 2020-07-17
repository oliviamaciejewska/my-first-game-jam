--[[ 
    Day 6 - Update1 - Mom Legs - will keep animating in a loop at fixed location (for now)
    Might make a transitionary state so that she walks a bit after grabbing the baby? maybe 

    its not called anywhere for now until the sprite sheet is made 
]]

MomLegs = Class{}

function MomLegs:init()

    self.x = VIRTUAL_WIDTH / 8
    self.y = VIRTUAL_HEIGHT - 96

    self.animation = Animation(

        frames = { },
        interval = 0.08
    )

    self.currentAnimation = self.animation

end

function MomLegs:update(dt)

    if self.currentAnimation then
		self.currentAnimation:update(dt)
	end
end

function MomLegs:render()

    love.graphics.draw(
        gTextures[self.texture], 
        gFrames[self.texture][self.currentAnimation:getCurrentFrame()],
        self.x, self.y,
        0, 1 or -1, 1
    )
end