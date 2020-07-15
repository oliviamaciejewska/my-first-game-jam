StartState = Class{__includes = BaseState}



function StartState:update(dt)
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('play')
    end
end

function StartState:render()

	love.graphics.setFont(gFonts['XL'])
	love.graphics.setColor(0, 0, 0, 255)
	love.graphics.printf('Dia(per Change) Hard 3: A Xmas Movie', 0, VIRTUAL_HEIGHT / 4, VIRTUAL_WIDTH, 'center')
	
	love.graphics.setFont(gFonts['large'])
	love.graphics.setColor(0, 0, 0, 255)
	love.graphics.printf('Press Enter to Play', 0, VIRTUAL_HEIGHT / 2 + 17, VIRTUAL_WIDTH, 'center')
	love.graphics.printf('Press W and S to move', 0, VIRTUAL_HEIGHT / 2 + 67, VIRTUAL_WIDTH, 'center')
	love.graphics.setColor(255, 255, 255, 255)
	love.graphics.printf('Press Enter to Play', 0, VIRTUAL_HEIGHT / 2  + 16, VIRTUAL_WIDTH, 'center')

end


