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
    self.frame = def.frame
    self.rendered = false

    -- interactable definitions (to define functionality in states)
    self.solid = def.solid
    self.consumable = def.consumable

    self.sound = def.sound or 'cry'

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
    love.graphics.draw(gTextures[self.texture], gFrames[self.texture][self.frame],
        self.x, self.y,
		0, 1 or -1, 1)
end