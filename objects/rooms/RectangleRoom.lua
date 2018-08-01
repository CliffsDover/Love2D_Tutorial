require 'libraries/engine/Stage'

RectangleRoom = Stage:extend()

function RectangleRoom:new()

end



function RectangleRoom:update( dt )
end



function RectangleRoom:draw()
    love.graphics.clear( 0, 0, 0, 1 )
    love.graphics.rectangle( 'fill', 300, 300, 64, 64 )
end
