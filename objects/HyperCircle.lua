HyperCircle = Circle:extend()

function HyperCircle:new( _x, _y, _radius, _lineWidth, _outerRadius )
    HyperCircle.super.new( self, _x, _y, _radius )
    lineWidth = _lineWidth
    outerRadius = _outerRadius

    print( x )
    print( y )
    print( radius )
end

function HyperCircle:update( dt )
    
end


function HyperCircle:draw()
    local prevLineWidth = love.graphics.getLineWidth()
    love.graphics.circle( 'fill', x, y, radius )
    love.graphics.setLineWidth( lineWidth )
    love.graphics.circle( 'line', x, y, outerRadius )
    love.graphics.setLineWidth( prevLineWidth )
end
