--[[
    Day2 - Update 6 - poot 

    Predefining objects here to avoid cluttering and forgetfulness when calling them in
]]

GAME_OBJECT_DEFS = {

    --[[
        PAIN STUFF
    ]]
    ['toy_blocks'] = {
        type = 'toy_blocks',
        texture = 'toy-blocks',
        frame = 1,
        width = 64,
        height = 64,
        sound = 'blocks',
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


    ['doll'] = {
        type = 'doll',
        texture = 'doll',
        frame = 1,
        width = 64,
        height = 64,
        solid = true,
        consumable = false,
        breakable = false
    },

    ['chef'] = {
        type = 'chef',
        texture = 'chef',
        frame = 1,
        width = 64,
        height = 64,
        solid = true,
        consumable = false,
        breakable = false
    },

    ['train'] = {
        type = 'train',
        texture = 'train',
        frame = 1,
        width = 64,
        height = 64,
        sound = 'choochoo',
        solid = true,
        consumable = false,
        breakable = false
    },

    ['phone'] = {
        type = 'phone',
        texture = 'phone',
        frame = 1,
        width = 64,
        height = 64,
        sound = 'hi',
        solid = true,
        consumable = false,
        breakable = false
    },


    --[[
        HEALZ
    ]]

    ['baby_bottle'] = {
        type = 'baby_bottle',
        texture = 'baby-bottle',
        frame = 1,
        width = 32,
        height = 32,
        sound = 'yay',
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
        sound = 'yay',
        solid = false,
        consumable = true,
        breakable = false

    },

    -- CANVASES / PAINTINGS
    -- will cast canvases to a single sprite sheet and drawings to another once they are actually made...

    ['painting1'] = {
        type = 'painting1',
        texture = 'painting1',
        frame = 1,
        width = 192,
        height = 192,
        solid = false,
        consumable = false
    },

    ['painting2'] ={
        type = 'painting2',
        texture = 'painting2',
        frame = 1,
        width = 64,
        height = 64,
        solid = false,
        consumable = false
    },

    ['painting3'] ={
        type = 'painting3',
        texture = 'painting3',
        frame = 1,
        width = 64,
        height = 64,
        solid = false,
        consumable = false
    },

    ['drawing1'] ={
        type = 'drawing1',
        texture = 'drawing1',
        frame = 1,
        width = 64,
        height = 64,
        solid = false,
        consumable = false
    }
}