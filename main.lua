--dependencies file
require 'src/Dependencies'


--physical screen dimensions
WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

--virtual dimensions
VIRTUAL_WIDTH = 512
VIRTUAL_HEIGHT = 432

local background = love.graphics.newImage('graphics/background.png')
local backgroundScroll = 0

local ground = love.graphics.newImage('graphics/ground.png')
local groundScroll = 0

local BACKGROUND_SCROLL_SPEED = 30
local GROUND_SCROLL_SPEED = 60

local BACKGROUND_LOOPING_POINT = 1220

local baby = Baby()

function love.load()
	love.graphics.setDefaultFilter('nearest', 'nearest')

	love.window.setTitle('Diaper Change')

	push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
		vsync = true,
		fullscreen = false,
		resizable = true
	})
end

function love.resize(w, h)
	push:resize(w, h)
end


function love.keyboard(key)
	if key == 'escape' then
		love.event.quit()
	end
end

function love.update(dt)
	backgroundScroll = (backgroundScroll + BACKGROUND_SCROLL_SPEED * dt)
		% BACKGROUND_LOOPING_POINT

	groundScroll = (groundScroll + GROUND_SCROLL_SPEED * dt)
		%VIRTUAL_WIDTH
end

function love.draw()
	push:start()

	love.graphics.draw(background, -backgroundScroll, 0)

	love.graphics.draw(ground, -groundScroll, VIRTUAL_HEIGHT - 192)

	baby:render()

	push:finish()
end