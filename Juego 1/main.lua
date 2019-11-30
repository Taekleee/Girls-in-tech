-- El jugador parte en el punto 100,100 (esquina superior izquierda)
 function love.load()
    myImage = love.graphics.newImage("fondo.png")
    song = love.audio.newSource("música.mp3", "stream")
    love.audio.play(song)
    player = {
        x = 100,
        y = 100,
        size = 25,
        image = love.graphics.newImage("chinchilla.png")
    }


    coins = {}

    for i=1,25 do
        table.insert(coins,
            {
                -- Give it a random position with math.random
                x = math.random(50, 650),
                y = math.random(50, 450),
                size = 25,
                image = love.graphics.newImage("papá.png")
            }
        )
    end
end

function love.update(dt)
    -- Movimiento a la derecha e izquierda
    if love.keyboard.isDown("left") then
        player.x = player.x - 200 * dt
    elseif love.keyboard.isDown("right") then
        player.x = player.x + 200 * dt
    end

    -- Movimiento hacia arriba y abajo
    if love.keyboard.isDown("up") then
        player.y = player.y - 200 * dt
    elseif love.keyboard.isDown("down") then
        player.y = player.y + 200 * dt
    end

     for i,v in ipairs(coins) do
        if checkCollision(player, v) then
            table.remove(coins, i)
            player.size = player.size + 1*dt
        end
    end
end


function checkCollision(p1, p2) 
    -- Calcula la distancia entre el jugador y las palabras.
    local distance = math.sqrt((p1.x - p2.x)^2 + (p1.y - p2.y)^2)
    return distance < p1.size + p2.size
end


function love.draw()
    love.graphics.draw(myImage)
    love.graphics.draw(player.image, player.x, player.y,player.size)

    for i,v in ipairs(coins) do
        love.graphics.circle("line", v.x, v.y, v.size)
        love.graphics.draw(v.image, v.x, v.y,
            0, 1, 1, v.image:getWidth()/2, v.image:getHeight()/2)
    end
end