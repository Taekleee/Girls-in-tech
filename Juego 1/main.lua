-- El jugador parte en el punto 100,100 (esquina superior izquierda)
 function love.load()
    myImage = love.graphics.newImage("fondo.png")
    text = love.graphics.newImage("texto.png")
    text2 = love.graphics.newImage("pollito.png")

    song = love.audio.newSource("música.mp3", "stream")
    love.audio.play(song)
    player = {
        x = 10,
        y = 10,
        size = 25,
        image = love.graphics.newImage("chinchilla.png")
    }


    word_p = {}
    word_p2 = {}
    word_q = {}
    word_q2 = {}

    for i=1,4 do
        table.insert(word_p,
            {
                x = math.random(50, 500),
                y = math.random(50, 450),
                size = 20,
                image = love.graphics.newImage("papá.png")
            }
        )
        table.insert(word_p2,
            {
                x = math.random(50, 500),
                y = math.random(50, 450),
                size = 20,
                image = love.graphics.newImage("pipo.png")
            }
        )
        table.insert(word_q,
            {
                x = math.random(50, 500),
                y = math.random(50, 450),
                size = 20,
                image = love.graphics.newImage("queso.png"),
            }
        )

        table.insert(word_q2,
            {
                x = math.random(50, 500),
                y = math.random(50, 450),
                size = 20,
                image = love.graphics.newImage("queso.png"),
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

     for i,v in ipairs(word_p) do
        if checkCollision(player, v) then
            table.remove(word_p, i)
            player.size = player.size + 1*dt
        end
    end
    for i,v in ipairs(word_p2) do
        if checkCollision(player, v) then
            table.remove(word_p2, i)
            player.size = player.size + 1*dt
        end
    end

    for i,v in ipairs(word_q)  do
        if checkCollision(player, v) then
            love.load()
        end
    end

    for i,v in ipairs(word_q2)  do
        if checkCollision(player, v) then
            love.load()
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
    love.graphics.draw(text, 500, 100)
    love.graphics.draw(text2, 705, 370)


    for i,v in ipairs(word_p) do
        love.graphics.circle("line", v.x, v.y, v.size)
        love.graphics.draw(v.image, v.x, v.y,
            0, 1, 1, v.image:getWidth()/2, v.image:getHeight()/2)
    end
    for i,v in ipairs(word_p2) do
        love.graphics.circle("line", v.x, v.y, v.size)
        love.graphics.draw(v.image, v.x, v.y,
            0, 1, 1, v.image:getWidth()/2, v.image:getHeight()/2)
    end
    for i,v in ipairs(word_q) do
        love.graphics.circle("line", v.x, v.y, v.size)
        love.graphics.draw(v.image, v.x, v.y,
            0, 1, 1, v.image:getWidth()/2, v.image:getHeight()/2)
    end
    for i,v in ipairs(word_q2) do
        love.graphics.circle("line", v.x, v.y, v.size)
        love.graphics.draw(v.image, v.x, v.y,
            0, 1, 1, v.image:getWidth()/2, v.image:getHeight()/2)
    end
end