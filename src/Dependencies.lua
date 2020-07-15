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

require 'src/states/baby/BabyWalkState'
require 'src/states/baby/BabyDodgeState'


gTextures = {
	['walk'] = love.graphics.newImage('graphics/babyspritesheet.png'),
	['dodge'] = love.graphics.newImage('graphics/babydodgesheet1.png'),
	['health-bar'] = love.graphics.newImage('graphics/HealthBarSheet.png'),
	['toy-blocks'] = love.graphics.newImage('graphics/ToyBlocks.png'),
	['toy-truck'] = love.graphics.newImage('graphics/ToyTruck.png'),
	['baby-bottle'] = love.graphics.newImage('graphics/BabyBottle.png'),
	['pacifier'] = love.graphics.newImage('graphics/Pacifier.png'),
	['doll'] = love.graphics.newImage('graphics/Doll.png'),
	['chef'] = love.graphics.newImage('graphics/FrenchChef.png'),
	['train'] = love.graphics.newImage('graphics/ToyTrain.png'),
	['phone'] = love.graphics.newImage('graphics/TrapPhone.png')
}

gFrames = {
	['walk'] = GenerateQuads(gTextures['walk'], 64, 96),
	['dodge'] = GenerateQuads(gTextures['dodge'], 128, 96),
	['toy-truck'] = GenerateQuads(gTextures['toy-truck'], 64, 64),
	['toy-blocks'] = GenerateQuads(gTextures['toy-blocks'], 64, 64),
	['health-bar'] = GenerateQuads(gTextures['health-bar'], 96, 48),
	['baby-bottle'] = GenerateQuads(gTextures['baby-bottle'], 64, 64),
	['pacifier'] = GenerateQuads(gTextures['pacifier'], 32, 32),
	['doll'] = GenerateQuads(gTextures['doll'], 64, 64),
	['chef'] = GenerateQuads(gTextures['chef'], 64, 64),
	['train'] = GenerateQuads(gTextures['train'], 64, 64),
	['phone'] = GenerateQuads(gTextures['phone'], 64, 64)
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

gSounds = {
	['music'] = love.audio.newSource('sounds/music.mp3', 'static'),
	['cry'] = love.audio.newSource('sounds/cry.wav', 'static'),
	['choochoo'] = love.audio.newSource('sounds/choochoo.wav', 'static'),
	['blocks'] = love.audio.newSource('sounds/blocks.wav', 'static'),
	['yay'] = love.audio.newSource('sounds/yay.wav', 'static'),
	['hi'] = love.audio.newSource('sounds/hi.wav', 'static')
}


--moop fonts
gFonts = {
	['small'] = love.graphics.newFont('fonts/font.ttf', 8),
	['medium'] = love.graphics.newFont('fonts/font.ttf', 16),
	['large'] = love.graphics.newFont('fonts/font.ttf', 32),
	['XL'] = love.graphics.newFont('fonts/font.ttf', 40)
}