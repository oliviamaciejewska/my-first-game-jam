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

    ['painting11'] = {
        type = 'painting11',
        texture = 'painting1',
        frame = 2,
        width = 192,
        height = 192,
        solid = false,
        consumable = false
    },

    ['painting12'] = {
        type = 'painting12',
        texture = 'painting1',
        frame = 3,
        width = 192,
        height = 192,
        solid = false,
        consumable = false
    },

    ['painting13'] = {
        type = 'painting13',
        texture = 'painting1',
        frame = 4,
        width = 192,
        height = 192,
        solid = false,
        consumable = false
    },

    ['painting21'] ={
        type = 'painting21',
        texture = 'painting2',
        frame = 2,
        width = 192,
        height = 192,
        solid = false,
        consumable = false
    },

    ['painting22'] ={
        type = 'painting22',
        texture = 'painting2',
        frame = 3,
        width = 192,
        height = 192,
        solid = false,
        consumable = false
    },

    ['painting23'] ={
        type = 'painting23',
        texture = 'painting2',
        frame = 4,
        width = 192,
        height = 192,
        solid = false,
        consumable = false
    },

    ['painting31'] ={
        type = 'painting31',
        texture = 'painting3',
        frame = 2,
        width = 256,
        height = 192,
        solid = false,
        consumable = false
    },

    ['painting32'] ={
        type = 'painting32',
        texture = 'painting3',
        frame = 3,
        width = 256,
        height = 192,
        solid = false,
        consumable = false
    },

    ['painting33'] ={
        type = 'painting33',
        texture = 'painting3',
        frame = 4,
        width = 256,
        height = 192,
        solid = false,
        consumable = false
    },

    ['drawing1'] ={
        type = 'drawing1',
        texture = 'drawings',
        frame = 1,
        width = 64,
        height = 64,
        solid = false,
        consumable = false
    },

    ['drawing2'] ={
        type = 'drawing2',
        texture = 'drawings',
        frame = 2,
        width = 64,
        height = 64,
        solid = false,
        consumable = false
    },

    ['drawing3'] ={
        type = 'drawing3',
        texture = 'drawings',
        frame = 3,
        width = 64,
        height = 64,
        solid = false,
        consumable = false
    },

    ['drawing4'] ={
        type = 'drawing4',
        texture = 'drawings',
        frame = 4,
        width = 64,
        height = 64,
        solid = false,
        consumable = false
    },
}