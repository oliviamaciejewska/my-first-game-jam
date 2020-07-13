--push library
-- https://github.com/Ulydev/push
push = require 'lib/push'

--class library
-- https://github.com/vrld/hump/blob/master/class.lua
Class = require 'lib/class'

--gamestate library
-- https://github.com/vrld/hump/blob/master/gamestate.lua
Gamestate = require 'lib/gamestate'


-- Utility
require 'src/Util'


-- general
require 'src/Animation'
require 'src/Baby'

--gTextures = {}
--gFrames = {}

--gTextures['baby-walk'] = love.graphics.newImage('graphics/babyspritesheet.png')

--Frames['baby-walk'] = GenererateQuads(gTextures['baby-walk'], 64, 96)

--moop attempt to fix
babySheet = love.graphics.newImage('graphics/babyspritesheet.png')
babyQuads = GenerateQuads(babySheet, 64, 96)