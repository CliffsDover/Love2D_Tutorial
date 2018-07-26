Circle = Object:extend()

function Circle:new( _x, _y, _radius )
    x = _x
    y = _y
    radius = _radius
    creationTime = 0
end

function Circle:update( dt )
    
end


function Circle:draw()
    love.graphics.circle( 'fill', x, y, radius )
end
