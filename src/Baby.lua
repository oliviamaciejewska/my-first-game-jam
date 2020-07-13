--[[
	Baby class 
]]

Baby = Class{}

function Baby:init()
	self.image = love.graphics.newImage('graphics/tempbaby.png')
	self.width = self.image:getWidth()
	self.height = self.image:getHeight()

	self.x = VIRTUAL_WIDTH / 2 - (self.width / 2)
	self.y = VIRTUAL_HEIGHT / 2 - (self.height / 2)
end

function Baby:update()
	if love.keyboard.wasPressed('w') and self.y > VIRTUAL_HEIGHT - 192 - self.height + 64 then
		self.y = self.y - 32
	elseif love.keyboard.wasPressed('s') and self.y + self.height < VIRTUAL_HEIGHT - 32 then
		self.y = self.y + 32
	end
end

function Baby:render()
	love.graphics.draw(self.image, self.x, self.y)
end