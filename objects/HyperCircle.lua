HyperCircle = Circle:extend()

function HyperCircle:new( _x, _y, _radius, _lineWidth, _outerRadius )
    HyperCircle.super.new( self, _x, _y, _radius )
    self.lineWidth = _lineWidth
    self.outerRadius = _outerRadius

    print( x )
    print( y )
    print( radius )
end

function HyperCircle:update( dt )
    
end


function HyperCircle:draw()
    local prevLineWidth = love.graphics.getLineWidth()
    love.graphics.circle( 'fill', self.x, self.y, self.radius )
    love.graphics.setLineWidth( self.lineWidth )
    love.graphics.circle( 'line', self.x, self.y, self.outerRadius )
    love.graphics.setLineWidth( prevLineWidth )
end
