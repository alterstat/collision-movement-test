function love.load()
        -- Player Variables
    player = {}
    player.x = 400
    player.y = 300
    player.speed = 3
        -- Player 2
    player2 = {}
    player2.x = 300
    player2.y = 400
end
-------------------------
function love.update(dt)
            -- Player 1 Movement --
    -- Right
    if love.keyboard.isDown("right") then
        player.x = player.x + player.speed -- player.speed is how many pixels you move per frame you hold the key
    end
    -- Left
    if love.keyboard.isDown("left") then
        player.x = player.x - player.speed 
    end
    -- Up
    if love.keyboard.isDown("up") then
        player.y = player.y - player.speed
    end
    -- Down
    if love.keyboard.isDown("down") then
        player.y = player.y + player.speed 
    end
        -- Player 2 Movement --
    -- Right
    if love.keyboard.isDown("d") then
        player2.x = player2.x + player.speed -- player.speed is how many pixels you move per frame you hold the key
        
    end
    -- Left
    if love.keyboard.isDown("a") then
        player2.x = player2.x - player.speed 
    end
    -- Up
    if love.keyboard.isDown("w") then
        player2.y = player2.y - player.speed
    end
    -- Down
    if love.keyboard.isDown("s") then
        player2.y = player2.y + player.speed 
    end

    print1 = "X: " .. tostring(math.floor(player.x)) .. " Y: " .. tostring(math.floor(player.y))
    print2 = "X: " .. tostring(math.floor(player2.x)) .. " Y: " .. tostring(math.floor(player2.y))
    changeColor = detectCollision(player.x, player2.x, player.y, player2.y)
end
-------------------------
function love.draw()
    if changeColor then
        love.graphics.setColor(1,0,0,0.5)
    else
        love.graphics.setColor(1,0,0)
    end
    love.graphics.circle("fill", player.x, player.y, 10) -- player
    love.graphics.print(print1, player.x - 40, player.y - 40)

    if changeColor then
        love.graphics.setColor(0,1,0,0.5)
    else
        love.graphics.setColor(0,1,0)
    end
    love.graphics.circle("fill", player2.x, player2.y, 10)
    love.graphics.print(print2, player2.x - 40, player2.y - 40)
end

function detectCollision(x1, x2, y1, y2)
    if math.abs(x1 - x2) < 20 and math.abs(y1 - y2) < 20 then
        return true
    else
        return false
    end
end