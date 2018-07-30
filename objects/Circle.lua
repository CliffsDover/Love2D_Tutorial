Circle = Object:extend()

function Circle:new( _x, _y, _radius )
    self.x = _x
    self.y = _y
    self.radius = _radius
    self.creationTime = 0
end

function Circle:update( dt )
    
end


function Circle:draw()
    love.graphics.circle( 'fill', self.x, self.y, self.radius )
end
