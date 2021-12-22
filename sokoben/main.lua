require('levels')

CELL_SIZE = 50
SPEED = 500
local currentLevel = 1

local player = {}

local won = false

function setPosition(o)
    o.screenX = windowX + (o.x - 1) * CELL_SIZE
    o.screenY = windowY + (o.y - 1) * CELL_SIZE
    o.targetX = o.screenX
    o.targetY = o.screenY 
end

function setSize()
    width, height = love.graphics.getDimensions()
    cellWidth, cellHeight = levels[currentLevel].getDimensions()
    mapWidth, mapHeight = (cellWidth * CELL_SIZE), (cellHeight * CELL_SIZE)
    windowX, windowY = (width - mapWidth) / 2, (height - mapHeight) / 2
end

function love.load()
    imageFile = love.graphics.newImage("media/puffy.png")
    block = love.graphics.newImage("media/block.png")
    pop = love.audio.newSource("media/pop.wav", "static")
    pop:setVolume(0.2)
    win = love.audio.newSource("media/win.wav", "static")
    win:setVolume(0.2)

    love.window.setMode(1920, 1080)

    setSize(CELL_SIZE);

    levels[currentLevel].load()


    player.x, player.y = levels[currentLevel].getStart()

    setPosition(player)

    love.graphics.setBackgroundColor(.4, .1, .4)
    love.keyboard.setKeyRepeat( true )
end

function love.update(dt)

    levels[currentLevel].update(dt)

    if (player.targetX > player.screenX) then
        player.screenX = math.min(player.targetX, player.screenX + (SPEED * dt))
    end
    if (player.targetX < player.screenX) then
        player.screenX = math.max(player.targetX, player.screenX - (SPEED * dt))
    end
    if (player.targetY > player.screenY) then
        player.screenY = math.min(player.targetY, player.screenY + (SPEED * dt))
    end
    if (player.targetY < player.screenY) then
        player.screenY = math.max(player.targetY, player.screenY - (SPEED * dt))
    end

    local boxCount = #(levels[currentLevel].getBoxes())
    local wins = 0
    for i, v in ipairs(levels[currentLevel].getBoxes()) do
        if (v.screenX == v.targetX and v.screenY == v.targetY and levels[currentLevel].getCell(v.x, v.y) == 3) then
            wins = wins + 1
        end
    end

    if wins == boxCount then
        love.audio.play(win)

        if currentLevel < #levels then
            currentLevel = currentLevel + 1
            setSize(CELL_SIZE);
            levels[currentLevel].load()
            player.x, player.y = levels[currentLevel].getStart()
            setPosition(player)
        else
            won = true
        end
    end

end

function movePlayer(deltaX, deltaY)

    if (player.targetX ~= player.screenX or player.targetY ~= player.screenY) then return end

    nextX = player.x + deltaX;
    nextY = player.y + deltaY;
    
    local blocked = false

    for i, v in ipairs(levels[currentLevel].getBoxes()) do
        if (nextX == v.x and nextY == v.y) then
            pushedX = nextX + deltaX
            pushedY = nextY + deltaY
            if (levels[currentLevel].getCell(pushedX, pushedY) ~= 1) then

                for a, box in ipairs(levels[currentLevel].getBoxes()) do
                    if (box.x == pushedX and box.y == pushedY) then
                        blocked = true
                    end
                end

                if not blocked then
                    v.x = v.x + deltaX
                    v.y = v.y + deltaY
                    v.targetX = windowX + (v.x - 1) * CELL_SIZE
                    v.targetY = windowY + (v.y - 1) * CELL_SIZE
                end

            else
                blocked = true
            end
        end
    end

    if (not blocked and levels[currentLevel].getCell(nextX, nextY) ~= 1) then
        love.audio.play(pop)
        player.x = player.x + deltaX
        player.y = player.y + deltaY
        player.targetX = windowX + (player.x - 1) * CELL_SIZE
        player.targetY = windowY + (player.y - 1) * CELL_SIZE
    end

end

function love.keypressed(key, scan)

    if not won then
        if key == 'down' or key == 's' then
            movePlayer(0, 1)
        elseif key == 'up' or key == 'w' then
            movePlayer(0, -1)
        elseif key == 'left' or key == 'a' then
            movePlayer(-1, 0)
        elseif key == 'right' or key == 'd' then
            movePlayer(1, 0)
        end
    end
    if key == 'r' then
        levels[currentLevel].load()
        player.x, player.y = levels[currentLevel].getStart()
        setPosition(player)
        won = false
    end
    if key == 'q' then
        love.event.quit()
    end

    if key == '=' then
        CELL_SIZE = CELL_SIZE / .8
        setSize(CELL_SIZE)
        setPosition(player)
        for k, v in ipairs(levels[currentLevel].getBoxes()) do
            setPosition(v)
        end
    end

    if key == '-' then
        CELL_SIZE = CELL_SIZE * .8
        setSize(CELL_SIZE)
        setPosition(player)
        for k, v in ipairs(levels[currentLevel].getBoxes()) do
            setPosition(v)
        end
    end

end

function love.mousemoved( x, y, dx, dy, istouch )
    if (love.mouse.isDown(1)) then
        windowX = windowX + dx
        windowY = windowY + dy
        setPosition(player)
        for k, v in ipairs(levels[currentLevel].getBoxes()) do
            setPosition(v)
        end
    end
end

function love.draw() 

    levels[currentLevel].draw(windowX, windowY, CELL_SIZE)

    love.graphics.setColor(1, .7, .7);

    love.graphics.draw(imageFile, player.screenX, player.screenY, 0, CELL_SIZE / imageFile:getWidth(), CELL_SIZE / imageFile:getHeight())
    
    love.graphics.setNewFont('font/comicz.ttf', 72)
    love.graphics.printf("SOKOBEN!", 0, 10, width, "center")

    love.graphics.setNewFont('font/comicz.ttf', 24)
    love.graphics.printf("Arrow/WASD keys to move, +/- to zoom, Q to quit, click and drag to move the puzzle", 0, 1000, width, "center")

    if (won) then
        love.graphics.setColor(1, .2, .2)
        love.graphics.setNewFont('font/comicz.ttf', 128)
        love.graphics.printf("YOU WON DA GAME!!", 0, 450, width, "center")
    end

end
