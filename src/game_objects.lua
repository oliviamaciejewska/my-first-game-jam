--[[
    Day2 - Update 6 - poot 

    Predefining objects here to avoid cluttering and forgetfulness when calling them in
]]

GAME_OBJECT_DEFS = {

    ['toy_blocks'] = {
        type = 'toy_blocks',
        texture = 'toyblocks',
        frame = 1,
        width = 64,
        height = 64,
        -- Stuff to add in later
        solid = true,
        consumable = false,
        breakable = true

    },

    ['toy_truck'] = {
        type = 'toy_truck',
        texture = 'toytruck',
        frame = 1,
        width = 64,
        height = 64,
        solid = true,
        consumable = false,
        breakable = false
    },

    ['baby_bottle'] = {
        type = 'baby_bottle',
        texture = 'baby_bottle',
        frame = 1,
        width = 32,
        height = 32,
        solid = false,
        consumable = true,
        breakable = false

    }
    --[[,

    ['pacifier'] = {
        type = 'pacifier',
        texture = ,
        frame 1,
        width = 32,
        height = 32,
        solid = false,
        consumable = true,
        breakable = false

    }]]
}