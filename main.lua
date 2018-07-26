Object = require 'libraries/classic/classic'
require 'objects/Test'


function love.load()
    if arg[#arg] == "-debug" then require("mobdebug").start() end

    image = love.graphics.newImage( "image.png" )
    testInstance = Test()
    
    local objectFiles = {}
    recursiveEnumerate( 'objects', objectFiles )
    for _, object in ipairs( objectFiles ) do
        print( object )
    end
    requireFiles( objectFiles )
end

function love.update( dt )
    
end

function love.draw()
    love.graphics.draw( image, love.math.random( 800 ), love.math.random( 600 ) )
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


