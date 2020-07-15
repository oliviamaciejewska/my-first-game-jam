--[[
    Day 2 - poot - Update 4 - Game Object Class, to be called dynamically in playstate for procedural spawning

    - takes in details in gameobject_def class

]]


GameObject = Class{}

function GameObject:init(def, y, dx)

   -- self.type = def.type
    self.x = VIRTUAL_WIDTH
    self.y = y
    self.dx = dx 
    self.dy = 0
    self.width = def.width
    self.height = def.height
    self.texture = def.texture
    self.frame = 1
    self.rendered = false

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
    --self.dx = self.dx + OBJECT_ACCEL * dt
    if self.x > -self.width then
        self.x = self.x - self.dx * dt - ((OBJECT_ACCEL * dt * dt) / 2)
    else
        self.remove = true
    end
end

function GameObject:render()
    love.graphics.draw(gTextures[self.texture], gFrames[self.texture][1--[[self.currentAnimation:getCurrentFrame()]]],
        self.x, self.y,
		0, 1 or -1, 1)
end