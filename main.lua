--dependencies file
require 'src/Dependencies'
require 'src/states/BaseState'
-- Update 5 - poot - removed definitions here and put them in constants to declutter

--Update IDK - moop - moved graphics to start state (attempt at states)
local background = love.graphics.newImage('graphics/background.png')
local backgroundScroll = 0
local backgroundDx = BACKGROUND_SCROLL_SPEED

local ground = love.graphics.newImage('graphics/ground.png')
local groundScroll = 0
local groundDx = GROUND_SCROLL_SPEED

local objects = {}
local gameobject = GameObject()

local fps = love.timer.getFPS( )

--moved baby to play state: moop
--local baby = Baby()

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

	sounds['music']:setLooping(true)
    sounds['music']:play()

    gStateMachine = StateMachine {
        ['start'] = function() return StartState() end,
        ['play'] = function() return PlayState() end
		}
    gStateMachine:change('start')


	love.keyboard.keysPressed = {}
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
	backgroundDx = backgroundDx + BACKGROUND_SCROLL_ACCEL * dt
	backgroundScroll = (backgroundScroll + (backgroundDx * dt) + ((BACKGROUND_SCROLL_ACCEL * dt^2) / 2))
		% BACKGROUND_LOOPING_POINT

	groundDx = groundDx + GROUND_SCROLL_ACCEL * dt
	groundScroll = (groundScroll + (GROUND_SCROLL_SPEED * dt) + ((GROUND_SCROLL_ACCEL * dt^2) /2))
		%VIRTUAL_WIDTH

	--baby:update(dt)
	gStateMachine:update(dt)

	gameobject:update(dt)


	love.keyboard.keysPressed = {}
end

function love.draw()
	push:start()

	love.graphics.draw(background, -backgroundScroll, 0)

	love.graphics.draw(ground, -groundScroll, VIRTUAL_HEIGHT - 192)

	love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), 10, 10)

	gStateMachine:render()
	--moved baby to playstate
	--baby:render()
	--gameobject:render()

	push:finish()
end