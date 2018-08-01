Object = require 'libraries/classic/classic'
Input = require 'libraries/Input'
Timer = require 'libraries/hump/timer'
Moses = require 'libraries/Moses/moses'
--Stage = require 'rooms/Stage'
--CircleRoom = require 'rooms/CircleRoom'

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
    input:bind( "a", "a" )
    input:bind( "b", "b" )
    
    TableExercises()
    
    
    rooms = {}
    currentRoom = nil
    
    --circleRoom = CircleRoom()
end

function love.update( dt )
    timer:update( dt )
    
    --circle.update( dt )
    hyperCircle.update( dt )
    
    if input:pressed( "test" ) then 
        print( "pressed" ) 
        --GotoRoom( 'CircleRoom', 'circleRoom' )    
        GotoRoom( 'RectangleRoom', 'rectangleRoom' )  
    elseif input:pressed( 'a' ) then
        print( 'a' )
        GotoRoom( 'CircleRoom', 'circleRoom' )
    elseif input:pressed( 'b' ) then
        GotoRoom( 'RectangleRoom', 'rectangleRoom' ) 
        print( 'b' )
    end
    
    if currentRoom then currentRoom:update( dt ) end
    
end

function love.draw()
    --love.graphics.draw( image, love.math.random( 800 ), love.math.random( 600 ) )
    --circle:draw()
    hyperCircle:draw()
    
    if currentRoom then currentRoom:draw() end
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

function TableExercises()    
    a = {1, 2, '3', 4, '5', 6, 7, true, 9, 10, 11, a = 1, b = 2, c = 3, {1, 2, 3}}
    b = {1, 1, 3, 4, 5, 6, 7, false}
    c = {'1', '2', '3', 4, 5, 6}
    d = {1, 4, 3, 4, 5, 6}

    Moses.each( a, print )
    
    print( Moses.count( b, 1 ) )
    
    Moses.each( Moses.map( d, function (k,v) return v + 1 end ), print )
    
end

function AddRoom( roomType, roomName, ... )
    local room = _G[ roomType ]( roomName, ... )
    rooms[ roomName ] = room
    return room
end



function GotoRoom( roomType, roomName, ... )
    if currentRoom and rooms[ roomName ] then
        if currentRoom.deactivate then currentRoom:deactivate() end
        currentRoom = rooms[ roomName ]
        if currentRoom.activate then currentRoom:activate() end
    else 
        currentRoom = AddRoom( roomType, roomName, ... )
    end

end




