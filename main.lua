--dependencies file
require 'src/Dependencies'

-- Update 5 - poot - removed definitions here and put them in constants to declutter

local background = love.graphics.newImage('graphics/background.png')
local backgroundScroll = 0

local ground = love.graphics.newImage('graphics/ground.png')
local groundScroll = 0


local objects = {}
local gameobject = GameObject()
local baby = Baby()

function love.load()
	love.graphics.setDefaultFilter('nearest', 'nearest')

	love.window.setTitle('Diaper Change')

	push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
		vsync = true,
		fullscreen = false,
		resizable = true
	})

	sounds = {
		['music'] = love.audio.newSource('sounds/music.mp3', 'static')
	}

	love.keyboard.keysPressed = {}

	sounds['music']:setLooping(true)
    sounds['music']:play()
end

function love.resize(w, h)
	push:resize(w, h)
end


function love.keypressed(key)

	love.keyboard.keysPressed[key] = true

	if key == 'escape' then
		love.event.quit()
	end
end

function love.keyboard.wasPressed(key)
	if love.keyboard.keysPressed[key] then
		return true
	else
		return false
	end
end

function love.update(dt)
	backgroundScroll = (backgroundScroll + BACKGROUND_SCROLL_SPEED * dt)
		% BACKGROUND_LOOPING_POINT

	groundScroll = (groundScroll + GROUND_SCROLL_SPEED * dt)
		%VIRTUAL_WIDTH

	baby:update(dt)

	if math.random(10) <= 1 then
		table.insert(objects, GameObject{
			texture = toyblocks,
			x = VIRTUAL_WIDTH,
			y = 192,
			--dx = -GROUND_SCROLL_SPEED,
			width = 64,
			height = 64
		}) 
	end

	gameobject:update(dt)

	love.keyboard.keysPressed = {}
end

function love.draw()
	push:start()

	love.graphics.draw(background, -backgroundScroll, 0)

	love.graphics.draw(ground, -groundScroll, VIRTUAL_HEIGHT - 192)

	baby:render()
	gameobject:render()

	push:finish()
end