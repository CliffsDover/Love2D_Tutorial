require 'libraries/engine/Stage'

CircleRoom = Stage:extend()

function CircleRoom:new()

end



function CircleRoom:update( dt )
end



function CircleRoom:draw()
    love.graphics.clear( 0, 0, 0, 1 )
    love.graphics.circle( 'line', 100, 100, 30 )
end
