function love.load()
    mouf = 30
    chomp = -10
    dir = 0
    t = 0
    cycle = .02
    size = 16
    speed = 4
    cell = 40
    locx = 4
    locy = 6

    x = locx * cell + cell / 2
    y = locy * cell + cell / 2

    myRow = 0
    myCol = 0

    love.window.setMode(1024, 768)

    score = 0

    scoreFont = love.graphics.newFont(32)
    love.graphics.setFont(scoreFont)

    map = {
        { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
        { 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0 },
        { 0, 1, -1, -1, -1, 1, -1, -1, -1, 1, -1, -1, -1, 1, 0 },
        { 0, 1, -1, 1, -1, -1, -1, 1, -1, -1, -1, 1, -1, 1, 0 },
        { 0, 1, -1, -1, -1, 1, -1, 1, -1, 1, -1, -1, -1, 1, 0 },
        { 0, 1, 1, -1, 1, 1, -1, 1, -1, 1, 1, -1, 1, 1, 0 },
        { 0, 0, 1, -1, 1, 1, -1, 1, -1, 1, 1, -1, 1, 0, 0 },
        { 0, 0, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, 0, 0 },
        { 0, 0, 1, -1, 1, 1, -1, 1, -1, 1, 1, -1, 1, 0, 0 },
        { 0, 1, 1, -1, 1, 1, -1, 1, -1, 1, 1, -1, 1, 1, 0 },
        { 0, 1, -1, -1, -1, 1, -1, 1, -1, 1, -1, -1, -1, 1, 0 },
        { 0, 1, -1, 1, -1, -1, -1, 1, -1, -1, -1, 1, -1, 1, 0 },
        { 0, 1, -1, -1, -1, 1, -1, -1, -1, 1, -1, -1, -1, 1, 0 },
        { 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0 },
        { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
    }    

end

function love.draw()
    for row = 1,#map do 
        for col = 1,#map[1] do
            here = map[row][col]
            if here == 1 then
                love.graphics.setColor(.0, .0, .1)
                love.graphics.rectangle('fill', col * cell, row * cell, cell, cell)
                love.graphics.setColor(0, 0, .6)
                love.graphics.setLineWidth(2)
                up = map[row-1][col] or 0
                down = map[row+1][col] or 0
                left = map[row][col-1] or 0
                right = map[row][col+1] or 0
                if up < 1 then
                    love.graphics.line(col * cell, row * cell, col * cell + cell, row * cell)
                end
                if down < 1 then
                    love.graphics.line(col * cell, row * cell + cell, col * cell + cell, row * cell + cell)
                end
                if right < 1 then
                    love.graphics.line(col * cell + cell, row * cell, col * cell + cell, row * cell + cell)
                end
                if left < 1 then
                    love.graphics.line(col * cell, row * cell, col * cell, row * cell + cell)
                end
            elseif here == -1 then
                love.graphics.setColor(1,1,1)
                love.graphics.circle('fill', col * cell + cell / 2, row * cell + cell / 2, 4)
            end
        end
    end

    love.graphics.setColor(1, 1, 0)
    love.graphics.circle('fill', x, y, size)
    love.graphics.setColor(0, 0, 0)
    love.graphics.arc('fill', x, y, size + 1, math.rad(dir + mouf), math.rad(dir - mouf))

    love.graphics.setColor(1, .7, .7)
    love.graphics.print('SCORE: ' .. score, 600, 10)
end

function love.update(dt)
    t = t + dt
    if t > cycle then

        if dir == 0 then 
            myRow = math.floor(y / cell)
            myCol = math.floor((x + speed) / cell)
            if map[myRow][myCol + 1] < 1 or x < myCol * cell + cell / 2 then
                x = x + speed
            end
        elseif dir == 90 then 
            myRow = math.floor((y + speed) / cell)
            myCol = math.floor(x / cell)
            if map[myRow + 1][myCol] < 1 or y < myRow * cell + cell / 2 then
                y = y + speed
            end
        elseif dir == 180 then
            myRow = math.floor(y / cell)
            myCol = math.floor((x - speed) / cell)
            if map[myRow][myCol - 1] < 1 or x > myCol * cell + cell / 2 then
                x = x - speed
            end
        elseif dir == 270 then
            myRow = math.floor((y - speed) / cell)
            myCol = math.floor(x / cell)
            if map[myRow - 1][myCol] < 1 or y > myRow * cell + cell / 2 then
                y = y - speed
            end
        end
        if map[myRow][myCol] == -1 then 
            map[myRow][myCol] = 0
            score = score + 10
        end
        if x < -size then x = 800 + size end
        if x > 800 + size then x = -size end
        if y < -size then y = 600 + size end
        if y > 600 + size then y = -size end
        t = t % cycle
        mouf = mouf + chomp
        if mouf == 0 or mouf == 70 then
            chomp = -chomp
        end
    end
end

function love.keypressed(key)
    if key == 'down' then dir = 90
    elseif key == 'up' then dir = 270
    elseif key == 'left' then dir = 180
    elseif key == 'right' then dir = 0
    end
end
