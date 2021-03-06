--dependencies file
require "src.Dependencies"
require "src.states.BaseState"

-- Update 5 - poot - removed definitions here and put them in constants to declutter

--Update IDK - moop - moved graphics to start state (attempt at states)
local background = love.graphics.newImage('graphics/background.png')
local backgroundScroll = 0
--local backgroundDx = BACKGROUND_SCROLL_SPEED

local ground = love.graphics.newImage('graphics/ground.png')
local groundScroll = 0
--local groundDx = GROUND_SCROLL_SPEED

local objects = {}
--local gameobject = GameObject()

local fps = love.timer.getFPS( )

--moved baby to play state: moop
--local baby = Baby()

function love.load()
	love.graphics.setDefaultFilter('nearest', 'nearest')

	love.window.setTitle('Dia(per Change) Hard 3: A Xmas Movie')

	push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
		vsync = true,
		fullscreen = false,
		resizable = true
	})
	

	gSounds['music']:setLooping(true)
    gSounds['music']:play()

    gStateMachine = StateMachine {
        ['start'] = function() return StartState() end,
		['play'] = function() return PlayState() end,
		['game-over'] = function() return GameOverState() end,
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
	--[[
	if backgroundDx < 450 then
		backgroundDx = backgroundDx + BACKGROUND_SCROLL_ACCEL * dt
	end
	backgroundScroll = (backgroundScroll + (backgroundDx * dt) + ((BACKGROUND_SCROLL_ACCEL * dt^2) / 2))
		% BACKGROUND_LOOPING_POINT
	]]
	--if backgroundDx < 
	--groundDx = groundDx + GROUND_SCROLL_ACCEL * dt
	--groundScroll = (groundScroll + (GROUND_SCROLL_SPEED * dt) + ((GROUND_SCROLL_ACCEL * dt^2) /2))
	--	%VIRTUAL_WIDTH

	gStateMachine:update(dt)



	love.keyboard.keysPressed = {}
end

function love.draw()
	push:start()

	love.graphics.draw(background, -backgroundScroll, 0)

	love.graphics.draw(ground, -groundScroll, VIRTUAL_HEIGHT - 192)

	--love.graphics.print("Current scrollspeed: "..tostring(groundDx), 10, 10)

	gStateMachine:render()

	push:finish()
end