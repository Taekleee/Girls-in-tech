function love.load()
    song = love.audio.newSource("ricardomilos.mp3","stream")
    love.audio.play(song)
    Object = require "classic"
    fondo = love.graphics.newImage("fondo.png")
    image = love.graphics.newImage("suma.png")
    require "player"
    require "enemy"
    require "bullet"
    require "enemy1"
    require "enemy2"
    player = Player()
    enemy = Enemy()
    enemy1 = Enemy1()
    enemy2 = Enemy2()
    listOfBullets = {}
end

function love.update(dt)
    player:update(dt)
    enemy:update(dt)
    enemy1:update(dt)
    enemy2:update(dt)
    for i,v in ipairs(listOfBullets) do
        v:update(dt)
        v:checkCollision(enemy)
        if v.dead then
            --Remove it from the list
            table.remove(listOfBullets, i)
        end
    end
end

function love.draw()
    red = 27/255
    green = 135/255
    blue = 36/255
    color = { red, green, blue}
    love.graphics.setBackgroundColor( color)
    love.graphics.draw(image,50,150)
    player:draw()
    enemy:draw()
    enemy1:draw()
    enemy2:draw()
    for i,v in ipairs(listOfBullets) do
        v:draw()
        
    end
end

function love.keypressed(key)
    player:keyPressed(key)
end
