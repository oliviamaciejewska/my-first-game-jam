--[[
	Baby class 
]]

Baby = Class{}

function Baby:init()
	--self.image = love.graphics.newImage('graphics/tempbaby.png')
	self.width = 64--self.image:getWidth()
	self.height = 96--self.image:getHeight()
	--self.baby = baby
	
	self.x = VIRTUAL_WIDTH / 2 - (self.width / 2)
	self.y = VIRTUAL_HEIGHT / 2 - (self.height / 2)

	--self.texture = 'baby-walk'

	self.animation = Animation {
		frames = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16},
		interval = 0.08
	}

	self.currentAnimation = self.animation
	
end

function Baby:update(dt)

	self.currentAnimation:update(dt)

	if love.keyboard.wasPressed('w') and self.y > VIRTUAL_HEIGHT - 192 - self.height + 64 then
		self.y = self.y - 32
	elseif love.keyboard.wasPressed('s') and self.y + self.height < VIRTUAL_HEIGHT - 32 then
		self.y = self.y + 32
	end
end

function Baby:render()
	--love.graphics.draw(self.image, self.x, self.y)
	love.graphics.draw(babySheet, babyQuads[self.currentAnimation:getCurrentFrame()],
        self.x, self.y,
		0, 1 or -1, 1)
end