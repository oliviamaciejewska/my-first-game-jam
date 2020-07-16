--[[
    Day 6 - score update
    If we implement highscores, will need to change this setup but it works!
]]

GameOverState = Class{__includes = BaseState}

function GameOverState:init()
end

function GameOverState:enter(params)
    self.score = params.score
end

function GameOverState:update(dt)
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('start')
    end
end

function GameOverState:render()
    love.graphics.setFont(gFonts['XL'])
    love.graphics.setColor(0, 0, 0, 255)
    love.graphics.printf('GAME OVER', 0, VIRTUAL_HEIGHT / 3, VIRTUAL_WIDTH, 'center')
    love.graphics.setFont(gFonts['large'])
    love.graphics.printf('Final Score: ' .. tostring(math.floor(self.score)), 0, VIRTUAL_HEIGHT / 2 + 67,
        VIRTUAL_WIDTH, 'center')
    love.graphics.printf('Press Enter to menu, baby', 0, VIRTUAL_HEIGHT - VIRTUAL_HEIGHT / 4,
        VIRTUAL_WIDTH, 'center')
    love.graphics.setColor(255, 255, 255, 255)
    love.graphics.printf('Final Score: ' .. tostring(math.floor(self.score)), 0, VIRTUAL_HEIGHT / 2 + 66,
        VIRTUAL_WIDTH, 'center')
    love.graphics.printf('Press Enter to menu, baby', 0, VIRTUAL_HEIGHT - VIRTUAL_HEIGHT / 4 - 1,
        VIRTUAL_WIDTH, 'center')
end