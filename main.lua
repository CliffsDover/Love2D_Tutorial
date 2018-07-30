Object = require 'libraries/classic/classic'
Input = require 'libraries/Input'
Timer = require 'libraries/hump/timer'

function love.load()
    if arg[#arg] == "-debug" then require("mobdebug").start() end

    --image = love.graphics.newImage( "image.png" )
    timer = Timer()
    
    local objectFiles = {}
    recursiveEnumerate( 'objects', objectFiles )
    for _, object in ipairs( objectFiles ) do
        print( object )
    end
    requireFiles( objectFiles )
    
    testInstance = Test()
    circle = Circle( 400, 300, 50 )
    --circle = {rad = 10, pos = {x = 400, y = 300}}
    hyperCircle = HyperCircle( 400, 300, 50, 10, 120 )
    
    timer:after( 5, function()  print("fire 1")  end )
    timer:every( 1, function()  print("fire 2")  end )
    timer:tween( 6, hyperCircle, { radius = 96 }, 'in-out-cubic' )
    timer:tween( 3, hyperCircle, { outerRadius = 256 }, 'in-out-cubic' )
    
    
    input = Input()
    input:bind( "mouse1", "test" )
end

function love.update( dt )
    timer:update( dt )
    
    --circle.update( dt )
    hyperCircle.update( dt )
    
    if input:pressed( "test" ) then print( "pressed" ) end
    
    
end

function love.draw()
    --love.graphics.draw( image, love.math.random( 800 ), love.math.random( 600 ) )
    --circle:draw()
    hyperCircle:draw()
end

function recursiveEnumerate( folder, fileList )
    local items = love.filesystem.getDirectoryItems( folder )
    for _, item in ipairs( items ) do
        
        local file = folder..'/'..item
        
        local info = love.filesystem.getInfo( file )
        
        if info[ "type" ] == 'file' then
            table.insert( fileList, file )
        end
        
        if info[ "type" ] == 'directory' then
            recursiveEnumerate( file, fileList )
        end
        
    end
end

function requireFiles( files )
    for _, file in ipairs( files ) do
        local file = file:sub( 1, -5 )
        print( file )
        require( file )
    end
end

function love.keypressed( key, scancode, isrepeat )
    print( "[love.keypressed] " .. key )
end

function love.keyreleased( key )
    print( "[love.keyreleased] " .. key )
end

function love.mousepressed( x, y, button, isTouch )
    print( "[love.mousepressed] " .. x .. " " .. y .. " " .. button )
end

function love.mousereleased( x, y, button, isTouch )
    print( "[love.mousereleased] " .. x .. " " .. y .. " " .. button )
end



