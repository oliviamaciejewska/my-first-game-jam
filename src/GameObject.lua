--[[
    Day 2 - poot - Update 4 - Game Object Class, to be called dynamically in playstate for procedural spawning

    - takes in details in gameobject_def class

]]


GameObject = Class{}

function GameObject:init(def, x, y)

   -- self.type = def.type
    self.x = x
    self.y = y
    self.dx = 0
    self.dy = 0
    self.width = width--def.width
    self.height = height
    self.texture = texture
    self.frame = 1

    --[[self.state = self.defaultState
    self.states = def.states

    -- interactable definitions (to define functionality in states)
    self.solid = def.solid
    self.onCollide = def.onCollide
    self.consumable = def.consumable
    self.onConsume = def.onConsume
    self.broken = false
    self.breakable = def.breakable]]

end

function GameObject:update(dt)
    --self.x = self.x + self.dx * dt
end

function GameObject:render()
    love.graphics.draw(toyblocks, toyquads[1--[[self.currentAnimation:getCurrentFrame()]]],
        self.x, self.y,
		0, 1 or -1, 1)
end