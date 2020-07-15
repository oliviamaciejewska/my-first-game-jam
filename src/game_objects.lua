--[[
    Day2 - Update 6 - poot 

    Predefining objects here to avoid cluttering and forgetfulness when calling them in
]]

GAME_OBJECT_DEFS = {

    ['toy_blocks'] = {
        type = 'toy_blocks',
        texture = 'toy-blocks',
        frame = 1,
        width = 64,
        height = 64,
        solid = true,
        consumable = false,
        breakable = true

    },

    ['toy_truck'] = {
        type = 'toy_truck',
        texture = 'toy-truck',
        frame = 1,
        width = 64,
        height = 64,
        solid = true,
        consumable = false,
        breakable = false
    },

    ['baby_bottle'] = {
        type = 'baby_bottle',
        texture = 'baby-bottle',
        frame = 1,
        width = 32,
        height = 32,
        solid = false,
        consumable = true,
        breakable = false

    },

    ['pacifier'] = {
        type = 'pacifier',
        texture = 'pacifier',
        frame = 1,
        width = 32,
        height = 32,
        solid = false,
        consumable = true,
        breakable = false

    }
}