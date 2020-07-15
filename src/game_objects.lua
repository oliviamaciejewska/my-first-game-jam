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

    }
}