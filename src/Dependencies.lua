--push library
-- https://github.com/Ulydev/push
push = require 'lib.push'

--class library
-- https://github.com/vrld/hump/blob/master/class.lua
Class = require 'lib.class'




-- Utility
require 'src.Util'
require 'src.Constants'
require 'src.StateMachine'


-- general
require 'src.Animation'
require 'src.Baby'
require 'src.GameObject'
require 'src.game_objects'
require 'src.MomLegs'
require 'src.MomArms'
require 'src.Hitbox'

--gameStates
require 'src.states.BaseState'
require 'src.states.StartState'
require 'src.states.PlayState'
require 'src.states.GameOverState'

-- baby states
require 'src.states.baby.BabyWalkState'
require 'src.states.baby.BabyDodgeState'

--mom states
require 'src.states.mom.MomDropState'
require 'src.states.mom.MomGrabState'
require 'src.states.mom.MomRestState'

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
	['phone'] = love.graphics.newImage('graphics/TrapPhone.png'),
	-- paintings and drawings
	['painting1'] = love.graphics.newImage('graphics/Canvas1.png'),
	['painting2'] = love.graphics.newImage('graphics/Canvas2.png'),
	['painting3'] = love.graphics.newImage('graphics/Canvas3.png'),
	['drawings'] = love.graphics.newImage('graphics/drawingssheet.png'),
	-- Mom
	['momlegs'] = love.graphics.newImage('graphics/MomLegSheet.png'),
	['momarms'] = love.graphics.newImage('graphics/MomArms.png'),
	['momleft'] = love.graphics.newImage('graphics/MomGrabLeftSheet.png'),
	['momright'] = love.graphics.newImage('graphics/MomGrabRightSheet.png')
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
	['phone'] = GenerateQuads(gTextures['phone'], 64, 64),
	-- paintings and drawings
	['painting1'] = GenerateQuads(gTextures['painting1'], 192, 192),
	['painting2'] = GenerateQuads(gTextures['painting2'], 192, 192),
	['painting3'] = GenerateQuads(gTextures['painting3'], 256, 192),
	['drawings'] = GenerateQuads(gTextures['drawings'], 64, 64),
	-- Mom
	['momlegs'] = GenerateQuads(gTextures['momlegs'], 256, 400),
	['momarms'] = GenerateQuads(gTextures['momarms'], 256, 400),
	['momleft'] = GenerateQuads(gTextures['momleft'], 256, 400),
	['momright'] = GenerateQuads(gTextures['momright'], 256, 399)

}


gSounds = {
	['music'] = love.audio.newSource('sounds/music.mp3', 'static'),
	['cry'] = love.audio.newSource('sounds/cry.wav', 'static'),
	['choochoo'] = love.audio.newSource('sounds/choochoo.wav', 'static'),
	['blocks'] = love.audio.newSource('sounds/blocks.wav', 'static'),
	['hi'] = love.audio.newSource('sounds/hi.wav', 'static')
}


--moop fonts
gFonts = {
	['small'] = love.graphics.newFont('fonts/font.ttf', 8),
	['medium'] = love.graphics.newFont('fonts/font.ttf', 16),
	['large'] = love.graphics.newFont('fonts/font.ttf', 32),
	['XL'] = love.graphics.newFont('fonts/font.ttf', 40)
}