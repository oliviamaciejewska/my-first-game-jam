--push library
-- https://github.com/Ulydev/push
push = require 'lib/push'

--class library
-- https://github.com/vrld/hump/blob/master/class.lua
Class = require 'lib/class'




-- Utility
require 'src/Util'
require 'src/Constants'
require 'src/StateMachine'


-- general
require 'src/Animation'
require 'src/Baby'
require 'src/GameObject'
require 'src/game_objects'


--gameStates
require 'src/states/BaseState'
require 'src/states/StartState'
require 'src/states/PlayState'


gTextures = {
	['baby-walk'] = love.graphics.newImage('graphics/babyspritesheet.png'),
	['health-bar'] = love.graphics.newImage('graphics/HealthBarSheet.png'),
	['toy-blocks'] = love.graphics.newImage('graphics/ToyBlocks.png'),
	['toy-truck'] = love.graphics.newImage('graphics/ToyTruck.png')
}

gFrames = {
	['baby-walk'] = GenerateQuads(gTextures['baby-walk'], 64, 96),
	['toy-truck'] = GenerateQuads(gTextures['toy-truck'], 64, 64),
	['toy-blocks'] = GenerateQuads(gTextures['toy-blocks'], 64, 64),
	['health-bar'] = GenerateQuads(gTextures['health-bar'], 96, 48)
}

--gTextures['baby-walk'] = love.graphics.newImage('graphics/babyspritesheet.png')

--Frames['baby-walk'] = GenererateQuads(gTextures['baby-walk'], 64, 96)

--moop attempt to fix
--[[
babySheet = love.graphics.newImage('graphics/babyspritesheet.png')
babyQuads = GenerateQuads(babySheet, 64, 96)

-- poot attempt to break
toyblocks = love.graphics.newImage('graphics/ToyBlocks.png')
toyquads = GenerateQuads(toyblocks, 64, 64)


healthBar = love.graphics.newImage('graphics/HealthBarSheet.png')
healthQuads = GenerateQuads(healthBar, 96, 48)
]]
--moop fonts
gFonts = {
	['small'] = love.graphics.newFont('fonts/font.ttf', 8),
	['medium'] = love.graphics.newFont('fonts/font.ttf', 16),
	['large'] = love.graphics.newFont('fonts/font.ttf', 32),
	['XL'] = love.graphics.newFont('fonts/font.ttf', 40)
}